Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CDFC06052
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 13:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D9310EA57;
	Fri, 24 Oct 2025 11:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="KlFEI83E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F9C810EA50
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 11:39:16 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-63c4f1e7243so3142694a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 04:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1761305955; x=1761910755; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oALJ4BFXS0wmn9T8ZjhghWD+JcsUYwNx3dHdq2BSp/4=;
 b=KlFEI83EikieLKG6Gt5CoQy6j2JCDVevde3deAz6I5FLvAAImAagFOXDkMI+wuLqM3
 MxMo/jr2G2sa8LxnPOxl+AmoDogpNEfxLFjWIKMtQ81rABqBOoLiWLUWZvLbc1DXvRe6
 XhqpF0Kg0Lw9NFt3rAEKQUlrXiivI7r4Vstsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761305955; x=1761910755;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oALJ4BFXS0wmn9T8ZjhghWD+JcsUYwNx3dHdq2BSp/4=;
 b=XgC7SN93DIYQjv2KA/TTXOlp1/F3cGNoJT/FEDAGW2UXgSfBfaCHuCgD23LrZAPudH
 T+Rue1vMymMwz8jKz5Dk7urud50sDjBzG5UqC9wZFNqa6x3Zsyv9++xS7MgLIA8pvW0T
 rTB7FoNh/00KmqE0W3Yl8I0QH/6+gVpWl/cNT9DZhrC98srveIhHln/PH2SgvlQXbBOT
 sR4w27B7Mv0YKelPDlKv1Wp2VDOLocE5t1i2HVtope1Uzy84AyXdSEwUm589H3j+918n
 YDS6IbQapzhJ4mh1KNaldI9rGKLEBZSsi1IoTrsaua/3SN58/RuByNvChhUvnB6GCSYy
 lJlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZBoS5hmnJbcmLIg0oOt4tRkweilLqrH3ymDFW8tLh6qP+2dbi9Nk/rLH+2GAU92xSUY2FQ/ep8go=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmPYWv2XGcbCY+8mh0trZyTYYokMDdetHC0ANRY8MNAqfh69Qs
 PDTRJsqPVxducV8ovAv8fQwzoZLzJ7xWvvxWbCwqYb6MTbzbn4pyaAD3hHeCppulbhs=
X-Gm-Gg: ASbGncvYT1oWWZWdzALaYQ3USO3PaE8YjFdMlX0M6ce7bfbyVR8/7v/r9/KEtoU3SSC
 bB1lJ0MAciewhHP49K66rT7D8eMYtwbW/5l2TVRP5saBNyklkkvUe4a9/TVyiI/lOzuFTXF+87F
 nJq+wXsZCK2Rxvu7WtBuGq2t0fjmvvdcJNbhfyZH423iyI0ZpToqj8jSNDgKIpKXialot8+WNvY
 Z0abTcxypdWs1bs8rUnyH7d8x8NbF6YtBjy5SeUnf3LuWDFo2lC+d3SVRzEej+um4R3T7nTS7A9
 hDzpHHL5Dsc/SRQ1+aEFGM6eV/oiTwm2muEmKwXWc7xtE1dgBuI7cqARa2qJ4DDBsGbkq1csby0
 EqRSYf5MW6QK8vmvZ8WzBEiu+cldihbvxFF0crj0QmxKv8iD21z1Tb3fAYY5E1A+YTtS5wc5mgb
 EyYJ4yMxLBy0R9gZpvT14rtA==
X-Google-Smtp-Source: AGHT+IHuviw89OJ98pH99Dj0HbHVPFZjbGrY22q7RmBUEhgftWt2uXHRGFqpK7xgUG4k9NbTX8PxYw==
X-Received: by 2002:a05:6402:847:b0:63c:6ddd:fe35 with SMTP id
 4fb4d7f45d1cf-63c6dddfe90mr20584436a12.10.1761305955134; 
 Fri, 24 Oct 2025 04:39:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63e3ebcd742sm4342843a12.15.2025.10.24.04.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 04:39:14 -0700 (PDT)
Date: Fri, 24 Oct 2025 13:39:12 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: Re: [PULL] drm-intel-fixes
Message-ID: <aPtlYNb5S0ooNqY1@phenom.ffwll.local>
References: <aPojgsvNYOU0tN4U@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPojgsvNYOU0tN4U@intel.com>
X-Operating-System: Linux phenom 6.12.38+deb13-amd64 
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

On Thu, Oct 23, 2025 at 08:45:54AM -0400, Rodrigo Vivi wrote:
> Hi Dave and Sima,
> 
> Here goes our drm-intel-fixes PR with a single fix this round.
> 
> Thanks,
> Rodrigo.
> 
> drm-intel-fixes-2025-10-23:
> - Fix panic structure allocation memory leak (Jani)
> The following changes since commit 211ddde0823f1442e4ad052a2f30f050145ccada:
> 
>   Linux 6.18-rc2 (2025-10-19 15:19:16 -1000)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2025-10-23
> 
> for you to fetch changes up to 789e46fbfca1875671717a20a916ca1a920268e4:
> 
>   drm/i915/panic: fix panic structure allocation memory leak (2025-10-20 12:53:57 -0400)

Pulled into drm-fixes, thanks!
-Sima

> 
> ----------------------------------------------------------------
> - Fix panic structure allocation memory leak (Jani)
> 
> ----------------------------------------------------------------
> Jani Nikula (1):
>       drm/i915/panic: fix panic structure allocation memory leak
> 
>  drivers/gpu/drm/i915/display/intel_fb.c | 25 +++++++++++++------------
>  1 file changed, 13 insertions(+), 12 deletions(-)

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
