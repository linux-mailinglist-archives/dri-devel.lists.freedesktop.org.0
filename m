Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 745837E7D83
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 16:48:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2825B10E102;
	Fri, 10 Nov 2023 15:48:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4713410E10B
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 15:48:23 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9bf60bba6f8so23936266b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 07:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1699631301; x=1700236101; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CI5Q80f0+mJvRAGYNfWp4nOFRei4TQKSseQr/K+0bts=;
 b=XQFfXsjsw6ZTbjwvkLPfqJ/SnFJ5D4gycJKonRQxdB8r1xLe4ewneGTX9sMvj1/FJF
 vNGgLt5lle+Hnif65CHywXx2D7eDwY/VbrKp82QktpvAQ77+lJeXSn9Ld0YgaYLnjcAi
 JGhXmFVt7ANOV58c04D0v9DTKlrdX65VMpHqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699631301; x=1700236101;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CI5Q80f0+mJvRAGYNfWp4nOFRei4TQKSseQr/K+0bts=;
 b=KwLrwWk0+/heYYhJyaZFXbrLh9azsnhlf7MXUe9sdlPnKcEo1+YLiiyJO6z4AIxQ7P
 V5rrXvLjLlaS5X96bc7NeuXpujJ4BrjvRJNtR4bdYHTvbKHH06agKuzwpIS6e3O2fbTa
 TR55UPX005t4mxczg2yUV8Vh0v6QZVsouliXujzSLcI8usl/BuuyQlj9Jx7FKzUkIzTi
 9QMZ7VXHa21HfDY4RxhfIU4tsUrCdjQ7VJWtrOV0ev4ZoOFa/BedSkwM78UFYXHPiLoo
 cw0l58e9WYTnbQZzPkBHsODL3SHnhAkdQJugAWJnwIpCUzc892VZoA58b9zb5ZSbrKzQ
 X3kQ==
X-Gm-Message-State: AOJu0Yz4TWabeBWD/JsgYVMwGf/zMyZ8EijtTF6Fvk1PWE/zl44AiRED
 Eus0BUKII67IqajtjIP8R21wng==
X-Google-Smtp-Source: AGHT+IG6AGJU5P9Tg4qhFld8R5T6UgxQf9Fe4D//7dVc6eBB2U2DFPrq+mzEniltkhcKA86I00k/qQ==
X-Received: by 2002:a17:906:6a0e:b0:9cb:b737:e469 with SMTP id
 qw14-20020a1709066a0e00b009cbb737e469mr6745638ejc.4.1699631301212; 
 Fri, 10 Nov 2023 07:48:21 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 fb6-20020a1709073a0600b009e5e1710ae7sm1305854ejc.191.2023.11.10.07.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 07:48:20 -0800 (PST)
Date: Fri, 10 Nov 2023 16:48:18 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PULL] drm-intel-next-fixes
Message-ID: <ZU5QwmPKF7pelDVF@phenom.ffwll.local>
References: <878r78xrxd.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <878r78xrxd.fsf@intel.com>
X-Operating-System: Linux phenom 6.5.0-1-amd64 
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 08, 2023 at 04:04:14PM +0200, Jani Nikula wrote:
> 
> Hi Dave & Daniel -
> 
> I see Dave already sent the pull request for v6.7-rc1 fixes, but here's
> some more.
> 
> drm-intel-next-fixes-2023-11-08:
> drm/i915 fixes for v6.7-rc1:
> - Fix null dereference when perf interface is not available
> - Fix a -Wstringop-overflow warning
> - Fix a -Wformat-truncation warning in intel_tc_port_init
> - Flush WC GGTT only on required platforms
> - Fix MTL HBR3 rate support on C10 phy and eDP
> - Fix MTL notify_guc for multi-GT
> - Bump GLK CDCLK frequency when driving multiple pipes
> - Fix potential spectre vulnerability
> 
> BR,
> Jani.
> 
> The following changes since commit 5258dfd4a6adb5f45f046b0dd2e73c680f880d9d:
> 
>   usb: typec: altmodes/displayport: fixup drm internal api change vs new user. (2023-10-27 07:55:41 +1000)
> 
> are available in the Git repository at:
> 
>   git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-2023-11-08

Pulled into drm-next, thanks.
-Sima

> 
> for you to fetch changes up to 9506fba463fcbdf8c8b7af3ec9ee34360df843fe:
> 
>   drm/i915/tc: Fix -Wformat-truncation in intel_tc_port_init (2023-11-06 14:42:58 +0200)
> 
> ----------------------------------------------------------------
> drm/i915 fixes for v6.7-rc1:
> - Fix null dereference when perf interface is not available
> - Fix a -Wstringop-overflow warning
> - Fix a -Wformat-truncation warning in intel_tc_port_init
> - Flush WC GGTT only on required platforms
> - Fix MTL HBR3 rate support on C10 phy and eDP
> - Fix MTL notify_guc for multi-GT
> - Bump GLK CDCLK frequency when driving multiple pipes
> - Fix potential spectre vulnerability
> 
> ----------------------------------------------------------------
> Arnd Bergmann (1):
>       drm/i915/mtl: avoid stringop-overflow warning
> 
> Chaitanya Kumar Borah (1):
>       drm/i915/mtl: Support HBR3 rate with C10 phy and eDP in MTL
> 
> Harshit Mogalapalli (1):
>       i915/perf: Fix NULL deref bugs with drm_dbg() calls
> 
> Kunwu Chan (1):
>       drm/i915: Fix potential spectre vulnerability
> 
> Nirmoy Das (3):
>       drm/i915: Flush WC GGTT only on required platforms
>       drm/i915/mtl: Apply notify_guc to all GTs
>       drm/i915/tc: Fix -Wformat-truncation in intel_tc_port_init
> 
> Ville Syrjälä (1):
>       drm/i915: Bump GLK CDCLK frequency when driving multiple pipes
> 
>  drivers/gpu/drm/i915/display/intel_cdclk.c  | 12 ++++++++++
>  drivers/gpu/drm/i915/display/intel_dp.c     |  2 +-
>  drivers/gpu/drm/i915/display/intel_tc.c     | 11 ++++++---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c |  1 +
>  drivers/gpu/drm/i915/gt/intel_ggtt.c        | 35 ++++++++++++++++++++---------
>  drivers/gpu/drm/i915/gt/intel_rc6.c         | 16 ++++++++-----
>  drivers/gpu/drm/i915/i915_debugfs_params.c  |  9 +++++---
>  drivers/gpu/drm/i915/i915_perf.c            | 15 +++----------
>  8 files changed, 65 insertions(+), 36 deletions(-)
> 
> -- 
> Jani Nikula, Intel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
