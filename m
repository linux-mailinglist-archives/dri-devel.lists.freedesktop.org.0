Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6931C26863
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 19:09:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D705410E2ED;
	Fri, 31 Oct 2025 18:09:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="jMk9fYrf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5309C10E2ED
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 18:09:09 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-634cef434beso6685528a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 11:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1761934148; x=1762538948; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=nKtssmUP+ALDMkzJQfah53QYQZLXpEc5pubXPz+gpuA=;
 b=jMk9fYrfWm8u3EGuynJgG6OWhLxBDg59KSbdIjLROZ0HgsPpJuNuIqMWIkbg0z6Mm8
 gA+r2/PNpksUzcLqC0OYRHSXdsSyr9VZ10wFKJXZ8FQBk0hFgW7D/pG1T/oxWuDlq76G
 PmIJlKq2MSGSbNnEy+uiv2jbNK2gv46Q+uLv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761934148; x=1762538948;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nKtssmUP+ALDMkzJQfah53QYQZLXpEc5pubXPz+gpuA=;
 b=m/P/Yrw94e9wFoe9dNO0C8X5STVywLGEiHbe9eXf7pf0TicQQ86ItLI9ztA3hdDQ4h
 y9kEqYhFCxhYYXyR7A5cc1HHqmzeIvYbrIupVYhfgIi7dH4+7wZ48OR8utLITfHGlE9G
 nqcx8DWJWt856hIYho2hK2qOjxg0nuCo2/q3kKqG0PouFBPGT3eaxpmqLv7Am2snGQlj
 gUW08aX8qb/8B1JnS9MJZs2wg6mcwxTz8vnBl/rvvpa9s6KDCJ8dWoW1hLnKxPahpA4n
 nlFZnVmswWuzf50DkU9RSTsq6L4MFcPkfxd7/taEBnKYMntXD5rINPNWEJ9gZqz9Ns4E
 B1Mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZ6t7dTp+iqEIQcxsDhVFpFJ6cBbIo4/XwcGoaD667AgomhU7gGnBAOfoW8XEmdLLJFOTn3bZ+DIY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXkbDdPEF8abJbqe1aBB0EQSrpWEBLhS6ranVGMFvu1yKkBiKZ
 uuX94OBU3K3qKWVZCAxM1RjddUhUcqnrziFp+zIcRiQHDtzfKxZTbvGtwPzuYc/XO/w=
X-Gm-Gg: ASbGncv3qEkUCQs/EINvTG0zvq/iTVO/k+d7/xJ0CXb94Igf1zW9NtBG6R/AD2PozLd
 uvbpls+upMWSz8ZbTWW9PSbLx4Uf1zdUds4149819S88oru9HFLFoLyz2+1Wbq+TIG0rfYH1RJj
 vG9Xiua218SbgACHdjiTth3O03SwPd5oHWcLBgL4XDqcoqm+occbzOYEEeS9CQThIUrLOXtxkwe
 NHBzynJEoDEzGhqTEaHa4QSU6ceo22JrcR4T7O0H4E1MEVJ6cgqCu6bekTKoc0sFXGcIHS6TyCM
 wkHu23p4C7V6l298V26wyRxWqAN9aJ6Ikl8HvDQG8ROqEuTxEoNdPDT5l97fUeclB9k0HRx2jpV
 Bz29eWyEwDyNebTOJSrBb8F3qahOcE75+X5lnswpKQFE1puzt+d1hO9B8B23NzD//iAyRyO8KUV
 0uSnYCtbxFuVTdrZ/Cuv5U+Q==
X-Google-Smtp-Source: AGHT+IEKnHd7pJ1dQSxnCMJJVqL4EtiSOZpH8KMq1b10ZNQEIBxUJj5PF57dXuhBIN7vAPX1M39U3w==
X-Received: by 2002:a17:907:3cc7:b0:b2f:4970:8720 with SMTP id
 a640c23a62f3a-b706e270568mr574233266b.8.1761934147789; 
 Fri, 31 Oct 2025 11:09:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7077cfa966sm236173766b.65.2025.10.31.11.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 11:09:07 -0700 (PDT)
Date: Fri, 31 Oct 2025 19:09:05 +0100
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
Message-ID: <aQT7QV8F48fwteHm@phenom.ffwll.local>
References: <aQNtTV75vPaDhnXh@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aQNtTV75vPaDhnXh@intel.com>
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

On Thu, Oct 30, 2025 at 09:51:09AM -0400, Rodrigo Vivi wrote:
> Hi Dave and Sima,
> 
> Here goes our only fix for intel-display for this
> round.
> 
> Thanks,
> Rodrigo.
> 
> drm-intel-fixes-2025-10-30:
> - Fix DMC/DC6 asserts on ADL-S (Ville)
> The following changes since commit dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa:
> 
>   Linux 6.18-rc3 (2025-10-26 15:59:49 -0700)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2025-10-30
> 
> for you to fetch changes up to dc8aa0cb87a7836b59422cc02d969c8df849ee39:
> 
>   drm/i915/dmc: Clear HRR EVT_CTL/HTP to zero on ADL-S (2025-10-28 16:00:19 -0400)

Pulled into drm-fixes, thanks!
-Sima

> 
> ----------------------------------------------------------------
> - Fix DMC/DC6 asserts on ADL-S (Ville)
> 
> ----------------------------------------------------------------
> Ville Syrjälä (1):
>       drm/i915/dmc: Clear HRR EVT_CTL/HTP to zero on ADL-S
> 
>  drivers/gpu/drm/i915/display/intel_dmc.c | 55 +++++++++++++++++++++++++++++++-
>  1 file changed, 54 insertions(+), 1 deletion(-)

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
