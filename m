Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0FC7DB5F9
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 10:17:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F5610E253;
	Mon, 30 Oct 2023 09:17:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C8C10E253
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 09:17:00 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-d8a000f6a51so3421225276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 02:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698657419; x=1699262219; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mr/FHzokc9n1TPuAhp7akRblNKnfq2GX5dSdtsjKfKE=;
 b=cO3nqrIH8tFRuv7ZoMgru9Eg2u5PRXGT/do8M3E5EQo3IHb5be9mkQMYZX1sxJD46l
 Gigt0xHuW0vi27YFrbA3gUQESdVUKlKZyC4kaCHHTQ/KmXXKQUg0Ru/dfrNO0mzn8E2+
 rlcfM073P98tNfsPhxSdNXx8XQrDzaT6iZenk3yasjD0KFC78MT5U9r/lVxrCdwtbu4d
 LDZVXzlIcO2Tix0qMX4eRfRB+MOO+AI3cwfwmsMhWr+JxrxVTb58bBnK59RnNAufMn/d
 +TdmyADFQaLPRlX43krKTT4tjo0e3VbEMhnSEootgP4bZ7bvuCnjPiT8l6y1j+P0MLGs
 ZRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698657419; x=1699262219;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mr/FHzokc9n1TPuAhp7akRblNKnfq2GX5dSdtsjKfKE=;
 b=mQIjmEeS12WlZ/7lCGffgBG+EjRKWoUMyu+HEH+a7Wm87dUgrBMLvVeX7OIjARd3P1
 4SeK09Ja7aYCss/yBekk1BdhAvflJM08RM4ujrSIMVp8h0DdxqSHbaPCWcRKkJiKk9vS
 YIDKLFlP0h7GccEqVAtd0BxIFX8duJuY+PNsq7wBZ1ytzOithRD/JUgGg9VUUqNqxa2M
 OY33FC2ROTZazkweSqWYBsLTFmgw+79dnHU6XkEvslTE+dXq7lHEIppNuRPPkqnlWJGG
 p6QTMLzVsnrxXSpCBkBmHz/M5/NNENylWVe1n//v51VjPNULCKAS+LRecuBR0BpYZBFN
 WW/w==
X-Gm-Message-State: AOJu0YywaBwz4cECEXhLdHyezSjJ/UxJxfoYnIm/Bef9r6nHaoHlJ7Uf
 HAD3047kl/Xo+lJXbYs2A9f6ko3HYieJ1Ce0yCtktg==
X-Google-Smtp-Source: AGHT+IF8OUqQ/miefVyh/iIuR6Gb2gxF6tC2w4n0ty2Q82u6LrIRgu1R9h5Xzk6si2BQeJ6KtVDcIhlSK/sUNu0hZ0c=
X-Received: by 2002:a25:b08a:0:b0:da0:58da:2709 with SMTP id
 f10-20020a25b08a000000b00da058da2709mr7289610ybj.58.1698657419215; Mon, 30
 Oct 2023 02:16:59 -0700 (PDT)
MIME-Version: 1.0
References: <20231029194607.379459-1-suijingfeng@loongson.cn>
 <20231029194607.379459-4-suijingfeng@loongson.cn>
 <CAA8EJpoWXtmMt9vpG9Q4dpv6HnMjtdmEo6rbBszXNG30NhbB1A@mail.gmail.com>
 <ea335f64-16cc-47aa-b523-0aae6f64e223@loongson.cn>
In-Reply-To: <ea335f64-16cc-47aa-b523-0aae6f64e223@loongson.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 30 Oct 2023 11:16:47 +0200
Message-ID: <CAA8EJppYWO6O_xYt1WoRa_eoZ04wFdq39f-tvKj0R5BKnbFRkA@mail.gmail.com>
Subject: Re: [PATCH 3/8] drm/loongson: Allow attach drm bridge driver by
 calling lsdc_output_init()
To: Sui Jingfeng <suijingfeng@loongson.cn>
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 30 Oct 2023 at 06:13, Sui Jingfeng <suijingfeng@loongson.cn> wrote:
>
> Hi,
>
>
> On 2023/10/30 07:10, Dmitry Baryshkov wrote:
> >> +
> >> +/* Built-in HDMI encoder funcs on display pipe 0 */
> >> +
> >> +static void lsdc_pipe0_hdmi_encoder_reset(struct drm_encoder *encoder)
> >> +{
> >> +       struct drm_device *ddev = encoder->dev;
> >> +       struct lsdc_device *ldev = to_lsdc(ddev);
> >> +       u32 val;
> >> +
> >> +       val = PHY_CLOCK_POL | PHY_CLOCK_EN | PHY_DATA_EN;
> >> +       lsdc_wreg32(ldev, LSDC_CRTC0_DVO_CONF_REG, val);
> >> +
> >> +       /* Using built-in GPIO emulated I2C instead of the hardware I2C */
> >> +       lsdc_ureg32_clr(ldev, LSDC_HDMI0_INTF_CTRL_REG, HW_I2C_EN);
> >> +
> >> +       /* Help the HDMI phy get out of reset state */
> >> +       lsdc_wreg32(ldev, LSDC_HDMI0_PHY_CTRL_REG, HDMI_PHY_RESET_N);
> >> +
> >> +       drm_dbg(ddev, "%s reset\n", encoder->name);
> >> +
> >> +       mdelay(20);
> >> +}
> >> +
> >> +const struct drm_encoder_funcs lsdc_pipe0_hdmi_encoder_funcs = {
> >> +       .reset = lsdc_pipe0_hdmi_encoder_reset,
> >> +       .destroy = drm_encoder_cleanup,
> >> +};
> >> +
> >> +/* Built-in HDMI encoder funcs on display pipe 1 */
> > All pipe 1 code looks like a pipe0, just the registers were changed.
> > Could you please refactor that to use a single instance of all
> > functions and pass pipe id through the data struct?
> > Then you can use macros to determine whether to use pipe 0 or pipe 1 register.
> >
>
> Yes, you are right. But please allow me to explain something.
>
> In the past, Thomas told me to untangle it, despite this idea lead to duplicated code(or pattern).
> but at the long run, this pay off.
>
> Because the method of passing pipe id will introduce the "if and else" side effects.
> But my functions have no if and else.
>
>
> ```
> if (pipe == 0) {
>      ...
> } else if (pipe == 1) {
>      ...
> }
> ```

I was thinking about something easier:

static void lsdc_pipe_hdmi_encoder_reset(struct drm_encoder *encoder)
{
   ....
   lsdc_wreg32(ldev, LSDC_CRTCn_DVO_CONF_REG(ldev->pipe_id), val);
   ...
};

So, no ifs, just define per-pipe registers.


>
> Using the C program language's Macro(#define XXX) to generate code is not fun to me.
> Because every time you want to change it, It needs my brains to thinking it twice. Maybe
> more than twice.
>
> 1) It needs my brains to replace the macros manually each time I saw the code.
>
> 2) When I want to change(alter) the prototype, I need to worry about all of the instances.
>     sometimes it is not symmetry. The DVO port and HDMI phy itself is symmetry, but the
>     external display bridge connected with them are not symmetry. So, there are some registers
>     located at the domain of this display controller side should change according to the
>     different type of external display bridge.
>
> 3) Code duplication is actually less harmful than unmaintainable.
>     macros are abstract, as noob level programmer, we completely drop the idea of abstract.
>     Bad abstract means design failure, this is what we are most afraid of.
>     Generally, we would like divide the whole into small cases, handle them one by one.
>     It is actually to review and understand.

Code duplication is both harmful and unmaintainable. It is _very_hard_
to spot the difference between pipe0 and pipe1. And it is _very_easy_
to patch just one instance of these functions leaving the issue in the
second one. So, I'd say, all the c&p functions are a no-go.

>
> 4) From the viewpoint of the hardware, the display output hardware suffer from changes.
>     Because users always want *new* display interface. The need of the users are also varies.
>     Personally, I think macros are best for the symmetry case, while the output part of a
>     display pipe always suffer from change.
>
> >> +
> >> +static void lsdc_pipe1_hdmi_encoder_reset(struct drm_encoder *encoder)
> >> +{
> >> +       struct drm_device *ddev = encoder->dev;
> >> +       struct lsdc_device *ldev = to_lsdc(ddev);
> >> +       u32 val;
> >> +
> >> +       val = PHY_CLOCK_POL | PHY_CLOCK_EN | PHY_DATA_EN;
> >> +       lsdc_wreg32(ldev, LSDC_CRTC1_DVO_CONF_REG, val);
> >> +
> >> +       /* Using built-in GPIO emulated I2C instead of the hardware I2C */
> >> +       lsdc_ureg32_clr(ldev, LSDC_HDMI1_INTF_CTRL_REG, HW_I2C_EN);
> >> +
> >> +       /* Help the HDMI phy get out of reset state */
> >> +       lsdc_wreg32(ldev, LSDC_HDMI1_PHY_CTRL_REG, HDMI_PHY_RESET_N);
> >> +
> >> +       drm_dbg(ddev, "%s reset\n", encoder->name);
> >> +
> >> +       mdelay(20);
> >> +}
> >> +
> >> +const struct drm_encoder_funcs lsdc_pipe1_hdmi_encoder_funcs = {
> >> +       .reset = lsdc_pipe1_hdmi_encoder_reset,
> >> +       .destroy = drm_encoder_cleanup,
> >> +};
>


-- 
With best wishes
Dmitry
