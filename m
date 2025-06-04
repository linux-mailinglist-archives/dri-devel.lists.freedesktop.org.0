Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D58ACE0D4
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 16:57:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A05FC10E236;
	Wed,  4 Jun 2025 14:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="I0+tIVWC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A3C10E719
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 14:57:00 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-7d094d1fd7cso896882285a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 07:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1749049019; x=1749653819; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dwaQoXq5MxS3kyI58cBZQV7WhdWCdxJqWPOSy0+KmJg=;
 b=I0+tIVWCXrwWIBWlf/pSnYV42AZqUXqjnIF8E+tS+1nX7p2KSr+/xpT1B1ltwIm1vS
 VUaDL3O1Rn/zzgJqjIB2Earj+UtFbMVMqlxfV9n336xrez0NydQ5EHY3WyHcx3D20co9
 yxwV0jhf7OwYIH2NdCl0C3/rgnEBwGqIGkqcaE+v8wEK6zMuEY0bNS7ZjsjBlnDnryzZ
 iRDi8U/Q0D5b2bspUmLvAld6HdI5C8bP3CUzpVQ3Yx+WqebqK7mtVxRoPmLAaajoVatU
 olb1zWMeWa1Vx8gD/K0Dfzjc58YVfXgUYNui3+EoiA1TmI8gkScojp/tZyYxmih1MYxt
 6gnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749049019; x=1749653819;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dwaQoXq5MxS3kyI58cBZQV7WhdWCdxJqWPOSy0+KmJg=;
 b=LBc18+KZrc6/BH3PtyalJLZyGLUk+zZd14RwkuZWqcgq6nQjuCiglRa1BT1QkZedyB
 JJVlqldc7ZcIotSU+3MgyzrbX5GwAxlHd6Mvbm2lfneb39XyRVNToQfk0pyOQxI9cZJz
 HeQTGy8U3fO4qklj7eisi1eJF1IEDsBley5UZQX4950sTSRTjUvaxF0upBv5Mkds5emB
 PIObiqvKJgEE//zftwS4mFJNeK24IMsOM2NDlUV+unIwq+X1s/koeDpFcDd41LcTvBx0
 40Kq3Qr6YfClfPiq5f13KNPmyFyMQcjtq2uLpD72egI1hUgzcGlp+k03eMlHsr5zJnIO
 wMog==
X-Forwarded-Encrypted: i=1;
 AJvYcCUh5OfgjV/SUWsQv2V82fOEItYrgtSUOB0bLoqIUNMopA9DFligG+iqWjytn9yoiOWTsq6heyOjH3g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwgpRAMzhlDbF45t/3zDJ33hIgqzXU7FDWDm8apKwBmuevve+g
 kz+TpQsG6+jpfdfj23oicP0kksMzcGEqHZ5EuiBt1FbcaFQyYBXjovgmQNG3OPhr5cQ=
X-Gm-Gg: ASbGncsnHfcNh0rfowiiNcwlPoSY06fl9RnaaeIdPUPKDwf8iOD8mwXM2NyXWNPE2xl
 3U0afeoSebDR28p4fqm4FFxKiALvghWtPO9H/EioMcKw6Gg0jFa0bEYEpJRQSm/qyZXFkBd/6QU
 Df4+r/ptvjIChHDxBC9Cfi3SHNyPUs5qH0iOlqe9xnTZj96vylws64V1Tem6NXg45Kxlu06akYc
 vINyZGJEu4N/OWt8GBqhXxsuZIp6HcBMorXQvrVr4R7ae7nCJjdrcCLweqGXHxTdSVZDWBCCnj6
 OhDig7USE6Lv7EUzCYsdB06zKydMUSL564sErVTP6ptQkNfWpGgnj5UMI4Uc+KP8pxCdGedNKPA
 rwP5w5NRC9A3QqKg9Ciosw3pWurs=
X-Google-Smtp-Source: AGHT+IHAm12O28h5gnw8Cr5Vw4FrxpCaDbEfGw3TL4sOoCg85b4JdvuRvajPc+0EpaJZXlm5dTJ9Bg==
X-Received: by 2002:a05:620a:4055:b0:7c5:6dc7:7e7c with SMTP id
 af79cd13be357-7d2198eee80mr467548385a.26.1749049018893; 
 Wed, 04 Jun 2025 07:56:58 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.167.56.70]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7d09a195c67sm1042198885a.75.2025.06.04.07.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 07:56:58 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1uMpY1-0000000063X-3Qeo;
 Wed, 04 Jun 2025 11:56:57 -0300
Date: Wed, 4 Jun 2025 11:56:57 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [bug report] drm/xe/svm: Implement prefetch support for SVM ranges
Message-ID: <20250604145657.GB17991@ziepe.ca>
References: <aDSDfusiM8QGQwFS@stanley.mountain>
 <0183ca8d-4347-48d9-a783-361c6543db14@intel.com>
 <20250603222952.GD407166@ziepe.ca>
 <aEBeM1sWuSNWNij6@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEBeM1sWuSNWNij6@phenom.ffwll.local>
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

On Wed, Jun 04, 2025 at 04:54:43PM +0200, Simona Vetter wrote:
> On Tue, Jun 03, 2025 at 07:29:52PM -0300, Jason Gunthorpe wrote:
> > On Mon, May 26, 2025 at 10:15:17PM +0530, Ghimiray, Himal Prasad wrote:
> > > 
> > > 
> > > On 26-05-2025 20:36, Dan Carpenter wrote:
> > > > Hello Himal Prasad Ghimiray,
> > > > 
> > > > Commit 09ba0a8f06cd ("drm/xe/svm: Implement prefetch support for SVM
> > > > ranges") from May 13, 2025 (linux-next), leads to the following
> > > > Smatch static checker warning:
> > > > 
> > > > 	drivers/gpu/drm/xe/xe_vm.c:2922 prefetch_ranges()
> > > > 	warn: passing positive error code 's32min-(-96),(-94)-(-15),(-13)-(-12),(-10)-(-2),1' to 'ERR_PTR'
> > > 
> > > Hi Dan,
> > > 
> > > Thanks for pointing this out. I see there's a gap in how hmm_range_fault()
> > > adheres to its documented behavior. I believe the function should sanitize
> > > positive return values from walk_page_range() to ensure consistency.
> > > 
> > > Jason can comment further on same.
> > 
> > Yeah, I don't think it should return positive error code, whatever is
> > doing that should be fixed. Can you send a patch?
> 
> Not sure that's what's going on, from the comment and reading the code
> (albeit non-exhaustively) I think you can only get positive error return
> values from walk_page_range if the ops you provide do so. The hmm ones
> don't, so I think this should be ok without any code changes?
> 
> Maybe a WARN_ON and patching that up for paranoia, but I don't see how
> this can happen.

Yeah, that is how I suspect it was too, but I vaugely recall something
like this coming up before in hmm and the right answer was to fix the
thing generating the wrong return code, not try to fix it higher.

A WARN_ON would be reasonable

Jason
