Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 586C439AC65
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 23:11:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2AEC6EE9E;
	Thu,  3 Jun 2021 21:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08ACD6EEAA
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 21:11:53 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id c5so7174064wrq.9
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 14:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=qo81W0COu/9T+MtdH15dWO35zb4IKBH3tap7L13Ay+g=;
 b=Ep1C99k65ha6o9n/Xnv083Ka95kqOxU0nc+P1Su4LgSF7LEKJoAw+0C8/4y3YWA1Uk
 9jmI+6Kg3RoJYHfcWvod76BaO3A0UqaPypcfqM4GZ8bcRyRWiPfoGo4yubuBwZwQAuBH
 WuAqsi7sTEuX8lJzK1mBf4J7nel1IMd5d6hks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=qo81W0COu/9T+MtdH15dWO35zb4IKBH3tap7L13Ay+g=;
 b=kMSAm4vAgJ4E1cRMOYixWOrEbVYrgkfJYabSHW1HtxgpP4h9Tm6bXV1v9hbzI4NOVx
 /PvmSWg4Imu8/ALNFZzllo4/7wO9Wzt+Bdoxro6TeZTSMOeUV2XQWHyjx2ikvkKiG/uX
 nZ7n7KbngJPi9Jaf39A8PyxBLakmDHSBBgVjrYetA4Amsbn7AWTz39QsHoNKEJPNbgIH
 w0WXDsXtPov9b5re97xMa7DWQll40Bv9CLYMPTF7H+DOLGVVDjjkcJgmawHsO2vkn1Xn
 y54Xcq8Hr/COwzs4fnzacCqIMPS0oPdmGPD/4yQVn/iQsECxZs2e1AjvQYGeHB7dBs7Q
 QzQQ==
X-Gm-Message-State: AOAM530U+lsyE4AsvinS9kff6n5CU+bbQhdJV5Tu71B6uinnfmk79HmV
 o9FC7XbZNrrTmkyH2SyF2ziR2g==
X-Google-Smtp-Source: ABdhPJx8yjSE12ygh5q4XzGrGDcVw6g7J7uRZbzliCwqbFJIqvVK1qA/BT1I8/4oa8K2GVWvDzxesA==
X-Received: by 2002:adf:a489:: with SMTP id g9mr387883wrb.103.1622754712405;
 Thu, 03 Jun 2021 14:11:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a1sm5056623wrg.92.2021.06.03.14.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 14:11:51 -0700 (PDT)
Date: Thu, 3 Jun 2021 23:11:50 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: Re: [PATCH 0/7] libdrm tests for hot-unplug feature
Message-ID: <YLlFlq1orNnGLXRH@phenom.ffwll.local>
References: <20210601201702.23316-1-andrey.grodzovsky@amd.com>
 <CAKMK7uFoLmOFCTkPMm4mMSScF0xa+MnHvY2FVmfBUM8b8S0_PQ@mail.gmail.com>
 <de4b3521-42f7-7fc2-7271-e4fa3cd91708@amd.com>
 <baf1d1f8-48c7-ed83-8e42-a4a317bfa74d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <baf1d1f8-48c7-ed83-8e42-a4a317bfa74d@amd.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 03, 2021 at 10:22:37AM -0400, Andrey Grodzovsky wrote:
> Ping
> 
> Andrey
> 
> On 2021-06-02 10:20 a.m., Andrey Grodzovsky wrote:
> > 
> > On 2021-06-02 3:59 a.m., Daniel Vetter wrote:
> > > On Tue, Jun 1, 2021 at 10:17 PM Andrey Grodzovsky
> > > <andrey.grodzovsky@amd.com> wrote:
> > > > Adding some tests to acompany the recently added hot-unplug
> > > > feature. For now the test suite is disabled until the feature
> > > > propagates from drm-misc-next to drm-next.
> > > > 
> > > > Andrey Grodzovsky (7):
> > > >    tests/amdgpu: Fix valgrind warning
> > > >    xf86drm: Add function to retrieve char device path
> > > >    test/amdgpu: Add helper functions for hot unplug
> > > >    test/amdgpu/hotunplug: Add test suite for GPU unplug
> > > >    test/amdgpu/hotunplug: Add basic test
> > > >    tests/amdgpu/hotunplug: Add unplug with cs test.
> > > >    tests/amdgpu/hotunplug: Add hotunplug with exported bo test
> > > Given how nasty hotunplug is I really think collaborating on igt tests
> > > on this would be best for everyone ... do we have to keep doing
> > > parallel tests here for amdgpu?
> > > -Daniel
> > 
> > AFAIK as far as AMD goes a lot of developers use libdrm for regression
> > testing
> > while developing their features and also QA as i can see from some
> > internal ticket
> > specifically opened for failing to pass libdrm tests. From my bitter
> > experience with
> > GPU reset - features which are not part of a common use case such as
> > device loading,
> > mode setting or commands submissions tend to very quickly break as
> > people develop
> > features but never test them in those uncommon use cases - this is why I
> > feel it will be
> > very helpful to include those tests in libdrm.
> > 
> > Also given that this is libdrm amdgpu code it fits naturally into libdrm.
> > 
> > Regarding IGT - as you may remember I have them there too -
> > https://gitlab.freedesktop.org/agrodzov/igt-gpu-tools/-/commits/master
> > I hit some compile breakage on debian platform there which i need to
> > resolve before i will submit for review there too.

Why can't amd run the igt tests? Afaiui on the display side this is
happening already, at least sometimes.

And yes regression tests matter, it just feels silly that we need to have
them 2x for amdgpu. For old stuff the old repo is all fine, but for new
feature it looks a bit silly.
-Daniel

> > 
> > Andrey
> > 
> > 
> > > 
> > > >   tests/amdgpu/amdgpu_test.c     |  42 +++-
> > > >   tests/amdgpu/amdgpu_test.h     |  26 +++
> > > >   tests/amdgpu/basic_tests.c     |   5 +-
> > > >   tests/amdgpu/hotunplug_tests.c | 357
> > > > +++++++++++++++++++++++++++++++++
> > > >   tests/amdgpu/meson.build       |   1 +
> > > >   xf86drm.c                      |  23 +++
> > > >   xf86drm.h                      |   1 +
> > > >   7 files changed, 450 insertions(+), 5 deletions(-)
> > > >   create mode 100644 tests/amdgpu/hotunplug_tests.c
> > > > 
> > > > -- 
> > > > 2.25.1
> > > > 
> > > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
