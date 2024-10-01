Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C15298BAF7
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 13:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E6910E185;
	Tue,  1 Oct 2024 11:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jDb03W+H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAEBC10E185
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 11:26:37 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5c5cf26b95aso6341263a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Oct 2024 04:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727781996; x=1728386796; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=b1zPP1JDn3iYgVYvQiKdhlmILDTIwPAaCpUBY9E3Fhc=;
 b=jDb03W+HH08zxZwOcLZoxxek2k8i9SvLFZLfULFski7WfTM6SnEzj8c85hPWb5SZwI
 Cc9UUxIov2cYWRloHgUuTsLbQw93PEk61/He0axMTL7C9o2dZ5jm3Yj9VFQr66ASkHGk
 RUgLWALlDxGVuCVDE86lX5h/N2hUuuoo2UM2aDt0CNMOE392adpaNQllq3+wuvETOMTI
 CTfpFlZvcz3ne1pi4iv1nQMEii3w6W7WTQcbFyC4VcHjaJPnYMOMfrGbqkm/RdiZQN2K
 EHRemJ7yaFCnIJcn0DCz3twHTFYyN4i4z/kVXu/twfgG+kTtcFm7pEYkikjsnRYHrAXc
 fu8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727781996; x=1728386796;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b1zPP1JDn3iYgVYvQiKdhlmILDTIwPAaCpUBY9E3Fhc=;
 b=JfmopjQp1niNoLqM2lKeJPlpD82XI6O8KzWt5V3Kn3Z0Eq8V1F10uEWag5cbvgCeXs
 01lpv4XyNghQepLwPABnUHKJ15zytmv+F2tFetsXuQFKCcgyMmW0/rXOukfAo/hMBJ4W
 s4NwXvEHSviDUF7zCDwcos3bo065E/C2URs4ova3BA/m/nREI1T3vHyBO6TF6eNycIys
 bISX4YhGvOD+MWuRtA7/M/CCJ+lbbQMluCad1VObi0ZFgXbmfBYeiQqOGr4s42PmnF47
 /RG2R62SCbD/3NsNbUzl27FHx8t44Jb4cDBShKz4+VbF5ieT9G3fcnFm0wL2yBbfP9B9
 8S6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWi5OgHBdf3aLV5OVsM8/ZdtVJYekpd7DNqG0h/f/UMalq0fgWkGr5bbRfmmdcBi5gt30MbqQ3GvBI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwiRyiqGoKLwXrlh72A+ZcgptmV40Nn2TZpFNU3MQ8sTre2eWD1
 ufKv1i7ixySxg8fCNA41IZOjhD5DBbA1tVe4Qg06nUkG7JgHg+MjKWn09rr0Frk=
X-Google-Smtp-Source: AGHT+IFPmg6eWFezHez5IU0jt/mbzzvx2KZyfUaKlRhXu9JDJPG7pX6tMogPUjGRrKvVvbvxta9LUw==
X-Received: by 2002:a05:6402:4410:b0:5c0:ad76:f703 with SMTP id
 4fb4d7f45d1cf-5c88261ab2bmr14745180a12.24.1727781995911; 
 Tue, 01 Oct 2024 04:26:35 -0700 (PDT)
Received: from [127.0.0.1] ([5.176.33.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88248b628sm5989821a12.66.2024.10.01.04.26.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 04:26:34 -0700 (PDT)
Date: Tue, 01 Oct 2024 14:26:30 +0300
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
In-Reply-To: <c7060b7f-cd01-4185-bba7-0e3e318ab196@gmail.com>
References: <499229fd-5344-4799-85bf-93e4b3b45eca@gmail.com>
 <b2d8d283-36cc-42e8-a8e7-e57e9698a9b5@gmail.com>
 <zqgp5une7apdgiytnhkrqz7ec2zrb5lsxzwwjvtcvs3mke3bns@tplkxi2isud4>
 <72ee3be1-f4bb-48bf-970b-740f272a174c@gmail.com>
 <0A960D8C-FC76-4930-BBF1-1285A4AFE876@linaro.org>
 <c7060b7f-cd01-4185-bba7-0e3e318ab196@gmail.com>
Message-ID: <813A678B-7B68-47DA-8D06-6C721CEF6E2F@linaro.org>
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

On October 1, 2024 2:07:28 PM GMT+03:00, Heiner Kallweit <hkallweit1@gmail=
=2Ecom> wrote:
>On 01=2E10=2E2024 12:01, Dmitry Baryshkov wrote:
>> On September 30, 2024 1:49:41 PM GMT+03:00, Heiner Kallweit <hkallweit1=
@gmail=2Ecom> wrote:
>>> On 22=2E09=2E2024 16:55, Dmitry Baryshkov wrote:
>>>> On Sun, Sep 08, 2024 at 02:08:58PM GMT, Heiner Kallweit wrote:
>>>>> This undocumented attribute returns a version string which hasn't be=
en
>>>>> changed for ages=2E libdrm doesn't use it and I also found no other =
user=2E
>>>>> So I think we can remove it=2E
>>>>
>>>> This file is a part of the ABI=2E Commit 82d5e73f6b79 ("drm: drop obs=
olete
>>>> drm_core=2Eh") replaced variable string with the fixed value that we
>>>> currently have, but at the same it clearly documented that the file i=
s
>>>> being preserved for the sake of binary compatibility=2E
>>>>
>>> The drm version attribute is documented neither under Documentation/gp=
u
>>> nor under Documentation/ABI=2E So do we really have to consider it
>>> part of the ABI? And are you aware of any actual user of this attribut=
e?
>>>
>>> The author of 82d5e73f6b79 wasn't sure either, and therefore didn't
>>> dare to drop the attribute (8 yrs ago)=2E He didn't make any statement=
 that
>>> the attribute is actually used=2E
>>=20
>> A very quick search points out that the file is being used:=20
>>=20
>> <https://codesearch=2Edebian=2Enet/search?q=3Ddrm%2Fversion>
>>=20
>
>Thanks=2E However this script doesn't actually use the version value
>and would work perfectly fine also w/o this attribute=2E
>
>>=20
>>>
>>> 6=2E12-rc1 is just out, so we could drop the attribute in linux-next a=
nd
>>> would have several weeks before the next merge window to find out
>>> whether anybody complains=2E
>>=20
>> No, this is not the way to treat userspace ABI=2E
>>=20
>
>Mileage of subsystem maintainers seems to vary in this regard=2E
>See following example where Greg supported such an approach=2E
>https://www=2Espinics=2Enet/lists/linux-i2c/msg71821=2Ehtml
>But fine with me, we can also leave the version attribute in=2E

Let's leave the final decision to subsystem maintainers=2E


>
>>>
>>>>>
>>>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail=2Ecom>
>>>>> ---
>>>>>  drivers/gpu/drm/drm_sysfs=2Ec | 12 ------------
>>>>>  1 file changed, 12 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_sysfs=2Ec b/drivers/gpu/drm/drm_sys=
fs=2Ec
>>>>> index fb3bbb6ad=2E=2E49e5faf11 100644
>>>>> --- a/drivers/gpu/drm/drm_sysfs=2Ec
>>>>> +++ b/drivers/gpu/drm/drm_sysfs=2Ec
>>>>> @@ -126,8 +126,6 @@ static const struct component_ops typec_connecto=
r_ops =3D {
>>>>>  	=2Eunbind =3D typec_connector_unbind,
>>>>>  };
>>>>> =20
>>>>> -static CLASS_ATTR_STRING(version, S_IRUGO, "drm 1=2E1=2E0 20060810"=
);
>>>>> -
>>>>>  /**
>>>>>   * drm_sysfs_init - initialize sysfs helpers
>>>>>   *
>>>>> @@ -140,19 +138,10 @@ static CLASS_ATTR_STRING(version, S_IRUGO, "dr=
m 1=2E1=2E0 20060810");
>>>>>   */
>>>>>  int drm_sysfs_init(void)
>>>>>  {
>>>>> -	int err;
>>>>> -
>>>>>  	drm_class =3D class_create("drm");
>>>>>  	if (IS_ERR(drm_class))
>>>>>  		return PTR_ERR(drm_class);
>>>>> =20
>>>>> -	err =3D class_create_file(drm_class, &class_attr_version=2Eattr);
>>>>> -	if (err) {
>>>>> -		class_destroy(drm_class);
>>>>> -		drm_class =3D NULL;
>>>>> -		return err;
>>>>> -	}
>>>>> -
>>>>>  	drm_class->devnode =3D drm_devnode;
>>>>> =20
>>>>>  	drm_sysfs_acpi_register();
>>>>> @@ -169,7 +158,6 @@ void drm_sysfs_destroy(void)
>>>>>  	if (IS_ERR_OR_NULL(drm_class))
>>>>>  		return;
>>>>>  	drm_sysfs_acpi_unregister();
>>>>> -	class_remove_file(drm_class, &class_attr_version=2Eattr);
>>>>>  	class_destroy(drm_class);
>>>>>  	drm_class =3D NULL;
>>>>>  }
>>>>> --=20
>>>>> 2=2E46=2E0
>>>>>
>>>>>
>>>>
>>>
>>=20
>>=20
>


--=20
With best wishes
Dmitry
