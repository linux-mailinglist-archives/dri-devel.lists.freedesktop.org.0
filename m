Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CE784495B
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 22:04:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D1810FD1F;
	Wed, 31 Jan 2024 21:04:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC3CF10E6E9
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 15:53:31 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2cf3a095ba6so63889251fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 07:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706716350; x=1707321150; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OQX3o9OdnVWodXK7XnVqKIBMgmyYUG9SCf1DG/2FOUc=;
 b=Ae8origIwx7BhDqXF8HKpOqVcqmmgj4X2Ux+pSNcdJqSsBa14sYhSHor+dzw92VrBZ
 m/VSHd0OH9+gqMLUn33ZHsmUxbrTjMWuISnmx3zm4s2yfRDbVIFdMPO4KbAWUTjrsc+f
 Iue8exbK1GyNvio4cJCE1jd8VpGIgiUJkRyFGrHT/wTyZzPWpGFBF2J93zGnJ2JL0YSP
 8KeJpHWZvUWavHNOymsJkimzyCMf4u4OOlvGNZBO92CPGddmOJIQbYdOUUVEdcUt93Un
 V0bwhBbDwKzvDRo71eqjVnIO8sojW8+1WmboRW993/e7MCdLxf4HfaujK6kB4i+pu2Xr
 CZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706716350; x=1707321150;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OQX3o9OdnVWodXK7XnVqKIBMgmyYUG9SCf1DG/2FOUc=;
 b=r3cA94qoZCPvon2hnQhkEOlSOnVN7iyEj20HUnChT5gcB+z57DOmxtBkHZtkZY/gfi
 7yN53gtQ6etVG7/wrWWHfnkecz4sC0W9CkNkbs9CaqYa3nH7kYYe4WOMXteDKIMzhSoA
 zxXbdTMpCnQhDxOYj5V1KwhobTdmHGivw38rSnb0SDpAHaQamZTLC+CvJ08+oEualxo9
 GcfjiOfT8IzBb76AevIjrYdT1PlfbzKQwTJ++WxldrxdfNDK+9qC9tIHAo/BI6MombqW
 PoT6f0VlQh/e6+es/D8ctRANGeLRWxHNFuzjbHCxPYLdpqBZPJAdS9I7YYI+lPRtyNP9
 VVKg==
X-Gm-Message-State: AOJu0YzxRLCULMls8h6WVZsPDBppO9klZy/QLo04zWamR4o/XBSI38r/
 3Gv0LD645BNgt5T9XfER++AoiyUYUe0+7y/bTlkynuR2UvDG+ziGBI15et8GcuWl4HMMEKOxCuB
 FIPlTMkjlJgPBMDpCAMhtQJygdOY=
X-Google-Smtp-Source: AGHT+IHGgRpeCu9yNBRtA4a5mdEUPe6rJOKy5MddfQNAEf49HG41vyeNWWjwuxEzNvIAJhfV9seBWUCZ2kKje+jEW6w=
X-Received: by 2002:a05:651c:10c9:b0:2d0:4fbb:7bfd with SMTP id
 l9-20020a05651c10c900b002d04fbb7bfdmr1431157ljn.10.1706716349820; Wed, 31 Jan
 2024 07:52:29 -0800 (PST)
MIME-Version: 1.0
References: <aac81702-df1e-43a2-bfe9-28e9cb8d2282@tuxedocomputers.com>
 <CANiq72mfP+dOLFR352O0UNVF8m8yTi_VmOY1zzQdTBjPWCRowg@mail.gmail.com>
 <87sf61bm8t.fsf@intel.com> <ZVvHG/Q+V6kCnfKZ@duo.ucw.cz>
 <f4137e34-c7fb-4f21-bc93-1496cbf61fdf@tuxedocomputers.com>
 <8096a042-83bd-4b9f-b633-79e86995c9b8@redhat.com>
 <f416fbca-589b-4f6a-aad6-323b66398273@tuxedocomputers.com>
 <4222268b-ff44-4b7d-bf11-e350594bbe24@redhat.com>
 <ac02143c-d417-49e5-9c6e-150cbda71ba7@tuxedocomputers.com>
 <ZaljwLe7P+dXHEHb@duo.ucw.cz>
 <6bbfdd62-e663-4a45-82f4-445069a8d690@redhat.com>
 <0cdb78b1-7763-4bb6-9582-d70577781e61@tuxedocomputers.com>
 <7228f2c6-fbdd-4e19-b703-103b8535d77d@redhat.com>
 <730bead8-6e1d-4d21-90d2-4ee73155887a@tuxedocomputers.com>
 <952409e1-2f0e-4d7a-a7a9-3b78f2eafec7@redhat.com>
 <9851a06d-956e-4b57-be63-e10ff1fce8b4@tuxedocomputers.com>
 <1bc6d6f0-a13d-4148-80cb-9c13dec7ed32@redhat.com>
 <b70b2ea8-abfd-4d41-b336-3e34e5bdb8c6@tuxedocomputers.com>
 <477d30ee-247e-47e6-bc74-515fd87fdc13@redhat.com>
 <e21a7d87-3059-4a51-af04-1062dac977d2@tuxedocomputers.com>
In-Reply-To: <e21a7d87-3059-4a51-af04-1062dac977d2@tuxedocomputers.com>
From: Roderick Colenbrander <thunderbird2k@gmail.com>
Date: Wed, 31 Jan 2024 07:52:17 -0800
Message-ID: <CAEc3jaDsv0hv8gcqsMdcrMf4WK-Nq0LMgPcVHzv87x+J0M=V2Q@mail.gmail.com>
Subject: Re: Future handling of complex RGB devices on Linux
To: Werner Sembach <wse@tuxedocomputers.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 31 Jan 2024 21:04:16 +0000
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
Cc: Lee Jones <lee@kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 jikos@kernel.org, linux-kernel@vger.kernel.org,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jelle van der Waa <jelle@vdwaa.nl>, Hans de Goede <hdegoede@redhat.com>,
 Pavel Machek <pavel@ucw.cz>, linux-input@vger.kernel.org, ojeda@kernel.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 31, 2024 at 3:42=E2=80=AFAM Werner Sembach <wse@tuxedocomputers=
.com> wrote:
>
> Hi,
>
> so I combined Hans last draft, with the discussion since then and the com=
ments
> from the OpenRGB maintainers from here
> https://gitlab.com/CalcProgrammer1/OpenRGB/-/issues/3916 and my own exper=
ience
> and came up witrh this rough updated draft for the new uapi:
>
> Future handling of complex RGB devices on Linux:
>
> Optional: Provide a basic leds-subsystem driver:
>      - The whole device is treated as a singular RGB led in the current l=
eds uapi
>          - Backwards compatibility
>          - Have something work out-of-the-box and during boot time
>      - The driver also registers a misc device with a singluar sysfs attr=
ibute
> select_uapi
>          - reading this gives back "[leds] none"
>          - the current active uapi can be selected by writing it to that =
attribute
>          - switching the uapi means deregistering the device from that en=
tirely
> and registering and initializing it with the new one froms scratch
>          - selecting none only does the deregistering
>
> If the device is already reachable by userspace directly, e.g. via hidraw=
, the
> kernel will only offer this basic implementation and a more complex drive=
r has
> to be implemented in userspace.
>      - This driver has to use the select_uapi attribute first and select =
"none"
> to avoid undefined behaviour caused by accessing the leds upai and hidraw=
 to
> control the lighting at the same time
>      - Question: How to best associate the select_uapi attribute to the
> corresponding hidraw (or other) direct access channel? So that a userspac=
e
> driver can reliable check whether or not this has to be set.
>
> Devices not reachable by userspace directly, e.g. because they are contro=
led via
> a wmi interface, can also be implemented in the new rgbledstring-subsyste=
m
> (working title) for more complex control
>      - a rgbledstring device provides an ioctl interface (ioctl only no r=
/w)
> using /dev/rgbledstring0, /dev/rgbledstring1, etc. registered as a misc c=
hardev.
>          - get-device-info ioctl which returns in a single struct:
>              - char name[64]                     /* Device model name /
> identifier, preferable human readable. For keyboards, if known to the dri=
ver,
> physical layout (or even printed layout) should be separated here */
>              - enum device_type                  /* e.g. keyboard, mouse,
> lightbar, etc. */
>              - char firmware_version_string[64]  /* if known to the drive=
r,
> empty otherwise */
>              - char serial_number[64]            /* if known to the drive=
r,
> empty otherwise */
>              - enum supported_modes[64]          /* modes supported by th=
e
> firmware e.g. static/direct, breathing, scan, raindrops, etc. */
>          - get-mode-info icotl, RFC here: Hans thinks it is better to hav=
e the
> modes and their inputs staticly defined and have, if required, something =
like
> breathing_clevo_1, breathing_clevo_2, breathing_tongfang_1 if the inputs =
vary
> between vendors. I think a dynamic approach could be useful where userspa=
ce just
> queries the struct required for each individual mode.
>              - input: a mode from the supported_modes extracted from get-=
device-info
>              - output: static information about the mode, e.g.
> max_animation_speed, max_brightness, etc.
>              - output: the struct/a list of attributes and their types re=
quired
> to configure the mode
>          - set-mode ioctl takes a single struct:
>              - enum mode                         /* from supported_modes =
*/
>              - union data
>                  - char raw[3072]
>                  - <all structs returned by get-mode-info>
>          - The driver also registers a singluar sysfs attribute select_ua=
pi
>              - reading this gives back "[leds] rgbledstring none" or
> "[rgbledstring] none" respectifly
>              - Discussion question: should select_uapi instead be use_led=
s_uapi
>                  - if 1: use basic leds driver
>                  - if 0: if device is userspace accessible no kernel driv=
er is
> active, if device ist not userspace accessible register rgbledstring (aka
> implicit separation between rgbledstring and none instead of explicit one=
)
>
> Zone configuration would be seen as a subset of mode configuration, as I =
suspect
> not every mode needs the zone configuration even on devices that offer it=
?
>
> The most simple mode would be static/direct and the set-mode struct would=
 look
> like this:
> {
>      enum mode, /* =3D static */
>      {
>          uint8 brightness, /* global brightness, some keyboards offer thi=
s */
>          uint8 color[<number_of_leds>*3]
>      }
> }
>
> Question: Are there modes that have a separate setup command that is only
> required once and then a continuous stream of update information? If yes,=
 should
> we reflect that by splitting set-mode into set-mode-setup and set-mode-up=
date
> (with get-mode-info returning one struct for each)? Or should userspace j=
ust
> always send setup and update information and it's up to the kernel driver=
 to
> only resend the setup command when something has changed? In the former c=
ase
> set-mode-update might be a noop in most cases.
>
> Discussion on this might also happen here:
> https://gitlab.com/CalcProgrammer1/OpenRGB/-/issues/3916#note_1751170108
>
> Regards,
>
> Werner
>
>

Hi Werner,

I don't have a particular opinion as I don't know too much about RGB
keyboards. I just want to provide some food for thought and provide
some extra context of other devices. Just to challenge the discussion
and make sure than any API is flexible enough as it is hard to change
kernel interfaces later on.

At Sony our PlayStation controllers historically had a variety of LEDs
whether basic indicator ones (e.g. used to pick a player number) as
well as RGB leds. The devices are all HID based, but we do custom
parsing in hid-playstation to break out them out through LED framework
(regular leds and leds-class-multicolor for RGB). They were a bit of a
nightmare for applications to discover as crawling sysfs isn't fun (we
wrote a lot of code for Android's input framework to do this for our
own peripherals, but others too).

I'm not entirely sure where your RGB proposal is headed, but if one of
the higher goals is making dealing with LEDs and input devices easier,
maybe this extra info helps some of the discussion.

Thanks,
Roderick Colenbrander
