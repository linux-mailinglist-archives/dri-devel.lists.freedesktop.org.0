Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D362AEB369
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 11:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E97310E132;
	Fri, 27 Jun 2025 09:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="dLdFT2CY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E56A10E132
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 09:51:12 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-ae35c447234so72532066b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 02:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1751017871; x=1751622671; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TAKHP6eBszL2hrHuqZ8PH7OxIF1g8NegvI8NrbNa5H4=;
 b=dLdFT2CYasX3/N0pO4pt8uTcdoAijYuuQ1aN9MQR+J3A5KhOAqcyvmvpz6Q9E3xzp/
 Vt1cWJvH11rFTRWJI6Q0ghUd4QkuRRlL8CxuMRw7aL3tYg/FjjFh8avwtvy1XimlvFpY
 h4qI22itYvsnyABFj6xT878ifajooNttj5oo8SKC77zgSZlX10pa7VREzCLWEjmnmzj8
 ngOyb9+5XgBrj4CNlCxPJehJR7wB/Oug+kMHg3w5hQvdanGw9TmM5zeGoEpsoE2MGt6q
 StEfafnOT6IpVH1BHZpemyHlWrXtNIta/DF0HVJkvSjb8G6BdfOLIBK148dL6a3oP3lk
 ltfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751017871; x=1751622671;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TAKHP6eBszL2hrHuqZ8PH7OxIF1g8NegvI8NrbNa5H4=;
 b=rNu5FnQFo87ft8IuKW7zcUE5sSE8EyDdva+ytBhDX1mXDPlwDkity8GBvNzoG1goYL
 XxIWKS94L4+D05YyuFowIlbTJ1P+sbf7Op3m9oQxknqBE0CCHk3lB2+NVm4p05DeYa2j
 WkhF4/pfOTzBDllVM+QNM1EJ8uDY9OZXCb3pJVbDrq7gbBoMC9j+/eqqtPl+4o8Zdnps
 WB3AEaxJHLuEkxkr2hM3HKTyuRdXM5IeauvLDSYm3ID6pWBkVLV7atSHnzP6dzfKR4hW
 lSGIj9z2H30oXBws277aX1VoymgBwOtrQaEwCPjXZqMz/Lr5f3O0j+KFhkPtpGVHxMrl
 /CwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKMlCnNJSPLw1aSWHKOc4ztB+/pKGCbKKB2uOhxbweOBNostHRpqCsbDM1L+eJMHKCWwOBrFut6sg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwyUV62osj6T0BwSOq8N51jYG88yI1LGmu1AqItFgr723wdBF6u
 T3ni5JW5QgxpLwGI+hUFWRTBFM7FfryrQe1mDkU7adlwZL259GIY5BRBStyhsiS1B80=
X-Gm-Gg: ASbGncu8GlYtHaYEz2pclwrXaRoNwyBzfTO0MX0av0HlhlYDID7OD9vZCHFfQfBV3+e
 FrK7ZpxcVRIHHo6WakZ2dzJZkIBgu0T5yxOeXobNeS893rCtFo7E4HKibnpDMzEN1XMEYldIGCL
 wDnVYr1rRMjGeMGUKgUOCc+/bYs+r950/Z6uT5EyB/V3bTXx3A4bXH8q9jXznfqhVwfgKWTwIyR
 LT0wEqNndCavo43yXCOoUYdOcW9Cvb7vFcmEKWmeImM28AjDmEzR2QJskoYKPyFLnw9p/Q/+3Aj
 ZF+HiWLerunBNGpJJ6W/QjUJTcDf3bTpEiO9aRJAav5uN+MKE/9DbTiMO4rzlqo4W4kcoqwsH1N
 XZZe+U64ACdl2GLu16jbLhLqactIQEasmFFnZnYvNmw==
X-Google-Smtp-Source: AGHT+IE99Ck1XKmW0mBEtookC0EaO8U9aF4JHALURpPgmU1+B2UobnemydphVmXY2CO9mnSZo3zaVg==
X-Received: by 2002:a17:907:940d:b0:ae0:da61:71fc with SMTP id
 a640c23a62f3a-ae0da617483mr523043866b.10.1751017870669; 
 Fri, 27 Jun 2025 02:51:10 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl.
 [144.178.202.138]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae35417b9d8sm91937666b.184.2025.06.27.02.51.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jun 2025 02:51:10 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Jun 2025 11:51:09 +0200
Message-Id: <DAX814DZF6AT.31N8TZWL5LMDT@fairphone.com>
Cc: <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 5/5] fbdev/simplefb: Add support for interconnect paths
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
 <20250623-simple-drm-fb-icc-v2-5-f69b86cd3d7d@fairphone.com>
 <87ldpdd3dn.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87ldpdd3dn.fsf@minerva.mail-host-address-is-not-set>
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

On Fri Jun 27, 2025 at 9:56 AM CEST, Javier Martinez Canillas wrote:
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
>>  drivers/video/fbdev/simplefb.c | 83 +++++++++++++++++++++++++++++++++++=
+++++++
>>  1 file changed, 83 insertions(+)
>>
>
> [...]
>
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
>
> These two functions contain the same logic that you are using in the
> simpledrm driver. I wonder if could be made helpers so that the code
> isn't duplicated in both drivers.

I believe most resource handling code (clocks, regulators,
power-domains, plus now interconnect) should be pretty generic between
the two.

>
> But in any case it could be a follow-up of your series I think.

To be fair, I don't think I'll work on this, I've got plenty of Qualcomm
SoC-specific bits to work on :)

Regards
Luca

>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

