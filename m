Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F1C5A0012
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 19:09:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2E8BC427;
	Wed, 24 Aug 2022 17:09:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E92BB554
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 17:08:30 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id n15so3805916lfe.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 10:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc;
 bh=d+0sUP6TSKAiALBIXDZGYdNvi1F0yA0KJXnjoK2G2T8=;
 b=o3Gvvtf7KSV4tiw6VYPIJEAh479Uovr253pXVInVVaECnk6jFELDM6fxh9wl8+9FsW
 17R1qztaIRSST5xXH/PTplmH3+scKpeeAADuFYik2/15xjAz/2n3RdtU80ceqJ/sYCkr
 o7OX+zS4VJqL8EQDEgFSWpqS8tRSAK3rfe4sEEwa1m1m1ThQK4aElW43U7P1TaQIbJiB
 p2lv2+LNFuRXaqnOJbnZNRnrqXJgL66+fz6VBLS9wCEwnmuOM48+6upvyp2JhhRlI1Wr
 jjCcDSezsqKhjLcL8vsnBJkcFKCwQKpT9QQ2M9OJA6RYaN0Wz7tvgxK55ayzuGzRplq9
 KOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc;
 bh=d+0sUP6TSKAiALBIXDZGYdNvi1F0yA0KJXnjoK2G2T8=;
 b=OjA5I4r9hoHyZ9ngDiFsDjrEO20h4+1kHom1vVIRN4e6cJUx/0tn3EMVi8ZBODBbM3
 tRNP05WQ+4nWlA5KGtC2heEF0gnVVTUapmUZ4dEFRo4ILOXahiVJPEMpbAvT7iqZu/mw
 0NHtnqlcfOhChJctSgt3V3J859+5BuIc4BUrPXi97sbN0+76WUTcnPGGcB9Gg1PpJ5vy
 0ByJas3VUHchtxrW+qo2P4+fTFQHLdieGnK2ZMfGSvZlk1DZyo0cox1rtytHMcAV7Qxh
 DF3uJV+3BR9TT5FNDKgdpFW1KtfTEwJ4U3hjwjW9SI2dc/i/xD2Ba9KTAPTrFnRmGexQ
 WmBQ==
X-Gm-Message-State: ACgBeo3EuY2xF5G6SKHm8hRClSLqJ+f4Qvyr4Na9qA/fLTy/lubiH556
 tTkulYgDL26VN+lglFXN174=
X-Google-Smtp-Source: AA6agR5cz1tKv0yfrrQuMBGx5Y9mKvqvHWQ2qHORxA31eXjsfhACgWXyuZD/7Wc/aX7wwd3M3XFp3w==
X-Received: by 2002:a05:6512:22d3:b0:48c:df73:d0a4 with SMTP id
 g19-20020a05651222d300b0048cdf73d0a4mr10044284lfu.584.1661360908835; 
 Wed, 24 Aug 2022 10:08:28 -0700 (PDT)
Received: from [10.10.53.53] (81-18-220-16.static.chello.pl. [81.18.220.16])
 by smtp.googlemail.com with ESMTPSA id
 j24-20020ac253b8000000b00492df78f311sm13975lfh.57.2022.08.24.10.08.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 10:08:28 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <baee6917-dada-9ab2-9244-d6679e91033f@gmail.com>
Date: Wed, 24 Aug 2022 19:08:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 34/35] drm/modes: Introduce the tv_mode property as a
 command-line option
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-34-3d53ae722097@cerno.tech>
 <eedb1a86-c1fb-cc76-2a43-4ed349d7d826@tronnes.org>
 <20220824154543.bdtpz2evwzsjrdrz@houat>
In-Reply-To: <20220824154543.bdtpz2evwzsjrdrz@houat>
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
Cc: Emma Anholt <emma@anholt.net>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime & Noralf,

W dniu 24.08.2022 o 17:45, Maxime Ripard pisze:
> Hi Noralf,
>
> On Sat, Aug 20, 2022 at 10:18:47PM +0200, Noralf Trønnes wrote:
>> Den 29.07.2022 18.35, skrev Maxime Ripard:
>>> Our new tv mode option allows to specify the TV mode from a property.
>>> However, it can still be useful, for example to avoid any boot time
>>> artifact, to set that property directly from the kernel command line.
>>>
>>> Let's add some code to allow it, and some unit tests to exercise that code.
>>>
>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>>>
>>
>> In the subject it says "tv_mode property", but the property is called
>> "tv norm", so the option should be tv_norm?
>
> Yeah... I don't know. mode is taken but it's obviously the best name. So
> I went with norm to avoid the (internal) conflict but I left mode for
> the user facing property.
>
> I'm not sure what's best here, or maybe we can pick another name entirely?

I think "standard" and "system" are also fairly common names for this property.

I once had an old multi-standard Sharp CRT TV that allowed manually selecting
the expected color encoding (PAL/SECAM/NTSC/NTSC-443), and the relevant button
on the remote was labeled "SYSTEM".

V4L2 calls this "standard", see include/uapi/linux/videodev2.h, compare with
v4l2_std_id, V4L2_STD_* etc.

BTW, maybe reusing those V4L2 constants, or aligning the numerical values,
would make some sense?

>
> Maxime

Best regards,
Mateusz Kwiatkowski
