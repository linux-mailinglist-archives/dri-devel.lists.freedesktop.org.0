Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E39F32D732A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 10:55:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B5C6ED13;
	Fri, 11 Dec 2020 09:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B18736ED13;
 Fri, 11 Dec 2020 09:55:55 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id q8so10164137ljc.12;
 Fri, 11 Dec 2020 01:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=ec8nrJ3BHmkvFkJYpa3DJInSm4Zuq16AccjQk9m2YHA=;
 b=mmHAzsm9fShYxE5Ts0TZHuNpKVeFyP/7z0+tUjdf3GdmI7s7k9UOIDa0P13XsXXyDa
 TZH88mlFCDjpER2lbgZ/ywv8GuvyBaxOOj70AR56mUGxh7C/d2kvLtoZK2eu4r4kGCNL
 fchYzXJEiJNYBZHzelOXrODcniV53LmQAszDwaPgB2oO9YmAfqouxdViHa/rHPN2Lo2G
 6Xd+cVlg5jmN85+zzanpJBlHGjEV49NVry7p5/Yy+p0PaEiOaakgz7MckyXTNdWtw0hL
 L72GGmdE3tRXvCWCsDn52SGCV/fgMDWDsaeGgRhiQRcdMs1+qzwWv0JfQgZopkue9WPJ
 X6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=ec8nrJ3BHmkvFkJYpa3DJInSm4Zuq16AccjQk9m2YHA=;
 b=gu968Yvx/bZFiBhJ4r53Vn3AnlCIheo7Q7nNm8fKmeXa7Z3Roe+rseXvlE1zcrQ4pk
 Yw1Qi/8eo+qbn2myKilqTX0PKG2j1BEaahySycbS0Nnx2a8mcN1T9PjQYaT7pRxH23ii
 0e/fUfzOKyGPPtgPhBlZFcl+t/vnpSwduQ07uixZgUcoC2O2bujFBMHk6lbvchgTE3W6
 4T7hvenqKzdInQMbmzwU3v8gJaF/G+VZ/aWxofLI02Sr5uGGFwPfpbALMMsOxryKr0CC
 ha2YmspUx2MOa7BWtQyS2YKB9T6eAsJUoQI+rqdTMIpeuEgmPsT7IHsRppC/hGfFML/U
 qrsQ==
X-Gm-Message-State: AOAM532jdbmikvAWUCaWfiIDzbO8aqTk+Eju5lhjkBzEi3Hko3ObRtMc
 b49K3ggKaRKQVCUqEt1QDU4=
X-Google-Smtp-Source: ABdhPJwJ4Ga8w7iOsspXILg6HHGomblmFJBLnqY9ajYDiMkCDeXxY8iw5IeUuxt7QTleHCkBmjtCLA==
X-Received: by 2002:a2e:8599:: with SMTP id b25mr3261214lji.334.1607680554067; 
 Fri, 11 Dec 2020 01:55:54 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id 126sm827455lfo.14.2020.12.11.01.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 01:55:53 -0800 (PST)
Date: Fri, 11 Dec 2020 11:55:49 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Shashank Sharma <shashank.sharma@amd.com>
Subject: Re: [PATCH v2 0/3] Experimental freesync video mode optimization
Message-ID: <20201211115549.32ade81b@eldfell>
In-Reply-To: <0b7132b8-a890-b4f0-0a0c-260015fa0bbb@amd.com>
References: <20201210184823.285415-1-aurabindo.pillai@amd.com>
 <MC46k2jDYAeDTZaSlv6T5iIq5ibkh2yYwW3KZ-XLXLwoRByjkWsEr6-6eQM4iZqmkiLoleyh84S290ytAub0bK-esJje1OGKIEilcz_iikY=@emersion.fr>
 <0b7132b8-a890-b4f0-0a0c-260015fa0bbb@amd.com>
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
Cc: stylon.wang@amd.com, thong.thai@amd.com, amd-gfx@lists.freedesktop.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, wayne.lin@amd.com,
 alexander.deucher@amd.com, nicholas.kazlauskas@amd.com
Content-Type: multipart/mixed; boundary="===============0638313202=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0638313202==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/sc2E2H/FaS_aHR/8gjzdRSu"; protocol="application/pgp-signature"

--Sig_/sc2E2H/FaS_aHR/8gjzdRSu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 11 Dec 2020 09:56:07 +0530
Shashank Sharma <shashank.sharma@amd.com> wrote:

> Hello Simon,
>=20
> Hope you are doing well,
>=20
> I was helping out Aurabindo and the team with the design, so I have
> taken the liberty of adding some comments on behalf of the team,
> Inline.
>=20
> On 11/12/20 3:31 am, Simon Ser wrote:
> > Hi,
> >
> > (CC dri-devel, Pekka and Martin who might be interested in this as
> > well.)

Thanks for the Cc! This is very interesting to me, and because it was
not Cc'd to dri-devel@ originally, I would have missed this otherwise.

> >
> > On Thursday, December 10th, 2020 at 7:48 PM, Aurabindo Pillai <aurabind=
o.pillai@amd.com> wrote:
> > =20
> >> This patchset enables freesync video mode usecase where the userspace
> >> can request a freesync compatible video mode such that switching to th=
is
> >> mode does not trigger blanking.
> >>
> >> This feature is guarded by a module parameter which is disabled by
> >> default. Enabling this paramters adds additional modes to the driver
> >> modelist, and also enables the optimization to skip modeset when using
> >> one of these modes. =20
> > Thanks for working on this, it's an interesting feature! However I'd li=
ke to
> > take some time to think about the user-space API for this.
> >
> > As I understand it, some new synthetic modes are added, and user-space =
can
> > perform a test-only atomic *without* ALLOW_MODESET to figure out whethe=
r it can
> > switch to a mode without blanking the screen. =20
>=20
> The implementation is in those lines, but a bit different. The idea
> is to:
>=20
> - check if the monitor supports VRR,
>=20
> - If it does, add some new modes which are in the VRR tolerance
> range, as new video modes in the list (with driver flag).
>=20
> - when you get modeset on any of these modes, skip the full modeset,
> and just adjust the front_porch timing
>=20
> so they are not test-only as such, for any user-space these modes
> will be as real as any other probed modes of the list.

But is it worth to allow a modeset to be glitch-free if the userspace
does not know they are glitch-free? I think if this is going in, it
would be really useful to give the guarantees to userspace explicitly,
and not leave this feature at an "accidentally no glitch sometimes"
level.


I have been expecting and hoping for the ability to change video mode
timings without a modeset ever since I learnt that VRR is about
front-porch adjustment, quite a while ago.

This is how I envision userspace making use of it:

Let us have a Wayland compositor, which uses fixed-frequency video
modes, because it wants predictable vblank cycles. IOW, it will not
enable VRR as such.

When the Wayland compositor starts, it will choose *some* video mode
for an output. It may or may not be what a KMS driver calls "preferred
mode", because it depends on things like user preferences. The
compositor makes the initial modeset to this mode.

Use case 1:

A Wayland client comes up and determines that its window would really
like a refresh rate of, say, 47.5 Hz. Yes, it's not a traditional video
player rate, but let's assume the application has its reasons. The
client tells the compositor this (Wayland protocol still to be designed
to be able to do that). (Hey, this could be how future games should
implement refresh rate controls in cooperation with the window system.)

The compositor sees the wish, and according to its complex policy
rules, determines that yes, it shall try to honor that wish by changing
the whole output temporarily to 47.5 Hz if possible.

The compositor takes the original video mode it modeset on the output,
and adjusts the front-porch to create a new custom 47.5 Hz mode. Using
this mode, the compositor does a TEST_ONLY atomic commit *without*
ALLOW_MODESET.

If the test commit succeeds, the compositor knows that changing timings
will not cause any kind of glitch, flicker, blanking, or freeze, and
proceeds to commit this video mode without ALLOW_MODESET. The whole
output becomes 47.5 Hz until the compositor policy again determines
that it is time to change, e.g. to go back to the original mode. Going
back to the original mode also needs to work without ALLOW_MODESET -
but a compositor cannot test for this with atomic TEST_ONLY commits.

If the test commit fails, the compositor knows that it cannot change
the timings like this without risking a visible glitch. Therefore the
compositor does not change the video mode timings, and the client's
wish is not granted.

The client adapts to whatever the refresh rate is in any case.

Use case 2:

A client comes up, and starts presenting frames with a target timestamp
(Wayland protocol for this still to be designed). The compositor
analyzes the target timestamp, and according to the complex compositor
policy, determines that it should try to adjust video mode timings to
better meet the target timestamps.

Like in use case 1, the compositor creates a new custom video mode and
tests if it can be applied without any glitch. If yes, it is used. If
not, it is not used.

This use case is more complicated, because the video mode timing
changes may happen refresh by refresh, which means they need to
apply for the very next front-porch in the scanout cycle in
hardware. Hence, I'm not sure this use case is realistic. It can also
be argued that this is better implemented by just enabling VRR and
handling the flip timing in userspace, in the compositor: issue an
atomic flip at the exact time it needs to be executed instead of
issuing it well in advance and letting the driver wait for vblank.


Worth to note: neither case needs the kernel to expose new manufactured
video modes. Whether the feature is available or not is detected by an
atomic TEST_ONLY commit without ALLOW_MODESET.

> > However the exact modes amdgpu adds are just some guesses. I think it w=
ould be
> > great if user-space could control the min/max refresh rate values direc=
tly.

Setting min=3D=3Dmax could be used to achieve the fixed refresh rate
proposed here, but it would also allow setting custom min < max limits.
This would be more flexible, but I'm not sure what the use case for it
could look like... oh, there are the use cases mentioned below: user
preferences. :-)

Maybe the min/max setting is better than fiddling with custom video
modes. If we have min/max to control, then there is no problem with
going back to the "original" video mode like in my example use case 1.

> > Not only this would remove the need for the kernel to hard-code "well-k=
nown
> > video refresh rates", but this would also enable more use-cases. For in=
stance
> > some users might want to mitigate flickering on their screen by reducin=
g the
> > VRR range. Some users might want to lower their screen refresh rate for=
 power
> > savings.
> >
> > What do you think? Would you be fine with adding min/max VRR range prop=
erties?
> >
> > If you're scared about the user-space code requirement, I can
> > provide that. =20
>=20
> This sounds like a reasonable approach, and there is no reason why we
> can't do this if we have the proper userspace support as you
> mentioned.

Maybe the min/max controls are the way to go, considering that
the seamless refresh rate change feature in general cannot be
implemented without VRR. Or can it?

But if it can be implemented while not supporting VRR on some hardware,
then the video mode fiddling without ALLOW_MODESET is still a usable
approach. Or maybe such a driver could special-case VRR=3Denabled &&
min=3D=3Dmax.

Yeah, min/max controls seems like the best idea to me so far.


Thanks,
pq

--Sig_/sc2E2H/FaS_aHR/8gjzdRSu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl/TQiYACgkQI1/ltBGq
qqfopw//fVciruESVXsiw+ZogKK/Z3KB169PFGFrC4g+46YxIG4kpTEOB6+WcFvU
/j/3pufRs1JW9Tl3ej+OwnbS9w0FFQ8+k/C/OO30/H0DWPJlM3Od+7R+Ixw7FqGF
t4Nd/RrdYx+GtgM5LH/3xheojprk9y146uJNRwv8NUmU31DdmVVcHliHwJNEiy+C
sN98Wy6MFf08LKXUqUJcD/qC2uM6jTJ6GBORG/uFzUkw2fyj1W8D6Q3ZD8P6BFei
TSKQFtjVvrubg0VT+ZjUYnlH4L7sUn5HmlNDYInADcQ27fXp1ddvqKce3q8fi5BG
PdPQrDfc1XJGEZ3JUOWQnWGJP5WW523fHDnAhwYyphfZKVkmGCGNdAxEWwbPFSpt
1rfwrPZJjhoFsnPVcwFs5Ki3EnkQ9rzK7epaG7DN4E6wm0NHuHSWeSpzNft9W62G
2PbgHMpR7KiA0KhhE3e4KMbuimGxQgC7cnoh77NBJ3BomJjy+VwT54BTJgG71gwq
n26QWkGFOkR/Y/3Hpvpa9P8uq4I/MExeBtmEo1mDugLCjzUc4WJNjHrZT8gQb1Of
PxfsuXvGt3sLn2ls8fd7PWvyJU9IlnPF40VcSF9TVsYyBvjDdgK8YhoTA6gmTGLQ
sIw+sLFdnoIIsO2G+bKVhoppl1wVsJK4ZO4sCthb4Uob3zfsTMM=
=AsQl
-----END PGP SIGNATURE-----

--Sig_/sc2E2H/FaS_aHR/8gjzdRSu--

--===============0638313202==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0638313202==--
