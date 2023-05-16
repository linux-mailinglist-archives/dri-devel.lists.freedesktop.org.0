Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B197047B9
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 10:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524EE10E325;
	Tue, 16 May 2023 08:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995F010E324
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 08:25:29 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-30639daee76so8955394f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 01:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684225528; x=1686817528;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AEHq4uf+3svOh2D6WOkj9m9HzrghkGExgYoXPhK5Ua8=;
 b=rjMLOJ0tPgSjlAEj9jp5RzpEXpZLlb8LAC+cVFtAsCg/LkCjWdjdZdxQ3h+h2DvGju
 lZKgayvWyzOPXpppl4Kas3hreyHLHcZjgrdy6f0P6PyDQ1MNXMIopuixLiZOp5Q59Q/O
 jM/B3tBtQArURowHYX9oC/tKd7JbgWstcv7J2507HGEmmY1JHfOgtSExatryH58a4qoi
 HzxcsxZEPQSinBXRNkaxSYUt56td21QlYNZL/g1uotEbp4p9CTjH3a0AMwJniz2rajmC
 pc5ti//Z2Vs/GVLdDboh2ip8g+inakT7Jt6Q7p0+fc6Pvc1BHcaS9gLyMoFroH5e6GyL
 1M6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684225528; x=1686817528;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AEHq4uf+3svOh2D6WOkj9m9HzrghkGExgYoXPhK5Ua8=;
 b=Q+/TiEuA8pXj6jAAUK/IQE9vQDPRY7JUyf2Rwqz0DhLlXv+Vqwl3VdzUSUXR1XwwYL
 r45PkCrF02ihM+lUXSPPcLwuiwnu9csAcMlFB+4SebI5l4eGO/NrrRvnceKLZnKJxu23
 du3ZJLrni3893uwy2kYRlHAiSxr3Cl9uR+e7hKxyl2GZTChr8UVjwIufoVltbQ+Eqe68
 hs3pOukOtfv3oZrhLNIYyuzApsRaSQdpqDHcD5X1JW2phlLsLwRudFtlr9e/z0M3PlNc
 mMK95lkW/w59zNbilNfgGDOXJy9LHNfGHIeFZaKGIP3v5tzBJjoPkXRmSG3MiRwGD0dC
 EjsA==
X-Gm-Message-State: AC+VfDxToIols0OZ8bYlhJHMVSs0CuJnCX2FoZhCUFBv6gnqnzK6R7VO
 ohkgoQ66duiNNWp6J0GZd2k2FA==
X-Google-Smtp-Source: ACHHUZ6B+surVC4xL16y7czkG/1us80y98HY9it8a0hLJBdVC+P+tF7o3qpa6eUkcv1lgq+qmUBFiA==
X-Received: by 2002:a05:6000:1813:b0:2f7:80d9:bb2f with SMTP id
 m19-20020a056000181300b002f780d9bb2fmr25959439wrh.22.1684225528009; 
 Tue, 16 May 2023 01:25:28 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 r14-20020a5d494e000000b003063a92bbf5sm1727505wrs.70.2023.05.16.01.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 May 2023 01:25:27 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 dri-devel@lists.freedesktop.org, Francesco Dolcini <francesco@dolcini.it>
In-Reply-To: <20230515184408.9421-1-francesco@dolcini.it>
References: <20230515184408.9421-1-francesco@dolcini.it>
Subject: Re: [PATCH v1] drm/bridge: tc358768: remove unneeded semicolon
Message-Id: <168422552722.63953.3468930623030924435.b4-ty@linaro.org>
Date: Tue, 16 May 2023 10:25:27 +0200
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
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 15 May 2023 20:44:08 +0200, Francesco Dolcini wrote:
> Remove unneeded stray semicolon.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/bridge: tc358768: remove unneeded semicolon
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=81d6b37b69b8b5d1a4c81d2e208b41888d4283df

-- 
Neil

