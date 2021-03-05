Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 342CE32F2CF
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 19:38:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249096EC09;
	Fri,  5 Mar 2021 18:38:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6623C6EB6D;
 Fri,  5 Mar 2021 18:38:19 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id i21so3573978oii.2;
 Fri, 05 Mar 2021 10:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NuHbNZ1pCaMD75xKPyicfsteJCNdNgmFyqDm5jntMkg=;
 b=QTriOvFOgzxFv2eZ9ihENSK9Df09qTS/DruECsSFH5Sw4oG5qzZp8dI5XzMGXH15Dh
 y2qwHDqCvJ2QXqvo+txAz2tLQMaxC13wIN2f+9blsjLVvy5glhB7P9IAwwRXnTORChQv
 XU5mE1Veu52ojTGnk0TrGJ5JKXxg36ONwyTwJaZleJFMELIN/qmxyFzjrjtIJ0UVVDpn
 kg2r5yIl+gy/+KaZK0LzlvT+tWx06slMIerNge13J6h2waZLv3CeGi9XMdkYOmwWwvpt
 SUO3wS5V+puwfdol9aeeqsnJmVX4B5GkpmzFzuLxKWW2+8KmzK/wM5moqN4dc+gB7t1k
 S4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NuHbNZ1pCaMD75xKPyicfsteJCNdNgmFyqDm5jntMkg=;
 b=Y9wNZDigN3TfVPRP3J2JKVcMnPRkWObGVXzHgR8kY8+3K0Tx8Hfkf0oMTouEog1tUe
 xKRTsjsfbzBhGZdCoFyjqBekq+ozuzS/DuYMvNAO1WtozbkR11ZEvhtJMhqXpqq2dS3A
 ziaZLXL0205Rqyn/VzKSsifabR8fnOY0EEoBC2cLmgXcahbe3NjWbth9FfDQUIpFsMVp
 r/EM9SNCSolWi2SYBtGdvhVyztRVvrW84Y7p3wu9NOycF2TTpYYWUlF+Z76CfuW04NB9
 UNna1Qb1MiE/poJdcqb89El/ryazU7btzfY3rdE5JaMy339ilDlH6Pbp2bqh1bWexAye
 C3QQ==
X-Gm-Message-State: AOAM532PmP5yx8QocOI/+1APNEmB0TF+TWVXyWyL7yKYjQnCmCOjnIaw
 HtVGaTN2KT0vNzgL7/gJK0ilXBbwYrjv6gTAX98=
X-Google-Smtp-Source: ABdhPJz0QWrubxnVvKfD+3rMD2OUVXyA1FXnY3QQjHZaZxL2kT/xA2ba7/jwCphvhlofJ9ONnGpq3uvRfWAWoyX3+04=
X-Received: by 2002:aca:af10:: with SMTP id y16mr5168997oie.120.1614969498664; 
 Fri, 05 Mar 2021 10:38:18 -0800 (PST)
MIME-Version: 1.0
References: <20210303140654.67950-1-colin.king@canonical.com>
In-Reply-To: <20210303140654.67950-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 5 Mar 2021 13:38:07 -0500
Message-ID: <CADnq5_Nj0_X5E0gqtMEr8FL_UVn+WwjWSycBhWUvcg=zVRHEZA@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/display: remove redundant initialization of
 variable status
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
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Mar 3, 2021 at 9:07 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable status is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> index 03741e170b61..15ed09b7a452 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> @@ -81,7 +81,7 @@ static void dmub_psr_get_state(struct dmub_psr *dmub, enum dc_psr_state *state)
>  {
>         struct dmub_srv *srv = dmub->ctx->dmub_srv->dmub;
>         uint32_t raw_state;
> -       enum dmub_status status = DMUB_STATUS_INVALID;
> +       enum dmub_status status;
>
>         // Send gpint command and wait for ack
>         status = dmub_srv_send_gpint_command(srv, DMUB_GPINT__GET_PSR_STATE, 0, 30);
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
