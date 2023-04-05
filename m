Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A817D6D868F
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 21:10:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7386510E30C;
	Wed,  5 Apr 2023 19:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC18C10E194
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 19:10:27 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-930bc91df7bso120615766b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 12:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680721824;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ribtM2ZbcoOXE/IBijsaPUPjSn+wX+sRLQSIjtDYVwI=;
 b=lgYuElktQ/Ibf1pPS9rq9zwcEc7ZmyNsvCKJgBMpaYoOTVLgy6XvcqRATkd4uTkwmH
 Hv+6Ii9mCbrXLSvQQld1B5V/LkklYkicH8xvVCtRmsB0r2/rfnnP2anOoZFhm1Mtn6M2
 Fs6M5+3pb18mSkzj5J/+jnB/sgG4tnNYXJZ3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680721824;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ribtM2ZbcoOXE/IBijsaPUPjSn+wX+sRLQSIjtDYVwI=;
 b=QrK0g1AI6xDCn0zfInvuCHaUTKGoPhwcsvtnD3PtA6nWpEjMupaB2feUREtPb2baz1
 1PEZn3tSo+/ciZYrVvlbX7dkCuegm++t4nSwqDvRCCvpGJyFUWenJCvdxJjUtxwR7fDe
 SqxNnBQQrz6jNXVn/59daaF4ETEu0MCG3nSdXo+sOnh7RUNZUgZoSxmzSRBsjXYELAt6
 L6RT/MRfeDzoLgnlKqB2nK95KtCnuC12H8qyCbW+eJJBadpcR953RzikqZFeGW1D2Dvj
 1WAGWRcHuTWzDSkgEbW2dZgiWaBpK+bywUQqCzRppqYWIYB0U90KuKGn+4f5A+8XYke/
 3pZA==
X-Gm-Message-State: AAQBX9ffOeHG1bediFpxuCF/3T1cXizHy5Y+EtsRxrZQLHjyM5KzUADR
 Ws5HPA8/NgrpJOulQXN6z6WMYQ==
X-Google-Smtp-Source: AKy350ar9gkRn2bq9ty233NJkg43ocKb9/5QDKbUUXXL6+rbYyRxizZGLN8AJD/Uk2adPxUJ7TzaPg==
X-Received: by 2002:a17:906:7381:b0:930:7f40:c1bb with SMTP id
 f1-20020a170906738100b009307f40c1bbmr4176699ejl.4.1680721824233; 
 Wed, 05 Apr 2023 12:10:24 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 ty25-20020a170907c71900b00948ca65d61fsm3842640ejc.140.2023.04.05.12.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 12:10:23 -0700 (PDT)
Date: Wed, 5 Apr 2023 21:10:21 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PULL] drm-misc-fixes
Message-ID: <ZC3HnRtVkwBCVuJQ@phenom.ffwll.local>
References: <20230405182855.GA1551@linux-uq9g>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230405182855.GA1551@linux-uq9g>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 05, 2023 at 08:28:55PM +0200, Thomas Zimmermann wrote:
> Hi Dave and Daniel,
> 
> here's this week's PR for drm-misc-fixes. As requested, it comes
> a day earlier than usual due to Easter holidays.
> 
> Best regards
> Thomas
> 
> drm-misc-fixes-2023-04-05:
> Short summary of fixes pull:
> 
>  * ivpu: DMA fence and suspend fixes
>  * nouveau: Color-depth fixes
>  * panfrost: Fix mmap error handling
> The following changes since commit 25bbe844ef5c4fb4d7d8dcaa0080f922b7cd3a16:
> 
>   drm: test: Fix 32-bit issue in drm_buddy_test (2023-03-29 17:14:15 +0200)
> 
> are available in the Git repository at:
> 
>   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-04-05
> 
> for you to fetch changes up to 0ec8671837a61d841462179686c5819d951d3b10:
> 
>   accel/ivpu: Fix S3 system suspend when not idle (2023-04-05 09:07:26 +0200)

Pulled, thanks.

> 
> ----------------------------------------------------------------
> Short summary of fixes pull:
> 
>  * ivpu: DMA fence and suspend fixes
>  * nouveau: Color-depth fixes
>  * panfrost: Fix mmap error handling
> 
> ----------------------------------------------------------------
> Boris Brezillon (1):
>       drm/panfrost: Fix the panfrost_mmu_map_fault_addr() error path
> 
> Jacek Lawrynowicz (1):
>       accel/ivpu: Fix S3 system suspend when not idle
> 
> Karol Herbst (1):
>       drm/nouveau/disp: Support more modes by checking with lower bpc
> 
> Karol Wachowski (1):
>       accel/ivpu: Add dma fence to command buffers only
> 
>  drivers/accel/ivpu/ivpu_job.c           | 18 +++++++-----------
>  drivers/accel/ivpu/ivpu_pm.c            | 26 +++++++++++---------------
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 32 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/nouveau/nouveau_dp.c    |  8 +++++---
>  drivers/gpu/drm/panfrost/panfrost_mmu.c |  1 +
>  5 files changed, 56 insertions(+), 29 deletions(-)
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Felix Imendörffer

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
