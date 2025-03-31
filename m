Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CB5A76AC2
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 17:39:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3591C10E13A;
	Mon, 31 Mar 2025 15:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="b3NDwSdw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95FA10E13A
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 15:39:48 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so52272305e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 08:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743435587; x=1744040387; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1sNg10NoCtirreV3RmWGt7kQXy82wXq+5oOziEES3k4=;
 b=b3NDwSdwXlKgoUvc6HdnBF/P5Y0dsrernAfGVrcJtg5piRrQMsjP8BHnByHYdCfO6T
 diKuzCsuYOP09ujQHLKpjWEvLbTjvbMGSMJdamLE/BbsXeFKW3Azc69E6XKXKT+0xKfv
 V6UEcKh7++viWv47+WKL5RnOsX/d7m4uXNkmA7fBQdSkR7p+ETcPgK8x17IkFNdLiZKW
 G4q9/VBSvPgRUMXEBXjgi/txpRxU+knwdE0EH78/g+nSwdoF6LUB91R8BU3SDN/wB+iq
 uWNHocINif9D/AoQOSsqj3VqXFnnVFbpBDC02XWmJMPVF1FF3dvT3c+4k5uDMrM3C0c/
 bPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743435587; x=1744040387;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1sNg10NoCtirreV3RmWGt7kQXy82wXq+5oOziEES3k4=;
 b=GNM6Z+/BIPavwi9YWQGxWy+m8JdtgnqDMH3g1uLcqt7InnpXRYyKiXmrWujeYWjFe9
 zv1Q9GzbHDK+aWxwQZDhSdnHfwBS5kBNmzgzJvfHCHm5tpn/a9aALY05v+kRTkvpJyWD
 F1wVCL0+PGv67JfD/YBsmRyCBpx7BfeoJIs0wzpq3D/cAA540TcCugI8YGAaIknOJsE9
 R+b2OVLFjjVIqOxt/5GLOHmkosaxpzs+HZdNCswnOriYaFz2M1HvupRwUdTVuovJMLXI
 xuwWuZ7CQX/zKc31e1gpGLwEGATuy8KyPV3RLrH5ExEtAy5r9RYRR/HVr5EbGbpz0c2q
 5MvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUS2HZHiOxQHkh1SNKLcvIDuFczpwAqV5/n2OJXbD1U45KJ1RMP4I842JtX3u81fbr6d03FG0rizHA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzgo2EnV0Yrwu5Skwj/f9HVR+HkUqigNDuSeVDA/YUO8c7mHzbu
 8nfRfBeVhS5/J9k/dk0+h/2Q+baYq8ckiqigkceKFW+ioTwDuhI6q4peqYuLOfJtxGPjma6gFfQ
 6ITtn9AUHgaFJW+MQNYgBJpsRoLo4vABcEV3L6w==
X-Gm-Gg: ASbGncvim5AKE7Tv7BnLDcz3c4TV2gtZm2Gj9LRdoqEYiGkYEyZR/n+XZSwPXwUxdKh
 siw9Mxg+qclaa4tUH/ySmnJbT9ucLAuF5xtX3n0DIE7HN9EsLZHXBLqNy9fwPT3G0XICofxLYDF
 08uyZE//lxOIAlwRvaMJFrNRFU972a
X-Google-Smtp-Source: AGHT+IFq8kefn/iwjp3s9ms0HQTK+BhHSf0ZsbQcmKw5Vm41+dOdUlPBBEt/0fVmInccDrEv7cwRoXPu9DZcYcXNgvM=
X-Received: by 2002:a05:600c:3485:b0:43d:2230:300f with SMTP id
 5b1f17b1804b1-43dabe237f8mr100927755e9.0.1743435586577; Mon, 31 Mar 2025
 08:39:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250327-wip-obbardc-qcom-t14s-oled-panel-v3-0-45d5f2747398@linaro.org>
 <20250327-wip-obbardc-qcom-t14s-oled-panel-v3-1-45d5f2747398@linaro.org>
 <Z-pJP4PMwPo3L3Og@hovoldconsulting.com>
In-Reply-To: <Z-pJP4PMwPo3L3Og@hovoldconsulting.com>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Mon, 31 Mar 2025 17:39:35 +0200
X-Gm-Features: AQ5f1JoEit7j_TzMlyZa7QbfN6E0NDm9GuAOKbUqEfVJoM1pbPZfw3UrD5vfGmY
Message-ID: <CACr-zFA_oSySRnA2VaSQk2ND_AHeyt3v=RuPTbABPM7SYown6g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: x1e78100-t14s: add hpd gpio to
 eDP panel
To: Johan Hovold <johan@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>,
 devicetree@vger.kernel.org, 
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

Hi Johan,

On Mon, 31 Mar 2025 at 09:50, Johan Hovold <johan@kernel.org> wrote:
>
> On Thu, Mar 27, 2025 at 04:56:53PM +0000, Christopher Obbard wrote:
> > The eDP panel has an HPD GPIO. Describe it in the device tree
> > for the generic T14s model, as the HPD GPIO property is used in
> > both the OLED and LCD models which inherit this device tree.
>
> AFAICT, this patch is not correct as the hotplug detect signal is
> connected directly to the display controller on (these) Qualcomm SoCs
> and is already handled by its driver.
>
> Describing it as you do here leads to less accurate delays, see commits:
>
>         2327b13d6c47 ("drm/panel-edp: Take advantage of wait_hpd_asserted() in struct drm_dp_aux").
>         3b5765df375c ("drm/panel: atna33xc20: Take advantage of wait_hpd_asserted() in struct drm_dp_aux")
>
> Perhaps you lose some other functionality too.
>
> > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> > index 962fb050c55c4fd33f480a21a8c47a484d0c82b8..46c73f5c039ed982b553636cf8c4237a20ba7687 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> > @@ -980,8 +980,12 @@ &mdss_dp3 {
> >       aux-bus {
> >               panel: panel {
> >                       compatible = "edp-panel";
> > +                     hpd-gpios = <&tlmm 119 GPIO_ACTIVE_HIGH>;
> >                       power-supply = <&vreg_edp_3p3>;
> >
> > +                     pinctrl-0 = <&edp_hpd_n_default>;
> > +                     pinctrl-names = "default";
> > +
> >                       port {
> >                               edp_panel_in: endpoint {
> >                                       remote-endpoint = <&mdss_dp3_out>;
> > @@ -1286,6 +1290,13 @@ hall_int_n_default: hall-int-n-state {
> >               bias-disable;
> >       };
> >
> > +     edp_hpd_n_default: edp-hpd-n-state {
> > +             pins = "gpio119";
> > +             function = "gpio";
> > +             drive-strength = <2>;
> > +             bias-pull-up;
> > +     };
>
> I checked the firmware configuration for this pin on my T14s, which
> does not match what you have here. Instead the function is set to
> "edp0_hot" which forwards the signal to the display controller which
> already handles the signal on panel power on. (And there is also no
> internal pull up enabled).
>
> We may want to describe this pin configuration somewhere, but that's a
> separate issue.

Thanks for your review, I will send another version in coming days and
drop this first patch (adding hpd to the T14s DTSI).

As a consequence I will need to add no-hpd property to the panel node.
I will add a short comment about how the hpd signal is handled by the
driver already.

Thanks!

Chris
