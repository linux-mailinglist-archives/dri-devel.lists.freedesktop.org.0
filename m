Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 588BFB014E6
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 09:43:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3445610E071;
	Fri, 11 Jul 2025 07:43:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="wmgLvKMs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B69A10E071
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 07:43:49 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-ae36e88a5daso356373266b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 00:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1752219827; x=1752824627; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3IIaUlC/iOoJ+QVPC0O3jLr9bGCpNKQPquWiGz3IsOM=;
 b=wmgLvKMs/AyhCStT1SVzpgjV9YJfOACHOVxLByu9eJF3lRcGKVg9djzfYeLQBoXYjG
 +A7ywk598Uckz1/tTrUbWKdT4Gt1yvdKyBKGve9iCiNSH/MyQe6KANk3Xy3+H7Db5E9Z
 C/KZX42B+xSdi1E8IvJGXm/7y/Gz46qg6RmWFLRFpSqtzTqBPol+DPiLb8yIh4R+KAyK
 MuAUkRQArl9DMKhN8fjPoZf6nPX+cF9WjyYB60Lic8mP1k2cEN7YpQ8PqQoXMpgREIeR
 nqHazc6j8YPVt+9obj/0XWLrlkid+gQ17DjRD4hT7AKE48eiUECvAJjPvun2fCOiFR4W
 f03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752219827; x=1752824627;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3IIaUlC/iOoJ+QVPC0O3jLr9bGCpNKQPquWiGz3IsOM=;
 b=b6Sz0vsKU23Qg47bIYx3VyxgLwF1EUqJv9mrRa1rSlMVw6JUlkkAY7vXzIr8DbeoH+
 VEboXNToEkXOX8yWieVzxRBRlui5e9T7XQAxLL+o47N5JG/VGVpLCFrIpxDL7BZZJVNn
 rdtINJF4mESOmylYoJMtpL1TQ1paxWzI5FF9LDhP31Ld/r6h8pwqLd+Ier1u2A/EGQBq
 109/EgYlU0v+DoLNI3GpG3JxxY17YCd/WgGZ9c61jzZB2c5bVWH1tEnb1wM/Wb7kPrsw
 VibvJuk6MN1jHYRWTajz30dI1c//Hz3aNq0/JVwHmRw3OrzTkoyhljjt8Ry4FEArMP4Y
 YB0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5iTdlZEAdVrD5F2ivcZkH5x3yzFbCh/kks41iGFCZ5qv70isvwqFJ1wpfF3SMEoWuguHy3przmOg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzc6o9LONm3lfbpBxVHTd8vQUQhMiZX6d0s/CJZGRbY3s4fU64a
 +mphKkbMxck/3E0eTvZP79hl3FpkZfbh8eEPyWlIMmvR/tUX2h6yoClplNtPfZ/pk5A=
X-Gm-Gg: ASbGncuqQKVuE7Dez5zUHf8usvEWD9V63/2uI0od64pCW8WiNNfQxppRIwpDLs/Z3U8
 a4ba4twUHNQ/O3J7/uZ4E1kgPdmg7025YyFDC1NsLCvuU4H6AiZ0iGDkmxMvR/WEq2a1tmNWHgo
 +FdLah0RGTa/BmbkGTgTWUQrJDRZiqsm2EzS3DB1cOjlSzD3XNPtS8SMQ5+bVtXkJ/JqvE3Ztxe
 1h/V2aGW1TXXSX2hUMEZ3e8/jKPhb1PS93G7GnYZnya75aTCmDACvykcilcczEnCbQXszPUyoYW
 nozVt8w1jjJ2Kl8l7cLq3bQNWPhz3BRXOW0n/v7+SZ0gQlj1xszpgBLav6QguVqKkMg0VeoluZ5
 dmYWTGlCrAquu2mV3kF7Ram76LS2gCRJFvo9pBAIlrRkwTAviKjkP14toqbHeB1sZQUU=
X-Google-Smtp-Source: AGHT+IFTYupbQy72RBvYwBS8ueAvzrjXrAehsUXPExTpFAM8Ni+N0B33aqtgCjScHufwI8X0ZAMX1g==
X-Received: by 2002:a17:906:fe0c:b0:ae3:5212:c906 with SMTP id
 a640c23a62f3a-ae6fbe13960mr253963566b.10.1752219827399; 
 Fri, 11 Jul 2025 00:43:47 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl.
 [144.178.202.139]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e7e90c70sm259816466b.13.2025.07.11.00.43.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jul 2025 00:43:46 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Jul 2025 09:43:46 +0200
Message-Id: <DB9237QHOXRU.JRJB8SPUX8RO@fairphone.com>
Cc: <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
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
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
 <20250623-simple-drm-fb-icc-v2-3-f69b86cd3d7d@fairphone.com>
 <87qzz5d3le.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87qzz5d3le.fsf@minerva.mail-host-address-is-not-set>
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

On Fri Jun 27, 2025 at 9:51 AM CEST, Javier Martinez Canillas wrote:
> Luca Weiss <luca.weiss@fairphone.com> writes:
>
>> Some devices might require keeping an interconnect path alive so that
>> the framebuffer continues working. Add support for that by setting the
>> bandwidth requirements appropriately for all provided interconnect
>> paths.
>>
>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  drivers/gpu/drm/sysfb/simpledrm.c | 83 ++++++++++++++++++++++++++++++++=
+++++++
>>  1 file changed, 83 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/sysfb/simpledrm.c b/drivers/gpu/drm/sysfb/s=
impledrm.c
>> index 349219330314e3421a6bb26ad5cf39a679a5cb7a..47d213e20cab1dd1e1952867=
4a95edea00f4bb30 100644
>> --- a/drivers/gpu/drm/sysfb/simpledrm.c
>> +++ b/drivers/gpu/drm/sysfb/simpledrm.c
>> @@ -2,6 +2,7 @@
>> =20
>>  #include <linux/aperture.h>
>>  #include <linux/clk.h>
>> +#include <linux/interconnect.h>
>>  #include <linux/minmax.h>
>>  #include <linux/of_address.h>
>>  #include <linux/of_clk.h>
>> @@ -225,6 +226,10 @@ struct simpledrm_device {
>>  	struct device **pwr_dom_devs;
>>  	struct device_link **pwr_dom_links;
>>  #endif
>
> Can you add a /* interconnects */ comment here? Similarly how there is on=
e
> for clocks, regulators, power domains, etc.

Sure!

>
>> +#if defined CONFIG_OF && defined CONFIG_INTERCONNECT
>> +	unsigned int icc_count;
>> +	struct icc_path **icc_paths;
>> +#endif
>> =20
>
> ...
>
>> +static int simpledrm_device_attach_icc(struct simpledrm_device *sdev)
>> +{
>> +	struct device *dev =3D sdev->sysfb.dev.dev;
>> +	int ret, count, i;
>> +
>> +	count =3D of_count_phandle_with_args(dev->of_node, "interconnects",
>> +							 "#interconnect-cells");
>> +	if (count < 0)
>> +		return 0;
>> +
>> +	/* An interconnect path consists of two elements */
>> +	if (count % 2) {
>> +		drm_err(&sdev->sysfb.dev,
>> +			"invalid interconnects value\n");
>> +		return -EINVAL;
>> +	}
>> +	sdev->icc_count =3D count / 2;
>> +
>> +	sdev->icc_paths =3D devm_kcalloc(dev, sdev->icc_count,
>> +					       sizeof(*sdev->icc_paths),
>> +					       GFP_KERNEL);
>> +	if (!sdev->icc_paths)
>> +		return -ENOMEM;
>> +
>> +	for (i =3D 0; i < sdev->icc_count; i++) {
>> +		sdev->icc_paths[i] =3D of_icc_get_by_index(dev, i);
>> +		if (IS_ERR_OR_NULL(sdev->icc_paths[i])) {
>> +			ret =3D PTR_ERR(sdev->icc_paths[i]);
>> +			if (ret =3D=3D -EPROBE_DEFER)
>> +				goto err;
>> +			drm_err(&sdev->sysfb.dev, "failed to get interconnect path %u: %d\n"=
,
>> +				i, ret);
>
> You could use dev_err_probe() instead that already handles the -EPROBE_DE=
FER
> case and also will get this message in the /sys/kernel/debug/devices_defe=
rred
> debugfs entry, as the reason why the probe deferral happened.

Not quite sure how to implement dev_err_probe, but I think this should
be quite okay?

		if (IS_ERR_OR_NULL(sdev->icc_paths[i])) {
			ret =3D dev_err_probe(dev, PTR_ERR(sdev->icc_paths[i]),
				      "failed to get interconnect path %u\n", i);
			if (ret =3D=3D -EPROBE_DEFER)
				goto err;
			continue;
		}

That would still keep the current behavior for defer vs permanent error
while printing when necessary and having it for devices_deferred for the
defer case.

Not sure what the difference between drm_err and dev_err are, but I
trust you on that.

Let me know.

Regards
Luca

>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

