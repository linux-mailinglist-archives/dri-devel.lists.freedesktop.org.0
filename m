Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4BF64364B
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 22:02:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68C710E299;
	Mon,  5 Dec 2022 21:02:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 095C210E299
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 21:02:07 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id a7so14944140ljq.12
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Dec 2022 13:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=oHs+FqdUXZ8dY/1UdxeesnQgdtIGHLBMYAul3CErIMw=;
 b=oo/3QD3RnOsB//i0LeWi6f6xfNMxY4CIVu6ymNCgcGX2szuQj5mK3IKlg43DG4CGAG
 +m1cE1p1YACPkg553lAIpp2JKY6g0ovpeGNg2jVVWd8/48ab1FbctWf2ZfjxtJgLgP2r
 ebGYj1hy/Uz12mNeHAUnwPzyctKuwkFFobCvL6mW3oMDzf/DUW9Vptlm8f0CTsguxFlT
 9S0b0tieMW04bK25zhYN5vj6k5eeWvb/pWD+BhakFa5w887cHFOL+/8qh46VneOG3sU0
 0KrETIj/yJ+fVav/i5C43uaP8sM8sHhfiSNwNydhpHdwM1O3Nh/8nv+lDsxHhiVHZW2z
 PNjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oHs+FqdUXZ8dY/1UdxeesnQgdtIGHLBMYAul3CErIMw=;
 b=kFvNgjP6qzG3Mu5jSLMKOz8Bd7D1qMHukSImfZdGAuK2zcEbrG8pZQJCR7nDgkBQp3
 StVHQx0lE/5ZJ3jA2cR6caR2GBEvxjeRznP2riqMH1UXye10jE0jKiHEIcmTK63mYUr9
 3dV2ACFt/yIEfgABcs2Dloba3KRx2HtVFu8oSMJYe7MAvceGh5XG6jBbzLM/rxtKSqdG
 MnvxDLcV9zgKBSKp0lTgACLrDoE9oB/FvI6HokMbpjsgcrsZYuc00IE3e86LvXRhvQwM
 +T0b/n+3YwFO4gtHu3MKk1yiPQZIlEaN2JrdAg1azF8ZowdAaesP+VyPrDIH0KNq24vL
 rucQ==
X-Gm-Message-State: ANoB5pnq6T/ao/0FplRh/jN0IF1IEVVwbag2eawbfzRazd2atrAMVJBI
 K4OGcQG/S6wmMCwwxedR7ow58A==
X-Google-Smtp-Source: AA0mqf7b8AihvPHnHW9Fpk0XOGRCY4PnhRVvSAU8ZHOm+17Io0XAUyzYe1yURuzbjdyF40G3jN+d1w==
X-Received: by 2002:a2e:2d01:0:b0:278:ebb5:ddd2 with SMTP id
 t1-20020a2e2d01000000b00278ebb5ddd2mr25350274ljt.494.1670274125389; 
 Mon, 05 Dec 2022 13:02:05 -0800 (PST)
Received: from [127.0.0.1] ([94.25.229.129]) by smtp.gmail.com with ESMTPSA id
 z15-20020a0565120c0f00b004b56de48f05sm733929lfu.27.2022.12.05.13.02.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Dec 2022 13:02:04 -0800 (PST)
Date: Tue, 06 Dec 2022 00:02:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH v4 08/13] drm/msm/dp: Implement hpd_notify()
User-Agent: K-9 Mail for Android
In-Reply-To: <20221205174433.16847-9-quic_bjorande@quicinc.com>
References: <20221205174433.16847-1-quic_bjorande@quicinc.com>
 <20221205174433.16847-9-quic_bjorande@quicinc.com>
Message-ID: <0C21338C-EC82-4A57-949F-6EE8044BBFFD@linaro.org>
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

Can we use hpd_notify in all the cases by dropping the corresponding piece=
 of code from the core driver?=20


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
