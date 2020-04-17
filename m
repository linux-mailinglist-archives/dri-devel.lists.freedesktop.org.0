Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A32541AE784
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 23:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 312E76EB15;
	Fri, 17 Apr 2020 21:25:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D2FD6EB15
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 21:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587158700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=676iv0NwOpTsu4j3S5YhFnzxqEtKPiConQpSqMF3tS0=;
 b=iPda0/H9uRTxsSGkj0TlEqNFK92xBR5zDpJ6OGYAa8JOHQifIspcyV3yeD9f4nVjtkVL4f
 OyjR2khRFgWCea5FlwRcY63FMZ2IpOUXhIW2oWQ29/6FYFVYZwrDiievnXLKqmoePXiA0W
 V1UA/7ak96f/7aqj8Erf6pGB8TXz3ec=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-SSHp3_jxPziXidjKgXGE3g-1; Fri, 17 Apr 2020 17:24:56 -0400
X-MC-Unique: SSHp3_jxPziXidjKgXGE3g-1
Received: by mail-qv1-f71.google.com with SMTP id bm3so3151425qvb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 14:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=676iv0NwOpTsu4j3S5YhFnzxqEtKPiConQpSqMF3tS0=;
 b=l8RGijzghIr+z4Qn7cmGmg5DepaRPQKQfT6fY+48ia0oeJzpqqIJTLTX426iZI77tD
 P82F+HdM19M4N9PZBmyf40iAomyUDXQ7PCBaqs3Zf+AqjP9mOpSPcgTMNR9LnV6Sp2cc
 kIYWYYyiR3UAgP7Alj8GxGK/bkJbbILf2C9Tu2SoBA2LHHsvaZn61OfJFKVZlxMRpozZ
 ZFYp0Gv4dlBcrWtrHmitidEhfJZvB8O+xc15SAMEs/Ic/FchYoyK9qc5dJlUdqk8cRlc
 0yqnm3zFXVWAtvicAiVRZsQXglCQtOZe78VsDEhWgZp0omTG/5EyjItv7S0hinB7o4Bz
 vROA==
X-Gm-Message-State: AGi0PuZUfMyNfkRz/SidqQonmvmG7hS024VTJqSa3Ue2Limss9CnEN8D
 ktwPo92v9+0EbscqiXYOF33Hqd/I3kP/yy48hAN9Mv9IPOaVOKF/MdLNmKhgz0mkwYdTtcrMkbQ
 FlsExISROJhjj1F+rsewUPF4K7tCX
X-Received: by 2002:aed:2006:: with SMTP id 6mr5259640qta.276.1587158696123;
 Fri, 17 Apr 2020 14:24:56 -0700 (PDT)
X-Google-Smtp-Source: APiQypI1CPeoFj+QzDX5RrxcP3toefY4DTPQMttZYrN31kNR8CA407FSN+eHTT2P82xGEdUpFktFSQ==
X-Received: by 2002:aed:2006:: with SMTP id 6mr5259619qta.276.1587158695863;
 Fri, 17 Apr 2020 14:24:55 -0700 (PDT)
Received: from Ruby.lyude.net (static-173-76-190-23.bstnma.ftas.verizon.net.
 [173.76.190.23])
 by smtp.gmail.com with ESMTPSA id y52sm8647286qth.38.2020.04.17.14.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 14:24:55 -0700 (PDT)
Message-ID: <dbdf3853cc1e6fa5a05ced6bc72667e24fa7d8ef.camel@redhat.com>
Subject: Re: [Poke: Tejun] Re: [RFC v3 03/11] drm/vblank: Add vblank works
From: Lyude Paul <lyude@redhat.com>
To: Tejun Heo <tj@kernel.org>
Date: Fri, 17 Apr 2020 17:24:54 -0400
In-Reply-To: <20200417210356.GD43469@mtj.thefacebook.com>
References: <20200417194145.36350-1-lyude@redhat.com>
 <20200417194145.36350-4-lyude@redhat.com>
 <ef9da9d93022822fe4bec7e906540fcc9852ce59.camel@redhat.com>
 <20200417210356.GD43469@mtj.thefacebook.com>
Organization: Red Hat
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2020-04-17 at 17:03 -0400, Tejun Heo wrote:
> Hello,
> 
> On Fri, Apr 17, 2020 at 04:16:28PM -0400, Lyude Paul wrote:
> > Hey Tejun! So I ended up rewriting the drm_vblank_work stuff so that it
> > used
> > kthread_worker. Things seem to work alright now. But while we're doing
> > just
> > fine with vblank workers on nouveau, we're still having trouble meeting
> > the
> > time constraints needed for using vblank works for i915's needs. There
> > still
> > seems to be a considerable latency between when the irq handler for the
> > vblank
> > interrupts fires, and when the actual drm_vblank_work we scheduled starts:
> ...
> > Tejun, do you have any idea if we might be able to further reduce the
> > latency
> > from the scheduler here? I believe we're already using pm_qos to at least
> > reduce the latency between when the vblank interrupt fires and the
> > interrupt
> > handler starts, but that still isn't enough to fix the other latency
> > issues
> > apparently. We're also already setting the priority of kthread_worker-
> > >task to
> > RT_FIFO as well.
> 
> I don't think the kernel can do much better than what you're seeing. I don't
> know the time scale that you need - is it some tens of microseconds range?
> I'm
> definitely not an expert on the subject but on generic kernels I don't think
> you can achieve anything sub millisec with any kind of reliability.
yeah, it's microsecond range :(

> 
> If the timing is that tight and it's not a hot path, the right solution may
> be
> polling for it rather than yielding the cpu and hoping to get scheduled in
> time.
> 
> > Also, of course, let me know if you're not happy with the
> > __kthread_queue_work() changes/kthread_worker usage in drm_vblank_work as
> > well
> 
> Just glanced over it and I still wonder whether it needs to be that tightly
> integrated, but we can look into that once we settle on whether this is the
> right direction.

FWIW - I think everyone on the DRM side is happy with the concept of vblank
workers, I think all that's really up for discussion at this point (ignoring
the nouveau patches that need Ben's OK) is just getting the code itself
reviewed and figuring out if we still want to use kthread_workers for this, or
if we should just go back to using kthreadd. At least, since it sounds like
there isn't much more we can do to improve on this latency-wise.

> 
> Thanks.
> 
-- 
Cheers,
	Lyude Paul (she/her)
	Associate Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
