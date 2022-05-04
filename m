Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B29A0519970
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 10:15:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A42C10E9B4;
	Wed,  4 May 2022 08:15:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C6C10E9B4
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 08:15:54 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 p7-20020a05600c358700b00393e80c59daso2250814wmq.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 01:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BMywFm11EqXrNibAu4d/EqrOPzgyY5HVKqDpJGYDDAw=;
 b=JJpNffMdp6cZOgwoTGlGNfpKXrWcn5bJmphCVqZUDcQo0lT77JrqBF63FlnfdsNZ9O
 Kh+kDmaOSXGYRkV5NuMqK+ErTbIoiGsah0O6CO+PiVUOWxbSKxUM6q9SrPXGuqFScuqu
 JRUxcLCbDylDoYs2OuGB7ZPIppkR3sxXgvgHdhecI2tTN5wnsUiOllm/l86oTl/jjmd6
 8s82e2zvkDciA5ee01pNZ9uvZ+k1Ns363+CwnZt24nMHmYGpEiYmDqUreE5BwSnZbLXP
 tgr9PVxUXHCjQJjkVpY/XBjeRZDlWmlC1FdZZhFv14HPK59kItx7pYqeqQX4AA0+tlNF
 hIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BMywFm11EqXrNibAu4d/EqrOPzgyY5HVKqDpJGYDDAw=;
 b=mLJwvwlVSAPhg6FIew7W8ZvJPwYmxACnwtG8RRJboJ6Djeal5x2cgmp6nTCnQpWyN3
 8m1ZStlzjQImn7sOMDB7XMSYS3U/4NOj+DQ13/UN3YlXtb578Jqw9lsela+RcAQP/rLM
 9rzcZD7IgUuYYWWvMvotCquwUdAaTnFTUcUSJLJXi4vvyi9+ochlmmdEW5ckOfek0MJe
 U5wapv823hW7TLBYqsDLrvVcO7Xb02PNrOsh9LfYgtNbTByVKtV6pQ/GHK4UHmx/SkWx
 BSt+lctzVo5w6y2NjGUGSDnrSLqRmW9wKyJ+iJeW5qRMRyVXikOvUU+lae6yq6cDAXAR
 qE8g==
X-Gm-Message-State: AOAM532TMBStrbvNYrCAGVAGRU9bgxuYm9cfHQH+PESrkALxLUz3Wv7u
 G0Zh7GPe0TN7u6HBL+hE+HWQ0g==
X-Google-Smtp-Source: ABdhPJxyhGdJO+eCQccjPUIqEqeae3i1YpwaQD3fzOb/wa/UMN9kNcDyP0A74Hztgg1arLFiXMo0Vw==
X-Received: by 2002:a05:600c:3792:b0:394:5fa4:f2a4 with SMTP id
 o18-20020a05600c379200b003945fa4f2a4mr494108wmr.33.1651652153094; 
 Wed, 04 May 2022 01:15:53 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:4b7d:bde6:bf9b:6cf2])
 by smtp.gmail.com with ESMTPSA id
 e8-20020adfa748000000b0020c5253d914sm11161866wrd.96.2022.05.04.01.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 01:15:52 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Fabien Parent <fparent@baylibre.com>,
 Hermes Wu <hermes.wu@ite.com.tw>, Allen Chen <allen.chen@ite.com.tw>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH] drm/bridge: ite-it6505: add missing Kconfig option select
Date: Wed,  4 May 2022 10:15:50 +0200
Message-Id: <165165213702.1111026.16077727887449605674.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426141536.274727-1-fparent@baylibre.com>
References: <20220426141536.274727-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 26 Apr 2022 16:15:36 +0200, Fabien Parent wrote:
> The IT6505 is using functions provided by the DRM_DP_HELPER driver.
> In order to avoid having the bridge enabled but the helper disabled,
> let's add a select in order to be sure that the DP helper functions are
> always available.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/1] drm/bridge: ite-it6505: add missing Kconfig option select
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=841e512ffb64898db6322c0619f6bbc41266d86f

-- 
Neil
