Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F19BF4822F3
	for <lists+dri-devel@lfdr.de>; Fri, 31 Dec 2021 10:10:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF82510E321;
	Fri, 31 Dec 2021 09:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D72A10E321
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Dec 2021 09:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640941845; x=1672477845;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=k6iD2CsmmCXpmRSNBtnKDt7eZEDt3D8xbZ03Fpz/wgI=;
 b=T4Vw6rcD7r3AQqbjRMyV1PwNTYVO3xo16RG1azxiHv9opgSPsIlOsKU+
 3kj9IPiJCN6qRfUc+PP6h7ofslyDXqqUVbKIJllzxCeRzXTJAWrGwxBkq
 3MZy8QmHkfyvOxd1HdO1Ikeix4CkDlUY53sjc6HfEA2MgCDsM6g9XycoF
 YI9Ai2UZ0Y+pI+KP3b0HpcVujmFvpAkDu2sEGbgEbpNHja+nOmlzBTcRh
 xIuCMgyzpJudzgTy+SwnBiq9xWYfEN39zkuEH19OuLfikpkV178EQoWP+
 PKRvOkw7pDwf2+DxhaRKW6qOgXuTEo4MQxHEStjyoisdDbu6AduWOpb/m g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10213"; a="228615655"
X-IronPort-AV: E=Sophos;i="5.88,251,1635231600"; d="scan'208";a="228615655"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2021 01:10:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,251,1635231600"; d="scan'208";a="687450432"
Received: from arudakov-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.25.42])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2021 01:10:41 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Claudio Suarez <cssk@net-c.es>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm: get rid of DRM_DEBUG_* log calls in drm core,
 files drm_{b,c}*.c
In-Reply-To: <Yc4Q7vqVDv/UcaVA@gineta.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <Yc2Pd/DhQ7EpD+hD@gineta.localdomain>
 <202112302236.ikd2ET5w-lkp@intel.com>
 <Yc4Q7vqVDv/UcaVA@gineta.localdomain>
Date: Fri, 31 Dec 2021 11:10:39 +0200
Message-ID: <875yr5jg1c.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: David Airlie <airlied@linux.ie>, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 30 Dec 2021, Claudio Suarez <cssk@net-c.es> wrote:
> Please, don't apply this patch. I have to review it,.

Please make sure you build with DRM_LEGACY=y to include drm_bufs.c in
the build.

If you Cc: intel-gfx@lists.freedesktop.org on the patch, you'll get
Intel CI results on the patch too.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
