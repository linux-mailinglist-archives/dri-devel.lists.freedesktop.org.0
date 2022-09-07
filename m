Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C46265B0F29
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 23:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5160310E8CE;
	Wed,  7 Sep 2022 21:31:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ABDF10E8CE;
 Wed,  7 Sep 2022 21:31:26 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id z23so17561543ljk.1;
 Wed, 07 Sep 2022 14:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date;
 bh=ZfOYfQtThYd/KyFSNNpcBedgaTk1E4F3yRLEgfbAULY=;
 b=VRxQGzqTWKt5NLlk4/wdj2oLSzWbBr8RLMvN8dSsLKXanZhEt7wkBCuhODX+wBxFOB
 YTpixeZ69A3ll346PHc6UjYp+sEzIa6jvWfNAroxoqXtG5fVeMQheB6W+g903B1RFpz1
 Cq3FJ1B6nb2XHFOxcTYykeMACstiOgC0BbqUGmbqeBL8KimqxYHmULsWon3QTQym9BKH
 4tn2ZzTYfcyZoD58/obnR57g9KQEGRzIJEUkqSJhjiK++7tIBUFFCrIZUPnUwja+oNgc
 CcQHsGOjipzC9jRFhpGz7LhorgQnalnrEH6Qtdhj0qE1s727C/8tslBuXXnbF6Tutr9I
 97Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=ZfOYfQtThYd/KyFSNNpcBedgaTk1E4F3yRLEgfbAULY=;
 b=z9EcWzkgZH2pvKXKPCA4hLhdXiOiZHkB4iVgY79Xc4/wawnlAqGvJeZzy13NEbJouM
 v55jzfYhNNCiHA+iiuH+6+m2PxkRcWqpFYzkuHhqyxfv6tnSieLrmaEJoCEihqjIwCHe
 k5fXWt1PVrzE67iP9pq1WySTW94dvtY+mgA7+lSgDX2HaRTcYY7e74zS8bt//ZN/Xr06
 C3a9ziGlwqwAEFrl1kTGJTiVoyq+ZWQ4JhU+EXPNaGbdPgd5193Jq1xDPlMbz4Z1pMvQ
 aFoZKsrtulrTDkL8a5fYmauv1Xuu+T4vpU1gtCPfHl9fKJdAsD5Hk/Mq0oNrvwV7G1nk
 6hjQ==
X-Gm-Message-State: ACgBeo0jC/+qqE+O1Dirt+LdJJJlo3/P+JUEo8y5Hbk1ln0+rbkjkSel
 6LP6Zc6waUZbhTmkDcuxUdE=
X-Google-Smtp-Source: AA6agR63jg/DfvolpHhSn3tY0Cl+lM71H7YGuQTXytiA5QL42uEm7EIa+ryHFFQxZzUJpplqg82nJg==
X-Received: by 2002:a2e:804a:0:b0:26b:66d3:4d51 with SMTP id
 p10-20020a2e804a000000b0026b66d34d51mr172137ljg.293.1662586284210; 
 Wed, 07 Sep 2022 14:31:24 -0700 (PDT)
Received: from ?IPV6:2a02:a31a:a240:1700:e929:c054:a46d:3844?
 ([2a02:a31a:a240:1700:e929:c054:a46d:3844])
 by smtp.googlemail.com with ESMTPSA id
 p20-20020a2e9a94000000b0026acfe1b3b4sm549047lji.17.2022.09.07.14.31.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Sep 2022 14:31:23 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <dc1d9499-d4d5-1032-f39f-d4ac4cbb8412@gmail.com>
Date: Wed, 7 Sep 2022 23:31:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
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
In-Reply-To: <20220907143421.4iopqwhp3yfircsh@houat>
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

W dniu 7.09.2022 o 16:34, Maxime Ripard pisze:
> On Mon, Sep 05, 2022 at 06:44:42PM +0200, Mateusz Kwiatkowski wrote:
>> Hi Maxime,
>>
>> W dniu 5.09.2022 o 15:37, Maxime Ripard pisze:
>>>>> +    vfp = vfp_min + (porches_rem / 2);
>>>>> +    vbp = porches - vfp;
>>>>
>>>> Relative position of the vertical sync within the VBI effectively moves the
>>>> image up and down. Adding that (porches_rem / 2) moves the image up off center
>>>> by that many pixels. I'd keep the VFP always at minimum to keep the image
>>>> centered.
>>>
>>> And you would increase the back porch only then?
>>
>> Well, increasing vbp only gives a centered image with the default 480i/576i
>> resolutions. However, only ever changing vbp will cause the image to be always
>> at the bottom of the screen when the active line count is decreased (e.g.
>> setting the resolution to 720x480 but for 50Hz "PAL" - like many game consoles
>> did back in the day).
>>
>> I believe that the perfect solution would:
>>
>> - Use the canonical / standard-defined blanking line counts for the standard
>>   vertical resolutions (480/486/576)
>> - Increase vfp and vbp from there by the same number if a smaller number of
>>   active lines is specified, so that the resulting image is centered
>> - Likewise, decrease vfp and vbp by the same number if the active line number
>>   is larger and there is still leeway (this should allow for seamless handling
>>   of 480i vs. 486i for 60 Hz "NTSC")
>
> I'm not sure I understand how that's any different than the code you
> initially commented on.
>
> I would start by taking the entire blanking area, remove the sync
> period. We only have the two porches now, and I'm starting from the
> minimum, adding as many pixels in both (unless it's not an even number,
> in which case the backporch will have the extra pixel).
>
> Isn't it the same thing?
> [...]
> Unless you only want me to consider the front porch maximum?

I think you're confusing the "post-equalizing pulses" with the "vertical back
porch" a little bit. The "vertical back porch" includes both the post-equalizing
pulses and the entire rest of the VBI period, for the standard resolutions at
least.

The "canonical" modelines (at least for vc4's VEC, see the notes below):

- (vfp==4, vsync==6, vbp==39) for 576i
- (vfp==7, vsync==6, vbp==32) for 480i
- (vfp==5, vsync==6, vbp==28) for 486i (full frame NTSC as originally specified)

The numbers for vfp don't exactly match the theoretical values, because:

- VEC actually adds a half-line pulse on top of VFP_ODD, and in the 625-line
  mode also on top of VFP_EVEN (not always, but let's not dwell too much)
- Conversely, VEC subtracts the half-line pulse from VSYNC_ODD and VSYNC_EVEN
  in the 625-line mode
- SMPTE S170M (see https://www.itu.int/rec/R-REC-BT.1700-0-200502-I/en) defines
  that active picture for NTSC is on lines 21-263 and 283-525; 263 and 283 are
  half-lines that are represented as full lines in the "486i" spec
- SMPTE 314M, which is the spec for DV, defines the 480 active lines as lines
  23-262 and 285-524; see Table 20 on page 26 in
  https://last.hit.bme.hu/download/firtha/video/SMPTE/SMPTE-314M%20DV25-50.pdf;
  this means that the standard 480i frame shaves off four topmost and two
  bottommost lines (2 and 1 per field) of the 486i full frame

Note that the half-line pulses in vfp/vsync may be generated in a different way
on encoders other than vc4's VEC. Maybe we should define some concrete
semantics for vfp/vsync in analog TV modes, and compensate for that in the
drivers. But anyway, that's a separate issue.

My point is that, to get a centered image, you can then proportionately add
values to those "canonical" vfp/vbp values. For example if someone specifies
720x480 frame, but 50 Hz PAL, you should set (vfp==52, vsync==6, vbp==87).
Those extra vbp lines will be treated as a black bar at the top of the frame,
and extra vfp lines will be at the bottom of the frame.

However if someone specifies e.g. 720x604, there's nothing more you could
remove from vfp, so your only option is to reduce vbp compared to the standard
mode, so you'll end up with (vfp==4, vsync==6, vbp==11). The image will not be
centered, the topmost lines will get cropped out, but that's the best we can do
and if someone is requesting such resolution, they most likely want to actually
access the VBI to e.g. emit teletext.

Your current code always starts at (vfp==5 or 6, vsync=6, vbp==6) and then
increases both vfp and vbp proportionately. This puts vsync dead center in the
VBI, which is not how it's supposed to be - and that in turn causes the image
to be significantly shifted upwards.

I hope this makes more sense to you now.

Best regards,
Mateusz Kwiatkowski
