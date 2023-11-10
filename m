Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CA77E7CC9
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 14:58:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB27F10E033;
	Fri, 10 Nov 2023 13:58:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E65B410E033
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 13:58:33 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-d9fe0a598d8so2139958276.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 05:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699624713; x=1700229513; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=qHtbkIeMAuxXUUe5yXc1tzVXWgiafriV4Ezpi0SsKGo=;
 b=FKQrI5LiiIsaHSFCd+RZp+gz6RJ+lfD+GL/4xrSnerojBYKeh4UK5JdWIFspQois1y
 QW4kv2eDC3dqKA9aPbsGx3mwCHtoIwTkRxMMdF8R6UkPHcI0E0jOZQCLIT+uTZmPB8Ys
 tjdNR0PR3dcKuDUN/g4HOD5BNsuzwTI4DpVazzS+V+ShO6lCS7tQ6AtsN5m2GPLXQdcz
 1honN1J4GQG4gHENGYpgLvY22RNVquk3QZNi9fKr3mUKl9Le1l3nqKwQZaQT+wpnw+Rj
 vS/iOZgGBGaoHO1jY1qd6+c6swrnhOiXV0SMmqFtkA17Yf6JFoT9/XR9ZJjGwB9zWrpO
 zcVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699624713; x=1700229513;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qHtbkIeMAuxXUUe5yXc1tzVXWgiafriV4Ezpi0SsKGo=;
 b=DmLx49kTGmhn17F7kMJjEJRI1StQdfgXH1OULxsTkaSvPrYPWeDebFNI+9ckKyS0i1
 jyc+aWWF7gc606rWj10F3ob8JWjmP5zwGDMYSxlLxaRSjwrPGV1/OOc7nRfxkcQa3q2Z
 j8yCWmgVbLX9SQXY0Dpftuant2nlkxTW43kMj9wCI42MENM72f9OuxgNRSoZrAw46dP1
 7OZHn6TNQdfpV7nV8508wrnAmAu0sa3h7FAaW2g1Vn1QB26EBxW/oKI5erh2a8sYoEat
 EHB7VZbP1C6IjKQyOj2RLj5C9CADdaYIL3lr7/9hcsqmuN4luNvR4YEgaOGhE0j66eSg
 jLLQ==
X-Gm-Message-State: AOJu0YyJYjP6Wb7glBpjB2wdQaJf5CifAE6/OyYieaXxWdk+391qVg7l
 eAA4y0AdaIyzRmdEzjqG5vQ=
X-Google-Smtp-Source: AGHT+IGl0cc/goGjY9h56nKB44BcNPcbqUiiIGnxl4N1jrwUMgZpXBcVHNtbAdQPzY5BtbuMsJO3bA==
X-Received: by 2002:a25:abcc:0:b0:da0:411b:ef19 with SMTP id
 v70-20020a25abcc000000b00da0411bef19mr8401615ybi.1.1699624712843; 
 Fri, 10 Nov 2023 05:58:32 -0800 (PST)
Received: from [192.168.2.14] ([76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a05621401ea00b0066d04196c3dsm2922069qvu.49.2023.11.10.05.58.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Nov 2023 05:58:32 -0800 (PST)
Message-ID: <3ac22429-24d3-4e51-be45-9f0404440bd3@gmail.com>
Date: Fri, 10 Nov 2023 08:58:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.4.2
Subject: Re: [PATCH] drm/sched: Define pr_fmt() for DRM using pr_*()
Content-Language: en-CA, en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>, Danilo Krummrich <dakr@redhat.com>
References: <20231110002659.113208-2-ltuikov89@gmail.com>
 <878r75wzm9.fsf@intel.com>
From: Luben Tuikov <ltuikov89@gmail.com>
Autocrypt: addr=ltuikov89@gmail.com; keydata=
 xjMEZTohOhYJKwYBBAHaRw8BAQdAWSq76k+GsENjDTMVCy9Vr4fAO9Rb57/bPT1APnbnnRHN
 Ikx1YmVuIFR1aWtvdiA8bHR1aWtvdjg5QGdtYWlsLmNvbT7CmQQTFgoAQRYhBJkj7+VmFO9b
 eaAl10wVR5QxozSvBQJlOiE6AhsDBQkJZgGABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheA
 AAoJEEwVR5QxozSvSm4BAOwCpX53DTQhE20FBGlTMqKCOQyJqlMcIQ9SO1qPWX1iAQCv3vfy
 JwktF7REl1yt7IU2Sye1qmQMfJxdt9JMbMNNBs44BGU6IToSCisGAQQBl1UBBQEBB0BT9wSP
 cCE8uGe7FWo8C+nTSyWPXKTx9F0gpEnlqReRBwMBCAfCfgQYFgoAJhYhBJkj7+VmFO9beaAl
 10wVR5QxozSvBQJlOiE6AhsMBQkJZgGAAAoJEEwVR5QxozSvSsYA/2LIFjbxQ2ikbU5S0pKo
 aMDzO9eGz69uNhNWJcvIKJK6AQC9228Mqc1JeZMIyjYWr2HKYHi8S2q2/zHrSZwAWYYwDA==
In-Reply-To: <878r75wzm9.fsf@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fnvOZr0e1V0RVM7BiYAvL3gC"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------fnvOZr0e1V0RVM7BiYAvL3gC
Content-Type: multipart/mixed; boundary="------------KIWHYiZ5AytCq7jksfNtmnat";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>, Danilo Krummrich <dakr@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <3ac22429-24d3-4e51-be45-9f0404440bd3@gmail.com>
Subject: Re: [PATCH] drm/sched: Define pr_fmt() for DRM using pr_*()
References: <20231110002659.113208-2-ltuikov89@gmail.com>
 <878r75wzm9.fsf@intel.com>
In-Reply-To: <878r75wzm9.fsf@intel.com>

--------------KIWHYiZ5AytCq7jksfNtmnat
Content-Type: multipart/mixed; boundary="------------lPbbpKfwgIj5bKy3N8qOmRuX"

--------------lPbbpKfwgIj5bKy3N8qOmRuX
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-11-10 07:40, Jani Nikula wrote:
> On Thu, 09 Nov 2023, Luben Tuikov <ltuikov89@gmail.com> wrote:
>> Define pr_fmt() as "[drm] " for DRM code using pr_*() facilities, espe=
cially
>> when no devices are available. This makes it easier to browse kernel l=
ogs.
>=20
> Please do not merge patches before people have actually had a chance to=

> look at them. This was merged *way* too quickly.

Agreed.

>=20
> This does not do what you think it does, and it's not robust enough.
>=20
> The drm_print.[ch] facilities use very few pr_*() calls directly. The
> users of pr_*() calls do not necessarily include <drm/drm_print.h> at
> all, and really don't have to.
>=20
> Even the ones that do include it, usually have <linux/...> includes
> first, and <drm/...> includes next. Notably, <linux/kernel.h> includes
> <linux/printk.h>.
>=20
> And, of course, <linux/printk.h> defines pr_fmt() itself if not already=

> defined.
>=20
>> Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
>> ---
>>  include/drm/drm_print.h | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
>> index a93a387f8a1a15..e8fe60d0eb8783 100644
>> --- a/include/drm/drm_print.h
>> +++ b/include/drm/drm_print.h
>> @@ -26,6 +26,20 @@
>>  #ifndef DRM_PRINT_H_
>>  #define DRM_PRINT_H_
>> =20
>> +/* Define this before including linux/printk.h, so that the format
>> + * string in pr_*() macros is correctly set for DRM. If a file wants
>> + * to define this to something else, it should do so before including=

>> + * this header file.
>=20
> The only way this would work is by including <drm/drm_print.h> as the
> very first header, and that's fragile at best.
>=20
>> + *
>> + * It is encouraged code using pr_err() to prefix their format with
>> + * the string "*ERROR* ", to make it easier to scan kernel logs. For
>> + * instance,
>> + *   pr_err("*ERROR* <the rest of your format string here>", args).
>=20
> No, it's encouraged not to use pr_*() at all, and prefer drm device
> based logging, or device based logging.
>=20
> I'd rather this whole thing was just reverted.

Agreed.

Do I have your R-B for a revert?
--=20
Regards,
Luben

--------------lPbbpKfwgIj5bKy3N8qOmRuX
Content-Type: application/pgp-keys; name="OpenPGP_0x4C15479431A334AF.asc"
Content-Disposition: attachment; filename="OpenPGP_0x4C15479431A334AF.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZTohOhYJKwYBBAHaRw8BAQdAWSq76k+GsENjDTMVCy9Vr4fAO9Rb57/bPT1A
PnbnnRHNIkx1YmVuIFR1aWtvdiA8bHR1aWtvdjg5QGdtYWlsLmNvbT7CmQQTFgoA
QRYhBJkj7+VmFO9beaAl10wVR5QxozSvBQJlOiE6AhsDBQkJZgGABQsJCAcCAiIC
BhUKCQgLAgQWAgMBAh4HAheAAAoJEEwVR5QxozSvSm4BAOwCpX53DTQhE20FBGlT
MqKCOQyJqlMcIQ9SO1qPWX1iAQCv3vfyJwktF7REl1yt7IU2Sye1qmQMfJxdt9JM
bMNNBs44BGU6IToSCisGAQQBl1UBBQEBB0BT9wSPcCE8uGe7FWo8C+nTSyWPXKTx
9F0gpEnlqReRBwMBCAfCfgQYFgoAJhYhBJkj7+VmFO9beaAl10wVR5QxozSvBQJl
OiE6AhsMBQkJZgGAAAoJEEwVR5QxozSvSsYA/2LIFjbxQ2ikbU5S0pKoaMDzO9eG
z69uNhNWJcvIKJK6AQC9228Mqc1JeZMIyjYWr2HKYHi8S2q2/zHrSZwAWYYwDA=3D=3D
=3DqCaZ
-----END PGP PUBLIC KEY BLOCK-----

--------------lPbbpKfwgIj5bKy3N8qOmRuX--

--------------KIWHYiZ5AytCq7jksfNtmnat--

--------------fnvOZr0e1V0RVM7BiYAvL3gC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZU42/wUDAAAAAAAKCRBMFUeUMaM0r5Si
AQDaVUM6ZghHQlBHKqA2OTsx5zc7VJwLAqUUR4SUQk/JIAD9E1QKHAl6m63oVxjm1WFAgvAfs2lA
idlB42hBdlcUkQA=
=qd7f
-----END PGP SIGNATURE-----

--------------fnvOZr0e1V0RVM7BiYAvL3gC--
