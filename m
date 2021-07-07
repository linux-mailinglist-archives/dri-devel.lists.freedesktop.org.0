Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EA83BE3E4
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 09:47:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443806E832;
	Wed,  7 Jul 2021 07:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7D36E832;
 Wed,  7 Jul 2021 07:47:36 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id p16so2495265lfc.5;
 Wed, 07 Jul 2021 00:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=1TdY4myhQ8IaVkto9nSWi+hcy06LlZ5KlP9L+J8KZEI=;
 b=oF3+m2Vh8mnFrwWV8KDZzbjDlOuzd5lscrP8G/ky8j/5LpNzwbJf9NigIF4SEG1UU7
 nv3ZK9YvgLT3E4QxDA7kbAzf0Z7NouDwm1j0OH1nK6FUyE48GGHOFQS7OSihmov8BhcC
 mOG6XSUDSMOTCSeT5fM82VxxSCnIciacPgKD54aUSHX8FXYhwe7I9TrRZmkH4pH58R0D
 vmyTW7zvLOC1WDUXgy+NLOtPyX9vivcZ3I4ziFTCKhTaY6b/C0gJ89CiONGWfptr65Ad
 loiSep8j03JOoj0dI7SdRajRrqvsel7of3GUWVnbc5YIYFk6pE+ifhyk3/SI/qMZoMOJ
 oOug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=1TdY4myhQ8IaVkto9nSWi+hcy06LlZ5KlP9L+J8KZEI=;
 b=AiwfQlOdBrpZntM49F0f9j7kKxGnh88P583YLGNgye69tS8ogH00GWsi09gB1ZRImb
 +hg9mkDIM41keP66rIfjW969ZVwX5QvyB564buTmKnKHD1kHHz4tYkl6aJDeljERbUTU
 rUXUJAWtJ+SNJkerdx5ZB1ObyFGY73NB5v3QNA7eR7Suo/lcQx5AvqX2pg0XD2e9N2fO
 ytC/rVrTYFsBDaXR63QIyjok2/rxNb9xSNjPpah4BJ5tQOUZLg4e1txPDg+xNEDZQd8n
 KDLmZdUV+wJlVW9KmNfjfwPt7VcCoA9SdWiGNrf6HJ81V6wqwB3Sbz/bQjMbuDeboNPc
 zO7w==
X-Gm-Message-State: AOAM53122GsLq2kggFR0OFYUFIOpxvm6xHWpKTfXfyP22UXCJFb26opB
 pZ8xFsxh4Mlip6r5QimmsrI=
X-Google-Smtp-Source: ABdhPJyQ5HtJiWSSgNz7zoAAbvo3RpRLhZs9fk0zv2wJgvIa7iAqc0iyzCtZv+DMjXjgQzha+6dWSA==
X-Received: by 2002:a19:4916:: with SMTP id w22mr18618461lfa.374.1625644054902; 
 Wed, 07 Jul 2021 00:47:34 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id r11sm920356ljp.9.2021.07.07.00.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 00:47:34 -0700 (PDT)
Date: Wed, 7 Jul 2021 10:47:31 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [Intel-gfx] [PATCH 47/47] drm/i915/guc: Unblock GuC submission
 on Gen11+
Message-ID: <20210707104731.5130a5a6@eldfell>
In-Reply-To: <cc3c280e-de31-555c-d1f8-369e361e13c5@intel.com>
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-48-matthew.brost@intel.com>
 <88cbe963-7188-f4ae-5acf-01a80bd2fe25@free.fr>
 <05e1d462-57ae-888a-888c-3ad486150821@intel.com>
 <20210701111410.3fc6551e@eldfell>
 <050296b9-8958-353a-9f76-699bfbafa1c1@free.fr>
 <CAKMK7uH1svoSEGa=sv+BsU4_BMou2sEJQWddQgy1XDMYtz7-Dw@mail.gmail.com>
 <20210702102944.3a8c4915@eldfell>
 <2d3b06c3-5f69-5045-191f-3fd705a3fb40@free.fr>
 <a7e1ab69-7d68-4f34-1c92-c32c6c38f8f0@intel.com>
 <7889d935-65fb-5f11-ac5d-f9d757b9ee84@free.fr>
 <cc3c280e-de31-555c-d1f8-369e361e13c5@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xZ4VoXGhLb5dERNS8AWvV5u";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/xZ4VoXGhLb5dERNS8AWvV5u
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 6 Jul 2021 17:57:35 -0700
John Harrison <john.c.harrison@intel.com> wrote:

> On 7/3/2021 01:21, Martin Peres wrote:
> > On 02/07/2021 18:07, Michal Wajdeczko wrote: =20
> >> On 02.07.2021 10:09, Martin Peres wrote: =20
> >>> On 02/07/2021 10:29, Pekka Paalanen wrote: =20
> >>>> On Thu, 1 Jul 2021 21:28:06 +0200
> >>>> Daniel Vetter <daniel@ffwll.ch> wrote:
> >>>> =20
> >>>>> On Thu, Jul 1, 2021 at 8:27 PM Martin Peres <martin.peres@free.fr>
> >>>>> wrote: =20
> >>>>>>
> >>>>>> On 01/07/2021 11:14, Pekka Paalanen wrote: =20
> >>>>>>> On Wed, 30 Jun 2021 11:58:25 -0700
> >>>>>>> John Harrison <john.c.harrison@intel.com> wrote: =20
> >>>>>>>> On 6/30/2021 01:22, Martin Peres wrote: =20
> >>>>>>>>> On 24/06/2021 10:05, Matthew Brost wrote: =20
> >>>>>>>>>> From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> >>>>>>>>>>
> >>>>>>>>>> Unblock GuC submission on Gen11+ platforms.
> >>>>>>>>>>
> >>>>>>>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >>>>>>>>>> Signed-off-by: Daniele Ceraolo Spurio
> >>>>>>>>>> <daniele.ceraolospurio@intel.com>
> >>>>>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >>>>>>>>>> ---
> >>>>>>>>>> drivers/gpu/drm/i915/gt/uc/intel_guc.h |=C2=A0 1 +
> >>>>>>>>>> drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c |=C2=A0 8 ++=
++++++
> >>>>>>>>>> drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h |=C2=A0 3 +--
> >>>>>>>>>> drivers/gpu/drm/i915/gt/uc/intel_uc.c | 14
> >>>>>>>>>> +++++++++-----
> >>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 4 files changed, 19 insertions(+), 7 =
deletions(-) =20
> >>>>>>>
> >>>>>>> ... =20
> >>>>>>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> >>>>>>>>>> b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> >>>>>>>>>> index 7a69c3c027e9..61be0aa81492 100644
> >>>>>>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> >>>>>>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> >>>>>>>>>> @@ -34,8 +34,15 @@ static void uc_expand_default_options(struct
> >>>>>>>>>> intel_uc *uc)
> >>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 return;
> >>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0 /* Default: enabl=
e HuC authentication only */
> >>>>>>>>>> -=C2=A0=C2=A0=C2=A0 i915->params.enable_guc =3D ENABLE_GUC_LOA=
D_HUC;
> >>>>>>>>>> +=C2=A0=C2=A0=C2=A0 /* Intermediate platforms are HuC authenti=
cation only */
> >>>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (IS_DG1(i915) || IS_ALDERLAKE_S(i915)) {
> >>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_dbg(&i915->drm=
, "Disabling GuC only due to old
> >>>>>>>>>> platform\n"); =20
> >>>>>>>>>
> >>>>>>>>> This comment does not seem accurate, given that DG1 is barely
> >>>>>>>>> out, and
> >>>>>>>>> ADL is not out yet. How about:
> >>>>>>>>>
> >>>>>>>>> "Disabling GuC on untested platforms"? =20
> >>>>>>>> Just because something is not in the shops yet does not mean it =
is
> >>>>>>>> new.
> >>>>>>>> Technology is always obsolete by the time it goes on sale. =20
> >>>>>>>
> >>>>>>> That is a very good reason to not use terminology like "new",=20
> >>>>>>> "old",
> >>>>>>> "current", "modern" etc. at all.
> >>>>>>>
> >>>>>>> End users like me definitely do not share your interpretation of
> >>>>>>> "old". =20
> >>>>>>
> >>>>>> Yep, old and new is relative. In the end, what matters is the
> >>>>>> validation
> >>>>>> effort, which is why I was proposing "untested platforms".
> >>>>>>
> >>>>>> Also, remember that you are not writing these messages for Intel
> >>>>>> engineers, but instead are writing for Linux *users*. =20
> >>>>>
> >>>>> It's drm_dbg. Users don't read this stuff, at least not users with =
no
> >>>>> clue what the driver does and stuff like that. =20
> >>>>
> >>>> If I had a problem, I would read it, and I have no clue what anything
> >>>> of that is. =20
> >>>
> >>> Exactly. =20
> I don't see how replacing 'old' for 'untested' helps anybody to=20
> understand anything. Untested just implies we can't be bothered to test=20
> stuff before publishing it. And as previously stated, this is purely a=20
> political decision not a technical one. Sure, change the message to be=20
> 'Disabling GuC submission but enabling HuC loading via GuC on platform=20
> XXX' if that makes it clearer what is going on. Or just drop the message=
=20
> completely. It's simply explaining what the default option is for the=20
> current platform which you can also get by reading the code. However, I=20
> disagree that 'untested' is the correct message. Quite a lot of testing=20
> has been happening on TGL+ with GuC submission enabled.

Hi,

it seems to me that "untested" was just a wrong guess, nothing more. It
was presented with "how about?", not as an exact demand.

You don't have to attack that word, just use another phrasing that is
both correct and not misleading to the majority of tech savvy people.


Thanks,
pq

--Sig_/xZ4VoXGhLb5dERNS8AWvV5u
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDlXBMACgkQI1/ltBGq
qqelnBAArMVRYEfsa+vCMzbuuMvZbX0lFL+0d7vUkds6FWTaFIA8MvKxaWBQw1L/
TRjofVYnOXxXed9Fuh2wwzjhH1rqGeiFwuifWjxuQDZeLWjHkAxQQHxZ3UlV1jAL
TkzeeMGmCYrZ0ap8hn8clFGQjzAkLbU4fPYp7ph5jri1EvnSJddMLp1vPK3bJpUF
6MOdYBVsAei4ReLl5fAq54968Zjm9VEqnbtKTjvp05XWpXylIE+9jX7cNpr0GzoT
OfaZ5DoI/Tk48d5qrH4fPC4lkFij2oxJWx5AxjejfbB8L/A/OHsocoxDm+ryJKRD
946/Jq9lx8qd0kob1CYX/uZ7Y2TL//NCBXhtb9HJfdSZvfak6zcwk8fa2ExhJ8wl
+d4/zcShVjgBUEX5bBCrD/I9w+iXW1FqQHImd+MWiXwFeZi5MexZrMZiUSlrmcS+
iUcNxMQTBUckjPCn/JMKuv2vl6z89lcLWVN04O9VaWuUzWBntYzGz1M5ZrRwpWAb
2Ue+AhN1vM0bDEqd6iR9LteaoDZF8tvUaJgwSpW9NYUe/5oYxowTfcsAhahju+xX
/2qxfdF1leB4EeT9VjTsTtmG1tSMqvL5DtE0VKwuDJPEUGXrG1TYtWOz4VBcXcn2
XauZIblV6NaMCgIWVW2vTLJ0RrzfJry2MtoluL8sw9nQ42W1BDo=
=4s5B
-----END PGP SIGNATURE-----

--Sig_/xZ4VoXGhLb5dERNS8AWvV5u--
