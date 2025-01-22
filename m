Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB7AA18B22
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 05:48:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B946210E283;
	Wed, 22 Jan 2025 04:48:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SXS0yejQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1415E10E2D4;
 Wed, 22 Jan 2025 04:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737521322; x=1769057322;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iMaXACMURgli3ZtGpip9gpyVmugdXalQ98jx7Q9T6ko=;
 b=SXS0yejQEEnuAqVdD9G4tiiHUwRH+AZDMm1tUowKVbzHxr0nB5rr+49o
 +QPOHIvA2wh5Q3kEg408No7y3kxt5yod91FNAPXyEgwBqGIuPby3mld4x
 FZRM3FUBmbujDlECYz/U1DL4tM3D7GO3UCE3CYTv//gJmBu84lOYi9O9S
 ourBXXta4pCsydomdZ+FJR3RKGArtnyrb9QdpbB2qqOJLTGLXo42d1HCh
 dpoP+JFrI4XgvNSZzdc4CX68Zf1gvu9QvBzsfpc5tejL1MwdDrOIWpUIm
 twtwLveXb+2rEI0IW/clVLUmqvv5/k9nfMLCRk57BNoy6VPzbUe4p6Dio A==;
X-CSE-ConnectionGUID: U09vFCqMQdC4fGs8spnlBw==
X-CSE-MsgGUID: 5O0u6rtuQK2ih/XUF42L2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="48628750"
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; d="scan'208";a="48628750"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 20:48:42 -0800
X-CSE-ConnectionGUID: 3irDzB9/R/CdJfHQYz4KNQ==
X-CSE-MsgGUID: rD5B8qHZTiCjrUj9Dlyyhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; d="scan'208";a="107556201"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 20:48:37 -0800
Date: Wed, 22 Jan 2025 06:48:34 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Xaver Hugl <xaver.hugl@kde.org>
Cc: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 andriy.shevchenko@linux.intel.com, lina@asahilina.net,
 michal.wajdeczko@intel.com, christian.koenig@amd.com,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 alexander.deucher@amd.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH v10 0/4] Introduce DRM device wedged event
Message-ID: <Z5B4ogLqSMT7aE-r@black.fi.intel.com>
References: <20241128153707.1294347-1-raag.jadav@intel.com>
 <CAFZQkGwJ4qgHV8WTp2=svJ_VXhb-+Y8_VNtKB=jLsk6DqMYp9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFZQkGwJ4qgHV8WTp2=svJ_VXhb-+Y8_VNtKB=jLsk6DqMYp9w@mail.gmail.com>
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

On Tue, Jan 21, 2025 at 01:59:47AM +0100, Xaver Hugl wrote:
> Hi,
> 
> I experimented with using this in KWin, and
> https://invent.kde.org/plasma/kwin/-/merge_requests/7027/diffs?commit_id=6da40f1b9e2bc94615a436de4778880cee16f940
> makes it fall back to a software renderer when a rebind is required to
> recover the GPU.
> Making it also survive the rebind properly is more challenging
> (current version of the MR doesn't do it for you and just crashes if
> you do it with a udev rule or manually), but it's doable - and not a
> problem of the API.
> 
> I'd really like to have the PID of the client that triggered the GPU
> reset, so that we can kill it if multiple resets are triggered in a
> row (or switch to software rendering if it's KWin itself) and show a
> user-friendly notification about why their app(s) crashed, but that
> can be added later.

Excellent! While we have our consumer implementation in progress, it's
always good to have wider adoption.

Thank you for your contribution.

Raag
