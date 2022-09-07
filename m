Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 902025B0D7D
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 21:52:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C3310E85F;
	Wed,  7 Sep 2022 19:52:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA6710E85F;
 Wed,  7 Sep 2022 19:52:14 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id x10so17260593ljq.4;
 Wed, 07 Sep 2022 12:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date;
 bh=yUwzU/FoG+85Ns4JdKII1z4ExnjRnKZlkKN2lB94FG4=;
 b=EKndYRdVlHtxdl+2W2aMAnRcArmaEjb20S8XowRXOt1VLMMDtTJdYqxKxAlBBZXyWd
 beiU3DVPCWge6/5Jg6qPhE0a+1616foGXx6ccgD5um3vyJVgdOypvwX3Alfwmn0OMEv6
 osBKtnVrz3Tqxmnij9JYHOmyhHrATbkkWaGS1Nd40b8MWyBfRTvw/MjsD1piSslcskUZ
 NRYgTDsApqjZ8j1gq4VKOeOhsZtRXmWkF7W30sVhfK9lr0b7H5IgxBJWFO7zJ5vka5fs
 XJpXg6LAG3ogXAWMfihP+jmbQNxYhsPHDAC71b5pHhwLgnlh9O2gkRzz2MPrwhkjteEM
 Axag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=yUwzU/FoG+85Ns4JdKII1z4ExnjRnKZlkKN2lB94FG4=;
 b=lU0qswS8EVCyOOsO5y3GosNIzQtlA0OYiYqO3go/wO2EmvKo2JDOG61AZyruNOMUYy
 E+aX+IOsU0z4VqkIQViYew7ptVqqrKvCe/gBhKY6dbfeiEKZy3+oySQC2o+vZpEF3cOR
 k0axqx/UrOsrMU/eTtlSPI7vV7JLBU0nuymj9tySJFrnkbCBkH0kjwWwEwxBMimg1Yd9
 WR8zadEdytl110+zKvVYEJcbKkjBkAuUyA4DihlGBACG6/TNPw5f+tDFdCZL8tYxFyVV
 Y+ODxxLPad0Wcdm8OKX12g1GXNkoN6/Bqqqyvyz/VaBb5sByC1C5oCBpm++5gcjKgXMf
 Wdew==
X-Gm-Message-State: ACgBeo0lOlNQo0bLQCQQB8KhtGQdufkH/+R7vnhUaCW0DzgItzx/jOiY
 EFA9Oa4bTz2ypxSc44ax2Tk=
X-Google-Smtp-Source: AA6agR7prye+anBkusQWIezcT9fPSQhdu5CxUaHX1aDvTKI8jdwbC5l35BglvHJ8rPbpT1REMeLQag==
X-Received: by 2002:a05:651c:110d:b0:269:f9c0:d155 with SMTP id
 e13-20020a05651c110d00b00269f9c0d155mr1430507ljo.493.1662580332833; 
 Wed, 07 Sep 2022 12:52:12 -0700 (PDT)
Received: from ?IPV6:2a02:a31a:a240:1700:e929:c054:a46d:3844?
 ([2a02:a31a:a240:1700:e929:c054:a46d:3844])
 by smtp.googlemail.com with ESMTPSA id
 m2-20020a056512358200b004947c4dfde8sm2693435lfr.129.2022.09.07.12.52.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Sep 2022 12:52:12 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <6639fb8f-e16c-1ef5-5978-c522f76c8ded@gmail.com>
Date: Wed, 7 Sep 2022 21:52:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v2 09/41] drm/connector: Add TV standard property
Content-Language: pl
To: Maxime Ripard <maxime@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-9-459522d653a7@cerno.tech>
 <30a9d7cd-d9ff-3177-ac6c-e7c1f966d89a@gmail.com>
 <20220907121009.toizfolruuazcrns@houat>
In-Reply-To: <20220907121009.toizfolruuazcrns@houat>
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

W dniu 7.09.2022 o 14:10, Maxime Ripard pisze:
> Hi,
>
> On Fri, Sep 02, 2022 at 12:00:33AM +0200, Mateusz Kwiatkowski wrote:
>> W dniu 29.08.2022 o 15:11, Maxime Ripard pisze:
>>> The TV mode property has been around for a while now to select and get the
>>> current TV mode output on an analog TV connector.
>>>
>>> Despite that property name being generic, its content isn't and has been
>>> driver-specific which makes it hard to build any generic behaviour on top
>>> of it, both in kernel and user-space.
>>>
>>> Let's create a new bitmask tv norm property, that can contain any of the
>>> analog TV standards currently supported by kernel drivers. Each driver can
>>> then pass in a bitmask of the modes it supports.
>>
>> This is not a bitmask property anymore, you've just changed it to an enum.
>> The commit message is now misleading.
>>
>>> +static const struct drm_prop_enum_list drm_tv_mode_enum_list[] = {
>>> +    { DRM_MODE_TV_MODE_NTSC_443, "NTSC-443" },
>>> +    { DRM_MODE_TV_MODE_NTSC_J, "NTSC-J" },
>>> +    { DRM_MODE_TV_MODE_NTSC_M, "NTSC-M" },
>>> +    { DRM_MODE_TV_MODE_PAL_60, "PAL-60" },
>>> +    { DRM_MODE_TV_MODE_PAL_B, "PAL-B" },
>>> +    { DRM_MODE_TV_MODE_PAL_D, "PAL-D" },
>>> +    { DRM_MODE_TV_MODE_PAL_G, "PAL-G" },
>>> +    { DRM_MODE_TV_MODE_PAL_H, "PAL-H" },
>>> +    { DRM_MODE_TV_MODE_PAL_I, "PAL-I" },
>>> +    { DRM_MODE_TV_MODE_PAL_M, "PAL-M" },
>>> +    { DRM_MODE_TV_MODE_PAL_N, "PAL-N" },
>>> +    { DRM_MODE_TV_MODE_PAL_NC, "PAL-Nc" },
>>> +    { DRM_MODE_TV_MODE_SECAM_60, "SECAM-60" },
>>> +    { DRM_MODE_TV_MODE_SECAM_B, "SECAM-B" },
>>> +    { DRM_MODE_TV_MODE_SECAM_D, "SECAM-D" },
>>> +    { DRM_MODE_TV_MODE_SECAM_G, "SECAM-G" },
>>> +    { DRM_MODE_TV_MODE_SECAM_K, "SECAM-K" },
>>> +    { DRM_MODE_TV_MODE_SECAM_K1, "SECAM-K1" },
>>> +    { DRM_MODE_TV_MODE_SECAM_L, "SECAM-L" },
>>> +};
>>
>> I did not comment on it the last time, but this list looks a little bit random.
>>
>> Compared to the standards defined by V4L2, you also define SECAM-60 (a good
>> thing to define, because why not), but don't define PAL-B1, PAL-D1, PAL-K,
>> SECAM-H, SECAM-LC (whatever that is - probably just another name for SECAM-L,
>> see my comment about PAL-Nc below), or NTSC-M-KR (a Korean variant of NTSC).
>>
>> Like I mentioned previously, I'm personally not a fan of including all those
>> CCIR/ITU system variants, as they don't mean any difference to the output unless
>> there is an RF modulator involved. But I get it that they have already been used
>> and regressing probably wouldn't be a very good idea. But in that case keeping
>> it consistent with the set of values used by V4L2 would be wise, I think.
>
> Ack. What would be the list of standards we'd absolutely need? NSTC-M,
> NTSC-J, PAL-60, PAL-B, PAL-M, SECAM-60 and SECAM-B?

The "essential list" IMO is NTSC, NTSC-J, NTSC-443, PAL, PAL-M, PAL-N and SECAM.
Note that:

- I intentionally propose "NTSC", "PAL" and "SECAM" without an ITU system
  designation. If we only consider composite signals, there's no difference
  between e.g. PAL-B, PAL-D and PAL-I, so it's better to label it as a generic
  mode, IMO.

  * PAL-M and PAL-N are different, because those unique color encodings were
    only ever used with Systems M and N, respectively.

  * NTSC-J is also different, because "System J" doesn't exist anywhere in ITU
    documents. Japan technically uses System M with a non-standard black level.
    But "NTSC-J" stuck as a universally recognized name for that variant.

- I intentionally did not list PAL-60 or SECAM-60. TBH... PAL-60 is just
  regular PAL paired with 480i60 modeline. Most if not all displays that
  accept PAL-60 input will just label it as "PAL". If we are not introducing
  strict modeline validation, then maybe separating PAL and PAL-60 isn't really
  necessary? Same goes for SECAM vs. SECAM-60.
 
  ...and same goes for NTSC vs. NTSC-50 a.k.a NTSC-N, which is a very exotic
  mode, but known to exist at least in the Atari ST world, see also:
  https://en.wikipedia.org/wiki/NTSC#NTSC-N/NTSC50

Combining PAL and PAL-60 into a single setting would complicate the vc4 driver
a little bit, though, as the registers need to be set up differently for those.

My feelings about the PAL-60 issue are not that strong, though. Merging PAL
and PAL-60 in this context is just a loose suggestion, I won't even try to
argue if you disagree.

>>> +/**
>>> + * drm_mode_create_tv_properties - create TV specific connector properties
>>> + * @dev: DRM device
>>> + * @supported_tv_modes: Bitmask of TV modes supported (See DRM_MODE_TV_MODE_*)
>>> +
>>> + * Called by a driver's TV initialization routine, this function creates
>>> + * the TV specific connector properties for a given device.  Caller is
>>> + * responsible for allocating a list of format names and passing them to
>>> + * this routine.
>>> + *
>>> + * Returns:
>>> + * 0 on success or a negative error code on failure.
>>> + */
>>> +int drm_mode_create_tv_properties(struct drm_device *dev,
>>> +                  unsigned int supported_tv_modes)
>>
>> supported_tv_modes is supposed to be a bitmask of BIT(DRM_MODE_TV_MODE_*)
>> (or (1<<DRM_MODE_TV_MODE_*)) rather than DRM_MODE_TV_MODE_* directly, but this
>> is not said explicitly anywhere in this doc comment.
>
> The argument doc mentions that it's a "Bitmask of TV modes supported
> (See DRM_MODE_TV_MODE_*)", how would you improve it?

Maybe something like "Bitwise OR of BIT(DRM_MODE_TV_MODE_*) values"? Or maybe
just add a little usage example?

> Thanks!
> Maxime

Best regards,
Mateusz Kwiatkowski
