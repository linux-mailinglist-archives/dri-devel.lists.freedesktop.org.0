Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BC1991509
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2024 09:06:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68FA110E1AF;
	Sat,  5 Oct 2024 07:06:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FQxNQT8d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA1110E1AF;
 Sat,  5 Oct 2024 07:06:05 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5398e3f43f3so3463053e87.2; 
 Sat, 05 Oct 2024 00:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728111963; x=1728716763; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bYVrMrQSJwfYKCjPdcCYgt+chvzT8Uf5ftZ8FQgUQlc=;
 b=FQxNQT8d3ziGzaMKCw9Grn+LgpaJhGFevK5pko914Y+hkuPlO8tloIL3UgQ8DVd07E
 Y1GW5R75pPWnQWIrdtsEiferDLs/fNoHVfpWqiyxbqK8eL9ErQX7abzgFmS79Dv0AMPE
 8joRJq/SsGm3RqUg8TQzclkUicE+1D/x7M8mI/xtILJaSOCOq8zg/ebyWLBwIHviQHmB
 uuQQK+At0RsjP70QJtNr/6E0p2+UCL6fmbNTTiNhNdeCEY8/gauCA4PVHgqIQRvDDNRo
 wDM7YIsgZxJFrBfv7TiV1kxQqdm6gYZY7ipDWjZywzrdQvZ9jT3Acrtziu/3WEk6LGdF
 6G3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728111963; x=1728716763;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bYVrMrQSJwfYKCjPdcCYgt+chvzT8Uf5ftZ8FQgUQlc=;
 b=CGT7rsji2mkKDTOnKmeRh9WwlTRATvVF8bGLIsi9omGmw7Zutj7sLl1R7Nbxl8Rotj
 Y/6JA6lh6AmudAn1KnGBIAVMd57PbHqTRjru4fetOYxb0r/o4+VRRTQT8tKfWMVWatea
 hA1jLkTPoOy9gxEqRKvCx/S/919wDtQx23ar1b+fm7IECUOB1KGaz0Z7Q8Jw2ChFLpbH
 1mztjrzYAVqWMOIQxmSm6nzmKgQqplLzwwfxltztAHnN3DFZkeEGWcngTu+an6qnk7Fk
 9rHMUlSB5Ql4hUEKHPV5JVtql0nO7nW+IqXs7HcLBVcaaVuwYeohwDjXfiAzFzcsHYfc
 DyvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXENv6PYxt0xC7mHV29mUxliBKqIMIcRpqanKalzu6al4F5jELTjq2UhSIfeaOzwUoJWgHW6aSL@lists.freedesktop.org,
 AJvYcCXfQjB00F80tkWK+EhzI3pymsXEkpJqh85XQMMYu4fL4sHb35KKyhZcAn3aII+xjpmlXC95CK+92fHu@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywk0GpN8+sRRr5SNJ/KWh+dcoO32wyR4lCI3aGQePlDwZlsPXm2
 KdubtT2fT5e2GKB4mp6FY1AnOlBNyEw39TL4m6saydfODAKO/ry3m/Vqtkh1gVBbJHUvAPdAq3y
 FZN+JntSZlwPd1Mch71Oa8L7c9FA=
X-Google-Smtp-Source: AGHT+IF/SPb5q9d7Mi42mGpfn9y/A5HUxHESegg0s2/uE/R/lfVJVIWc3Bz0N41WkD4BgjxASggZkzFCnV8S5bjvk8g=
X-Received: by 2002:a05:6512:1090:b0:539:896e:46c9 with SMTP id
 2adb3069b0e04-539ab9e4b44mr3143607e87.45.1728111963147; Sat, 05 Oct 2024
 00:06:03 -0700 (PDT)
MIME-Version: 1.0
References: <20241004081618.27599-1-advaitdhamorikar@gmail.com>
 <00761132-75f3-41fd-b571-30b0cbe5565d@amd.com>
 <CADnq5_OKww1YZ1R_OytEMLcNVwdq=-ckc2gqQ+WMyOv6AZ9kqg@mail.gmail.com>
 <007679b9-b7b6-4385-9a2e-2be392cb5f58@amd.com>
In-Reply-To: <007679b9-b7b6-4385-9a2e-2be392cb5f58@amd.com>
From: Advait Dhamorikar <advaitdhamorikar@gmail.com>
Date: Sat, 5 Oct 2024 12:35:51 +0530
Message-ID: <CAJ7bepLv3Z9RwuxoBS3SfkMjeBkN1LRTjLEjT8Lv4Jdu-CXb6Q@mail.gmail.com>
Subject: Re: [PATCH-next] Fix unintentional integer overflow
To: "Sundararaju, Sathishkumar" <sasundar@amd.com>
Cc: Alex Deucher <alexdeucher@gmail.com>, alexander.deucher@amd.com, 
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com, 
 simona@ffwll.ch, leo.liu@amd.com, sathishkumar.sundararaju@amd.com, 
 saleemkhan.jamadar@amd.com, Veerabadhran.Gopalakrishnan@amd.com, 
 sonny.jiang@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 skhan@linuxfoundation.org, anupnewsmail@gmail.com, 
 "Lazar, Lijo" <lijo.lazar@amd.com>
Content-Type: text/plain; charset="UTF-8"
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

Hi Sathish,

> Please collate the changes together with Lijo's suggestion as well,
> "1ULL <<" instead of typecast, there are 3 occurrences of the error in
> f0b19b84d391.

I could only observe two instances of this error in f0b19b84d391 at:
'mask =3D (1 << (adev->jpeg.num_jpeg_inst * adev->jpeg.num_jpeg_rings)) - 1=
;`
and `mask |=3D 1 << ((i * adev->jpeg.num_jpeg_rings) + j);`

There are a few instances where we can use 1U instead of int as
harvest_config uses unsigned int
(adev->jpeg.harvest_config & (1 << i)
However I think they should be fixed in a separate patch?

Thanks and regards,
Advait

On Sat, 5 Oct 2024 at 09:05, Sundararaju, Sathishkumar <sasundar@amd.com> w=
rote:
>
>
>
> On 10/4/2024 11:30 PM, Alex Deucher wrote:
> > On Fri, Oct 4, 2024 at 5:15=E2=80=AFAM Sundararaju, Sathishkumar
> > <sasundar@amd.com> wrote:
> >>
> >> All occurrences of this error fix should have been together in a singl=
e patch both in _get and _set callbacks corresponding to f0b19b84d391, plea=
se avoid separate patch for each occurrence.
> >>
> >> Sorry Alex, I missed to note this yesterday.
> > I've dropped the patch.  Please pick it up once it's fixed up appropria=
tely.
> Thanks Alex.
>
> Hi Advait,
> Please collate the changes together with Lijo's suggestion as well,
> "1ULL <<" instead of typecast, there are 3 occurrences of the error in
> f0b19b84d391.
>
> Regards,
> Sathish
> >
> > Thanks,
> >
> > Alex
> >
> >>
> >> Regards,
> >> Sathish
> >>
> >>
> >> On 10/4/2024 1:46 PM, Advait Dhamorikar wrote:
> >>
> >> Fix shift-count-overflow when creating mask.
> >> The expression's value may not be what the
> >> programmer intended, because the expression is
> >> evaluated using a narrower integer type.
> >>
> >> Fixes: f0b19b84d391 ("drm/amdgpu: add amdgpu_jpeg_sched_mask debugfs")
> >> Signed-off-by: Advait Dhamorikar <advaitdhamorikar@gmail.com>
> >> ---
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_jpeg.c
> >> index 95e2796919fc..7df402c45f40 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> >> @@ -388,7 +388,7 @@ static int amdgpu_debugfs_jpeg_sched_mask_get(void=
 *data, u64 *val)
> >>    for (j =3D 0; j < adev->jpeg.num_jpeg_rings; ++j) {
> >>    ring =3D &adev->jpeg.inst[i].ring_dec[j];
> >>    if (ring->sched.ready)
> >> - mask |=3D 1 << ((i * adev->jpeg.num_jpeg_rings) + j);
> >> + mask |=3D (u64)1 << ((i * adev->jpeg.num_jpeg_rings) + j);
> >>    }
> >>    }
> >>    *val =3D mask;
>
