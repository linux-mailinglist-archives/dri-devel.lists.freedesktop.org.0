Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 506FA3461F6
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 15:54:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107466E8EE;
	Tue, 23 Mar 2021 14:54:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1177C6E8EE
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 14:54:16 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id w70so17275629oie.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 07:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sqO+jSrm0OppF98WnNtbBizJ/AmSJJZtjDp1PeL64CQ=;
 b=lECKv0UrcLQRcL/CWnYZC5ZbC1utLv04pVQzf4q/FZG2ZP1Rz6xUiYT8yGZkjQUOuT
 H79ecVCh/8bZgVVZBPemIpYcaVgy7CgkXp6CI7c2Gr+4ZeCbQapBT+v8L8cfVEOwvmgF
 /LeNjeRmLy/JDaAcApWC2TZdob9oRuywIoAzarb++L6j8sY31t/0bzxJ6y290d7ZdKIG
 wafxS/6P79XsPXjGygQCRD5ZwGtzGLJIeq80Ajf3UNzL/ZUHZxUcKfrbHEuQQnDk7WFm
 4YgR/wGgyBPYSze++2RlsAb2Nc8UkERCIVr8QGrkRLPPFy1vfH6VHf401uwCNLB58ihz
 2kYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sqO+jSrm0OppF98WnNtbBizJ/AmSJJZtjDp1PeL64CQ=;
 b=XoHWBixblZcelwaHbmDRBjBSH/luFdcX0uZZBpX+DQfXd9iE9obr7JwLx+lfiv/5e0
 GCeksEQw1k0Gc1jOT4EOsXYjB8EttMiDTJYx5Lt/x6SqcShlCRuJWB0IUiIYpnpTfla9
 EZf50ibIGSsEI1bEPzrlt8NdNP1KcaAAXsUPt7hYOnzq6DqnE9d/ec4CIXE7REbg7ZPT
 GTt8musMucVtWy3JHPxga0wSOZdfcadOx+eHJ7AFgdIwS4/wx41hx8kglc6PXYQ2EEVS
 zRvx8vE3yZwy3XAD50rEQvTO96vhveLojyEsT4nkOcHSXAmfSS4rCbiIVZ2NjSmm08/O
 Bp1A==
X-Gm-Message-State: AOAM531KfUphYNCOqea4t8EcJm9whxSfvQAdRykTkYa0qfvchHuPF3gx
 0PvS6THS2hzZ5h5w/OiWTxXvCLgDdfSni7APOqk=
X-Google-Smtp-Source: ABdhPJzAHVGutNlnEG3vBoUnGvxbXvag8NZpLFKrCNCUli/nAQCNzsxC4UaxFPFRj7s/aXJsiEJLOdEO7hJ+ZZX3714=
X-Received: by 2002:aca:4284:: with SMTP id p126mr3637059oia.123.1616511255417; 
 Tue, 23 Mar 2021 07:54:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210320183642.10886-1-unixbhaskar@gmail.com>
 <5cb1810-152-7ec3-ffd2-4a6fd1d6c01c@bombadil.infradead.org>
In-Reply-To: <5cb1810-152-7ec3-ffd2-4a6fd1d6c01c@bombadil.infradead.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 23 Mar 2021 10:54:04 -0400
Message-ID: <CADnq5_NOytHHjEt3FS3CoCgPzsoMVQJ1-Dord_=YzaTHWSY-KQ@mail.gmail.com>
Subject: Re: [PATCH] drm/atomic: Couple of typo fixes
To: Randy Dunlap <rdunlap@bombadil.infradead.org>
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
Cc: Dave Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Sat, Mar 20, 2021 at 3:10 PM Randy Dunlap
<rdunlap@bombadil.infradead.org> wrote:
>
>
>
> On Sun, 21 Mar 2021, Bhaskar Chowdhury wrote:
>
> >
> > s/seralization/serialization/
> > s/parallism/parallelism/
> >
> > Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
>
>
> > ---
> > drivers/gpu/drm/drm_atomic.c | 4 ++--
> > 1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> > index dda60051854b..e1e4500aaca4 100644
> > --- a/drivers/gpu/drm/drm_atomic.c
> > +++ b/drivers/gpu/drm/drm_atomic.c
> > @@ -1148,7 +1148,7 @@ EXPORT_SYMBOL(drm_atomic_add_encoder_bridges);
> >  * This function walks the current configuration and adds all connectors
> >  * currently using @crtc to the atomic configuration @state. Note that this
> >  * function must acquire the connection mutex. This can potentially cause
> > - * unneeded seralization if the update is just for the planes on one CRTC. Hence
> > + * unneeded serialization if the update is just for the planes on one CRTC. Hence
> >  * drivers and helpers should only call this when really needed (e.g. when a
> >  * full modeset needs to happen due to some change).
> >  *
> > @@ -1213,7 +1213,7 @@ EXPORT_SYMBOL(drm_atomic_add_affected_connectors);
> >  *
> >  * Since acquiring a plane state will always also acquire the w/w mutex of the
> >  * current CRTC for that plane (if there is any) adding all the plane states for
> > - * a CRTC will not reduce parallism of atomic updates.
> > + * a CRTC will not reduce parallelism of atomic updates.
> >  *
> >  * Returns:
> >  * 0 on success or can fail with -EDEADLK or -ENOMEM. When the error is EDEADLK
> > --
> > 2.26.2
> >
> >
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
