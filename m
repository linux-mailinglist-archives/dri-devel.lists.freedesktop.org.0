Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 617B08FBE1F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 23:37:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E3210E0F0;
	Tue,  4 Jun 2024 21:37:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YGKf0o2z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED9C10E0F0;
 Tue,  4 Jun 2024 21:37:50 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-627810d5d13so2512627b3.3; 
 Tue, 04 Jun 2024 14:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717537069; x=1718141869; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XjLR8zp8xaF9e7AIOZUXaas/fY4uKdUZFyE2m9Eo4uw=;
 b=YGKf0o2zRzUqyLY+DPi3g/PctKj/IOymUe1YoEH2arEy+hKX/hakSmsA+F0jrxpupT
 Lx7/OG9wvQ/mfpCiYgldbEg23FR8BmMdtCxFYaPS3UKjBAdarEm92keDtZ++rcoI3r+O
 90fWjDX4ask764IOwjDJcf0DV3jclPqTuaugRp8/elf2G7gLHXcsh8cqgYY5jrCstlhW
 KqZaSWQTsmKvNgCeIKVDqzk+JAs2mChODnfCenLkfV5TwTrOuq3AFQOB8doTzIEA8aF8
 g6cIqjcw+vuts0pF2GNqNvmn/OkX/9sl51d4fKmRk6XzjTqqOP+urv6ijeGYgld0PUHl
 NKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717537069; x=1718141869;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XjLR8zp8xaF9e7AIOZUXaas/fY4uKdUZFyE2m9Eo4uw=;
 b=laouZmuaA1ciMPypqJ3/lGS/w0/Q3CoWKyotETLvStvG4n6p2s81VTc1oPOVT/3rZR
 ApMsRrVHWejQYiAGOWy7CzicLjUlReXeyXk6RMvRpCeISV5Wo9rWKG3EyKn7lcnhqklg
 zO3uaa+nkPZM4G+fCigQzJVRe+o4zHcz4rvldycZZDjuieTJsuPACH5Ck7vSfFCS99EF
 Q0M+20ks4LGON20KUHZFPjs4ECNx4uJA8cJ6MV7DznhjsYVNdvCsGETqexB6t+/uXJEp
 +DOkEy71SiuW9zVqU5D3KP7npCXS7BFAN8w5owmrR/ylCy8kPHJ5BVvOvHgTtsjzogm4
 5S0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5yScJHq5ELu6w8Y5IFzp+3iKZwg9AFY7nfiVP+8ad6mPo99Wx3mJpDtg+erkNmH6T8iae43h4aGZ0oM3uF5nWsF/Dhwl94VHXWFWyp0D6
X-Gm-Message-State: AOJu0Yz17wCur1NYm5rEdlAVMls26AvBCY4cDn2nkGPjVLb/VnPw0NxE
 RUPT4EENUr3U3oBWXIh8G2x6UAKfdWW1OPeJKsNi9yvwycnmaRJerNj0wIyx+s2FxDrEpaxlQ4B
 8QxJQ3hoLmvBOgEBxugN5+bJfIM8=
X-Google-Smtp-Source: AGHT+IHMSUsN4L//fguDdOItLcFgQdOi1WGqnEsNTenvRjEawfGT374N9VMZDvhJqxFod7fN9YhFbGo+Smk6gtsoR2U=
X-Received: by 2002:a05:6902:2507:b0:dfa:705c:6e3e with SMTP id
 3f1490d57ef6-dfaca7e16b2mr682450276.0.1717537069283; Tue, 04 Jun 2024
 14:37:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240531053704.2009827-1-olvaffe@gmail.com>
 <2024060427-upstairs-jackal-b10a@gregkh>
In-Reply-To: <2024060427-upstairs-jackal-b10a@gregkh>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Tue, 4 Jun 2024 14:37:38 -0700
Message-ID: <CAPaKu7RWuLEts+niTEbTN2yMke=AGQuiWzpG6uH39qudvbr2hQ@mail.gmail.com>
Subject: Re: [PATCH] kernel/resource: optimize find_next_iomem_res
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 christian.koenig@amd.com, alexander.deucher@amd.com, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Alison Schofield <alison.schofield@intel.com>,
 Dave Jiang <dave.jiang@intel.com>, 
 Baoquan He <bhe@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Jun 4, 2024 at 8:41=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, May 30, 2024 at 10:36:57PM -0700, Chia-I Wu wrote:
> > We can skip children resources when the parent resource does not cover
> > the range.
> >
> > This should help vmf_insert_* users on x86, such as several DRM drivers=
.
> > On my AMD Ryzen 5 7520C, when streaming data from cpu memory into amdgp=
u
> > bo, the throughput goes from 5.1GB/s to 6.6GB/s.  perf report says
> >
> >   34.69%--__do_fault
> >   34.60%--amdgpu_gem_fault
> >   34.00%--ttm_bo_vm_fault_reserved
> >   32.95%--vmf_insert_pfn_prot
> >   25.89%--track_pfn_insert
> >   24.35%--lookup_memtype
> >   21.77%--pat_pagerange_is_ram
> >   20.80%--walk_system_ram_range
> >   17.42%--find_next_iomem_res
> >
> > before this change, and
> >
> >   26.67%--__do_fault
> >   26.57%--amdgpu_gem_fault
> >   25.83%--ttm_bo_vm_fault_reserved
> >   24.40%--vmf_insert_pfn_prot
> >   14.30%--track_pfn_insert
> >   12.20%--lookup_memtype
> >   9.34%--pat_pagerange_is_ram
> >   8.22%--walk_system_ram_range
> >   5.09%--find_next_iomem_res
> >
> > after.
>
> That's great, but why is walk_system_ram_range() being called so often?
>
> Shouldn't that be a "set up the device" only type of thing?  Why hammer
> on "lookup_memtype" when you know the memtype, you just did the same
> thing for the previous frame.
>
> This feels like it could be optimized to just "don't call these things"
> which would make it go faster, right?
>
> What am I missing here, why does this always have to be calculated all
> the time?  Resource mapping changes are rare, if at all, over the
> lifetime of a system uptime.  Constantly calculating something that
> never changes feels odd to me.
Yeah, that would be even better.

I am not familiar with x86 pat code.  I will have to defer that to
those more familiar with the matter.

>
> thanks,
>
> greg k-h
