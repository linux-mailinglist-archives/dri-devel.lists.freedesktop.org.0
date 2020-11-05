Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A312A917E
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:35:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5FCF6EE29;
	Fri,  6 Nov 2020 08:35:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED9DA6E044;
 Thu,  5 Nov 2020 17:24:42 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id x13so1873311pfa.9;
 Thu, 05 Nov 2020 09:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=kRPEM8dLjyLiEebJREsbYoGi+98veJN3eW+L5N8MANw=;
 b=LJAxRqlgwpEP711TUT+dFB54aN1UL83lKZKvAOwC1z8du9AfiYoov5+1NgrIM+Rv0V
 ERrJ4sDvfB/7noY3mQ5+5pgpMk/cobJiBbCF5xJs3m4D0Mk3/aUz20pu1T7lX7evedV9
 44z04LDOg3sKgsfDYyisRMjVcRoBP82HNMInxO/4VAtYM0olHgJnCZ3Z7b3mLdoui1So
 WtLK24k2bvgYqI19m/jtq1S343uED2sj9bfnNyZ5kpkVVEblqVsrgrJTyhC7YBHUglQP
 QvGMdEJY7zRrz4YlWNlFt75KuQsPnTsOR29y4i5yG5L0gMAKpGMPDNOtOtBhmtZ2jAmW
 TGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=kRPEM8dLjyLiEebJREsbYoGi+98veJN3eW+L5N8MANw=;
 b=MCAcMtBuT661fLRPm5uO4BO7BTT8glpltr9LnLYlgdK3EtdTqSyJ4p+JqEjwp4qSdm
 prQo5qKrAIZlFmBvz3m+pJWg8tXV+QWclYCooiCy64WzUJK4Bg/K/fZ1s+3d0/cQVTPQ
 2PvQxHRhcPiB2qhls+K1pPBmNCkMLKLoobl0JJjug5RCv4s2J2mLFjfjr63H5Kfi3RdQ
 GKWPNShGIr1JAZuyrXabobcn5dRTpDWS6CskSI/hw7v3JM7zQ72cSQiPJnbdWDwe+N9e
 Lv4YKDcyS2i1Ct13E25bqmf9LSRW/rcYH5hHo3bSw3YQcXmb8FnX2I3n0FSKNnjNGm+0
 q9WQ==
X-Gm-Message-State: AOAM5318WeGjHNGTYVPQPKBbGKDAk2j5uENa4DChnWLbJOpjFczAHY5U
 TqScH1v/l2dQIyqwLhTzvDNdHw8hICA=
X-Google-Smtp-Source: ABdhPJyKHU9603o2tF6OrsxyE2Luza+oJ/CDl1+4JY+pPq6LDVqrIDKkrZsdsyc9MLqOn345oCoTeA==
X-Received: by 2002:a63:c20f:: with SMTP id b15mr3262198pgd.230.1604597082661; 
 Thu, 05 Nov 2020 09:24:42 -0800 (PST)
Received: from localhost ([160.202.157.3])
 by smtp.gmail.com with ESMTPSA id r127sm3113321pfc.159.2020.11.05.09.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 09:24:42 -0800 (PST)
Date: Thu, 5 Nov 2020 22:54:29 +0530
From: Deepak R Varma <mh12gx2825@gmail.com>
To: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [PATCH] drm/amdkfd: replace idr_init() by idr_init_base()
Message-ID: <20201105172429.GA41091@localhost>
References: <20201104151359.GA69034@localhost>
 <91ebae30-c75c-5485-8de5-36464e97ed7e@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <91ebae30-c75c-5485-8de5-36464e97ed7e@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 04, 2020 at 03:01:17PM -0500, Felix Kuehling wrote:
> On 2020-11-04 10:13 a.m., Deepak R Varma wrote:
> > idr_init() uses base 0 which is an invalid identifier. The new function
> > idr_init_base allows IDR to set the ID lookup from base 1. This avoids
> > all lookups that otherwise starts from 0 since 0 is always unused.
> =

> I disagree. We call idr_alloc with start=3D0 for both these IDRs. That me=
ans 0
> seems to be a valid handle.

Hello Felix,
You are correct. There are calls made to idr_alloc with start range from
0. So, for this driver, id=3D0 seems a valid use case. The change I
proposed is not relevant for this driver. You may please ignore the
patch.

Thank you,
./drv

> =

> Regards,
> =A0 Felix
> =

> =

> > =

> > References: commit 6ce711f27500 ("idr: Make 1-based IDRs more efficient=
")
> > =

> > Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
> > ---
> >   drivers/gpu/drm/amd/amdkfd/kfd_events.c  | 2 +-
> >   drivers/gpu/drm/amd/amdkfd/kfd_process.c | 2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_events.c b/drivers/gpu/drm/=
amd/amdkfd/kfd_events.c
> > index ba2c2ce0c55a..b3339b53c8ad 100644
> > --- a/drivers/gpu/drm/amd/amdkfd/kfd_events.c
> > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
> > @@ -230,7 +230,7 @@ static int create_other_event(struct kfd_process *p=
, struct kfd_event *ev)
> >   void kfd_event_init_process(struct kfd_process *p)
> >   {
> >   	mutex_init(&p->event_mutex);
> > -	idr_init(&p->event_idr);
> > +	idr_init_base(&p->event_idr, 1);
> >   	p->signal_page =3D NULL;
> >   	p->signal_event_count =3D 0;
> >   }
> > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm=
/amd/amdkfd/kfd_process.c
> > index 65803e153a22..022e61babe30 100644
> > --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> > @@ -1289,7 +1289,7 @@ struct kfd_process_device *kfd_create_process_dev=
ice_data(struct kfd_dev *dev,
> >   	list_add(&pdd->per_device_list, &p->per_device_data);
> >   	/* Init idr used for memory handle translation */
> > -	idr_init(&pdd->alloc_idr);
> > +	idr_init_base(&pdd->alloc_idr, 1);
> >   	return pdd;
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
