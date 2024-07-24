Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2912F93B451
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 17:53:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F4E10E73C;
	Wed, 24 Jul 2024 15:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QcKUKuYu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E2210E73C;
 Wed, 24 Jul 2024 15:53:53 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-70d2b921c48so2559507b3a.1; 
 Wed, 24 Jul 2024 08:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721836433; x=1722441233; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7wESv1LdQX+UtQLY9Z+JdLQpHYUmswcLuSV3X1wwd0A=;
 b=QcKUKuYuaPTpn/o+mhAuF8cmacOtJgZN1MO2JxL33v5PsZoPlWiVq0iXpDM/qbckAa
 nE3DFl2DXfAh9yXpFV/sIArgSycUgdq0Tu/BwFoKJkb1t9K8vG1ltA/BrVhOHQNbx6mp
 uCC9sf5o9DOnwDpDcXnCmoRzsl5Fk0/PmsESYdY7myWmnTcPE9xwUsrmNnp7CHosAcSs
 Kck5xBEfFTRzEUJMzBGPqr51JiYidfkdeM6CjK9LEOCIGcKhQk/mWsA1Ag65zAwvEHxL
 qR6lpu0s3yTyLtFAZRwEpMwn86yAFvtuVeVTj0EtZOCe2fxTC5ZZF9cMkbATXmxSGwch
 0m5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721836433; x=1722441233;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7wESv1LdQX+UtQLY9Z+JdLQpHYUmswcLuSV3X1wwd0A=;
 b=c5KIjPqMj8l1A9pA7s+GXvLxBAO8E6JnBgBH5HJDFgS1e7J97WntU1WBBOL2CN+c3t
 hlQ34cBFQJDzsabb3WV8EkPyRx521h8C+V+XpiYcfcyZIz9RxnKYmSRCUv3diPRP5Wrn
 Rb6ojDlr4KybAdfoRu5FHUlyfBPhaEiNX1fKnxSfGWHmvTjki2rjc7KEZlQ3eP9R8YTe
 Wo7tWp3stn1yLCdKKoYj09Em8iGrnUzNt2FXnGEu970uqaSZ3yv8jz+nMq7XFNZTZhTx
 MHufNZu4cx8ZAug6AuNXG54iDVkWFpwRjdvcKWT9f44/c7te8zH/v8SZeFik0Yl9WHfg
 yAcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkcZXEObxvIwY1wFQUofWKZFoMJjwJ1AAKg1KSisoobwFXQZns9W6myf+geu32yz85XmEH2ZvW9r2N4rd5MzB670IA9hRJjJ+3eJKZM3E5uROHTUe69H2nE0RnDbEHZGCZmdD1moawKoxoftDy/g==
X-Gm-Message-State: AOJu0YwcapOCs5lBmcTooWNfWRU5qft6/33gbFU4uKgdRE6GpykmQy6K
 GRY+kl0N/cm8+2zDgWdHHkjcq34sxKhVSczcnBCCSKE+G0/Q+4P35CC1TFq2XrNXwVZzPZk1+yi
 6zk99pNXOWc3ynuVGeIF0y13lK2Y=
X-Google-Smtp-Source: AGHT+IGkCbnRIx7IFaeYonMZlkeB3XKEqfo4q/s8I6cwOjZDrKDaz9jQ8V6eHBbJAVGM5xL2TR+fVuMexk4s3VvjGLo=
X-Received: by 2002:a05:6a20:4315:b0:1c3:a411:dc49 with SMTP id
 adf61e73a8af0-1c472c602e0mr292435637.51.1721836432973; Wed, 24 Jul 2024
 08:53:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240623-amdgpu-min-backlight-quirk-v2-0-cecf7f49da9b@weissschuh.net>
 <e61010e4-cb49-44d6-8f0d-044a193d29b2@redhat.com>
 <51f68b3b-dd21-44ef-8ec8-05bea5db6e55@t-8ch.de>
 <6db5abf9-cbdd-4ec0-b669-5df23de6c2ad@redhat.com> <87sevzf9pw.fsf@intel.com>
In-Reply-To: <87sevzf9pw.fsf@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 24 Jul 2024 11:53:41 -0400
Message-ID: <CADnq5_PC4u_nTKsB0dwr2UyXNu9+2EJd+KEYjBdpbBototkwOQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] drm: backlight quirk infrastructure and lower
 minimum for Framework AMD 13
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>,
 Matt Hartley <matt.hartley@gmail.com>, 
 Kieran Levin <ktl@framework.net>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dustin Howett <dustin@howett.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 24, 2024 at 4:58=E2=80=AFAM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Thu, 18 Jul 2024, Hans de Goede <hdegoede@redhat.com> wrote:
> > Hi Thomas,
> >
> > On 6/24/24 6:15 PM, Thomas Wei=C3=9Fschuh wrote:
> >> Hi Hans!
> >>
> >> thanks for your feedback!
> >>
> >> On 2024-06-24 11:11:40+0000, Hans de Goede wrote:
> >>> On 6/23/24 10:51 AM, Thomas Wei=C3=9Fschuh wrote:
> >>>> The value of "min_input_signal" returned from ATIF on a Framework AM=
D 13
> >>>> is "12". This leads to a fairly bright minimum display backlight.
> >>>>
> >>>> Add a generic quirk infrastructure for backlight configuration to
> >>>> override the settings provided by the firmware.
> >>>> Also add amdgpu as a user of that infrastructure and a quirk for the
> >>>> Framework 13 matte panel.
> >>>> Most likely this will also work for the glossy panel, but I can't te=
st
> >>>> that.
> >>>>
> >>>> One solution would be a fixed firmware version, but given that the
> >>>> problem exists since the release of the hardware, it has been known =
for
> >>>> a month that the hardware can go lower and there was no acknowledgme=
nt
> >>>> from Framework in any way, I'd like to explore this alternative
> >>>> way forward.
> >>>
> >>> There are many panels where the brightness can go lower then the adve=
rtised
> >>> minimum brightness by the firmware (e.g. VBT for i915). For most user=
s
> >>> the minimum brightness is fine, especially since going lower often ma=
y lead
> >>> to an unreadable screen when indoors (not in the full sun) during day=
light
> >>> hours. And some users get confused by the unreadable screen and find =
it
> >>> hard to recover things from this state.
> >>
> >> There are a fair amount of complaints on the Framework forums about th=
is.
> >> And that specific panel is actually readable even at 0% PWM.
> >
> > If a lot of Framework users are complaining about this, then maybe Fram=
ework
> > should fix their VBT in a BIOS update ?  That seems like a better solut=
ion
> > then quirking this in the kernel.
> >
> >>
> >>> So IMHO we should not be overriding the minimum brightness from the f=
irmware
> >>> using quirks because:
> >>>
> >>> a) This is going to be an endless game of whack-a-mole
> >>
> >> Indeed, but IMO it is better to maintain the list in the kernel than
> >> forcing all users to resort to random forum advise and fiddle with
> >> lowlevel system configuration.
> >
> > One of the problem is that what is an acceptable minimum brightness
> > value is subjective. One person's "still too bright" is another
> > person's "barely readable"
>
> Side note, IIRC the minimum brightness in VBT was not originally about
> subjective minimums, but rather to avoid electrical issues that 0% PWM
> caused in some board designs.

It's the same on AMD.  There was undesirable behavior on some panels
if the level dropped below a certain threshold.

Alex

>
> BR,
> Jani.
>
>
> >
> >>> b) The new value may be too low for certain users / use-cases
> >>
> >> The various userspace wrappers already are applying a safety
> >> threshold to not go to "0".
> >> At least gnome-settings-daemon and brightnessctl do not go below 1% of
> >> brightness_max. They already have to deal with panels that can go
> >> completely dark.
> >
> > Right, something which was added because the minimum brightness value
> > on VBTs often is broken. Either it is missing or (subjectively) it is
> > too high.
> >
> >
> >>> With that said I realize that there are also many users who want to h=
ave
> >>> a lower minimum brightness value for use in the evening, since they f=
ind
> >>> the available minimum value still too bright. I know some people want=
 this
> >>> for e.g. various ThinkPad models too.
> >>
> >> From my experience with ThinkPads, the default brightness range there
> >> was fine for me. But on the Framework 13 AMD it is not.
> >>
> >>> So rather then quirking this, with the above mentioned disadvantages =
I believe
> >>> that it would be better to extend the existing video=3DeDP-1:.... ker=
nel
> >>> commandline parsing to allow overriding the minimum brightness in a d=
river
> >>> agnostic way.
> >>
> >> I'm not a fan. It seems much too complicated for most users.
> >
> > Wanting lower minimum brightness really is mostly a power-user thing
> > and what is the right value is somewhat subjective and this is an often
> > heard complained. I really believe that the kernel should NOT get in
> > the business of adding quirks for this. OTOH given that this is an ofte=
n
> > heard complaint having some generic mechanism to override the VBT value
> > would be good to have.
> >
> > As for this being too complicated, I fully agree that ideally things
> > should just work 100% OOTB, which is why I believe that a firmware fix
> > from Framework would be good. But when things do not work 100% adding
> > a kernel cmdline option is something which is regularly asked from user=
s /
> > found in support questions on fora so I don't think this is overly
> > complicated. I agree it is not ideal but IMHO it is workable.
> >
> > E.g. on Fedora it would simply be a question of users having to run:
> >
> > sudo grubby --update-kernel=3DALL --args=3D"video=3DeDP-1:min-brightnes=
s=3D1"
> >
> > will add the passed in argument to all currently installed (and
> > future) kernels.
> >
> >> Some more background to the Framework 13 AMD case:
> >> The same panel on the Intel variant already goes darker.
> >> The last responses we got from Framework didn't indicate that the high
> >> minimum brightness was intentional [0], [1].
> >> Coincidentally the "12" returned from ATIF matches
> >> AMDGPU_DM_DEFAULT_MIN_BACKLIGHT, so maybe the firmware is just not set
> >> up completely.
> >
> > Right, so I think this should be investigated closer and then get
> > framework to issue a BIOS fix, not add a quirk mechanism to the kernel.
> >
> > IIRC the amdgpu driver will use AMDGPU_DM_DEFAULT_MIN_BACKLIGHT when
> > that setting is 0 in the VBT.
> >
> >>
> >>> The minimum brightness override set this way will still need hooking =
up
> >>> in each driver separately but by using the video=3DeDP-1:... mechanis=
m
> >>> we can document how to do this in driver independent manner. since
> >>> I know there have been multiple requests for something like this in
> >>> the past I believe that having a single uniform way for users to do t=
his
> >>> will be good.
> >>>
> >>> Alternatively we could have each driver have a driver specific module=
-
> >>> parameter for this. Either way I think we need some way for users to
> >>> override this as a config/setting tweak rather then use quirks for th=
is.
> >>
> >> This also seems much too complicated for normal users.
> >
> > I agree that having a uniform way is better then having per driver
> > module options.
> >
> > Regards,
> >
> > Hans
> >
>
> --
> Jani Nikula, Intel
