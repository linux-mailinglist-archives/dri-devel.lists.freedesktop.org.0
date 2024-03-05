Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B3F872620
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 19:02:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33BD610F49E;
	Tue,  5 Mar 2024 18:02:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.b="aI8/vsEf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D63D1123B2
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 18:02:25 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1dba177c596so163175ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 10:02:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709661744; x=1710266544;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:dkim-signature:date:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YJ70Tv4h5AKfiBQVV4/s2rwMqfxMbFKTboyKv27NZLU=;
 b=Oc8XAr1oNmucjH59ZL58jbsaN7bMaQjgT4L6m1xWJwN5BYMp3jG4xzkYmf7ZT9yeWP
 c3LXKv7eNE8H8x5FdI7z5ald4VPBqOfNDBVd6XprrUdfgvZiRxjNrbVGmhZmf+WzG3Ud
 Q4FHNLvJ0Q98DaWAuAQ/CRnfIur6Ap3QzrA2PRIT7dKv5W6T3PPVHwn1N0yKlQojggi9
 eUogxV72JNVNLLonu78VpqjsyxC2A4h4FAY0U6iSWEkRPP/ehllCJ0EoputHFVUFKaFH
 1nYOATWg1GeIaxqp7uhgwOgQRTF2Ri+mgdLq9YgIOCnBMvUduwmZ962W5uAzpr9vr/yD
 H8tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkeknTEcNzEGfBtvtLi/vT4a5PI6pDiGMHsYoSyx3ZxoT0bhIK+CR3xErFshyVqf2j9Th0NxetGgf1bS2uGPpHsTV21/HXCNY2m6TrBxVx
X-Gm-Message-State: AOJu0YwZykRdJiSUHmW+qc0iOAWOoeKzVHEtm09CY8PGEUEmlME8LPRp
 tQxvPxIze4tCGZBjLIU1AHToXOj6HnIZOjXY2pi0G95XMFYgLNl7
X-Google-Smtp-Source: AGHT+IE+QeWdybpOmeVBdSyQw2r7Ej1xSRJHaUNhk4fq9R6Iz6FjMOYAhuLG29kBbDSLUmIvi0ExUw==
X-Received: by 2002:a17:903:1cc:b0:1d9:a15:615d with SMTP id
 e12-20020a17090301cc00b001d90a15615dmr4010129plh.1.1709661744304; 
 Tue, 05 Mar 2024 10:02:24 -0800 (PST)
Received: from mail.marliere.net ([24.199.118.162])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a170902ea0e00b001dd38bce653sm28566plg.99.2024.03.05.10.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 10:02:23 -0800 (PST)
Date: Tue, 5 Mar 2024 15:02:18 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
 s=2024; t=1709661742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YJ70Tv4h5AKfiBQVV4/s2rwMqfxMbFKTboyKv27NZLU=;
 b=aI8/vsEfN/Bld3c1dh2lfn+V3skU5KzIAqhIHcK7NAjAqJBfROsAnrKyK4eQ+UyoGoN+NP
 zzlbhCR32haBdY7hr8R76en3m52BMB2qTNeH1riF0Yo4h/OL1vI/mWmODXCQHNS+kipiA1
 eymqvBd6Un7r1WO2rW64vrCVs1RTBYhhHa5VzXn6zajrWFIiu79tGxfvIsfxqXPmL0AlKs
 N2m7SPUbPh7LCr6ibTBZNTbKPxaVqX5e/9ntlV71Z0VfXAi7iszHHGH6a5F959mB1mZr1G
 gXGLiFS6K0vFVxf9oxGTPFiWjVIUttDTGYfNoknFC+wlLnCrwH6+HqoE0dMHFg==
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
From: "Ricardo B. Marliere" <ricardo@marliere.net>
To: "T.J. Mercier" <tjmercier@google.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Hans de Goede <hdegoede@redhat.com>, Helge Deller <deller@gmx.de>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH RESEND drm-misc 4/4] dma-buf: heaps: make dma_heap_class
 constant
Message-ID: <gdkioaqffaoiocsybn22qwfpkgz6cujy5oklrdicgdcbatlsan@v7qjtak5jacn>
References: <20240305-class_cleanup-drm-v1-0-94f82740525a@marliere.net>
 <20240305-class_cleanup-drm-v1-4-94f82740525a@marliere.net>
 <CABdmKX0VGyBdTo8gzEocyz2HFcqEtu_31PYVjWzioBdCbnXW6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABdmKX0VGyBdTo8gzEocyz2HFcqEtu_31PYVjWzioBdCbnXW6w@mail.gmail.com>
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

On  5 Mar 09:07, T.J. Mercier wrote:
> 
> Reviewed-by: T.J. Mercier <tjmercier@google.com>
> 
> Is this really a resend? I don't see anything on lore and I can't
> recall seeing this patch in my inbox before.

Hi T.J. thanks for reviewing!

I'm sorry about that, I sent the series only to Greg before but I
thought it had Cc'ed the lists as well. Then I realized it was sent
publicly only once. Double mistake :(

Best regards,
-	Ricardo.


