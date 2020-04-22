Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC991B4A60
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 18:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F261F6E83A;
	Wed, 22 Apr 2020 16:22:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1523A6E83A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 16:22:42 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id p13so1135062qvt.12
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 09:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EjNhcH/bXfvIZUzEIVKgOCJoMZqdaN2tqLtyNe1ZM7c=;
 b=DTRIJ8iviVnMVICbRDafDZ0ZzbTidI7VRE4I8aJhBLYyvYSzst1rQtmNc8SIu2mR5S
 +OsIC9oE1hLB9e8G6GB9r7LP37oeG8bt5D12jMhzfWUYny1mM4Ospo9TbkRL3W0g9m2U
 ENNiGMWwdGxlHA+HzA//YNhNriKkqhHBiodwIO9I/wsig9loxKVhKqIxVc2v64543C/G
 1K/z4Duh8+B9n2Kvnq5AzY5KKaMyJ2qKPyttM26pFyOiSPPptiz4GrGVl5APASoKpPtL
 sl7ODCd1JmhGb8Dv5DyK6SMgVCoFGwk2cUFXZ9eEVzxZt2DA0eEdzu8hyt6g4dnSOBFU
 sRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=EjNhcH/bXfvIZUzEIVKgOCJoMZqdaN2tqLtyNe1ZM7c=;
 b=L5Uw3m1guf8J8bWj7Xm9zlycbowN1SbyiZbltOR33TXTlO7SfZtzcKWMthmTOS8Dzk
 GwTBc1k5i7QevcVD9bHZa2hDbKUBQoWb+sZDDrdl3VitVG0f1LyGkVu+olG97HiiyyNR
 iMp/b9HnTqTbDOk5wg6ijfekBeyUD8QwDwh31MiiSYrviQKvMIU3b9BtDN/XqxRGNoy8
 rGsT1Y43+VrnHBhrQQLuHhh/2qYcsYAjF3PAMVjC2KMcx0scxGbqyXOzSN7HEeLb9zrR
 gtmqaZz3lfSlASPgyytzbZAMiSHNu057NXFefTuSOoNxz7NyP4s0B3JbJGg47EG2eAkG
 K3yw==
X-Gm-Message-State: AGi0PuZ4/yVUzAI0b6MLS5Lx+hpQmnTc7n3rEi00LTlXDMyv9gnmvWuM
 gKc9MT5wt50EpQQAosZ2FVhdEtdN1/k=
X-Google-Smtp-Source: APiQypLIRBkrRvorZmQzP9AyOatxObc8z0ffbAJgLwrskkjNJkq9DGhP7FwWpCURk/qaK3ZekGrgqQ==
X-Received: by 2002:a0c:ba2e:: with SMTP id w46mr24906882qvf.97.1587572560936; 
 Wed, 22 Apr 2020 09:22:40 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::1:6260])
 by smtp.gmail.com with ESMTPSA id o201sm4228901qke.31.2020.04.22.09.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 09:22:39 -0700 (PDT)
Date: Wed, 22 Apr 2020 12:22:38 -0400
From: Tejun Heo <tj@kernel.org>
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org
Subject: Re: [Poke: Tejun] Re: [RFC v3 03/11] drm/vblank: Add vblank works
Message-ID: <20200422162238.GC5462@mtj.thefacebook.com>
References: <20200417194145.36350-1-lyude@redhat.com>
 <20200417194145.36350-4-lyude@redhat.com>
 <ef9da9d93022822fe4bec7e906540fcc9852ce59.camel@redhat.com>
 <20200417210356.GD43469@mtj.thefacebook.com>
 <20200421123459.GY3456981@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421123459.GY3456981@phenom.ffwll.local>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Tue, Apr 21, 2020 at 02:34:59PM +0200, Daniel Vetter wrote:
> > > Also, of course, let me know if yu're not happy with the
> > > __kthread_queue_work() changes/kthread_worker usage in drm_vblank_work as well
> > 
> > Just glanced over it and I still wonder whether it needs to be that tightly
> > integrated, but we can look into that once we settle on whether this is the
> > right direction.
> 
> I don't think we absolutely have to do this, simply means some nested
> irq-safe spinlock. One in vblank_work, other in kthread_worker. Since the
> delayed work doesn't do that I think it'd be nice if the drm_vblank
> (instead of timer) delayed work could use the same pattern.

I'd prefer if they were two separate locks unless that makes practical
difference, but if it does, please go ahead.

Thanks.

-- 
tejun
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
