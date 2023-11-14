Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A39777EBA51
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 00:57:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C05F10E055;
	Tue, 14 Nov 2023 23:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A142610E055
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 23:57:32 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id
 6a1803df08f44-672096e0e89so36177846d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 15:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700006251; x=1700611051; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Q1lo2VGpSEzTB2K+lom0QwCPqOecbyHdpUxLJmRWmRE=;
 b=BgU0JmT8DmQNObN0YhFvBfIprOWpqRw+RjnjKkW46PcinMcpLOrgaCeavti9BZzwff
 MeExUK1BB85mQ91aAEDYmnPS73vbbsR7yI5asPXf4B4OeV8HehEDo4PPzQex2CJEhApz
 0R/ia0TGCqBnShAuTmZk1YOIscHSlnl4przbqg2rBRQadpAYA6w6iVzMtc6kgYyCJCZI
 5EUfeINsoi7JKn0xKfVpyXX+JiU7bwCWs8K9soUCrRxzU0zqQ4hI2J2N8y3ZNypT4w32
 euFv226z8HS9kFvcID4TJmr7N+oAQeXRizSBEXNb/rgx087RK+0tmPk8xkYLQYj0ep/n
 oUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700006251; x=1700611051;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q1lo2VGpSEzTB2K+lom0QwCPqOecbyHdpUxLJmRWmRE=;
 b=iokYFJATIJO39r1RVnl2LlycqkS0tQitiNvCxc6NJJe9PqHr/0DvuoDFk9gh3j1u5j
 gYk4xTv1CwGbuD5PtUbtbRqScDvpJZlErXCWFDFQ2VS7eGxyZSD9cySePgn1p54teu74
 rsR85CsXkI1CxJBRWrnqU2M8tH53YRq0z0llQLI3tgz5SBZICqbMI51znEqIT6ZnNfHZ
 873WlM0+R5EjMoOorYLCJOpkxcu94xeDp9aWe5yeaP/oK5KOTopZxsR9wgsYP71jtqWW
 pmu0TQiSeoWOHu/idkKE8/fZKfNX9V7xDpLSQmjKNIZ8TrTYgZdS8bSwGGGNL8x+OjnB
 m/bQ==
X-Gm-Message-State: AOJu0YwPmR82SXeNZVDxODxte6+nE56p7gKDYCRbTfX2xLIyjTe3knM1
 ahupxuhQNlFag1ugg/dC7PHpT1prv1Aa3FP+2Uc=
X-Google-Smtp-Source: AGHT+IGxwBztN9i3cWFmVfL6eimeJRnjh0rkiAof70bcNQpr4dP64Gq/oTx97bCLHh7lUlEoXQjoAQ==
X-Received: by 2002:ad4:4c43:0:b0:672:7fe3:7aae with SMTP id
 cs3-20020ad44c43000000b006727fe37aaemr4040187qvb.56.1700006251482; 
 Tue, 14 Nov 2023 15:57:31 -0800 (PST)
Received: from [192.168.2.14] ([76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 u1-20020a0cc481000000b006714f8b5512sm68098qvi.6.2023.11.14.15.57.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Nov 2023 15:57:30 -0800 (PST)
Message-ID: <fcec4d24-41d6-4897-bc2a-9ea7d3b4afd5@gmail.com>
Date: Tue, 14 Nov 2023 18:57:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.4.2
Subject: Re: [PATCH] drm/sched: Define pr_fmt() for DRM using pr_*()
Content-Language: en-CA, en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>, Danilo Krummrich <dakr@redhat.com>
References: <20231110002659.113208-2-ltuikov89@gmail.com>
 <878r75wzm9.fsf@intel.com> <35c03405-4163-45de-b67e-77de08ed2d2a@gmail.com>
 <87h6losf0p.fsf@intel.com>
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
In-Reply-To: <87h6losf0p.fsf@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OHLxDv14nXhdHdhpoSbyHySs"
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
--------------OHLxDv14nXhdHdhpoSbyHySs
Content-Type: multipart/mixed; boundary="------------0HJt7Fs1jMSnFN6GTcQsB4k8";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>, Danilo Krummrich <dakr@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <fcec4d24-41d6-4897-bc2a-9ea7d3b4afd5@gmail.com>
Subject: Re: [PATCH] drm/sched: Define pr_fmt() for DRM using pr_*()
References: <20231110002659.113208-2-ltuikov89@gmail.com>
 <878r75wzm9.fsf@intel.com> <35c03405-4163-45de-b67e-77de08ed2d2a@gmail.com>
 <87h6losf0p.fsf@intel.com>
In-Reply-To: <87h6losf0p.fsf@intel.com>

--------------0HJt7Fs1jMSnFN6GTcQsB4k8
Content-Type: multipart/mixed; boundary="------------96lJE1XaiMTMFReXHCJ9LwMJ"

--------------96lJE1XaiMTMFReXHCJ9LwMJ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-11-14 07:20, Jani Nikula wrote:
> On Mon, 13 Nov 2023, Luben Tuikov <ltuikov89@gmail.com> wrote:
>> Hi Jani,
>>
>> On 2023-11-10 07:40, Jani Nikula wrote:
>>> On Thu, 09 Nov 2023, Luben Tuikov <ltuikov89@gmail.com> wrote:
>>>> Define pr_fmt() as "[drm] " for DRM code using pr_*() facilities, es=
pecially
>>>> when no devices are available. This makes it easier to browse kernel=
 logs.
>>>
>>> Please do not merge patches before people have actually had a chance =
to
>>> look at them. This was merged *way* too quickly.
>>>
>>> This does not do what you think it does, and it's not robust enough.
>>>
>>> The drm_print.[ch] facilities use very few pr_*() calls directly. The=

>>> users of pr_*() calls do not necessarily include <drm/drm_print.h> at=

>>> all, and really don't have to.
>>>
>>> Even the ones that do include it, usually have <linux/...> includes
>>> first, and <drm/...> includes next. Notably, <linux/kernel.h> include=
s
>>> <linux/printk.h>.
>>>
>>> And, of course, <linux/printk.h> defines pr_fmt() itself if not alrea=
dy
>>> defined.
>>>
>>>> Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
>>>> ---
>>>>  include/drm/drm_print.h | 14 ++++++++++++++
>>>>  1 file changed, 14 insertions(+)
>>>>
>>>> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
>>>> index a93a387f8a1a15..e8fe60d0eb8783 100644
>>>> --- a/include/drm/drm_print.h
>>>> +++ b/include/drm/drm_print.h
>>>> @@ -26,6 +26,20 @@
>>>>  #ifndef DRM_PRINT_H_
>>>>  #define DRM_PRINT_H_
>>>> =20
>>>> +/* Define this before including linux/printk.h, so that the format
>>>> + * string in pr_*() macros is correctly set for DRM. If a file want=
s
>>>> + * to define this to something else, it should do so before includi=
ng
>>>> + * this header file.
>>>
>>> The only way this would work is by including <drm/drm_print.h> as the=

>>> very first header, and that's fragile at best.
>>>
>>>> + *
>>>> + * It is encouraged code using pr_err() to prefix their format with=

>>>> + * the string "*ERROR* ", to make it easier to scan kernel logs. Fo=
r
>>>> + * instance,
>>>> + *   pr_err("*ERROR* <the rest of your format string here>", args).=

>>>
>>> No, it's encouraged not to use pr_*() at all, and prefer drm device
>>> based logging, or device based logging.
>>>
>>> I'd rather this whole thing was just reverted.
>>
>> The revert has been pushed--thanks for R-B-ing it.
>>
>> FWIW, I wanted a device-less DRM print, with a prefix "[drm] *ERROR* "=
,
>> because this is what we scan for, especially when we get a blank scree=
n at boot/modprobe.
>> There's a few cases in DRM where when we return -E... it's most likely=
 a blank screen result,
>> as was the case with a recent debug I had with amdgpu when pushing the=
 variable sched->rq.
>>
>> So then I went by this, in linux/printk.h:
>>
>> /**
>>  * pr_fmt - used by the pr_*() macros to generate the printk format st=
ring
>>  * @fmt: format string passed from a pr_*() macro
>>  *
>>  * This macro can be used to generate a unified format string for pr_*=
()
>>  * macros. A common use is to prefix all pr_*() messages in a file wit=
h a common
>>  * string. For example, defining this at the top of a source file:
>>  *
>>  *        #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>>  *
>>  * would prefix all pr_info, pr_emerg... messages in the file with the=
 module
>>  * name.
>>  */
>> #ifndef pr_fmt
>> #define pr_fmt(fmt) fmt
>> #endif
>>
>> Any suggestions as to a device-less DRM print with prefix "[drm] *ERRO=
R* "?
>=20
> I don't think there's a way to do that using pr_fmt for an entire drive=
r
> or subsystem. That really only works for individual compilation units.
>=20
> We have DRM_ERROR() which does the trick, but the documentation says
> it's been deprecated in favor pr_err()... though I think drm_err()
> should be preferred over pr_err() where possible.

Yes, that's what made me use pr_err() and the pr_fmt() modification...

>=20
> Maybe we should extend 7911902129a8 ("drm/print: Handle potentially NUL=
L
> drm_devices in drm_dbg_*") to __drm_printk() and handle NULL drm device=

> gracefully.

Yeah, that actually would work.

>=20
> With just "(drm) ? (drm)->dev : NULL" the output will have "(NULL devic=
e
> *)" which works but is a bit meh, but maybe something like this is
> possible (untested):

So, I don't mind the ternary op, really. So long as we get the "*ERROR* "=
,
on drm_err(), because it really helps us debug when we get a blank screen=
=2E :-)

> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index a93a387f8a1a..d16affece5b7 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -452,9 +452,13 @@ void __drm_dev_dbg(struct _ddebug *desc, const str=
uct device *dev,
>   */
> =20
>  /* Helper for struct drm_device based logging. */
> -#define __drm_printk(drm, level, type, fmt, ...)			\
> -	dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
> -
> +#define __drm_printk(drm, level, type, fmt, ...) \
> +	do {								\
> +		if (drm)						\
> +			dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__); \
> +		else							\
> +			pr_##level##type("[drm] " fmt, ##__VA_ARGS__);	\
> +	} while (0)
> =20
>  #define drm_info(drm, fmt, ...)					\
>  	__drm_printk((drm), info,, fmt, ##__VA_ARGS__)
>=20
>=20
> Then again that adds quite a bit of overhead all over the place unless
> the compiler can be 100% it's one or the other.

True.

How about extending the commit mentioned above to something like this,

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index a93a387f8a1a15..ce784118e4f762 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -453,7 +453,7 @@ void __drm_dev_dbg(struct _ddebug *desc, const struct=
 device *dev,
=20
 /* Helper for struct drm_device based logging. */
 #define __drm_printk(drm, level, type, fmt, ...)                       \=

-       dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
+       dev_##level##type(drm ? (drm)->dev : NULL, "[drm] " fmt, ##__VA_A=
RGS__)

The output would be similar to that if drm->dev were NULL.
--=20
Regards,
Luben

--------------96lJE1XaiMTMFReXHCJ9LwMJ
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

--------------96lJE1XaiMTMFReXHCJ9LwMJ--

--------------0HJt7Fs1jMSnFN6GTcQsB4k8--

--------------OHLxDv14nXhdHdhpoSbyHySs
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZVQJYQUDAAAAAAAKCRBMFUeUMaM0r9XS
AP9EJNDQTzghlv0GmTN8nTj8MNnynsfvJnY6nbRB41Dk1AD9GWolDDWvJvywYNFVl6w1T3rYAzQA
jxetreVoLw1wGgg=
=EQVw
-----END PGP SIGNATURE-----

--------------OHLxDv14nXhdHdhpoSbyHySs--
