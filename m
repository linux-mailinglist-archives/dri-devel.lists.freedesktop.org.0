Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E93990A87
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 20:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C1510EA56;
	Fri,  4 Oct 2024 18:00:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m5t5WoXJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44AA10EA55;
 Fri,  4 Oct 2024 18:00:26 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-7e9f6f5e7f4so24972a12.0; 
 Fri, 04 Oct 2024 11:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728064826; x=1728669626; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RKWT3sDU4NtrrluAI0QmU3x+uhGBRrICw49xVu95Gg0=;
 b=m5t5WoXJvbnhntiiLezarT7yxBo4+M1Q6Q60SeHz3bpEWvfQIBoIv9/fKlChTSGuAh
 0xwrEaWtOeebJtbQrtXQ3sQFGdhXcrwTDCYfmfjX1zKWeco2YBN2tQ4xEcWFhqLHtG4o
 cd9PuabcmDYkLYQpCEVWnQS5X+WHrhVnKRfK8MJK863MkbH9Gu08QL9PczjJjMJpARhB
 Ht+TxZXiCLLSENGF6vaBnuJfBV3eBNoScENdIwt5LLZXZ3VEC/D7IbmXvxunPMm+39xH
 4MA4G2h9Ktuy5K7C6mU0DAz0ulTi6hFTGfF0GTpPKQQx/7aoZKTfIQj6BqDuDYhLTope
 SQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728064826; x=1728669626;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RKWT3sDU4NtrrluAI0QmU3x+uhGBRrICw49xVu95Gg0=;
 b=BPceZdnCFdgDc3rkc2ixNvvnMr5ESRNmtUWW49esxrLZlt8s+T8U+YH7jBAR1I90rg
 mdbneEWLGPWBtx6rOpyUpaPj97ahlQVWOb2TyFdi0iSJAMEwvQV7E8Xrbp4E3dxYO5w6
 z4JUvmT1ktaLOpl8bIadyvTDxI2/XaSz0kjfiGinj1N0qKT5ADQjdeFC+zhZRIh2AGwG
 mdKLaoxlKojIAXkVLxjnahurDJUc1OJHyQq2X3l6PmyN8Mm1CEfZGlDdH8Yw3sYDoud4
 ILyam7G0jW0guFrIQsQ7PgerK8cobSSjlp7HxYFXQC/LqIR6IsAH1Dx8dMS7FEQwr+wQ
 4TWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKtX3fwOnOviFZe8xijyWv0k13W75uOm/IXrE/skYK663ajBDAueMBkdhej3kcJw/44q/W0LxY@lists.freedesktop.org,
 AJvYcCWs0gTrBCeLTuT1GTh8dErfQvwCk13BTY3ExFodnZNysQ0UFSUb6XTfVI/q5juanTjsIKN94ZIfqXMI@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwED4/kPN3uiDjztWQfj9kCnXgc6K/LQVuj3zjaXrJfIJptdGni
 qsjl7gNOcS1ImmdLteRxFS/BBxbSwmWSMgyWp8/efxyEweieNDiXrcdyEyvo2+37VQQzJC+BSW5
 qRoBS+/ZMeQ4RuDQ5Bb1DlrpF8qs=
X-Google-Smtp-Source: AGHT+IGNe3YVRFKhWrgUI99fM++c+XkooDEtmM3ozfZ5VLPvyPYojqK0jLsnzBStdbGNJy4bDlX3c3UeSSmtiOAwF1I=
X-Received: by 2002:a17:90a:3dc5:b0:2d8:9f4e:1c3d with SMTP id
 98e67ed59e1d1-2e1e63237e8mr1635577a91.5.1728064826219; Fri, 04 Oct 2024
 11:00:26 -0700 (PDT)
MIME-Version: 1.0
References: <20241004081618.27599-1-advaitdhamorikar@gmail.com>
 <00761132-75f3-41fd-b571-30b0cbe5565d@amd.com>
In-Reply-To: <00761132-75f3-41fd-b571-30b0cbe5565d@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 4 Oct 2024 14:00:14 -0400
Message-ID: <CADnq5_OKww1YZ1R_OytEMLcNVwdq=-ckc2gqQ+WMyOv6AZ9kqg@mail.gmail.com>
Subject: Re: [PATCH-next] Fix unintentional integer overflow
To: "Sundararaju, Sathishkumar" <sasundar@amd.com>
Cc: Advait Dhamorikar <advaitdhamorikar@gmail.com>, alexander.deucher@amd.com, 
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com, 
 simona@ffwll.ch, leo.liu@amd.com, sathishkumar.sundararaju@amd.com, 
 saleemkhan.jamadar@amd.com, Veerabadhran.Gopalakrishnan@amd.com, 
 sonny.jiang@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 skhan@linuxfoundation.org, anupnewsmail@gmail.com
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

On Fri, Oct 4, 2024 at 5:15=E2=80=AFAM Sundararaju, Sathishkumar
<sasundar@amd.com> wrote:
>
>
> All occurrences of this error fix should have been together in a single p=
atch both in _get and _set callbacks corresponding to f0b19b84d391, please =
avoid separate patch for each occurrence.
>
> Sorry Alex, I missed to note this yesterday.

I've dropped the patch.  Please pick it up once it's fixed up appropriately=
.

Thanks,

Alex

>
>
> Regards,
> Sathish
>
>
> On 10/4/2024 1:46 PM, Advait Dhamorikar wrote:
>
> Fix shift-count-overflow when creating mask.
> The expression's value may not be what the
> programmer intended, because the expression is
> evaluated using a narrower integer type.
>
> Fixes: f0b19b84d391 ("drm/amdgpu: add amdgpu_jpeg_sched_mask debugfs")
> Signed-off-by: Advait Dhamorikar <advaitdhamorikar@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_jpeg.c
> index 95e2796919fc..7df402c45f40 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> @@ -388,7 +388,7 @@ static int amdgpu_debugfs_jpeg_sched_mask_get(void *d=
ata, u64 *val)
>   for (j =3D 0; j < adev->jpeg.num_jpeg_rings; ++j) {
>   ring =3D &adev->jpeg.inst[i].ring_dec[j];
>   if (ring->sched.ready)
> - mask |=3D 1 << ((i * adev->jpeg.num_jpeg_rings) + j);
> + mask |=3D (u64)1 << ((i * adev->jpeg.num_jpeg_rings) + j);
>   }
>   }
>   *val =3D mask;
