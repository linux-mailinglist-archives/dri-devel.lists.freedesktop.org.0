Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 520DD65EE72
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 15:12:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E9410E73A;
	Thu,  5 Jan 2023 14:12:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C87310E73A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 14:12:07 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 i17-20020a05600c355100b003d99434b1cfso1409813wmq.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 06:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/1Sw99W6AD4VBBtNM6/KnSxgPA1tuM9aVniZbjeLNUQ=;
 b=dndeRrTz+wqs8In2KApAdlet27T+y1cxMYoI4Bo+6D0fSn8oPeh9mZIfRF1sL9KmG4
 MaVCMwTg3T0rP8LeRIn1Z0lXHWB4m4LKZ5ev5OMBRgpVTVzJgjVTsmNHVLj+5/uFEfL/
 yTI+S3Nv0iAGMW3BYwDaTFY0l9tMsQXTZNvnd6ZoONumeV859H+sqF9NEcVLj5E8BlDH
 BBiaOhIlFgdsWzBIMyDNwvcd6WLvtEa6b3rdEbM8jOFIr1mNpyKAYCv3wCuueasG9k1k
 7adtp5bOfUKZKUkG2/PsPUFg0LAmVA1yRVqRNXwPdTrEPLEEB0fgFBtXt4pfWQ69dQ6y
 +JrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/1Sw99W6AD4VBBtNM6/KnSxgPA1tuM9aVniZbjeLNUQ=;
 b=QmcegOqL7m2F472mA5xgdjoyzVYYFf2/XI7vyE0HNtFaN4gT+qIGkG5Po1ngj+/5ep
 v+ZKBzqoLx4Dh1AUMMT8UGq3WznDlPYeRVbgNufrAPfziTQo/4lp6vRugV9CucXAUSp8
 6euzO93lRncOYomtoyUVfO448m7+sFava7X18VQ/P2Yajfn+ikNJlkDLDpgtiX7VYywf
 BzTYCL80J4JOixYllR7fl1iL20Q07LGG9GtYLFbnQpdevn3gX2+VMSETOnYfCDIZDr/E
 A9mVAArPYS8F2rOc5tc682tsA46O420xW5htO5E9hWaioVJA3/612TIw73tOd310LUYn
 mALw==
X-Gm-Message-State: AFqh2krOb9yCmUHIspb8+f2XfWoXUjpZkuBJLAF8+2z9s14wRB3FpWK5
 dlyv9ok6cVv+fx7XDW7PYVRjKA==
X-Google-Smtp-Source: AMrXdXtk3+2kUAUc9npvsbsWnPLk3CUPQAucwULlpN9hXbjbabnKvCpzfBOXp5cMfL13XUcPcOA85g==
X-Received: by 2002:a05:600c:246:b0:3d3:3deb:d91f with SMTP id
 6-20020a05600c024600b003d33debd91fmr38985696wmj.5.1672927925529; 
 Thu, 05 Jan 2023 06:12:05 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 d17-20020adffd91000000b002882600e8a0sm22250322wrr.12.2023.01.05.06.12.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 06:12:05 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Tomi Valkeinen <tomba@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
References: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 0/7] drm/bridge_connector: perform HPD enablement
 automatically
Message-Id: <167292792435.748499.5644887130722114887.b4-ty@linaro.org>
Date: Thu, 05 Jan 2023 15:12:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.1
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 02 Nov 2022 21:06:58 +0300, Dmitry Baryshkov wrote:
> From all the drivers using drm_bridge_connector only iMX/dcss and OMAP
> DRM driver do a proper work of calling
> drm_bridge_connector_en/disable_hpd() in right places. Rather than
> teaching each and every driver how to properly handle
> drm_bridge_connector's HPD, make that automatic.
> 
> Add two additional drm_connector helper funcs: enable_hpd() and
> disable_hpd(). Make drm_kms_helper_poll_* functions call them (as this
> is the time where the drm_bridge_connector's functions are called by the
> drivers too).
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/7] drm/poll-helper: merge drm_kms_helper_poll_disable() and _fini()
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=78b991ccfa64a438e2d8c2997d22d55621ab277d
[2/7] drm/probe-helper: enable and disable HPD on connectors
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=c8268795c9a9cc7be50f78d4502fad83a2a4f8df
[3/7] drm/bridge_connector: rely on drm_kms_helper_poll_* for HPD enablement
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=92d755d8f13b6791c72d4e980c09f054d8175c94
[4/7] drm/imx/dcss: stop using drm_bridge_connector_en/disable_hpd()
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=60c376e4549b6844af94cf319960ef48080230a8
[5/7] drm/msm/hdmi: stop using drm_bridge_connector_en/disable_hpd()
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=9e954403bc9cc024cf052e9429c0e6db86ffe0f7
[6/7] drm/omap: stop using drm_bridge_connector_en/disable_hpd()
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=c4f5538fa65dd093b71859c4792afd4e13fae5f1
[7/7] drm/bridge_connector: drop drm_bridge_connector_en/disable_hpd()
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=4c00ac500d0edd1a6730c4e8293834a694c1b304

-- 
Neil
