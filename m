Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE2786B17B
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 15:18:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 795D710E613;
	Wed, 28 Feb 2024 14:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="VFGQ36n8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2737310E613
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 14:18:05 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-412b30be60dso197575e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 06:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1709129883; x=1709734683; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/uZd/t3bHy2ujwkni7QnhUbdZJPuOIZU68xgRZZC7x8=;
 b=VFGQ36n8M5/EEZGZEOhSEb2o2doYWfgLgdXE8CJ8g8/XVz+Bd/VACuqQpSAK0MVOpi
 oG4GwuIuuJKyeZMVO/BlNRZq1DMsLrJhrsGT/5MMhb50bqo58oVAsv1XSIcEXQ6nXxIn
 rrN7UZ3acTiwWQk0GamTGsiUOKK6fX9XJt5Uc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709129883; x=1709734683;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/uZd/t3bHy2ujwkni7QnhUbdZJPuOIZU68xgRZZC7x8=;
 b=S/GzCfjptY1C0TqdW5e7tDxUXbek3UbU1E9flW3Od5WsYMnWPO5Abwo2JPmeBElFSN
 LD9cugT7u/9jpyQxACDqZbbImXKn4IRW33o7xWHx9vAkqk8egXOlf2hCVNC2EIyf4hG5
 HIkESChzQNM0KZUzJyql4kY/jUvxotn/J/zQT0gWwsEquMog8v+CPpn4BuZ939cx+IVE
 fz6cyuvVcCMKfKNJyYbjCPx1qEmxIHbIITaav/9Aq6wRH1AC/6AOHwXm1sSnY1jXpOP3
 mFyCk1qRkkNr4bP6XTvsqVXx6hxIVC3eojqk23qnOSIFXLb385+XI6bB2y9PREBCglwd
 OXBA==
X-Gm-Message-State: AOJu0Yx02MDFAQJLnLnoVtq5gWyOdYb0UawvmHV2MV0pLAZV/jLnTmfM
 pL8anRSoKkvfM4lLLB0EY/69ykzlJoIIcMjcJih+9kcDHqhm9lzwxFnhhwxOy+P5YvTe0aOgjRR
 X
X-Google-Smtp-Source: AGHT+IGBUR6gcWT1y1Wz6Srst0MO4qFA7DxO+3MW+080QcSseZZwNflpJjUb5//01vhJJdySESxmdQ==
X-Received: by 2002:a05:600c:4f92:b0:412:b7bc:bad with SMTP id
 n18-20020a05600c4f9200b00412b7bc0badmr301263wmq.2.1709129882377; 
 Wed, 28 Feb 2024 06:18:02 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 g10-20020adfd1ea000000b0033d282c7537sm15361579wrd.23.2024.02.28.06.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Feb 2024 06:18:02 -0800 (PST)
Date: Wed, 28 Feb 2024 15:18:00 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Stone <daniels@collabora.com>
Subject: Re: drm-misc migration to Gitlab server
Message-ID: <Zd9AmElnigRH2Eu5@phenom.ffwll.local>
References: <gnthy5o42kiyj63d2bkkxsc5krzf3wrwt23chh2kthkmlyjwbg@ybynvjvqdka7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gnthy5o42kiyj63d2bkkxsc5krzf3wrwt23chh2kthkmlyjwbg@ybynvjvqdka7>
X-Operating-System: Linux phenom 6.6.11-amd64 
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

Hi Maxime

Just wanted to chime in with a big thank your for volunteering to push
this forward! Best vacations when you come back and are surprised that the
5 year old project is magically moving :-)
-Sima

On Tue, Feb 20, 2024 at 09:49:25AM +0100, Maxime Ripard wrote:
> Hi,
> 
> As you might have noticed in your mails, Daniel Stone and I have been
> working on adding all the drm-misc maintainers and committers to Gitlab.
> 
> The current repository was still in the cgit instance and was creating
> an unnecessary burden on the admins.
> 
> For example, any new user had to create an issue and go through Daniel
> to create an cgit account, even though that user already needed to have
> a gitlab account to create the issue in the first place. Adding an SSH
> key was a similar story. By moving to Gitlab, we'll remove most of that
> burden.
> 
> This will be mostly transparent to current committers and users: we'll
> still use dim, in the exact same way, the only change will be the URL of
> the repo. This will also be transparent to linux-next, since the
> linux-next branch lives in its own repo and is pushed by dim when
> pushing a branch.
> 
> In the next few days, you might notice conflicting notifications. As we
> figured out the drm-misc group and repo structure, we've added members
> at multiple levels and we will clean things up in the next few days. The
> final organization is that every drm-misc committers and maintainer will
> have permissions over the drm-misc group and its projects, so if it's
> not the case please let us know.
> 
> # What we do next
> 
> ## Adding the a remaining users
> 
> I was able to identify most of the users with an account on the old git
> server. However, there's a few I couldn't match with certainty to a
> gitlab account:
> 
> * andr2000
> * jsarha
> 
> Please let me know your Gitlab user so I can add them to the group.
> 
> ## Changing the default location repo
> 
> Dim gets its repos list in the drm-rerere nightly.conf file. We will
> need to change that file to match the gitlab repo, and drop the old cgit
> URLs to avoid people pushing to the wrong place once the transition is
> made.
> 
> I guess the next merge window is a good time to do so, it's usually a
> quiet time for us and a small disruption would be easier to handle. I'll
> be off-duty during that time too, so I'll have time to handle any
> complication.
> 
> ## Updating the documentation
> 
> The documentation currently mentions the old process to request a
> drm-misc access. It will all go through Gitlab now, so it will change a
> few things. We will also need to update and move the issue template to
> the new repo to maintain consistency.
> 
> I would expect the transition (if everything goes smoothly) to occur in
> the merge-window time frame (11/03 -> 24/03).
> 
> Let me know if you have any questions, or if there's anything we missed,
> Maxime



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
