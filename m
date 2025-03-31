Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A205A77032
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 23:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F7910E056;
	Mon, 31 Mar 2025 21:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DTn/ZqPd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF2C10E056
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 21:38:52 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-39c0dfba946so1879671f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 14:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743457131; x=1744061931; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ox74jAlQCOXUz9R47Wh4BN9DQoXSv8br0RYQThLQg4w=;
 b=DTn/ZqPdo3d7ZVWwBKAR+WdXucBE2bLVGxz80fxb9nHxABYoaRDRi3N4apNQl21Q2T
 JWh0r6Vvyq3e69yz2O2Tg7HFkQLZzZOSjUMb8R2l6sDGZSG6ydq0dXNbNfuRBLiuuhVb
 g8JvuzbVTt2QVSSLjqvqPcyNnfulGgvKwoVJke/r1F/+8Q3bhgC22T0BFjsNPEHe8gmf
 P5y0wntEWAekgFq/P1Hm7xiAKiX+dkwlmrlttLgXIerEvdSgYsSwEziayqhSdCntN4ZR
 mZ6F6/OXGM5G8oEykWa99qCZqfvyldE312QO8OLkTq1k9rrhVAKUKyc7RHdMMqCZwRLW
 1DVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743457131; x=1744061931;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ox74jAlQCOXUz9R47Wh4BN9DQoXSv8br0RYQThLQg4w=;
 b=a2UKVVtqe16KxNTomzrkJ1KCXea7oeAl0A3R6tSuQuaLmYbhn1zp754RNjNN5dCL/T
 TIKyJyVL+KBzkQUgJSkuQMPSH2DN5wcmIxA2p4s4L5iTolaYTCuteY5X4hcDZsZKDtRa
 0PWH4YDswCOZMcDBg3LymPB7qQCdLkBtK7c+rrUaSHIfA3LtGcaOhY+Ln1SdvjEqIkH/
 kmHruaojhD8PGUpIeDOVniy/bY43CZWaSw9QjAOyV7xye4gImhBVUcv2n42nqIVcIh8t
 TwYV2Yzp1lZPAAgmZmxWnnGtdwUYRLkYMW2ijz93P3MdP9A/xdFhhHxaDy7FnkC1XU0P
 J3Pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJHD9VOZPt0JrvSXR5Pr9CjbFImQtHYEoKu6ooipnjEewAfRXyrPtLqfcAStQSKmJ2aEchYntVaFM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRzJg4f1JnwTkTkF5qdNrghU7Jw2c0yDSid/HlENvBEfWIhcpY
 2jqtG/eVpkpiX44ekvgMpywOjVu8wEp4MLGxmOUwg+T0HWMLgkL90pDclMpXan4qq9xz3NU3bQR
 5aTr0GT0ymcGed8LAfFbDEkixOh2PnjjRPaicPw==
X-Gm-Gg: ASbGncuht/sSUrDa6syl3RZ5EiyT9ouCK/P6V3gLYGV6/B6QVwTFg23amWJOHAkwYui
 6qSqfP1XRweDmirIujiHi/AwUYYm8MY4/Mtlo0hyrbzI+g5J3d2cmTJT24hgCecaiAhUhrFTPr1
 fmZC4L0q+IGZkNTFJEQEcXGO2bHe08
X-Google-Smtp-Source: AGHT+IE9oFoESW7P/0RYmFnE3L5hny15XPQW5TDUPiB2qjZZuZ02OIP9kzJqXS2Yd3vzhwo/5IhHu5gYhTl4DRehvks=
X-Received: by 2002:a05:6000:420a:b0:391:3998:2660 with SMTP id
 ffacd0b85a97d-39c120cb8aemr7727506f8f.7.1743457130570; Mon, 31 Mar 2025
 14:38:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250327-wip-obbardc-qcom-t14s-oled-panel-v3-0-45d5f2747398@linaro.org>
 <20250327-wip-obbardc-qcom-t14s-oled-panel-v3-1-45d5f2747398@linaro.org>
 <Z-pJP4PMwPo3L3Og@hovoldconsulting.com>
 <CACr-zFA_oSySRnA2VaSQk2ND_AHeyt3v=RuPTbABPM7SYown6g@mail.gmail.com>
 <b4983b93-97fc-43ed-a41c-a44f90773062@oss.qualcomm.com>
In-Reply-To: <b4983b93-97fc-43ed-a41c-a44f90773062@oss.qualcomm.com>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Mon, 31 Mar 2025 23:38:39 +0200
X-Gm-Features: AQ5f1JqS7_0iOlATZpsQl1aZ_ovAj_zC9EkVcEt6c_OLO56CTepuvb55ZRJsI1s
Message-ID: <CACr-zFDDPfRXZYUsbMoBASU6O5mBmqiFNFBtZTL9_vbo_7uANg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: x1e78100-t14s: add hpd gpio to
 eDP panel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Johan Hovold <johan@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org, 
 "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On Mon, 31 Mar 2025 at 17:49, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On 31/03/2025 18:39, Christopher Obbard wrote:
> > Hi Johan,
> >
> > On Mon, 31 Mar 2025 at 09:50, Johan Hovold <johan@kernel.org> wrote:
> >>
> >> On Thu, Mar 27, 2025 at 04:56:53PM +0000, Christopher Obbard wrote:
> >>> The eDP panel has an HPD GPIO. Describe it in the device tree
> >>> for the generic T14s model, as the HPD GPIO property is used in
> >>> both the OLED and LCD models which inherit this device tree.
> >>
> >> AFAICT, this patch is not correct as the hotplug detect signal is
> >> connected directly to the display controller on (these) Qualcomm SoCs
> >> and is already handled by its driver.
> >>
> >> Describing it as you do here leads to less accurate delays, see commits:
> >>
> >>          2327b13d6c47 ("drm/panel-edp: Take advantage of wait_hpd_asserted() in struct drm_dp_aux").
> >>          3b5765df375c ("drm/panel: atna33xc20: Take advantage of wait_hpd_asserted() in struct drm_dp_aux")
> >>
> >> Perhaps you lose some other functionality too.
> >>
> >>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >>> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> >>> ---
> >>>   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 11 +++++++++++
> >>>   1 file changed, 11 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> >>> index 962fb050c55c4fd33f480a21a8c47a484d0c82b8..46c73f5c039ed982b553636cf8c4237a20ba7687 100644
> >>> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> >>> @@ -980,8 +980,12 @@ &mdss_dp3 {
> >>>        aux-bus {
> >>>                panel: panel {
> >>>                        compatible = "edp-panel";
> >>> +                     hpd-gpios = <&tlmm 119 GPIO_ACTIVE_HIGH>;
> >>>                        power-supply = <&vreg_edp_3p3>;
> >>>
> >>> +                     pinctrl-0 = <&edp_hpd_n_default>;
> >>> +                     pinctrl-names = "default";
> >>> +
> >>>                        port {
> >>>                                edp_panel_in: endpoint {
> >>>                                        remote-endpoint = <&mdss_dp3_out>;
> >>> @@ -1286,6 +1290,13 @@ hall_int_n_default: hall-int-n-state {
> >>>                bias-disable;
> >>>        };
> >>>
> >>> +     edp_hpd_n_default: edp-hpd-n-state {
> >>> +             pins = "gpio119";
> >>> +             function = "gpio";
> >>> +             drive-strength = <2>;
> >>> +             bias-pull-up;
> >>> +     };
> >>
> >> I checked the firmware configuration for this pin on my T14s, which
> >> does not match what you have here. Instead the function is set to
> >> "edp0_hot" which forwards the signal to the display controller which
> >> already handles the signal on panel power on. (And there is also no
> >> internal pull up enabled).
> >>
> >> We may want to describe this pin configuration somewhere, but that's a
> >> separate issue.
> >
> > Thanks for your review, I will send another version in coming days and
> > drop this first patch (adding hpd to the T14s DTSI).
> >
> > As a consequence I will need to add no-hpd property to the panel node.
> No, you won't. There is a HPD line and it is routed to the DP controller.

OK, I think I misunderstand what Johan said. After taking some time to
think about it in more detail:
- The first commit will be changed so that the hpd GPIO will be added
to the X1E DP controller instead of the panel. grepping the source for
dp_hot_plug_det shows me how to do that. This part is clear.

- The panel node in the generic T14s DTSI should not have the
hpd-gpios property / pinctrl set.

- The panel node should not have the hpd-gpios property / pinctrl set.

I hope I understand that correctly. I will send a new series in the
morning unless there is any objection.

Thanks

Chris
