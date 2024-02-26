Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D09A867E41
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 18:23:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13CDF10E05A;
	Mon, 26 Feb 2024 17:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="et8ZXOVf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E4C10E1B6
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 17:23:42 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-608c40666e0so20968597b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 09:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1708968221; x=1709573021;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9ry8MSC5kBaUVxmaPXulfwti9eHH84wip0eIdZ+m7UA=;
 b=et8ZXOVfvvbFi/wG2lwPDu1YDTBYkAIEnZI9tTTZycvnQcm8zWGkGAJ8Oqz+ziPyf1
 nvuaSQs2UxSJqubrzJcPxf0aXZr3CPTbwEwwJyinGRmmFnv1y8MTA0mlQcOEJVLRg7OX
 ndV2pyHB0LPKDHyd7uMg8qV73fsBi54fSxmtFRCS5Z3V7RK4QxI1CH1+7Dx97CZTZXrM
 i9sU1/G1voioeHrsFX6ab15sRv1bKKWxCrbl0a0xCT2himn66DYlnu2LoovHjpLbabk1
 BH/ScMiuKR0e9FSYau8+rDJaD0W+4diA5rIaSQQ3tIXwUTDzhXXcKTgsB/j8CT7mvtX+
 n7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708968221; x=1709573021;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9ry8MSC5kBaUVxmaPXulfwti9eHH84wip0eIdZ+m7UA=;
 b=B+wCeZgZJftVVebWgArHcMss8vpUrOCi++Am0HsgISFBtlp/YFfsrA+7vLGlhtikZo
 99Mqkjai6G0ZT2tkijDkvnHDDJwNcy7wS/zwCjUzAafONkeywL1LWEEpCdnqZQKU6SE+
 4sl0oDqBi0X0Dam5v9PUqnot4f/sySPcVsToQJcwSEdf1dnGtGZjxd+tZJ5uxQea5nNG
 6ejtUzH/6YNEJjxwKARpjRdlRe56rc66gLef//YuGI00E0PY3ML49Xe6/OAE2tXyIbSL
 y8k8VfYSazkR32WrSqYk3r+OaiYO1QhyBxvqtkhjFcHqFnZRJ2rK/DNFfhLxEenUmIDG
 CkDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlM2zfmaUQMXmjYmTYMGlw41gibGo25vurCVZaw5cKNECddky8O676BNg+3F+AayDMBFnyjr/EWQ4ukcFM8G18DdOLoYc5GPaVKIJ1BS7m
X-Gm-Message-State: AOJu0Yxjaj3jvWARDYQCayZWqd1WUs3C5whoqo0GH/A0XKBNnIQ7rZDy
 VMxpigIuviBlMSBPr29qKG6s//eVJt/cenJfGCLvuSxCwRTA5F5KPKYOHkGqjiLfBLJqv+oNAlo
 fghqyNNgvDcfoc/etohDr5MDIt2OiSZMyHD7n0w==
X-Google-Smtp-Source: AGHT+IEM0YmQ+c7z9G2t3j1lJTB80fKahAXQCAwFzCLJl09oVb9rDVgNZoqULEGZ5hn3lU/q4eGEh8WNNk+Ms90PE9k=
X-Received: by 2002:a81:a942:0:b0:609:107e:5dd5 with SMTP id
 g63-20020a81a942000000b00609107e5dd5mr1629582ywh.37.1708968221207; Mon, 26
 Feb 2024 09:23:41 -0800 (PST)
MIME-Version: 1.0
References: <20240216184857.245372-1-dave.stevenson@raspberrypi.com>
 <20240216184857.245372-2-dave.stevenson@raspberrypi.com>
 <20240221110751.48da8190@eldfell>
 <b43rdl7yebxn6z3pvyeyxbikccr7umrojo5kqw5i3ybloxktso@de4oxsbskkwp>
 <20240226171143.27e60c30@eldfell>
In-Reply-To: <20240226171143.27e60c30@eldfell>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 26 Feb 2024 17:23:24 +0000
Message-ID: <CAPY8ntCHi8joN-w3PNjMj31FSkCjqmJ4ZyhSDFZ1-PnfL4+FrQ@mail.gmail.com>
Subject: Re: UAPI Re: [PATCH 1/3] drm: Add DRM_MODE_TV_MODE_MONOCHROME
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pekka

Sorry for the slight delay in replying.

On Mon, 26 Feb 2024 at 15:11, Pekka Paalanen
<pekka.paalanen@haloniitty.fi> wrote:
>
> On Mon, 26 Feb 2024 15:10:45 +0100
> Maxime Ripard <mripard@kernel.org> wrote:
>
> > Hi Pekka,
> >
> > On Wed, Feb 21, 2024 at 11:07:51AM +0200, Pekka Paalanen wrote:
> > > On Fri, 16 Feb 2024 18:48:55 +0000
> > > Dave Stevenson <dave.stevenson@raspberrypi.com> wrote:
> > >
> > > > From: Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
> > > >
> > > > Add this as a value for enum_drm_connector_tv_mode, represented
> > > > by the string "Mono", to generate video with no colour encoding
> > > > or bursts. Define it to have no pedestal (since only NTSC-M calls
> > > > for a pedestal).
> > > >
> > > > Change default mode creation to acommodate the new tv_mode value
> > > > which comprises both 525-line and 625-line formats.
> > > >
> > > > Signed-off-by: Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
> > > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >
> > > since no-one else commented yet, I'd like to remind of the new UAPI
> > > requirements:
> > > https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements
> > >
> > > AFAIU, adding a new value to an existing enum still counts as new UAPI.
> > >
> > > Maybe there is no need for the full treatment here, or maybe there is,
> > > I'm not sure. I think you should make some statement about how the new
> > > UAPI requirements have been addressed.
> >
> > That property was meant to provide legacy display handling, so I don't
> > expect any reasonably recent codebase like Weston to suppport it, ever
> > :)
> >
> > That being said, from the beginning, that property was meant to be
> > handled as a "mode-setting" property, and thus handled by either the
> > kernel command-line, xrandr, or any similar mechanism.
> >
> > I would expect that new enum variant to be handled under the same terms:
> > it'll probably only show up in distro scripts or configuration files,
> > and never in any actual code base.
> >
> > Is it what you were expecting, or did you mean something else?
>
> Maybe? Let's have it in the commit message and see if DRM maintainers
> agree.

You want the commit text for a patch adding a new enum to state that
the whole property isn't expected to be used through the UAPI? OK, I
can roll a v2 if that is your desire.

> You should expect that all KMS clients will work towards programming
> all exposed KMS properties into known values. That's the only way to
> achieve repeatable KMS behaviour, because there is no KMS reset ioctl.
>
> There are no two tiers of KMS properties AFAIK. You have to be the DRM
> master to change anything. So, people cannot force any settings from
> outside of a KMS client, they have to go through the KMS client, like
> xrandr goes through Xorg (and only Xorg).
>
> I do fully expect Weston to gain support for this property, if anyone
> cares of its value. That goes for all Wayland compositors.

I don't know about Weston, but Wayfire / wlroots / sway have currently
chosen to ignore all interlaced display modes [1].
[2] is the wlroots devs basically calling interlaced output a dead end.

That makes the debate for controlling the colour encoding on a
composite video rather redundant as they're almost always interlaced.

[1] https://github.com/swaywm/sway/issues/3167
[2] https://gitlab.freedesktop.org/wlroots/wlroots/-/issues/3038

> You're correct in that a KMS client would probably not know to control
> the value of this property automatically but it needs to come from
> configuration. That would be each KMS client's configuration. I don't
> understand how a script could achieve that.
>
> However, if you feel it is important to have KMS properties that
> display servers must not touch, then they should be documented as such.
> I do not know if that would actually lift the new-UAPI requirements,
> that is for the DRM maintainers to decide and document. Is there such a
> thing already?
>
> What are those "similar to xrandr" mechanisms? I don't think I've heard
> of any,

Boot to the console and run
modetest -w <connector id>:"tv_mode":"NTSC"
There is no reset mechanism for all properties, so that setting
persists after modetest quits.

> and I've also completely missed any kernel command line
> arguments manipulating KMS properties.

"tv_mode" on the command line is handled in
drm_mode_parse_cmdline_options() [3], as are rotate, reflect_x,
reflect_y, margin_[left|right|top|bottom], and panel_orientation all
to set the relevant KMS properties.

Having "video=Composite-1:PAL,tv_mode=Mono" on the kernel command line
will set up connector Composite-1 with the standard 720x576 50Hz
interlaced timings, and DRM_MODE_TV_MODE_MONOCHROME selected on the
tv_mode property. Swap in different tv_mode descriptions as required
(eg PAL,tv_mode=SECAM), although some make little sense.

That's the main route I'm looking at for configuring this property,
for situations such as having a black and white TV connected. You
don't get the opportunity to interrogate a composite display over what
it supports, so it has to be configured manually somewhere in the
system. If your monitor doesn't support the system default, then you
can't see a GUI in order to change the option, and there is no
guaranteed supported configuration so the command line is about the
only option.

The use cases for runtime switching of the "tv_mode" are exceedingly
rare, so IMHO the property doesn't need exposing through the UAPI.
However it was added to the UAPI about 8 years ago for vc4 and sunxi,
and is also now used by other drivers, so can't be reverted. Does that
mean it can now never be changed without jumping through the hoop of
creating some userspace user?

Regards
  Dave

[3] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_modes.c#L2232
