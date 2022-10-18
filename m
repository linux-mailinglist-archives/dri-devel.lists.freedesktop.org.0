Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5826034F1
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 23:29:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A2210F01A;
	Tue, 18 Oct 2022 21:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE8E410EEAE;
 Tue, 18 Oct 2022 21:28:42 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id r22so19710819ljn.10;
 Tue, 18 Oct 2022 14:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:references:cc:to:content-language:subject:reply-to
 :user-agent:mime-version:date:message-id:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4OU8Zwxg156QdzrONF2oQZQLMwyWiR7HNUxgsUc5WfY=;
 b=EOCCw7tePlnV5vQkCJgao9cWevGoLw5Y5Yp5XafKbiY9sn90/ZGdm2Sjh0O4jDQA/4
 h4Hm189YWdCI59Iy4omABXFHgXA+YkFXlwQyHiawVQorr7m9q4E21r2/KgbJsYwbYhEA
 Dbxw9T7RySoY//Qzq2p3gwaZRVE3PaJEVUiqCc7zAtxy89FlwRqUoR7ohzbwp2aIB+Gp
 vYA/wfPqfQXjzaXwVzGtnohIj2dEstFg7f0QcjDCYX5s/tMHv3LqwD/gPjjzGTt/gzkz
 Ja76YK1fhMaIbPyUrAcxSKOtrAh6SZXlMsgWzCsaEeyE2XH9nkJ2aeUpwqyaeUwQAou9
 fA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:references:cc:to:content-language:subject:reply-to
 :user-agent:mime-version:date:message-id:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4OU8Zwxg156QdzrONF2oQZQLMwyWiR7HNUxgsUc5WfY=;
 b=F6cLqu4Z8jGmVfPzmsPcqNMPiM4NVzeI8fj7bSkSC68D4cls9HPLJ9A9WU2dKgHZqh
 hw+ws8ivhtt6Kj8vKFGnoJR9YhtrEsr5U2Bxwb8XY8WhHmsSqyGPkiALVv1qWQsXsbsX
 BKhTB2aco7QNPqj73LkJauhLKrW4E9vGN29OharOpHwdTOCzwZfd/pZTR6Yni+FA1rNI
 OjZHclzV5EZX/RwaSFwrqRHNRFlXdvVuxzfNwblH9cm4a+gUbCnDGtTNAGpDN77yjm1H
 SkPlcTRLPr8cB4/M7u3nDcykQ/LJlymPgSx+DWGYE8ACvrRDQ+zQn6dg0nSt8eqFP0yN
 5p5g==
X-Gm-Message-State: ACrzQf08avTYSne+pUncYr1uXYM1BaoHkHNkqGpOnYHkhWi3L48isgB9
 3wRJfPa6ZjNXlCmv19SHUDI=
X-Google-Smtp-Source: AMsMyM6I10XqpMs813GH0q+zs3c5zhpTvkYzCNQjak6KuMq7xMVwM5QeZwoh6ZuDreSMA43MfYe7wQ==
X-Received: by 2002:a2e:8717:0:b0:26f:c379:677 with SMTP id
 m23-20020a2e8717000000b0026fc3790677mr1702265lji.445.1666128520627; 
 Tue, 18 Oct 2022 14:28:40 -0700 (PDT)
Received: from ?IPV6:2a02:a31a:a240:1700:ade4:dc4:81f3:286b?
 ([2a02:a31a:a240:1700:ade4:dc4:81f3:286b])
 by smtp.googlemail.com with ESMTPSA id
 g3-20020a056512118300b004a27d2ea029sm2007903lfr.172.2022.10.18.14.28.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Oct 2022 14:28:39 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Content-Type: multipart/alternative;
 boundary="------------omM0clkR5bRAZrwq1o3dB3sR"
Message-ID: <da2b4cb4-5d12-3161-64e3-e87a8cc63e81@gmail.com>
Date: Tue, 18 Oct 2022 23:28:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [PATCH v5 20/22] drm/vc4: vec: Convert to the new TV mode property
Content-Language: pl
To: Maxime Ripard <maxime@cerno.tech>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>
References: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
 <20220728-rpi-analog-tv-properties-v5-20-d841cc64fe4b@cerno.tech>
 <c1949248-fb40-682c-492e-bafbd915cee3@gmail.com>
 <81936381-ae37-8c84-4681-9eff19f653b5@tronnes.org>
 <20221018100033.d2sf7xagyycx5d4p@houat>
In-Reply-To: <20221018100033.d2sf7xagyycx5d4p@houat>
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
Reply-To: kfyatek+publicgit@gmail.com
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------omM0clkR5bRAZrwq1o3dB3sR
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Maxime,

W dniu 18.10.2022 o 12:00, Maxime Ripard pisze:
> On Mon, Oct 17, 2022 at 12:31:31PM +0200, Noralf Trønnes wrote:
>> Den 16.10.2022 20.52, skrev Mateusz Kwiatkowski:
>>>>  static int vc4_vec_connector_get_modes(struct drm_connector *connector)
>>>>  {
>>>> -	struct drm_connector_state *state = connector->state;
>>>>  	struct drm_display_mode *mode;
>>>>  
>>>> -	mode = drm_mode_duplicate(connector->dev,
>>>> -				  vc4_vec_tv_modes[state->tv.legacy_mode].mode);
>>>> +	mode = drm_mode_analog_ntsc_480i(connector->dev);
>>>>  	if (!mode) {
>>>>  		DRM_ERROR("Failed to create a new display mode\n");
>>>>  		return -ENOMEM;
>>>>  	}
>>>>  
>>>> +	mode->type |= DRM_MODE_TYPE_PREFERRED;
>>>>  	drm_mode_probed_add(connector, mode);
>>>>  
>>>> -	return 1;
>>>> +	mode = drm_mode_analog_pal_576i(connector->dev);
>>>> +	if (!mode) {
>>>> +		DRM_ERROR("Failed to create a new display mode\n");
>>>> +		return -ENOMEM;
>>>> +	}
>>>> +
>>>> +	drm_mode_probed_add(connector, mode);
>>>> +
>>>> +	return 2;
>>>> +}
>>>
>>> Referencing those previous discussions:
>>> - https://lore.kernel.org/dri-devel/0255f7c6-0484-6456-350d-cf24f3fee5d6@tronnes.org/
>>> - https://lore.kernel.org/dri-devel/c8f8015a-75da-afa8-ca7f-b2b134cacd16@gmail.com/
>>>
>>> Unconditionally setting the 480i mode as DRM_MODE_TYPE_PREFERRED causes Xorg
>>> (at least on current Raspberry Pi OS) to display garbage when
>>> video=Composite1:PAL is specified on the command line, so I'm afraid this won't
>>> do.
>>>
>>> As I see it, there are three viable solutions for this issue:
>>>
>>> a) Somehow query the video= command line option from this function, and set
>>>    DRM_MODE_TYPE_PREFERRED appropriately. This would break the abstraction
>>>    provided by global DRM code, but should work fine.
>>>
>>> b) Modify drm_helper_probe_add_cmdline_mode() so that it sets
>>>    DRM_MODE_TYPE_PREFERRED in addition to DRM_MODE_TYPE_USERDEF. This seems
>>>    pretty robust, but affects the entire DRM subsystem, which may break
>>>    userspace in different ways.
>>>
>>>    - Maybe this could be mitigated by adding some additional conditions, e.g.
>>>      setting the PREFERRED flag only if no modes are already flagged as such
>>>      and/or only if the cmdline mode is a named one (~= analog TV mode)
>>>
>>> c) Forcing userspace (Xorg / Raspberry Pi OS) to get fixed and honor the USERDEF
>>>    flag.
>>>
>>> Either way, hardcoding 480i as PREFERRED does not seem right.
>>>
>>
>> My solution for this is to look at tv.mode to know which mode to mark as
>> preferred. Maxime didn't like this since it changes things behind
>> userspace's back. I don't see how that can cause any problems for userspace.
>>
>> If userspace uses atomic and sets tv_mode, it has to know which mode to
>> use before hand, so it doesn't look at the preferreded flag.
>>
>> If it uses legacy and sets tv_mode, it can end up with a stale preferred
>> flag, but no worse than not having the flag or that ntsc is always
>> preferred.
>>
>> If it doesn't change tv_mode, there's no problem, the preferred flag
>> doesn't change.
>
> I don't like it because I just see no way to make this reliable. When we
> set tv_mode, we're not only going to change the preferred flag, but also
> the order of the modes to make the preferred mode first.
>
> Since we just changed the mode lists, we also want to send a hotplug
> event to userspace so that it gets notified of it. It will pick up the
> new preferred mode, great.
>
> But what if it doesn't? There's no requirement for userspace to handle
> hotplug events, and Kodi won't for example. So we just changed the TV
> mode but not the actual mode, and that's it. It's just as broken for
> Kodi as it is for X11 right now.
>
> If we can't get a bullet-proof solution, then I'm not convinced it's
> worth addressing. Especially since it's already the current state, and
> it doesn't seem to bother a lot of people.

I wouldn't rely on the "doesn't seem to bother a lot of people" bit too much.
Here's why:

- Analog TV output is a relatively obscure feature in this day and age in the
  first place.

- Out of the people interested in using it with VC4/VEC, many are actually using
  the downstream kernel from https://github.com/raspberrypi/linux instead of the
  upstream kernel, and/or firmware mode-switching instead of proper KMS.

  - The downstream kernel only reports modes that match the TV mode set at boot
    either via vc4.tv_norm=, or implied by the resolution set via video=; note
    that video= is also set appropriately at boot by Pi firmware, based on the
    value of sdtv_mode set in config.txt. See also the
    vc4_vec_connector_get_modes() and vc4_vec_get_default_mode() functions in
    https://github.com/raspberrypi/linux/blob/dbd073e4028580a09b6ee507e0c137441cb52650/drivers/gpu/drm/vc4/vc4_vec.c

  - When firmware mode-switching is used, it sets the appropriate TV mode and
    resolution based on the sdtv_mode set in config.txt.

So, all in all, the number of people who would use 1. analog TV out with VC4,
2. the upstream kernel, 3. full KMS (and thus the vc4_vec.c code) is rather
small, so the fact that you're not hearing too many complaints doesn't mean that
the current behavior is OK. If anybody ran into problems and was bothered by
that, they likely migrated to the downstream kernel and/or firmware
mode-switching.

That being said, I completely forgot that there's a cmdline_mode field in
struct drm_connector, even though I actually added code that examines it inside
vc4_vec_connector_get_modes() that's in the downstream kernel. So... what do
you think about just examining connector->cmdline_mode.tv_mode there? It seems
to solve all the problems.

Best regards,
Mateusz Kwiatkowski

--------------omM0clkR5bRAZrwq1o3dB3sR
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hi Maxime,

W dniu 18.10.2022 o 12:00, Maxime Ripard pisze:
&gt; On Mon, Oct 17, 2022 at 12:31:31PM +0200, Noralf Trønnes wrote:
&gt;&gt; Den 16.10.2022 20.52, skrev Mateusz Kwiatkowski:
&gt;&gt;&gt;&gt;  static int vc4_vec_connector_get_modes(struct drm_connector *connector)
&gt;&gt;&gt;&gt;  {
&gt;&gt;&gt;&gt; -	struct drm_connector_state *state = connector-&gt;state;
&gt;&gt;&gt;&gt;  	struct drm_display_mode *mode;
&gt;&gt;&gt;&gt;  
&gt;&gt;&gt;&gt; -	mode = drm_mode_duplicate(connector-&gt;dev,
&gt;&gt;&gt;&gt; -				  vc4_vec_tv_modes[state-&gt;tv.legacy_mode].mode);
&gt;&gt;&gt;&gt; +	mode = drm_mode_analog_ntsc_480i(connector-&gt;dev);
&gt;&gt;&gt;&gt;  	if (!mode) {
&gt;&gt;&gt;&gt;  		DRM_ERROR("Failed to create a new display mode\n");
&gt;&gt;&gt;&gt;  		return -ENOMEM;
&gt;&gt;&gt;&gt;  	}
&gt;&gt;&gt;&gt;  
&gt;&gt;&gt;&gt; +	mode-&gt;type |= DRM_MODE_TYPE_PREFERRED;
&gt;&gt;&gt;&gt;  	drm_mode_probed_add(connector, mode);
&gt;&gt;&gt;&gt;  
&gt;&gt;&gt;&gt; -	return 1;
&gt;&gt;&gt;&gt; +	mode = drm_mode_analog_pal_576i(connector-&gt;dev);
&gt;&gt;&gt;&gt; +	if (!mode) {
&gt;&gt;&gt;&gt; +		DRM_ERROR("Failed to create a new display mode\n");
&gt;&gt;&gt;&gt; +		return -ENOMEM;
&gt;&gt;&gt;&gt; +	}
&gt;&gt;&gt;&gt; +
&gt;&gt;&gt;&gt; +	drm_mode_probed_add(connector, mode);
&gt;&gt;&gt;&gt; +
&gt;&gt;&gt;&gt; +	return 2;
&gt;&gt;&gt;&gt; +}
&gt;&gt;&gt;
&gt;&gt;&gt; Referencing those previous discussions:
&gt;&gt;&gt; - <a class="moz-txt-link-freetext" href="https://lore.kernel.org/dri-devel/0255f7c6-0484-6456-350d-cf24f3fee5d6@tronnes.org/">https://lore.kernel.org/dri-devel/0255f7c6-0484-6456-350d-cf24f3fee5d6@tronnes.org/</a>
&gt;&gt;&gt; - <a class="moz-txt-link-freetext" href="https://lore.kernel.org/dri-devel/c8f8015a-75da-afa8-ca7f-b2b134cacd16@gmail.com/">https://lore.kernel.org/dri-devel/c8f8015a-75da-afa8-ca7f-b2b134cacd16@gmail.com/</a>
&gt;&gt;&gt;
&gt;&gt;&gt; Unconditionally setting the 480i mode as DRM_MODE_TYPE_PREFERRED causes Xorg
&gt;&gt;&gt; (at least on current Raspberry Pi OS) to display garbage when
&gt;&gt;&gt; video=Composite1:PAL is specified on the command line, so I'm afraid this won't
&gt;&gt;&gt; do.
&gt;&gt;&gt;
&gt;&gt;&gt; As I see it, there are three viable solutions for this issue:
&gt;&gt;&gt;
&gt;&gt;&gt; a) Somehow query the video= command line option from this function, and set
&gt;&gt;&gt;    DRM_MODE_TYPE_PREFERRED appropriately. This would break the abstraction
&gt;&gt;&gt;    provided by global DRM code, but should work fine.
&gt;&gt;&gt;
&gt;&gt;&gt; b) Modify drm_helper_probe_add_cmdline_mode() so that it sets
&gt;&gt;&gt;    DRM_MODE_TYPE_PREFERRED in addition to DRM_MODE_TYPE_USERDEF. This seems
&gt;&gt;&gt;    pretty robust, but affects the entire DRM subsystem, which may break
&gt;&gt;&gt;    userspace in different ways.
&gt;&gt;&gt;
&gt;&gt;&gt;    - Maybe this could be mitigated by adding some additional conditions, e.g.
&gt;&gt;&gt;      setting the PREFERRED flag only if no modes are already flagged as such
&gt;&gt;&gt;      and/or only if the cmdline mode is a named one (~= analog TV mode)
&gt;&gt;&gt;
&gt;&gt;&gt; c) Forcing userspace (Xorg / Raspberry Pi OS) to get fixed and honor the USERDEF
&gt;&gt;&gt;    flag.
&gt;&gt;&gt;
&gt;&gt;&gt; Either way, hardcoding 480i as PREFERRED does not seem right.
&gt;&gt;&gt;
&gt;&gt;
&gt;&gt; My solution for this is to look at tv.mode to know which mode to mark as
&gt;&gt; preferred. Maxime didn't like this since it changes things behind
&gt;&gt; userspace's back. I don't see how that can cause any problems for userspace.
&gt;&gt;
&gt;&gt; If userspace uses atomic and sets tv_mode, it has to know which mode to
&gt;&gt; use before hand, so it doesn't look at the preferreded flag.
&gt;&gt;
&gt;&gt; If it uses legacy and sets tv_mode, it can end up with a stale preferred
&gt;&gt; flag, but no worse than not having the flag or that ntsc is always
&gt;&gt; preferred.
&gt;&gt;
&gt;&gt; If it doesn't change tv_mode, there's no problem, the preferred flag
&gt;&gt; doesn't change.
&gt;
&gt; I don't like it because I just see no way to make this reliable. When we
&gt; set tv_mode, we're not only going to change the preferred flag, but also
&gt; the order of the modes to make the preferred mode first.
&gt;
&gt; Since we just changed the mode lists, we also want to send a hotplug
&gt; event to userspace so that it gets notified of it. It will pick up the
&gt; new preferred mode, great.
&gt;
&gt; But what if it doesn't? There's no requirement for userspace to handle
&gt; hotplug events, and Kodi won't for example. So we just changed the TV
&gt; mode but not the actual mode, and that's it. It's just as broken for
&gt; Kodi as it is for X11 right now.
&gt;
&gt; If we can't get a bullet-proof solution, then I'm not convinced it's
&gt; worth addressing. Especially since it's already the current state, and
&gt; it doesn't seem to bother a lot of people.

I wouldn't rely on the "doesn't seem to bother a lot of people" bit too much.
Here's why:

- Analog TV output is a relatively obscure feature in this day and age in the
  first place.

- Out of the people interested in using it with VC4/VEC, many are actually using
  the downstream kernel from <a class="moz-txt-link-freetext" href="https://github.com/raspberrypi/linux">https://github.com/raspberrypi/linux</a> instead of the
  upstream kernel, and/or firmware mode-switching instead of proper KMS.

  - The downstream kernel only reports modes that match the TV mode set at boot
    either via vc4.tv_norm=, or implied by the resolution set via video=; note
    that video= is also set appropriately at boot by Pi firmware, based on the
    value of sdtv_mode set in config.txt. See also the
    vc4_vec_connector_get_modes() and vc4_vec_get_default_mode() functions in
    <a class="moz-txt-link-freetext" href="https://github.com/raspberrypi/linux/blob/dbd073e4028580a09b6ee507e0c137441cb52650/drivers/gpu/drm/vc4/vc4_vec.c">https://github.com/raspberrypi/linux/blob/dbd073e4028580a09b6ee507e0c137441cb52650/drivers/gpu/drm/vc4/vc4_vec.c</a>

  - When firmware mode-switching is used, it sets the appropriate TV mode and
    resolution based on the sdtv_mode set in config.txt.

So, all in all, the number of people who would use 1. analog TV out with VC4,
2. the upstream kernel, 3. full KMS (and thus the vc4_vec.c code) is rather
small, so the fact that you're not hearing too many complaints doesn't mean that
the current behavior is OK. If anybody ran into problems and was bothered by
that, they likely migrated to the downstream kernel and/or firmware
mode-switching.

That being said, I completely forgot that there's a cmdline_mode field in
struct drm_connector, even though I actually added code that examines it inside
vc4_vec_connector_get_modes() that's in the downstream kernel. So... what do
you think about just examining connector-&gt;cmdline_mode.tv_mode there? It seems
to solve all the problems.

Best regards,
Mateusz Kwiatkowski
</pre>
  </body>
</html>

--------------omM0clkR5bRAZrwq1o3dB3sR--
