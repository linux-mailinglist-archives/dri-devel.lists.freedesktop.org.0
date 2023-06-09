Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1C772950B
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 11:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C594C10E670;
	Fri,  9 Jun 2023 09:27:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4CE110E670
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 09:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686302861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pmcy3J55zT63aAIMqIuRpUjqhj86xl68Bl2D1HlN7pE=;
 b=iWon2Ynm527/7s2UF7vmCv60KDWqUgKNOFPLspfnobaDPlz5dWTwCTqbUSmdsH4huFihTd
 5WP6khzuIjBRPrYx0blQMj45zcdeUuMvj20gRx9jO02RzB2XJu/KP6O37xh/niNPleS3ed
 TnG+MSQcj076sk6+y75TbaxblRBzFdg=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-lHmVz-ngMsqTferyjEeb_g-1; Fri, 09 Jun 2023 05:27:40 -0400
X-MC-Unique: lHmVz-ngMsqTferyjEeb_g-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-56561689700so22775237b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jun 2023 02:27:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686302859; x=1688894859;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pmcy3J55zT63aAIMqIuRpUjqhj86xl68Bl2D1HlN7pE=;
 b=D9kSLdLNwTeYA1Q/yvBzkjhpnIdrfrceWTBnvxG7Tiz6K3Ywj7mR044kTns00f+lRF
 7PFQxSVLJCJmzikiGkrhUz9/ZfRgAjRHvpYfgSxyV3ULuSIzKPS0LPV54g36urRjDdNu
 oKgvoJIR1rdhSEg2+cuA8nRSdDOLR8pyVbXdzARryiH1u/Fl4PlRi/hq5+m/BqYcP5jX
 cbtvluxFZOHC/KeJVwKf5k2LZTxFXFnxLEXKVmT6BpM5o5K9t3rT6llZaBJhVurkCLK+
 TSYlUtCKY8R+I6DraDf3eCsa0JNir/dr3esQBRDw1FfY4cS3QhkCs/aVAu0LachBZg19
 nbiw==
X-Gm-Message-State: AC+VfDyGDkc4gv3aOuteOMrCu/eKzjxUR2AtMlUqKhx3NyoTRr0FIsoY
 tpGsCyriJHYcNJ+b/Qw5V42ExShtWG1GJPZlUIit8dpRwfvarN+F/n2qUcMqAAAIAkRSiK9E4qb
 Bhf6fJxyR0SG1u4m4zWKIQfSmEfCvcdZMKvFatv7rh4Pr
X-Received: by 2002:a81:8397:0:b0:561:8fef:13ce with SMTP id
 t145-20020a818397000000b005618fef13cemr723950ywf.37.1686302859591; 
 Fri, 09 Jun 2023 02:27:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4QBet5uUGDZzHtkvGQ4KbpSa5IpEdM6hVVs73Fec1WoTv6J/MyP1ycHtEm9hSo9hbresvIJlkjf42Viv0F/aQ=
X-Received: by 2002:a81:8397:0:b0:561:8fef:13ce with SMTP id
 t145-20020a818397000000b005618fef13cemr723918ywf.37.1686302859245; Fri, 09
 Jun 2023 02:27:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230607215224.2067679-1-dianders@chromium.org>
 <20230607144931.v2.8.Ib1a98309c455cd7e26b931c69993d4fba33bbe15@changeid>
 <y3l4x3kv7jgog3miexati5wbveaynnryzqvj6sc4ul6625f2if@w7nqgojfavfw>
 <CAD=FV=W-fXpm4JCczrNgAS2M9u2VLd2jAkJvE9XJgQpvoE5rjA@mail.gmail.com>
In-Reply-To: <CAD=FV=W-fXpm4JCczrNgAS2M9u2VLd2jAkJvE9XJgQpvoE5rjA@mail.gmail.com>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Fri, 9 Jun 2023 11:27:27 +0200
Message-ID: <CAO-hwJ+3M1iYgaAFEtf-63U20ccGfdiRoi3197YoZmyvMYsGzQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] HID: i2c-hid: Support being a panel follower
To: Doug Anderson <dianders@chromium.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Frank Rowand <frowand.list@gmail.com>,
 linux-input@vger.kernel.org, hsinyi@google.com, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 linux-arm-msm@vger.kernel.org, yangcong5@huaqin.corp-partner.google.com,
 Jiri Kosina <jikos@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 8, 2023 at 6:43=E2=80=AFPM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Thu, Jun 8, 2023 at 8:37=E2=80=AFAM Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
> >
> >
> > On Jun 07 2023, Douglas Anderson wrote:
> > >
> > > As talked about in the patch ("drm/panel: Add a way for other devices
> > > to follow panel state"), we really want to keep the power states of a
> > > touchscreen and the panel it's attached to in sync with each other. I=
n
> > > that spirit, add support to i2c-hid to be a panel follower. This will
> > > let the i2c-hid driver get informed when the panel is powered on and
> > > off. From there we can match the i2c-hid device's power state to that
> > > of the panel.
> > >
> > > NOTE: this patch specifically _doesn't_ use pm_runtime to keep track
> > > of / manage the power state of the i2c-hid device, even though my
> > > first instinct said that would be the way to go. Specific problems
> > > with using pm_runtime():
> > > * The initial power up couldn't happen in a runtime resume function
> > >   since it create sub-devices and, apparently, that's not good to do
> > >   in your resume function.
> > > * Managing our power state with pm_runtime meant fighting to make the
> > >   right thing happen at system suspend to prevent the system from
> > >   trying to resume us only to suspend us again. While this might be
> > >   able to be solved, it added complexity.
> > > Overall the code without pm_runtime() ended up being smaller and
> > > easier to understand.
> >
> > Generally speaking, I'm not that happy when we need to coordinate with
> > other subsystems for bringing up resources...
>
> Yeah, I'd agree that it's not amazingly elegant. Unfortunately, I
> couldn't find any existing clean frameworks that would do what was
> needed, which is (presumably) why this problem hasn't been solved
> before. I could try to come up with a grand abstraction / new
> framework, but that doesn't seem like a great choice either unless we
> expect more users...
>
>
> > Anyway, a remark inlined (at least):
> >
> > >
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > >
> > > Changes in v2:
> > > - i2c_hid_core_panel_prepared() and ..._unpreparing() are now static.
> > >
> > >  drivers/hid/i2c-hid/i2c-hid-core.c | 82 ++++++++++++++++++++++++++++=
+-
> > >  1 file changed, 81 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid=
/i2c-hid-core.c
> > > index fa8a1ca43d7f..368db3ae612f 100644
> > > --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> > > +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> > > @@ -38,6 +38,8 @@
> > >  #include <linux/mutex.h>
> > >  #include <asm/unaligned.h>
> > >
> > > +#include <drm/drm_panel.h>
> > > +
> > >  #include "../hid-ids.h"
> > >  #include "i2c-hid.h"
> > >
> > > @@ -107,6 +109,8 @@ struct i2c_hid {
> > >       struct mutex            reset_lock;
> > >
> > >       struct i2chid_ops       *ops;
> > > +     struct drm_panel_follower panel_follower;
> > > +     bool                    is_panel_follower;
> > >  };
> > >
> > >  static const struct i2c_hid_quirks {
> > > @@ -1058,6 +1062,34 @@ static int i2c_hid_core_initial_power_up(struc=
t i2c_hid *ihid)
> > >       return ret;
> > >  }
> > >
> > > +static int i2c_hid_core_panel_prepared(struct drm_panel_follower *fo=
llower)
> > > +{
> > > +     struct i2c_hid *ihid =3D container_of(follower, struct i2c_hid,=
 panel_follower);
> > > +     struct hid_device *hid =3D ihid->hid;
> > > +
> > > +     /*
> > > +      * hid->version is set on the first power up. If it's still zer=
o then
> > > +      * this is the first power on so we should perform initial powe=
r up
> > > +      * steps.
> > > +      */
> > > +     if (!hid->version)
> > > +             return i2c_hid_core_initial_power_up(ihid);
> > > +
> > > +     return i2c_hid_core_resume(ihid);
> > > +}
> > > +
> > > +static int i2c_hid_core_panel_unpreparing(struct drm_panel_follower =
*follower)
> > > +{
> > > +     struct i2c_hid *ihid =3D container_of(follower, struct i2c_hid,=
 panel_follower);
> > > +
> > > +     return i2c_hid_core_suspend(ihid);
> > > +}
> > > +
> > > +static const struct drm_panel_follower_funcs i2c_hid_core_panel_foll=
ower_funcs =3D {
> > > +     .panel_prepared =3D i2c_hid_core_panel_prepared,
> > > +     .panel_unpreparing =3D i2c_hid_core_panel_unpreparing,
> > > +};
> >
> > Can we make that above block at least behind a Kconfig?
> >
> > i2c-hid is often used for touchpads, and the notion of drm panel has
> > nothing to do with them. So I'd be more confident if we could disable
> > that code if not required.
>
> Happy to put it behind a Kconfig. I'll plan on that for v3. I'll stub
> the functions out if there is no Kconfig, but plan to still leave
> structure members just to avoid uglifying the sources too much.
>
>
> > Actually, I'd be even more happier if it were in a different compilatio=
n
> > unit. Not necessary a different module, but at least a different file.
>
> I suspect that it's not worth it, but I'll do this if you feel
> strongly about it.
>
> I guess the simplest way I can think of to move this to its own file
> would be to put the whole private data structure (struct i2c_hid) in a
> private header file and then add prototypes for i2c_hid_core_resume()
> and i2c_hid_core_suspend() there. Then I could add something like
> i2c_hid_core_handle_panel_follower() that would have all the
> registration logic. I'd still need special cases in the core
> suspend/resume/remove code unless I add a level of abstraction. While
> the level of abstraction is more "pure", it also would make the code
> harder to follow.
>
> Unless I hear a strong opinion (or if this series changes
> significantly), I'll plan to keep things in the same file and just use
> a Kconfig.
>

Right, a separate file might not be the best then :(

Do you envision this to be used on the ACPI side of i2c-hid? Because
if this is OF only, then maybe it would be interesting to put it there
(in i2c-hid-of.c), instead of having it in the core. IIRC i2c-hid-of
also has ways to set up/down regulators, so maybe it'll be better
there?

Cheers,
Benjamin

