Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A519DB017A7
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 11:27:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B613710E9EA;
	Fri, 11 Jul 2025 09:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="XMWwUyse";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72CE810E9F0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 09:27:52 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4550709f2c1so3002525e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 02:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1752226071; x=1752830871; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=69R7fK047N7Folo8KI4FUcJCF/Yw3fDsI2bPC+kFnCc=;
 b=XMWwUysei6MrLab87YpWP3019m55OKxmqdW/DCIXeJArWmgJLUhjlaHKy5U7BIXQU+
 cHARFFGSoG5zdBNDBvFoF1QMP8aBdzXaUMp1RYRAv9yfZTnPtjE0RfDfU4KltybA5ZKU
 wAV+cE+q935Zf/hvZYHVL5Gtonz7wQzbQMF/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752226071; x=1752830871;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=69R7fK047N7Folo8KI4FUcJCF/Yw3fDsI2bPC+kFnCc=;
 b=IYc47PrxaF7xKT9OkLpVbwLvl4PHNuoo92z43vsAYf28MH27+NHsei4YloZuYMOCXu
 pQoR094m1lcHmKSTPV10RLwULiYfBXLQqq/8d3itaCGoqiRoACIhnZ6fjyOdHSPMrlVy
 wXkXXkXE0v9IAea1W3VimljUGUryS9XoLq9693MnPrrAI/cu/xXTWBnjKjw82DIDnsxq
 KXlgxTEGaCweKVIetghFsnxOfNvTB72NZ0JJj2mTmviOdb0ig9lKnPCwvAqCDl7Isbi9
 tfBkdpqRpiOB5YubKh4yGLU846cwnmfafG4WFysPinZPdJgwOstaHD4aKFQO56s4mkZ0
 gUYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUq5/6ctVcvHpq4b8fGsgUqhc1I2RC4jusd6+CfBMpgzaPJbNtbF96Kn/1SbOa+6XeiWIVvpqDDBwk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yza2yn5Ky5fgR3Qa8IPElOyXPYrN9PcyyAqrSXvWFfzrjxX32Of
 ei2U5SCobJoIS5ZJMLSDN7EJOEO3ZTSnDI/Qk/PI/rzaK1bst1Xueg0l3rJ4TZmKhxo=
X-Gm-Gg: ASbGncvI680BpV+Q6riRACESArTNiWx6kJJBTA9VYnlgeJ0QJNCagsvGwPXFepsScGR
 uCnoCaBMaSGpkW2WzpCDGNS1dgzt3WBSUV6KSJcGbuhRwx5HjlitX1egHfuqEWPHV56Iz/Y75H4
 uHIxg2Uib82Qa2vLSOPYgw9DyNWG37aw58FiMaim/T8fHgTNrjWl3+yXZeUWp/bniCRydPugeFD
 X5z2lsCToEOFpVFS8YKV2a6MviMYnpn/Hji+e6JkM2X9VlVOk387rLGEDWZFFWMCdSludmL7sIy
 4WizyBy1ZOjNSvrZUWbEUXjVn+6tTtsr1LSZsqWYZW6IkOi3Mu58uotdl4+IJTvZ6ySu3X94e3J
 g/PqC5megH48TSWTA0a0hfTWmS6w2/J4/FA==
X-Google-Smtp-Source: AGHT+IFriAEMZH8Zv/Is7lzL7RiYRWbTomXRefGYi40KVJkjj1sFrZgi4AbLTX5v8af+ec6IcGKBaA==
X-Received: by 2002:adf:ce82:0:b0:3a6:d95c:5e8 with SMTP id
 ffacd0b85a97d-3b5f18ceb32mr2270196f8f.35.1752226070793; 
 Fri, 11 Jul 2025 02:27:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc1de0sm3931464f8f.24.2025.07.11.02.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 02:27:50 -0700 (PDT)
Date: Fri, 11 Jul 2025 11:27:48 +0200
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
Subject: Re: [PULL] drm-intel-next
Message-ID: <aHDZFFIHA3GnbD-f@phenom.ffwll.local>
References: <aHA-qrFQ00TaNsGr@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHA-qrFQ00TaNsGr@intel.com>
X-Operating-System: Linux phenom 6.12.30-amd64 
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

On Thu, Jul 10, 2025 at 06:28:58PM -0400, Rodrigo Vivi wrote:
> Hi Dave and Sima,
> 
> Here goes the last drm-intel-next towards 6.17. I'm covering for Jani here,
> but in the end we got just one patch that is a fix, but let's push that soon
> anyway and minimize the -next-fixes round.
> 
> Thanks,
> Rodrigo.
> 
> drm-intel-next-2025-07-10:
> Driver Changes:
> - DSI panel's version 2 mipi-sequences fix (Hans)
> The following changes since commit d6a59ee852758bc69c4cc821954db277a2bd5b93:
> 
>   drm/ttm: Remove unneeded blank line in comment (2025-07-02 13:31:20 -0700)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-2025-07-10

Pulled into drm-next, thanks!
-Sima

> 
> for you to fetch changes up to 11895f375939d60efe7ed5dddc1cffe2e79f976c:
> 
>   drm/i915/bios: Apply vlv_fixup_mipi_sequences() to v2 mipi-sequences too (2025-07-10 11:30:32 -0400)
> 
> ----------------------------------------------------------------
> Driver Changes:
> - DSI panel's version 2 mipi-sequences fix (Hans)
> 
> ----------------------------------------------------------------
> Hans de Goede (1):
>       drm/i915/bios: Apply vlv_fixup_mipi_sequences() to v2 mipi-sequences too
> 
>  drivers/gpu/drm/i915/display/intel_bios.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
