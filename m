Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D687D230B68
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 15:25:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42AD889BE;
	Tue, 28 Jul 2020 13:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E28889BE
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 13:25:19 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id f18so18300506wrs.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 06:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BnkqZuh++8Nyz7qDB61TIgg/e9h5HC3HmU88l0fPREc=;
 b=IkEQ1WD+oaOYJMt5V3vCBqnKqZKVOHp8IcfCmTzu+QgfrApn64nxDuQpGAigx7KDcM
 LLcdPwmr1jSXVhKAatNz03GzLs/6Vlh39NC/O6LMa3vzgjAobOFGkZUu6uHjRP7JWYCo
 MCkZ0nbEhKkbR82cTawPX+gM0Pk10AhqCeaKm/m/KXCgWpZh2h2Kej6t/7FaDi+Cm8q/
 lPZwDiS7RXO/UymIExdM6ThIecB8y8005n0nmGVDr9uXishRVOb3iTtgJ2AD/nyJL9hy
 XhKOeGQ71pP32Y5y8Q5rEIQdYxSfzCReD1hBJj+xRGf+EPGkpsaDW52Pnq0Lbfr1sNzl
 lOdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BnkqZuh++8Nyz7qDB61TIgg/e9h5HC3HmU88l0fPREc=;
 b=hVQFNIfn8HgJS1hEkXjUjVeMTMP+F4NsbPkAklNlavIz5XmQYVrsxRzNKexZn3em9P
 wfQVH9+fRLMO92yEMphAhYqSQoP01wb6o6gYIJrm3bMoGx9Ugut1mOq+gQSzpBWyvRyc
 QEMDB3AcLTO/QTlCsrMZupnkipm4jLDpSP3yOXPfu4dJ+KosbTiDuRLf5+oRt/aqSq4a
 wZ9fZbgZHwUK/y7uVAnREqHgLhnZmWGyZ+Aw8RLm0HbXbmOUe6J3t+vnoy2zNcospJql
 IXEhGi92hAXCyw3Mklu0ZBjCyC2KH7HT55ACIOCXZxekiz1Co5LM7/MeXvzmQX1jxpFj
 j3Qw==
X-Gm-Message-State: AOAM5315pqlXWhwWy5zL77R6V7W3eK9PFUdLpGOr7Rh0fbO2xf6a1dm9
 a8mdHnIHLpx7/iP0VxgdJ1lbRvI8DvAdpQxRyrH/nw==
X-Google-Smtp-Source: ABdhPJzKZMW4yeHYoMhjbyXIdKK5EP7J/ukIUn/pmswXVcXcrqcKNtmYRDkd8iXjV/fJdX3O+1cYpgFt/HQXuTMKnNc=
X-Received: by 2002:a5d:6681:: with SMTP id l1mr23866783wru.47.1595942718473; 
 Tue, 28 Jul 2020 06:25:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <73684b1e4872a1113f6c3bb5404bc6b4a20f130d.1594230107.git-series.maxime@cerno.tech>
In-Reply-To: <73684b1e4872a1113f6c3bb5404bc6b4a20f130d.1594230107.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Jul 2020 14:25:02 +0100
Message-ID: <CAPY8ntAtRJYRi6mG19zQEWLjbnVKaQKvTZcP8EB+-csOeSz6rg@mail.gmail.com>
Subject: Re: [PATCH v4 59/78] drm/vc4: hdmi: Add CEC support flag
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Wed, 8 Jul 2020 at 18:43, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Similarly to the audio support, CEC support is not there yet for the
> BCM2711, so let's skip entirely the CEC initialization through a variant
> flag.

CEC is sorted now, but it's easier & cleaner to keep this patch and
add a new patchset that enables CEC at a later date.

> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 4 ++++
>  drivers/gpu/drm/vc4/vc4_hdmi.h | 3 +++
>  2 files changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 8cd08b541c14..86e21de6c578 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -1179,6 +1179,9 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
>         u32 value;
>         int ret;
>
> +       if (!vc4_hdmi->variant->cec_available)
> +               return 0;
> +
>         vc4_hdmi->cec_adap = cec_allocate_adapter(&vc4_hdmi_cec_adap_ops,
>                                                   vc4_hdmi, "vc4",
>                                                   CEC_CAP_DEFAULTS |
> @@ -1477,6 +1480,7 @@ static int vc4_hdmi_dev_remove(struct platform_device *pdev)
>  static const struct vc4_hdmi_variant bcm2835_variant = {
>         .encoder_type           = VC4_ENCODER_TYPE_HDMI0,
>         .debugfs_name           = "hdmi_regs",
> +       .cec_available          = true,
>         .registers              = vc4_hdmi_fields,
>         .num_registers          = ARRAY_SIZE(vc4_hdmi_fields),
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> index 794216f3228d..3f07aebe89f1 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -33,6 +33,9 @@ struct vc4_hdmi_variant {
>         /* Filename to expose the registers in debugfs */
>         const char *debugfs_name;
>
> +       /* Set to true when the CEC support is available */
> +       bool cec_available;
> +
>         /* List of the registers available on that variant */
>         const struct vc4_hdmi_register *registers;
>
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
