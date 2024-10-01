Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 140EA98B8D4
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 12:01:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E9B10E12C;
	Tue,  1 Oct 2024 10:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Us0Sr8Gh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C0A10E12C
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 10:01:49 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a93a1cda54dso764276766b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Oct 2024 03:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727776908; x=1728381708; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=YSV395TnSeuFrZWZREPgZ+mGaSAP/DWKli5CLGSoQtI=;
 b=Us0Sr8GhfuZX2U7UmKsVx3+ESvkwj8PUnUqLGfF9sebzyouyHLta1O+lKFCLDzsIcM
 xvIAkUThmZoDIuy6CjdwOf5g5UUP9dn9XfoXvwXnTjdEqHCj0tgwz/Au4dNXB+6QHVjd
 65UfTOgBbK3CgwpsAFoTHGyMhbd+V6ozbV4XvUHgx7Yi+elkJghsIKVAzW8w+RmtzG4D
 Z9Z6XdomPAu/EJH/kErF+7AFnXLGYZwjLW/bzSXPfMIJl0MtxAm0fguLzVXMtkJ+jb9h
 MZ22HAvAzE1f6xIUjvg5yFPSwWVMdOdJHC1ntgWoE5yddtdOprKK80B16UTHT8YRyIDf
 gqiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727776908; x=1728381708;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YSV395TnSeuFrZWZREPgZ+mGaSAP/DWKli5CLGSoQtI=;
 b=o+6V0X2XQ5WFbyoXG1HSJAkl2jurSSwBriHxGIMvt9GNGSaGlSuTCDHhiNYABOHBok
 3Uyl6gbUFNamf6bHDg9mNVOxO5AH6HuFm4MSDraq8HXGg+ZuROyD30lLUlcPy9qzU0n6
 1TYwk/T2SRDPU2r1gGWjs0DVOZQWx1/+P42qfLEnOwQFrR8ihVsFPZReBAKq/W7SJ3O0
 33RKURjuHXbKou5yDY+cF1meNEj596+yQmb7vXnJmY0bZSs6/xCyRECj/ggjFkkZmxVh
 jlZA5Z9/d1koYPo7Bgq9557h7HpKmQb7Uo7/Fd31p++7yzpqXVyoTADvpP8s5nLZZdqt
 YJog==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkE65L1BrZArBWxFJJVxGWATOYqGoLmAucLXOh8MuUzEAaKzMB8nF8xmkqtMtYzkfoKVNtt1Mzd7I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6LjQ477vmSGW8DriGJk8DzZ5dlBqCP2A39m649rvYHvhyLm8w
 dHMb8LcUAOJMis6QTa5n4tOh+13GJ8tAeJaSP3tUAkEykTfZPsW1n1JRMwzxtSQ=
X-Google-Smtp-Source: AGHT+IFe5uApVeAaCaM2T24NkejT/uemXWBOv20qEVOSmWyd/SnP1U1M+gNspd3K04qfMeEqxTkSnA==
X-Received: by 2002:a17:907:a41:b0:a86:a013:2161 with SMTP id
 a640c23a62f3a-a93c4946cb8mr1468222966b.30.1727776907908; 
 Tue, 01 Oct 2024 03:01:47 -0700 (PDT)
Received: from [127.0.0.1] ([5.176.4.157]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2979e00sm685511266b.158.2024.10.01.03.01.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 03:01:47 -0700 (PDT)
Date: Tue, 01 Oct 2024 13:01:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
CC: Oded Gabbay <ogabbay@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Hans de Goede <hdegoede@redhat.com>,
 "open list:AMD KFD" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/6] drm/sysfs: Remove version attribute
User-Agent: K-9 Mail for Android
In-Reply-To: <72ee3be1-f4bb-48bf-970b-740f272a174c@gmail.com>
References: <499229fd-5344-4799-85bf-93e4b3b45eca@gmail.com>
 <b2d8d283-36cc-42e8-a8e7-e57e9698a9b5@gmail.com>
 <zqgp5une7apdgiytnhkrqz7ec2zrb5lsxzwwjvtcvs3mke3bns@tplkxi2isud4>
 <72ee3be1-f4bb-48bf-970b-740f272a174c@gmail.com>
Message-ID: <0A960D8C-FC76-4930-BBF1-1285A4AFE876@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On September 30, 2024 1:49:41 PM GMT+03:00, Heiner Kallweit <hkallweit1@gma=
il=2Ecom> wrote:
>On 22=2E09=2E2024 16:55, Dmitry Baryshkov wrote:
>> On Sun, Sep 08, 2024 at 02:08:58PM GMT, Heiner Kallweit wrote:
>>> This undocumented attribute returns a version string which hasn't been
>>> changed for ages=2E libdrm doesn't use it and I also found no other us=
er=2E
>>> So I think we can remove it=2E
>>=20
>> This file is a part of the ABI=2E Commit 82d5e73f6b79 ("drm: drop obsol=
ete
>> drm_core=2Eh") replaced variable string with the fixed value that we
>> currently have, but at the same it clearly documented that the file is
>> being preserved for the sake of binary compatibility=2E
>>=20
>The drm version attribute is documented neither under Documentation/gpu
>nor under Documentation/ABI=2E So do we really have to consider it
>part of the ABI? And are you aware of any actual user of this attribute?
>
>The author of 82d5e73f6b79 wasn't sure either, and therefore didn't
>dare to drop the attribute (8 yrs ago)=2E He didn't make any statement th=
at
>the attribute is actually used=2E

A very quick search points out that the file is being used:=20

<https://codesearch=2Edebian=2Enet/search?q=3Ddrm%2Fversion>


>
>6=2E12-rc1 is just out, so we could drop the attribute in linux-next and
>would have several weeks before the next merge window to find out
>whether anybody complains=2E

No, this is not the way to treat userspace ABI=2E

>
>>>
>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail=2Ecom>
>>> ---
>>>  drivers/gpu/drm/drm_sysfs=2Ec | 12 ------------
>>>  1 file changed, 12 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_sysfs=2Ec b/drivers/gpu/drm/drm_sysfs=
=2Ec
>>> index fb3bbb6ad=2E=2E49e5faf11 100644
>>> --- a/drivers/gpu/drm/drm_sysfs=2Ec
>>> +++ b/drivers/gpu/drm/drm_sysfs=2Ec
>>> @@ -126,8 +126,6 @@ static const struct component_ops typec_connector_=
ops =3D {
>>>  	=2Eunbind =3D typec_connector_unbind,
>>>  };
>>> =20
>>> -static CLASS_ATTR_STRING(version, S_IRUGO, "drm 1=2E1=2E0 20060810");
>>> -
>>>  /**
>>>   * drm_sysfs_init - initialize sysfs helpers
>>>   *
>>> @@ -140,19 +138,10 @@ static CLASS_ATTR_STRING(version, S_IRUGO, "drm =
1=2E1=2E0 20060810");
>>>   */
>>>  int drm_sysfs_init(void)
>>>  {
>>> -	int err;
>>> -
>>>  	drm_class =3D class_create("drm");
>>>  	if (IS_ERR(drm_class))
>>>  		return PTR_ERR(drm_class);
>>> =20
>>> -	err =3D class_create_file(drm_class, &class_attr_version=2Eattr);
>>> -	if (err) {
>>> -		class_destroy(drm_class);
>>> -		drm_class =3D NULL;
>>> -		return err;
>>> -	}
>>> -
>>>  	drm_class->devnode =3D drm_devnode;
>>> =20
>>>  	drm_sysfs_acpi_register();
>>> @@ -169,7 +158,6 @@ void drm_sysfs_destroy(void)
>>>  	if (IS_ERR_OR_NULL(drm_class))
>>>  		return;
>>>  	drm_sysfs_acpi_unregister();
>>> -	class_remove_file(drm_class, &class_attr_version=2Eattr);
>>>  	class_destroy(drm_class);
>>>  	drm_class =3D NULL;
>>>  }
>>> --=20
>>> 2=2E46=2E0
>>>
>>>
>>=20
>


--=20
With best wishes
Dmitry
