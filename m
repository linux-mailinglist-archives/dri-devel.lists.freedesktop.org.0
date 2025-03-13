Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA2AA5FA5A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 16:46:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F8DC10E1EF;
	Thu, 13 Mar 2025 15:46:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nkpHZygI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4760D10E1EF
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 15:46:18 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43d0782d787so10558525e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 08:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741880777; x=1742485577; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-disposition:mime-version:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M1s53A4pO9sz2b44+AGVFc/j+BP4+7/TZwMsppe6om0=;
 b=nkpHZygIjkaCnKMa+QkP1YA6it8Ysk2GBJvpC0sUUe+7bdsrKQJTaOSXRA9ymlqt1Z
 g44lKLTy3JwGezxKbfx4VO8ImxlcUUVkJ4RNtrEMzsNxhCP6IrSFoJYnwc4k3hmWvWkd
 hM18ys0HfEDwKcedjKZhUW84lYH3SkEBOKDMImzATrzxCc+C8WQ7o/xG24p7O9zuv6Ti
 W05HOzOacL3Ip1PBamdoDPT4Kg8c6Z6MZLdZkR0E7mgmkW7XqsOezfJW6R9DPkpLE1SQ
 vWgugfyFh4sgytcfaZpF0siHNjqvJfBZEHyv3VPkVkloPBief+bo2mBjIXU0Yo7jSi7V
 cX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741880777; x=1742485577;
 h=content-transfer-encoding:content-disposition:mime-version:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M1s53A4pO9sz2b44+AGVFc/j+BP4+7/TZwMsppe6om0=;
 b=UE7JK6Pu0IdcBovC4d0jFJMdTeWY72be1QAvHr3WChKVV6qJuoLi9nxt+OlcpauwtO
 HwmwGKfmuCurV+h+QHcB1YoInxyIyz/3jJERmTJVIsSDNnz5a8TvbZfZuViQu8K8x6bm
 BO/7wc3MOVbc0B4TjRX04ddzXpxoRcmXQ/jcmKOfsnDrScy22O+jlc2S+LGEKCMAjxnT
 lTt1TDKlluG1MDd/C6SR/y636qR01On+cWZzUpNYddtYG7ffEn96sds69EB7e9QC68Bt
 vD5ijNmHH9vxhKu7fWHZ61vO5k6l8CXGK/iGfBW2MgbKtezGnxKGdL9AennY5cVCvErf
 VvKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUomD5oY8sVUbMhMQZskCmH6OPoBZpR6ylXKVQHe0XyoPZqjNsaHlMAfWay59WCryA7E19C37dg0dw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBSdoSTHS3PqxIwgs1lclFdbThpsEXlZhslHOnycklbdhM9ZRu
 wtccUS5psmj5INvvm064RGgfBXEELYKSTt0WVtjRZsLrQX+jaQ4/
X-Gm-Gg: ASbGncvSDePAvkCTgfsAPdhvd6UwLcqkAEBTRLdDO0iEbxha0Tns5KqnwNjCxQAlVSa
 pz/RlNpPcsdpYxBaglCA6oAUJR9h+ukcoV1dI/bJUNVJTE9JgezVEbb2DTyqXGWUaxUav748UMb
 iYP4+zGiAdZ1DymBFIZWnmGs/kJnIFGe0op6DDIGYOQYJbYlNEKbgCnDffLTpEf5IO3sRitdJus
 QWbJE6Y7n7CNITiBzg1kL1CIlq/8ogq+PFXGP0u+GglMNI+yaGWka8Z82YmgNcKoFxc1RhbzTu4
 +6sCZQ+R1UflBMaEAXZCZ0HC82Sy6aK6oOjMlVFcVJRnNYdD
X-Google-Smtp-Source: AGHT+IH9dnsaN8JCZkVtg0IE9aoEMip4K1WYukBLvgiu5/zN5ZSL4K/lbc/jZ3sa2EhUb4p6J5NbwQ==
X-Received: by 2002:a05:600c:1ca4:b0:43d:b32:40aa with SMTP id
 5b1f17b1804b1-43d1d88ea8fmr1733475e9.3.1741880776361; 
 Thu, 13 Mar 2025 08:46:16 -0700 (PDT)
Received: from qasdev.system ([2a02:c7c:6696:8300:41ee:4f4e:e8e9:935f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d188bb59esm24797935e9.21.2025.03.13.08.46.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 08:46:16 -0700 (PDT)
Date: Thu, 13 Mar 2025 15:46:13 +0000
From: Qasim Ijaz <qasdev00@gmail.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: ray.huang@amd.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, thomas.hellstrom@linux.intel.com,
 Arunpravin.PaneerSelvam@amd.com, karolina.stolarek@intel.com,
 jeff.johnson@oss.qualcomm.com, bigeasy@linutronix.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] drm/ttm/tests: fix potential null pointer dereference in
 ttm_bo_unreserve_bulk()
Message-ID: <Z9L9tbL7fWxw3yb4@qasdev.system>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Reply-To: 6a24d733-88ef-4cfb-8cc8-1c01fb64fc0f@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 13, 2025 at 03:20:34PM +0100, Christian König wrote:
> Am 11.03.25 um 20:01 schrieb Qasim Ijaz:
> > In the ttm_bo_unreserve_bulk() test function, resv is allocated 
> > using kunit_kzalloc(), but the subsequent assertion mistakenly 
> > verifies the ttm_dev pointer instead of checking the resv pointer. 
> > This mistake means that if allocation for resv fails, the error will 
> > go undetected, resv will be NULL and a call to dma_resv_init(resv) 
> 
> The description here is correct, but the subject line is a bit misleading.
> 
> Please use something like this instead "drm/ttm/tests: incorrect assert in ttm_bo_unreserve_bulk()".
> 
> > will dereference a NULL pointer. 
> 
> That irrelevant, an allocation failure will result in a NULL pointer deref anyway. This is just an unit test.
> 
> >
> > Fix the assertion to properly verify the resv pointer.
> >
> > Fixes: 588c4c8d58c4 ("drm/ttm/tests: Fix a warning in ttm_bo_unreserve_bulk")
> > Cc: stable@vger.kernel.org
> 
> Please drop those tags. This is just an unit test, not relevant for stability and therefore shouldn't be backported.
> 
> Regards,
> Christian.
> 
Thank you for the feedback Christian, I will resend a new patch with the
changes you described.

Thanks,
Qasim.
> > Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> > ---
> >  drivers/gpu/drm/ttm/tests/ttm_bo_test.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> > index f8f20d2f6174..e08e5a138420 100644
> > --- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> > +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> > @@ -340,7 +340,7 @@ static void ttm_bo_unreserve_bulk(struct kunit *test)
> >  	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> >  
> >  	resv = kunit_kzalloc(test, sizeof(*resv), GFP_KERNEL);
> > -	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> > +	KUNIT_ASSERT_NOT_NULL(test, resv);
> >  
> >  	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
> >  	KUNIT_ASSERT_EQ(test, err, 0);
> 
