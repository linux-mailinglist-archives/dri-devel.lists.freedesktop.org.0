Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 547257EA80E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 02:04:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16AC210E43D;
	Tue, 14 Nov 2023 01:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com
 [IPv6:2607:f8b0:4864:20::a33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B4EB10E43D
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 01:04:33 +0000 (UTC)
Received: by mail-vk1-xa33.google.com with SMTP id
 71dfb90a1353d-4ac10aacd27so2208477e0c.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 17:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699923872; x=1700528672; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4kHXsPHKGwyF0xAN3V1/Y4Fcj/CoQWrTynZ8Dn+yjl4=;
 b=Jfo7DYbsFPizhWcVmBONNZKcu9hK0cbpwDexCAnvepBM1MRsh4JTYiHLYCYQ53ielu
 xclXrlSm5mpTeY+05iCH9QjnFpxijtP2Ym21P1NCB6NXAATJmGikl9FrYA9aM77VJwID
 ZxlY9eKyYs8YOlZbq8srilYB8WUtwO2GyC2u3lNfYt8h3YeuncNtJWiXPJfOACEV1hZL
 hpejO/kYXeqixC/O+2FmBa/1KG55FtuEYzo869tembs/804HhLyryXCOkiiwrGOpfEf8
 9o5wn7JcrpNluYVGjkbzjk3ojPa8hop/2rVfc5MXDzA81NgRsYxxs9MJUP7jZqCBus6j
 oVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699923872; x=1700528672;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4kHXsPHKGwyF0xAN3V1/Y4Fcj/CoQWrTynZ8Dn+yjl4=;
 b=LJHiBySWVoJyhB0KwfXzcG4pc1unuDBoNrw9XzUo7OPd2+/5fuszCI0aZK1HKjArzt
 zkZnmOhxl28c9La6E9XmySfBao2AS6Rhrs5GfstVDykXf+W9eBM8hCUaD0aNB7Q8T2ph
 N9NoW2oJ3KUMTfdU8RYbAGqWnITUg9lc80731P9WDTbHN9zgOIoXpuOOD/p8YBJm4mjZ
 q0dRepnak+JbGGjLH07agVErx2XfTKJ+cMkJL3QL6engNyTBVBw9SLK9AoR9MpCsFTS7
 H9UEXxAOjXn0J2TFfSVwW8r7fHvldPlsYOPNeRqiksZVuf6qQCjjoZnX64Exnbtw9RvY
 9NVg==
X-Gm-Message-State: AOJu0YykmMhJ7bDnKIrr2rnAigigRP8pXw2eZHirN/May7hPhi1TlSTI
 MDslqLby00TA0L9OOCeexAc=
X-Google-Smtp-Source: AGHT+IG0kxGuxfTRW/Nl+UJAK/1ZbpE/7RTPNUeq5fg7sPTCYg5oZhd9IHvBi+e7RwCAjrRgn/TCww==
X-Received: by 2002:a1f:fc8a:0:b0:48d:1b20:268e with SMTP id
 a132-20020a1ffc8a000000b0048d1b20268emr8683371vki.10.1699923872102; 
 Mon, 13 Nov 2023 17:04:32 -0800 (PST)
Received: from [192.168.2.14] ([76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 lw4-20020a05621457c400b0066d1540f9ecsm2482253qvb.77.2023.11.13.17.04.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Nov 2023 17:04:31 -0800 (PST)
Message-ID: <35c03405-4163-45de-b67e-77de08ed2d2a@gmail.com>
Date: Mon, 13 Nov 2023 20:04:22 -0500
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
 boundary="------------4w0nL8tGdMfPvEJvBzV0kuEp"
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
--------------4w0nL8tGdMfPvEJvBzV0kuEp
Content-Type: multipart/mixed; boundary="------------nbQoWIhiTvzfh0W1Ir8GtRdv";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>, Danilo Krummrich <dakr@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <35c03405-4163-45de-b67e-77de08ed2d2a@gmail.com>
Subject: Re: [PATCH] drm/sched: Define pr_fmt() for DRM using pr_*()
References: <20231110002659.113208-2-ltuikov89@gmail.com>
 <878r75wzm9.fsf@intel.com>
In-Reply-To: <878r75wzm9.fsf@intel.com>

--------------nbQoWIhiTvzfh0W1Ir8GtRdv
Content-Type: multipart/mixed; boundary="------------W0xH0G0puip0H2cbll4kvE3n"

--------------W0xH0G0puip0H2cbll4kvE3n
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Jani,

On 2023-11-10 07:40, Jani Nikula wrote:
> On Thu, 09 Nov 2023, Luben Tuikov <ltuikov89@gmail.com> wrote:
>> Define pr_fmt() as "[drm] " for DRM code using pr_*() facilities, espe=
cially
>> when no devices are available. This makes it easier to browse kernel l=
ogs.
>=20
> Please do not merge patches before people have actually had a chance to=

> look at them. This was merged *way* too quickly.
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

The revert has been pushed--thanks for R-B-ing it.

FWIW, I wanted a device-less DRM print, with a prefix "[drm] *ERROR* ",
because this is what we scan for, especially when we get a blank screen a=
t boot/modprobe.
There's a few cases in DRM where when we return -E... it's most likely a =
blank screen result,
as was the case with a recent debug I had with amdgpu when pushing the va=
riable sched->rq.

So then I went by this, in linux/printk.h:

/**
 * pr_fmt - used by the pr_*() macros to generate the printk format strin=
g
 * @fmt: format string passed from a pr_*() macro
 *
 * This macro can be used to generate a unified format string for pr_*()
 * macros. A common use is to prefix all pr_*() messages in a file with a=
 common
 * string. For example, defining this at the top of a source file:
 *
 *        #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 *
 * would prefix all pr_info, pr_emerg... messages in the file with the mo=
dule
 * name.
 */
#ifndef pr_fmt
#define pr_fmt(fmt) fmt
#endif

Any suggestions as to a device-less DRM print with prefix "[drm] *ERROR* =
"?
--=20
Regards,
Luben

--------------W0xH0G0puip0H2cbll4kvE3n
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

--------------W0xH0G0puip0H2cbll4kvE3n--

--------------nbQoWIhiTvzfh0W1Ir8GtRdv--

--------------4w0nL8tGdMfPvEJvBzV0kuEp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZVLHlwUDAAAAAAAKCRBMFUeUMaM0r6L2
AQCAqdkb6UxjJ45gkor14suubhEEgRLwI/Tj4TDYct9AkgEA7kJS8z1o050ITx7gzlLGkYx1WoV/
Tl9MHSHkimqUwgQ=
=w0+D
-----END PGP SIGNATURE-----

--------------4w0nL8tGdMfPvEJvBzV0kuEp--
