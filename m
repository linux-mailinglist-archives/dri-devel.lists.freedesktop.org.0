Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4B8702D1C
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 14:53:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 534CF10E1C7;
	Mon, 15 May 2023 12:53:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7120810E1B7
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 12:53:03 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3078aa0b152so6697964f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 05:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684155179; x=1686747179;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t0kKvU8VcjZDCawm1uzpgifPJsmcOM7ycSUxGftpKlg=;
 b=kQQkiCuyGeHXbQ20FCvkY01rdbA3aktukV5cOjcESX8wfW/rZ9oJjouqt5mIKEhqsI
 PJV3ds2mEk2TUyI7S7xOG+4APL9bxRIQGGDfOGHCLXx/wbQf0HbDlF4S51t0R8rChBKH
 d9m6yO0N+aWBZYSJAaCBUHqxbji+yORNy6AVsQtBcQpb+YkgtPu2jfzEWkUOw2bUgvcH
 tc+1OBd1m8fNLUxTv9Hddv/qCLeu3pccjYlVoWzSnTAexzFijNJoVYW7XikJU+pQFyvj
 GAkyslBQvJrnQrtJNWwZOusXwsr4qvsZjC3TYxdXi/XFnD4nCcxvchRnqQeamGQFp3Oz
 HO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684155179; x=1686747179;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t0kKvU8VcjZDCawm1uzpgifPJsmcOM7ycSUxGftpKlg=;
 b=boaTXeu1mvF9M83PdLa6H5mo58AdowG30UM00awQMdLLoB5yfobVH9WUwURQqpsb0v
 ugKe8FwvlBqK53QWst5WxfFJqK6ORx81mZGA3U8XYJBtjiIjp0lBr4y4WxNIDOmGlChY
 pjiEuFiQ0YgsqfUXNrURZW/qlyQ3GXuA4Vh2cC+L4KSGlKa5Zn6cCRruD58RCAkQ2xYd
 NyQ3mKCSetDpA/v35xfv24n81Q1mJnnUoq+IpxnxbzqgNAd6iBaint15RfS9I43DGd3A
 tzdZoznUzXS1dYhuZ6wr2xjIEfqpKgrd+IfYtrzYV4d7k3SzrxvSpG5RHIffLljdAWNi
 lxyg==
X-Gm-Message-State: AC+VfDwIZ0tkAheLAT/pEMSJWksMQDkxWoOxoC2ozOJxFHc5P3xoTUJy
 FN2+Qk6CCWhoZexLRH88ew5vFg==
X-Google-Smtp-Source: ACHHUZ4pr0OZs/JDMmps+IUMP9qKK49qZJW95shiWiZOKkfFhc5PHKAymSNXqXTfWXrzamNqen0KYQ==
X-Received: by 2002:a05:6000:1b8f:b0:306:2b31:5935 with SMTP id
 r15-20020a0560001b8f00b003062b315935mr19376409wru.55.1684155179018; 
 Mon, 15 May 2023 05:52:59 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a5d6650000000b003062c0ef959sm32197342wrw.69.2023.05.15.05.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 05:52:58 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: sam@ravnborg.org, airlied@gmail.com, daniel@ffwll.ch, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 dri-devel@lists.freedesktop.org, Shuijing Li <shuijing.li@mediatek.com>
In-Reply-To: <20230515094955.15982-1-shuijing.li@mediatek.com>
References: <20230515094955.15982-1-shuijing.li@mediatek.com>
Subject: Re: [PATCH v4 0/2] Reduce lcm_reset to DSI LP11 send cmd time
Message-Id: <168415517821.3264861.11690266641021902230.b4-ty@linaro.org>
Date: Mon, 15 May 2023 14:52:58 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, jitao.shi@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 15 May 2023 17:49:53 +0800, Shuijing Li wrote:
> The panel spec stipulates that after lcm_reset is pulled high, cmd
> should be sent to initialize the panel. Within the allowable range of
> the DSI spec, this time needs to be reduced to avoid panel exceptions.
> 
> Base on the branch of linus/master v6.3.
> 
> Change since v3:
> 1. Rebase.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/2] drm/panel: boe-tv101wum-nl6: Remove extra delay
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=fe7f4e8d496552f880d7368b482d2ccac33780b7
[2/2] drm/panel: boe-tv101wum-nl6: Fine tune the panel power sequence
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=812562b8d881ce6d33fed8052b3a10b718430fb5

-- 
Neil

