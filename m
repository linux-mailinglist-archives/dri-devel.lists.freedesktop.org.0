Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFB99322EA
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 11:34:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1039D10E5EC;
	Tue, 16 Jul 2024 09:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="dw/wj8a0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B11C710E5EC
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 09:34:00 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3678c388f92so438431f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 02:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1721122439; x=1721727239; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YTo1qBJe2pf0XMpggooyclE70zVdFTQ0YQ7wKl/eK94=;
 b=dw/wj8a0OUv2chqqWSGJyC90QOLvf8EVwP+eeJbLYzYZ4jY+LtCfIMFop4BATUNRmk
 5MF2+7FEzxo3WNXmaYas/2i2ep+z0J+Srcv+3zIYwR6PLYUf7Txx+b4yucvBtPoOkRE1
 qESF+NAotrSFInYGATg3M4XGiJ/I+A73aIRAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721122439; x=1721727239;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YTo1qBJe2pf0XMpggooyclE70zVdFTQ0YQ7wKl/eK94=;
 b=f9Z8zCSB5ieGdQII+CTuoiEqMWpNPUeJFwOqFf0fRZ1ADFE5DS8o7MWUq++Q3sMUYc
 P5S2EtclNwCxI+DTs8XtxV2sfTt17QRHEKy/MU+tt0VH78L+OBB+Nlo6saTCM7FVRItJ
 ckxwfbuuky/nvjXDjr5ezFtQptIlC0lhWetK/IKz9L8aghl6Xl8sxQXCHH+opaBMWerK
 M5no9/VcimDRlMVYzQwukaLZq7OzBWQmkfs2EjcdZ2RGwXbBO3+mo4Vx46cZfpb30Qlc
 dCYaw1hjMdPUVuV+auP3LbuWgGsQ+mejw50JqDgA9YYwHh6TaVv3/PsaGaioIGGY2RU0
 +8rA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLFpGqZVibog5tk213hgWXIgDtLtaQ6gIM1cdlkmhbhGGVCuG71rmTvWBFG9zospToxMaWW80Bv1C338gRno8OCUpm7rizv/BwLWbwycG/
X-Gm-Message-State: AOJu0YwOwRAJGIpSm4Q+E+6FezKy1r4ybyQt1c4swP5t81PGcRbKUmnZ
 52U3t/lVfFIJxrvh+6kz1Quk+CIAeEisVwmfmIKKRDUML2Z0fxA851yHEeNqEpY=
X-Google-Smtp-Source: AGHT+IH0IljpIAUXMH9N5pq5x43eXOHgyrLFQP12+k+7pqYUnmVv/p+hrDF7ZocVOVVN41XAHs3Tag==
X-Received: by 2002:a05:6000:2a4:b0:368:4c5:b68 with SMTP id
 ffacd0b85a97d-368240cb2e3mr1110457f8f.9.1721122437654; 
 Tue, 16 Jul 2024 02:33:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dabf195sm8402598f8f.42.2024.07.16.02.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 02:33:57 -0700 (PDT)
Date: Tue, 16 Jul 2024 11:33:55 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Cc: Dave Airlie <airlied@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/test: fix the gem shmem test to map the sg table.
Message-ID: <ZpY-gzNHgJXhrcwx@phenom.ffwll.local>
References: <20240715083551.777807-1-airlied@gmail.com>
 <IA1PR11MB6418165B122159BCF7E37CBFC1A12@IA1PR11MB6418.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA1PR11MB6418165B122159BCF7E37CBFC1A12@IA1PR11MB6418.namprd11.prod.outlook.com>
X-Operating-System: Linux phenom 6.9.7-amd64 
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

On Mon, Jul 15, 2024 at 04:07:57PM +0000, Ruhl, Michael J wrote:
> >-----Original Message-----
> >From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Dave
> >Airlie
> >Sent: Monday, July 15, 2024 4:36 AM
> >To: dri-devel@lists.freedesktop.org
> >Subject: [PATCH] drm/test: fix the gem shmem test to map the sg table.
> >
> >From: Dave Airlie <airlied@redhat.com>
> >
> >The test here creates an sg table, but never maps it, when
> >we get to drm_gem_shmem_free, the helper tries to unmap and this
> >causes warnings on some platforms and debug kernels.
> 
> This looks pretty straightforward...
> 
> However, should drm_gem_shmem_free() really give an error if the mapping
> didn't happen?
> 
> I.e. just because you have an sgt pointer, should you also have a mapping?

Yes, I think only allocating an sgt but not setting it up is a bug. So the
fix looks correct, and isn't just papering over noise.

> If the errors are really just noise (form the specific platforms), and this patch is covering
> for that, then:
> 
> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Cheers, Sima
> 
> Thanks,
> 
> Mike
> 
> >This also sets a 64-bit dma mask, as I see an swiotlb warning if I
> >stick with the default 32-bit one.
> >
> >Fixes: 93032ae634d4 ("drm/test: add a test suite for GEM objects backed by
> >shmem")
> >Cc: stable@vger.kernel.org
> >Signed-off-by: Dave Airlie <airlied@redhat.com>
> >---
> > drivers/gpu/drm/tests/drm_gem_shmem_test.c | 11 +++++++++++
> > 1 file changed, 11 insertions(+)
> >
> >diff --git a/drivers/gpu/drm/tests/drm_gem_shmem_test.c
> >b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
> >index 91202e40cde9..eb3a7a84be90 100644
> >--- a/drivers/gpu/drm/tests/drm_gem_shmem_test.c
> >+++ b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
> >@@ -102,6 +102,17 @@ static void
> >drm_gem_shmem_test_obj_create_private(struct kunit *test)
> >
> > 	sg_init_one(sgt->sgl, buf, TEST_SIZE);
> >
> >+	/*
> >+	 * Set the DMA mask to 64-bits and map the sgtables
> >+	 * otherwise drm_gem_shmem_free will cause a warning
> >+	 * on debug kernels.
> >+	 * */
> >+	ret = dma_set_mask(drm_dev->dev, DMA_BIT_MASK(64));
> >+	KUNIT_ASSERT_EQ(test, ret, 0);
> >+
> >+	ret = dma_map_sgtable(drm_dev->dev, sgt, DMA_BIDIRECTIONAL, 0);
> >+	KUNIT_ASSERT_EQ(test, ret, 0);
> >+
> > 	/* Init a mock DMA-BUF */
> > 	buf_mock.size = TEST_SIZE;
> > 	attach_mock.dmabuf = &buf_mock;
> >--
> >2.45.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
