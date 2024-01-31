Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73408843AB5
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 10:16:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 997CC113ACF;
	Wed, 31 Jan 2024 09:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16872113ACE
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 09:16:06 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a30e898db99so119427866b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 01:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1706692504; x=1707297304; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6mJ/VC9yB8SBaqaP6I7gLNaUO/QsMoAzNYJiR3/6bAw=;
 b=aIb60uQjip4QB7hgFY/U5T1DhEkjIP7F0w/wjGqAyk/xp0Fkf7P/N6ani0a4+ygOOL
 lnKpz9WMA9kYMm1Jq95WolopGUKwJmjjZsEj5As9apI6MTFE5lJPea2GdppeAOecDTAN
 KfcdV4byCEy58HVchX/f+wcLlao0FB8R3s4Es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706692504; x=1707297304;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6mJ/VC9yB8SBaqaP6I7gLNaUO/QsMoAzNYJiR3/6bAw=;
 b=eb2fcK6brlV8HJvZ+T4T1Dz8Rjg329mPWkS94BJtl3pBmFG1beTfJRTBO93l1XeHe7
 ts2COxQgpLafBA2xTtZxnNMbhKwevqWF0jtDzed4LFd89rjk/JoYGXU/1C7VEJz6Old4
 2DNbOjerIb7GMB/Hw2+Vq7P6vYdDLoo/pPM2DSm2gqfFrMxWQmuV8PZ14KBzORFBPeD8
 GMx/o4lcNyXa1/jqen27q7uGqS+HME3NvPohuYSSFbnNqzoQg8kIH0827Vyq8Fy13Voo
 4GrK8ueO8vORABq3F3uxIFh6ERrewYu0BODU1LmPRewN9ZqA5zUwtuizqDOcY5IQkdwF
 CWsw==
X-Forwarded-Encrypted: i=0;
 AJvYcCVYZLqPyyj1ruEL4/Jrdsu/iZtBn0ue09Z1OjhoDFqnxofUOmdIzW/OZ1l7BU9FrpM2GaApXDA2hPAEMOect734qQxp5HOLTtwfEM1x46zs
X-Gm-Message-State: AOJu0YzZmcO3qSWZNO6gXWQAEqWQf5T6RVYR5r82tPHG468ToEXVvfmn
 AP0N3TCsZqyydvCCHLre7LCBiFH327eSXOamOoO5qvmX3omskBX3e90KtoRljT8=
X-Google-Smtp-Source: AGHT+IEpGYUbEZmfc8oKpOHviV0+VBBnFeRII3w1qPcAaRRwXKG9iHVOTwh6mCfk9k8HhwirjVOT7Q==
X-Received: by 2002:a17:906:1853:b0:a2f:ded9:dc76 with SMTP id
 w19-20020a170906185300b00a2fded9dc76mr587121eje.7.1706692504462; 
 Wed, 31 Jan 2024 01:15:04 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 g14-20020a170906394e00b00a2ccddf9a7dsm5960859eje.124.2024.01.31.01.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 01:15:03 -0800 (PST)
Date: Wed, 31 Jan 2024 10:15:01 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: David Airlie <airlied@redhat.com>
Subject: Re: Making drm_gpuvm work across gpu devices
Message-ID: <ZboPlUgU6A-9rMvP@phenom.ffwll.local>
References: <ccf34f6a-d704-43de-a15e-2ae2890f9381@amd.com>
 <ZbKpWpOGuNKLJ6sA@phenom.ffwll.local>
 <7834e2fbe8052717a4e0fa44feafa544b1fedaa0.camel@linux.intel.com>
 <851e3ddb-6c74-4ec5-8d05-df12b34eb2b4@amd.com>
 <SA1PR11MB69919C19A16C007A6B01FC9E92782@SA1PR11MB6991.namprd11.prod.outlook.com>
 <5aca8bdc-1243-40e6-90dc-ece80a093a5b@amd.com>
 <SA1PR11MB6991DF41C958CA46DD715E9F927D2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <801c3357-d49b-4505-a1a4-ef2f36ba63e0@amd.com>
 <SA1PR11MB6991E4CF9949916C6290C232927D2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <CAMwc25pzC4PTFwXLo4304vcbFVvxjDPi7Pd1ASBVQ1t8QqizdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMwc25pzC4PTFwXLo4304vcbFVvxjDPi7Pd1ASBVQ1t8QqizdQ@mail.gmail.com>
X-Operating-System: Linux phenom 6.6.11-amd64 
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 "rcampbell@nvidia.com" <rcampbell@nvidia.com>,
 "apopple@nvidia.com" <apopple@nvidia.com>,
 Felix Kuehling <felix.kuehling@amd.com>, "Welty,
 Brian" <brian.welty@intel.com>, "Shah, Ankur N" <ankur.n.shah@intel.com>,
 "Zeng, Oak" <oak.zeng@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "jglisse@redhat.com" <jglisse@redhat.com>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, "Gupta, saurabhg" <saurabhg.gupta@intel.com>,
 "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>, "Vishwanathapura,
 Niranjana" <niranjana.vishwanathapura@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 31, 2024 at 09:12:39AM +1000, David Airlie wrote:
> On Wed, Jan 31, 2024 at 8:29 AM Zeng, Oak <oak.zeng@intel.com> wrote:
> >
> > Hi Christian,
> >
> >
> >
> > Nvidia Nouveau driver uses exactly the same concept of SVM with HMM, GPU address in the same process is exactly the same with CPU virtual address. It is already in upstream Linux kernel. We Intel just follow the same direction for our customers. Why we are not allowed?
> 
> 
> Oak, this isn't how upstream works, you don't get to appeal to
> customer or internal design. nouveau isn't "NVIDIA"'s and it certainly
> isn't something NVIDIA would ever suggest for their customers. We also
> likely wouldn't just accept NVIDIA's current solution upstream without
> some serious discussions. The implementation in nouveau was more of a
> sample HMM use case rather than a serious implementation. I suspect if
> we do get down the road of making nouveau an actual compute driver for
> SVM etc then it would have to severely change.

Yeah on the nouveau hmm code specifically my gut feeling impression is
that we didn't really make friends with that among core kernel
maintainers. It's a bit too much just a tech demo to be able to merge the
hmm core apis for nvidia's out-of-tree driver.

Also, a few years of learning and experience gaining happened meanwhile -
you always have to look at an api design in the context of when it was
designed, and that context changes all the time.

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
