Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0791EA38A14
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 17:53:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E2210E0E6;
	Mon, 17 Feb 2025 16:53:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="SJdUpIk0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DAAA10E0E6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 16:53:10 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4395b367329so28421595e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 08:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1739811189; x=1740415989; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=DJtd9EpQG9v4B1pXdZqv1dATHwiQS+vJO3mKyIAjt7E=;
 b=SJdUpIk0ny1qq5n3XKf3AlsAGluGNu5rby2GcsuaK5V9r0ndTe5QRhPqcJQkAUMoka
 1Dfpg6X0OgISzyVEBxDRcwjsCj1juyKEASL5vGcjhPLTGk3VV35xSXnLbSDqJygzYW/O
 /Qa2OP2OUZ/4HiVyNime0YhsRnwm9QKcDJDo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739811189; x=1740415989;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DJtd9EpQG9v4B1pXdZqv1dATHwiQS+vJO3mKyIAjt7E=;
 b=N1NVmxg5i7hhEnOScWxCDfw6UL+bDxuGBA0WvxzP/aPf6bkE4WS1fQAqRVUNMER7fB
 HEVIh9TyQxtkRMP4M2+9jS72j6Gi1OfFr4RrabFDLn/dPJjsxbBCO7QEurcoZKxYrOfa
 BQ/DvCoYg7phOj2OoLgXu9Y2oQHUwm9zTdXZLyRCrq0AAYv4I9PXcsUsTPxeQIeV52eN
 3o2o8/rm3W4U5vT/kq2DxlPnoKlEQwMbEf88oKAkBhJdyDpRyvegIT++ptJyao8EcOnv
 l4QhMcdp/atcYk76aYWMq7tdyTP8OwlYMrVFdHkgM0Umd8SeRMbajNDlLlFXbLXXjBmM
 ssgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnvGxlD5alQAIr+NmDVtGXJJcex8DrZTF08SlMPwjO3qzztu95lj5qeaKO51mHP9IcYBiCtzU58O4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/PNoZVAWxM4i9kCNjwnZTINlDPa1TM8SGFNgMlXGksv3+qak/
 fGkFzgr3oztYG5A4/3nK8OroYIoHMX8JDNGufHpJnJwZGV86obrhy8oWKCeEI4E=
X-Gm-Gg: ASbGnctOBA5r5fZPh8RbK6xEWH3Ys6mzuH/DNoQxhoaCLVgD40XqboTIIuyzHxHZs3J
 vOS8VCYjZp2kH4qVpMObmdg+M7f96Zxy9rzOO3YB7jTuLdX/cIAFQIpu2KoocrrCIMZd6+oB+Zd
 FC4eTohMOnWebpiRP3I0RRrkA9G2xZ+OEHef7e1ur6qwGawRt5TrUusYn09HpmSSvPhbCV2iwhU
 3BVCT6ZVNos9UrcOPFhUXtMXF0eZm7IZ/Dn4XEf9ybj9ufsEs/CkvP89fEVho4vPGyxdrOTyEWK
 6eTKiIBifXSIyu7Ly6y1brSXf38=
X-Google-Smtp-Source: AGHT+IH3WbDB9Q36lcmdObU8CLnmpjCwtkXa80JnbwIBTYcpO4BzNQune7ic49wSNZc2DW/2rAReDQ==
X-Received: by 2002:a05:600c:511c:b0:439:4d00:3ade with SMTP id
 5b1f17b1804b1-4396e765340mr79540805e9.26.1739811188690; 
 Mon, 17 Feb 2025 08:53:08 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258f5fabsm12569830f8f.45.2025.02.17.08.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 08:53:08 -0800 (PST)
Date: Mon, 17 Feb 2025 17:53:06 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org, oded.gabbay@gmail.com,
 maciej.falkowski@linux.intel.com, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH 0/6] accel/ivpu: Changes for 6.15 2025-02-04
Message-ID: <Z7Npchtu-soSVI_U@phenom.ffwll.local>
References: <20250204084622.2422544-1-jacek.lawrynowicz@linux.intel.com>
 <c6537153-d03b-4b9b-8fdf-ff437512404e@suse.de>
 <ef58703e-75c8-4b35-8acc-4bd79abbb150@linux.intel.com>
 <5553249d-b0a8-b3e7-b255-9709870f574f@quicinc.com>
 <2a1e5805-a93c-41aa-9a18-650668e30f18@suse.de>
 <552067e5-297a-c807-9776-96275613e288@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <552067e5-297a-c807-9776-96275613e288@quicinc.com>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Fri, Feb 14, 2025 at 08:47:26AM -0700, Jeffrey Hugo wrote:
> On 2/13/2025 7:17 AM, Thomas Zimmermann wrote:
> > Hi
> > 
> > Am 12.02.25 um 16:52 schrieb Jeffrey Hugo:
> > > On 2/12/2025 6:27 AM, Jacek Lawrynowicz wrote:
> > > > Hi,
> > > > 
> > > > Thanks for your detailed feedback and constructive suggestions.
> > > > I appreciate this as it is not easy to learn all process details
> > > > otherwise.
> > > 
> > > I echo this.  At times, accel feels a bit isolated from DRM.
> > 
> > Agreed, but IDK how to fix that. Although both share common code, there
> > seems little overlap driver-wise.

Thanks to Thomas for raising this. I just wanted to add that we knowingly
added accel fully aware that there's work to do here, and at first it will
be isolated.

We do have some other accel drivers now, so it would be great if teams
could review/ack across drivers. That's how we get collaboration going and
ideas for gaps in the drm core/helper infrastructure, and make this all
less lonely.

> > > > On 2/12/2025 11:20 AM, Thomas Zimmermann wrote:
> > > > > Hi,
> > > > > 
> > > > > here's a complaint about the lack of process and
> > > > > documentation in accel/, and ivpu specifically. I came
> > > > > across this series while preparing the weekly PR for
> > > > > drm-misc-next and found myself unable to extract much useful
> > > > > information to report. This is a problem for a development
> > > > > process that relies on transparency, accountability and
> > > > > collaboration. Other problematic examples are at [1] and
> > > > > [2]. IIRC I had similar issues in previous development
> > > > > cycles.
> > > > > 
> > > > > I cannot assess the quality of the code itself, but the
> > > > > process and documentation involved does not meet the
> > > > > requirements.
> > > > > 
> > > > > - 'Changes for <version>' is not an meaningful description
> > > > > for a patch series. It's not the submitter (or anyone else)
> > > > > deciding that this series gets merged into version
> > > > > so-and-so. The series gets merged when it is ready to be
> > > > > merged.
> > > > > 
> > > > > - Apparently this series contains 3 different things (buffer
> > > > > imports, locking, debugging); so it should be 3 series with
> > > > > each addressing one of these topics.
> > > > > 
> > > > > - The series' description just restates the patch
> > > > > descriptions briefly. It should rather give some indication
> > > > > of the problem being solved by the contained patches, and
> > > > > context on why this is worth solving. (I know that this is
> > > > > often complicated to state clearly to outsiders.)
> > > > 
> > > > We were sometimes using patchsets to bundle patches that were
> > > > tested together. We apologize for any confusion this may have
> > > > caused, as we were not aware that this approach was not
> > > > preferred. Moving forward, we will ensure that patches are split
> > > > into separate series, each addressing a specific topic. I hope
> > > > this will help improve clarity and make it easier to understand
> > > > and assess the changes.
> > > > 
> > > > > - Review should be public. I understand that it's often only
> > > > > one dev team working on a specific driver, discussing issues
> > > > > internally. Still it makes sense to do the code reviews in
> > > > > public, so that others can follow what is going on in the
> > > > > driver. Public code reviews are also necessary to establish
> > > > > consent and institutional knowledge within the wider
> > > > > developer community. You miss that with internal reviews.
> > > > > 
> > > > > - These patches come with R-b tags pre-applied. Even for
> > > > > trivial changes, R-b tags should given in public. If the
> > > > > R-bs have been given elsewhere, please include a reference
> > > > > to that location. The tags (R-b, A-b, T-b, etc) are not just
> > > > > for verifying the code itself. They also establish trust in
> > > > > the development process involving each patch; and in the
> > > > > developers involved in that process. This needs to happen in
> > > > > public to be effective.
> > > > 
> > > > We value all public comments and typically wait a week for
> > > > public reviews before submitting patches, regardless of whether
> > > > an R-b tag is pre-applied. I was not aware that pre-applying R-b
> > > > tags was an issue. We we will ensure that all R-b tags are added
> > > > publicly from now on.
> > > 
> > > I'll provide a counter point on the pre-applied RBs - Qualcomm has
> > > been told many times in the past decade or so to do this (GregKH
> > > comes to mind although I'm certain he is not the only one).  I don't
> > > particularly like it, but we seem to have a reputation for poor
> > > quality in the community, and it would appear that the first step to
> > > mitigating that is to indicate that we have actually done internal
> > > reviews.  We've been warned that the next step is requiring a
> > > "community approved" developer to SOB everything.  I hope to avoid
> > > that.
> > > 
> > > Personally, I value community given RBs for maillist patches over
> > > internal ones and will typically wait/seek them unless the change is
> > > very trivial.  I can't speak for The Intel/AMD/Habana folks although
> > > I suspect they will concur with this but I lurk on IRC and of course
> > > you have my email address.  Please feel free to reach out with any
> > > feedback.  I would hope that we can learn and improve without
> > > annoying the community to the point that the community feels
> > > frustrated and suggests drastic action.
> > 
> > I'd disagree with GregKH here, but him saying this is like having an
> > 'official' statement for what to do. But I don't think other DRM driver
> > teams pre-apply R-bs.  If a patch got an R-b from an internal review,
> > maybe briefly mention it in the cover letter. At least it's clear then.
> 
> This seems like a good idea.  I will incorporate it.

Yup, drm/dri-devel does fundamentally disagree with Greg KH and many other
maintainers in the kernel - we _want_ the messy internal discussion in
public, if at all possible, because that often allows us to catch issues
earlier. And it's also much easier to collaborate across drivers and
companies if you only have a draft hack and not yet the fully polished
implementation.

And as I've mentioned above, we now have another smaller accel driver with
amd's, so it feels like a good time to start pushing for that.

Cheers, Sima

> 
> -Jeff
> 
> > 
> > Best regards
> > Thomas
> > 
> > > 
> > > To Jacek, I'm hoping to be more responsive to reviewing your patches
> > > now that we are out of the holidays and other things have settled
> > > down again.  I'm sorry if you've felt ignored.
> > > 
> > > > > - The kernel's (or any FOSS') development is organized
> > > > > around individuals, not organizations. Having each developer
> > > > > send their changes individually would likely resolve most of
> > > > > the current problems.
> > > > OK, I'll talk to the team about this.
> > > > 
> > > > > I understand that accel is not graphics and can feel
> > > > > somewhat detached from the rest of DRM. Yet it is part of
> > > > > the DRM subsystem. This development cycles' ivpu series'
> > > > > made me go to IRC and ask for accel/ to be removed from the
> > > > > drm-misc tree. Luckily the other maintainer were more
> > > > > charitable. So I make these remarks in good faith and hope
> > > > > that we can improve the processes within accel/.
> > > > 
> > > > I appreciate your feedback and would welcome more remarks.
> > > > Please keep in mind that all accel drivers are new, and it takes
> > > > time to learn all the upstream rules.
> > > > The kernel/DRM development process is quite unique, and not
> > > > everything is fully documented. I find emails like this to be
> > > > incredibly valuable and I am eager to comply with the
> > > > guidelines.
> > > > I just need some patience and guidance as I navigate through
> > > > this. Thank you for your understanding and support.
> > > > 
> > > > Regards,
> > > > Jacek
> > > > 
> > > > > Best regards
> > > > > Thomas
> > > > > 
> > > > > [1] https://patchwork.freedesktop.org/series/143182/
> > > > > [2] https://patchwork.freedesktop.org/series/144101/
> > > > > 
> > > > > 
> > > > > Am 04.02.25 um 09:46 schrieb Jacek Lawrynowicz:
> > > > > > Add possibility to import single buffer into multiple contexts,
> > > > > > fix locking when aborting contexts and add some debug features.
> > > > > > 
> > > > > > Andrzej Kacprowski (2):
> > > > > >     accel/ivpu: Add missing locks around mmu queues
> > > > > >     accel/ivpu: Prevent runtime suspend during context abort work
> > > > > > 
> > > > > > Karol Wachowski (3):
> > > > > >     ccel/ivpu: Add debugfs interface for setting HWS priority bands
> > > > > >     accel/ivpu: Add test modes to toggle clock relinquish disable
> > > > > >     accel/ivpu: Implement D0i2 disable test modea
> > > > > > 
> > > > > > Tomasz Rusinowicz (1):
> > > > > >     accel/ivpu: Allow to import single buffer into multiple contexts
> > > > > > 
> > > > > >    drivers/accel/ivpu/ivpu_debugfs.c | 84
> > > > > > +++++++++++++++++++++++++++++++
> > > > > >    drivers/accel/ivpu/ivpu_drv.c     |  2 +-
> > > > > >    drivers/accel/ivpu/ivpu_drv.h     |  4 ++
> > > > > >    drivers/accel/ivpu/ivpu_fw.c      |  4 ++
> > > > > >    drivers/accel/ivpu/ivpu_gem.c     | 43 ++++++++++++++++
> > > > > >    drivers/accel/ivpu/ivpu_gem.h     |  1 +
> > > > > >    drivers/accel/ivpu/ivpu_hw.c      | 31 ++++++++++++
> > > > > >    drivers/accel/ivpu/ivpu_hw.h      |  5 ++
> > > > > >    drivers/accel/ivpu/ivpu_job.c     | 10 +++-
> > > > > >    drivers/accel/ivpu/ivpu_jsm_msg.c | 29 ++++-------
> > > > > >    drivers/accel/ivpu/ivpu_mmu.c     |  9 ++++
> > > > > >    11 files changed, 202 insertions(+), 20 deletions(-)
> > > > > > 
> > > > > > -- 
> > > > > > 2.45.1
> > > > > 
> > > > 
> > > 
> > 
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
