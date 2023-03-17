Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AAB6BF251
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 21:21:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1560010E3EE;
	Fri, 17 Mar 2023 20:21:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9189E10E289;
 Fri, 17 Mar 2023 20:21:33 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 w22-20020a9d77d6000000b0069d2032f98aso3422318otl.12; 
 Fri, 17 Mar 2023 13:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679084493;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LU/mfsfhNec1aK8PFyfIyYKE8EgQ7PhAvCKKTqQTyQU=;
 b=p7JYB8bhqRMYfjRD2ozKkjzAHTQevhnUGfUTimLWA8bI8MVUYYWpER3Gii4aFi5v29
 Lxwr7+9ZgUmx5eRCE9hnmBerUeOfWr1uzaSC7n0QL9DXgwD+rO90jv40HHNyjhw+Eml1
 UeTFXmSTqEUf5JMMrFF9IJKtQcEMHCKDhyDrBoGdBUGyOn+AQWZqGVSLZeDdr8sDDSZf
 or3jIZBNDQtCgpEdD7UM/NaIP/RaXxBYpfcgkh9XWHWofv7tEC0kFTNYKmxJ4tcY9ZAa
 oMqMQkcWpUrSvABhJRYm3TYVMpJvpiuXnXdwrYJ96N/QrIiB4H09rD3EGyuG0nVL6Ntw
 qygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679084493;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LU/mfsfhNec1aK8PFyfIyYKE8EgQ7PhAvCKKTqQTyQU=;
 b=iUry2aIR9Z3TGHMh4myKM0aB+i3PkHQiVNoADnxRJ/TBFTUOrnAoj3jehUWt5NVCo5
 +WeM8lNVcr8IAF+UfrgsfZ3hN+npB/bbTcrEn9ePjdTNaW15u0bBUWb55GC7o2IyH2ho
 ky08/VbvZX6BDBmYHa+wRk3+AcB2+iDaoeIzQH3wWwVscllxCUsI7JPFNgtqoR0weEsO
 NJzxHX/9Hk8+mfKajXbqd1+mV2CKpeIurd+6VEiwFWSGCFcL5bZV1as3KrcHsw9cLdM8
 9s3HiCQb7B8/iLE27aE3t/DNnBNukIvg+e3K+2kvOCCv+QbETRKcHkzyf7FUD3++p9nV
 Pmtg==
X-Gm-Message-State: AO0yUKWXkDs9skP3fg8sEyoBabACL5UszanhcyrxFcN2CYed99UcpHYl
 5QkXgwV6V0DpvbwGo5XvduXvWtOXGfGA1SoilBw=
X-Google-Smtp-Source: AK7set/FRROjLZxfdn/0MtuhT89/CHr/iks4mIHIqASlz97aojJD2I6VOCkrI8hRGKyEKDzR3I6aFHA0/lRhVr+0fyE=
X-Received: by 2002:a9d:75ca:0:b0:698:311c:a051 with SMTP id
 c10-20020a9d75ca000000b00698311ca051mr313259otl.3.1679084492844; Fri, 17 Mar
 2023 13:21:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-15-lee@kernel.org>
In-Reply-To: <20230317081718.2650744-15-lee@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 17 Mar 2023 16:21:21 -0400
Message-ID: <CADnq5_PPRv7FHbfqrwivf7SxmQktyOhg2OL8=1Ep9G2CnJwf4A@mail.gmail.com>
Subject: Re: [PATCH 14/37] drm/amd/amdgpu/amdgpu_vm_pt: Supply description for
 amdgpu_vm_pt_free_dfs()'s unlocked param
To: Lee Jones <lee@kernel.org>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Mar 17, 2023 at 4:23=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c:683: warning: Function paramet=
er or member 'unlocked' not described in 'amdgpu_vm_pt_free_dfs'
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_vm_pt.c
> index 01e42bdd8e4e8..df63dc3bca18c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> @@ -673,6 +673,7 @@ void amdgpu_vm_pt_free_work(struct work_struct *work)
>   * @adev: amdgpu device structure
>   * @vm: amdgpu vm structure
>   * @start: optional cursor where to start freeing PDs/PTs
> + * @unlocked: vm resv unlock status
>   *
>   * Free the page directory or page table level and all sub levels.
>   */
> --
> 2.40.0.rc1.284.g88254d51c5-goog
>
