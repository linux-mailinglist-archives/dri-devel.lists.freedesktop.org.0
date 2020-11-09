Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D742AD112
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 09:17:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F68489950;
	Tue, 10 Nov 2020 08:17:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF86C89533;
 Mon,  9 Nov 2020 20:58:47 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id 11so9361431qkd.5;
 Mon, 09 Nov 2020 12:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=PNsABCVYoCPDetYHIIupsnNsRPqLyLLm5si4RxJREXE=;
 b=iaV7WLTgTzI9YmJr4BBzTxMxtZlLL6MXMALe3dilAjJNlQNUPsA9CaDKfmd6eWk5Ga
 EAcvye2ivtlGCrCsXYnxWxpXNWmACQuSTooPyKCdyqaBqt5d3ieMDDV9hje3yZqK62aF
 3IDosrfdnRvePY7iv5c9w7CW1fmnJrj7PjF8uJQb2n4qaKvJGpNfpcNv5BwCmEKvog3J
 mdyC3TKRfo6Es1llEvnj2YaZgpTh2E+faCO1o4/jHD7F5YtH4NpvXmQU8EOhWpvz5ZoJ
 mqMToE+4l9eRa/hl/1c+V4PJdT1agJDfB0JdK3YE8RApHwyrZNuMOZo+Gv2Zz64zZEcG
 +QIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=PNsABCVYoCPDetYHIIupsnNsRPqLyLLm5si4RxJREXE=;
 b=eIa9qtZ+R1WPy3J0T4TxJYwd4fqAUp0BTzK9aMBYKLl1FGYxVZIJyjiApB7BMm+Onr
 KQAVBZeG6CtngLSNE4vIIITEoEVo2YC2Z196SF6DGNn/hZBkh3xPuaVIn5PhccmO8Mj0
 nwagBbkkrAnH6Iu287I87vyQsvWgTa02jLJ/zzKqvWyle733Fq9tqlIge+BRy/UKH1Tw
 By2NrU1bBVgtxwyzUYFn/L5aneJjqQMI60fC8+hec9R+4F5EFjpCvId5EYbCdBi4kaPk
 QwEORDmKDW8iWOw1l7uVYsc+JhfZGvbBIJCKFDPLSEShQ7LeP2IC5aqFD43XReWCa6KL
 8qLA==
X-Gm-Message-State: AOAM530ydDq/TyECD3nJmUmpEjKGQ2ZLwnrQDgAbVLJiHqA0+DYTL13f
 bK7HtetDldter1BVsA4RtDU=
X-Google-Smtp-Source: ABdhPJywD58KUKluA77+yINT3VRZUeImzgPzY8rj9+Pbpq2Ztsja9Sc0qQWoVkTqc9NFJ11MpWt0Nw==
X-Received: by 2002:a37:f503:: with SMTP id l3mr14408616qkk.160.1604955526983; 
 Mon, 09 Nov 2020 12:58:46 -0800 (PST)
Received: from Gentoo ([156.146.36.180])
 by smtp.gmail.com with ESMTPSA id z6sm6330488qti.88.2020.11.09.12.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 12:58:45 -0800 (PST)
Date: Tue, 10 Nov 2020 02:28:29 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drivers: amdgpu: amdgpu_display.c: Fix a spelling
 doens\'t to doesn\'t
Message-ID: <20201109205829.GA23144@Gentoo>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Alex Deucher <alexdeucher@gmail.com>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Huang Rui <ray.huang@amd.com>,
 "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>,
 Jean Delvare <jdelvare@suse.de>,
 Greg KH <gregkh@linuxfoundation.org>
References: <20201109083824.14664-1-unixbhaskar@gmail.com>
 <CADnq5_N3vCB4yBdwozt-04f5LLRVPk_SNm0s=z+u_Rf-C7S0gQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADnq5_N3vCB4yBdwozt-04f5LLRVPk_SNm0s=z+u_Rf-C7S0gQ@mail.gmail.com>
X-Mailman-Approved-At: Tue, 10 Nov 2020 08:16:57 +0000
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
Cc: Dave Airlie <airlied@linux.ie>, Greg KH <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Huang Rui <ray.huang@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Jean Delvare <jdelvare@suse.de>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1006227583=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1006227583==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Content-Disposition: inline


--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On 14:47 Mon 09 Nov 2020, Alex Deucher wrote:
>On Mon, Nov 9, 2020 at 3:52 AM Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:
>>
>> s/doens't/doesn't/p
>>
>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>> ---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>> index 7cc7af2a6822..a92cb137293a 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>> @@ -512,7 +512,7 @@ uint32_t amdgpu_display_supported_domains(struct amdgpu_device *adev,
>>          * to avoid hang caused by placement of scanout BO in GTT on certain
>>          * APUs. So force the BO placement to VRAM in case this architecture
>>          * will not allow USWC mappings.
>> -        * Also, don't allow GTT domain if the BO doens't have USWC falg set.
>> +        * Also, don't allow GTT domain if the BO doesn't have USWC falg set.
>
>Applied. Care to send a patch to also fix the spelling of "flag"?
>
>Thanks,
>
>Alex
>
Ah, good catch ..my bad ..should have move vigilant...another patch on the
way....
>
>>          */
>>         if ((bo_flags & AMDGPU_GEM_CREATE_CPU_GTT_USWC) &&
>>             amdgpu_bo_support_uswc(bo_flags) &&
>> --
>> 2.26.2
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl+prXUACgkQsjqdtxFL
KRXnkAf4jEp8zuZCylaeu6pPZfnm3AX1ERf/VBgvenPkyjzelEhUOD9ObxUdTJXL
1ZBLZKZVUoW4xOHa5CM4hyB0rvPki1JTK/+C8LlqQeBuP5gVkCekf5kN9z3zVg+u
JnAjWpGaNK0jFqpb+HQWRQHiq/2u5yHPkl9sBxJCzRKhGJtsvs/WQavtiaPprsxi
q+A7LVLxcpMAJ8DfaeYqvhfTzBAnSd8e0F8MyT2Vip2tXW2MaO8whFplgAfScgxg
ZCaf3mmLW/VgUbxSyDTyJmECGi+sQ/2M5eWG3jeVRpg2Hh7+qxgz94WHZYT2jDCP
AF7kXu7A3mX3zcvolt/HhEhVY0ZG
=dl4/
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--

--===============1006227583==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1006227583==--
