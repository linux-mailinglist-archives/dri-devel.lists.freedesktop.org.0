Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A6DA3BFFF
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 14:33:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C96C910E7E5;
	Wed, 19 Feb 2025 13:33:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="HY0jWsOQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A566810E7E5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 13:33:08 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43984e9cc90so5184715e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 05:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1739971987; x=1740576787; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qeYnr6jPu3lSIUMnd641DJ0EkSXG3SudMAp417EhFus=;
 b=HY0jWsOQ5R+nhZp4N+2LBEVDMJATw0EF1U9JqQe67Ag8PVlawPiMzIFo/5oFhBezFj
 RNo/GRUykcJTS3itvA0G1ysAzKLdWl27MxbPU9AhMVMYee6IV82mqV9vWs2HNnrPNzt7
 VMDLBeN7mRPNcKQaDNkW1GhNouX4TtucIBYl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739971987; x=1740576787;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qeYnr6jPu3lSIUMnd641DJ0EkSXG3SudMAp417EhFus=;
 b=UefEWzyIep/rADIIIBlCgRI+MJBHyI/Ax+lGDYz8N9ND8Meb0syU4s+0BAFAE48yjP
 taQ8fyQI8XtcAaRIoPQRtZktZ8Mls29q6bAsVXwkasUJFX0wA3iQZmOayCtUT2+KDjUj
 Nobwb4PPG8IR5p5HnHj0Aj2Cm5zsWjpah6C5F7BqzrgEMOHcvg83EiBMe9hBEoukId83
 i626Uz3LCues9+1q5TVDqlTpo/1JdqWu5baAizHY9AVI3HPIlB16t0Jlwo/vwbcz5Y7W
 b94XRqYu1smJ9Nwf/IhLKaUBf0hLDeq4H7tk0pAhAyOaaMbu21goy2fsylw0D8Y/ukM5
 xPwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKGzUvIcVI45fF1DVLkHxylzcPIeCTtBJHAT09lRJDZcklqxBrUswfXf61cgpZsrspViMWT1+1zkM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcsMekGwPLL12ObpJ0HAGvygElPKUbEs0p858+0aq7NbJFiSXd
 WDmLhlgwV87mS2//A1NGL1Zl7l+Qnqs97W7NgnHFsD3l0uEBedV7JsTBCfjBwYJnVnGx8vtOHqV
 8
X-Gm-Gg: ASbGncvlJlOpXb1gzQzHdwem078ZSQUswJLJ0KNIzbjTSAByfUV5O8p06szz4ickcFA
 7zmovUtttARrPDCitaGq9LqByp7cMB25/8LlnCoDyDTCDyefwfve1EYfhO6FBmuRQQlRrNnfaLC
 vkN+n2OCxdrM0egGBk8YgrXY9Dwm1QxxbHlwJ5TJQP6gxJM7Vd3+sbEjuGxuyH8yHd04SsConPZ
 1huCAp6jtaaFYdQik2qsR2hvdFB72wINarF1KrBRTdMrT1LGhMBw4/77B7tgada6/Qtgl95rVOE
 gwvxJD4q/4+MVjsp3ehqvuq20gw=
X-Google-Smtp-Source: AGHT+IEfr4282QBqEmzNfVUxfuk6xB0RBCkHqhW01JOw3jzUDHaoP/nFjPNWk6Jdq6rqr+AuCCpqyA==
X-Received: by 2002:a05:600c:19ce:b0:439:5fbd:19d2 with SMTP id
 5b1f17b1804b1-43999b44505mr33869735e9.10.1739971987073; 
 Wed, 19 Feb 2025 05:33:07 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a04f208sm211702665e9.6.2025.02.19.05.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 05:33:06 -0800 (PST)
Date: Wed, 19 Feb 2025 14:33:04 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Pranav Tyagi <pranav.tyagi03@gmail.com>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] vgaarbiter: documentation grammar correction
Message-ID: <Z7XdkAKqlK2KJuq2@phenom.ffwll.local>
Mail-Followup-To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Pranav Tyagi <pranav.tyagi03@gmail.com>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
References: <20250207165325.3998-1-pranav.tyagi03@gmail.com>
 <Z6bKR9K16-oYMLFl@archie.me>
 <CAH4c4jKe7Q-E1LhA0KxOxEjK-gn=JY7e=2GN13X=yutaO8k3Pw@mail.gmail.com>
 <CAH4c4j+kOYMfzO5QOBg+hGe2zt4kN4f7v+mrri-2GMLzYtCPrw@mail.gmail.com>
 <Z7WOym9fl8GNPJiO@archie.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7WOym9fl8GNPJiO@archie.me>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Wed, Feb 19, 2025 at 02:56:58PM +0700, Bagas Sanjaya wrote:
> On Thu, Feb 13, 2025 at 11:05:39PM +0530, Pranav Tyagi wrote:
> > Hi,
> > 
> > Just a gentle follow-up on this patch. It has been reviewed but hasn't
> > been applied yet.
> 
> You may need to resend the patch, but with scripts/get_maintainer.pl
> output Cc'ed so that DRM maintainers can be notified on the patch.

I don't have the patch since it wasn't cc'ed to dri-devel. Can you please
resend with r-b tag included?

Thanks, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
