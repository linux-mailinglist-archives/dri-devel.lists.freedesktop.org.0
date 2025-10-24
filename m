Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7428FC05FE4
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 13:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA48410EA44;
	Fri, 24 Oct 2025 11:35:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="SC+5rg2h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB47010EA3E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 11:35:18 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-63e076e24f2so4079492a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 04:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1761305717; x=1761910517; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OIxlQ1hqkHknPtfnzCZtsZMEBgGzvgvHKIMgwhafa/0=;
 b=SC+5rg2hFs/yaFUEPVdEt8f1D5ZAFbrdD8W5r9JRLfr//RKhsArOATdKHAis5sq7VP
 UmxjTBJijEY7wynxZhOFUpLc/t/dIrWVFS6OdqBOMNF47XZAgrz53VCmlmShI3W/8c/m
 Bls1n7AV31lJ0cZLi1RBXCUPFzMU9CPO/H6Tk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761305717; x=1761910517;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OIxlQ1hqkHknPtfnzCZtsZMEBgGzvgvHKIMgwhafa/0=;
 b=bg6zXjHcEA7z/+aTEuBoeI4HRvF1LUDqsHnYnqIEaP1lVClUUm14sdODMzSa8VaLc3
 YWN0skh80l0eKHteLtTMTzmGXMcVHKxgYK/8v3F55cahYjhcwT6BlKj7LCqA4kOSq8pB
 QKMbDnCm2Aup5A7936AFNDDpEe+MSYFpaKEM9EjyDiCOvENqH9p8M+swpNAgZBg/1s2u
 YgwfQg4detuWChxQ4ZIemJ07YV6Qn0tfiNB3Yzhv3EM9LEFHccpFB1PuY14liem6AYWx
 AsCi2UAMcuU1Gu0+xomGyWBsN+v2MRGjFho6GvFD1zv7/Jv6klldeYGPCXcTUo/7k8KT
 FMow==
X-Forwarded-Encrypted: i=1;
 AJvYcCWq5/cNrj6/qWTIR2V3LsQC6XsDw07GcS5IY8H3+RMroO/W0+YamMqq1wYzRiTit44M1Q3AX078fL4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYQHV9q+12hMU7r/mzlBaXdBkm3GvezFPUnz2rWiR8co7+i3SU
 HTUBRwcGlnzo8WCKyath+pzvWRH0lmdLzqryQm3bT5hlC4apbXDv6QI/+R8uSXcTJoI=
X-Gm-Gg: ASbGncv424+9lOqRqMjyFlhtJQH3kR92rZR0bjREq7c1G90j6yjNij+7dnIDu6BZ2DY
 j5KkErhQ5Ep42/uRyuexGsnf/S3Aow/9whAk396l2d5qeK4nklLzSn174b2v9IVGdzM7+h8waCG
 g18uc87bA49BLlJKlM/9VSlTCoFqcEVlToFJoMSpRbOEvqs01yuvavHpApR5B4qaICwukjAyNTl
 c5AWBSFf6RJY5Vuq9FZea+Y0JighrjfPXG0pvnDPVKmGXMBYzpBPqkkhxLXtmxciYp3XS+wuLua
 Esjp3Scy8nBOYuQ0zxr4vjf0yLS/uj9ux0KV7v0Gag5bWM8Q1rzk8I4SMKUMHrjjO1nM/4aCWk5
 Xtod6HdI1YnePke/Ol0KpXUmbkOkQBCKzRXaImJd76N79UQVdwJNnA08EAyG4MowVGkF9WrKkqa
 YermggGzCyifM=
X-Google-Smtp-Source: AGHT+IErKfcmqmsjgZ9Th0ARnwnAhvBNtwh2neb3bsKb2pMw+qMPf+IO6pPmhy46i/K/4sELZECXrw==
X-Received: by 2002:a05:6402:13d4:b0:639:e712:cd6c with SMTP id
 4fb4d7f45d1cf-63c1f641d39mr26435203a12.13.1761305716471; 
 Fri, 24 Oct 2025 04:35:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63e3ebcbe35sm4048386a12.12.2025.10.24.04.35.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 04:35:15 -0700 (PDT)
Date: Fri, 24 Oct 2025 13:35:14 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, simona.vetter@ffwll.ch
Subject: Re: [pull] amdgpu drm-fixes-6.18
Message-ID: <aPtkcs7Hn_SIFHpq@phenom.ffwll.local>
References: <20251022222005.1787211-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022222005.1787211-1-alexander.deucher@amd.com>
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

On Wed, Oct 22, 2025 at 06:20:05PM -0400, Alex Deucher wrote:
> Hi Dave, Simona,
> 
> Fixes for 6.18.
> 
> The following changes since commit 211ddde0823f1442e4ad052a2f30f050145ccada:
> 
>   Linux 6.18-rc2 (2025-10-19 15:19:16 -1000)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.18-2025-10-22
> 
> for you to fetch changes up to 72a1eb3cf573ab957ae412f0efb0cf6ff0876234:
> 
>   drm/amd/display: use GFP_NOWAIT for allocation in interrupt handler (2025-10-21 09:52:06 -0400)

Pulled into drm-fixes, thanks!
-Sima

> 
> ----------------------------------------------------------------
> amd-drm-fixes-6.18-2025-10-22:
> 
> amdgpu:
> - DP MST fix
> - Fix DC max link count
> - DC interrupt atomic context fix
> 
> ----------------------------------------------------------------
> Aurabindo Pillai (1):
>       drm/amd/display: use GFP_NOWAIT for allocation in interrupt handler
> 
> Charlene Liu (1):
>       drm/amd/display: increase max link count and fix link->enc NULL pointer access
> 
> Meenakshikumar Somasundaram (1):
>       drm/amd/display: Fix NULL pointer dereference
> 
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c             | 4 ++--
>  drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c     | 3 +++
>  drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h             | 8 +++++++-
>  drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.c | 3 ++-
>  4 files changed, 14 insertions(+), 4 deletions(-)

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
