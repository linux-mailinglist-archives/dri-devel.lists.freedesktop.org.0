Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA977FA435
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 16:14:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 381B910E2C7;
	Mon, 27 Nov 2023 15:14:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5570F10E2BF;
 Mon, 27 Nov 2023 15:14:43 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-77d631aab99so229350385a.2; 
 Mon, 27 Nov 2023 07:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701098082; x=1701702882; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=O878JpoRHxeRwNhXeIv1tIn5S4Ozam1aEyPWG/9lcJw=;
 b=W2GzW+t5y+KD7VQlptOTH4FRooEDlekzgzsI0AE0OnxL8kZZjxOfukM/K4pWaByOXz
 D2WeXqADG8Psalvt95mRj1meIffpSE64ToqojUnfGCaUa91GQiLlKC+8GMjWjuy7GFkt
 cJFKrMZKTCwRNstitFKik2LGcanMOuLRAZmJ9nygXaZ6lC9elJ7wIs0W1jQO7mS/hyJ3
 f8vReklh12UuQ2ANiGsvTBUYZLpo1xDpMFvJQwt7PFYaGmV9332OZG8IO3JQnFfNuSvN
 w0rO2Tgw3NWB2mTWJ/b8+bV1azOUOMtnZveSwPdNgxlu/N9HqdPNFSciF2nNpZImR4Zl
 wsqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701098082; x=1701702882;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O878JpoRHxeRwNhXeIv1tIn5S4Ozam1aEyPWG/9lcJw=;
 b=GNP/q5ByJv70+/akcjLDdRLzTgBHhq4Ru55zsJVJponNFQHaM1wDF2Bah1Iy5agith
 CInmIeGT2h0eipXlGziQc5Ev86DuH/SuxFKg3+1oYg9fiLNQbSLu3+Q22NsA141tMi7H
 p7guw6sehNnG/StB6UXJVslTmHrdKEx0FLInIW2G5mY+FcCs9UEvvKv3N0KUbnbwRI7/
 uMC8p8IYpT+iHcWFb39kwhYBoatLUHWdKNjCUFqRnti9BZlhYyWML8afS/AlGWOfn+N2
 T7y9/yJcgej8HdM5CJGjC3BoptnXyWyGLHheLSXTY5mXanGCkpt7ZY6pLnj33vfTZuoh
 AsdA==
X-Gm-Message-State: AOJu0YyBLjnnfl0SAIyHF4D9xREf9/wQ3cRPE3wouwjooeYYRIqPvcZs
 rivDjMnxOtnBTku4TqPfORQ=
X-Google-Smtp-Source: AGHT+IECrvEs9JmQw9eETtf30jFCJS5oQcK+/ZA8utEVwDzSmKxMrbB/8o7ccSUYW0LLbjGOuZZAyw==
X-Received: by 2002:a05:620a:3d10:b0:778:b029:100c with SMTP id
 tq16-20020a05620a3d1000b00778b029100cmr11213254qkn.66.1701098082326; 
 Mon, 27 Nov 2023 07:14:42 -0800 (PST)
Received: from [192.168.2.14]
 (bras-base-toroon0964w-grc-76-76-65-20-140.dsl.bell.ca. [76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a05620a260400b0077d84f46d65sm2684245qko.37.2023.11.27.07.14.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Nov 2023 07:14:41 -0800 (PST)
Message-ID: <a210a487-77bf-469a-a4de-b4ebd15bbd5b@gmail.com>
Date: Mon, 27 Nov 2023 10:14:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.5.0
Subject: Re: [PATCH] Revert "drm/sched: Qualify drm_sched_wakeup() by
 drm_sched_entity_is_ready()"
Content-Language: en-CA, en-US
To: Bert Karwatzki <spasswolf@web.de>
References: <6273fadf-267a-4965-82ab-89c5b3f28cf2@gmail.com>
 <20231127133015.104165-1-spasswolf@web.de>
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
In-Reply-To: <20231127133015.104165-1-spasswolf@web.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zx3uNX1Z4mxQyNHHEEHLWJqW"
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
Cc: matthew.brost@intel.com, robdclark@chromium.org, sarah.walker@imgtec.com,
 tvrtko.ursulin@linux.intel.com, ketil.johnsen@arm.com, lina@asahilina.net,
 mcanal@igalia.com, Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, boris.brezillon@collabora.com, dakr@redhat.com,
 donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------zx3uNX1Z4mxQyNHHEEHLWJqW
Content-Type: multipart/mixed; boundary="------------nLBwBxTGqHZVB5RNeF06VmU6";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Bert Karwatzki <spasswolf@web.de>
Cc: Liviu.Dudau@arm.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, dakr@redhat.com, donald.robson@imgtec.com,
 dri-devel@lists.freedesktop.org, faith.ekstrand@collabora.com,
 intel-xe@lists.freedesktop.org, ketil.johnsen@arm.com, lina@asahilina.net,
 matthew.brost@intel.com, mcanal@igalia.com, robdclark@chromium.org,
 sarah.walker@imgtec.com, tvrtko.ursulin@linux.intel.com
Message-ID: <a210a487-77bf-469a-a4de-b4ebd15bbd5b@gmail.com>
Subject: Re: [PATCH] Revert "drm/sched: Qualify drm_sched_wakeup() by
 drm_sched_entity_is_ready()"
References: <6273fadf-267a-4965-82ab-89c5b3f28cf2@gmail.com>
 <20231127133015.104165-1-spasswolf@web.de>
In-Reply-To: <20231127133015.104165-1-spasswolf@web.de>

--------------nLBwBxTGqHZVB5RNeF06VmU6
Content-Type: multipart/mixed; boundary="------------ePZjEnhYDcZhkq5gy0KA0StK"

--------------ePZjEnhYDcZhkq5gy0KA0StK
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Bert,

# The title of the patch should be:

drm/sched: Partial revert of "Qualify drm_sched_wakeup() by drm_sched_ent=
ity_is_ready()"

On 2023-11-27 08:30, Bert Karwatzki wrote:
> Commit f3123c25 (in combination with the use of work queues by the gpu

Commit f3123c2590005c, in combination with the use of work queues by the =
GPU
scheduler, leads to random lock-ups of the GUI.

> scheduler) leads to random lock ups of the GUI [1,2].
>=20
> This is not a complete revert of commit f3123c25 as drm_sched_wakeup

This is a partial revert of of commit f3123c2590005c since drm_sched_wake=
up()

> still needs its entity argument to pass it to drm_sched_can_queue.

=2E.. drm_sched_can_queue().

# Don't forget a SoB line!

Signed-off-by: Bert ...

>> [1] https://gitlab.freedesktop.org/drm/amd/-/issues/2994

# Use a Link: tag instead, like this:
Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2994

> [2] https://lists.freedesktop.org/archives/dri-devel/2023-November/4316=
06.html

# Use a Link: tag instead, like this:
Link: https://lists.freedesktop.org/archives/dri-devel/2023-November/4316=
06.html

>=20
> This reverts commit f3123c2590005c5ff631653d31428e40cd10c618.

# The line above is *not* necessary, since this is a partial commit. Inst=
ead we need
# a Fixes: line, like this:

Fixes: f3123c2590005c ("drm/sched: Qualify drm_sched_wakeup() by drm_sche=
d_entity_is_ready()")

#######---

Then after you do "git format-patch", post it like this:

git send-email \
    --in-reply-to=3Dc5292d06-2e37-4715-96dc-699f369111fa@gmail.com \
    --to=3Dltuikov89@gmail.com \
    --cc=3Dchristian.koenig@amd.com \
    --cc=3Ddakr@redhat.com \
    --cc=3Ddri-devel@lists.freedesktop.org \
    --cc=3Dmatthew.brost@intel.com \
    --cc=3Dspasswolf@web.de \
    --cc=3Dtvrtko.ursulin@intel.com \
    /path/to/PATCH

This follows your thread where all the information is stored.

Thanks!
--=20
Regards,
Luben

--------------ePZjEnhYDcZhkq5gy0KA0StK
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

--------------ePZjEnhYDcZhkq5gy0KA0StK--

--------------nLBwBxTGqHZVB5RNeF06VmU6--

--------------zx3uNX1Z4mxQyNHHEEHLWJqW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZWSyYAUDAAAAAAAKCRBMFUeUMaM0r8qt
AP9VaL0mVYM02IAGJfquuJvVCHcJfM/LoqaHqXOyLHJ+dwEA5fa4R0vTR6Wi0vvfW4eDjG4YhpkO
NGD/A7tLs+JH8wc=
=kvjX
-----END PGP SIGNATURE-----

--------------zx3uNX1Z4mxQyNHHEEHLWJqW--
