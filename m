Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADBD7928C4
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 18:46:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F8C810E0D2;
	Tue,  5 Sep 2023 16:46:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 496AD10E0D2
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 16:46:12 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-99bcf2de59cso409758966b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Sep 2023 09:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693932368; x=1694537168;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AgLOvyOzkkToLqkCrJsXRlY8QfvdXyyN+UM6jz+GkrQ=;
 b=ccOvmYxA1qlnqbCRQOnBB0GRpNAIBREgYMXewwLo+IGJtX2jAfvO3gkYBbl8KkZH5N
 M6P4c6CuCox8Z0XgIenfedCu9XyqCuz0CskTlH06AI60HUFfgz14UV+CUmE1Wj4uiq2B
 x6KFfFwzUgHaNXOI+Hc76svTN2RS6ZivtshzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693932368; x=1694537168;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AgLOvyOzkkToLqkCrJsXRlY8QfvdXyyN+UM6jz+GkrQ=;
 b=VWtdYDAZqKS5fpln3DCQN7c/EH6ZkF0A41FFgqEyKu2MztmfTapISZekiB6QS72i2L
 lG0DrI5evkCinJkhGylEnMgls1ryI2+q7H36mV6yM5MuEFGq+2zLfIhrv5Ej8UDg2zqu
 OL/WTHxECCMe2HyLQTMoAm5/oKuiyUBTHrEc/O+S5NPBm7NPrgdZoGo6kl9qGnfsHq1C
 JIbi64+Kj2hipmBVFaVVkBFZqChlPGPgRzobYpr/3ghGeydCscgmTT8T5AlrGi9Oay+c
 gzcnUS1+6kWgkT5GJYRPSal55VnMUfzJZEyo3RJ83Vlv/iBJBiN69DM6gaA+uomhHV2T
 XhdA==
X-Gm-Message-State: AOJu0YwA8oxDqWdXOzWnNCgmbX4qpADCKX8ZFmoNQdk4zdx6pPzYYlE1
 1NwYDiof35MSfN4qFGVI85ygIL2E7yxZsWRATbXtaYgC
X-Google-Smtp-Source: AGHT+IG8Sn9VfnB8aTZNUd8zs/C3dA9djh4JuNmwUWrq/oygjZfau71IVSOYfS7orZPFbtPjD/HQJA==
X-Received: by 2002:a17:906:a18b:b0:9a1:c812:cbb9 with SMTP id
 s11-20020a170906a18b00b009a1c812cbb9mr256450ejy.31.1693932368281; 
 Tue, 05 Sep 2023 09:46:08 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com.
 [209.85.208.41]) by smtp.gmail.com with ESMTPSA id
 f3-20020a170906824300b0099b921de301sm7795897ejx.159.2023.09.05.09.46.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Sep 2023 09:46:06 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-52c96d5df86so132a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Sep 2023 09:46:06 -0700 (PDT)
X-Received: by 2002:a50:9f41:0:b0:506:b280:4993 with SMTP id
 b59-20020a509f41000000b00506b2804993mr4449edf.2.1693932366175; Tue, 05 Sep
 2023 09:46:06 -0700 (PDT)
MIME-Version: 1.0
References: <bphkopaq76imqzut7xrx7aprqybhx3veajdympqhig2wqlix6c@64ck23rc5cv7>
 <CAD=FV=XiVkoCsjin4R74nkcd8vzOq9uPq+o5cRjd=YOoPXuQkg@mail.gmail.com>
 <lhd6ai7d6swlxhisjhikytguor7pptrymo3bmfwej4k7zqrnv4@hp2gvhw7mh3m>
 <CAD=FV=XUhzguFCC=aKzHFMV0bBnZzkHXP_tx+P=PNkVr=8SnTA@mail.gmail.com>
 <mumiep5q7x7qj7k64h3cyodxrgk737iy5rum5keguquwymf2gy@3qruwfrqjgy7>
 <CAD=FV=VEene+nr1us87iA+bomxzQ039r-E+wqvizvFGbxXjDvA@mail.gmail.com>
 <wwzbd7dt5qyimshnd7sbgkf5gxk7tq5dxtrerz76uw5p6s7tzt@cbiezkfeuqqn>
 <CAD=FV=XcUVvg5Om__dD=i9zu7ZtQmvWicms9yN7w0c2nWGhqYg@mail.gmail.com>
 <p7okuysh442hulqls3ekbaar2bguqv67fum3gsb2cj75kjvdpx@uebwlgvf46sy>
 <CAD=FV=Xr4nZUeHY-FdiedcV=BuP5szNBEHPKjdRnA7c+3MADqg@mail.gmail.com>
 <nahwibpea2akyg7swbdb3f6xyv7fqs35v5spqbjfzfchxnoqqz@glgg5core75d>
In-Reply-To: <nahwibpea2akyg7swbdb3f6xyv7fqs35v5spqbjfzfchxnoqqz@glgg5core75d>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 5 Sep 2023 09:45:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UKSc4mNjWcvLCXT9Tdeok=xRjA0oVoLKVkq+kQ9-4M0A@mail.gmail.com>
Message-ID: <CAD=FV=UKSc4mNjWcvLCXT9Tdeok=xRjA0oVoLKVkq+kQ9-4M0A@mail.gmail.com>
Subject: Re: [RFC PATCH 04/10] drm/panel_helper: Introduce drm_panel_helper
To: Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Sep 4, 2023 at 8:33=E2=80=AFAM Maxime Ripard <mripard@kernel.org> w=
rote:
>
> > I don't understand the benefit of switching to refcounting, though. We
> > don't ever expect the "prepare" or "enable" function to be called more
> > than once and all we're guarding against is a double-unprepare and a
> > double-enable. Switching this to refcounting would make the reader
> > think that there was a legitimate case for things to be prepared or
> > enabled twice. As far as I know, there isn't.
>
> Sure, eventually we'll want to remove it.
>
> I even said it as such here:
> https://lore.kernel.org/dri-devel/wwzbd7dt5qyimshnd7sbgkf5gxk7tq5dxtrerz7=
6uw5p6s7tzt@cbiezkfeuqqn/
>
> However, we have a number of panels following various anti-patterns
> where disable and unprepare would be called multiple times. A boolean
> would just ignore the second, refcounting would warn over it, and that's
> what we want.

Can you provide a concrete example of a case where refcounting would
give a better error? I'm still having a hard time understanding why
you are saying that refcounting is better and something concrete would
help me. Can you point at a driver you have in mind that follows an
anti-pattern where refcount would be better?

I'll try to be more concrete too and maybe you can point out where I'm
confused. As far as I understand the only difference between the
boolean and the refcount would be if someone _enabled_ or _prepared_
more than once, right? That would cause a refcount to increment to 2
but the boolean would stay at "true". I'm not aware of anyone calling
enable or prepare more than once, but maybe you are? ...or maybe
there's some other difference that I'm not aware of?

Said another way...

With a boolean and _not_ having more than one enable:

1. enable() =3D> set "enabled" to true and enable panel.
2. disable() =3D> set "enabled" to false and disable panel.
3. disable() =3D> WARN, leave "enabled" as false.
4. disable() =3D> WARN, leave "enabled" as false

With a refcount and _not_ having more than one enable:

1. enable() =3D> refcount becomes 1 and enable panel
2. disable() =3D> refcount becomes 0 and disable panel
3. disable() =3D> WARN, refcount stays 0
4. disable() =3D> WARN, refcount stays 0

So with only one enable the behavior is the same.

With a boolean and more than one enable:

1. enable() =3D> set "enabled" to true and enable panel.
2. enable() =3D> WARN, leave "enabled" as true
3. disable() =3D> set "enabled" to false and disable panel.
4. disable() =3D> WARN, leave "enabled" as false.
5. disable() =3D> WARN, leave "enabled" as false

With a refcount and more than one enable:

1. enable() =3D> refcount becomes 1 and enable panel
2. enable() =3D> refcount becomes 2
3. disable() =3D> refcount becomes 1
4. disable() =3D> refcount becomes 0 and disable panel
5. disable() =3D> WARN, refcount stays 0

In the case that there is more than one enable, I think the "boolean"
is better. Specifically:

a) It doesn't change behavior from today. Perhaps you can show me a
counterexample, but lacking that I'd assert that everyone today is
expecting things to work like the "boolean" case. If we change to a
refcount I think it could break someone. Even if nobody is relying on
things working like the "boolean" case today, I would assert that I
don't think anyone is expecting things to work like the "refcount"
case.

b) With a boolean we WARN at more appropriate times. Sure we could add
a warning when the refcount becomes 2, but at that point why aren't we
just using a boolean?

c) The "boolean" case is already implemented today so no patches need
to be sent for it.


> > In any case, I don't think there's any need to switch this to
> > refcounting as part of this effort. Someone could, in theory, do it as
> > a separate patch series.
>
> I'm sorry, but I'll insist on getting a solution that will warn panels
> that call drm_atomic_helper_shutdown or drm_panel_disable/unprepare by
> hand. It doesn't have to be refcounting though if you have a better idea
> in mind.

As per above, I think this already happens with the boolean? Won't you
see an error message like this:

dev_warn(panel->dev, "Skipping unprepare of already unprepared panel\n");

...from drm_panel_unprepare()


> > > > The above solves the problem with panels wanting to power sequence
> > > > themselves at remove() time, but not at shutdown() time. Thus we'd
> > > > still have a dependency on having all drivers use
> > > > drm_atomic_helper_shutdown() so that work becomes a dependency.
> > >
> > > Does it? I think it can be done in parallel?
> >
> > I don't think it can be in parallel. While it makes sense for panels
> > to call drm_panel_remove() at remove time, it doesn't make sense for
> > them to call it at shutdown time. That means that the trick of having
> > the panel get powered off in drm_panel_remove() won't help for
> > shutdown. For shutdown, which IMO is the more important case, we need
> > to wait until all drm drivers call drm_atomic_helper_shutdown()
> > properly.
>
> Right, my point was more that drivers that already don't disable the
> panel in their shutdown implementation will still not do it. And drivers
> that do will still do it, so there's no regression.
>
> We obviously want to tend to having all drivers call
> drm_atomic_helper_shutdown(), but not having it will not introduce any
> regression.

I'm still confused here too. The next patch in this patch series here
that we're talking about is:

https://lore.kernel.org/dri-devel/20230804140605.RFC.5.Icc3238e91bc726d4b04=
c51a4acf67f001ec453d7@changeid/

Let's look at an arbitrary concrete part of that patch: the
modification to "panel-tdo-tl070wsh30.c". For that panel, my RFC patch
removed the tracking of "prepared" and and then did this:

@@ -220,16 +209,14 @@ static void tdo_tl070wsh30_panel_remove(struct
mipi_dsi_device *dsi)
  dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", err);

  drm_panel_remove(&tdo_tl070wsh30->base);
- drm_panel_disable(&tdo_tl070wsh30->base);
- drm_panel_unprepare(&tdo_tl070wsh30->base);
+ drm_panel_helper_shutdown(&tdo_tl070wsh30->base);
 }

 static void tdo_tl070wsh30_panel_shutdown(struct mipi_dsi_device *dsi)
 {
  struct tdo_tl070wsh30_panel *tdo_tl070wsh30 =3D mipi_dsi_get_drvdata(dsi)=
;

- drm_panel_disable(&tdo_tl070wsh30->base);
- drm_panel_unprepare(&tdo_tl070wsh30->base);
+ drm_panel_helper_shutdown(&tdo_tl070wsh30->base);
 }

As per our discussion, the plan is to send a V2 of my patch series
where I _don't_ create the call drm_panel_helper_shutdown() and thus I
won't call it. That means that the V2 of the patch for
"panel-tdo-tl070wsh30.c" will remove the calls to drm_panel_disable()
and drm_panel_unprepare() and not replace them with anything.

As per our discussion, in V2 we will make drm_panel_remove() actually
unprepare / disable a panel if it was left enabled. This would
essentially fold in the drm_panel_helper_shutdown() from my RFC patch.
This would make tdo_tl070wsh30_panel_remove() behave the same as it
did before. Ugh, though I may have to think about this more when I get
to implementation since I don't think there's a guarantee of the
ordering of shutdown calls between the DRM driver and the panel.
Anyway, something to discuss later.

However... tdo_tl070wsh30_panel_shutdown() will no longer power the
panel off properly _unless_ the main DRM driver properly calls
drm_atomic_helper_shutdown().


Did I get anything above incorrect? Assuming I got it correct, that
means that our choices are:

a) Block landing the change to "panel-tdo-tl070wsh30.c" until after
all drivers properly call drm_atomic_helper_shutdown().

b) Add a hacky call to drm_panel_remove() in
tdo_tl070wsh30_panel_shutdown() to get the old behavior. This would
work, but IMO it's ugly and I'm pretty strongly against it.

c) Ignore the regression and just say that this panel won't get power
sequenced properly until its DRM driver is updated. I'm strongly
against this.

...unless you are aware of another choice, the only choice I'm willing
to go with is "a)" which is why I say we are blocked on getting all
drivers to properly call drm_atomic_helper_shutdown().

NOTE: I could still land patches #1-3 of this series and I'm actually
included to do so. I'll respond to the cover letter proposing this.


-Doug
