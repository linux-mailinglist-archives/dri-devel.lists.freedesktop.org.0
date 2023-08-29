Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E177A78C353
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 13:32:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E8D210E21E;
	Tue, 29 Aug 2023 11:32:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB18F10E21F
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 11:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693308730; x=1724844730;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+VfxAwqd1V3EMsoIm0yH1nWlcYsFL3fAly1z6hsuAI4=;
 b=LBFe6cCgA4S3By2cXXV52R+qYYfYCFMd9TZvwWAqLOZSwJLuV7PTBSwv
 rZsyYt0DqG0UHBNH75d8vzPXMA9DKS7c6hFUz/rdlxzKHXs0QT4lBaPqf
 NTfCS4Dn10dmjr02y2YI7/lYPwmETTZ+qEOI4d4MDTFxJ5GdkoIUbXxCQ
 +iI+wVw74cB1s0m0BS9kMVuy4Z7I6NIElEkeTYaGgkf8YORlXTu1iK4mV
 C/jCUY7iMD42JH20bq9hpkPn97qVQPTRDGlTklDdOgVd4chxO98xjg1cT
 IKbt5PoOVBv5NxpI7bw3YbVqXMHPifY04sIREwvyHWF+gJSFW6Rz0oqdk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="461705526"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="461705526"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 04:31:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="1069443473"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="1069443473"
Received: from ogbrugge-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.249.42.59])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 04:31:41 -0700
Date: Tue, 29 Aug 2023 13:31:37 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Christian =?iso-8859-15?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 2/5] drm/debugfs: disallow debugfs access when device
 isn't registered
Message-ID: <ZO3XGchG9fGjoW9K@ashyti-mobl2.lan>
References: <20230829110115.3442-1-christian.koenig@amd.com>
 <20230829110115.3442-3-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230829110115.3442-3-christian.koenig@amd.com>
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
Cc: ogabbay@kernel.org, ttayar@habana.ai, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On Tue, Aug 29, 2023 at 01:01:12PM +0200, Christian König wrote:
> During device bringup it might be that we can't access the debugfs files.
> Return -ENODEV until the registration is completed on access.

just wondering, if the device is not registered, how do we get
there?

Andi
