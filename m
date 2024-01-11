Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB11A82B71A
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 23:27:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ACF110E1C1;
	Thu, 11 Jan 2024 22:27:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E40610E0B5;
 Thu, 11 Jan 2024 21:30:43 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-dbeff3fefc7so4815823276.2; 
 Thu, 11 Jan 2024 13:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705008642; x=1705613442; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8LgYFTnwAu8/MG526Kevc0lB/NXqtyQR3bdvsNZmg0k=;
 b=LbjVsy62gT6ZIQkvAQO33OZvlk3i4nCkkL3H725HM7csHuV6i3cRmNThHELWgV9FG+
 bQ1VKhrDRsVOmkFemdkoHz2RpovqLDV5jBlmMuAOTJsNPbS5B5imNvyUAoFj26AAkk4Z
 Hb5KHOhvqhPhTHRqjfRPIyYSssFxbrEvpeNdrEtVqTZf8In5VWnhFLo8MsUCzoYMd5jw
 7Y+tah32usBl5us1fkRKTb6X/5SzuRwD0KJFnL/l+K/MqJD/pOt3sXwoSjf2E/E5EOxD
 qn0xe5GY47Afj0DcRR8U2FktKLDSyjNEvhGKx8CdaCNnkLNaqqIqd8BQQDGDT1MpBOas
 qtMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705008642; x=1705613442;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8LgYFTnwAu8/MG526Kevc0lB/NXqtyQR3bdvsNZmg0k=;
 b=iEplFe1ckPpRwPwiqbvbWBqNXzz2snaJa/x7cgljCz2HyOf6p5d1j2wJpJ0FPxx8Gh
 LSkIJgDO1GBm+rY8iGheAXwPW/wgfBIZm71I4GwILuG6VxExYxeElb92x3q3n+6tA7Lv
 1USAkmGgtsoM1BnDT7RxHTCgThRPTXrpGvRwRIjNgxCg39tGHHIJVlJKlr5ATQLLPMzW
 VZNtbIj24CO7rmxeJrk/etH/rZwyPGz3Z9K3M09ZRvpk1064U2VjiF4HJAEyR3zayfBl
 lEmWeVxpJD88w3Q4cb3eaEr4UlZNufoS/COa4SPr/+yKg0U+1O16y2nyeFiScvTmzkwI
 uD1A==
X-Gm-Message-State: AOJu0YzhoCZ9auWJikPIeFbKHDqqbIVfIN4whpx13yXhOpUf1Uitk7RG
 myIT+B4jVYv8ZCeM68I3Gz3+fvR+xZH/eH3BO/c=
X-Google-Smtp-Source: AGHT+IHwmH+A2IQ0AogjWxAMvzBiF3cSFHiqvOmPkUcvH7iqX/OVfLICPOYHsW9aFA0OozZ2CFnaG7nwOMzm3wCWY1Y=
X-Received: by 2002:a05:6902:1364:b0:dbf:11e:d09d with SMTP id
 bt4-20020a056902136400b00dbf011ed09dmr294814ybb.84.1705008642089; Thu, 11 Jan
 2024 13:30:42 -0800 (PST)
MIME-Version: 1.0
References: <20240110092109.1950011-1-hch@lst.de>
 <ZZ6Pfk8tLXbvs4dE@casper.infradead.org>
 <170490002493.164187.5401160425746227111@jlahtine-mobl.ger.corp.intel.com>
 <170490050245.164862.16261803493864298341@jlahtine-mobl.ger.corp.intel.com>
 <ZZ64/F/yeSymOCcI@casper.infradead.org>
In-Reply-To: <ZZ64/F/yeSymOCcI@casper.infradead.org>
From: Daniel Gomez <dagmcr@gmail.com>
Date: Thu, 11 Jan 2024 22:30:31 +0100
Message-ID: <CAPsT6hkQixVvvE94Rjop-7jOXi3FOMfv8BOFhxYLWUs906x2CQ@mail.gmail.com>
Subject: Re: disable large folios for shmem file used by xfs xfile
To: Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 11 Jan 2024 22:27:35 +0000
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
Cc: "Darrick J . Wong" <djwong@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 Huang Rui <ray.huang@amd.com>, Christoph Hellwig <hch@lst.de>, x86@kernel.org,
 Hugh Dickins <hughd@google.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 intel-gfx@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-sgx@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Chandan Babu R <chandan.babu@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 10, 2024 at 4:35=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Wed, Jan 10, 2024 at 05:28:22PM +0200, Joonas Lahtinen wrote:
> > Quoting Joonas Lahtinen (2024-01-10 17:20:24)
> > > However we specifically pass "huge=3Dwithin_size" to vfs_kern_mount w=
hen
> > > creating a private mount of tmpfs for the purpose of i915 created
> > > allocations.
> > >
> > > Older hardware also had some address hashing bugs where 2M aligned
> > > memory caused a lot of collisions in TLB so we don't enable it always=
.
> > >
> > > You can see drivers/gpu/drm/i915/gem/i915_gemfs.c function
> > > i915_gemfs_init for details and references.
> > >
> > > So in short, functionality wise we should be fine either default
> > > for using 2M pages or not. If they become the default, we'd probably
> > > want an option that would still be able to prevent them for performan=
ce
> > > regression reasons on older hardware.
> >
> > To maybe write out my concern better:
> >
> > Is there plan to enable huge pages by default in shmem?
>
> Not in the next kernel release, but eventually the plan is to allow
> arbitrary order folios to be used in shmem.  So you could ask it to creat=
e
> a 256kB folio for you, if that's the right size to manage memory in.
>
> How shmem and its various users go about choosing the right size is not
> quite clear to me yet.  Perhaps somebody else will do it before I get
> to it; I have a lot of different sub-projects to work on at the moment,
> and shmem isn't blocking any of them.  And I have a sneaking suspicion
> that more work is needed in the swap code to deal with arbitrary order
> folios, so that's another reason for me to delay looking at this ;-)

I have sent large folios support for shmem for the write and fallocate
path some releases ago. The main problem I was facing was a current
upstream problem with huge pages when seeking holes/data (fstests
generic/285 and generic/436). The strategy suggested was to use large
folios in an opportunistic way based on the file size. This hit the
same problem we currently have with huge pages and I considered that a
regression. We have made some progress to fix seeking in huge pages
upstream but is not yet finished. I can send the patches tomorrow for
further discussion.

>
