Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E8E32F386
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 20:10:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 168C06E2DC;
	Fri,  5 Mar 2021 19:10:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6664B6E2DC;
 Fri,  5 Mar 2021 19:10:02 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id a17so2844872oto.5;
 Fri, 05 Mar 2021 11:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iXzxwkzjLPM7KiJlrDFoXaEopVztroSTDc/T8EMHkyA=;
 b=MHFhF1jy/arRNMe+nRyOQC57EQvTOsY6xXLgEOXZBFd9dqdRZIVlBWIC3S97NIQwtQ
 iDuxd2SYi6D5XyPg6ecwKwFK4V7+/3FnqrNOtHmvpAkgcbm3Tmeap4lZh4OLtlEFugHi
 Y8xiHkhEjmUq9D9igDgXhvovqcXUTS25i0s39z0sYCvqDJzfvHoiJlbs3Ag9RHvyh1s5
 RvidPRO0ZNshH3OQQ9y+t6prDNk4K7SWqtf5+UpJa91klgQIrIx45TZqHL8+KGNc9Tnt
 6J2EYeav9hkbRjCUmC0MQuq5T5MqzH6ELwBol9e12fXYY1/x42Can0cE348oscPRuDGw
 zdow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iXzxwkzjLPM7KiJlrDFoXaEopVztroSTDc/T8EMHkyA=;
 b=k8H6eKyk7OZTI2Y0qqvzKanthn2nYzkc/qVZb0BYSixrfYplzs55zihyrXV8UYCeYg
 cHaN1eb9vQM6b9DoFO41kbaupoSsjf/pAs8/Hrx74X6BBkFOJh4cv6vcmSOLsICVCV1v
 UXktfB/xnXdxT3TROfw56qIvtt/HRVYCU+BA6Fq7xLG9kcTNghoSPFIZUrN9Us+ZSUD3
 39hMh8cQuXuCHthNVOFMNu8iWJqza9U6ocV1su1QIo6HoLyP8NjCn0FuMNRJpqFM5qTU
 hcwCy4Y+qv/5TqxcnonlwqPBQFaVt5dLDltqHIRb8hWUHIXXzXriDZWupaJpwOsB2HQ+
 ZZTA==
X-Gm-Message-State: AOAM530HSJNPmz3dZu/sOs2rvXNyJBRx9cWVj6RqmHpAwlQZMAWrpfmK
 gQYtQHVZBRJE29orpWv+aB1FYGV/PIh40Od0Kb5PKEmf
X-Google-Smtp-Source: ABdhPJx2hSgeK+Yqg7IMRFfwiaPsKVqALRblWQSXFF33Bri5Jv38Yca6XaIqX4fmYVUvCMVExpkjIb4XO50ayw6IDFg=
X-Received: by 2002:a9d:20c3:: with SMTP id x61mr9318715ota.311.1614971401734; 
 Fri, 05 Mar 2021 11:10:01 -0800 (PST)
MIME-Version: 1.0
References: <20210303132510.66904-1-colin.king@canonical.com>
In-Reply-To: <20210303132510.66904-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 5 Mar 2021 14:09:50 -0500
Message-ID: <CADnq5_Pqd0J_VpSkK_hAd9mUg2YgBLcZCEo3u7pXADPAW0_Zkg@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amdgpu/display: remove redundant continue
 statement
To: Colin King <colin.king@canonical.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  thanks.

Alex

On Wed, Mar 3, 2021 at 8:25 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The continue statement in a for-loop is redudant and can be removed.
> Clean up the code to address this.
>
> Addresses-Coverity: ("Continue as no effect")
> Fixes: b6f91fc183f7 ("drm/amdgpu/display: buffer INTERRUPT_LOW_IRQ_CONTEXT interrupt work")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
> index 8ce10d0973c5..d3c687d07ee6 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
> @@ -520,9 +520,7 @@ static void amdgpu_dm_irq_schedule_work(struct amdgpu_device *adev,
>                 return;
>
>         list_for_each_entry (handler_data, handler_list, list) {
> -               if (!queue_work(system_highpri_wq, &handler_data->work)) {
> -                       continue;
> -               } else {
> +               if (queue_work(system_highpri_wq, &handler_data->work)) {
>                         work_queued = true;
>                         break;
>                 }
> --
> 2.30.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
