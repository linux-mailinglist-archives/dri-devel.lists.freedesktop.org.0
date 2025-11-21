Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F426C7B21D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 18:51:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1760910E008;
	Fri, 21 Nov 2025 17:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cM0CQeBK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BF8D10E8EF
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 17:51:12 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-644f90587e5so3615280a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 09:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763747471; x=1764352271; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9syd0iDwsyEu4s/8iEAd1AcquGv2uEIeHc2ss2ClUv0=;
 b=cM0CQeBKp7WDHvn05RhwCqY1wq3MPQimLTE0ekrJPsoU8ZNnzg3G50Wws36UN1beca
 OopuhHXcFfzqrXLRy8iSW0oZ8FWEumcBJ3av9FnYOzZEcujNreWzJFGCzqROM8KYcKiW
 i1SVjh50/kg41vpM5TiynTRz8ja9m36g9K3WYjXW7VYCkDrxymih7NZCaTR3kvko6FJu
 LpJq75EId63usD/vBjZv4LeH+ehJU5dRVNI9bAGjz6QmlYjNcdZQkGbUKa0R+MM9Tbrh
 kn0RpVSVLxkV9+qxlsG6lGqTAFHOS8Fec2jwGK+aBJ1AzMazMYO+F524cUY+dz/f/5SR
 Kf5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763747471; x=1764352271;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9syd0iDwsyEu4s/8iEAd1AcquGv2uEIeHc2ss2ClUv0=;
 b=CII/g8SUIphFYtvpW2E0P1/CqAdsBHbWjCEx5BMcRZ/VPIWHlMeTL7Y/5MX+2dCA2d
 vTRF2bigLnL2Y1v1uGlmmffVuepLxQQ37vw9TaO4eb+nbmTs+xKTnQVJex1dX4Ad8Ylq
 7L18wB05H04rTRacuoDlrNRG+eQr0f5hmaIRDh+GHL008VuIfkdf7GKWS1HA/ofIDOF6
 TC+l61/s4eB/AMvIKY2elj8r+Zj09ETnmR9Zvl8HWoUKov61c5Gin9AdR9X6LBHtd8KJ
 eYplAmEVd4dPwHPTawfPOt1svgF1yoWhN+wvB88skmC/rBlJ80X9vdk4LRXmfTLh2H40
 5O1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHrmlsfc7mAu3KxwBmTXgAZ2fyTVUgYbAq1/VFj4+7ia2pWehpTI0WddV97yS1nXuPvKqyFMHwgfw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKkFgWaaPlE359iG5SrSlvu4f0R5qG8tASxLg0mt5eQUYXk29D
 29WD3KCOHVCno1MSfbn4dUotQyW4jlWRLY6Ehg536YwlNH54osuuyHfeYh7k75X38aLDaFS3AHT
 SEScd3OXIL6GHRanaMzvo27w+zswm9aQ=
X-Gm-Gg: ASbGnct24VXf9c1JGpstB4XUVBnJFznwHHAnzeDzHw4QweG0IWU5/PxJjiSH/5JpBGM
 +8zLjSdzbuOuFoGG3Wckrs3f9nKPRLdMYyThR0Hg6lYmB3Nv3JWqAaecdUi7kVz4u/SJoodZtC9
 Wcfp8AoriaGCGK3AO6f7NVwaIoZwqLj+Rly0MzRhEBWEDl7R3EQ9YVVnZ2WsQELbSNly7SPM6wB
 Y9wyZqsYbCDrWQwLMXcpMwmOrICx5UmlG2keYn6vbuxX29r4pGySgEKFR/gveGnOFAcUNBUT+4h
 peV3f47h69DothrsJ/yEGKjkpC8TZg==
X-Google-Smtp-Source: AGHT+IF3hROYoDCS1hO41P1oM8NXxKoOBwYdjkSygtTGJdSCz+R5viMeN+1Yw/VFITJkAcfVYyLIW4VR2yoQ0cXw6J0=
X-Received: by 2002:a17:906:dc89:b0:b73:6b85:1a9a with SMTP id
 a640c23a62f3a-b7671591ebemr330236166b.21.1763747470654; Fri, 21 Nov 2025
 09:51:10 -0800 (PST)
MIME-Version: 1.0
References: <20251115000237.3561250-1-alex.hung@amd.com>
 <cbe00ac4-a535-47d3-813a-e2eda7e9b991@amd.com>
In-Reply-To: <cbe00ac4-a535-47d3-813a-e2eda7e9b991@amd.com>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Fri, 21 Nov 2025 18:50:59 +0100
X-Gm-Features: AWmQ_blPOyJRHHyAhmzIMJ97nbk2_s8DU5jtcmQ-QZC3hMwvXMbdNW-TOUolRQ8
Message-ID: <CAFZQkGwRbuE9Whp0YNMA9Q8074B_c3+MhzzUQ_Y+gHaBkogKuQ@mail.gmail.com>
Subject: Re: [PATCH V13 00/51][FINAL] Color Pipeline API w/ VKMS
To: Harry Wentland <harry.wentland@amd.com>
Cc: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org, 
 leo.liu@amd.com, ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com, 
 contact@emersion.fr, mwen@igalia.com, jadahl@redhat.com, 
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com, 
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, 
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com, 
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, 
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com, 
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com, mcanal@igalia.com, 
 nfraprado@collabora.com, arthurgrillo@riseup.net
Content-Type: text/plain; charset="UTF-8"
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

Am Do., 20. Nov. 2025 um 21:13 Uhr schrieb Harry Wentland
<harry.wentland@amd.com>:
> Xaver, are the kwin patches ready to be merged?

Yes. I'll need to take another look at making the rewritten KWin->KMS
color pipeline matching algorithm easier to follow, but I split that
out into a separate commit, and basic support for drm color operations
is ready to be merged (the only thing the basic version can't do is
tonemapping, but it's useful without that as well).
Just to be sure, I also tested it again on top of the latest kernel
patches and it works as expected.

- Xaver
