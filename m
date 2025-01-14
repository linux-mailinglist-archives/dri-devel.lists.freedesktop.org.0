Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 975BDA109FA
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 15:54:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D49810E2C9;
	Tue, 14 Jan 2025 14:54:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="XVgH7TTD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B27410E2C9
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 14:54:28 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5d8c1950da7so9597287a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 06:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1736866407; x=1737471207; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uCOirKrbiLq6y9/fTWwoYFEfBlT6E37Uzm1BFuWRYpk=;
 b=XVgH7TTDtb1+apO7ykYyxYRzASnwiTv/A9muv2W2Veyh5gf9QqbefkmjJ3A35oxbPC
 7nk01jnCQ+O7PDACvfuP2oHg77pB4P4xzxUHgOTV++psQjy0sbLhkChdpgE2CVRlKA9W
 V18MkGhmcerowC8OniPEPf94S1xrPK/k55cLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736866407; x=1737471207;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uCOirKrbiLq6y9/fTWwoYFEfBlT6E37Uzm1BFuWRYpk=;
 b=rmbN6LMqtVE1V2NH+BbZDMrmOGMkwIK9YcPNjO3EWMTHXVwLJD3CQOTqPu2JpSYdyZ
 CcpcMUWuHz+eQDT5ucauuBTT0TxkS22+D0r0LxBbH6jQP4irDrzr5UXAFC/sUR7HAe6+
 C2hnTH3EI5bkSJ1RB98UX/D2KuPvXX+VeS7SHTeKUpiMYU24bCWxwmQW0gI/5WKQTHWQ
 0WMcgv5pyz7xtAfqqEA9I3nIdhOoy2VJDVdzNur1i0r0VUQWTEPruv3Zm7k5tvU662Cl
 0t2WZLus+R2jljAF+FITybHMUluJJVNGvl0nc2K7pev+bjcgIcsA68/vaAxl9O4lrghj
 p33w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4TFKnUe1ncymyO5C/77YAYbXjPUKZ68cFLvA/Xt6WBZobAke3+XYlW1mGghEdeIvcI2gasoJ2zYw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7YBDstULl9iy6fNs+6XCPWCc5ouTar4n/KH4aXKonoqQFWPwq
 oOhhegzzGIC2om7VXusE+LBIZOLn+ZVXaF+0xs5IqcXGsRjsBfqrvKwd5uIn0o8=
X-Gm-Gg: ASbGncuKaaHx6TiR6JOl9zm0r7BTeZ5SBuI/7Gkbfv4UXZIMjlD9JsPDlfeyDxCPt8l
 A2UepWA4KjTds6W4ZkJs9BPbEFeM2cRJe5o0+fDByIdPgURNyeirTHOiKB3J5x8V0E+WAIx5fGz
 GSzFo4vZVqxEMOUya4djhjjN6s89+tl2FYQ9x6KB8R3HfzL5RWWNjMZ8qCMuL3iyNTSQVjWJ6Os
 hZoNxXOxRB0KQfidyTFjAb+5X/0YMjaQOAWfnt10xbp8k9jnTHi43eWoCBNMdYmF/Op
X-Google-Smtp-Source: AGHT+IGU5TeEIBzEzAJgPNdJpH0ZZG3GI0EgSnrHTpDU5BnPdVxQTtaLSXu5JWn4mssCRDLIZPb7+A==
X-Received: by 2002:a17:906:7950:b0:aa6:7933:8b2f with SMTP id
 a640c23a62f3a-ab2ab16a302mr2076682066b.9.1736866406854; 
 Tue, 14 Jan 2025 06:53:26 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d9903c3328sm6354448a12.50.2025.01.14.06.53.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 06:53:26 -0800 (PST)
Date: Tue, 14 Jan 2025 15:53:23 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 cgroups@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/4] cgroup/dmem: Select PAGE_COUNTER
Message-ID: <Z4Z6Y5Xy5m4wMu_l@phenom.ffwll.local>
References: <20250113092608.1349287-1-mripard@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113092608.1349287-1-mripard@kernel.org>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Mon, Jan 13, 2025 at 10:26:05AM +0100, Maxime Ripard wrote:
> The dmem cgroup the page counting API implemented behing the
> PAGE_COUNTER kconfig option. However, it doesn't select it, resulting in
> potential build breakages. Select PAGE_COUNTER.
> 
> Fixes: b168ed458dde ("kernel/cgroup: Add "dmem" memory accounting cgroup")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501111330.3VuUx8vf-lkp@intel.com/
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

> ---
>  init/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/init/Kconfig b/init/Kconfig
> index 61f50cafa815..5e5328506138 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1137,10 +1137,11 @@ config CGROUP_RDMA
>  	  Attaching processes with active RDMA resources to the cgroup
>  	  hierarchy is allowed even if can cross the hierarchy's limit.
>  
>  config CGROUP_DMEM
>  	bool "Device memory controller (DMEM)"
> +	select PAGE_COUNTER
>  	help
>  	  The DMEM controller allows compatible devices to restrict device
>  	  memory usage based on the cgroup hierarchy.
>  
>  	  As an example, it allows you to restrict VRAM usage for applications
> -- 
> 2.47.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
