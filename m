Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C587B1B2631
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 14:35:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 479E26E2D7;
	Tue, 21 Apr 2020 12:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CACF36E2D7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 12:35:03 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id j1so10851343wrt.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 05:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Rcuv9zZok45/Wj3VEtEchXA85grG3e+F+EQYK2BGvVs=;
 b=euQ3cJaN/vqjYl7t9h0rr8+Iv7xSNP83vHImGwVTuWXwXhw1NQoMOd4CIFDB7Etgd9
 hbIYF/4LTVaRBCXWeSTMn46IM9QWjvh9FRR4gWO/v4UBDom86HRMEF73VY7WZfGYgCJF
 NeZb+o5z5ESbSAQkbzr2gnKvLEQCe33ljVORo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Rcuv9zZok45/Wj3VEtEchXA85grG3e+F+EQYK2BGvVs=;
 b=Tvkd8cL1ny7uuyPRPJm1jnZI6w4dGym7BjjupNmmuaDtyOdgVqPm6GMoaZZwGE6HBa
 U92jIrYI2vQIRcPld7yCZXbsXi3jraoJrknDO9A8XzTX8t4Kw1fouDeyyt6fCa0rTdRO
 6XblEl+EE5zaaP8nhuzcCBQqNJlp62aT/CU7qrVSQXu1MPcfB67ATTzaZM5Qn/dFK2na
 7CyZYCeWsruPhgIQNg6MWuy+rEi1YIv8lrCVTWd5ig4PgF3R6/UcAdOCyAtoZMlypm7z
 ZC3wOtvHb0gut9n1wXkYd3aDkuhn0GfksYo4PSAIJRm0WE3v1S2amTq2Q5PM1rGWWBqe
 WAXw==
X-Gm-Message-State: AGi0PuaSpceZ1nbH3/8sstsI3HuhxmP+M1IZ/Jwicsqnxw4JLfilVrZG
 FWyM0ek0gBQPKpsE6yY6s/BQzw==
X-Google-Smtp-Source: APiQypLr8+PKlIrlKHW0Pay4sEh++wGhVyagS1g4lWtu15F4/Bjb2HbItpKHrCGA/Bcd8Lt3Xh9xpg==
X-Received: by 2002:a5d:6148:: with SMTP id y8mr23363738wrt.236.1587472502397; 
 Tue, 21 Apr 2020 05:35:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x23sm3161978wmj.6.2020.04.21.05.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 05:35:01 -0700 (PDT)
Date: Tue, 21 Apr 2020 14:34:59 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tejun Heo <tj@kernel.org>
Subject: Re: [Poke: Tejun] Re: [RFC v3 03/11] drm/vblank: Add vblank works
Message-ID: <20200421123459.GY3456981@phenom.ffwll.local>
Mail-Followup-To: Tejun Heo <tj@kernel.org>, Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org
References: <20200417194145.36350-1-lyude@redhat.com>
 <20200417194145.36350-4-lyude@redhat.com>
 <ef9da9d93022822fe4bec7e906540fcc9852ce59.camel@redhat.com>
 <20200417210356.GD43469@mtj.thefacebook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200417210356.GD43469@mtj.thefacebook.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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

On Fri, Apr 17, 2020 at 05:03:56PM -0400, Tejun Heo wrote:
> Hello,
> 
> On Fri, Apr 17, 2020 at 04:16:28PM -0400, Lyude Paul wrote:
> > Hey Tejun! So I ended up rewriting the drm_vblank_work stuff so that it used
> > kthread_worker. Things seem to work alright now. But while we're doing just
> > fine with vblank workers on nouveau, we're still having trouble meeting the
> > time constraints needed for using vblank works for i915's needs. There still
> > seems to be a considerable latency between when the irq handler for the vblank
> > interrupts fires, and when the actual drm_vblank_work we scheduled starts:
> ...
> > Tejun, do you have any idea if we might be able to further reduce the latency
> > from the scheduler here? I believe we're already using pm_qos to at least
> > reduce the latency between when the vblank interrupt fires and the interrupt
> > handler starts, but that still isn't enough to fix the other latency issues
> > apparently. We're also already setting the priority of kthread_worker->task to
> > RT_FIFO as well.
> 
> I don't think the kernel can do much better than what you're seeing. I don't
> know the time scale that you need - is it some tens of microseconds range? I'm
> definitely not an expert on the subject but on generic kernels I don't think
> you can achieve anything sub millisec with any kind of reliability.
> 
> If the timing is that tight and it's not a hot path, the right solution may be
> polling for it rather than yielding the cpu and hoping to get scheduled in
> time.

What we've discussed on irc is that the hand-rolled version is apparently
a bit better (but not perfect, since indeed this isn't possible without
-rt). I think we need to look more into whether that difference is real,
and why exactly it happens. From a quick look our hand-rolled worker and
kthread_worker have identical code ...

> > Also, of course, let me know if yu're not happy with the
> > __kthread_queue_work() changes/kthread_worker usage in drm_vblank_work as well
> 
> Just glanced over it and I still wonder whether it needs to be that tightly
> integrated, but we can look into that once we settle on whether this is the
> right direction.

I don't think we absolutely have to do this, simply means some nested
irq-safe spinlock. One in vblank_work, other in kthread_worker. Since the
delayed work doesn't do that I think it'd be nice if the drm_vblank
(instead of timer) delayed work could use the same pattern.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
