Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DA489F9F3
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 16:34:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7100D10F4BD;
	Wed, 10 Apr 2024 14:34:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Z4acgxpF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B233C10F4BD
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 14:34:30 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-56e2b41187aso8411148a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 07:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712759669; x=1713364469; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7acZ973Ajl67Eouc5x9e55dfRGC/ai7/lwyKLzv1UyU=;
 b=Z4acgxpF82SQhQ/GD43b0oxsY60Id/5IACHwgdKgKalsYx5mRKy7iC0ghsBGXtcB3S
 jDBbqHBY68lTOKqKuJYfBHScxR1zxN9WhEtgy79ENUiTqqKY1wygV/ATPjEJF+nmroto
 lvX5HanK06ifNFxUPesDOH2pNAIoxt/asFa7VX1dxDNMTeBGJthJIJ+nbMB6tZnQky2o
 yckiUibEat6SeS73dIkXtSiB8D9u7bOXGE4gmGwPmZYMseImnF/mJYq4RJy5EMrbriLi
 nrT5CA1HOiQjY9BFSBBIJDr68E14hq5eKcVEImGj7tFRWEeY5wka1Mc7n+fGartqyfJv
 IsDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712759669; x=1713364469;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7acZ973Ajl67Eouc5x9e55dfRGC/ai7/lwyKLzv1UyU=;
 b=VpR5HeJdvSf8sBYJBgR/OyyYth8Nk3geDP5kicKbiqyw4YQlMsI8PGv5kNbZs0v9Ck
 ocQY+BKx+G/f34XJFN99pZuzkcGJTjX2R3hsGQ7OfhXismo7I8m1g8xi04PiEB3lPe29
 smL1lPA2+AJIGll1GGtHOFO7Dk5WPXCNCKanJsaBLcjQ+THFaf5vcu1G4BawG11Ddzre
 QUyZfQsSLiYs1IRMCGBkGdkRV62tWLC43jIL8I4spxHU33REIHgEn57nLNYuQDinpstx
 zbVFaelHEmnsQfTJov6kYVj5BJmdavowsBNKJnV4TEC/yv/8eh4CUW6Aq4lY5bASH1hr
 B6Fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCF+wG6lIkdiGf1bQTnjGRV3PtirRJQDZzuE6x5oEzJ4ASqsjDFFR8tQoCDltmpNXiRQckGpV9yKkqdXLhUUm0raZlZSlYIs+y64p3wMco
X-Gm-Message-State: AOJu0YzP95pjJZqp2BfBOiVFWcZOgMDquoQaQBFKtz+XzCRryds/qOVh
 ccf/xp4XCvgsZvHE7rU2AhDhNrGDVvWZFSwULJQCNtRdBJ05M86737zdi2+YsVM=
X-Google-Smtp-Source: AGHT+IFvIytw6BTrJf4lCZTxnZYuGQCz+styNqfFiPJfwas6HbtzJzvzmlJZItz+CM85s4MUMulbzQ==
X-Received: by 2002:a05:6402:3209:b0:56e:5b6d:ac77 with SMTP id
 g9-20020a056402320900b0056e5b6dac77mr6208896eda.18.1712759668725; 
 Wed, 10 Apr 2024 07:34:28 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 k4-20020aa7d8c4000000b0056e74ebca64sm1880527eds.34.2024.04.10.07.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 07:34:26 -0700 (PDT)
Date: Wed, 10 Apr 2024 17:34:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Steven Price <steven.price@arm.com>
Cc: boris.brezillon@collabora.com, dri-devel@lists.freedesktop.org
Subject: Re: [bug report] drm/panthor: Add the scheduler logical block
Message-ID: <17153286-76ed-476f-8106-76b9f46614e3@moroto.mountain>
References: <3b7fd2f2-679e-440c-81cd-42fc2573b515@moroto.mountain>
 <8d68acac-06d2-4d18-b257-2807209dadc5@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d68acac-06d2-4d18-b257-2807209dadc5@arm.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 10, 2024 at 03:11:52PM +0100, Steven Price wrote:
> On 08/04/2024 08:35, Dan Carpenter wrote:
> > Hello Boris Brezillon,
> > 
> > Commit de8548813824 ("drm/panthor: Add the scheduler logical block")
> > from Feb 29, 2024 (linux-next), leads to the following Smatch static
> > checker warning:
> > 
> > 	drivers/gpu/drm/panthor/panthor_sched.c:1153 csg_slot_sync_state_locked()
> > 	error: uninitialized symbol 'new_state'.
> > 
> > drivers/gpu/drm/panthor/panthor_sched.c
> >     1123 static void
> >     1124 csg_slot_sync_state_locked(struct panthor_device *ptdev, u32 csg_id)
> >     1125 {
> >     1126         struct panthor_csg_slot *csg_slot = &ptdev->scheduler->csg_slots[csg_id];
> >     1127         struct panthor_fw_csg_iface *csg_iface;
> >     1128         struct panthor_group *group;
> >     1129         enum panthor_group_state new_state, old_state;
> >     1130 
> >     1131         lockdep_assert_held(&ptdev->scheduler->lock);
> >     1132 
> >     1133         csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
> >     1134         group = csg_slot->group;
> >     1135 
> >     1136         if (!group)
> >     1137                 return;
> >     1138 
> >     1139         old_state = group->state;
> >     1140         switch (csg_iface->output->ack & CSG_STATE_MASK) {
> >                                                   ^^^^^^^^^^^^^^
> > This mask is 0x7.  Should it be 0x3?  That would silence the static
> > checker warning.
> 
> The mask is correct - it's effectively a hardware register (well it's
> read/written by the firmware on the hardware). States 4-7 are officially
> "reserved" and Should Not Happen™!
> 
> I guess a "default:" case with a WARN_ON() would be the right solution.
> 
> Steve

A WARN_ON() won't silence the warning.  Plus WARN_ON() is not free in
terms of memory usage.  And they're kind of controversial these days to
be honest.

One solution would be to just ignore the static checker warning.  These
are a one time thing, and if people have questions in the future, they
can just search lore for this thread.

regards,
dan carpenter

