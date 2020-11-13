Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 021A12B1343
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 01:33:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E37C6E284;
	Fri, 13 Nov 2020 00:32:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4FB6E284;
 Fri, 13 Nov 2020 00:32:57 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id a65so7026061wme.1;
 Thu, 12 Nov 2020 16:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5Ra2hbbJlM1B22w2OajwI2CvpXY6aPxc/8njNnw7VVg=;
 b=G92lftosSwgFZW7l+vVZeLpPW5lz7dKrEhorvuXcd5iNX9vPtbn0K6CY3NkzfFdnec
 emgd+ofw18NqCdmogUKNC0qYLrpjtgsazYqoY5CIRnNU/6Tl4Y8RUcLaj4JXTXn6KeSl
 RjfGFJjRi4M5phOtfTW1S8CCD8BYOlJzWBRJ6lShFjfbuNIdnLXhpMz9Qo0o4xlwuPzP
 rScJCbDB0yo2oWU+tBYARp0BlHrDW7tZxqKSCafHjqTLqki/eivaAhxHrdMStNo8mh8Q
 wiApOcVgi8opyUCJv9tEHFzCdi2ryX9Qa1SyY6ceatI1ioMFs+1u7DD0mhOCBU8wZAWb
 pv/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5Ra2hbbJlM1B22w2OajwI2CvpXY6aPxc/8njNnw7VVg=;
 b=fjhAPN8JW0YGIdAKAu7rDktDV3OXe/tlAEZwf3bCjzfDwlQZtDI92DZ0iaU675v9ki
 tRwSs0R22EPa4l+T1ACprLRiAL7SJLBp6Y6mKqNfKJZf0DGBuNnyWxiuOH6bPkYp2xma
 6qJVKXHYxrkq8FQp2H2R88S1c3jbaQmZySoXuzp2npvaazDlxa0ZhekwAfzDFrI1Ci/O
 gtBUTJ1mVRrBpIEn8V7UBckOEOXv2R3MQTybwDo9tBSKYdR5KnXb4T3Yp3jsxlFlelCv
 kmqLG7LpdTGJcDe1cRgQFVw/SbFaa9yv5YvE7AUzeS+qP7nckppLGY5vJ3a+u51JZ1HY
 7aAQ==
X-Gm-Message-State: AOAM530MQ9bwRJw/eqDNYTJw5IXMPoAZ2CfpR6IP514uEn/v1KO6BFnS
 OV5laUB4fyZyJiHo/fDOa5kBJ59RaHRotdmfbj4=
X-Google-Smtp-Source: ABdhPJxexGRX+3wB2vjPqGy9i9oHPPe55ZJDl5uqPtHcivXlll+k9Y0TSny2shqL9Kx4ADoWdOEQZ46CKpSqN/DJ7CU=
X-Received: by 2002:a7b:c846:: with SMTP id c6mr369583wml.143.1605227575864;
 Thu, 12 Nov 2020 16:32:55 -0800 (PST)
MIME-Version: 1.0
References: <20201112230924.GA1283868@intel.com>
In-Reply-To: <20201112230924.GA1283868@intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 13 Nov 2020 10:32:44 +1000
Message-ID: <CAPM=9twOzjdgcQxXR3K6f_aYcasnB-DyQ=3qZey=v3VeqGjjsg@mail.gmail.com>
Subject: Re: [PULL] drm-intel-fixes
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
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
Cc: "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 13 Nov 2020 at 09:08, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>
> Hi Dave and Daniel,
>
> This is the same set as last week + couple new fixes targeting stable.
>

But I merged last weeks set and it's in rc3, maybe you can generate
the pull request relative to origin/master or drm/drm-fixes because
I'm not sure which bits to edit out here.

Dave.

> Thanks,
> Rodrigo.
>
> drm-intel-fixes-2020-11-12-1:
> - GVT fixes including vGPU suspend/resume fixes and workaround for APL guest GPU hang.
> - Fix set domain's cache coherency (Chris)
> - Fixes around breadcrumbs (Chris)
> - Fix encoder lookup during PSR atomic (Imre)
> - Hold onto an explicit ref to i915_vma_work.pinned (Chris)
> - Pull phys pread/pwrite implementations to the backend (Chris)
> - Correctly set SFC capability for video engines
> The following changes since commit 3cea11cd5e3b00d91caf0b4730194039b45c5891:
>
>   Linux 5.10-rc2 (2020-11-01 14:43:51 -0800)
>
> are available in the Git repository at:
>
>   git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2020-11-12-1
>
> for you to fetch changes up to a4264790f4c2f0062d27d8173344c914bc7884e0:
>
>   drm/i915: Correctly set SFC capability for video engines (2020-11-12 16:41:54 -0500)
>
> ----------------------------------------------------------------
> - GVT fixes including vGPU suspend/resume fixes and workaround for APL guest GPU hang.
> - Fix set domain's cache coherency (Chris)
> - Fixes around breadcrumbs (Chris)
> - Fix encoder lookup during PSR atomic (Imre)
> - Hold onto an explicit ref to i915_vma_work.pinned (Chris)
> - Pull phys pread/pwrite implementations to the backend (Chris)
> - Correctly set SFC capability for video engines
>
> ----------------------------------------------------------------
> Chris Wilson (6):
>       drm/i915/gem: Flush coherency domains on first set-domain-ioctl
>       drm/i915/gt: Use the local HWSP offset during submission
>       drm/i915/gt: Expose more parameters for emitting writes into the ring
>       drm/i915/gt: Flush xcs before tgl breadcrumbs
>       drm/i915: Hold onto an explicit ref to i915_vma_work.pinned
>       drm/i915/gem: Pull phys pread/pwrite implementations to the backend
>
> Colin Xu (4):
>       drm/i915/gvt: Allow zero out HWSP addr on hws_pga_write
>       drm/i915/gvt: Set SNOOP for PAT3 on BXT/APL to workaround GPU BB hang
>       drm/i915/gvt: Only pin/unpin intel_context along with workload
>       drm/i915/gvt: Fix mmio handler break on BXT/APL.
>
> Imre Deak (1):
>       drm/i915: Fix encoder lookup during PSR atomic check
>
> Matthew Auld (1):
>       drm/i915/gem: Allow backends to override pread implementation
>
> Venkata Sandeep Dhanalakota (1):
>       drm/i915: Correctly set SFC capability for video engines
>
>  drivers/gpu/drm/i915/display/intel_psr.c         |  2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_domain.c       | 28 ++++++------
>  drivers/gpu/drm/i915/gem/i915_gem_object_types.h |  2 +
>  drivers/gpu/drm/i915/gem/i915_gem_phys.c         | 55 ++++++++++++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_engine.h           | 55 +++++++++++++++---------
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c        |  3 +-
>  drivers/gpu/drm/i915/gt/intel_lrc.c              | 31 +++++++++----
>  drivers/gpu/drm/i915/gt/intel_timeline.c         | 18 ++++----
>  drivers/gpu/drm/i915/gt/intel_timeline_types.h   |  2 +
>  drivers/gpu/drm/i915/gvt/handlers.c              | 47 ++++++++++++++++++--
>  drivers/gpu/drm/i915/gvt/scheduler.c             | 15 ++++---
>  drivers/gpu/drm/i915/i915_gem.c                  | 32 +++-----------
>  drivers/gpu/drm/i915/i915_vma.c                  |  6 ++-
>  13 files changed, 204 insertions(+), 92 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
