Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD820907F41
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 01:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87DD610E02A;
	Thu, 13 Jun 2024 23:12:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="AwnqxlJJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 320 seconds by postgrey-1.36 at gabe;
 Thu, 13 Jun 2024 23:12:30 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471D910E02A;
 Thu, 13 Jun 2024 23:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1718320348; x=1718925148; i=w_armin@gmx.de;
 bh=juoPd/6jKYp/yJ2p2QijR/8Aum3Igi5t+8Igz/AZfmI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=AwnqxlJJ89soTkFgO8VzYK9Wt5yW0ssA79PDbKZjhL+b6iZE1T38bpgvFugnj7li
 8ObUkHr9XQxjSiaXTwxNJqoH3nnIhxDqaIoufVa0Z+BTnM1HktL/TjvdGr/nuR3ws
 sjJdszvREDuLbCQ612cux0WeNHikzlOx3AuCIcluF/hIm9Cc29tFGuWVQRPsozVtP
 n0xjhyW+NcTjG1Mcd49r/pPWRodDh6gKJ0vgmagnDrdBFu/xRB3+jErf9umisN19z
 TjBqmvvUDcSOtE4W/mISlely8Lu17qFGRnac/64zqxZjGUMhzPRkCpclNtzf1xYL3
 6b4s5Oakr0ELuqty5A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6sn1-1sTB7n0VlX-015A7F; Fri, 14
 Jun 2024 01:07:04 +0200
Message-ID: <6f08d226-da23-4633-a562-3d5ab53f7e42@gmx.de>
Date: Fri, 14 Jun 2024 01:07:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Patch "Revert "drm/amdgpu: init iommu after amdkfd device init""
 has been added to the 5.15-stable tree
To: gregkh@linuxfoundation.org, Prike.Liang@amd.com, Xinhui.Pan@amd.com,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org, bkauler@gmail.com,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 sashal@kernel.org, yifan1.zhang@amd.com
Cc: stable-commits@vger.kernel.org
References: <2024061239-rehydrate-flyable-343e@gregkh>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <2024061239-rehydrate-flyable-343e@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zMaco9iewpE4zM+dt6BwutPJJkrVJs55lZY3om1O/bvuDckdDBl
 KmmpQ2i54giYMPjvH4y6XVHod812HHrP77wWyjk/Q/rluORgPbAlZooig+BXd4PnY66Ug/q
 hcElXlYJ9JP2mVsgC4aighU4p/rg3shWNsiGWspc5sbD2QTgK9dfQ0UMvY4t+hfQPvkBXba
 3dCdSAXafyDvKPi/pnZQA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5YTQ3bE2RBk=;BoRcY+gypO+tpju/SmjId8uEeuL
 JIWEmcPdtuUOFyds84if9n3b4Juf5/dU4ZC5fRXJGVu1afPbQqf4wPMHFuET1NWSEssnEMpr9
 lZTS7oQV4YwRgLqKyxFRoWVWqooSi+M1+3H3Nr/TO5p6rihH9SUpBNa24KLeqwYImGYbeBTco
 mDzWk7phoYoqGIBM+06ozMKdglW/Z6ZOLdUM7ZdB1yO085rtgGkBVHAu2W754OvhtW1wyNdeU
 BqLztRl0zBGEm8qYVS4lD0lp7TPpWIe0fAi2IdUgleZMC127bGSQB6s9sif9uzoY/8GXIT9Ab
 WUkoVfsP1clW46Z3UdwIdLoch0SRMZRrhRTTgC0a6FpBqe03LqXzS26RyjEsEdxRHBZEfRTq1
 lM0XS9Ao0B4IKPw67Z+UuggpzM7Kae/GCjqhobXhAd9Juw02DTjhV1jYCCsjnnPmG/yBQ4flN
 AHiVVItJmBHPROcIMtjFkulqJlYTyr1jbAOQLg7ck0mqOGP6P6OYcHuAVuLPy/NbODG/GeHFF
 /dY60hv6K8VEJwDohbW4X2LCLzP+FzqN9G9vJYQLJGW2RNd4E0JGy666eLp8UTsu+QGZL4ubG
 jDLQA+Rb8ZDbT0Zbr3qdO3SbCCQWRaWVDRt22spj/kzWGcYY+w2svvkL+rTkKrysInlXVWF6q
 NC3Gs3ZEkUabZJQeRhFn3cJK1moriS7wPRf05yD5785eKQL6dzPodmsoXe4nxNDx0IhCEb7ff
 iO2oqHIUbJJX/ndfS+MfGow6MxuOrlyKuQxm2q6gkCb9c2SZUlyTqPJElMeQgzQ4l0vTbYGsY
 Xz01AfNN/IJavQMvtDh6N+7mekr7laOsksR+v1GSyd3vI=
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

Am 12.06.24 um 14:45 schrieb gregkh@linuxfoundation.org:

> This is a note to let you know that I've just added the patch titled
>
>      Revert "drm/amdgpu: init iommu after amdkfd device init"
>
> to the 5.15-stable tree which can be found at:
>      http://www.kernel.org/git/?p=3Dlinux/kernel/git/stable/stable-queue=
.git;a=3Dsummary
>
> The filename of the patch is:
>       revert-drm-amdgpu-init-iommu-after-amdkfd-device-init.patch
> and it can be found in the queue-5.15 subdirectory.

Thank you :)

>
> If you, or anyone else, feels it should not be added to the stable tree,
> please let <stable@vger.kernel.org> know about it.
>
>
>  From W_Armin@gmx.de  Wed Jun 12 14:43:21 2024
> From: Armin Wolf <W_Armin@gmx.de>
> Date: Thu, 23 May 2024 19:30:31 +0200
> Subject: Revert "drm/amdgpu: init iommu after amdkfd device init"
> To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.=
com, gregkh@linuxfoundation.org, sashal@kernel.org
> Cc: stable@vger.kernel.org, bkauler@gmail.com, yifan1.zhang@amd.com, Pri=
ke.Liang@amd.com, dri-devel@lists.freedesktop.org, amd-gfx@lists.freedeskt=
op.org
> Message-ID: <20240523173031.4212-1-W_Armin@gmx.de>
>
> From: Armin Wolf <W_Armin@gmx.de>
>
> This reverts commit 56b522f4668167096a50c39446d6263c96219f5f.
>
> A user reported that this commit breaks the integrated gpu of his
> notebook, causing a black screen. He was able to bisect the problematic
> commit and verified that by reverting it the notebook works again.
> He also confirmed that kernel 6.8.1 also works on his device, so the
> upstream commit itself seems to be ok.
>
> An amdgpu developer (Alex Deucher) confirmed that this patch should
> have never been ported to 5.15 in the first place, so revert this
> commit from the 5.15 stable series.
>
> Reported-by: Barry Kauler <bkauler@gmail.com>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> Link: https://lore.kernel.org/r/20240523173031.4212-1-W_Armin@gmx.de
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |    8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2487,6 +2487,10 @@ static int amdgpu_device_ip_init(struct
>   	if (r)
>   		goto init_failed;
>
> +	r =3D amdgpu_amdkfd_resume_iommu(adev);
> +	if (r)
> +		goto init_failed;
> +
>   	r =3D amdgpu_device_ip_hw_init_phase1(adev);
>   	if (r)
>   		goto init_failed;
> @@ -2525,10 +2529,6 @@ static int amdgpu_device_ip_init(struct
>   	if (!adev->gmc.xgmi.pending_reset)
>   		amdgpu_amdkfd_device_init(adev);
>
> -	r =3D amdgpu_amdkfd_resume_iommu(adev);
> -	if (r)
> -		goto init_failed;
> -
>   	amdgpu_fru_get_product_info(adev);
>
>   init_failed:
>
>
> Patches currently in stable-queue which might be from W_Armin@gmx.de are
>
> queue-5.15/revert-drm-amdgpu-init-iommu-after-amdkfd-device-init.patch
