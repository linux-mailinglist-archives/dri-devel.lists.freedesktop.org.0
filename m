Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCC7AE1994
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 13:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7670D10EB4A;
	Fri, 20 Jun 2025 11:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="1qENRCFv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E62110EB4A
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 11:07:52 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-ad891bb0957so309310966b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 04:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1750417670; x=1751022470; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j56NnU+C4rZ3igsVwK0poqCyRvUi8MRY+wsVdUJRvmo=;
 b=1qENRCFvy4KbWeuVcOn/4HGrhNibVicutHLauiu22x/2li7hGyft4zTe6qirSgA0NO
 pjkZUOhlpDgou53xA+yJl+opB93W0So4nPBHmRBAdS++AvMcRbT4ogyX7PTemPW+XfjJ
 h2ZxGQBbVYQhaHcF8iVoA4oKE9By0rb855pmYiTrcK3UwVLzpQnl6AxylXcj4CaiUh5Z
 MQ3NPEt9pSdB++kPPVrj6LR3zozgSEs9XRRxmrJZgJLvOr4HmOTfv0yUJgKNmEhswAQt
 F8l716zBmQI9K4qU0c+feskVNcxu4Th/vBEjJKLgVFY+bGFQDYLXENnPig061xkiw7e/
 A6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750417670; x=1751022470;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=j56NnU+C4rZ3igsVwK0poqCyRvUi8MRY+wsVdUJRvmo=;
 b=O/pvY1hehrgyY2bxKWc3IFWWQ9DLLN0R2iyS+z1fkClJhskasvjv/eqFDiawran+dg
 xgbrB3bQcVad/IUdi6ZlKY1UaLEmdWgxnXzmW092zsMQQ8YWpP7mCh/JWzwvk6D7Gc2K
 o/i4F6reIeiRffGq8RSpHvBlklNGdE14q3ZPAe3OIn5FXKvWnAXp2CQOI4HkG9Z/ZtAS
 ThaF205KS342x0JYjPwiHni3wJVC5dcz07kacU4KlHD4nxlm35rgRTdVOWJhWKLjX/y2
 DLglboBWTK6Q3gp2ZU/r+5hdB4CzGuEY/0Ug/YEkoX98rc5pn5NSD/2ZPUMCimUzddKE
 SYtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIT3SB2wkC5h7fF2q6ip2Z92brPb6JkJa6ld3FmehIiI4aKCv2754AVS2cOs7EJ9j3LTp0aCVoZ4s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNi/NRserwyMYHJzBZoEqeuL80nKiE46NxO6d6h2VSn28Ul+0W
 NjGOVuWAwUzSqc9Ixw/podPo3rYUcP5vuE8coKg9IG9CFGGjli8S/TzxcIu8LxHtasc=
X-Gm-Gg: ASbGncvmi1oLXFuNVq0VsRjp8Py9fFIK0tRSouHoqm82Dmf97HDmefoeLLMWn1nS0NQ
 FkfxqF5RiirYrdGGR6vH7yEmXx2/sCR2irDufnk5G+zXgyQwZA151tuIBovJ8kVf645BvKKRmY1
 Yw0LTxUXW4kQW+KbTNkJsW3T/zMbSZDrDXtJjee/0F4PWj/U9FCzGJfL+yEc2z5VD8i7qSNZ68/
 d1ZiCs+oKNBtj9M7lZbZ0lD2ljXoW+MDhu42KyCeGpDlQfpejINSKh7OWZP4+n2aBO+abPzdwyO
 DiYUq/xyREnL5vPL4pNj51phFLh1JTU1zgzC2Nidfxjerc/J9VGp+lt0WhIAt9jFPNGrmr9RRwn
 8Rzkt1J9H8B9DXK+DyvGJ2HIyYE3L+Pc=
X-Google-Smtp-Source: AGHT+IHi2VbmsYUmEDnp9Sif2RGnVt1dOueBmIGckoT6F8WA4k68tCAYn7k5QT+Eg9xqzhehbqW5mA==
X-Received: by 2002:a17:906:6a03:b0:ad8:8621:9241 with SMTP id
 a640c23a62f3a-ae057c7eef2mr239743066b.54.1750417670525; 
 Fri, 20 Jun 2025 04:07:50 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl.
 [144.178.202.138]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae053ee4c90sm147879866b.62.2025.06.20.04.07.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jun 2025 04:07:50 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Jun 2025 13:07:49 +0200
Message-Id: <DARBA03BEQA1.3KLHCBFNTVXKJ@fairphone.com>
Cc: <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] fbdev/simplefb: Add support for interconnect paths
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Thomas Zimmermann" <tzimmermann@suse.de>, "Hans de Goede"
 <hdegoede@redhat.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Javier Martinez Canillas"
 <javierm@redhat.com>, "Helge Deller" <deller@gmx.de>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250620-simple-drm-fb-icc-v1-0-d92142e8f74f@fairphone.com>
 <20250620-simple-drm-fb-icc-v1-3-d92142e8f74f@fairphone.com>
 <cf29862b-496b-4825-aa0f-493eb44838a5@suse.de>
In-Reply-To: <cf29862b-496b-4825-aa0f-493eb44838a5@suse.de>
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

Hi Thomas,

On Fri Jun 20, 2025 at 1:02 PM CEST, Thomas Zimmermann wrote:
> Hi
>
> Am 20.06.25 um 12:31 schrieb Luca Weiss:
>> Some devices might require keeping an interconnect path alive so that
>> the framebuffer continues working. Add support for that by setting the
>> bandwidth requirements appropriately for all provided interconnect
>> paths.
>>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>   drivers/video/fbdev/simplefb.c | 83 ++++++++++++++++++++++++++++++++++=
++++++++
>>   1 file changed, 83 insertions(+)
>>
>> diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simple=
fb.c
>> index be95fcddce4c8ca794826b805cd7dad2985bd637..ca73e079fd13550ddc779e84=
db80f7f9b743d074 100644
>> --- a/drivers/video/fbdev/simplefb.c
>> +++ b/drivers/video/fbdev/simplefb.c
>> @@ -27,6 +27,7 @@
>>   #include <linux/parser.h>
>>   #include <linux/pm_domain.h>
>>   #include <linux/regulator/consumer.h>
>> +#include <linux/interconnect.h>
>
> With alphabetical sorting:
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for the reviews!

For both simpledrm.c and simplefb.c, the includes are not strictly
alphabetically sorted (1 mis-sort in simpledrm, 3 in simplefb), shall I
just try and slot it into the best fitting place, or make them sorted in
my patch? Or I can add a separate commit for each driver before to sort
them.

Let me know!

Regards
Luca


>
> Best regards
> Thomas
>
>
>>  =20
>>   static const struct fb_fix_screeninfo simplefb_fix =3D {
>>   	.id		=3D "simple",
>> @@ -89,6 +90,10 @@ struct simplefb_par {
>>   	u32 regulator_count;
>>   	struct regulator **regulators;
>>   #endif
>> +#if defined CONFIG_OF && defined CONFIG_INTERCONNECT
>> +	unsigned int icc_count;
>> +	struct icc_path **icc_paths;
>> +#endif
>>   };
>>  =20
>>   static void simplefb_clocks_destroy(struct simplefb_par *par);
>> @@ -525,6 +530,80 @@ static int simplefb_attach_genpds(struct simplefb_p=
ar *par,
>>   }
>>   #endif
>>  =20
>> +#if defined CONFIG_OF && defined CONFIG_PM_GENERIC_DOMAINS
>> +/*
>> + * Generic interconnect path handling code.
>> + */
>> +static void simplefb_detach_icc(void *res)
>> +{
>> +	struct simplefb_par *par =3D res;
>> +	int i;
>> +
>> +	for (i =3D par->icc_count - 1; i >=3D 0; i--) {
>> +		if (!IS_ERR_OR_NULL(par->icc_paths[i]))
>> +			icc_put(par->icc_paths[i]);
>> +	}
>> +}
>> +
>> +static int simplefb_attach_icc(struct simplefb_par *par,
>> +			       struct platform_device *pdev)
>> +{
>> +	struct device *dev =3D &pdev->dev;
>> +	int ret, count, i;
>> +
>> +	count =3D of_count_phandle_with_args(dev->of_node, "interconnects",
>> +							 "#interconnect-cells");
>> +	if (count < 0)
>> +		return 0;
>> +
>> +	/* An interconnect path consists of two elements */
>> +	if (count % 2) {
>> +		dev_err(dev, "invalid interconnects value\n");
>> +		return -EINVAL;
>> +	}
>> +	par->icc_count =3D count / 2;
>> +
>> +	par->icc_paths =3D devm_kcalloc(dev, par->icc_count,
>> +				      sizeof(*par->icc_paths),
>> +				      GFP_KERNEL);
>> +	if (!par->icc_paths)
>> +		return -ENOMEM;
>> +
>> +	for (i =3D 0; i < par->icc_count; i++) {
>> +		par->icc_paths[i] =3D of_icc_get_by_index(dev, i);
>> +		if (IS_ERR_OR_NULL(par->icc_paths[i])) {
>> +			ret =3D PTR_ERR(par->icc_paths[i]);
>> +			if (ret =3D=3D -EPROBE_DEFER)
>> +				goto err;
>> +			dev_err(dev, "failed to get interconnect path %u: %d\n", i, ret);
>> +			continue;
>> +		}
>> +
>> +		ret =3D icc_set_bw(par->icc_paths[i], 0, UINT_MAX);
>> +		if (ret) {
>> +			dev_err(dev, "failed to set interconnect bandwidth %u: %d\n", i, ret=
);
>> +			continue;
>> +		}
>> +	}
>> +
>> +	return devm_add_action_or_reset(dev, simplefb_detach_icc, par);
>> +
>> +err:
>> +	while (i) {
>> +		--i;
>> +		if (!IS_ERR_OR_NULL(par->icc_paths[i]))
>> +			icc_put(par->icc_paths[i]);
>> +	}
>> +	return ret;
>> +}
>> +#else
>> +static int simplefb_attach_icc(struct simplefb_par *par,
>> +			       struct platform_device *pdev)
>> +{
>> +	return 0;
>> +}
>> +#endif
>> +
>>   static int simplefb_probe(struct platform_device *pdev)
>>   {
>>   	int ret;
>> @@ -615,6 +694,10 @@ static int simplefb_probe(struct platform_device *p=
dev)
>>   	if (ret < 0)
>>   		goto error_regulators;
>>  =20
>> +	ret =3D simplefb_attach_icc(par, pdev);
>> +	if (ret < 0)
>> +		goto error_regulators;
>> +
>>   	simplefb_clocks_enable(par, pdev);
>>   	simplefb_regulators_enable(par, pdev);
>>  =20
>>

