Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 745F41B7048
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 11:08:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F6836E42D;
	Fri, 24 Apr 2020 09:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA8B6E42D
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 09:08:09 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id f18so9135549lja.13
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 02:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=5pOD1M4Lci7jKYVscc+sY841QcYIL600PyvrvL4v7qU=;
 b=ZBWtDtU789OwcjF0dTF/y64WOq5KjCvsRuPf9TExGvCHMgR7ZLBAL1u8ZNSf4muxiS
 nx+fS+P9tLXQQ7A4wu4Nk/ZVv2d4cDiW2taQJzGdOXyJviOyiYbykedzNQ/QQEXJm5WN
 Kvc9ShHESSXxk8WeII/iWZocBHdwhKBgNyfLYKPmvpgABYGvF1WQ0UTNmEaBBvK2gdkP
 g4uaufg0cWRCk9SsxM4p4bUz3xzH8YOOtOXWj8hPGsf1CzCYAWTGLEvRs6CaJbD33SA1
 zqDpNBpDo16X7cY6wWY4ZPPp70aXdbdDKTMh1iAtoZo5UCktAD0Gw/z7A0AQ6tgTNOLI
 2LHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=5pOD1M4Lci7jKYVscc+sY841QcYIL600PyvrvL4v7qU=;
 b=PB6XmCJ0gFS9siRqXGcS1BamBt/ab46ASYPgj9AHCpHj+owEdlRmInuBQpD1VVeLhl
 rQWpRDpqOrT6rplZt5X0p9Zm5JAgxXITZrsPpDI8RXpYXDIW5/er/Tx23nPTP+i9ytSr
 XXFuw5u00U0TiUCbvh9+sx/pAMLxq6G9LcvYoOLWmQEjXnHgsu8156Qhq3ssoqA8J+Ks
 eRuvErkl6Uufe9KBy/OFg/MDMBLFxXoZ3tQHvfmgvYgZKQACukvklsEEiIufv6ULPOq3
 /s3wOFCaGAkxjkVTNeDVEDrAosZuQtoPpUQCi/kf4p5ynbWQwROkcVC9IifPQnJxBxuj
 JjUA==
X-Gm-Message-State: AGi0PubygSJ7dM67TH7KOfH2++fHn9zCB09rTx/RbVCiWHrieM7aaMZP
 cfho/G0FXUwxMEou//zrM00=
X-Google-Smtp-Source: APiQypKPKaKHjeEpCv7X/n8gp7vvkGpdLqW0fmUPG7XX1xWI3vL5oT3ijVqEQqTwrQMby5tDSFvsJA==
X-Received: by 2002:a2e:b605:: with SMTP id r5mr5192600ljn.40.1587719287905;
 Fri, 24 Apr 2020 02:08:07 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id x11sm3837435ljj.15.2020.04.24.02.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 02:08:07 -0700 (PDT)
Date: Fri, 24 Apr 2020 12:08:02 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: RFC: Drm-connector properties managed by another driver /
 privacy screen support
Message-ID: <20200424120802.35fbffb4@eldfell.localdomain>
In-Reply-To: <caa677d0-bc43-5045-f4bb-1b762fafc870@redhat.com>
References: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
 <87tv1k4vl6.fsf@intel.com>
 <d47ba6ef-efd0-9f28-1ae4-b971b95a8f8b@redhat.com>
 <20200417120226.0cd6bc21@eldfell.localdomain>
 <87k12e2uoa.fsf@intel.com>
 <e8da46f8-ebe4-aee4-31c8-229d06fa7430@redhat.com>
 <20200421174613.139991ed@eldfell.localdomain>
 <CACK8Z6Hwg132K3TwsX6Bjx-2KG0HywrP=PnMMegdp7jqeU__1A@mail.gmail.com>
 <20200424104024.4cdb0d40@eldfell.localdomain>
 <caa677d0-bc43-5045-f4bb-1b762fafc870@redhat.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Christian Kellner <ckellner@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Nitin Joshi1 <njoshi1@lenovo.com>,
 Rajat Jain <rajatja@google.com>, Mark Pearson <mpearson@lenovo.com>,
 Benjamin Berg <bberg@redhat.com>
Content-Type: multipart/mixed; boundary="===============1767629554=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1767629554==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/.DwsGeDF5I9_umqvhpmzRP7"; protocol="application/pgp-signature"

--Sig_/.DwsGeDF5I9_umqvhpmzRP7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 24 Apr 2020 10:24:31 +0200
Hans de Goede <hdegoede@redhat.com> wrote:

> Hi all,
>=20
> Pekka, Rajat,
>=20
> Thank you for your input in this.
>=20
> On 4/24/20 9:40 AM, Pekka Paalanen wrote:
> > On Thu, 23 Apr 2020 11:21:47 -0700
> > Rajat Jain <rajatja@google.com> wrote:
> >  =20
> >> On Tue, Apr 21, 2020 at 7:46 AM Pekka Paalanen <ppaalanen@gmail.com> w=
rote: =20
> >>>
> >>> On Tue, 21 Apr 2020 14:37:41 +0200
> >>> Hans de Goede <hdegoede@redhat.com> wrote:
> >>>    =20
> >>>> TL;DR: Yes there will be races, because of both userspace +
> >>>> the firmware having; and potentially using r/w access to
> >>>> the privacy-screen state. But in practice I expect these
> >>>> to not really be an issue. Important here is that userspace
> >>>> only commits the property in a transaction to commit if
> >>>> it actually intends to change the property so as to not
> >>>> needlessly create a situation where we might hit the race.
> >>>>
> >>>> As for 1 vs 2 properties for this I guess that in preparation
> >>>> for potential devices where the state is locked, having a
> >>>> r/w sw-state + a ro hw-state property makes sense.
> >>>>
> >>>> So I suggest that we replace the current "privacy-screen" property
> >>>> from Rajat's patch-set with 2 props named:
> >>>>
> >>>> "privacy-screen-sw-state" (r/w)
> >>>> "privacy-screen-hw-state" (ro)
> >>>>
> >>>> Where for current gen hardware the privacy-screen-hw-state is
> >>>> just a mirror of the sw-state. =20
> >>
> >> Just to make sure I understand the semantics correctly:
> >>
> >> - The  "privacy-screen-hw-state" shall be read-only, and can be modifi=
ed by:
> >>        - Hardware (e.g. HW kill switch).
> >>        - Firmware.
> >>        - (Potentially) needs a notification/irq to the kernel when this
> >> changes (or may be kernel can read it only when userspace queries for
> >> it).
> >>
> >> - The "privacy-screen-sw-state" shall be read-write, and can only be
> >> modified by user space.
> >>          - If user space toggles it, the kernel will attempt to
> >> "request" the change to hardware.
> >>          - Whether the request to hardware was successful or not, the
> >> "privacy-screen-sw-state" will always reflect the latest value
> >> userspace wrote.
> >>          - If the request to hardware was successful, the
> >> "privacy-screen-hw-state" will also change (probably via a separate
> >> notification/irq from HW).
> >>          - We expect the user space to write to
> >> "privacy-screen-sw-state" only if it really wants to toggle the value.=
 =20
> >=20
> > Hi,
> >=20
> > yes, to my understanding, that seems to be the correct idea from this
> > thread. The hw-state property must reflect the actual hardware state at
> > all times. =20
>=20
> Agree on the hw-state prop reflecting the actual hardware state at
> all times, that one is easy.
>=20
> > However, when userspace sets "privacy-screen-sw-state", the driver
> > should attempt to change hardware state regardless of whether the
> > "privacy-screen-sw-state" value changes compared to its old value or
> > not. Otherwise userspace cannot intentionally override a hardware
> > hotkey setting if possible (or would need two atomic commits to do it).=
 =20
>=20
> Ack / agreed.
>=20
> > Mind, the above paragraph is only what I interpreted from this email
> > thread here. Previously I did not think that with atomic KMS, setting a
> > property to a value it already has could trigger anything. But I guess
> > it can? =20
>=20
> In a way. My idea for the "privacy-screen-sw-state" is for it to reflect
> the last requested value, where the request could come from either a
> firmware controlled hotkey; or from userspace (this seems to be where
> our ideas of how to handle this diverts).
>=20
> So what can happen is (with both props being always in sync)
> -userspace reads privacy screen being off
> -user toggles privacy screen on through firmware controlled hotkey
> -kernel gets notified about state toggle, updates both property
>   states to on
> -userspace commits its old knowledge of the property (off), thereby
>   triggering the kernel to turn the privacy screen back off
>=20
> So in this case from the kernel pov the property is actually set
> to a new value, not to "a value it already has".

Hi,

that is an interesting point of view.

You are keeping the separation between "wanted" and "actual" state, but
counting firmware/hardware hotkeys as "want" instead of letting them
silently change hardware state.

That seems ok.

> Note there can be races here of course, but lets ignore those (for now).
> Both the hotkey event as well as userspace changing the setting will be
> end-user triggered events and will not happen at high frequency.
> Also I see no way to completely eliminate racing here. Luckily the side
> effects of the race or pretty harmless (annoying maybe, but not causing
> crashes, etc).
>=20
> > This design is based on that it can.
> >  =20
> >> What is not clear to me is if any change to"privacy-screen-hw-state"
> >> shall be propagated to "privacy-screen-sw-state"?
> >>   - If yes, then I think we are not solving any problems of single pro=
perty.
> >>   - If no, then why do we require userspace to write to sw state only
> >> if something has changed? =20
> >
> > No. As already written, the kernel must not change the value of
> > "privacy-screen-sw-state", only userspace can. =20
>=20
> So this is where out view of how to handle this differs, I do
> not see the hotkey changing the state as different from userspace
> changing it. The reason for me to have both a sw- and a hw-state
> is in case there is a physical switch (typically a slider style
> switch) which forces the state to on / off. In this case userspace
> could still set the "privacy-screen-sw-state" prop and then
> the 2 could differ.

Yes, the locked switch case definitely makes sense to me.

If userspace has to avoid setting the sw property unless it actually
intends to change it, then the sw property being controlled from
multiple sources (firmware, hotkey, the /proc file below) could work.
It would even tell the KMS client when someone else changed the
"wanted" state.

> Lets add one more complication to this, which I think helps.
> Currently the thinkpad_acpi driver exports the privacy screen as:
>=20
> /proc/acpi/ibm/lcdshadow
>=20
> Userspace can write this and then change the privacy-screen
> setting, this is in shipped kernels and cannot be dropped
> because it is part if the kernel's uABI now.
> This means that another userspace process can change the
> property underneath a kms client. I do not see how this is
> different from the firmware changing the setting based on
> a hotkey press. Yet if we stick with your "only userspace can"
> change the sw-state setting, then does this count as userspace,
> or do you mean only a kms client can ?  And then how is
> another kms-client changing the setting different ?

To me that would be similar to firmware changing hardware state: it's
not the KMS client (the display server) doing it, but something else
behind its back while it thinks it's in full control.

Doing things behind the display server's back is what creates all the
mess here.

Another KMS client cannot set the property behind the display server's
back, because the display server is holding DRM master, and the
property cannot be written without DRM master status. If the display
server drops DRM master, it knows it probably lost all state.

> So to me to avoid confusion the only valid case where the
> hw- and sw-state can differ is if userspace requests
> say "off" as state while the privacy screen is forced on
> by say a physical switch (or e.g. a BIOS option to lock it?).
>=20
> Then we would remember the off in sw-state but hw-state would
> still be on.
>=20
> I guess that maybe for the enum of the hw-state we need 4 values
> instead of 2:
>=20
> Enabled
> Disabled
> Enabled, locked
> Disabled, locked
>=20
> To indicate to userspace that atm the state cannot be changed.

If userspace needs that information, sure.

This makes me think that a driver needs to handle different types of
switches/hotkeys through different properties:

- For a hardware latching switch that forces the shield state to be one
  and not the other, it should change the hw-state but it does not seem
  to have a reason to change the sw-state property: it's not a "want",
  it's a hard setting. Changing sw-state would also lose the userspace
  preference of the setting.

- For momentary button or a hotkey that is supposed to just toggle the
  shield state, it would toggle sw-state property since it's a "want"
  that can be overridden. Setting the property leads to changing the
  hw-state as well (if not locked).

Does that make sense?

Maybe this is the best compromise given the display server cannot be in
full control.

> If userspace then still changes sw-state we cache it and apply
> this if the privacy screen control gets unlocked.

Sounds good.

> On hardware where there is no "lock" the 2 properties will simply
> always be the same.

Ok.


Thanks,
pq

> > Let's assume that you have a firmware-implemented hardware hotkey for
> > toggling the shield. The driver also successfully implements
> > "privacy-screen-sw-state" meaning that writing to it will set the
> > hardware shield state. If userspace was writing
> > "privacy-screen-sw-state" even when it does not intend to change
> > hardware state, it would almost immediately override any state set by
> > the hardware hotkey, making the hardware hotkey (randomly) not work. =20
>=20
> Right, this is why userspace should not set the property unless
> it really means to change it, even then things could still race,
> but as explained above that should normally never happen and luckily
> the side-effects of hitting the race somehow are not that bad.
>=20
> > This assumes that the hardware hotkey is a momentary switch that does
> > not stop software from controlling the shield too. =20
>=20
> This is correct for the Lenovo / thinkpad_acpi case.
>=20
> > If the hardware hotkey can stop software from changing the shield
> > state, then it might not be necessary for userspace to avoid unneeded
> > setting of the property. But that depends on which way the hotkey works
> > and which way users want to use it, so it's still best for userspace to
> > not set the property unless it really intends to apply a change. =20
>=20
> Ack.
>=20
> > If possible, it would be good to make this case the prime example of
> > how to correctly implement KMS properties for a hardware feature that
> > can be controlled (and fought over) by both userspace and
> > hardware/firmware. It seems like the same design can also work with
> > hardware switches that force the hardware state to be one or the other,
> > stopping userspace from changing it. Therefore I'd avoid incorporating
> > any specific shield use cases in the design, e.g. "if hw switch is set
> > to shield-on, userspace cannot turn shield off". =20
>=20
> I agree that it would be good to make this the prime example of
> how to deal with similar cases.
>=20
> >> Also, it seems to me that in my current patchset, the property I have
> >> already behaves like "privacy-screen-sw-state". Do I just need to
> >> rename it? =20
>=20
> Maybe, it looks like we first need to figure out the exact semantics
> of all this.
>=20
> Regards,
>=20
> Hans
>=20


--Sig_/.DwsGeDF5I9_umqvhpmzRP7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl6irHIACgkQI1/ltBGq
qqeblQ/+KXU+AakWK8Rmn6vS7BsD6UxDQQTCRW3M36nrSAMv7ElRaPl/B5H2VicT
LUmP9a1wfDlx1KVWCkfKw/YG5xHUXL/L3C4uxeIuXj6TxJQXhJ7UjMljoRw6cPuV
LYphW1lJejW7T7rvRrA5J7gV6cC2R78wkiC43Sk3kD2aoWUg1l9Ij0wqTKu0mx6e
yleAr5Qg6GRHtDYb+4vNgJ+TRF96B4huupKlomnO/fum73ya/24jQIiTjZOQMkch
5aP99A+IypS/eUeD3y3exDq3SifEXKp7mDpK3Tdu6thJzyLDrTdrQps2GGQLm6JA
zU625tGU5SC/OhhPh2dp4KRXRSJ9razbRt9YZep9IW/xDNFQlrYne4QwtFVV29ib
P7F4lhKulKnB/Wx1jbMgiPulo/B++efgjLlGE7M5gvLIgBTOWa4Qs8o28kz2bSZi
SKoChYID6RTnXUKEjpEKb3CMsCD1K54deXs403Lg7pMK4DvDAvDRvtDh4K8d8y0b
xQg/PCNqKdd6fsV8mjdTaCFl7vejGOreUNtK232yMt6Hp6D58YD2AALbykRrUvqU
KrVGLytEqozNJA4o9IysN2Z4GkNdCgW0/xtMOzYJw+NXG5WFy8EmOaeBxYInx2xq
bDchU2O7ev1k/7qbJcRI69RvpKh6fz+v3MXDi1uTXajYcJVUvkQ=
=vW4R
-----END PGP SIGNATURE-----

--Sig_/.DwsGeDF5I9_umqvhpmzRP7--

--===============1767629554==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1767629554==--
