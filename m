Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F26EEB2053C
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 12:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ABC410E41D;
	Mon, 11 Aug 2025 10:24:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="noUxyBNj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51C1C10E41D
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:24:45 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-458c063baeaso23196505e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 03:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754907884; x=1755512684; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=HBe9czUDzx4VIYaunJNZUgByUfhVqy3wgTZDB39K9Kw=;
 b=noUxyBNjChINIIsyhf6wZ+XEPHeb92YAaJL0CWZXSOJrNYGJMrcEAEHzy5YJppyLiB
 3f54UcQjWa3Ww1VrXSBVAhGERqzkmoz545ZCnBWLsQa4DDokn0ZzTjN8dRQnytoio6PZ
 tH/tamczxfwl0d7hga3xX50kQkbMAPRLtROEmbAwJNBmLbowj4HNp/HMfMV/Rx+MeEB3
 PMUuDtcxeXnvvNWHvWL2BNCJEXLyKsAWIALks9MeZlV51A/YDz3f7WEWZnQIywSHypS5
 DKXkJhlW5KYgEtIQmKqM4IR74ZZKlinJsJVd1BsVKlP3H4ZNEZI+/9KvTFvB6xi1CCdx
 11cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754907884; x=1755512684;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HBe9czUDzx4VIYaunJNZUgByUfhVqy3wgTZDB39K9Kw=;
 b=G6BDoSj5KrJavAz7bbUL3oOV/VKp1oT0twE1GfjeD4A6HdF5Vvqbsthu4gJ8nVcu03
 yGoYZZi9bCWoFhJdMpvxZPCUKKWh+7SV7nyRXBY2cz4e9nNEjC5xemqx+RQKLJ9jVAqC
 evuO/5PkPJ0w5n1oO8Rt1qCOOeDt8HyjOIAwpuscyBs9wytWXu9CS705uDyi9Zogwgz0
 CCk52uLX9d0smjS4XRpZFehvxnETO+AyxPxKF2lV+DSrHNnmYNmfWS5iSPVijEuC+BDz
 OWYfaWExQDOmUaPbJWm7JaNzRK/+GmSODthZvBfqIoqvO+cwNahmSZ1w2+2kCxPBcJom
 dmKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWOoh9R/RBPsfSXMlQaOWb6yNuELwm9MTGG3SPMeUD7tm+SSZ/FwHFKgL6JaujTnzs6Dz5E/TsVXQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5jK2CyPcpuXsRZEg1E3b8cnHLsQQixVbdBZ9+bK/EMtU6lQpu
 KrkUrbctWI4vr+h2Ct/7DAqXiC11dCIo0NYHGicxPEOf8nm5iBgBFGRErpCQOw5K
X-Gm-Gg: ASbGnct5k0cQR6HFCZnkTUvcymME7svhDRV+/SEADFnwUf4iIel2ePr1xzbPtrfQJku
 dn9GGISkkHkEigyBDlqbsuOBw9Qh2FJvDiveJLV8iahGWADvHSh4a8zk8li/xBrNDI3L6p8nNIs
 kcmt1tn61v6vm0+4EySJBoeuCRWg+A0GaqmYMdT/oOTMb+bqIxg60egrRtXUb3Hj7qMOzkNGU7C
 7mdpGkYX4XiJ1qNQRTOmAGdbRxcxeSU2piU8uOnV31bENkAe8I+gNP1vhWXc/KRJIL+tWEBuj5L
 4R43JStjcpJ7DudcYAAngHOKA8dlmwV3aX4G2ZICj6tyQRaV5J5rl+LVQWh5HsxqEG809pl+DA9
 Pe+0fc2MAywAVMfmrZMs=
X-Google-Smtp-Source: AGHT+IFUPHEEiAr26JDbR4Tv1T2rbVTYYcdhOCQ0HeIDjGQzbNBbDgyPBzabITYI3btFT1OS8u/kKg==
X-Received: by 2002:a05:600c:1912:b0:456:18ca:68db with SMTP id
 5b1f17b1804b1-459f4eb3ce1mr109619375e9.8.1754907883569; 
 Mon, 11 Aug 2025 03:24:43 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5873c43sm268177675e9.22.2025.08.11.03.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 03:24:43 -0700 (PDT)
Date: Mon, 11 Aug 2025 12:24:41 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org,
 cristian.ciocaltea@collabora.com, gcarlos@disroot.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/tests: Fix drm_test_fb_xrgb8888_to_xrgb2101010()
 on big-endian
Message-ID: <aJnE6Uu_WutFA06X@fedora>
References: <20250630090054.353246-1-jose.exposito89@gmail.com>
 <20250630090054.353246-2-jose.exposito89@gmail.com>
 <9467c5f1-fb70-4698-a611-80f9be499b22@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9467c5f1-fb70-4698-a611-80f9be499b22@suse.de>
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

Hi Thomas,

On Mon, Jun 30, 2025 at 01:37:58PM +0200, Thomas Zimmermann wrote:
> 
> 
> Am 30.06.25 um 11:00 schrieb José Expósito:
> > Fix failures on big-endian architectures on tests cases
> > single_pixel_source_buffer, single_pixel_clip_rectangle,
> > well_known_colors and destination_pitch.
> > 
> > Fixes: 15bda1f8de5d ("drm/tests: Add calls to drm_fb_blit() on supported format conversion tests")
> > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Just a friendly reminder about this patches. Can I merge them?
They have been in the ML for a while and it doesn't look like
there are concerns.

Best wishes,
Jose
 
> > ---
> >   drivers/gpu/drm/tests/drm_format_helper_test.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
> > index 86829e1cb7f0..981dada8f3a8 100644
> > --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> > +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> > @@ -1040,6 +1040,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
> >   	memset(buf, 0, dst_size);
> >   	drm_fb_xrgb8888_to_xrgb2101010(&dst, dst_pitch, &src, &fb, &params->clip, &fmtcnv_state);
> > +	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
> >   	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
> >   }
> 
> -- 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
> 
