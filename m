Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA453167AB
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 14:14:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826F16EC85;
	Wed, 10 Feb 2021 13:14:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BCC26EC83
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 13:14:15 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id 7so2523477wrz.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 05:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=yd/N+I5kkzyOJpCnRN7vd7lwOUGF6B7BATQPc1K2fYQ=;
 b=Ku2flnqwc5D6z3d9GmRgcHXuXbDphKiJCNyjgnzoxVdwxDs/52BrDyb7OcLZWnkYAz
 UR5IZLaVzdRpurLn7fxlbf1b3mo/RM5L29GsZ6tgTpsyMRaO55uRbNi615w5EEGuzuiH
 EftzrNQu9uZtxv0u8BEWObc6EWl1rD8xoM1xc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=yd/N+I5kkzyOJpCnRN7vd7lwOUGF6B7BATQPc1K2fYQ=;
 b=Z0uFXxdm8RBA55CYXRqmD97HAUC3571UUpkaxAYPMc/NOp9ixjHwoszroyA1XZ+X5l
 o3GdzywOZP8Pb8C3lZKCxRPoLq0DSsXBUX5UyOTQjL6b/bJFYs0o+T8dsp+ldPtig4hb
 w0d15ZfS735/vqif9qwk69v8tEg3YHZIfh4i3fQYHBziCQ7o1YsEz5jBSMspQffVO2xm
 rEYOD8Y7n/xlnxBs1lsao5NxdrXipeIc/+/GYv7dzubqZpDNrhaXOf3GSkEQarpc3+6C
 YUG5aErd07zNCmtLsdPuvBah77T0UDN7CuCoFKbs380TfSYJJcxGP1ZwX9rd9DoMUVdI
 0v8g==
X-Gm-Message-State: AOAM5319cCq3JrvA8vApZbYf4/JT4WXPPKgU3vUEG66O/kvhjsWoZEiQ
 HUZiqSshYc2WZbjOcjHpcxR7sw==
X-Google-Smtp-Source: ABdhPJzaMMmb4JfbfYiORqaQNccdJmyShOrVZsJEkutd675pXDThmmVuBjfO9+5KkU1bjFmrTMFG0A==
X-Received: by 2002:a05:6000:1374:: with SMTP id
 q20mr3489704wrz.44.1612962853806; 
 Wed, 10 Feb 2021 05:14:13 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r1sm2894759wrl.95.2021.02.10.05.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 05:14:13 -0800 (PST)
Date: Wed, 10 Feb 2021 14:14:11 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 0/3] drm/ttm: constify static vm_operations_structs
Message-ID: <YCPcIwxso67M3VqR@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 David Airlie <airlied@linux.ie>,
 Alex Deucher <alexander.deucher@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Likun Gao <Likun.Gao@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
References: <20210209234817.55112-1-rikard.falkeborn@gmail.com>
 <e819cb08-98b6-c87d-4d95-338e06f88a48@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e819cb08-98b6-c87d-4d95-338e06f88a48@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, Ben Skeggs <bskeggs@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>, Likun Gao <Likun.Gao@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 10, 2021 at 08:45:56AM +0100, Christian K=F6nig wrote:
> Reviewed-by: Christian K=F6nig <christian.koenig@amd.com> for the series.

Smash it into -misc?
-Daniel

> =

> Am 10.02.21 um 00:48 schrieb Rikard Falkeborn:
> > Constify a few static vm_operations_struct that are never modified. The=
ir
> > only usage is to assign their address to the vm_ops field in the
> > vm_area_struct, which is a pointer to const vm_operations_struct. Make =
them
> > const to allow the compiler to put them in read-only memory.
> > =

> > With this series applied, all static struct vm_operations_struct in the
> > kernel tree are const.
> > =

> > Rikard Falkeborn (3):
> >    drm/amdgpu/ttm: constify static vm_operations_struct
> >    drm/radeon/ttm: constify static vm_operations_struct
> >    drm/nouveau/ttm: constify static vm_operations_struct
> > =

> >   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 2 +-
> >   drivers/gpu/drm/nouveau/nouveau_ttm.c   | 2 +-
> >   drivers/gpu/drm/radeon/radeon_ttm.c     | 2 +-
> >   3 files changed, 3 insertions(+), 3 deletions(-)
> > =

> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
