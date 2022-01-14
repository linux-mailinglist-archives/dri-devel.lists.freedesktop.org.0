Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF2F48F24C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 23:14:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 354DF10E25B;
	Fri, 14 Jan 2022 22:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12ADF10E25B;
 Fri, 14 Jan 2022 22:14:48 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id s127so14193088oig.2;
 Fri, 14 Jan 2022 14:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hYV16qevHj4p7hlLpZ6J16ZgY/GOnmPRNbn5bSOrpF0=;
 b=pXObq9jNXB+xl5VNQoXixXjnKJNMmmzf2mRCw0cf9PNS8h0QeZ7tJ/kNZzfS91pgMl
 6gTRVKWjU+c0fEf/lq+17cIotcYHE8+Xuulz05CJrjEBkrJV6fmdb8mn4xODwMPGwTFd
 BYpfifWCARc11AxRieTkORSa0DMh0H4HeRVdhyUSfSbPpQhnGLuuXUzY6KPnXvywFnoY
 0/TBF6ub0df1eApPgahG8OXVpjKQKa6lgmXAYl+PqdL/r3h5Bgz7oxhscqNlooh9qTH6
 O63vC5IG9MyhhOd7tv2Htr1lNnfgvkzGgN7AzuZyqLlJGirKwjHsgKQHQG3te6FluhhR
 MRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hYV16qevHj4p7hlLpZ6J16ZgY/GOnmPRNbn5bSOrpF0=;
 b=Zr81FMrwMZLf2q5Tg5qJrhma63xqyB3qTOAGyP8UeDONMRjOdNwDYTvvjb6hxswbXb
 rUZKhYAOEpDhYx++imtLbTeaChOYdyTe+7D0R8J6F8A3IsouhDAQmlyc8uiVHiBajZ6o
 gUxTa5OBYwxVoxvlL9mP8cWeHgekE8YDPlx0vKpwFn2o03pKItX/En+LN7woSjhpSdr+
 iwF1RVgWIvhm7GW3GP9VQB1gZwTQ8tsOir/9W6LMo5mL36jSwdB3HhpWETWGI+pdEDaj
 5Dh028eDilJwFXotVNYBaGWdApjJYTeDPRVZhebW1NiTO7G9xD9hGMfRsQSG0tTBpiFL
 iRlg==
X-Gm-Message-State: AOAM531kB8d9rygmw7zZIQpOXIs2OOhCuaMf8ipPVLcQn4ojP9HEkHFG
 xIHU4r/28+IrtA5Cz1RdSDC8+Ll4zfUV1pUYmA4=
X-Google-Smtp-Source: ABdhPJweLPMcJclJfI9XNTVbnCxnkVCqxmj1qpkgHZgEpoFuH5bUKIeSNZUwzGC93g5CmQrRMDb859fmSpKl25OLqJQ=
X-Received: by 2002:a05:6808:68f:: with SMTP id
 k15mr14120373oig.5.1642198487405; 
 Fri, 14 Jan 2022 14:14:47 -0800 (PST)
MIME-Version: 1.0
References: <20220114092036.766001-1-deng.changcheng@zte.com.cn>
In-Reply-To: <20220114092036.766001-1-deng.changcheng@zte.com.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 14 Jan 2022 17:14:36 -0500
Message-ID: <CADnq5_P_MOsTOoRWfe95pvJ9SR6FzfcP3Un6cy9_9WB2Nv-UxQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Replace one-element array with flexible-array
 member
To: CGEL <cgel.zte@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: xinhui pan <Xinhui.Pan@amd.com>, Dave Airlie <airlied@linux.ie>,
 Zeal Robot <zealci@zte.com.cn>, "Lazar, Lijo" <lijo.lazar@amd.com>,
 deng.changcheng@zte.com.cn, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, "Quan, Evan" <evan.quan@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Fri, Jan 14, 2022 at 4:20 AM <cgel.zte@gmail.com> wrote:
>
> From: Changcheng Deng <deng.changcheng@zte.com.cn>
>
> There is a regular need in the kernel to provide a way to declare having
> a dynamically sized set of trailing elements in a structure. Kernel code
> should always use "flexible array members" for these cases. The older
> style of one-element or zero-length arrays should no longer be used.
> Reference:
> https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/inc/smu_ucode_xfer_cz.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/inc/smu_ucode_xfer_cz.h b/drivers/gpu/drm/amd/pm/powerplay/inc/smu_ucode_xfer_cz.h
> index eb0f79f9c876..701aae598b58 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/inc/smu_ucode_xfer_cz.h
> +++ b/drivers/gpu/drm/amd/pm/powerplay/inc/smu_ucode_xfer_cz.h
> @@ -121,7 +121,7 @@ typedef struct SMU_Task SMU_Task;
>
>  struct TOC {
>      uint8_t JobList[NUM_JOBLIST_ENTRIES];
> -    SMU_Task tasks[1];
> +    SMU_Task tasks[];
>  };
>
>  // META DATA COMMAND Definitions
> --
> 2.25.1
>
