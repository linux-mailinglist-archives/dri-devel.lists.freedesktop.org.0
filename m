Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0706564375C
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 22:51:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BDEC10E2B5;
	Mon,  5 Dec 2022 21:51:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8616410E2B5
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 21:51:06 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id t5so12436639vsh.8
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Dec 2022 13:51:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mFdsLFzswFTMipJStVwFiJsipVOV+7MBmY79S1gML8g=;
 b=aqw2B62BGV0LbgLztoYS3TIxVS5A+aWI/uuM7uUCTHWZfLLBiYN8ARiycZi+WNuAom
 df47Aj5h7DPKbdsJ8re3TgGhZLVNZtwIRixCIhx8tW6els/z2dYYt2afbM/sBGzDvpNt
 nouSFNODc1Ka4DnZ6wwNdOAOQnu6GxpXTOZyU7zj2zW5cZLTZA8OUikryHE9u/+qtNwy
 VmQYcn4LpHAYeeamarEXET67D5iRxxX8keQUhLQDGiymxL1l12omETTuBTKXVjUrBbTv
 /0ysd4iBgCovZ2fhfR/06jhqkavBBOGFviX6wJom8JKmu3NdBzVpSXJs+ah/qipMpdcZ
 Nmng==
X-Gm-Message-State: ANoB5pn5M3Aq+JUaKdR27agP7YiSaOCU7shiJgVS32aILOqq2vBkcfgr
 SYnWvIwjP5czfCxv59OUzA98Z5vChULeCw==
X-Google-Smtp-Source: AA0mqf7fvjr2/Mw1TjAqAe3dNtgsABGnublF1bHiuY9jIucp06UoU0Mf9Eh0C3hu15B3NRuO/7liiA==
X-Received: by 2002:a05:6102:5785:b0:3b0:7178:7fe8 with SMTP id
 dh5-20020a056102578500b003b071787fe8mr31977119vsb.38.1670277065122; 
 Mon, 05 Dec 2022 13:51:05 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com.
 [209.85.217.44]) by smtp.gmail.com with ESMTPSA id
 y25-20020a67e8d9000000b003a7717485e8sm2088355vsn.2.2022.12.05.13.51.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 13:51:04 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id 128so12413143vsz.12
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Dec 2022 13:51:04 -0800 (PST)
X-Received: by 2002:a05:6102:2221:b0:3b0:4a83:954d with SMTP id
 d1-20020a056102222100b003b04a83954dmr38222003vsb.62.1670277064155; Mon, 05
 Dec 2022 13:51:04 -0800 (PST)
MIME-Version: 1.0
References: <CAEdEoBYXHq9cCzsbMYTpG1B41Yz=-QAjFx7bJDOnPanN5Tmo7A@mail.gmail.com>
 <20221204175142.658d5c37.alex.williamson@redhat.com>
 <1e4d62cf-8893-0bff-51f5-5a2e419ed5a0@suse.de>
 <CAEdEoBYZa9cg0nq=P7EDsDS9m2EKYrd8M8ucqi8U0Csj0mtjDg@mail.gmail.com>
 <c1c8bfa5-8ba4-c365-1663-535f656ca353@suse.de>
In-Reply-To: <c1c8bfa5-8ba4-c365-1663-535f656ca353@suse.de>
From: "mb@lab.how" <mb@lab.how>
Date: Mon, 5 Dec 2022 14:50:52 -0700
X-Gmail-Original-Message-ID: <CAEdEoBaixaTEuNfQGv1das7TwHKV9MiRMKQM0kLspveJmipzyg@mail.gmail.com>
Message-ID: <CAEdEoBaixaTEuNfQGv1das7TwHKV9MiRMKQM0kLspveJmipzyg@mail.gmail.com>
Subject: Re: [PATCH 2/2] vfio/pci: Remove console drivers
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: kvm@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Williamson <alex.williamson@redhat.com>,
 kraxel@redhat.com, lersek@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Mon, Dec 5, 2022 at 3:11 AM Thomas Zimmermann <tzimmermann@suse.de> wrot=
e:
>
> Hi
>
> Am 05.12.22 um 10:32 schrieb mb@lab.how:
> > I have a rtx 3070 and a 3090, I am absolutely sure I am binding vfio-pc=
i
> > to the 3090 and not the 3070.
> >
> > I have bound the driver in two different ways, first by passing the IDs
> > to the module and alternatively by manipulating the system interface an=
d
> > use the override (this is what I originally had to do when I used two
> > 1080s, so I know it works).
> >
> > While the 3090 doesn't show a console, there's a remnant from the refun=
d
> > (and grub previously) there.
> >
> > The assessment Alex made previously, where
> > aperture_remove_conflicting_pci_devices() is removing the driver (EFIFB=
)
> > instead of the device seems correct, but it could also can be a quirky
> > of how EFIFB is implemented. I recall reading a long time ago that EFIF=
B
> > is a special device and once it detects changes it would simply give up=
.
> > There was also no way to attach a device to it again as it depends on
> > being preloaded outside the kernel; once something takes over the buffe=
r
> > reinitializing is "impossible". I never went deeper to try and
> > understand it.
>
> We recently reworked fbdev's interaction with the aperture helpers. [1]
> All devices should now be removed iff the driver has been bound to it
> (which should be the case here) The patches went into an v6.1-rc.
>
> Could you try the most recent v6.1-rc and report if this fixes the proble=
m?

I just tried the latest one, v6.1-rc8, and I can see all the commits
for the series you mentioned there.

The same freeze behavior happens when I load vfio-pci:

[ 6.525463] VFIO - User Level meta-driver version: 0.3
[ 6.528231] Console: switching to colour dummy device 320x90

--
Carlos

>
> Best regards
> Thomas
>
> [1] https://patchwork.freedesktop.org/series/106040/
>
> >
> >
> > On Mon, Dec 5, 2022, 2:00 AM Thomas Zimmermann <tzimmermann@suse.de
> > <mailto:tzimmermann@suse.de>> wrote:
> >
> >     Hi
> >
> >     Am 05.12.22 um 01:51 schrieb Alex Williamson:
> >      > On Sat, 3 Dec 2022 17:12:38 -0700
> >      > "mb@lab.how" <mb@lab.how> wrote:
> >      >
> >      >> Hi,
> >      >>
> >      >> I hope it is ok to reply to this old thread.
> >      >
> >      > It is, but the only relic of the thread is the subject.  For
> >     reference,
> >      > the latest version of this posted is here:
> >      >
> >      >
> >     https://lore.kernel.org/all/20220622140134.12763-4-tzimmermann@suse=
.de/ <https://lore.kernel.org/all/20220622140134.12763-4-tzimmermann@suse.d=
e/>
> >      >
> >      > Which is committed as:
> >      >
> >      > d17378062079 ("vfio/pci: Remove console drivers")
> >      >
> >      >> Unfortunately, I found a
> >      >> problem only now after upgrading to 6.0.
> >      >>
> >      >> My setup has multiple GPUs (2), and I depend on EFIFB to have a
> >     working console.
> >
> >     Which GPUs do you have?
> >
> >      >> pre-patch behavior, when I bind the vfio-pci to my secondary GP=
U
> >     both
> >      >> the passthrough and the EFIFB keep working fine.
> >      >> post-patch behavior, when I bind the vfio-pci to the secondary =
GPU,
> >      >> the EFIFB disappears from the system, binding the console to th=
e
> >      >> "dummy console".
> >
> >     The efifb would likely use the first GPU. And vfio-pci should only
> >     remove the generic driver from the second device. Are you sure that
> >     you're not somehow using the first GPU with vfio-pci.
> >
> >      >> Whenever you try to access the terminal, you have the screen
> >     stuck in
> >      >> whatever was the last buffer content, which gives the impressio=
n of
> >      >> "freezing," but I can still type.
> >      >> Everything else works, including the passthrough.
> >      >
> >      > This sounds like the call to
> >     aperture_remove_conflicting_pci_devices()
> >      > is removing the conflicting driver itself rather than removing t=
he
> >      > device from the driver.  Is it not possible to unbind the GPU fr=
om
> >      > efifb before binding the GPU to vfio-pci to effectively nullify =
the
> >      > added call?
> >      >
> >      >> I can only think about a few options:
> >      >>
> >      >> - Is there a way to have EFIFB show up again? After all it look=
s
> >     like
> >      >> the kernel has just abandoned it, but the buffer is still there=
. I
> >      >> can't find a single message about the secondary card and EFIFB =
in
> >      >> dmesg, but there's a message for the primary card and EFIFB.
> >      >> - Can we have a boolean controlling the behavior of vfio-pci
> >      >> altogether or at least controlling the behavior of vfio-pci for=
 that
> >      >> specific ID? I know there's already some option for vfio-pci an=
d VGA
> >      >> cards, would it be appropriate to attach this behavior to that
> >     option?
> >      >
> >      > I suppose we could have an opt-out module option on vfio-pci to =
skip
> >      > the above call, but clearly it would be better if things worked =
by
> >      > default.  We cannot make full use of GPUs with vfio-pci if they'=
re
> >      > still in use by host console drivers.  The intention was certain=
ly to
> >      > unbind the device from any low level drivers rather than disable
> >     use of
> >      > a console driver entirely.  DRM/GPU folks, is that possibly an
> >      > interface we could implement?  Thanks,
> >
> >     When vfio-pci gives the GPU device to the guest, which driver drive=
r is
> >     bound to it?
> >
> >     Best regards
> >     Thomas
> >
> >      >
> >      > Alex
> >      >
> >
> >     --
> >     Thomas Zimmermann
> >     Graphics Driver Developer
> >     SUSE Software Solutions Germany GmbH
> >     Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> >     (HRB 36809, AG N=C3=BCrnberg)
> >     Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
> >
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
