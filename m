Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C2F82515F
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 11:00:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A4F10E5AB;
	Fri,  5 Jan 2024 10:00:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF4710E5AB;
 Fri,  5 Jan 2024 10:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704448804; x=1735984804;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FlPOy+aVg9hQ4sCsNZICXq5mmIRzSyfeKZVF/kLB/UY=;
 b=h4hbfKB52ahee5SyAoCWO9XI0fjJSeGXBbwBRSIYxVzBdH8KVup1ngJF
 yEz9J39KNGdQSkanZPx6LYgz4yw6wQ9sBIan2vt6WNbXQnllqIr6HFfDE
 hYYd+fph6wwaP2B3hec7P6SQ6z3Hy8rz3S5ytGUnjoQn8d+j4nYKmZNYW
 d6mnnGpFdRkTKrmo6y8B9rquNLBACYZHEVcPr2s+al0WXieoBAkhvJoRv
 zhtlcW87PgjmicEWnqV0iIHKfqAwNq3xG8oZuL0Ih5MHMXqup2KM8Ex3H
 ZC5MgxcY1BLj+zc++IK4IYVV/nicnxvj2Gogc/oybMtnETsYJ0INWsRaW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4243838"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="4243838"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 02:00:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="846534726"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="846534726"
Received: from ftrahe-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.36.116])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 01:59:59 -0800
Date: Fri, 5 Jan 2024 10:59:56 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 2/3] drm/hisilicon: include drm/drm_edid.h only where
 needed
Message-ID: <ZZfTHAbysZnBlvrg@ashyti-mobl2.lan>
References: <20240104201632.1100753-1-jani.nikula@intel.com>
 <20240104201632.1100753-2-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240104201632.1100753-2-jani.nikula@intel.com>
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Yongqin Liu <yongqin.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 John Stultz <jstultz@google.com>, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

On Thu, Jan 04, 2024 at 10:16:31PM +0200, Jani Nikula wrote:
> Reduce the need for rebuilds when drm_edid.h is modified by including it
> only where needed.
> 
> Cc: Xinliang Liu <xinliang.liu@linaro.org>
> Cc: Tian Tao  <tiantao6@hisilicon.com>
> Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Yongqin Liu <yongqin.liu@linaro.org>
> Cc: John Stultz <jstultz@google.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
