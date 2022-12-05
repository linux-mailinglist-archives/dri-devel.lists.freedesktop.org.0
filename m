Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B716436E6
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 22:31:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B945510E2AC;
	Mon,  5 Dec 2022 21:31:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F0710E2B0
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 21:31:36 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id q7so15043627ljp.9
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Dec 2022 13:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=C0rUlmndO2E/ya7/W2kNaF30jIqqkFDuo9iv4n+68BI=;
 b=RxW2LPMU84D6KH3cYi8+xDXXAUGR5abv2zu/JtpTveZ6kiEd59T6hWVKRKEixh5oMX
 h3B0AxoWd7g+i5qimYNmIlxmq97nFV5TeWR6e7PmRte5CqOHs7I1ve8DeLy7c2SjVoBr
 sE5KVPeWjkInZUmVJ+Y5RgYS69G/MD7jLL6pXp1v7Slox6HlGAd7h2Xc1ENSAvU0AG7q
 4/wb92gupoivat/bvPTrgPbRIyp2LKVEsCtcO0UF9XTDESN4QjJzS/oKtupCwP2waZjJ
 U3PrHLeeom++gFwllis8I+HXWOVX94tJoOxWzMPRo6J/ZABBcSCc2hhjA3YyuAy7yn1h
 9nuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C0rUlmndO2E/ya7/W2kNaF30jIqqkFDuo9iv4n+68BI=;
 b=pDSXNO8zXmLrE0ZVTLkiUiyGEXKHAvJqQxa898cvfsvcxyEtJnEDUcayXHZOV90jek
 YCMRzkJH9CBn/4E3WxApwmhH+5tCBgM86dIwaCDoN1ouLhL8PDtXmsYYtf5RkJ38G95F
 9Npv6vBIQVJfU5GmEgBVNPwjDAkpm+RbEYXAlzyl8Njy9c8/8uj8woIRfXMYKPV9s1lV
 NtbKvmb/PKlhrpPiKzZvi+2Xp6DIAFfYFDjUbWNqsGez0yGRPaij8NnjF32M5xw2LnW5
 peC0eDWiTCpNy1VKYQc5XjiDEW7vjXchw76Iiy7ONY9tQO9NoDHs3wrRKgDHff0cwpAn
 nBgQ==
X-Gm-Message-State: ANoB5pnqUTXniWYrDFyKJL2Xbq0I/GjGMFTnwBEVp83/ZLNvS3zhrIk8
 5rWCiFMppjFHsyToLCqt/KYD6bwrHSyOEQ3j
X-Google-Smtp-Source: AA0mqf74e5llFLxTAdly9h6nWapciB9LzijySzvHt6CzTwc3zWYkG3jyEhKRZ/k5Hg3v3CcngE9pkg==
X-Received: by 2002:a2e:b55a:0:b0:27a:2d4:b641 with SMTP id
 a26-20020a2eb55a000000b0027a02d4b641mr1422327ljn.129.1670275894453; 
 Mon, 05 Dec 2022 13:31:34 -0800 (PST)
Received: from [127.0.0.1] ([94.25.229.129]) by smtp.gmail.com with ESMTPSA id
 a27-20020ac2505b000000b004a44ffb1023sm2237293lfm.57.2022.12.05.13.31.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Dec 2022 13:31:34 -0800 (PST)
Date: Tue, 06 Dec 2022 00:29:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH v4 08/13] drm/msm/dp: Implement hpd_notify()
User-Agent: K-9 Mail for Android
In-Reply-To: <20221205174433.16847-9-quic_bjorande@quicinc.com>
References: <20221205174433.16847-1-quic_bjorande@quicinc.com>
 <20221205174433.16847-9-quic_bjorande@quicinc.com>
Message-ID: <4E586110-168A-4D47-966F-357DF042AFC7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5 December 2022 20:44:28 GMT+03:00, Bjorn Andersson <quic_bjorande@quic=
inc=2Ecom> wrote:
>From: Bjorn Andersson <bjorn=2Eandersson@linaro=2Eorg>
>
>The DisplayPort controller's hot-plug mechanism is based on pinmuxing a
>physical signal on a GPIO pin into the controller=2E This is not always
>possible, either because there aren't dedicated GPIOs available or
>because the hot-plug signal is a virtual notification, in cases such as
>USB Type-C=2E
>
>For these cases, by implementing the hpd_notify() callback for the
>DisplayPort controller's drm_bridge, a downstream drm_bridge
>(next_bridge) can be used to track and signal the connection status
>changes=2E
>
>This makes it possible to use downstream drm_bridges such as
>display-connector or any virtual mechanism, as long as they are
>implemented as a drm_bridge=2E
>
>Signed-off-by: Bjorn Andersson <bjorn=2Eandersson@linaro=2Eorg>
>[bjorn: Drop connector->fwnode assignment and dev from struct msm_dp]
>Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc=2Ecom>

Reviewed-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>

Minor nit: if for the next revision you reorder the patches to have hpd_en=
able first, then missing conditions, then this patch, it will look more log=
ical=2E

>---
>
>Changes since v3:
>- None
>
> drivers/gpu/drm/msm/dp/dp_display=2Ec | 22 ++++++++++++++++++++++
> drivers/gpu/drm/msm/dp/dp_drm=2Ec     |  1 +
> drivers/gpu/drm/msm/dp/dp_drm=2Eh     |  2 ++
> 3 files changed, 25 insertions(+)
>
>diff --git a/drivers/gpu/drm/msm/dp/dp_display=2Ec b/drivers/gpu/drm/msm/=
dp/dp_display=2Ec
>index 666b45c8ab80=2E=2E17fcf8cd84cd 100644
>--- a/drivers/gpu/drm/msm/dp/dp_display=2Ec
>+++ b/drivers/gpu/drm/msm/dp/dp_display=2Ec
>@@ -1772,3 +1772,25 @@ void dp_bridge_mode_set(struct drm_bridge *drm_bri=
dge,
> 	dp_display->dp_mode=2Eh_active_low =3D
> 		!!(dp_display->dp_mode=2Edrm_mode=2Eflags & DRM_MODE_FLAG_NHSYNC);
> }
>+
>+void dp_bridge_hpd_notify(struct drm_bridge *bridge,
>+			  enum drm_connector_status status)
>+{
>+	struct msm_dp_bridge *dp_bridge =3D to_dp_bridge(bridge);
>+	struct msm_dp *dp_display =3D dp_bridge->dp_display;
>+	struct dp_display_private *dp =3D container_of(dp_display, struct dp_di=
splay_private, dp_display);
>+
>+	/* Without next_bridge interrupts are handled by the DP core directly *=
/
>+	if (!dp_display->next_bridge)
>+		return;
>+
>+	if (!dp->core_initialized) {
>+		drm_dbg_dp(dp->drm_dev, "not initialized\n");
>+		return;
>+	}
>+
>+	if (!dp_display->is_connected && status =3D=3D connector_status_connect=
ed)
>+		dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
>+	else if (dp_display->is_connected && status =3D=3D connector_status_dis=
connected)
>+		dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
>+}
>diff --git a/drivers/gpu/drm/msm/dp/dp_drm=2Ec b/drivers/gpu/drm/msm/dp/d=
p_drm=2Ec
>index 6db82f9b03af=2E=2E3898366ebd5e 100644
>--- a/drivers/gpu/drm/msm/dp/dp_drm=2Ec
>+++ b/drivers/gpu/drm/msm/dp/dp_drm=2Ec
>@@ -102,6 +102,7 @@ static const struct drm_bridge_funcs dp_bridge_ops =
=3D {
> 	=2Eget_modes    =3D dp_bridge_get_modes,
> 	=2Edetect       =3D dp_bridge_detect,
> 	=2Eatomic_check =3D dp_bridge_atomic_check,
>+	=2Ehpd_notify   =3D dp_bridge_hpd_notify,
> };
>=20
> struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_=
device *dev,
>diff --git a/drivers/gpu/drm/msm/dp/dp_drm=2Eh b/drivers/gpu/drm/msm/dp/d=
p_drm=2Eh
>index 82035dbb0578=2E=2E79e6b2cf2d25 100644
>--- a/drivers/gpu/drm/msm/dp/dp_drm=2Eh
>+++ b/drivers/gpu/drm/msm/dp/dp_drm=2Eh
>@@ -32,5 +32,7 @@ enum drm_mode_status dp_bridge_mode_valid(struct drm_br=
idge *bridge,
> void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
> 			const struct drm_display_mode *mode,
> 			const struct drm_display_mode *adjusted_mode);
>+void dp_bridge_hpd_notify(struct drm_bridge *bridge,
>+			  enum drm_connector_status status);
>=20
> #endif /* _DP_DRM_H_ */

--=20
With best wishes
Dmitry
