Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BDC5B1B74
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 13:31:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B942D10EA96;
	Thu,  8 Sep 2022 11:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA0B810EA96;
 Thu,  8 Sep 2022 11:31:39 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id z20so19515596ljq.3;
 Thu, 08 Sep 2022 04:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date;
 bh=Pe/I+w+iO2pwgJXl8T4sC38en64C2l3oERN/xelPq20=;
 b=V4sxO+75nLSa4ntHYBDYJK7NyyItm+0ZuqLo4c8gxEblOEQGHihNxBzP1ywfeAMYWP
 A6gbXFUa+oFissD0CGGT9qZjiT57qAO/LcaelBX/nJDUId7ciewfaXSWVpw6M29eM72Z
 q0uRM6YPLLMRxsucdQdim3Ufr73pusbVeQPwM6bfhtQ87iWKRwLxmE3cBBQxY4H9VZIf
 pQM3O1hiKQXGJzsJvyphYtgmgFfp7lXMh65ITn1H0JW5pYN/LHrKWP/ORM0dXXFdRZOf
 6SddjB7+yub2ELpu5aTF2EbiCg6LgO8CuZOMv2TnRuzKXVquW5W4obBFXEUnssRCyD4H
 ta2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=Pe/I+w+iO2pwgJXl8T4sC38en64C2l3oERN/xelPq20=;
 b=NtJLZb4uRW8yHAPfIPxN+OhxxLLr/OGzJseeOC5S76lHMmmx05WBC1VBnLe9mY9isC
 xIhqh04NmPUY2xQey2qE/KTIcJUvuDLKiUowS67D1D7kD7d/4VWkJ7kUEFmuunXDtUck
 WmbUNbWcF9xeHNm3zlJZtXigsZElNw8R9gFo89a0lqOFTld4ncsmV+GOh9JdKXJ+kZwA
 LO6vtkLWcEkJtHVuapgSkEBTIGTx6RmwDilHPw0e9SsdyTAbX5eeOpUKj+SysTph+bwA
 1fX31tcJqrJMDndkmNnqhhh1bVaMlDxxbmNfrKOozyD75sorukQWBlLb/hqp7ymQhXxC
 5hqw==
X-Gm-Message-State: ACgBeo1yHExU/QHz1mSjUaehJ7MhXgCvGkUhnpGn0gzBvwY//PCKmc14
 odNWpIJtAx9ZOZipU5O8Keo=
X-Google-Smtp-Source: AA6agR7hqDYt7a6c30Zzx2HM7qo0bpBArfiiaiAMashCn8pCJhXeqGkG5/jvmcd17AYfIZXNcSfBMg==
X-Received: by 2002:a2e:b16c:0:b0:266:175c:cd54 with SMTP id
 a12-20020a2eb16c000000b00266175ccd54mr2425837ljm.278.1662636698015; 
 Thu, 08 Sep 2022 04:31:38 -0700 (PDT)
Received: from [10.10.53.53] (81-18-220-16.static.chello.pl. [81.18.220.16])
 by smtp.googlemail.com with ESMTPSA id
 z20-20020a195e54000000b00497a879e552sm930968lfi.291.2022.09.08.04.31.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 04:31:37 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <aa510ec2-a72d-364b-424e-816872ab6923@gmail.com>
Date: Thu, 8 Sep 2022 13:31:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 32/41] drm/vc4: vec: Convert to the new TV mode property
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-32-459522d653a7@cerno.tech>
 <199cf4b3-8ace-e047-3050-b810cf0c6b63@tronnes.org>
 <20220908112312.hlb7mzneuxnethhr@houat>
In-Reply-To: <20220908112312.hlb7mzneuxnethhr@houat>
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
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

W dniu 08.09.2022 o 13:23, Maxime Ripard pisze:
> Hi Noralf,
>
> On Tue, Aug 30, 2022 at 09:01:08PM +0200, Noralf Trønnes wrote:
>>> +static const struct drm_prop_enum_list tv_mode_names[] = {
>>
>> Maybe call it legacy_tv_mode_enums?
>>
>>>
>>> +    { VC4_VEC_TV_MODE_NTSC, "NTSC", },
>>>
>>> +    { VC4_VEC_TV_MODE_NTSC_J, "NTSC-J", },
>>>
>>> +    { VC4_VEC_TV_MODE_PAL, "PAL", },
>>>
>>> +    { VC4_VEC_TV_MODE_PAL_M, "PAL-M", },
>>
>> If you use DRM_MODE_TV_MODE_* here you don't need to translate the value
>> using the switch statement in get/set property, you can use the value
>> directly to get/set tv.mode.
>
> I'm sorry, I'm not quite sure what you mean by that. If we expose the
> DRM_MODE_TV_MODE_* properties there, won't that change the values the
> userspace will need to use to set that property?

I'd just like to point out that if numerical values of these enums are your
concern, then you're (or perhaps I am ;) already breaking this by adding new
modes in patch 33/41 in this series.

And the values (and names!) added by that patch (33/41) don't match those
currently used by the downstream version
(https://github.com/raspberrypi/linux/blob/rpi-5.15.y/drivers/gpu/drm/vc4/vc4_vec.c).
If any userspace software is manipulating this property, it's most likely
targeting the downstream code. But since you're not aiming for consistency with
that, I was under the impression that compatibility isn't a concern.

Best regards,
Mateusz Kwiatkowski
