Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A62C97F11
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 16:01:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B052110E2B5;
	Mon,  1 Dec 2025 15:01:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QlKh+kiJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8C310E2B5
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 15:01:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5D47C60097
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 15:01:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1141EC4CEF1
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 15:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764601265;
 bh=+NgIvplZwlz2+tVstObwOfGkpLYlyYPzPc+aojcE9dQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QlKh+kiJ+9GKts1+5Y123l1jCm8s/rU8iNK/fuG0S/qPFyayo5T8Iu6IzirM8vSOD
 3hvdtJ6S+pAz8y60IHexizXoImSaYZfp0bCso+JxXs8ollhzDeuYuF6un0TIMD3mRT
 ClxzQc+kdatwc7+UrfkW/vCFDGzVTsTbWqKLnhHR49jRsGcD5264XUPBRtYHgjp66W
 rzWjXByQYYa8qK2ER3m8lBtUegeCShf+CyUCn7BEfiJkSVIn/3wfSdlBeVSucXxCs2
 yoidJ5RWFpzZyPmG+oOn6E4JylFrC5cZhbB/GUkV5Utzf4Ba9YOaWFB6lQUNZ8x0fB
 k4oxV2Uxz02Og==
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-37bb8bef4cdso38174671fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 07:01:04 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUyMR859bNicx7u5sFK3GKUXb8RbOVXj4IL8YOoDp5WCj86ogmRD5ipNj5gAPcsbnH55QQ0Sn33pBA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDWv2AwUVlU9JM7k1J0TJS8ABsxPTQpG7jv59N6gzw+YlfH4/B
 e3NtrdshTB8aK21dWwEHoqz5CL8Ud3VVE1dDv1abbREwEfK9UjZce8sg9J0ZOq4xGWBrRGxWvq2
 iGrho74+Q/JjiYnLU1n0K5HfD6Vfr3iA=
X-Google-Smtp-Source: AGHT+IFH4pUUzJVxSk2WhFxlSgPyKlrVYBe2pFSuZVHm6Ti2kJ7gRngTpuxW+1aysiB83y+D6IEKfA6KcIdj7xBD7i4=
X-Received: by 2002:a05:6512:3d87:b0:57d:6fca:f208 with SMTP id
 2adb3069b0e04-596b5298c92mr9341510e87.45.1764601263371; Mon, 01 Dec 2025
 07:01:03 -0800 (PST)
MIME-Version: 1.0
References: <20251128150403.11567-1-tvrtko.ursulin@igalia.com>
 <ce41c2d1-c659-4632-8469-761762202800@suse.de>
 <660c5469-086f-40b4-99f1-72c1bc613ece@igalia.com>
 <1df5a480-2510-43b9-9d79-51d842518036@suse.de>
 <b146fb1b-80e9-403c-acd1-b50ef1aaa646@igalia.com>
 <1b73df5b-5f47-4ce4-abd4-83d550cc0dea@suse.de>
 <e7c4a76e-5cef-4a75-847f-59c53a554327@igalia.com>
 <CAMj1kXFOS9jAzhh2Z_4rarEGd+kGPyNCu9PFoMhFbBVEF8NwJw@mail.gmail.com>
 <07212b84-fc2a-4efe-a39b-5b536b6dd602@igalia.com>
In-Reply-To: <07212b84-fc2a-4efe-a39b-5b536b6dd602@igalia.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 1 Dec 2025 16:00:51 +0100
X-Gmail-Original-Message-ID: <CAMj1kXH3FyhNinT3-_FqROB53p_574ft6hsoF6aGYeYkhLd+TQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnlFmw9beppfTZ0FQIILYZc9kK60Tc8JL3rBchl7zlHLDNgcZZzPBBQG5U
Message-ID: <CAMj1kXH3FyhNinT3-_FqROB53p_574ft6hsoF6aGYeYkhLd+TQ@mail.gmail.com>
Subject: Re: [RFX] efi: sysfb_efi: Fix simpledrmfb on Steam Deck
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 kernel-dev@igalia.com, Javier Martinez Canillas <javierm@redhat.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Melissa Wen <mwen@igalia.com>, Rodrigo Siqueira <siqueira@igalia.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, linux-efi@vger.kernel.org
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

On Mon, 1 Dec 2025 at 11:33, Tvrtko Ursulin <tvrtko.ursulin@igalia.com> wrote:
>
>
> On 01/12/2025 10:18, Ard Biesheuvel wrote:
> > On Mon, 1 Dec 2025 at 11:03, Tvrtko Ursulin <tvrtko.ursulin@igalia.com> wrote:
> >>
> >>
> >> On 01/12/2025 09:39, Thomas Zimmermann wrote:
> >>> Hi
> >>>
> >>> Am 01.12.25 um 10:20 schrieb Tvrtko Ursulin:
> >>>>
> >>>> On 01/12/2025 07:32, Thomas Zimmermann wrote:
> >>>>> Hi
> >>>>>
> >>>>> Am 29.11.25 um 11:44 schrieb Tvrtko Ursulin:
> >>>>>>
> >>>>>> On 28/11/2025 17:07, Thomas Zimmermann wrote:
> >>>>>>> Hi,
> >>>>>>>
> >>>>>>> thanks for the bug report
> >>>>>>>
> >>>>>>> Am 28.11.25 um 16:04 schrieb Tvrtko Ursulin:
> >>>>>>>> I am not sure how is simpledrmfb on top of EFI supposed to work,
> >>>>>>>> but at
> >>>>>>>> least at the moment it appears there is a missing link in the
> >>>>>>>> "discovery"
> >>>>>>>> of frame buffer parameters.
> >>>>>>>>
> >>>>>>>> What I can see is that EFI GOP reads some parameters from the
> >>>>>>>> firmware and
> >>>>>>>> infers the other, such as in this case problematic pitch, or stride.
> >>>>>>>
> >>>>>>> The pitch/stride value comes from the firmware via
> >>>>>>> pixels_per_scanline [1].
> >>>>>>>
> >>>>>>> Can you verify that this value is really 800 instead of 832 (eq
> >>>>>>> 3328 bytes) ?
> >>>>>>>
> >>>>>>> [1] https://elixir.bootlin.com/linux/v6.17.9/source/drivers/
> >>>>>>> firmware/ efi/libstub/gop.c#L493
> >>>>>>
> >>>>>> I actually got confused a bit in following the flow so thank you for
> >>>>>> asking me to double check.
> >>>>>>
> >>>>>> GOP actually reports 1280x800 with a stride of 5120. So it kind of
> >>>>>> reports a rotated view already, kind of.
> >>>>>
> >>>>> These are correct values.
> >>>>>
> >>>>> But the stream deck is this device: [1], right? It uses landscape-
> >>>>> mode orientation. Why does it require rotation at all?
> >>>>>
> >>>>> [1] https://de.wikipedia.org/wiki/Steam_Deck#/media/
> >>>>> Datei:Steam_Deck_(front).png
> >>>>
> >>>> That's the device yes. For the user the screen is landscape, but the
> >>>> actual panel is 800x1280 portrait. Left edge is top of the display.
> >>>> (Hence the pre-existing entry in drm_get_panel_orientation_quirk.)
> >>>
> >>> I see. So the EFI display settings are configured as if this was a
> >>> landscape panel.
> >>>
> >>> What happens if you leave the EFI settings as-is and simply remove the
> >>> panel-orientation quirk?
> >>
> >> That would create effectively the same situation as without my patch
> >> because the panel-orientation quirk does not trigger unless detected
> >> screen is 800x1280. Result is corrupted console since fbcon thinks it is
> >> a landscape 1280x800 screen.
> >>>>>> Only when the rotation quirk from efifb_dmi_swap_width_height
> >>>>>> triggers the stride gets incorrectly recalculated:
> >>>>>>
> >>>>>>          u16 temp = screen_info.lfb_width;
> >>>>>>
> >>>>>>          screen_info.lfb_width = screen_info.lfb_height;
> >>>>>>          screen_info.lfb_height = temp;
> >>>>>>          screen_info.lfb_linelength = 4 * screen_info.lfb_width;
> >>>>>>
> >>>>>> So this is where things go wrong, well, they actually go wrong a
> >>>>>> little bit even earlier, in gop.c:
> >>>>>>
> >>>>>>      si->lfb_size = si->lfb_linelength * si->lfb_height;
> >>>>>>
> >>>>>> Which potentially underestimates the fb size. If GOP was forward
> >>>>>> looking enough to give us the size we could derive the pitch based
> >>>>>> on size..
> >>>>>>
> >>>>>> Anyway, as it stands it looks a quirk in sysfb_apply_efi_quirks
> >>>>>> looks it is required to fix it all up.
> >>>>>>
> >>>>>> I am a bit uneasy about declaring the fb size larger than what was
> >>>>>> implied by firmware provided pitch * height * depth but limited to a
> >>>>>> specific DMI match and if it looks visually okay I think it is a
> >>>>>> safe assumption the quirked size is actually correct and safe.
> >>>>>
> >>>>> Yeah, we better not do that.
> >>>> You mean declare it a firmware bug and live with the corrupt console
> >>>> until the final fb driver takes over?
> >>>
> >>> I only mean that we should not use more video memory than provided by EFI.
> >>
> >> Right, but that information is not available in the GOP, right? Ie. as I
> >> wrote above it appears assumed:
> >>
> >>      si->lfb_size = si->lfb_linelength * si->lfb_height;
> >>
> >> Do we have any other options apart from corruption or assume firmware
> >> configured GOP screen info incorrectly?
> >>
> >
> > How does it make sense to recalculate the line length? Those invisible
> > pixels at the end of the scanline are not going to be transposed to
> > the other dimension, right?
>
> Not sure what you meant here. The line above is from gop.c and the
> context is that GOP screen info appears to not carry the frame buffer
> size in bytes so it is implied.
>
> Elsewhere in the patch I quirk the pitch to the correct value so rotated
> rendering is correct.
>
> But the corrected pitch also means that in principle we need to adjust
> the frame buffer size, since it is larger than the size implied with the
> incorrect pitch.
>

OK, so if I understand all of the above correctly, you have a 800x1280
panel with 832 pixels per scanline, right? And the 5120 pitch is
simply bogus, but needed to maintain the fiction that the panel is
1280 pixels wide, and so the resulting lfb_size is bogus too?

Since we know that the PixelsPerScanline value is incorrect, I don't
think there is any point in attempting to cross reference this against
other firmware provided data. But it would make sense imho to apply
the quirk only if the exact combination of incorrect values (i.e.,
1280x800/5120) is encountered.
