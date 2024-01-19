Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AC2832822
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 11:51:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C760610E9C3;
	Fri, 19 Jan 2024 10:51:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FBE810E9D5
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 10:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705661490; x=1737197490;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=mmJMFX/yMqul7R/1AAX1HbrHQilika2cXTOvDyZmG2Y=;
 b=mGcjhtHe15k4bxnTjmT4Rs3WSZ+EM7kv5aPbG1G2ZkFbXRwBM7V2S+z6
 sVvd1z/Janxh5jp26h8OG0/T5XLoQQ4X96i9mthNP4NSq7sw2KjoAVCRw
 DYaDljjRwjZ1avmLpZCQQugoXvzLtswtsf7eBKszMERpl2R0erOYiD6cq
 Klfl1E2Qj0zUwjy3pgIto1p2+HXz2gsCAe8ByODjbKH1fuOcTB8dFUCVr
 /aolRQsOTtwT0LQWEal4YveD0wtzfLLmC/rkm3c/jjl0AThN1Td7vfj7U
 0wlYnqCHJvf6ZVHphe1H7tP4lhGmemuVrDN91dXtoQuEj2lNk2asT2ggn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="464997927"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="464997927"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 02:51:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="788329742"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="788329742"
Received: from vstill-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.39.223])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 02:51:24 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>, Werner
 Sembach <wse@tuxedocomputers.com>
Subject: Re: Implement per-key keyboard backlight as auxdisplay?
In-Reply-To: <6bbfdd62-e663-4a45-82f4-445069a8d690@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <aac81702-df1e-43a2-bfe9-28e9cb8d2282@tuxedocomputers.com>
 <ZSmg4tqXiYiX18K/@duo.ucw.cz>
 <CANiq72mfP+dOLFR352O0UNVF8m8yTi_VmOY1zzQdTBjPWCRowg@mail.gmail.com>
 <87sf61bm8t.fsf@intel.com> <ZVvHG/Q+V6kCnfKZ@duo.ucw.cz>
 <f4137e34-c7fb-4f21-bc93-1496cbf61fdf@tuxedocomputers.com>
 <8096a042-83bd-4b9f-b633-79e86995c9b8@redhat.com>
 <f416fbca-589b-4f6a-aad6-323b66398273@tuxedocomputers.com>
 <4222268b-ff44-4b7d-bf11-e350594bbe24@redhat.com>
 <ac02143c-d417-49e5-9c6e-150cbda71ba7@tuxedocomputers.com>
 <ZaljwLe7P+dXHEHb@duo.ucw.cz>
 <6bbfdd62-e663-4a45-82f4-445069a8d690@redhat.com>
Date: Fri, 19 Jan 2024 12:51:21 +0200
Message-ID: <87bk9hppee.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Lee Jones <lee@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 linux-kernel@vger.kernel.org,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jelle van der Waa <jelle@vdwaa.nl>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 linux-input@vger.kernel.org, ojeda@kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 19 Jan 2024, Hans de Goede <hdegoede@redhat.com> wrote:
> For per key controllable rgb LEDs we need to discuss a coordinate
> system. I propose using a fixed size of 16 rows of 64 keys,
> so 64x16 in standard WxH notation.
>
> And then storing RGB in separate bytes, so userspace will then
> always send a buffer of 192 bytes per line (64x3) x 14 rows
> = 3072 bytes. With the kernel driver ignoring parts of
> the buffer where there are no actual keys.
>
> I would then like the map the standard 105 key layout onto this,
> starting at x.y (column.row) coordinates of 16.6 (with 0.0 being
> the top left). Leaving plenty of space on the left top and right
> (and some on the bottom) for extra media key rows, macro keys, etc.
>
> The idea to have the standard layout at a fixed place is to allow
> userspace to have a database of preset patterns which will work
> everywhere.
>
> Note I say standard 105 key layout, but in reality for
> defining the standardized part of the buffer we should
> use the maximum amount of keys per row of all the standard layouts,
> so for row 6 (the ESC row) and for extra keys on the right outside
> the main block we use the standard layout as shown here:

Doesn't the input stack already have to have pretty much all of this
already covered? I can view the keyboard layout in my desktop
environment, and it's a reasonably accurate match, even if unlikely to
be pixel perfect. But crucially, it has to have all the possible layouts
covered already.

And while I would personally hate it, you can imagine a use case where
you'd like a keypress to have a visual effect around the key you
pressed. A kind of force feedback, if you will. I don't actually know,
and correct me if I'm wrong, but feels like implementing that outside of
the input subsystem would be non-trivial.

Cc: Dmitry, could we at least have some input from the input subsystem
POV on this? AFAICT we have received none.


BR,
Jani.


>
> http://www.maxkeyboard.com/images/105_ISO_6_25_Key_Layout.jpg
>
> For the main area of the keyboard looking at:
>
> http://bopqehorizon.weebly.com/uploads/1/3/4/3/134337299/913246919_orig.png
>
> We want to max rows per key, so this means that per row we use
> (from the above image) :
>
> row  7: 106/109 - JIS 
> row  8: 101/104 - ANSI
> row  9: 102/105 - ISO
> row 10: 104/107 - ABNT
> row 11: 106/109 - JIS
>
> (with row 7 being the main area top row)
>
> This way we can address all the possible keys in the various
> standard layouts in one standard wat and then the drivers can
> just skip keys which are not there when preparing the buffer
> to send to the hw / fw.
>
> One open question is if we should add padding after the main
> area so that the printscreen / ins / del / leftarrow of the
> "middle" block of 
>
> http://www.maxkeyboard.com/images/105_ISO_6_25_Key_Layout.jpg
>
> all start at the same x (say 32) or we just pack these directly
> after the main area.
>
> And the same question for the numlock block, do we align
> this to an x of say 36, or pack it ?
>
>
> As for the actual IOCTL API I think there should be
> the following ioctls:
>
> 1. A get-info ioctl returning a struct with the following members:
>
> {
> char name[64]      /* Keyboard model name / identifier */
> int row_begin[16]; /* The x address of the first available key per row. On a std 105key kbd this will be 16 for rows 6-11, 0 for other rows */
> int row_end[16];   /* x+1 for the address of the last available key per row, end - begin gives number of keys in a row */
> int rgb_zones;     /* number of rgb zones for zoned keyboards. Note both
>                       zones and per key addressing may be available if
>                       effects are applied per zone. */
> ?
> }
>
> 2. A set-leds ioctl which takes the earlier discussed 3092 bytes buffer
> to set all the LEDs at once, only valid if at least one row has a non 0 lenght.
>
> 3. A set-zones ioctl which takes an array of bytes sized 3 * number-of-zones
> containing RGB values for each zone
>
> 4. A enum_effects ioctl which takes a struct with the following members:
>
> {
> long size; /* Size of passed in struct including the size member itself */
> long effects_mask[]
> }
>
> the idea being that there is an enum with effects, which gets extended
> as we encounter more effects and the bitmask in effects_mask has a bit set
> for each effects enum value which is supported. effects_mask is an array
> so that we don't run out of bits. If older userspace only passes 1 long
> (size == (2*sizeof(long)) when 2 are needed at some point in the future 
> then the kernel will simply only fill the first long.
>
> 5. A set_effect ioctl which takes a struct with the following members:
>
> {
> long size; /* Size of passed in struct including the size member itself */
> int effect_nr; /* enum value of the effect to enable, 0 for disable effect */
> int zone;  /* zone to apply the effect to */
> int speed; /* cycle speed of the effect in milli-hz */
> char color1[3]; /* effect dependend may be unused. */
> char color2[3]; /* effect dependend may be unused. */
> }
>
> Again the idea with the size member is that the struct can be extended with
> new members if necessary and the kernel will supply a default value for
> older userspaces which provide a smaller struct (note size being smaller
> then sizeof(struct-v1) will invalid).
>
>
> Note this is all just a rough sketch suggestions welcome!
>
> Regards,
>
> Hans
>
>
>

-- 
Jani Nikula, Intel
