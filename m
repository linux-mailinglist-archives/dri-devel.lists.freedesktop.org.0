Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 441F2A96D4A
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 15:46:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 686DD10E5B3;
	Tue, 22 Apr 2025 13:46:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NAwpafNH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 119C210E5B1;
 Tue, 22 Apr 2025 13:46:13 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-308218fed40so547790a91.0; 
 Tue, 22 Apr 2025 06:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745329572; x=1745934372; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zKAXYEa6/VLh0NZkKTBiPYID8+vaPzcEPkeHsNwXQDg=;
 b=NAwpafNHvYTUe+7u6YsbUxSxBoGtyEDEUJ+JZIOQXURivOwIWAq+vtSs6299N7VcJX
 TfLu3C8UpKs6OIR3jUw5Y4Wt99dKzTpeygOHxhhE+hzoWyLQL64+88CspUEZrO1XWYZm
 BXPTh5H9At6NqdkYsES9We0N6AdcnJzUP8a30ceODpo24Ti6P67B9B+omwhFnJJfT7gT
 yL3RjvroeG0Y7tdXh3fF7Gkp3cZTiMwa/mU4TZRFcnQnEZf9+Le1qnR3uHOsCbFmFaIJ
 wHBrKgjMSIjV87h9ki5KWk787Umna5hqpx75XzscyQbxc6i+zVMohW1rLYLYtUFUiHSA
 am8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745329572; x=1745934372;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zKAXYEa6/VLh0NZkKTBiPYID8+vaPzcEPkeHsNwXQDg=;
 b=F8umQ6+cTI5XWgvxTBpazIZBFmYaa6JAg08GLPZYiOCF/A1Q6W8ojjSNgEV266UjG4
 H2lnKBr3eNVLMDbiRDDjAUan1BCYaUKKeF8glQSqNNJj3PhaVJgIGmDsYy0aNL5vCSNp
 ZMRcA9INcqg2OCFQqSJKkcHSwouy62mOKjpEy+POY63+jngaWJzequsVK+8Q9jOokXXF
 ArhZi+DZgJkzsYe2UdnLUH0hpLqj9iR8fOrJ4ZGDYKMDT2QdmyYt4YsqQ2b/zK0dBNG7
 k/OALla5ttpRs7k/bdnlr78QUsPsFcU8P5x9Vh94FCh+408lHyWWv0P9h1JGkdMjWo5z
 6JUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWemTwNLtvZ/X5la+en1dcffc4EPsws8xTclXlEPpvVsZvOhysCg0hyu97EXCu1o7MNuk1KyLaz@lists.freedesktop.org,
 AJvYcCXgZ+ZUh1MbOjyUjmeGXMMtvfLHtDgRv1P+9JE3qzvYESvRJlN3LIMsehuMvUNTFEONNRJqtq4g9EgH@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwILGl3zQNco+ynl0RTJsdrbR3Hqm+G5t6LDQ16XXnhnYvwRmZp
 AZtVbkdM9sSrphqoKK2YKKXpQIbithK1nStzX2Zp3kIfcks+icfaWiCOewVaRyPwPZSFW3A1OAB
 /JywkpoHnRW4YDLzJIQsjwOOnWovR8A==
X-Gm-Gg: ASbGncsljWwGByx4OTDmODeZivIdrDQd3FswjOLQbw5Qq7ZE+EFV2gQ8OOFVjsAUw59
 n0lHTjDAgD65vFWAbX0PL5CmSNg8We47YnhTSF2MHsCByUR+VjLaKdECF9jkVV2KkF4aaFxsFDW
 DMLatxvD1Ddc58rAcOojn4zp59LV41TzR1
X-Google-Smtp-Source: AGHT+IECnr/zJ2E6MF2usCsrGfyxjTBBW7hk5J/2Up1103fbS/c9RJz2TNwlZsPntlffsfti9rw7Z0c8MEnIm+0fhCM=
X-Received: by 2002:a17:90b:1c83:b0:2fe:a747:935a with SMTP id
 98e67ed59e1d1-3087bbc70efmr8381367a91.4.1745329572515; Tue, 22 Apr 2025
 06:46:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250418083129.9739-1-arefev@swemel.ru>
 <PH7PR12MB56852EECD78C11BD15157AF383BB2@PH7PR12MB5685.namprd12.prod.outlook.com>
In-Reply-To: <PH7PR12MB56852EECD78C11BD15157AF383BB2@PH7PR12MB5685.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 22 Apr 2025 09:46:00 -0400
X-Gm-Features: ATxdqUGU-CCMs4qZcsvRTip94orySY_8TgzWOPynOQ5mL61RjWPeZ4592c9uXKo
Message-ID: <CADnq5_NLEUZget2naQm9bYH1EsrvbhJCGd7yPN+=9Z_kKmUOCw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amdgpu: check a user-provided number of BOs in list
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Cc: Denis Arefev <arefev@swemel.ru>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Chunming Zhou <david1.zhou@amd.com>, 
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>, 
 "stable@vger.kernel.org" <stable@vger.kernel.org>
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

Applied.  Thanks!

On Tue, Apr 22, 2025 at 5:13=E2=80=AFAM Koenig, Christian
<Christian.Koenig@amd.com> wrote:
>
> [AMD Official Use Only - AMD Internal Distribution Only]
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> ________________________________________
> Von: Denis Arefev <arefev@swemel.ru>
> Gesendet: Freitag, 18. April 2025 10:31
> An: Deucher, Alexander
> Cc: Koenig, Christian; David Airlie; Simona Vetter; Andrey Grodzovsky; Ch=
unming Zhou; amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org=
; linux-kernel@vger.kernel.org; lvc-project@linuxtesting.org; stable@vger.k=
ernel.org
> Betreff: [PATCH v2] drm/amdgpu: check a user-provided number of BOs in li=
st
>
> The user can set any value to the variable =E2=80=98bo_number=E2=80=99, v=
ia the ioctl
> command DRM_IOCTL_AMDGPU_BO_LIST. This will affect the arithmetic
> expression =E2=80=98in->bo_number * in->bo_info_size=E2=80=99, which is p=
rone to
> overflow. Add a valid value check.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: 964d0fbf6301 ("drm/amdgpu: Allow to create BO lists in CS ioctl v3=
")
> Cc: stable@vger.kernel.org
> Signed-off-by: Denis Arefev <arefev@swemel.ru>
> ---
> V1 -> V2:
> Set a reasonable limit 'USHRT_MAX' for 'bo_number' it as Christian K=C3=
=B6nig <christian.koenig@amd.com> suggested
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_bo_list.c
> index 702f6610d024..85f7ee1e085d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> @@ -189,6 +189,9 @@ int amdgpu_bo_create_list_entry_array(struct drm_amdg=
pu_bo_list_in *in,
>         struct drm_amdgpu_bo_list_entry *info;
>         int r;
>
> +       if (!in->bo_number || in->bo_number > USHRT_MAX)
> +               return -EINVAL;
> +
>         info =3D kvmalloc_array(in->bo_number, info_size, GFP_KERNEL);
>         if (!info)
>                 return -ENOMEM;
> --
> 2.43.0
>
