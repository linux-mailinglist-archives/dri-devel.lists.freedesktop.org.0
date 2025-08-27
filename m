Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E34A3B37E06
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 10:42:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E21A10E785;
	Wed, 27 Aug 2025 08:42:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="0lvhzgkv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B59F10E781
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 08:42:19 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id
 4fb4d7f45d1cf-61a8c134609so8175348a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 01:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1756284138; x=1756888938; darn=lists.freedesktop.org;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ru399StOWX0y3ow8u4rjjmb8WPAPqnIEt4F7fasIcxE=;
 b=0lvhzgkvnSLuii31Mj6oEIwZQMHKWRRI03abb/ax5HziKIGW1cobszLe2C/D020a73
 ekAbWGCaPq10hxX60LEXpHw50u9fWxBjOEtlYOEgIm/LnaqkKIzZEgifquZUS6hL692l
 8m5T9KY+gtPJvgvU9D9q+14eGbMDxtD2Ft794SWfhVFK0fLG0ytp0XStmqOKba6r82S5
 5wRAijZ7YpOoLKXMvE03pm85CDmd8N8Icl3s+Kj3oh1fPggFi5iZR334+I74zHccSacU
 ErEPDIJWB7i4L0CxWtXs1exnvDAYVgrJcdkvAKAm8wiiffZnBri43znCGs4X6IM7zvBB
 iTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756284138; x=1756888938;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Ru399StOWX0y3ow8u4rjjmb8WPAPqnIEt4F7fasIcxE=;
 b=s/+t2UYV/FSVwOx2/JTW41in6hjgm4xnNZ8c9xJUAsp+qOe0JI+7isV47fv+KWyS4h
 Ze68Il/9jhm6tA9iOSY3XbBwwmmQEy1XBz85uFlDiFIXCmn2lne3ZwfVjKLfrLNG6hwH
 PRZo7WuUYzecwxb3gUBircvk0xhVAhm6lOKdbVymwIqbARLaXbgpY33D8ZXKkltYOJN8
 3RSvFQLzbULy8YNwwuoGzyYwOwqm9LED64i/9JodMqJYFTh2T8wFliHbV5HwrpWwxaLK
 k+wdi2tjnObUsSSSE3xAiZVgCzQNvmFX7lDYtZscjFp1HK64IB63ZNCuOP4/uGBVYhLV
 s1YQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7ZOrmtzdvUgt0VC0qBUFIoRJkdhA+eSzP0gILbru1QZu5Jh1XJgxhnuAvcHLJyceP7IJVyBruQHU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQ9ucmhTfVO/zV7BlBa01C/mvv4U1Spk2KHb5b/LBlqrX1SGMf
 ndwZrHOnu54GhgzdLrKKZDSuH8HybOejxXIYwPxVKHS0iHEmbk2+YyiesFFCZZDsR3U=
X-Gm-Gg: ASbGncus/7IR7YfMGQPD0depnhUWb4cVxVP0gB8XJhdu+9Fgv+tmEzvyDJV9FmFFIwr
 iYAnDLRQzdxtlYZ0K/n8lW1TvpT6ACrTYKTJ5O6UMEY7IPgHG92uKyOKgYvl/QyeWXO3/WpgHd1
 K37YOaAZ/yJuojOysiOcFNqzoMqQYTfNoH966ZEpjTos3x8y5ePRR2pXdxmTZFLsPejSCPjral0
 gHg9U92/HhnsOf0lkX3FRB0Ta9RY4wz9KJmiAaNO41Km28sRWiOaX26yrWtTr4s7raD+qOeN1zn
 OmqyTSelIk4dXdH7Vkn9SBDr5ACzsJbVwyYJRoRCif7+gqQJR/djMctbY3KivAqf64rwM3Zd8yx
 cD3ynP75AXcDMV5oBJaaebrvVO0eYqJHwUF898i7Aux9Xdk0Fpam1sk9hLB0=
X-Google-Smtp-Source: AGHT+IE7qHCUmyrseOQu74QlBZCIEPNa9QZI/28Loh0vgbPoaePjhaimKbaEW3VRUGcYdoYW86lRtw==
X-Received: by 2002:a05:6402:2554:b0:61c:5d76:3a8b with SMTP id
 4fb4d7f45d1cf-61c5d7640b7mr8937360a12.32.1756284137573; 
 Wed, 27 Aug 2025 01:42:17 -0700 (PDT)
Received: from localhost ([213.244.170.152]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61caeb5e77bsm1411780a12.35.2025.08.27.01.42.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 01:42:17 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 Aug 2025 10:42:16 +0200
Message-Id: <DCD2RLZO62P6.MNAOWRUWVFHK@fairphone.com>
Subject: Re: [PATCH v2 3/5] drm/sysfb: simpledrm: Add support for
 interconnect paths
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Javier Martinez Canillas" <javierm@redhat.com>, "Hans de Goede"
 <hdegoede@redhat.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Helge Deller" <deller@gmx.de>
Cc: <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
 <20250623-simple-drm-fb-icc-v2-3-f69b86cd3d7d@fairphone.com>
 <87qzz5d3le.fsf@minerva.mail-host-address-is-not-set>
 <DB9237QHOXRU.JRJB8SPUX8RO@fairphone.com>
 <874ivjf5gn.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <874ivjf5gn.fsf@minerva.mail-host-address-is-not-set>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Fri Jul 11, 2025 at 11:21 AM CEST, Javier Martinez Canillas wrote:
> "Luca Weiss" <luca.weiss@fairphone.com> writes:
>
> Hello Luca,
>
>> Hi Javier,
>>
>> On Fri Jun 27, 2025 at 9:51 AM CEST, Javier Martinez Canillas wrote:
>
> [...]
>
>>>> +static int simpledrm_device_attach_icc(struct simpledrm_device *sdev)
>>>> +{
>>>> +	struct device *dev =3D sdev->sysfb.dev.dev;
>>>> +	int ret, count, i;
>>>> +
>>>> +	count =3D of_count_phandle_with_args(dev->of_node, "interconnects",
>>>> +							 "#interconnect-cells");
>>>> +	if (count < 0)
>>>> +		return 0;
>>>> +
>
> You are already checking here the number of interconnects phandlers. IIUC
> this should return -ENOENT if there's no "interconects" property and your
> logic returns success in that case.

We shouldn't error out in case there's no interconnects defined for this
simple-framebuffer though? That'd break all other usages of it?

>
> [...]
>
>>>
>>> You could use dev_err_probe() instead that already handles the -EPROBE_=
DEFER
>>> case and also will get this message in the /sys/kernel/debug/devices_de=
ferred
>>> debugfs entry, as the reason why the probe deferral happened.
>>
>> Not quite sure how to implement dev_err_probe, but I think this should
>> be quite okay?
>>
>
> And of_icc_get_by_index() should only return NULL if CONFIG_INTERCONNECT
> is disabled but you have ifdef guards already for this so it should not
> happen.
>
>> 		if (IS_ERR_OR_NULL(sdev->icc_paths[i])) {
>
> Then here you could just do a IS_ERR() check and not care about being NUL=
L.

But checking also for NULL shouldn't hurt either, in case the compile
guards get removed in the future or something?

Quote:
> * Return: icc_path pointer on success or ERR_PTR() on error. NULL is retu=
rned
> * when the API is disabled or the "interconnects" DT property is missing.



>
>> 			ret =3D dev_err_probe(dev, PTR_ERR(sdev->icc_paths[i]),
>> 				      "failed to get interconnect path %u\n", i);
>> 			if (ret =3D=3D -EPROBE_DEFER)
>> 				goto err;
>
> Why you only want to put the icc_paths get for the probe deferral case? I
> think that you want to do it for any error?

This is the same logic as e.g. for the regulator code in simpledrm. The
idea seems to be that in case some regulator (or here interconnect)
doesn't probe correctly, we still try anyways. Just for EPROBE_DEFER we
defer and wait until the supplier is available.

So defer -> defer simpledrm probe
So error -> ignore error and continue probe

>
>> 			continue;
>
> I'm not sure why you need this?

For the above behavior.

I guess there were some original design decisions behind handling it
this way, so I don't see a reason to handle it differently for
interconnects.

>
>> 		}
>>
>> That would still keep the current behavior for defer vs permanent error
>> while printing when necessary and having it for devices_deferred for the
>> defer case.
>>
>
> As mentioned I still don't understand why you want the error path to only
> be called for probe deferral. I would had thought that any failure to get
> an interconnect would led to an error and cleanup.

See above.

Regards
Luca

>
>> Not sure what the difference between drm_err and dev_err are, but I
>> trust you on that.
>>
>
> The drm_err() adds DRM specific info but IMO the dev_err_probe() is bette=
r
> to avoid printing errors in case of probe deferral and also to have it in
> the devices_deferred debugfs entry.

