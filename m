Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B42219945
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0846EA0D;
	Thu,  9 Jul 2020 07:05:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from script.cs.helsinki.fi (script.cs.helsinki.fi [128.214.11.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C2AE6E934
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 21:25:50 +0000 (UTC)
X-DKIM: Courier DKIM Filter v0.50+pk-2017-10-25 mail.cs.helsinki.fi Thu,
 09 Jul 2020 00:25:46 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs.helsinki.fi;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :mime-version:content-type:content-id; s=dkim20130528; bh=Ldcq8Y
 jQQzjUryryJ00FcZqtPpDK4MAQRjec8Smv/wQ=; b=ViS2Hdeu3Of64gZdS8EtF2
 IRw7lHC7sBBa5tnG2WPfD8zv/Pb59KBOM91FI2hSKli4uw+Z29+5k+y6NwCrzi3H
 tvnCl6w3dIlu4LN6JGMVbuFir5khRj5LB4WKNTZt+0x4tUKpFb73LR8cIJSXqJio
 JonVfY64Izz+hQPYvYo2o=
Received: from whs-18.cs.helsinki.fi (whs-18.cs.helsinki.fi [128.214.166.46])
 (TLS: TLSv1/SSLv3,256bits,AES256-GCM-SHA384)
 by mail.cs.helsinki.fi with ESMTPS; Thu, 09 Jul 2020 00:25:46 +0300
 id 00000000005A014E.000000005F0639DA.00005CC1
Date: Thu, 9 Jul 2020 00:25:41 +0300 (EEST)
From: "=?ISO-8859-15?Q?Ilpo_J=E4rvinen?=" <ilpo.jarvinen@cs.helsinki.fi>
X-X-Sender: ijjarvin@whs-18.cs.helsinki.fi
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: drm/ast something ate high-res modes (5.3->5.6 regression)
In-Reply-To: <a70e10d9-6574-a4a1-28c6-fd1c3f367afb@suse.de>
Message-ID: <alpine.DEB.2.20.2007081753160.12041@whs-18.cs.helsinki.fi>
References: <alpine.DEB.2.20.2007081246050.12041@whs-18.cs.helsinki.fi>
 <f2b36a2e-baf7-ea23-fdb5-bfb7c54c0f4f@suse.de>
 <alpine.DEB.2.20.2007081638020.12041@whs-18.cs.helsinki.fi>
 <930a059f-ce19-f479-3345-0bc8c3d27518@suse.de>
 <CAKMK7uEuEaJmzooodx-wZgOK3rPT_r74dZic+UWGwT-GrE-Uww@mail.gmail.com>
 <a70e10d9-6574-a4a1-28c6-fd1c3f367afb@suse.de>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=_script-23769-1594243546-0001-2"
Content-ID: <alpine.DEB.2.20.2007090022130.12041@whs-18.cs.helsinki.fi>
X-Mailman-Approved-At: Thu, 09 Jul 2020 07:05:03 +0000
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_script-23769-1594243546-0001-2
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-ID: <alpine.DEB.2.20.2007090022131.12041@whs-18.cs.helsinki.fi>

On Wed, 8 Jul 2020, Thomas Zimmermann wrote:

> Am 08.07.20 um 16:26 schrieb Daniel Vetter:
> > On Wed, Jul 8, 2020 at 4:22 PM Thomas Zimmermann <tzimmermann@suse.de=
> wrote:
> >>
> >> Am 08.07.20 um 15:46 schrieb Ilpo J=E4rvinen:
> >>> On Wed, 8 Jul 2020, Thomas Zimmermann wrote:
> >>>
> >>>> Am 08.07.20 um 12:05 schrieb Ilpo J=E4rvinen:
> >>>>>
> >>>>> After upgrading kernel from 5.3 series to 5.6.16 something seems =
to
> >>>>> prevent me from achieving high resolutions with the ast driver.
> >>>>
> >>>> Thanks for reporting. It's not a bug, but a side effect of atomic
> >>>> modesetting.
> >>>>
> >>>> During pageflips, the old code used to kick out the currently disp=
layed
> >>>> framebuffer and then load in the new one. If that failed, the disp=
lay
> >>>> went garbage.
> >>>>
> >>>> In v5.6-rc1, we merged atomic modesetting for ast. This means that
> >>>> screen updates are more reliable, but we have to over-commit resou=
rces.
> >>>> Specifically, we have to reserve space for two buffers in video me=
mory
> >>>> while a pageflip happens. 1920x1200@32 are ~9MiB of framebuffer me=
mory.
> >>>> If your device has 16 MiB of VRAM, there's no space left for the s=
econd
> >>>> framebuffer. Hence, the resolution is no longer supported.
> >>>>
> >>>> On the positive side, you can now use Wayland compositors with ast=
.
> >>>> Atomic modesetting adds the necessary interfaces.
> >>>
> >>> Ok, thanks for the info although it's quite disappointing (not the =
first
> >>> time to lose features with kms, migrating to it made me to lose dpm=
s) ;-).
> >=20
> > kms still has dpms, not sure what you mean here? Maybe some driver
> > doesn't implement it.

Yes I know (it related only to in-kernel ast driver lacking it).

> >>> As it's quite annoying to lose a high resolution mode (or be stuck =
in
> >>> some old kernel), would it be technically feasible to make the fram=
ebuffer
> >>> allocation asymmetrical? That is, the switch to high-res mode would =
get
> >>> rejected when it would be into the smaller of the two buffers but n=
ot when
> >>> the arrangement is the other way around?
> >>
> >> I'm not sure what you mean here, but generally, there's no way of fi=
xing
> >> this without performance penalty.
> >>
> >> The screen resolution is only programmed once. Later updates only
> >> require pageflips. For each pageflip, atomic modesetting requires th=
e
> >> new and the old framebuffer in video memory at the same time. These =
two
> >> framebuffers are typically allocated once by Gnome/KDE/etc composito=
rs,
> >> and compositors go back and forth between them. It's basically doubl=
e
> >> buffering.

Ah, so there is a technical obstacle. I thought that those 2nd copies of=20
buffers are only necessary during a switch from one resolution to another=20
one.

> > You can do high-res mode I think, maybe needs a driver option to allo=
w
> > it to avoid upsetting existing compositors. Roughly:
> > 1. dpms off
> > 2. allocate big buffer
> > 3. dpms on in high res mode with that single buffer
> >=20
> > Pageflip will fail ofc with ENOSPC, but kms itself doesn't disallow
> > this. We could even implement this fairly generic, with a setcap flag=
,
> > which makes the probe helpers _not_ filter out modes which wouldn't
> > fit at least 2 framebuffers at the same time.

I cannot really understand full impact of this (what would not work).

> Technically you can hack up something, but what's the benefit for the
> overall ecosystem?
>=20
> In my other reply, I was rather talking about replacing VRAM helpers
> with SHMEM helpers. That would imply a memcpy from system into video
> memory on each pageflip.
>=20
> OTOH, ast currently recommends using a shadow framebuffer, so userspace
> probably already does the memcpy somewhere. And now that SHMEM helpers
> can easily do cached page mappings, the performance difference might no=
t
> be significant. Maybe I should give it a try.

I'd highly appreciate that (but I guess I might quite small minority
when it comes to "ecosystems" :-)). And I wouldn't be too worried about=20
performance penalty.


--=20
 i.
--=_script-23769-1594243546-0001-2
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=_script-23769-1594243546-0001-2--
