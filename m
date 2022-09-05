Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5C15AD7C3
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 18:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9409410E448;
	Mon,  5 Sep 2022 16:44:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 543E010E448;
 Mon,  5 Sep 2022 16:44:47 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id bq23so13824926lfb.7;
 Mon, 05 Sep 2022 09:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date;
 bh=pg/PAiNvnu7vtuOyQRQ/USUHgpjKV+PX2R3Qe58I9a8=;
 b=gpdNZAEDxje8wnITyn+RZoWmy+HDFnOquwNGCkPFH4u26oFe9BJkGsChjuvli+EpUC
 udG041BUDBCsixXiASZMPopuq5kkYgAZ75M5qx/664s54esc8z1HhBFqbN3K9kHPpL1i
 /c/k2keYZOCrifzS9i3Jol3/Ys8sNIUeajA/nxV7uULUR3TcQoLuptOLB6RGc/f719/2
 O/X4incruiAcIvG6rSJmQeWED2QziZfV7nNN+Xw4npnDsDvap4T4VaB6gU99RsKT0/sK
 ObY9ODTZh1llvOmzGkvb7+zUE3IWaTV/TsOIDkNGg6kHEUV4Ijytw/jtF/wsnn40KB7l
 WmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=pg/PAiNvnu7vtuOyQRQ/USUHgpjKV+PX2R3Qe58I9a8=;
 b=MkhxCQONUXlubNxbbx/NHGId4pCjcxQSBxl6i556YH6RZyWtarIZnH4r4rqAPDF1Ae
 2SMkkpWTn2cRrtRSnmM3HqZMyeuWcVmG2IrvMs4FhevTkZNVT8D98Cpi/35KlDsald2I
 +hx4m+qV46Rj2fYKP9U8ADei168DJAY0ot9xiz05n+iC4llDjBQ8Y4nQac5nRQ4aDRSg
 V9NPmZa5RxP7uRMSvuMD2LRW4/3MO6bEMqs+yH4X7sdimv6a0xUcLI8BangKtRW7Aub8
 dexkCj7q6TWhjY7goaK75o5CQ/1t1I30NASufNbvytV/ASNVjE8g/EOSbZ90FUoFzhj7
 lH0w==
X-Gm-Message-State: ACgBeo0fK2SrVBhKD4mXet0JsIpApfGJgCDavZ5c3d1J193QTGHGxSM7
 wqRbdVDBCzs+ATEHDmW4ufU=
X-Google-Smtp-Source: AA6agR5QgKJH0v/+7sAguBYeCvG9a+g/CeSbeIITanudZorCWC9+TludMawIYPfRu4Xh0pTJ0sIw1w==
X-Received: by 2002:a05:6512:ba2:b0:494:6d93:e9ee with SMTP id
 b34-20020a0565120ba200b004946d93e9eemr11762898lfv.378.1662396285601; 
 Mon, 05 Sep 2022 09:44:45 -0700 (PDT)
Received: from ?IPV6:2a02:a31a:a240:1700:9c45:8fa1:8ce7:8852?
 ([2a02:a31a:a240:1700:9c45:8fa1:8ce7:8852])
 by smtp.googlemail.com with ESMTPSA id
 q5-20020a2eb4a5000000b0025e59f125fbsm1469514ljm.53.2022.09.05.09.44.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 09:44:45 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <10ce686a-d7c8-9ce4-3979-735ad8eab3b5@gmail.com>
Date: Mon, 5 Sep 2022 18:44:42 +0200
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
In-Reply-To: <20220905133755.gcmmntg3wnecyqjq@houat>
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

W dniu 5.09.2022 o 15:37, Maxime Ripard pisze:
>>> +    vfp = vfp_min + (porches_rem / 2);
>>> +    vbp = porches - vfp;
>>
>> Relative position of the vertical sync within the VBI effectively moves the
>> image up and down. Adding that (porches_rem / 2) moves the image up off center
>> by that many pixels. I'd keep the VFP always at minimum to keep the image
>> centered.
>
> And you would increase the back porch only then?

Well, increasing vbp only gives a centered image with the default 480i/576i
resolutions. However, only ever changing vbp will cause the image to be always
at the bottom of the screen when the active line count is decreased (e.g.
setting the resolution to 720x480 but for 50Hz "PAL" - like many game consoles
did back in the day).

I believe that the perfect solution would:

- Use the canonical / standard-defined blanking line counts for the standard
  vertical resolutions (480/486/576)
- Increase vfp and vbp from there by the same number if a smaller number of
  active lines is specified, so that the resulting image is centered
- Likewise, decrease vfp and vbp by the same number if the active line number
  is larger and there is still leeway (this should allow for seamless handling
  of 480i vs. 486i for 60 Hz "NTSC")
- If even more active lines are specified, once the limit for vfp is hit, then
  decrease vbp only - the resulting image will definitely be off-center, but
  there's no other way

I hope this makes sense for you as well.

Best regards,
Mateusz Kwiatkowski
