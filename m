Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2841F7AE0
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 17:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E746E994;
	Fri, 12 Jun 2020 15:27:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF7BD6E994;
 Fri, 12 Jun 2020 15:27:45 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id k26so8671378wmi.4;
 Fri, 12 Jun 2020 08:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=02KYCiUi0pgpoGPaAyXU3/Qv3U6znMf82l3OyYwC3f0=;
 b=Gf0hW7Z+qHXyJ7gqSW2FBj8L9rejLee+kNaDyyrXb8UAvRwO+yF+tD7PvTfKAwvBP0
 SyDKqfSQXWJabq2Q8W7bwZfcS8Kxv0c+uZXfmy9p057xIz2o+YKFP7PYhEAakJD4nO4T
 awbi5kARLAlz3fkftBK+WcMgYqhvnDgZki5NJqCkG5Hl6qLHjAihU4ku6KcewteIPa4d
 WiLGnt7xycuMbG8hPHTPIeEaBWw74zYMKUsK4WGyqVpKKGZpVymcGka3FrrJVeBytLnF
 9sdNADqiJQc/XXjZVOpua4a51EPutwSLYkcPa40k4qzJzHqe2mAWGCHEjJ2wsgu3ZlL6
 15/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=02KYCiUi0pgpoGPaAyXU3/Qv3U6znMf82l3OyYwC3f0=;
 b=GO6OcaNLgnxeoeIvgMN9iJdMlrYAKf0OehbJDpRYIsjQAuDvvXuZ9dcNiHy3gT9SvE
 voiTH+4O1HxXXDZzVsow4rXTesh5cXEppnksY+w5uIUjiuPaKC05JQPBz897Fa0Q9Jou
 wa2NxsU9XuE4L2YRzGopOidybRffNHQQMKsYNNQm8hlbLe2hl4saXNWwVZkmZdZK6bUm
 X2bSX9RHACc8IaKK3e3IjeNdo3+9uebT4EfkdDUnlJXVyBjpQPy3zVInuYwNz7eMdsCk
 LFjbivxGaQrYCipsqE1KCtKV7RSGHvRdudXuRB8M5+x5XtW+4PmjmhDZdH7bhNNCvzQ7
 LjAA==
X-Gm-Message-State: AOAM531uTV0ZGKRcEp3/Di2U3IEZtc0aDHzbD56Zqx37woPmQ7b7PfSJ
 NvY6rgaKIVV1kqTl0N/SHTQyNmLwcvHxHEd7zfI=
X-Google-Smtp-Source: ABdhPJyZnmHTSsRayslyx0/eLvs546da9/M8cW8sRZBJrZlTygAmnfxUjX6OCy5tAILeS9eDuY0SpcrrQujUIPsMSMU=
X-Received: by 2002:a1c:6006:: with SMTP id u6mr13885808wmb.39.1591975663618; 
 Fri, 12 Jun 2020 08:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200612115851.7123-1-bernard@vivo.com>
In-Reply-To: <20200612115851.7123-1-bernard@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 12 Jun 2020 11:27:32 -0400
Message-ID: <CADnq5_OSYYySsYr=0R2Qo7Ku2Vs5+DAv=X4R=Nfpzmg=8G=dCg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: add missing fill of the array`s first element
To: Bernard Zhao <bernard@vivo.com>
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
Cc: opensource.kernel@vivo.com, Josip Pavic <Josip.Pavic@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Anthony Koo <Anthony.Koo@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Wyatt Wood <wyatt.wood@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 12, 2020 at 9:22 AM Bernard Zhao <bernard@vivo.com> wrote:
>
> In function fill_iram_v_2, the ram_table->bright_neg_gain`s
> first element [0][0] seems to be missing. This change is just
> to make the code a bit readable.
>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/modules/power/power_helpers.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/display/modules/power/power_helpers.c b/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
> index 8c37bcc27132..7604a01be19c 100644
> --- a/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
> +++ b/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
> @@ -350,6 +350,7 @@ void fill_iram_v_2(struct iram_table_v_2 *ram_table, struct dmcu_iram_parameters
>         ram_table->bright_pos_gain[4][1] = 0x20;
>         ram_table->bright_pos_gain[4][2] = 0x20;
>         ram_table->bright_pos_gain[4][3] = 0x20;
> +       ram_table->bright_neg_gain[0][0] = 0x00;
>         ram_table->bright_neg_gain[0][1] = 0x00;
>         ram_table->bright_neg_gain[0][2] = 0x00;
>         ram_table->bright_neg_gain[0][3] = 0x00;
> --
> 2.17.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
