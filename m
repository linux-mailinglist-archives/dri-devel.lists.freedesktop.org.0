Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D227EA7F5
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 01:57:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D177710E43C;
	Tue, 14 Nov 2023 00:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 305F710E43E
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 00:57:16 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id
 6a1803df08f44-66d2f3bb312so30654736d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 16:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699923435; x=1700528235; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:content-language:references:cc:to
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=VaoBVehG73IzZPbtNmGP1xdAsEXUtYS3b/TPky58C2Y=;
 b=l1qt96/fnZaX9R5hx78s3pT/JnQaE4iBXCaPoMtDcgn6sfKXKP62XuG6V+OJn57MUY
 6mAt+arY3t24gxSN4SvcqqZC8N60XEeyRtAR2kiGiDwlkNsyU5GHjTVpCbvUEoE5jZLl
 t3p4bVwp27tdfjeFQafA6Ho9FJBNKOrr+yLRwJGGNTm7S+KRgX4yjILMcmjPhGTCAS/k
 5qnw/ddYL38SUBupnlj15qbYcB1rDgaDM1Wu9xItulTGknT46H38QsTxFAnHMVmB2shV
 ua9TAz8NuMeuN3h4thYYgCfQSGVV7MJyYmpm2iGs+9IBkv7c2K7pTRgxbFWnPf0LlzfY
 Z8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699923435; x=1700528235;
 h=in-reply-to:autocrypt:from:content-language:references:cc:to
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VaoBVehG73IzZPbtNmGP1xdAsEXUtYS3b/TPky58C2Y=;
 b=SOLUsmUOiyvjhnFsUrHkdyREzyQ8Ws12e6byCwtqFDR2ika5rSVgBTgQIcN6wx2hl0
 sEnGNRiKIWgBEjtZMxBsKy4/TCfdZb7QDF6BFJdthFMISvrD52mAh3Mt5pWipurVEDap
 BnGaNiAtO7iKB/KlU0EvfesHMcBN63zpzfYD4ayV/3IddiZ6jJVLzy2h5KPVf78BZF0F
 Nq5K3NeKyab9uXHJyLOvqTdFR4s7DjEzI40cx2sQM4Onr/1IQgDSmdpihlqMpGwt3vTY
 L4ZTZmSjeyDFSebCdIfGzCdTPanYJpqoF6qkOBEeiDA0Ojw4GjXaLt7wRkltrp/Snti1
 Qeqw==
X-Gm-Message-State: AOJu0Yx5dgNeZBvoAm64pPgpXcNUAunxx4nHA+VjdVUR75nrkGJzrGen
 9zXHJO90Nj8I1a4WSzJ9dU0=
X-Google-Smtp-Source: AGHT+IE5iy//eOfQuAENLdX1T9/wcMm3nHORg0RzM7Vif+tI19qlYdDnIHuj752x6ZHaBTOf02jPmw==
X-Received: by 2002:a05:6214:2a3:b0:671:739e:e2fa with SMTP id
 m3-20020a05621402a300b00671739ee2famr803006qvv.59.1699923435077; 
 Mon, 13 Nov 2023 16:57:15 -0800 (PST)
Received: from [192.168.2.14] ([76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 p4-20020ad451c4000000b0065d105f6931sm2498364qvq.59.2023.11.13.16.57.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Nov 2023 16:57:14 -0800 (PST)
Message-ID: <fff9c07b-323a-4769-b091-a20c45dc700e@gmail.com>
Date: Mon, 13 Nov 2023 19:57:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.4.2
Subject: Re: [PATCH] Revert "drm/sched: Define pr_fmt() for DRM using pr_*()"
To: Jani Nikula <jani.nikula@linux.intel.com>, javierm@redhat.com
References: <87leb4ae6z.fsf@minerva.mail-host-address-is-not-set>
 <20231111083327.18607-2-ltuikov89@gmail.com> <87y1f4v814.fsf@intel.com>
Content-Language: en-CA, en-US
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
In-Reply-To: <87y1f4v814.fsf@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZURDecZIj0XNQLG36Fq213oh"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ZURDecZIj0XNQLG36Fq213oh
Content-Type: multipart/mixed; boundary="------------sOzYcI0afv7Y1Ruppw1vtLp0";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <fff9c07b-323a-4769-b091-a20c45dc700e@gmail.com>
Subject: Re: [PATCH] Revert "drm/sched: Define pr_fmt() for DRM using pr_*()"
References: <87leb4ae6z.fsf@minerva.mail-host-address-is-not-set>
 <20231111083327.18607-2-ltuikov89@gmail.com> <87y1f4v814.fsf@intel.com>
In-Reply-To: <87y1f4v814.fsf@intel.com>

--------------sOzYcI0afv7Y1Ruppw1vtLp0
Content-Type: multipart/mixed; boundary="------------juhIvWthVq02Ooeq8eyzB0LY"

--------------juhIvWthVq02Ooeq8eyzB0LY
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-11-11 06:33, Jani Nikula wrote:
> On Sat, 11 Nov 2023, Luben Tuikov <ltuikov89@gmail.com> wrote:
>> From Jani:
>> The drm_print.[ch] facilities use very few pr_*() calls directly. The
>> users of pr_*() calls do not necessarily include <drm/drm_print.h> at
>> all, and really don't have to.
>>
>> Even the ones that do include it, usually have <linux/...> includes
>> first, and <drm/...> includes next. Notably, <linux/kernel.h> includes=

>> <linux/printk.h>.
>>
>> And, of course, <linux/printk.h> defines pr_fmt() itself if not alread=
y
>> defined.
>>
>> No, it's encouraged not to use pr_*() at all, and prefer drm device
>> based logging, or device based logging.
>>
>> This reverts commit 36245bd02e88e68ac5955c2958c968879d7b75a9.
>>
>> Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
>> Link: https://patchwork.freedesktop.org/patch/msgid/878r75wzm9.fsf@int=
el.com
>=20
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>=20
>=20
>> ---
>>  include/drm/drm_print.h | 14 --------------
>>  1 file changed, 14 deletions(-)
>>
>> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
>> index e8fe60d0eb8783..a93a387f8a1a15 100644
>> --- a/include/drm/drm_print.h
>> +++ b/include/drm/drm_print.h
>> @@ -26,20 +26,6 @@
>>  #ifndef DRM_PRINT_H_
>>  #define DRM_PRINT_H_
>> =20
>> -/* Define this before including linux/printk.h, so that the format
>> - * string in pr_*() macros is correctly set for DRM. If a file wants
>> - * to define this to something else, it should do so before including=

>> - * this header file.
>> - *
>> - * It is encouraged code using pr_err() to prefix their format with
>> - * the string "*ERROR* ", to make it easier to scan kernel logs. For
>> - * instance,
>> - *   pr_err("*ERROR* <the rest of your format string here>", args).
>> - */
>> -#ifndef pr_fmt
>> -#define pr_fmt(fmt) "[drm] " fmt
>> -#endif
>> -
>>  #include <linux/compiler.h>
>>  #include <linux/printk.h>
>>  #include <linux/seq_file.h>
>>
>> base-commit: 540527b1385fb203cc4513ca838b4de60bbbc49a
>=20

Pushed.
--=20
Regards,
Luben

--------------juhIvWthVq02Ooeq8eyzB0LY
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

--------------juhIvWthVq02Ooeq8eyzB0LY--

--------------sOzYcI0afv7Y1Ruppw1vtLp0--

--------------ZURDecZIj0XNQLG36Fq213oh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZVLF4QUDAAAAAAAKCRBMFUeUMaM0r8lf
AP4zqJJWh1f/jfyOgtRzQjYlw5W9C6Vqar4GsfiuZSxW3QD/RIVQg1lU8Bgpc7MbdC4rZ0UKYDEX
oiWFKEVGbmwi5wo=
=lkTn
-----END PGP SIGNATURE-----

--------------ZURDecZIj0XNQLG36Fq213oh--
