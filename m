Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 965239DFBA0
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 09:08:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF5510E10E;
	Mon,  2 Dec 2024 08:08:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S4dfShbo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 035B210E082;
 Mon,  2 Dec 2024 08:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733126880; x=1764662880;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=g1c8VLfHC911GFwkbszh1lMygP1JoQ4SivJ3Uzr/lns=;
 b=S4dfShboluQS9O5xZAxNn09OLUanS1jyUWqNjOLqyjJ9wH1MFn2tQGrb
 Wr+6y+8pqPPKf1wOKa4zz6ltw1+LO//wGoAB8qtefZeebLNpYy6KZlsoL
 6pKcCSh5F8GvkMWd64YgkYr3aJlJQIuEuIDxOtaIzzVBeqttYqi2McfWb
 ZWJHmwOcn6p84waoRvD6ROhBKPUAdlsxSYJs+zq5UZlOd+LbqFhbgOz3L
 RLCHS9NCQDZ3CVcnHRey/mzEDDmuyzcG53yslM8sNnjVb/rkXR7uPvV4d
 yWNqnw/da0VhowmLmR9uErPHlnpjq33dC39gtRwCfYLnhlX82piKcR4gM w==;
X-CSE-ConnectionGUID: ZXUN2IxJTiOErdyZEE9x+Q==
X-CSE-MsgGUID: RVK6HpZLSsyawe9hylf3ZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="32636430"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; d="scan'208";a="32636430"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 00:07:59 -0800
X-CSE-ConnectionGUID: IKb2ij1+S9qJyPm1DZc/ug==
X-CSE-MsgGUID: Vp2KeqXAQDylWJTXOOTNrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; d="scan'208";a="130512551"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 00:07:54 -0800
Date: Mon, 2 Dec 2024 10:07:51 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 aravind.iddamsetty@linux.intel.com, christian.koenig@amd.com,
 rodrigo.vivi@intel.com, michal.wajdeczko@intel.com,
 lina@asahilina.net, anshuman.gupta@intel.com,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, airlied@gmail.com, simona@ffwll.ch,
 lucas.demarchi@intel.com, jani.nikula@linux.intel.com,
 andriy.shevchenko@linux.intel.com
Subject: Re: [PATCH v10 1/4] drm: Introduce device wedged event
Message-ID: <Z01q1-7OF7jgANEM@black.fi.intel.com>
References: <20241128153707.1294347-1-raag.jadav@intel.com>
 <20241128153707.1294347-2-raag.jadav@intel.com>
 <1d448e67-0c28-4e21-afdd-223495346921@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1d448e67-0c28-4e21-afdd-223495346921@igalia.com>
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

On Fri, Nov 29, 2024 at 10:40:14AM -0300, André Almeida wrote:
> Hi Raag,
> 
> Em 28/11/2024 12:37, Raag Jadav escreveu:
> > Introduce device wedged event, which notifies userspace of 'wedged'
> > (hanged/unusable) state of the DRM device through a uevent. This is
> > useful especially in cases where the device is no longer operating as
> > expected and has become unrecoverable from driver context. Purpose of
> > this implementation is to provide drivers a generic way to recover with
> > the help of userspace intervention without taking any drastic measures
> > in the driver.
> > 
> > A 'wedged' device is basically a dead device that needs attention. The
> > uevent is the notification that is sent to userspace along with a hint
> > about what could possibly be attempted to recover the device and bring
> > it back to usable state. Different drivers may have different ideas of
> > a 'wedged' device depending on their hardware implementation, and hence
> > the vendor agnostic nature of the event. It is up to the drivers to
> > decide when they see the need for device recovery and how they want to
> > recover from the available methods.
> > 
> 
> Thank you for your work. Do you think you can add the optional PID
> parameter, as the PID of the app that caused the reset? For SteamOS use case
> it has been proved to be useful to kill the fault app as well. If the reset
> was caused by a kthread, no PID can be provided hence it's an optional
> parameter.

Hmm, I'm not sure if it really fits here since it doesn't seem like
a generic usecase.

I'd still be open for it if found useful by the drivers but perhaps
as an extended feature in a separate series.

Raag
