Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3495A832CCF
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 17:07:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68A310E184;
	Fri, 19 Jan 2024 16:06:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BFB010E184
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 16:06:51 +0000 (UTC)
Received: from [192.168.42.20] (p5de453e7.dip0.t-ipconnect.de [93.228.83.231])
 (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id EC5C32FC004D;
 Fri, 19 Jan 2024 17:06:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1705680409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=33BKg948SpJuTYNWCY0kTG5wDaI1GDW70qDN04idmJM=;
 b=lNiK3EpNKIwbM9Ym1k+DdGBjQWsdH7BbttnGg/XMZ+wkzf5IIf5yPN+BDHGU3Tny0EsrJo
 NtvwnAjD6B/ZLwzG5MwD2WCNEkk+Zu2VAqWe9Zdi+RJTW98IKImplNmnkWw8lv6oPbkkZO
 EEDZbgoq9fNmWmfQ7NrcN4DFvU3ZxH8=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <e4f05a5e-ba9e-4106-9d61-3bb9e5f078b3@tuxedocomputers.com>
Date: Fri, 19 Jan 2024 17:06:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Implement per-key keyboard backlight as auxdisplay?
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>
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
 <6bbfdd62-e663-4a45-82f4-445069a8d690@redhat.com> <87bk9hppee.fsf@intel.com>
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <87bk9hppee.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Lee Jones <lee@kernel.org>, jikos@kernel.org, linux-kernel@vger.kernel.org,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jelle van der Waa <jelle@vdwaa.nl>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 linux-input@vger.kernel.org, ojeda@kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Am 19.01.24 um 11:51 schrieb Jani Nikula:
> On Fri, 19 Jan 2024, Hans de Goede <hdegoede@redhat.com> wrote:
>> For per key controllable rgb LEDs we need to discuss a coordinate
>> system. I propose using a fixed size of 16 rows of 64 keys,
>> so 64x16 in standard WxH notation.
>>
>> And then storing RGB in separate bytes, so userspace will then
>> always send a buffer of 192 bytes per line (64x3) x 14 rows
>> = 3072 bytes. With the kernel driver ignoring parts of
>> the buffer where there are no actual keys.
>>
>> I would then like the map the standard 105 key layout onto this,
>> starting at x.y (column.row) coordinates of 16.6 (with 0.0 being
>> the top left). Leaving plenty of space on the left top and right
>> (and some on the bottom) for extra media key rows, macro keys, etc.
>>
>> The idea to have the standard layout at a fixed place is to allow
>> userspace to have a database of preset patterns which will work
>> everywhere.
>>
>> Note I say standard 105 key layout, but in reality for
>> defining the standardized part of the buffer we should
>> use the maximum amount of keys per row of all the standard layouts,
>> so for row 6 (the ESC row) and for extra keys on the right outside
>> the main block we use the standard layout as shown here:
> Doesn't the input stack already have to have pretty much all of this
> already covered? I can view the keyboard layout in my desktop
> environment, and it's a reasonably accurate match, even if unlikely to
> be pixel perfect. But crucially, it has to have all the possible layouts
> covered already.
>
> And while I would personally hate it, you can imagine a use case where
> you'd like a keypress to have a visual effect around the key you
> pressed. A kind of force feedback, if you will. I don't actually know,
> and correct me if I'm wrong, but feels like implementing that outside of
> the input subsystem would be non-trivial.
>
> Cc: Dmitry, could we at least have some input from the input subsystem
> POV on this? AFAICT we have received none.
>
>
> BR,
> Jani.

Don't forget: while we are currently discussing keyboards, in the future this 
API imho should also be usefull for other RGB devices like mice, lightbars, etc.

Regards,

Werner

>
>
>> http://www.maxkeyboard.com/images/105_ISO_6_25_Key_Layout.jpg
>>
>> For the main area of the keyboard looking at:
>>
>> http://bopqehorizon.weebly.com/uploads/1/3/4/3/134337299/913246919_orig.png
>>
>> We want to max rows per key, so this means that per row we use
>> (from the above image) :
>>
>> row  7: 106/109 - JIS
>> row  8: 101/104 - ANSI
>> row  9: 102/105 - ISO
>> row 10: 104/107 - ABNT
>> row 11: 106/109 - JIS
>>
>> (with row 7 being the main area top row)
>>
>> This way we can address all the possible keys in the various
>> standard layouts in one standard wat and then the drivers can
>> just skip keys which are not there when preparing the buffer
>> to send to the hw / fw.
>>
>> One open question is if we should add padding after the main
>> area so that the printscreen / ins / del / leftarrow of the
>> "middle" block of
>>
>> http://www.maxkeyboard.com/images/105_ISO_6_25_Key_Layout.jpg
>>
>> all start at the same x (say 32) or we just pack these directly
>> after the main area.
>>
>> And the same question for the numlock block, do we align
>> this to an x of say 36, or pack it ?
>>
>>
>> As for the actual IOCTL API I think there should be
>> the following ioctls:
>>
>> 1. A get-info ioctl returning a struct with the following members:
>>
>> {
>> char name[64]      /* Keyboard model name / identifier */
>> int row_begin[16]; /* The x address of the first available key per row. On a std 105key kbd this will be 16 for rows 6-11, 0 for other rows */
>> int row_end[16];   /* x+1 for the address of the last available key per row, end - begin gives number of keys in a row */
>> int rgb_zones;     /* number of rgb zones for zoned keyboards. Note both
>>                        zones and per key addressing may be available if
>>                        effects are applied per zone. */
>> ?
>> }
>>
>> 2. A set-leds ioctl which takes the earlier discussed 3092 bytes buffer
>> to set all the LEDs at once, only valid if at least one row has a non 0 lenght.
>>
>> 3. A set-zones ioctl which takes an array of bytes sized 3 * number-of-zones
>> containing RGB values for each zone
>>
>> 4. A enum_effects ioctl which takes a struct with the following members:
>>
>> {
>> long size; /* Size of passed in struct including the size member itself */
>> long effects_mask[]
>> }
>>
>> the idea being that there is an enum with effects, which gets extended
>> as we encounter more effects and the bitmask in effects_mask has a bit set
>> for each effects enum value which is supported. effects_mask is an array
>> so that we don't run out of bits. If older userspace only passes 1 long
>> (size == (2*sizeof(long)) when 2 are needed at some point in the future
>> then the kernel will simply only fill the first long.
>>
>> 5. A set_effect ioctl which takes a struct with the following members:
>>
>> {
>> long size; /* Size of passed in struct including the size member itself */
>> int effect_nr; /* enum value of the effect to enable, 0 for disable effect */
>> int zone;  /* zone to apply the effect to */
>> int speed; /* cycle speed of the effect in milli-hz */
>> char color1[3]; /* effect dependend may be unused. */
>> char color2[3]; /* effect dependend may be unused. */
>> }
>>
>> Again the idea with the size member is that the struct can be extended with
>> new members if necessary and the kernel will supply a default value for
>> older userspaces which provide a smaller struct (note size being smaller
>> then sizeof(struct-v1) will invalid).
>>
>>
>> Note this is all just a rough sketch suggestions welcome!
>>
>> Regards,
>>
>> Hans
>>
>>
>>
