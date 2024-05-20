Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B03498CA3C3
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 23:18:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E61AC10E2D9;
	Mon, 20 May 2024 21:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jJ3ef1IG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B032C10E2D9
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 21:18:17 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2e6f2534e41so32460811fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 14:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716239896; x=1716844696; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HW+WHMVY50002e9IRpssfBbRimW3FKru0iLADUV6i64=;
 b=jJ3ef1IGIdY663HHZz1j6f5iIk9VpDc+Wzpr8hApdNSgMYT3DzGeTIE6CkORTJaFlF
 eXGAeqt+MgLMGH+N70qkzYLtnkBhJks5rtF044Bzj3c1EAbS9pFDmf23DEhQntPJJdPm
 4ogJ4uoihuRfAmNI2EIfYlqSlUfD3yFxI/1pa1iJVl9c7NkbYfBn6aTr82sAfUjJqXJE
 1IlTDVsM5xD21zXZtq0qzsH/xCUWMTSgspiZrsTDAPQeJIwNBeWrjT4+IUpZCpzlpX8p
 IoI8daRczcZjZHe7wkZimOR7FKcvNDNR4BWgzxv/SnogvqyKh7LDDvty6YvlY24EBTtu
 ApUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716239896; x=1716844696;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HW+WHMVY50002e9IRpssfBbRimW3FKru0iLADUV6i64=;
 b=pw2vieYpBZNExuWCA7yksaX+BQasZRuZX52wmOR/TlcXTepgJrbisUkdbbqluyeIG6
 e495PaeIZB+cpj2mhwhvxp09ZZbgjKV3Q9RSOTmYwkG/6I3WRKtW/3Qm4bkOQPxcLf95
 VbC4ita4mpZw+GuxoznfwiN5drB9V5YaHjuHok2/2hEotsibTuA1K41eOkvUe51dDQIU
 sqFOmirYwTCaWZUX75ExV2Rd4ir3GpnoaT9aLHxXccJ8kAcBPtRb3JtakZKy9OrrBsp4
 dODAokQF/oEVJXIsVxwxHTe8WTiYuVkfDJvsktoRjrs/on07R5W0CkyetTOCweLUW1no
 vg1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzGDvDgEAurcVVUJVEATZr0WtdnnUYvFHzXxmjv3r3WWVUZP3iUNHlQpypXDDRRkaObp8TfLBazeaDj8sVMT66BAqXbOn/dy4OAHbV+DGd
X-Gm-Message-State: AOJu0YzvMCj/NW9m/iRd+KtcsZQSrLrasgimqIOPIolb9PVUFX0EGXQZ
 b6rYezMJv45Fifb32sVmjm859M+W56Kmwls+uyX0pLskW7LsYWHt3jln/aXiHLQ=
X-Google-Smtp-Source: AGHT+IHjDaHWa60F+jHY9vRPyuZpYDge9YtHlyBxPbhzbM3teDE9hhUOJNQM1jd2KggUv9gaasw50Q==
X-Received: by 2002:a2e:a7d5:0:b0:2e1:5684:8fa3 with SMTP id
 38308e7fff4ca-2e51ff5ce98mr229404741fa.22.1716239895787; 
 Mon, 20 May 2024 14:18:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e76070598dsm639771fa.35.2024.05.20.14.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 14:18:15 -0700 (PDT)
Date: Tue, 21 May 2024 00:18:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
 maarten.lankhorst@linux.intel.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] drm/bridge: analogix: remove unused struct
 'bridge_init'
Message-ID: <tmlrvvop6lhmppwxp5pfumq4vr24rq4byiljsqn5rt72sokslz@bfqeqmfdlqdl>
References: <20240517232427.230709-1-linux@treblig.org>
 <6tfxkc3foarpfuo6viwmsm4e2ujxjmhpqsku37d4ov6ppufpjr@byrbjs7srqri>
 <ZkqAoG9ZGg0_dC-9@gallifrey>
 <la43b5ra7aziiv7dwt4o5zha3px7jarfmk45dwsf24qn6pgcre@pcmcsicjdrus>
 <ZktIwMWtQXuxCgRN@gallifrey>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZktIwMWtQXuxCgRN@gallifrey>
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

On Mon, May 20, 2024 at 12:57:36PM +0000, Dr. David Alan Gilbert wrote:
> * Dmitry Baryshkov (dmitry.baryshkov@linaro.org) wrote:
> > On Sun, May 19, 2024 at 10:43:44PM +0000, Dr. David Alan Gilbert wrote:
> > > * Dmitry Baryshkov (dmitry.baryshkov@linaro.org) wrote:
> > > > On Sat, May 18, 2024 at 12:24:27AM +0100, linux@treblig.org wrote:
> > > > > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > > > > 
> > > > > 'bridge_init' is unused, I think following:
> > > > > commit 6a1688ae8794 ("drm/bridge: ptn3460: Convert to I2C driver model")
> > > > > (which is where a git --follow finds it)
> > > > > Remove it.
> > > > 
> > > > Please rephrase the commit message following guidelines in
> > > > Documentation/process. Use Fixes tags if suitable.
> > > 
> > > I specifically don't want to use Fixes in these set because
> > > there's no need for someone to backport this to older
> > > kernels that use the original, and many backporters
> > > use 'Fixes' as an automated means to find stuff they should
> > > backport.
> > > 
> > > Other than that, is there something specific you think I've
> > > missed?
> > 
> > It's not about missing things. It's about a way it is written.
> > Consider something like:
> > 
> > The commit aaaaaaa ("drm/bridge: foo bar") has dropped all the users of
> > the struct bridge_init from the exynos_dp_core, while retainng unused
> > structure definition. Later on the driver was reworked and the
> > definition migrated to the analogix_dp driver. Remove unused struct
> > bridge_init definition.
> 
> OK, v2 sent with text close to that.
> 
> > 
> > > 
> > > (I'm also purposely being less certain here, because --follow
> > > is showing it in a ptn3460 and I don't quite follow
> > > why that changes it here).
> > 
> > The mentioned commit is a correct one. Historically exynos_dp_core had
> > been creating the ptn3460 bridge manually. Later on this was fixed in
> > the ptn3640 driver and the code was dropped from exynos_dp_core.
> 
> Ah OK; remember I don't know the actual structure of these devices
> or the history.

It's all a part of the git history. I've just read it aloud for you.

-- 
With best wishes
Dmitry
