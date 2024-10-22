Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 226D19AA2C4
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 15:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6161E10E68B;
	Tue, 22 Oct 2024 13:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GnPa+/U9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8CCC10E687
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 13:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729602429; x=1761138429;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=LxK9dOQy9ZT1voxqBg5jjMACV/hPHIhBynHpfUsk3ro=;
 b=GnPa+/U9wKMHpGewQ8jYO6V4KYjjP4d9Z+HMNz5fUGGMkaR2p5kS9g0Q
 KwdmanlbB2evmaFP0I3bf1Yrx6PwTq0lLwWxcp5lr/WM+7uxIQiI6fNbU
 COKUxKCTtHkJNum2Jn6hHdYDAAG1cB+cOsqVCLL56a7ftmMGy/MAsocah
 XWcDcbCvq8PHhPs//nIqYABBZo7ZrMPtJhB0nYy6lBeCVUKwJ5ypPJimi
 LlPzRVDIsIZiaLHAJsPJBA6GtahUWFGnivWMpl3MG47B2/E2cfGn8qmQ4
 0kbhY2+YLefPpcaDbjJ/2D+g5J7w9SnLV3ExN5j7qE7Lnfsmc+dRyQFdt g==;
X-CSE-ConnectionGUID: a9fwccmNTcSSYZ9EIPdrGQ==
X-CSE-MsgGUID: 72QO0pHaQNecUBIBip0MYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="39718637"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="39718637"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 06:06:50 -0700
X-CSE-ConnectionGUID: m/aDOiOKQjO7CCmW/la81g==
X-CSE-MsgGUID: e9oeB9FcSvWhS3UGdlUT4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="79929622"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 22 Oct 2024 06:06:47 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 22 Oct 2024 16:06:46 +0300
Date: Tue, 22 Oct 2024 16:06:46 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: CK Hu =?utf-8?B?KOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v2 09/10] drm/mediatek: Allow build with COMPILE_TEST=y
Message-ID: <ZxejZnvO4mlKT4j8@intel.com>
References: <20241003111851.10453-1-ville.syrjala@linux.intel.com>
 <20241003111851.10453-10-ville.syrjala@linux.intel.com>
 <574344f74186e9cf930fb20289a0ed48d7ee436b.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <574344f74186e9cf930fb20289a0ed48d7ee436b.camel@mediatek.com>
X-Patchwork-Hint: comment
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

On Tue, Oct 22, 2024 at 09:46:24AM +0000, CK Hu (胡俊光) wrote:
> Hi, Ville:
> 
> On Thu, 2024-10-03 at 14:18 +0300, Ville Syrjala wrote:
> >  	 
> > External email : Please do not click links or open attachments until you have verified the sender or the content.
> >  From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > Allow mediatek to be built with COMPILE_TEST=y for greater
> > coverage. Builds fine on x86/x86_64 at least.
> 
> I don't know why need this greater coverage?

It allows people to make subsystem wide changes without
having to cross compile on every single architecture to
see if the code still builds.

> This driver always execute on ARM.

COMPILE_TEST (as the name suggests) is only about compile
testing the code.

-- 
Ville Syrjälä
Intel
