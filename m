Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D215832C31
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 16:19:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E67810E9F6;
	Fri, 19 Jan 2024 15:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F41D10E9F9
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 15:19:17 +0000 (UTC)
Received: from [192.168.42.20] (p5de453e7.dip0.t-ipconnect.de [93.228.83.231])
 (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id A72F12FC004D;
 Fri, 19 Jan 2024 16:19:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1705677555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5L09JcjuuejH4utwfDs+Hnr2VAWqq7BmIwvFYqS51M4=;
 b=Y+bWlmbo2V7tCe4GMleNzQydJoiZfOWGKfX3x0mG5+j848zbok1g6tcNZiPKsvUYeSVFCQ
 2r3mBXmlffapPHRGyO+RABWxeMzASoiyyS8gQKnx8RWiMP8keSJZ6GRgf5v8V0moh9pQlJ
 IFTEP5hhdoYYBGMZeG44q/RBubLJlys=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Content-Type: multipart/alternative;
 boundary="------------hpuh8oKwt3KTFVe400DXhefH"
Message-ID: <36ac75fb-1c76-43fa-9b09-c836d138cf7b@tuxedocomputers.com>
Date: Fri, 19 Jan 2024 16:19:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Implement per-key keyboard backlight as auxdisplay?
To: Hans de Goede <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>
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
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <6bbfdd62-e663-4a45-82f4-445069a8d690@redhat.com>
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
 Jelle van der Waa <jelle@vdwaa.nl>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------hpuh8oKwt3KTFVe400DXhefH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Am 19.01.24 um 09:44 schrieb Hans de Goede:
> Hi,
>
> On 1/18/24 18:45, Pavel Machek wrote:
>> Hi!
>>
>>> We have an upcoming device that has a per-key keyboard backlight, but does
>>> the control completely via a wmi/acpi interface. So no usable hidraw here
>>> for a potential userspace driver implementation ...
>>>
>>> So a quick summary for the ideas floating in this thread so far:
>>>
>>> 1. Expand leds interface allowing arbitrary modes with semi arbitrary
>>> optional attributes:
>>>      - Con:
>>>
>>>          - Violates the simplicity paradigm of the leds interface (e.g. with
>>> this one leds entry controls possible multiple leds)
>> Let's not do this.
>>
>>> 2. Implement per-key keyboards as auxdisplay
>>>
>>>      - Pro:
>>>
>>>          - Already has a concept for led positions
>>>
>>>          - Is conceptually closer to "multiple leds forming a singular entity"
>>>
>>>      - Con:
>>>
>>>          - No preexisting UPower support
>>>
>>>          - No concept for special hardware lightning modes
>>>
>>>          - No support for arbitrary led outlines yet (e.g. ISO style enter-key)
>> Please do this one.
> Ok, so based on the discussion so far and Pavel's feedback lets try to
> design a custom userspace API for this. I do not believe that auxdisplay
> is a good fit because:
>
> - auxdisplay is just a directory name, it does not seem to clearly
>    define an API
>
> - instead the deprecated /dev/fb API is used which is deprecated
>
> - auxdisplays are very much displays (hence /dev/fb) they are typically
>    small LCD displays with a straight widthxheight grid of square pixels
>
> - /dev/fb does gives us nothing for effects, zoned keyboard, etc.

I was just checking this and wanted to write something similar. When I wrote the 
pro/con list I was mistaken that aux displays use either one of 2 APIs (charlcd 
or fb), but I was mistaken. The 8 devices implemented there are actually using 5 
different apis, some of them 2 at a time.

Just for reference the small list I wrote on the side just now:

arm-charlcd.c - own implementation without userspace interaction (just a static 
text is displayed)
cfag12864b.c/cfag12864bfb.c - ks0108_isinited or register_framebuffer
hd44780.c - charlcd_register
ht16k33.c - linedisp_register or register_framebuffer
img-ascii-lcd.c - linedisp_register
ks0108.c - own implementetion using parport_register_dev_model
lcd2s.c - charlcd_register
panel.c - charlcd_register

>
> So my proposal would be an ioctl interface (ioctl only no r/w)
> using /dev/rgbkbd0 /dev/rgbkdb1, etc. registered as a misc chardev.
>
> For per key controllable rgb LEDs we need to discuss a coordinate
> system. I propose using a fixed size of 16 rows of 64 keys,
> so 64x16 in standard WxH notation.
>
> And then storing RGB in separate bytes, so userspace will then
> always send a buffer of 192 bytes per line (64x3) x 14 rows
> = 3072 bytes. With the kernel driver ignoring parts of
> the buffer where there are no actual keys.
The be sure the "14 rows" is a typo? And should be 16 rows?
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

Some remarks here:

- Some keyboards might have two or more leds for big keys like (iso-)enter, 
shift, capslock, num+, etc. that in theory are individually controllable by the 
firmware. In windows drivers this is usually abstracted away, but could be 
interesting for effects (e.g. if the top of iso-enter is separate from the 
bottom of iso-enter like with one of our devices).

- In combination with this: The driver might not be able to tell if the actual 
physical keyboard is ISO or ANSI, so it might not be able the correctly assign 
the leds around enter correctly as being an own key or being part of ANSI- or 
ISO-enter.

- Should the interface have different addresses for the different enter and num+ 
styles (or even the different length shifts and spacebars)?

One idea for this: Actually assign 1 value per line for tall keys per line, 3 
(or maybe even 4, to have one spare) values per line for wide keys and 6 (or 8) 
values for space. e.g.:

- Right shift would have 3 values in row 10. The first value might be the left 
side of shift or the additional ABNT/JIS key. The 2nd Key might be the left side 
or middle of shift and the third key might be the right side of shift or the 
only value for the whole key. The additional ABNT/JIS key still also has a 
dedicated value which is used by drivers which can differentiate between 
physical layouts.

- Enter would have 3 values in row 8 and 3 values in row 9. With the same 
disambiguation as the additional ABNT/JIS but this time for ansii-/ and iso-#

- Num+ would have 2 values, one row 8 and one in row 9. The one in row 9 might 
control the whole key or might just control the lower half. The one in row 8 
might be another key or the upper half

For the left half if the main block the leftmost value should be the "might be 
the only relevant"-value while the right most value should be the "might be 
another key"-value. For the right side of the main block this should be swapped. 
Unused values should be adjacent to the "might be another key"-value, e.g.:

                                   | Left shift value 1    | Left shift value 2           | Left shift value 3            | Left shift value 4     | 102nd key value
ISO/ANSI aware                    | Left shift color      | Unused                       | Unused                        | Unused                 | 102nd key color
ISO non aware 1 led under shift   | Left shift color      | Unused                       | Unused                        | 102nd key color        | Unused
ANSI non aware 1 led under shift  | Left shift color      | Unused                       | Unused                        | Unused                 | Unused
ISO non aware 2 leds under shift  | Left shift left color | Left shift right color       | Unused                        | 102nd key color        | Unused
ANSI non aware 2 leds under shift | Left shift left color | Left shift right color       | Unused                        | Unused                 | Unused
ISO non aware 3 leds under shift  | Left shift left color | Left shift middle color      | Left shift right color        | 102nd key color        | Unused
ANSI non aware 3 leds under shift | Left shift left color | Left shift middle color      | Unused                        | Left shift right color | Unused
ANSI non aware 4 leds under shift | Left shift left color | Left shift middle left color | Left shift middle right color | Left shift right color | Unused

Like this with no information you can still reliable target the ANSI-shift 
space, if you know it's an ISO keyboard from user space you can target shift and 
102nd key, and if you have even more information you can have multi color shift 
if the firmware supports it.

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
With all that padding around I think a little padding in the middle wouldn't 
hurt. Would even suggest a min padding of 1 to have some reserved space in there.
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

I guess you meant x-1 for the address, aka row_end[16] points to the address 
behind the last value so that you can iterate over the row with: i = row_begin; 
i < row_end; ++i

> int rgb_zones;     /* number of rgb zones for zoned keyboards. Note both
>                        zones and per key addressing may be available if
>                        effects are applied per zone. */
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
Don't know if this is necessary, the keyboards I have seen so far apply firmware 
effects globally.
> int speed; /* cycle speed of the effect in milli-hz */

I would split this into speed and speed_max and don't specify an actual unit. 
The firmwares effects I have seen so far: If they have a speed value, it's some 
low number interpreted as a proportional x/n * the max speed of this effect, 
with n being some low number like 8 or 10.

But i don't know if such clearly named properties are even sensefull, see below.

> char color1[3]; /* effect dependend may be unused. */
> char color2[3]; /* effect dependend may be unused. */
> }

We can not predetermine how many colors we might need in the future.

Firmware effects can vary vastly in complexity, e.g. breathing can be a single 
bit switch that just varies the brightness of whatever color setting is 
currently applied. It could have an optional speed argument. It could have nth 
additional color arguments to cycle through, it could have an optional randomize 
bit that either randomizes the order of the defined colors or means that it is 
picking completely random color ignoring the color settings if set.

Like this we could have a very fast explosion of the effects enum e.g.: 
breathing, breathing_2_colors, breathing_3_colors, ... breathing_n_colors, 
breathing_speed_controlled, breathing_speed_controlled_2_colors, ... 
breathing_speed_controlled_n_colors_random_bit, etc.

Or we give up on generic names and just make something like: 
tongfang_breathing_1, tongfang_scan_1, tongfang_breathing_2, clevo_breathing_1

Each with an own struct defined in a big .h file.

Otherwise I think the config struct needs to be dynamically created out of 
information the driver gives to userspace.

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
Regards,

Werner

--------------hpuh8oKwt3KTFVe400DXhefH
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,<br>
    </p>
    <div class="moz-cite-prefix">Am 19.01.24 um 09:44 schrieb Hans de
      Goede:<br>
    </div>
    <blockquote type="cite"
      cite="mid:6bbfdd62-e663-4a45-82f4-445069a8d690@redhat.com">
      <pre class="moz-quote-pre" wrap="">Hi,

On 1/18/24 18:45, Pavel Machek wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Hi!

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">We have an upcoming device that has a per-key keyboard backlight, but does
the control completely via a wmi/acpi interface. So no usable hidraw here
for a potential userspace driver implementation ...

So a quick summary for the ideas floating in this thread so far:

1. Expand leds interface allowing arbitrary modes with semi arbitrary
optional attributes:
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">    - Con:

        - Violates the simplicity paradigm of the leds interface (e.g. with
this one leds entry controls possible multiple leds)
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Let's not do this.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">2. Implement per-key keyboards as auxdisplay

    - Pro:

        - Already has a concept for led positions

        - Is conceptually closer to "multiple leds forming a singular entity"

    - Con:

        - No preexisting UPower support

        - No concept for special hardware lightning modes

        - No support for arbitrary led outlines yet (e.g. ISO style enter-key)
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Please do this one.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Ok, so based on the discussion so far and Pavel's feedback lets try to
design a custom userspace API for this. I do not believe that auxdisplay
is a good fit because:

- auxdisplay is just a directory name, it does not seem to clearly
  define an API

- instead the deprecated /dev/fb API is used which is deprecated

- auxdisplays are very much displays (hence /dev/fb) they are typically
  small LCD displays with a straight widthxheight grid of square pixels

- /dev/fb does gives us nothing for effects, zoned keyboard, etc.</pre>
    </blockquote>
    <p>I was just checking this and wanted to write something similar.
      When I wrote the pro/con list I was mistaken that aux displays use
      either one of 2 APIs (charlcd or fb), but I was mistaken. The 8
      devices implemented there are actually using 5 different apis,
      some of them 2 at a time.</p>
    <p>Just for reference the small list I wrote on the side just now:</p>
    <p>arm-charlcd.c - own implementation without userspace interaction
      (just a static text is displayed)<br>
      cfag12864b.c/cfag12864bfb.c - ks0108_isinited or
      register_framebuffer<br>
      hd44780.c - charlcd_register<br>
      ht16k33.c - linedisp_register or register_framebuffer<br>
      img-ascii-lcd.c - linedisp_register<br>
      ks0108.c - own implementetion using parport_register_dev_model<br>
      lcd2s.c - charlcd_register<br>
      panel.c - charlcd_register<br>
    </p>
    <blockquote type="cite"
      cite="mid:6bbfdd62-e663-4a45-82f4-445069a8d690@redhat.com">
      <pre class="moz-quote-pre" wrap="">

So my proposal would be an ioctl interface (ioctl only no r/w)
using /dev/rgbkbd0 /dev/rgbkdb1, etc. registered as a misc chardev.

For per key controllable rgb LEDs we need to discuss a coordinate
system. I propose using a fixed size of 16 rows of 64 keys,
so 64x16 in standard WxH notation.

And then storing RGB in separate bytes, so userspace will then
always send a buffer of 192 bytes per line (64x3) x 14 rows
= 3072 bytes. With the kernel driver ignoring parts of
the buffer where there are no actual keys.</pre>
    </blockquote>
    The be sure the "14 rows" is a typo? And should be 16 rows?<br>
    <blockquote type="cite"
      cite="mid:6bbfdd62-e663-4a45-82f4-445069a8d690@redhat.com">
      <pre class="moz-quote-pre" wrap="">

I would then like the map the standard 105 key layout onto this,
starting at x.y (column.row) coordinates of 16.6 (with 0.0 being
the top left). Leaving plenty of space on the left top and right
(and some on the bottom) for extra media key rows, macro keys, etc.

The idea to have the standard layout at a fixed place is to allow
userspace to have a database of preset patterns which will work
everywhere.

Note I say standard 105 key layout, but in reality for
defining the standardized part of the buffer we should
use the maximum amount of keys per row of all the standard layouts,
so for row 6 (the ESC row) and for extra keys on the right outside
the main block we use the standard layout as shown here:

<a class="moz-txt-link-freetext" href="http://www.maxkeyboard.com/images/105_ISO_6_25_Key_Layout.jpg">http://www.maxkeyboard.com/images/105_ISO_6_25_Key_Layout.jpg</a>

For the main area of the keyboard looking at:

<a class="moz-txt-link-freetext" href="http://bopqehorizon.weebly.com/uploads/1/3/4/3/134337299/913246919_orig.png">http://bopqehorizon.weebly.com/uploads/1/3/4/3/134337299/913246919_orig.png</a>

We want to max rows per key, so this means that per row we use
(from the above image) :

row  7: 106/109 - JIS 
row  8: 101/104 - ANSI
row  9: 102/105 - ISO
row 10: 104/107 - ABNT
row 11: 106/109 - JIS

(with row 7 being the main area top row)

This way we can address all the possible keys in the various
standard layouts in one standard wat and then the drivers can
just skip keys which are not there when preparing the buffer
to send to the hw / fw.</pre>
    </blockquote>
    <p>Some remarks here:</p>
    <p>- Some keyboards might have two or more leds for big keys like
      (iso-)enter, shift, capslock, num+, etc. that in theory are
      individually controllable by the firmware. In windows drivers this
      is usually abstracted away, but could be interesting for effects
      (e.g. if the top of iso-enter is separate from the bottom of
      iso-enter like with one of our devices).</p>
    <p>- In combination with this: The driver might not be able to tell
      if the actual physical keyboard is ISO or ANSI, so it might not be
      able the correctly assign the leds around enter correctly as being
      an own key or being part of ANSI- or ISO-enter.<br>
    </p>
    <p>- Should the interface have different addresses for the different
      enter and num+ styles (or even the different length shifts and
      spacebars)?</p>
    <p>One idea for this: Actually assign 1 value per line for tall keys
      per line, 3 (or maybe even 4, to have one spare) values per line
      for wide keys and 6 (or 8) values for space. e.g.:</p>
    <p>- Right shift would have 3 values in row 10. The first value
      might be the left side of shift or the additional ABNT/JIS key.
      The 2nd Key might be the left side or middle of shift and the
      third key might be the right side of shift or the only value for
      the whole key. The additional ABNT/JIS key still also has a
      dedicated value which is used by drivers which can differentiate
      between physical layouts.<br>
    </p>
    <p>- Enter would have 3 values in row 8 and 3 values in row 9. With
      the same disambiguation as the additional ABNT/JIS but this time
      for ansii-/ and iso-#<br>
    </p>
    <p>- Num+ would have 2 values, one row 8 and one in row 9. The one
      in row 9 might control the whole key or might just control the
      lower half. The one in row 8 might be another key or the upper
      half</p>
    <p>For the left half if the main block the leftmost value should be
      the "might be the only relevant"-value while the right most value
      should be the "might be another key"-value. For the right side of
      the main block this should be swapped. Unused values should be
      adjacent to the "might be another key"-value, e.g.:</p>
    <pre>                                  | Left shift value 1    | Left shift value 2           | Left shift value 3            | Left shift value 4     | 102nd key value
ISO/ANSI aware                    | Left shift color      | Unused                       | Unused                        | Unused                 | 102nd key color
ISO non aware 1 led under shift   | Left shift color      | Unused                       | Unused                        | 102nd key color        | Unused
ANSI non aware 1 led under shift  | Left shift color      | Unused                       | Unused                        | Unused                 | Unused
ISO non aware 2 leds under shift  | Left shift left color | Left shift right color       | Unused                        | 102nd key color        | Unused
ANSI non aware 2 leds under shift | Left shift left color | Left shift right color       | Unused                        | Unused                 | Unused
ISO non aware 3 leds under shift  | Left shift left color | Left shift middle color      | Left shift right color        | 102nd key color        | Unused
ANSI non aware 3 leds under shift | Left shift left color | Left shift middle color      | Unused                        | Left shift right color | Unused
ANSI non aware 4 leds under shift | Left shift left color | Left shift middle left color | Left shift middle right color | Left shift right color | Unused
</pre>
    <p>Like this with no information you can still reliable target the
      ANSI-shift space, if you know it's an ISO keyboard from user space
      you can target shift and 102nd key, and if you have even more
      information you can have multi color shift if the firmware
      supports it.<br>
    </p>
    <blockquote type="cite"
      cite="mid:6bbfdd62-e663-4a45-82f4-445069a8d690@redhat.com">
      <pre class="moz-quote-pre" wrap="">

One open question is if we should add padding after the main
area so that the printscreen / ins / del / leftarrow of the
"middle" block of 

<a class="moz-txt-link-freetext" href="http://www.maxkeyboard.com/images/105_ISO_6_25_Key_Layout.jpg">http://www.maxkeyboard.com/images/105_ISO_6_25_Key_Layout.jpg</a>

all start at the same x (say 32) or we just pack these directly
after the main area.

And the same question for the numlock block, do we align
this to an x of say 36, or pack it ?</pre>
    </blockquote>
    With all that padding around I think a little padding in the middle
    wouldn't hurt. Would even suggest a min padding of 1 to have some
    reserved space in there.
    <blockquote type="cite"
      cite="mid:6bbfdd62-e663-4a45-82f4-445069a8d690@redhat.com">
      <pre class="moz-quote-pre" wrap="">


As for the actual IOCTL API I think there should be
the following ioctls:

1. A get-info ioctl returning a struct with the following members:

{
char name[64]      /* Keyboard model name / identifier */
int row_begin[16]; /* The x address of the first available key per row. On a std 105key kbd this will be 16 for rows 6-11, 0 for other rows */
int row_end[16];   /* x+1 for the address of the last available key per row, end - begin gives number of keys in a row */</pre>
    </blockquote>
    <p>I guess you meant x-1 for the address, aka row_end[16] points to
      the address behind the last value so that you can iterate over the
      row with: i = row_begin; i &lt; row_end; ++i<br>
    </p>
    <blockquote type="cite"
      cite="mid:6bbfdd62-e663-4a45-82f4-445069a8d690@redhat.com">
      <pre class="moz-quote-pre" wrap="">
int rgb_zones;     /* number of rgb zones for zoned keyboards. Note both
                      zones and per key addressing may be available if
                      effects are applied per zone. */
?
}

2. A set-leds ioctl which takes the earlier discussed 3092 bytes buffer
to set all the LEDs at once, only valid if at least one row has a non 0 lenght.

3. A set-zones ioctl which takes an array of bytes sized 3 * number-of-zones
containing RGB values for each zone

4. A enum_effects ioctl which takes a struct with the following members:

{
long size; /* Size of passed in struct including the size member itself */
long effects_mask[]
}

the idea being that there is an enum with effects, which gets extended
as we encounter more effects and the bitmask in effects_mask has a bit set
for each effects enum value which is supported. effects_mask is an array
so that we don't run out of bits. If older userspace only passes 1 long
(size == (2*sizeof(long)) when 2 are needed at some point in the future 
then the kernel will simply only fill the first long.

5. A set_effect ioctl which takes a struct with the following members:

{
long size; /* Size of passed in struct including the size member itself */
int effect_nr; /* enum value of the effect to enable, 0 for disable effect */
int zone;  /* zone to apply the effect to */</pre>
    </blockquote>
    Don't know if this is necessary, the keyboards I have seen so far
    apply firmware effects globally.<br>
    <blockquote type="cite"
      cite="mid:6bbfdd62-e663-4a45-82f4-445069a8d690@redhat.com">
      <pre class="moz-quote-pre" wrap="">
int speed; /* cycle speed of the effect in milli-hz */</pre>
    </blockquote>
    <p>I would split this into speed and speed_max and don't specify an
      actual unit. The firmwares effects I have seen so far: If they
      have a speed value, it's some low number interpreted as a
      proportional x/n * the max speed of this effect, with n being some
      low number like 8 or 10.</p>
    <p>But i don't know if such clearly named properties are even
      sensefull, see below.<br>
    </p>
    <blockquote type="cite"
      cite="mid:6bbfdd62-e663-4a45-82f4-445069a8d690@redhat.com">
      <pre class="moz-quote-pre" wrap="">
char color1[3]; /* effect dependend may be unused. */
char color2[3]; /* effect dependend may be unused. */
}</pre>
    </blockquote>
    <p>We can not predetermine how many colors we might need in the
      future.</p>
    <p>Firmware effects can vary vastly in complexity, e.g. breathing
      can be a single bit switch that just varies the brightness of
      whatever color setting is currently applied. It could have an
      optional speed argument. It could have nth additional color
      arguments to cycle through, it could have an optional randomize
      bit that either randomizes the order of the defined colors or
      means that it is picking completely random color ignoring the
      color settings if set.</p>
    <p>Like this we could have a very fast explosion of the effects enum
      e.g.: breathing, breathing_2_colors, breathing_3_colors, ...
      breathing_n_colors, breathing_speed_controlled,
      breathing_speed_controlled_2_colors, ...
      breathing_speed_controlled_n_colors_random_bit, etc.</p>
    <p>Or we give up on generic names and just make something like:
      tongfang_breathing_1, tongfang_scan_1, tongfang_breathing_2,
      clevo_breathing_1</p>
    <p>Each with an own struct defined in a big .h file.</p>
    <p>Otherwise I think the config struct needs to be dynamically
      created out of information the driver gives to userspace.</p>
    <blockquote type="cite"
      cite="mid:6bbfdd62-e663-4a45-82f4-445069a8d690@redhat.com">
      <pre class="moz-quote-pre" wrap="">
Again the idea with the size member is that the struct can be extended with
new members if necessary and the kernel will supply a default value for
older userspaces which provide a smaller struct (note size being smaller
then sizeof(struct-v1) will invalid).


Note this is all just a rough sketch suggestions welcome!

Regards,

Hans



</pre>
    </blockquote>
    <p>Regards,</p>
    <p>Werner<br>
    </p>
  </body>
</html>

--------------hpuh8oKwt3KTFVe400DXhefH--
