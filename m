Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D82654B859
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 20:14:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E22410F18F;
	Tue, 14 Jun 2022 18:13:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5844C10F154
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 18:13:57 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-3137c877092so37851477b3.13
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 11:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZsjTA9iJIzTxX4ygR8FdKM9wnHJIUgreAx1BZ2osk+k=;
 b=elkEMMAy3wPQwGf1ROmnn/4Isu60xOrk5kwhUf9POtxNbXra9m+VOIyaYdDcP+3CU3
 2JT5ARrP4xwLtPX0Ds74mSJUDU0WpEwRhBDquEnA4hNv+/G/6Q6UFzYcWShmefjq8AjX
 gz+FlbByjs1p+vyfBLAp58Tc0jFjVzOn1TINg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZsjTA9iJIzTxX4ygR8FdKM9wnHJIUgreAx1BZ2osk+k=;
 b=34x5TbhxezShaci2y+kc+Bq3/KxusEimoXBEt7dE0Tk4/RYKeg7IBHuOrz2HAMJYV9
 h0rZbvp/NMASA08uDg5PQrVeXykWC4VMKAjCs5v4pXe1Xnpd3P3G3UyS7R2iuN8rxqRa
 4kGi+US6fwI50HcVFS98qbt8SUVJppEF0jkB4zxyOtOI6YdXIoIGjUz9XdzpsybFE4GJ
 cpSj2gF9w/Ry+F06EIGR6OWzC2xMJ+qYC7r7o078SFBehSlE0x/WJwLdqjTrxE14z3W0
 Ta9gxDUPlsTSgX1Jmldlk22jkwpmEicLFZtHX5H4JyIXXdyzhlPyHrEWAAVHiMGOj49h
 aerg==
X-Gm-Message-State: AJIora/eRM/tpiq5ArAqxcmkqi/vV1RvM5qaw43cMCfMd4BZ0n0ObjCr
 S3NqXNz1JmyLC9IZtAMFlzhpIrKvueCFWFIvtWgmyg==
X-Google-Smtp-Source: AGRyM1uE67Atomlar3nLQdgT+jy4zLDSFTPt4ERa1X/kLBHMBihOauBraRP729dfHSV8ag/nSgM1IEdsAe/aMtNwTF8=
X-Received: by 2002:a81:fd1:0:b0:30f:f98b:4957 with SMTP id
 200-20020a810fd1000000b0030ff98b4957mr7329858ywp.350.1655230436484; Tue, 14
 Jun 2022 11:13:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220609181106.3695103-1-pmalani@chromium.org>
 <20220609181106.3695103-6-pmalani@chromium.org>
 <ef3933a8-88c2-f19f-97df-3498f54b9a4f@collabora.com>
In-Reply-To: <ef3933a8-88c2-f19f-97df-3498f54b9a4f@collabora.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 14 Jun 2022 11:13:45 -0700
Message-ID: <CACeCKaegCzKZdnbZFkE0WWb=99jCfQDA60kTVhOS1TGvdHgpDg@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] drm/bridge: anx7625: Register number of Type C
 switches
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: heikki.krogerus@linux.intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, swboyd@chromium.org,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 14, 2022 at 1:22 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 09/06/22 20:09, Prashant Malani ha scritto:
> > Parse the "switches" node, if available, and count and store the number
> > of Type-C switches within it. Since we currently don't do anything with
> > this info, no functional changes are expected from this change.
> >
> > This patch sets a foundation for the actual registering of Type-C
> > switches with the Type-C connector class framework.
> >
> > Signed-off-by: Prashant Malani <pmalani@chromium.org>
> > ---
> >
> > Changes since v1:
> > - No changes.
> >
> >   drivers/gpu/drm/bridge/analogix/anx7625.c | 20 ++++++++++++++++++++
> >   drivers/gpu/drm/bridge/analogix/anx7625.h |  1 +
> >   2 files changed, 21 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index 53a5da6c49dd..07ed44c6b839 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -2581,6 +2581,22 @@ static void anx7625_runtime_disable(void *data)
> >       pm_runtime_disable(data);
> >   }
> >
> > +static int anx7625_register_typec_switches(struct device *device, struct anx7625_data *ctx)
> > +{
> > +     struct device_node *of = NULL;
> > +     int ret = 0;
> > +
> > +     of = of_get_child_by_name(device->of_node, "switches");
> > +     if (!of)
> > +             return -ENODEV;
> > +
> > +     ctx->num_typec_switches = of_get_child_count(of);
> > +     if (ctx->num_typec_switches <= 0)
> > +             return -ENODEV;
> > +
> > +     return ret;
>
> You aren't using the `ret` variable for anything other than returning zero:
> remove it and simply return 0 here.
The very next patch does use it, but sure I'll remove it from here and
introduce it in v6.
>
> > +}
> > +
> >   static int anx7625_i2c_probe(struct i2c_client *client,
> >                            const struct i2c_device_id *id)
> >   {
> > @@ -2686,6 +2702,10 @@ static int anx7625_i2c_probe(struct i2c_client *client,
> >       if (platform->pdata.intp_irq)
> >               queue_work(platform->workqueue, &platform->work);
> >
> > +     ret = anx7625_register_typec_switches(dev, platform);
> > +     if (ret)
> > +             dev_info(dev, "Didn't register Type C switches, err: %d\n", ret);
>
> Type-C switches are optional for this driver and this will print a sort of error
> on boards that are *not* declaring any switches on purpose (because perhaps they
> don't have any, or for any other reason).
>
> Even though this is a dev_info and not a dev_err, it's still printing an alarming
> (and useless, in the aforementioned case) message.
I'll go ahead and convert this to dev_warn, but only trigger if there
is an error other than ENODEV.

>
> Please fix this.
>
> Regards,
> Angelo
>
