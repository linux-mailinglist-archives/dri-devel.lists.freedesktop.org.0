Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41206A3C465
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 17:05:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A34310E49B;
	Wed, 19 Feb 2025 16:05:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gSabo/Yg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84CE410E86D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 16:05:01 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5ded1395213so11445268a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 08:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739981100; x=1740585900; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ljkXhqkhG6hd6NRSsz5fArUZWBwAzxurIP4uHPf/TMY=;
 b=gSabo/Yg0eitCDTvpm3OLsQ4RU+hFWa2Lk27/VMsLvwmeYGtrcExjRYjzElv+7IVJp
 s4SOKd+DkB1Z1vv3hDb4VvQ1zwYgSyUtMqC3suuGWleST0Q34pHUfsMyYY6JpVBZrkH6
 ONImCPRPBOUguijHRrDhxGtQnp4caUQNyaZvq8j74HR3fR/Yyhhv8g+l9zR1kUPQWmJV
 oQD7+aRQlugGe9dae/GwM3SKTXKdH+bzLRYamPcWeCfLjF1dz51AyXJJhM9CyzNxbdP2
 dZ+XOwcjIgvASlD87vMD0hTe3sWV9kEyF3VCVqEmhFwKmVq1Szx5lW9g0rorbbjHUUOw
 KBwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739981100; x=1740585900;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ljkXhqkhG6hd6NRSsz5fArUZWBwAzxurIP4uHPf/TMY=;
 b=PNo0/h9ZUlkhKaKY2pKNT716iFjt1oXNkd+7OPwvomV4jl+TYiauPFI5OJ4poqALky
 TX3Iz365dJK+6CRnXLzBsa7+5xtu5uJbODLUi0G99CzcJUK7jqulDhwoNPW59YmdZA7r
 trtyLwpmaBEz4Z8UDGeP0HesBcK/g6LXgIPEor6y1xE4MslskJWj4rgdRImNERVlW9qc
 lIm7rYHW3MWuNS4dro+asAdYbTaN8w8gGwvkFyvswegi+wDirBrOME8HzkKCIS4CYJ6/
 6KXGZG29zvCLgP94GNhXSw3xEhVHOlXGOTAPsGc73W+HAiSZsL9D0UHfRQXvQekAN5q7
 oUiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeyD4U4KPiBLAOGU5pWXWskB+JBc6Q3qfTI+W+kamwH0dyCAd8lB39LXYMXtKLqn/2tiwL6Qk6ihQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLOzeev2ym4/Ie4YQOScvEE4otgE+zoewHngKWHvqQOdJ0VsiG
 9zbatsKbwSmq+yNUdjuaszLb6eFAhXth72WC+W4glduYNCttj5V7ZeMQFz3h6ZQ=
X-Gm-Gg: ASbGncujP8zkzPzH59J7kE/bNbXEwgDj3mOB40UOrfWqhY7JbIiS/4EDwtgROu6LPZc
 urdn+Y/cEYZwdfmv4AyHHSv6lOFrROE6MwmUZup5SAefdaHFDDwuUOs0uziR+IcsnieSOCsejsD
 2cQ/QjiPnkEmDlzvKK1Fa6Vp0nBQx3A7C1XdVfCcyChspPYHpMr9aajOiSNSFnLYDvqypwx60sW
 XeUvT5Fg/+5M8mDXieQZlx8VdcVT7D2+GrXpEDfW2jP3lSPjC11Sk2TLvjViQRYl44yVOQZ8f2E
 bm6bFKs6uCBh0C7eoEBR
X-Google-Smtp-Source: AGHT+IGIOphoxeNaBbPBBYiv7n3xtBHBqQ7mynIC16IzmDF75ejyL2+ZcOWGMA4f93tnbTIyUvSjSw==
X-Received: by 2002:a05:6402:234f:b0:5dc:72e1:63ee with SMTP id
 4fb4d7f45d1cf-5e03605b765mr20641327a12.6.1739981099630; 
 Wed, 19 Feb 2025 08:04:59 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5dece287d3fsm10511628a12.72.2025.02.19.08.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 08:04:59 -0800 (PST)
Date: Wed, 19 Feb 2025 19:04:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jim Qu <Jim.Qu@amd.com>, Lukas Wunner <lukas@wunner.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Takashi Iwai <tiwai@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Su Hui <suhui@nfschina.com>
Subject: Re: [PATCH] vgaswitcheroo: Fix error checking in
 vga_switcheroo_register_audio_client()
Message-ID: <f608a3b5-320a-4194-bd03-cf08be04c317@stanley.mountain>
References: <ae24cd32-1e78-4656-b983-051ed22d86b9@stanley.mountain>
 <87zfiim09n.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zfiim09n.fsf@intel.com>
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

On Wed, Feb 19, 2025 at 05:17:56PM +0200, Jani Nikula wrote:
> On Wed, 19 Feb 2025, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > The "id" variable is an enum and in this context it's treated as an
> > unsigned int so the error handling can never trigger.
> 
> When would that be true with GCC?

The C standard give compilers a lot of flexibility with regards to enums.

But in terms of GCC/Clang then enums default to unsigned int, if you
declare one as negative then they become signed int.  If they don't fit
in int, then they become u64 etc.

enum u32_values {
	zero,
};

enum s32_values {
	minus_one = -1,
	zero,
};

enum u64_values {
	big = 0xfffffffffUL;
};

regards,
dan carpenter

