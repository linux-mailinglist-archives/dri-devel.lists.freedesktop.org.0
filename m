Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD077A3705F
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2025 20:15:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A59B110E05D;
	Sat, 15 Feb 2025 19:14:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ab5ij2jc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00FC410E05D
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2025 19:14:57 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-7c08b14baa9so77707885a.3
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2025 11:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739646897; x=1740251697; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+YytOa4khy5sDm6tCChCQvfuYqhq+k0xxbkiRdAgWbw=;
 b=Ab5ij2jc3+JnFICkEYq8EHmRiMd1Sphb4I39dTBlOWs45bs6dn09vnerLnA+Um6fm8
 AOm4USTlZEfqu7VoMTFdpFc8QyHQBQ17PY4lmOKBT09I/Ewzh7L5s9ClfED+gafLP4QT
 N9ShE8QD/hlxUm/oP8qFWX5clRWxPQgCsYz+TLJUAWMm084aSZWcb2RueT2z3gfIevbk
 SgbkYZBeWMFOFIOimBfoN+oG07pv0mZeB9KaGIGLq3nX1bZNzMxdLygqwojO/dkiypLc
 vTPtL30Rq+s2zBmn7ugye9wd/+Y1NGC6uL22naFTma01OIRqLO1BJCyQg1seGvinrGPQ
 +qsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739646897; x=1740251697;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+YytOa4khy5sDm6tCChCQvfuYqhq+k0xxbkiRdAgWbw=;
 b=fKgyduyNpZJQe1BhqMNFFtNsmM++Tpjglzc96F4C1D7IpeDtfT4oszPFnfsnRrkaTC
 15nzUOaj6ZeOJdgyxiyPZ6ZRwmTqVKuxyOmXACS09tVQLSbUpldvNugF6ue5yOi/C3Z2
 9gKRMHqU0/eemC36PKrIBEUa99ZIWbn1n08YgEw5bVYPCkueij8N6r9+kFBX8pPYUBOK
 4zPNb2JIKhnSQT5jRicrurajIX1ZgTfpRseQH07oDKjOAFrxiHd4o0sv59Tyls+7eaRS
 5qOOyg/XIxj9jfCID4xpcCog4llhxNCT5qYhxgqXk7shh6gedZ7rnZn0bR4skwZlgrla
 7/Hg==
X-Gm-Message-State: AOJu0YyMJgUZtHKcS//FhiXklQA/mI8WmOtMIj4ysqgVCMPXiCstsZpI
 jA0AG4LVI+SPXP5LUF3N4LH2lPtaiVdo4M/4lMfEtlvF3AJw7b/p
X-Gm-Gg: ASbGnctcINm/+m78mFuNrp+TTlqb9F2c8wDoNJQaP0tROHH+Q7s+rML7dD54uybOrPt
 oW7I3hFon2BUJK6+mP3HMBJLKa2y0doaUfiRMqp+E+JVUrFbOI4cVCUUxMjjsyfxBhWz4BdCf58
 nY5SaBBaS8yIWXAzqqhZZtEyD/8SGbFifbcCMxkzAerWwQ7WSkFzFevO8yGfeFJgWgaXgoD5NdY
 crb/HSWUxSpTHkn49b7rT7H6zTbljgo8vYDc05chSFXwC6QwXva/ViFPVUhKuGNk5e52WE+a4cC
 YAoVtazFEf+xZ8Blf7J9E7iABqtoJcpt1SNw74o4tKqcAhnmnvMQ
X-Google-Smtp-Source: AGHT+IE4xdhyhIoRQltqa7dyL6Z6hWkk9cDjQMnq19CQ6WbkY1salhHTZYym7H5f+QXW7xJT7BohOw==
X-Received: by 2002:a05:620a:4148:b0:7b7:106a:19b7 with SMTP id
 af79cd13be357-7c08a99e7f8mr588732785a.18.1739646896827; 
 Sat, 15 Feb 2025 11:14:56 -0800 (PST)
Received: from VM-Arch (ool-1826d901.dyn.optonline.net. [24.38.217.1])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c07c86e650sm346357785a.97.2025.02.15.11.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Feb 2025 11:14:56 -0800 (PST)
Date: Sat, 15 Feb 2025 14:14:54 -0500
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Josef =?utf-8?B?THXFoXRpY2vDvQ==?= <josef.lusticky@braiins.cz>
Cc: dri-devel@lists.freedesktop.org, noralf@tronnes.org
Subject: Re: drm: mipi_dbi_hw_reset() keeps display in reset
Message-ID: <fm4kqbfknroub3onbbhbzvurw7ig3fsjrxpeucdtioobssstjk@hzmdxa7uby6f>
References: <CACnTymYtkLJ=EfZK-c1nCW+bLSKAaq2sTW1x+Bj-_ve7hfAdKA@mail.gmail.com>
 <n7qaikyyisdq3m74buqjfxzyi5lgntnsmtirrmw5vi2nkf7izl@6coklitzp3uc>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <n7qaikyyisdq3m74buqjfxzyi5lgntnsmtirrmw5vi2nkf7izl@6coklitzp3uc>
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

On Fri, Feb 14, 2025 at 08:04:41PM -0500, Alex Lanzano wrote:
> On Fri, Feb 14, 2025 at 10:29:29AM +0100, Josef Luštický wrote:
> > Hello Alex,
> > there is a bug in mipi_dbi_hw_reset() function that implements the logic of
> > display reset contrary.
> > It keeps the reset line activated which keeps displays in reset state.
> > 
> > I reported the bug to
> > https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/63
> > 
> > Unfortunately, fixing the bug would mean current DTB-ABI breakage and
> > device-trees modification would be needed.
> > I mainly write this email to let you and other people know about it, so
> > hopefully it can be found easier.
> > What are your thoughts?
> Thanks for making me aware. I'll dig into over the weekend and get back
> to you

Alright so I looked into a bit more. Looks like the MIPI Specification
says that the reset line is active low. So, if we want dt entries to be
correct the logic for setting the reset line in mipi_dbi_hw_reset()
should be flipped. However, like you said, this is going to cause a some
confused developers to break out their oscilloscopes to figure out
why their display isn't working.

Best regards,
Alex
