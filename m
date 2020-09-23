Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13156274DFB
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 02:53:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 301FC6E3D8;
	Wed, 23 Sep 2020 00:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C65B6E3B2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 00:53:02 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id u8so20118121lff.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 17:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=63NW9gk7HRpDHGoorZLXSxJtBEzJkCrOurZGFYdeq1s=;
 b=QEiJCmMJ+abH4jXWF874MeS11eIiKXKE3h+n39sqAGLPIycrn0MxhLfS6Wo+aHjo6o
 BgjErpz4dkHZ481e5ATkWq93dIaYf6zudSHfhcDNkoV5W8p3tDbaqO0s4spGS+JLBOVL
 xn4KEw0MJ1HUUzUo1qdlmI3HLQin57sr4yXqNNwLYhvbPhHVBqnKcLDYDRBfUSirJosj
 6VaWUYcV9FK1rBmUDtcRLgsOTXJ8dZ55TiXMjedniQ+O9jvUR4qfgY1xDTm4+TC3Ugui
 fAgPDzIRGT2lufyhiDkf+4OuUSwYygqW1DEk06diJYWny7csi55q33hB6fNRubbxlgJ1
 Vk+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=63NW9gk7HRpDHGoorZLXSxJtBEzJkCrOurZGFYdeq1s=;
 b=J7TqmvnN2Nd8VbKccrg8jOvqtcizXyuYpx5LCwyDGemmtcRCKxYWCRBkHdwiTFGWh2
 Q2OnT9UfYh0BBNstot8y1ysf8VbqH+ZXQc3TAtia1E+RE4HremaYFlD0AfMJkkDzu47S
 nw5G7Hw1Iux/3cROcY6cSNT+57/XbvzHjTziOsY4z1N7ZEK44UGbHloWXHdQoHlUMFNT
 ekr0TIkH9hOxzAE//G/014BVYD6/Ux0OiHhsW0/tyxNotALhFdAVdWbj3maChXGsuxb2
 AdNWtF7/v1MfecQs8YrTPIUtKJI+cCOrsdkrA3T9LcWxkjE2ieJ6nt2iJMgHaWQLzLJZ
 FB+Q==
X-Gm-Message-State: AOAM532FOBxhBFuSqzWOLb7YL9SY82SnbtYCTBZRGAISMq8346UDrvMO
 90JxuLICqskviiyL7XG/Q95k0929e1B2r3Ac07mEy8OTUkQ=
X-Google-Smtp-Source: ABdhPJxEyMjaWBOlTNqZq+aOqsUhRrRJuhmMZTQc6iiISsny0Ld0R8ZOQAu5Co8gVaeeYbMO5GjUCtpLRRG7qTwcHRY=
X-Received: by 2002:aa7:c511:: with SMTP id o17mr7090354edq.300.1600821793001; 
 Tue, 22 Sep 2020 17:43:13 -0700 (PDT)
MIME-Version: 1.0
References: <159643094279.4062302.17779410714418721328.stgit@dwillia2-desk3.amr.corp.intel.com>
 <c59111f9-7c94-8b9e-2b8c-4cb96b9aa848@redhat.com>
 <CAPcyv4j8-5nWU5GPDBoFicwR84qM=hWRtd78DkcCg4PW-8i6Vg@mail.gmail.com>
 <20200821162134.97d551c6fe45b489992841a8@linux-foundation.org>
 <7d51834a-9544-b2e8-bfba-1c3e2da0e470@redhat.com>
In-Reply-To: <7d51834a-9544-b2e8-bfba-1c3e2da0e470@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 22 Sep 2020 17:43:01 -0700
Message-ID: <CAPcyv4gfBj66Dwy0yn2CX=cCT=yqR9wHE2gY1Q5_Nq2vnh0zPg@mail.gmail.com>
Subject: Re: [PATCH v4 00/23] device-dax: Support sub-dividing soft-reserved
 ranges
To: David Hildenbrand <david@redhat.com>
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
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Paul Mackerras <paulus@ozlabs.org>, Linux MM <linux-mm@kvack.org>,
 Michael Ellerman <mpe@ellerman.id.au>, "H. Peter Anvin" <hpa@zytor.com>,
 Joao Martins <joao.m.martins@oracle.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Linux ACPI <linux-acpi@vger.kernel.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 Vishal Verma <vishal.l.verma@intel.com>, X86 ML <x86@kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>,
 Jeff Moyer <jmoyer@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Ira Weiny <ira.weiny@intel.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, Jia He <justin.he@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wei Yang <richardw.yang@linux.intel.com>, Brice Goglin <Brice.Goglin@inria.fr>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 8, 2020 at 3:46 AM David Hildenbrand <david@redhat.com> wrote:
>
> On 22.08.20 01:21, Andrew Morton wrote:
> > On Wed, 19 Aug 2020 18:53:57 -0700 Dan Williams <dan.j.williams@intel.com> wrote:
> >
> >>> I think I am missing some important pieces. Bear with me.
> >>
> >> No worries, also bear with me, I'm going to be offline intermittently
> >> until at least mid-September. Hopefully Joao and/or Vishal can jump in
> >> on this discussion.
> >
> > Ordinarily I'd prefer a refresh&resend for 2+ week-old series such as
> > this.
> >
> > But given that v4 all applies OK and that Dan has pending outages, I'll
> > scoop up this version, even though at least one change has been suggested.
> >
>
> Should I try to fix patch #11 while Dan is away? Because I think at
> least two things in there are wrong (and it would have been better to
> split that patch into reviewable pieces).

Hey David,

Back now, I'll take a look. I didn't immediately see a way to
meaningfully break up that patch without some dead-code steps in the
conversion, but I'll take another run at it.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
