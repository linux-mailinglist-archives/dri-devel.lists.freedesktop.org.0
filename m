Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2442A918B
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:36:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC636EE17;
	Fri,  6 Nov 2020 08:35:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E336EDE2
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 19:33:19 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id f38so2044972pgm.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 11:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eSpGHTliJf2Cyl4xNehipJVU0uhjtt4v/ABhWGSHLms=;
 b=IKr4/3tHu41qkkq+TXGIqQM0yq011kjtMFgajdBo2u01m4IN5baZXmD3uJ50QaW792
 t0aevmveRLayC8WW/2ndvF5IhEDrkQPehDbfQxdkncZaG+TxZRdzLow00cdnnm4TLbHr
 kXgxtkZP+tsW7mHAnr5mgWNOkeJO3Tr7+wbXe17/w63808LLT6RKuOLbC+tKHjWYFm6j
 rJe1GG7vULHd4HhrXl68nsDZ9kuEIB2RLlq/6GMhGCcA0kvI3cD9pNsLYb8eiuznc9A9
 tjpv1LnYpHMvepZlSnqJVK63N0R8KpipbmAZes5C0d9VaInD00G/OBrJ5ckJEy3IidPF
 zzCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eSpGHTliJf2Cyl4xNehipJVU0uhjtt4v/ABhWGSHLms=;
 b=jk5TuxUoOsoN6eLXEi9dVmiwNJX8eq8HAEGjE+l1HaOkTW3ODftv0oHxvJ/E8EKygZ
 SPVyotTLb4wC9EEXNiuMK1PMfhx+u54ig/wQ+plwhCTOrfydXCT5W91HJskA6GLPNuFh
 H3CP8KIdKWC9XgWDcsH2X9rKKfNUJ1U4lS/F+/TPe5iC13aGYaJQr8YgefLlVpIUjmFk
 yOjFaiLpFtcEcEbYziaKWcFs6+38QZZzzdqJjMQD24K35+29zdThPRecfuHQVmtK+T1V
 BXGJIQEKEuMLUuvre+vOp/ZX6pQOWj+lSbmxqBIAvb42lIE5iGl0Kkk2J9UXfMbsZ8Z7
 sGYA==
X-Gm-Message-State: AOAM533dvREZHHf/EO9Qub1rAr9U1LEJPb8woFxdRQ99X000oDmLHy3X
 J+gjhRewPMv7u9JqVHFCl9c=
X-Google-Smtp-Source: ABdhPJxBSGVVgTAvY+rQZZq/gwen/q3PAFD+cgTOxAs86LiDvDJWGDgrdY2V2X2GZfaiMXQU3ZmXhQ==
X-Received: by 2002:a63:9d8d:: with SMTP id i135mr3876922pgd.213.1604604798792; 
 Thu, 05 Nov 2020 11:33:18 -0800 (PST)
Received: from localhost ([160.202.157.3])
 by smtp.gmail.com with ESMTPSA id y19sm3240844pfn.147.2020.11.05.11.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 11:33:18 -0800 (PST)
Date: Fri, 6 Nov 2020 01:03:12 +0530
From: Deepak R Varma <mh12gx2825@gmail.com>
To: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH] drm/vc4: replace idr_init() by idr_init_base()
Message-ID: <20201105193312.GA108505@localhost>
References: <20201105181613.GA42968@localhost>
 <CADaigPWV+x=6x_vso1Eb7ZEdmevpjgdGWO-epq-S6gJ3J1-sSA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADaigPWV+x=6x_vso1Eb7ZEdmevpjgdGWO-epq-S6gJ3J1-sSA@mail.gmail.com>
X-Mailman-Approved-At: Fri, 06 Nov 2020 08:34:42 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 05, 2020 at 11:25:11AM -0800, Eric Anholt wrote:
> On Thu, Nov 5, 2020 at 10:25 AM Deepak R Varma <mh12gx2825@gmail.com> wrote:
> >
> > idr_init() uses base 0 which is an invalid identifier for this driver.
> > The idr_alloc for this driver uses VC4_PERFMONID_MIN as start value for
> > ID range and it is #defined to 1. The new function idr_init_base allows
> > IDR to set the ID lookup from base 1. This avoids all lookups that
> > otherwise starts from 0 since 0 is always unused / available.
> >
> > References: commit 6ce711f27500 ("idr: Make 1-based IDRs more efficient")
> >
> > Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
> > ---
> >  drivers/gpu/drm/vc4/vc4_perfmon.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_perfmon.c b/drivers/gpu/drm/vc4/vc4_perfmon.c
> > index f4aa75efd16b..7d40f421d922 100644
> > --- a/drivers/gpu/drm/vc4/vc4_perfmon.c
> > +++ b/drivers/gpu/drm/vc4/vc4_perfmon.c
> > @@ -77,7 +77,7 @@ struct vc4_perfmon *vc4_perfmon_find(struct vc4_file *vc4file, int id)
> >  void vc4_perfmon_open_file(struct vc4_file *vc4file)
> >  {
> >         mutex_init(&vc4file->perfmon.lock);
> > -       idr_init(&vc4file->perfmon.idr);
> > +       idr_init_base(&vc4file->perfmon.idr, 1);
> >  }
> 
> Sounds like you should use VC4_PERFMONID_MIN instead of a magic 1 here.

Agreed. I will update and resend v2.

Thank you,
./drv
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
