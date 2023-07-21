Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD2875D75E
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jul 2023 00:20:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C61D10E70A;
	Fri, 21 Jul 2023 22:20:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE1C10E709;
 Fri, 21 Jul 2023 22:20:20 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-5634808e16eso1560274eaf.2; 
 Fri, 21 Jul 2023 15:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689978020; x=1690582820;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=l6xRYi4aCBF7mvF9Wq1OcAPDild54ArRewQg4E7JKv4=;
 b=KkHPlyzjqy+65JjxuJgW31Z63b8E8dgBPO23fclVK63J02CdQ4bxPgkvvAcvKpvVB8
 KLce+Y4ZAIlKYS25+ziMYw/Ue1uBPq8EvSWA7k4Zot0rP9lRUYXzVhQLw8oH9wPhebx8
 NDFJS1ksZygEE55Cy7PS8rPXlxFm8JFiH6/TRQoEg+hvZzcGB/KgAwgGaynsy1r+ZgBH
 jwlXF+OvqxKXIamZwRS/075w9H0D/NVYXwuSCjD5K8KsvkhjJBDJSTHZEACzM1+Kfw+n
 WrDXkZg+aWxz2TFpOjN4Jhi7B4IQ3R8WYEVmN/7/EbmWj6bSLy9fgmRv/x1Ll42WXGhL
 EZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689978020; x=1690582820;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l6xRYi4aCBF7mvF9Wq1OcAPDild54ArRewQg4E7JKv4=;
 b=j7l8vQG+akVwqqaGm5YHT502txaX9FU3eH7EczZp4UEen0C4rNVJUdaz8CN9gx5TsB
 0+G28j2Td+EPtOiBtzKO6j84zUp+LHmQolqipwjRUTVYwxwqSEOIoQ59qJuaUFtAxYN0
 x0yAG5id1v/8sAxEU2gEtTiPsV6fLWQg7p/MBFBAFpUh5kImmH7C/1QgJpVFQ5ZLbtRr
 8HeOhFHUnB80yNxLH16tX9whjYExJJgPWlle2MlY0/PsIaVkfO3jMbJxOH8xP7X7nz3Q
 7srBuvj4qIteQQpo9h+RXNARkLEm3BS/aq/qfvg1NeE2k/GIFFD/TcPSR/qK/GJ2Blie
 ya8A==
X-Gm-Message-State: ABy/qLYKorzqHYGeY7O2SchTFU0fVp3A8wi8KaWHdG83F5xhVd42nmmM
 meSdpNswDLen6jr9Ly8XnuY=
X-Google-Smtp-Source: APBJJlHG/FUT0SIeokqX+Gveor3YszwCmqC1hRKDFYWP3alGEuI2TPEvl8+5TiGfMTURGVBjk9E0Fw==
X-Received: by 2002:a05:6808:200d:b0:3a4:8590:90f2 with SMTP id
 q13-20020a056808200d00b003a4859090f2mr4502985oiw.47.1689978019839; 
 Fri, 21 Jul 2023 15:20:19 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:fbd8])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a17090a6d0200b002676e961260sm5041674pjj.0.2023.07.21.15.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jul 2023 15:20:19 -0700 (PDT)
Date: Fri, 21 Jul 2023 12:20:18 -1000
From: Tejun Heo <tj@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH 15/17] cgroup/drm: Expose GPU utilisation
Message-ID: <ZLsEomsuxoy-YnkA@slm.duckdns.org>
References: <20230712114605.519432-1-tvrtko.ursulin@linux.intel.com>
 <20230712114605.519432-16-tvrtko.ursulin@linux.intel.com>
 <ZLsEdJeEAPYWFunT@slm.duckdns.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZLsEdJeEAPYWFunT@slm.duckdns.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Kenny.Ho@amd.com,
 Dave Airlie <airlied@redhat.com>,
 =?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Intel-gfx@lists.freedesktop.org,
 Brian Welty <brian.welty@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Zefan Li <lizefan.x@bytedance.com>,
 Johannes Weiner <hannes@cmpxchg.org>, cgroups@vger.kernel.org,
 Eero Tamminen <eero.t.tamminen@intel.com>,
 "T . J . Mercier" <tjmercier@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 21, 2023 at 12:19:32PM -1000, Tejun Heo wrote:
> On Wed, Jul 12, 2023 at 12:46:03PM +0100, Tvrtko Ursulin wrote:
> > +  drm.active_us
> > +	GPU time used by the group recursively including all child groups.
> 
> Maybe instead add drm.stat and have "usage_usec" inside? That'd be more
> consistent with cpu side.

Also, shouldn't this be keyed by the drm device?

-- 
tejun
