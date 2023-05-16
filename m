Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 274807047B6
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 10:25:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA2310E322;
	Tue, 16 May 2023 08:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB0910E322
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 08:25:27 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3075e802738so12654779f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 01:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684225525; x=1686817525;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t0kKvU8VcjZDCawm1uzpgifPJsmcOM7ycSUxGftpKlg=;
 b=U9snYiuAjXyog/pObORtqBLp74KZGAJqnQBHSstncHnnEKbrGJKl08+B+62YqdBMKN
 0ubaX4H7k5IGggRg57I4qwEJQwS2vhLyOJ2FnayJLRqEVWPsSJp/24NNlIFP8qPs7NsU
 JcJEl8IXtyJLkfAMrMq8ri8qucR710Ewj8Oe8SiXX4nIZOTcFwWrU4uJP3WGI2FyNUzC
 6VryLEOtlCz19nQo6UmOQr60v1Z338VVzph+Q3ovng2XtdKn+qd1W5YAKREewjjOgEU7
 Xg2vwuL+B7zoCEsbjgr1uZdcbc7l6pQUy7gZh+UnVGh9TxnDbnSEb5ovDJKDAUOMIR0D
 em7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684225525; x=1686817525;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t0kKvU8VcjZDCawm1uzpgifPJsmcOM7ycSUxGftpKlg=;
 b=XJTIhpLrarIkbdaLkyhVak5dL3TNJ0LUzIyr0ix/ldfptQIrdb5MJc2aZzjfMp8Ejl
 8dv13ZnO8fBOOWleYNf6KWfgSKVB/GvWoEdZ7k30DIPoHb0bjPJbIafk05PGF9rD9xKj
 UqBZNC7qZePVeex7c3AJbX/GtBuwGtHMOjb+fUINAzRsAh/3OCRwUO2ivytG3a67ZPSw
 vhDtk3xnc/3kUOAnbCWsn2i97aWxjuiaP//OVmKjwnZhQat9CUx4l4TizD66yQt/K08E
 p5fCzrbnV/8Pr4UCETlyiRaMyWo7QbSRalwads9mEh229wx6qp7nsBK/CCvrLr30lHlR
 nTUw==
X-Gm-Message-State: AC+VfDy0A1jtrAMmyAnaSsK0LxGaIxDj+9fqkHsaOe1x9OJQAS9ENblQ
 JaWxzFPbjLZI0SJJl3xwUtDCLQ==
X-Google-Smtp-Source: ACHHUZ45Ql6xlhC/ZvqBRbGxOQz1rTz/nyVnET70PNRzfh6zOHMn4ARYGPyEwcNil7BmrD1rfXVBww==
X-Received: by 2002:adf:fe0e:0:b0:306:2f91:302e with SMTP id
 n14-20020adffe0e000000b003062f91302emr30760857wrr.21.1684225525080; 
 Tue, 16 May 2023 01:25:25 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 r14-20020a5d494e000000b003063a92bbf5sm1727505wrs.70.2023.05.16.01.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 May 2023 01:25:24 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: sam@ravnborg.org, airlied@gmail.com, daniel@ffwll.ch, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 dri-devel@lists.freedesktop.org, Shuijing Li <shuijing.li@mediatek.com>
In-Reply-To: <20230515094955.15982-1-shuijing.li@mediatek.com>
References: <20230515094955.15982-1-shuijing.li@mediatek.com>
Subject: Re: [PATCH v4 0/2] Reduce lcm_reset to DSI LP11 send cmd time
Message-Id: <168422552431.63953.12117354484480390668.b4-ty@linaro.org>
Date: Tue, 16 May 2023 10:25:24 +0200
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

