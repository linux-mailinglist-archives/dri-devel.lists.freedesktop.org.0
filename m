Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E35F9493CAA
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 16:09:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF24F10E1D9;
	Wed, 19 Jan 2022 15:09:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E2510E1E5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 15:09:01 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id c66so5540641wma.5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 07:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=JfTzYIQ5CBU7MZcoE/D/+H+bFsHspdTmk7jkZaYhv2k=;
 b=kbjQCKA1QRci43p1Ut9cACchTYc0jn1WmwDkmdIPwy825BH6ZC+ieyuJfFQSnPlthT
 +MjkQeQKynX8sBjBNXChgqk0eLDZ0WxZ4TEJdcLKdc0YCc9pcC2BxE03P+1p90+aduug
 PzwF11Dtvk/5aUDqD4FqeOdXcoAcm48CI56+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=JfTzYIQ5CBU7MZcoE/D/+H+bFsHspdTmk7jkZaYhv2k=;
 b=D0itUgC1mPXHJifJL9NB43YIJnu2y7PXoyntEXIxgtaRnQHF30rwGLqZGUc34ivGtP
 88K/NM5EJeLQtraZEqfdKjd/OSYAZN1Drszz3NeWAc8tpUFz2WinTiMwLSUwEMllMibo
 izBsHRJRyymcSBYXMwkzOOA7X1VBLQRykeGP64eQ9AO55xZs/83b7zcd2ocD/lXvS7YW
 qtNCMmDonM6n1I+81S8F1wn9IX5BuX81TzG0g6L0GvEaRgVikY2eErGnl9fi9gnBtRJW
 Pdd+P0X6fakwV4Vnj/rqrkjlkWzb/LYZfYDGSQ1yW5HNNQ1lJHOAsS+fwa2dKaD6y4+V
 iJ+g==
X-Gm-Message-State: AOAM532FKf/qDz0iyVRjbhS5N0+eje86yXZwFOUneF8QkMU/G5L8lDa6
 OXaRXL1dSD8eR7NU2kCOku1epQ==
X-Google-Smtp-Source: ABdhPJzTwSLSZN3vkhrYK45F6U6V7Z8h6lWhT+QjdKHpDEXdC8JUWaVJ4jrpZUhcWT2O5xRVXdZ0SA==
X-Received: by 2002:a05:6000:1d84:: with SMTP id
 bk4mr27934764wrb.708.1642604939987; 
 Wed, 19 Jan 2022 07:08:59 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b1sm125745wrd.78.2022.01.19.07.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 07:08:58 -0800 (PST)
Date: Wed, 19 Jan 2022 16:08:57 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH 6/7] drm: Document fdinfo format specification
Message-ID: <YegpiY3MU15RsEfk@phenom.ffwll.local>
References: <20220106165536.57208-1-tvrtko.ursulin@linux.intel.com>
 <20220106165536.57208-7-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220106165536.57208-7-tvrtko.ursulin@linux.intel.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Chris Healy <cphealy@gmail.com>, David M Nieto <David.Nieto@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 06, 2022 at 04:55:35PM +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Proposal to standardise the fdinfo text format as optionally output by DRM
> drivers.
> 
> Idea is that a simple but, well defined, spec will enable generic
> userspace tools to be written while at the same time avoiding a more heavy
> handed approach of adding a mid-layer to DRM.
> 
> i915 implements a subset of the spec, everything apart from the memory
> stats currently, and a matching intel_gpu_top tool exists.
> 
> Open is to see if AMD can migrate to using the proposed GPU utilisation
> key-value pairs, or if they are not workable to see whether to go
> vendor specific, or if a standardised  alternative can be found which is
> workable for both drivers.
> 
> Same for the memory utilisation key-value pairs proposal.
> 
> v2:
>  * Update for removal of name and pid.
> 
> v3:
>  * 'Drm-driver' tag will be obtained from struct drm_driver.name. (Daniel)
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: David M Nieto <David.Nieto@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Daniel Stone <daniel@fooishbar.org>
> Cc: Chris Healy <cphealy@gmail.com>
> Acked-by: Christian König <christian.koenig@amd.com>

I'm assuming this ack here and later on is a "amdgpu plans to use this
too" kind of affair. Especially also in the lights of eventually using
matching semantics for cgroups and everything else tied to gpu execution
resource management.

If not I'm mildly worried that we're creating fake-standard stuff here
which cannot actually be used by anything resembling driver-agnostic
userspace.
-Daniel

> ---
>  Documentation/gpu/drm-usage-stats.rst | 97 +++++++++++++++++++++++++++
>  Documentation/gpu/index.rst           |  1 +
>  2 files changed, 98 insertions(+)
>  create mode 100644 Documentation/gpu/drm-usage-stats.rst
> 
> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
> new file mode 100644
> index 000000000000..c669026be244
> --- /dev/null
> +++ b/Documentation/gpu/drm-usage-stats.rst
> @@ -0,0 +1,97 @@
> +.. _drm-client-usage-stats:
> +
> +======================
> +DRM client usage stats
> +======================
> +
> +DRM drivers can choose to export partly standardised text output via the
> +`fops->show_fdinfo()` as part of the driver specific file operations registered
> +in the `struct drm_driver` object registered with the DRM core.
> +
> +One purpose of this output is to enable writing as generic as practicaly
> +feasible `top(1)` like userspace monitoring tools.
> +
> +Given the differences between various DRM drivers the specification of the
> +output is split between common and driver specific parts. Having said that,
> +wherever possible effort should still be made to standardise as much as
> +possible.
> +
> +File format specification
> +=========================
> +
> +- File shall contain one key value pair per one line of text.
> +- Colon character (`:`) must be used to delimit keys and values.
> +- All keys shall be prefixed with `drm-`.
> +- Whitespace between the delimiter and first non-whitespace character shall be
> +  ignored when parsing.
> +- Neither keys or values are allowed to contain whitespace characters.
> +- Numerical key value pairs can end with optional unit string.
> +- Data type of the value is fixed as defined in the specification.
> +
> +Key types
> +---------
> +
> +1. Mandatory, fully standardised.
> +2. Optional, fully standardised.
> +3. Driver specific.
> +
> +Data types
> +----------
> +
> +- <uint> - Unsigned integer without defining the maximum value.
> +- <str> - String excluding any above defined reserved characters or whitespace.
> +
> +Mandatory fully standardised keys
> +---------------------------------
> +
> +- drm-driver: <str>
> +
> +String shall contain the name this driver registered as via the respective
> +`struct drm_driver` data structure.
> +
> +Optional fully standardised keys
> +--------------------------------
> +
> +- drm-pdev: <aaaa:bb.cc.d>
> +
> +For PCI devices this should contain the PCI slot address of the device in
> +question.
> +
> +- drm-client-id: <uint>
> +
> +Unique value relating to the open DRM file descriptor used to distinguish
> +duplicated and shared file descriptors. Conceptually the value should map 1:1
> +to the in kernel representation of `struct drm_file` instances.
> +
> +Uniqueness of the value shall be either globally unique, or unique within the
> +scope of each device, in which case `drm-pdev` shall be present as well.
> +
> +Userspace should make sure to not double account any usage statistics by using
> +the above described criteria in order to associate data to individual clients.
> +
> +- drm-engine-<str>: <uint> ns
> +
> +GPUs usually contain multiple execution engines. Each shall be given a stable
> +and unique name (str), with possible values documented in the driver specific
> +documentation.
> +
> +Value shall be in specified time units which the respective GPU engine spent
> +busy executing workloads belonging to this client.
> +
> +Values are not required to be constantly monotonic if it makes the driver
> +implementation easier, but are required to catch up with the previously reported
> +larger value within a reasonable period. Upon observing a value lower than what
> +was previously read, userspace is expected to stay with that larger previous
> +value until a monotonic update is seen.
> +
> +- drm-memory-<str>: <uint> [KiB|MiB]
> +
> +Each possible memory type which can be used to store buffer objects by the
> +GPU in question shall be given a stable and unique name to be returned as the
> +string here.
> +
> +Value shall reflect the amount of storage currently consumed by the buffer
> +object belong to this client, in the respective memory region.
> +
> +Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
> +indicating kibi- or mebi-bytes.
> diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
> index b9c1214d8f23..b99dede9a5b1 100644
> --- a/Documentation/gpu/index.rst
> +++ b/Documentation/gpu/index.rst
> @@ -10,6 +10,7 @@ Linux GPU Driver Developer's Guide
>     drm-kms
>     drm-kms-helpers
>     drm-uapi
> +   drm-usage-stats
>     driver-uapi
>     drm-client
>     drivers
> -- 
> 2.32.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
