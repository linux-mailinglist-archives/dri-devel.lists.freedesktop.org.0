Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDDA37A95A
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 16:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 769F76EA55;
	Tue, 11 May 2021 14:31:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6378E6EA48;
 Tue, 11 May 2021 14:31:55 +0000 (UTC)
IronPort-SDR: OlirTOdNPuHjIHCXGVwf2buxrXTj11LzPtn8Azjqran/tJbaVnOfiX8XPCPer4ANTJw6NVBzU7
 UQdoFJ+AYBng==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="284946111"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="284946111"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 07:31:34 -0700
IronPort-SDR: qCrlyJaXV9SkWdyIBZnuzQfHfOzwIA2iGRu3+gEIzlGkGc3Hzn1V4Z7U4hKBYsQ7qAhxmQvSay
 n9icrFIsSrtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="434471084"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga008.fm.intel.com with SMTP; 11 May 2021 07:31:31 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 11 May 2021 17:31:30 +0300
Date: Tue, 11 May 2021 17:31:30 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH v7 0/3] drm/i915/display: Try YCbCr420 color when RGB fails
Message-ID: <YJqVQsnuQR7nVrnW@intel.com>
References: <20210510133349.14491-1-wse@tuxedocomputers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210510133349.14491-1-wse@tuxedocomputers.com>
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
Cc: airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 10, 2021 at 03:33:46PM +0200, Werner Sembach wrote:
> When encoder validation of a display mode fails, retry with less bandwidth
> heavy YCbCr420 color mode, if available. This enables some HDMI 1.4 setups
> to support 4k60Hz output, which previously failed silently.
> 
> AMDGPU had nearly the exact same issue. This problem description is
> therefore copied from my commit message of the AMDGPU patch.
> 
> On some setups, while the monitor and the gpu support display modes with
> pixel clocks of up to 600MHz, the link encoder might not. This prevents
> YCbCr444 and RGB encoding for 4k60Hz, but YCbCr420 encoding might still be
> possible. However, which color mode is used is decided before the link
> encoder capabilities are checked. This patch fixes the problem by retrying
> to find a display mode with YCbCr420 enforced and using it, if it is
> valid.
> 
> This patchset is revision 7. Fixed a rebase issue in 1/3 and moved message
> from error output to debug output in 2/3.

Looks good and CI seem shappy. 

Series pushed to drm-intel-next. Thanks.

-- 
Ville Syrjälä
Intel
