Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 974BA5B4C19
	for <lists+dri-devel@lfdr.de>; Sun, 11 Sep 2022 06:49:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A2B10E3B3;
	Sun, 11 Sep 2022 04:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A509410E270;
 Sun, 11 Sep 2022 04:48:55 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id bn9so6858287ljb.6;
 Sat, 10 Sep 2022 21:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date;
 bh=Dzsg7L5ZergN95ne20wSAndouco2GHRCcAKDGT5ut8M=;
 b=lnJSJ1rpPquPPQQ7+qwNxZU0KY4cxdt9cZsUfORqiByh5zBeV7T/f2AeD4CHLeQWsL
 pn/QAS+EYTqsiG33r4KCLVivr4UVR2fkrWlUbBFPEs2NN8DOnjcYFzDbEeCxW6j/eSrk
 UpfjmHvlyE5mteYOdPzKQlvIJjr45s4gE4qzJ9Aguut4RLgTyipHyMQAZLcC1fwFHgoL
 sO1OkWvcsJfljWKfyz3usM58D7bW30DTD4Lk2j6CKNy4eRRSn6HoiBzaIuU5kxmYdb3A
 DWw8dBUSROSbZrw422MwwHDwQfmjPxfumFzmZsU7nuvtjQWZB2IHbIG3YAHF+KSJ/l0q
 Grmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=Dzsg7L5ZergN95ne20wSAndouco2GHRCcAKDGT5ut8M=;
 b=EGLux+m1EqorDNUPXm5YBz9sSAkStxMOt7ltrZiIycKSWXCLwA0gpNLsJTZr90Q4Nc
 DXZQa0FIbHTyIoL5U8S1LXjnF2FZUwFMuroSs0IWRQ3qprG+k5psnTQEQezgPyUp6eex
 +DJ3oNAMqAJxakBsP2fP0yL9luwlkiv4ZvtuEmk5cLwoJoaHiVgXoGKdPEirqXecsPCM
 P73uSYCY44Qg9wAiO7wCbETZh7r36zNEk44m9qvpFOYLlMVgdw9Q1zRB7IbrghqhNFnX
 S7Pq9s2n3/c8zToZvIlut0vibO4qIiEhsdPeYM394uaTGdluh1N8yjmzM+CeZGUjU1ob
 HMnw==
X-Gm-Message-State: ACgBeo1e6fjItJzXGOF3GRQ84e4OPxf2B7Y9JWaPMJP3/p1TSk4cbEIU
 zK39PgcVzfGTgA7+gWH/LUM=
X-Google-Smtp-Source: AA6agR4/MY0JB6ClAyvCNHYM+nBqc9ZHtZAEN3tIKgEe93m/3PECgyhOeLoav75g49sW8ehsPZL7+w==
X-Received: by 2002:a2e:a7c6:0:b0:26b:e7b4:5136 with SMTP id
 x6-20020a2ea7c6000000b0026be7b45136mr2628014ljp.425.1662871733790; 
 Sat, 10 Sep 2022 21:48:53 -0700 (PDT)
Received: from ?IPV6:2a02:a31a:a240:1700:e929:c054:a46d:3844?
 ([2a02:a31a:a240:1700:e929:c054:a46d:3844])
 by smtp.googlemail.com with ESMTPSA id
 m9-20020a056512358900b00497a7dfe6a9sm482145lfr.64.2022.09.10.21.48.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Sep 2022 21:48:53 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <79ab3fef-fdaa-e191-d839-4af88191e672@gmail.com>
Date: Sun, 11 Sep 2022 06:48:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
Subject: Re: [PATCH v2 10/41] drm/modes: Add a function to generate analog
 display modes
Content-Language: pl
To: Maxime Ripard <maxime@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-10-459522d653a7@cerno.tech>
 <242d272b-5b79-986c-9aaf-64e62f6b37ff@gmail.com>
 <20220905133755.gcmmntg3wnecyqjq@houat>
 <10ce686a-d7c8-9ce4-3979-735ad8eab3b5@gmail.com>
 <20220907143421.4iopqwhp3yfircsh@houat>
 <dc1d9499-d4d5-1032-f39f-d4ac4cbb8412@gmail.com>
 <20220909135444.5oi6oh6nqwuke3jl@houat>
In-Reply-To: <20220909135444.5oi6oh6nqwuke3jl@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 intel-gfx@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

W dniu 9.09.2022 o 15:54, Maxime Ripard pisze:
> Hi,
>
> On Wed, Sep 07, 2022 at 11:31:21PM +0200, Mateusz Kwiatkowski wrote:
> [...]
>> I think you're confusing the "post-equalizing pulses" with the "vertical back
>> porch" a little bit. The "vertical back porch" includes both the post-equalizing
>> pulses and the entire rest of the VBI period, for the standard resolutions at
>> least.
>>
>> The "canonical" modelines (at least for vc4's VEC, see the notes below):
>>
>> - (vfp==4, vsync==6, vbp==39) for 576i
>> - (vfp==7, vsync==6, vbp==32) for 480i
>> - (vfp==5, vsync==6, vbp==28) for 486i (full frame NTSC as originally specified)
>>
>> The numbers for vfp don't exactly match the theoretical values, because:
>>
>> - VEC actually adds a half-line pulse on top of VFP_ODD, and in the 625-line
>>   mode also on top of VFP_EVEN (not always, but let's not dwell too much)
>> - Conversely, VEC subtracts the half-line pulse from VSYNC_ODD and VSYNC_EVEN
>>   in the 625-line mode
>> - SMPTE S170M (see https://www.itu.int/rec/R-REC-BT.1700-0-200502-I/en) defines
>>   that active picture for NTSC is on lines 21-263 and 283-525; 263 and 283 are
>>   half-lines that are represented as full lines in the "486i" spec
>
> It's going to be a bit difficult to match that into a drm_display_mode,
> since as far I understand it, all the timings are the sum of the timings
> of both fields in interlaced. I guess we'll have to be close enough.

Well, it's probably the job of the CRTC driver to split the values from
drm_display_mode back into separate values for odd and even fields. That's how
it's done in the vc4 driver, anyway.

>
>> - SMPTE 314M, which is the spec for DV, defines the 480 active lines as lines
>>   23-262 and 285-524; see Table 20 on page 26 in
>>   https://last.hit.bme.hu/download/firtha/video/SMPTE/SMPTE-314M%20DV25-50.pdf;
>>   this means that the standard 480i frame shaves off four topmost and two
>>   bottommost lines (2 and 1 per field) of the 486i full frame
>
> I'm still struggling a bit to match that into front porch, sync period
> and back porch. I guess the sync period is easy since it's pretty much
> fixed. That line 0-23 is the entire blanking area though, right?

Yes, lines 0-23 is the entire blanking area. And the "back porch" in this
context is everything from the start of the sync pulse to the start of active
video. It's not just the equalizing pulses.

The equalizing pulses have no equivalent in DRM terms. VC4/VEC inserts those
automatically and there's no direct control over them, I'm not sure about other
encoders.

The equalizing pulses are also not essential for the composite video to work.
The spec requires them, but most TVs will tolerate them not being there (and
early systems like the British 405-line system didn't have any).

>> Note that the half-line pulses in vfp/vsync may be generated in a different way
>> on encoders other than vc4's VEC. Maybe we should define some concrete
>> semantics for vfp/vsync in analog TV modes, and compensate for that in the
>> drivers. But anyway, that's a separate issue.
>>
>> My point is that, to get a centered image, you can then proportionately add
>> values to those "canonical" vfp/vbp values. For example if someone specifies
>> 720x480 frame, but 50 Hz PAL, you should set (vfp==52, vsync==6, vbp==87).
>
> In this case, you add 48 both front porches, right? How is that
> proportionate?

Yes, I meant adding 48 lines to both porches, and I meant "proportionately" as
"split equally". Maybe that was an unfortunate choice of words.

>> Those extra vbp lines will be treated as a black bar at the top of the frame,
>> and extra vfp lines will be at the bottom of the frame.
>>
>> However if someone specifies e.g. 720x604, there's nothing more you could
>> remove from vfp, so your only option is to reduce vbp compared to the standard
>> mode, so you'll end up with (vfp==4, vsync==6, vbp==11). The image will not be
>> centered, the topmost lines will get cropped out, but that's the best we can do
>> and if someone is requesting such resolution, they most likely want to actually
>> access the VBI to e.g. emit teletext.
>>
>> Your current code always starts at (vfp==5 or 6, vsync=6, vbp==6) and then
>> increases both vfp and vbp proportionately. This puts vsync dead center in the
>> VBI, which is not how it's supposed to be - and that in turn causes the image
>> to be significantly shifted upwards.
>>
>> I hope this makes more sense to you now.
>
> I'm really struggling with this, so thanks for explaining this further
> (and patiently ;))
>
> If I get this right, what you'd like to change is this part of the
> calculus (simplified a bit, and using PAL, 576i):
>
>   vfp_min = params->vfp_lines.even + params->vfp_lines.odd; // 5
>   vbp_min = params->vbp_lines.even + params->vbp_lines.odd; // 6
>   vslen = params->vslen_lines.even + params->vslen_lines.odd; // 6
>
>   porches = params->num_lines - vactive - vslen; // 43
>   porches_rem = porches - vfp_min - vbp_min; // 32
>
>   vfp = vfp_min + (porches_rem / 2); // 21
>   vbp = porches - vfp; // 22
>
> Which is indeed having sync centered.
>
> I initially changed it to:
>
>   vfp = vfp_min; // 6
>   vbp = num_lines - vactive - vslen - vfp; // 38
>
> Which is close enough for 576i, but at 480i/50Hz would end up with 134,
> so still fairly far off.
>
> I guess your suggestion would be along the line of:
>
>   vfp_min = params->vfp_lines.even + params->vfp_lines.odd; // 5
>   vbp_min = params->vbp_lines.even + params->vbp_lines.odd; // 38
>   vslen = params->vslen_lines.even + params->vslen_lines.odd; // 6
>
>   porches = params->num_lines - vactive - vslen; // 0
>   porches_rem = porches - vfp_min - vbp_min; // 0
>
>   vfp = vfp_min + (porches_rem / 2); // 5
>   vbp = porches - vfp; // 38
>
> Which is still close enough for 576i, but for 480i would end up with:
>
>   porches = params->num_lines - vactive - vslen; // 139
>   porches_rem = porches - vfp_min - vbp_min; // 96
>
>   vfp = vfp_min + (porches_rem / 2); // 53
>   vbp = porches - vfp; // 86
>
> Right?

Yes. And if that's supposed to mean 480i in 50 Hz "PAL" mode, that's also
"close enough" to the values I suggested above.

If you substitute values for true 60 Hz "NTSC" 480i, you should also get values
that are "close enough" to the official spec.

The only thing I'd conceptually change is that the 38 lines is not really
"vbp_min". It's more like "vbp_typ". As I mentioned above, we may want to lower
this value if someone wants more active lines than the official 486/576.
If they're doing that, they probably want to have vbp in the framebuffer,
like VBIT2.

Best regards,
Mateusz Kwiatkowski
