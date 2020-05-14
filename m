Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FFB1D2E0F
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 13:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D1366E328;
	Thu, 14 May 2020 11:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515AF6E323;
 Thu, 14 May 2020 11:19:29 +0000 (UTC)
IronPort-SDR: HOvT2pzfbDeOR26Y7wjGAYBH789Unm9yg4VFb3P0x38nBMJVMy9lf7REK/jwSZbHUE+zXVdysl
 qjlEmNv66VYA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2020 04:19:28 -0700
IronPort-SDR: T/9E/clvfkcfmrudsl3Ktg4mE8EfkEMb5IruAQHfs4jdk5Lcvbrkt5++8Mp0mC44m5cEcmUipl
 AtALqGTn8sjA==
X-IronPort-AV: E=Sophos;i="5.73,391,1583222400"; d="scan'208";a="410036713"
Received: from oalgaze-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.39.44])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2020 04:19:25 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v12 00/14] In order to readout DP SDPs,
 refactors the handling of DP SDPs
In-Reply-To: <20200514060732.3378396-1-gwan-gyeong.mun@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200514060732.3378396-1-gwan-gyeong.mun@intel.com>
Date: Thu, 14 May 2020 14:19:23 +0300
Message-ID: <87eerm4vd0.fsf@intel.com>
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 14 May 2020, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com> wrote:
> In order to readout DP SDPs (Secondary Data Packet: DP HDR Metadata
> Infoframe SDP, DP VSC SDP), it refactors handling DP SDPs codes.
> It adds new compute routines for DP HDR Metadata Infoframe SDP
> and DP VSC SDP. 
> And new writing routines of DP SDPs (Secondary Data Packet) that uses
> computed configs.
> New reading routines of DP SDPs are added for readout.
> It adds a logging function for DP VSC SDP.
> When receiving video it is very useful to be able to log DP VSC SDP.
> This greatly simplifies debugging.
> In order to use a common VSC SDP Colorimetry calculating code on PSR,
> it uses a new psr vsc sdp compute routine.

Pushed the series to drm-intel-next-queued with Daniel's irc ack for
merging the two non-i915 patches that route too.

Thanks for the patches and review!

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
