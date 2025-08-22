Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6295FB3108D
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 09:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DAD910EA7D;
	Fri, 22 Aug 2025 07:35:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="dWEf/VtA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0566110EA7B;
 Fri, 22 Aug 2025 07:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1755848113;
 bh=vVbnc06XqVavlLYLQv7ao/4G9GnuVWAZ/d4rIQf90s8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dWEf/VtA0lPikkdxxnl9xOBOl56LdLTVVmilaR8ye4WemGSzcHGNkJEopig7PxXuO
 Yqmy7aR9ycVgGpstt8p+CQii/8kFhDlcou30OfV+VyhkC6iU3o0hEi06axCKHS6r1D
 uSeYFYAYZZv0Hx3MF/FvuyLRFh4jR0/tDw0MUr+Pgazhgi+NopoIaSO9JZxNHAFAJe
 9iHQWnS4pVT1FmiCmVCP6/TFZcKuM/TC6MwBNVkLVPItGw/3OTZeRd58vhS+sqIWKu
 W3iqWykanpIMpw0+cp18lABC2FnlbxqvK/fQnTqmkQDyLhoxJnjFMgvHG5o69Jp4Qk
 uYzI8o3cwWsPg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 2E80017E0C54;
 Fri, 22 Aug 2025 09:35:13 +0200 (CEST)
Date: Fri, 22 Aug 2025 09:35:08 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Cc: Danilo Krummrich <dakr@kernel.org>, <intel-xe@lists.freedesktop.org>,
 Boris Brezillon <bbrezillon@kernel.org>, Matt Coster
 <matt.coster@imgtec.com>, Rob Clark <robin.clark@oss.qualcomm.com>, Matthew
 Brost <matthew.brost@intel.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/gpuvm: Rename 'map' to 'op' in drm_gpuvm_map_req
Message-ID: <20250822093508.6e474480@fedora>
In-Reply-To: <0475e7d2-c8eb-4f69-b68b-2b0b86c62e9f@intel.com>
References: <20250820152335.2899501-1-himal.prasad.ghimiray@intel.com>
 <20250820180742.20623521@fedora> <20250821130146.471cd653@fedora>
 <20250821132535.0424d0b4@fedora>
 <DC84DX5YA27J.2UNA0LDKUMUB9@kernel.org>
 <20250821150124.30c387da@fedora>
 <DC858O8WDXVQ.2KJJTV9020XHJ@kernel.org>
 <0475e7d2-c8eb-4f69-b68b-2b0b86c62e9f@intel.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 21 Aug 2025 22:25:06 +0530
"Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com> wrote:

> On 21-08-2025 19:05, Danilo Krummrich wrote:
> > On Thu Aug 21, 2025 at 3:01 PM CEST, Boris Brezillon wrote:  
> >> On Thu, 21 Aug 2025 14:55:06 +0200
> >> "Danilo Krummrich" <dakr@kernel.org> wrote:
> >>  
> >>> On Thu Aug 21, 2025 at 1:25 PM CEST, Boris Brezillon wrote:  
> >>>> On Thu, 21 Aug 2025 13:01:46 +0200
> >>>> Boris Brezillon <boris.brezillon@collabora.com> wrote:  
> >>>>> On a second thought, I'm now wondering why we need drm_gpuvm_map_req in
> >>>>> the first place. It would kinda make sense if it was containing an
> >>>>>
> >>>>> 	bool madvise;
> >>>>>
> >>>>> field, so you don't have to pass it around, but even then, I'm
> >>>>> wondering if we wouldn't be better off adding this field to
> >>>>> drm_gpuva_op_map instead and passing an drm_gpuva_op_map object to
> >>>>> the various map helpers (like Danilo suggested in his review of the
> >>>>> REPEATED mode series Caterina sent).  
> >>>>
> >>>> More on that: the very reason I introduced drm_gpuvm_map_req in the
> >>>> first place is so we have a clear differentiation between an overall
> >>>> map request and the sub-operations that are created to fulfill it.
> >>>> Looks like this was not a concern for Danilo and he was happy with us
> >>>> using _op_map for this.
> >>>>
> >>>> The other reason we might want to add drm_gpuvm_map_req is so that
> >>>> information we only need while splitting a req don't pollute
> >>>> drm_gpuva_op_map. Given I was going to pass the flags to the driver's
> >>>> callback anyway (meaning it's needed at the op_map level), and given
> >>>> you're passing madvise as a separate bool argument to various helpers
> >>>> (_map_req just contains the op, not the madvise bool), I don't think
> >>>> this aspect matters.  
> >>>
> >>> Good catch! Indeed, when Himal picked up your struct drm_gpuvm_map_req patch,
> >>> there were additional flags included in the structure. Now that it is
> >>> essentially a transparent wrapper, I prefer to use struct drm_gpuva_op_map
> >>> directly.
> >>>
> >>> However, given that you still have patches in flight that will add a flags field
> >>> to struct drm_gpuvm_map_req I think it's probably fine to introduce it right
> >>> away. Or did you drop this plan of adding those flags?  
> >>
> >> I need the flags field in the op_map too (so I can propagate it to the
> >> drm_gpuva object), so I'd rather go with an op_map object directly and
> >> kill drm_gpuvm_map_req now.  
> > 
> > In this case I agree, let's use struct drm_gpuva_op_map directly.  
> 
> According to the kernel documentation for the drm_gpuva_op_map 
> structure, it is intended to represent a single map operation generated 
> as the output of ops_create or the GPU VA manager. Using it as a direct 
> input to ops_create contradicts this definition.
> 
> For drm_gpuvm_sm_map_ops_create, the values align with those in 
> drm_gpuvm_map_req. However, this is not the case for 
> drm_gpuvm_madvise_ops_create.
> 
> If we plan to proceed with deprecating drm_gpuvm_map_req, we need to 
> clarify the fundamental definition of drm_gpuva_op_map:
> Should it represent a user-requested map, or an operation generated by 
> the GPU VA manager?

I would say, update the doc to reflect it can be used to pass a user
map request too, but I'll let Danilo make the final call. BTW,
embedding an op in _map_req is equivalent to saying the _op_map object
can describe a user map request to me :P.
