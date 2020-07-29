Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7DB2326CB
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 23:34:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA3E6E2E5;
	Wed, 29 Jul 2020 21:34:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CCD76E2E5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 21:34:28 +0000 (UTC)
Received: by mail-oo1-xc44.google.com with SMTP id a9so4822308oof.12
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 14:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z/TZdLxklOCKkN8i4+cSEsg+b7HbOT6N2Tke9Pj7LUU=;
 b=PkcX/+SxrLF58QXjfWe1NYIIvmeMaLZQYiqX7/9QHwYsHPk3fl0Hsu7IADIZ99KP+/
 EJ0eVf+kh6w3Jmuqj48hqHHp0xRmJrH7LpiOuu1C0RZ/rnMCjdPFlQB3qV4QdNfsKFI/
 OcrqGWzp3r3usyCM4fykQg+yd+NbItUQXQoRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z/TZdLxklOCKkN8i4+cSEsg+b7HbOT6N2Tke9Pj7LUU=;
 b=DF5kW6JRi3e3tOiX+dWRvmTlvG8FzTcGIzsyUAkQqyi6Otwf6/IRFfKfHkoEhfqptk
 ZqHiI9tyJUbu0nRIUIL8IwQ8yJ/xA1oZdypO+my/S2hZSfFzK53JTiWbnaexQMKQiku+
 WpP+4U7knrwpQ/DPeDGBVahXN/JTcRNy45l9uPsmVD1Zu57QGMHhQKVFi++vazpHIX+D
 2nCoqVEcwMS6AOBv1w7lwdv7HzIw7GWEixMiWWa+pF3oY4DvcNy1o3AOWDhB3oVUpEf0
 4OHuF8dRpJ11oWg+/C7qXVXTAGIwCe54//FnkmrYDY1xuFQCx8hxXTE+Z7QkkrSJi2XK
 BE2w==
X-Gm-Message-State: AOAM530pZCCGQMZdtWiT1/Bvn9gOmM7PHkqL8GmCFeM+5ZKaORpQjQYg
 LPZor5kh+YcYjhg9N2TWAM/E1BFDB9lLg1BejoYYTA==
X-Google-Smtp-Source: ABdhPJz6pC1tXOpsIpPdanfPHNgJKYuJ24mheM1Ripgovr1LROfuOCg8D4UZcSeWreJVM/O85k/+pohT+por/StU1Es=
X-Received: by 2002:a4a:b6c5:: with SMTP id w5mr152969ooo.89.1596058467438;
 Wed, 29 Jul 2020 14:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <1596046674-29155-1-git-send-email-hyun.kwon@xilinx.com>
In-Reply-To: <1596046674-29155-1-git-send-email-hyun.kwon@xilinx.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 29 Jul 2020 23:34:16 +0200
Message-ID: <CAKMK7uGBrACy_sP7h35W=6=R94OG3in3E7JiTMp5Kk-hcfkAcw@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm: xlnx: zynqmp: Stop the loop at lowest link rate
 without check
To: Hyun Kwon <hyun.kwon@xilinx.com>
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
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 29, 2020 at 8:21 PM Hyun Kwon <hyun.kwon@xilinx.com> wrote:
>
> The loop should exit at the lowest link rate, so break the loop
> at the lowest link rate without check. The check is always true
> because lowest link rate is smaller than current one and maximum
> of current display. Otherwise, it may be seen as the loop can
> potentially result in negative array offset.
>
> The patch d76271d22694: "drm: xlnx: DRM/KMS driver for Xilinx ZynqMP
> DisplayPort Subsystem" from Jul 7, 2018, leads to the following
> static checker warning:
>
>         drivers/gpu/drm/xlnx/zynqmp_dp.c:594 zynqmp_dp_mode_configure()
>         error: iterator underflow 'bws' (-1)-2
>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Hyun Kwon <hyun.kwon@xilinx.com>
> ---
>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index b735072..1be2b19 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -579,7 +579,7 @@ static int zynqmp_dp_mode_configure(struct zynqmp_dp *dp, int pclock,
>                 return -EINVAL;
>         }
>
> -       for (i = ARRAY_SIZE(bws) - 1; i >= 0; i--) {
> +       for (i = ARRAY_SIZE(bws) - 1; i > 0; i--) {

But now we don't go through the lowest element anymore, which also
looks wrong. Or I'm blind.

I think the problem is later on that we should bail out of the loop on
the last iteration (when i == 0) before we decrement, since otherwise
we then look at bws[-1] in the next loop, which is clearly wrong. I
guess your code results in the same, but it's very confusing logic for
me ...
-Daniel

>                 if (current_bw && bws[i] >= current_bw)
>                         continue;
>
> --
> 2.7.4
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
