Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3ECA3BFD6
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 14:27:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FDE510E33A;
	Wed, 19 Feb 2025 13:27:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="I+JCLULR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA45910E33A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 13:27:03 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43984e9cc90so5114515e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 05:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1739971622; x=1740576422; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=P97+9Izdp48aMPe+x/Vt4fyC+VGy5GXgsbg5en6vb3I=;
 b=I+JCLULR5mDjupUFVffrOHunHTSo9VILSe765YjRILZBMBMV22tQaEyqvi9qdf1A9A
 +sKSHDtfjMucR8skGq9b9yBwateYWe4awDdDLNos8NsO9opQC+52Fos+vaYQxCmyDhuv
 UB9m/7oyKJAiYUMC93dd6wjAogoWu8tPpuQsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739971622; x=1740576422;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P97+9Izdp48aMPe+x/Vt4fyC+VGy5GXgsbg5en6vb3I=;
 b=FMsXpGcMT6Rh18GfjvtNQQm0gDGeo+XbUMMef4/S572MIOeiyEUqKco7M4RB44aRbc
 TGOfwID5LstwSBmJVOJlExYFnxWY8DL5oQWr2GQVmahsLSyP6N9clUnKNRnN0i5cgUgb
 cq4LPtLceedWnHNLbSQSHzXzZT2ZH749CcrNFycS5yA7Ajxff0aw7PTJNTwkJ1VWFB4q
 Z7rL5tc9aQtD1sbvgzeFQnrm3KKqWUOPHbXnEHKR4mh+y6Ckk0kiYLsAWlazPzXrdSlL
 oIXJHkdiqHowQ0DlrO6peug0Y6XHm4ggqoA4fWgBcPRKlYJGvvNG3D6BDLiqkemasVv5
 xfpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWaK7k5pJ083cQD38T+VnsPAq/3scx5fS4N9IPGGtnmCcXLz+sbMvbGPi3Igq0zbayHy5brrM4iJ4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznWZL5KFCpeFCvZ6gP+1xSKAaxki62mr2xEGiI+bkrFMmWIqbw
 DDv8iLxo58O4RIVg518PEegkf0uG+KieavD2xPkHqmpaqHQnf2CsaNPSUHh1SIU=
X-Gm-Gg: ASbGncvHuARix/RFDDd4HwhrULaPrf/AiFpikLwAyvxUfORE34Rs3wpg6REnNgx9//1
 SeMmj+4RA4/Q2WWjcoVxlmRFD8qwmWx1yoR2LMkElGJYFp2nKGrFjtjfOh/n1WLSpPgd4PAjudb
 1f0oTg7o8J4RsDJpFvIPc9RwyTY9U3oYfIe/8XhJroNGtSfPihUGx+fXWMi2OageJIvzMzMxKmL
 kcbddQVsamWaXHnEA7yPFWh6sMS8eBiSd/3VGjXCPBCANmL6cTmTSJxfZVJTw8713oICqL6h/7W
 iMaZZiZF9FAXWZtBK65r7Nr18lI=
X-Google-Smtp-Source: AGHT+IEwj9Cg3rz3rMnKfCwVitwHErBe+cWUY6n5CQbHW1Ovl4AwLj/OmgmR9qK49M7TGJhzhA/ZmA==
X-Received: by 2002:a05:600c:4586:b0:439:8634:9909 with SMTP id
 5b1f17b1804b1-43999b70cbbmr33220245e9.14.1739971622313; 
 Wed, 19 Feb 2025 05:27:02 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4398242f2c2sm94444545e9.20.2025.02.19.05.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 05:27:01 -0800 (PST)
Date: Wed, 19 Feb 2025 14:26:59 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: Tejun Heo <tj@kernel.org>, Maarten Lankhorst <dev@lankhorst.se>,
 Friedrich Vock <friedrich.vock@gmx.de>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 cgroups@vger.kernel.org
Subject: Re: [PATCH v2] cgroup/dmem: Don't open-code
 css_for_each_descendant_pre
Message-ID: <Z7XcIxX_LDxODXZ9@phenom.ffwll.local>
References: <20250114153912.278909-1-friedrich.vock@gmx.de>
 <20250127152754.21325-1-friedrich.vock@gmx.de>
 <7f799ba1-3776-49bd-8a53-dc409ef2afe3@lankhorst.se>
 <Z7TT_lFL6hu__NP-@slm.duckdns.org>
 <20250219-tactful-attractive-goldfish-51f8fc@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219-tactful-attractive-goldfish-51f8fc@houat>
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

On Wed, Feb 19, 2025 at 10:08:57AM +0100, Maxime Ripard wrote:
> On Tue, Feb 18, 2025 at 08:39:58AM -1000, Tejun Heo wrote:
> > Hello,
> > 
> > On Tue, Feb 18, 2025 at 03:55:43PM +0100, Maarten Lankhorst wrote:
> > > Should this fix go through the cgroup tree?
> > 
> > I haven't been routing any dmem patches. Might as well stick to drm tree?
> 
> We merged the dmem cgroup through drm because we also had driver
> changes, but going forward, as far as I'm concerned, it's "your" thing,
> and it really shouldn't go through drm

I guess we could also route it through drm-misc. Either way I think we
need a MAINTAINERS entry for dmem so that dri-devel gets cc'ed. And then
make a decision on which git repo should be the standard path. I think
either is fine, but at least for now it looks like most interactions are
between dmem and drm, and not between dmem and cgroups at large. And in
any case we can just ack patches for going the other path on a
case-by-case basis.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
