Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1644E569F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 17:38:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5541A10E6EE;
	Wed, 23 Mar 2022 16:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B6B10E6EE;
 Wed, 23 Mar 2022 16:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648053511; x=1679589511;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=oOClUr8v7NIBwjfvJAfwavbRCaNDFI67ZFqAiSYqeNI=;
 b=oGODEJDhtqsrzhDJoemiDtbCqCN+sXBxMIETBHpBZ+VrtUNe30rw0/V0
 za4mkg3JZ/2IxGcMJo5LPjPxgWthwyc6ltRmEFwTtZqRL7eXoLecZ1IDl
 G0TVaYSvX92TS8EFqokrrXRD77unA5z1SWAx3Ibc+icL5EUj8qTroiY4e
 T9nnmSl28DlOtR9cXiQsQLAPk4tw66oLJDJUm3Xa1rmkj6NFUGqBkc2N2
 SFwJatgWhn+VqxAu5Ca+GTz4ry6IBSsSTL4jEnRe5XuPHOjaHxN7WtiKI
 IFklGt3fyTW0FayWGaPiPQ4FQhZteqEnGm2rfSXQXVbxzew4bsT2nF6Ju Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="283010657"
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; d="scan'208";a="283010657"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 09:38:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; d="scan'208";a="515845364"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.61])
 by orsmga002.jf.intel.com with SMTP; 23 Mar 2022 09:38:25 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 23 Mar 2022 18:38:25 +0200
Date: Wed, 23 Mar 2022 18:38:25 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [RFC 00/19] drm/edid: overhaul CEA data block iteration
Message-ID: <YjtNAezEMwx5luCR@intel.com>
References: <cover.1647985054.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1647985054.git.jani.nikula@intel.com>
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
Cc: Cooper Chiou <cooper.chiou@intel.com>, william.tseng@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Drew Davenport <ddavenport@chromium.org>, ankit.k.nautiyal@intel.com,
 Shawn C Lee <shawn.c.lee@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 22, 2022 at 11:40:29PM +0200, Jani Nikula wrote:
> Add iterators for EDID blocks and CEA data blocks, to iterate through
> all data blocks across all CEA extensions and CTA blocks in DisplayID
> data blocks. Fix all code assuming only one CEA extension. Fix code
> assuming CTA blocks contain everything that CEA extensions do. Sprinkle
> a bunch of cleanups on top.
> 
> This is completely UNTESTED, didn't even smoke test it. It builds. ;)

Despite that it's now
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Left a few minor comments here and there.

> 
> This superseeds parts of [1] and [2].
> 
> BR,
> Jani.
> 
> [1] https://patchwork.freedesktop.org/series/101241/
> [2] https://patchwork.freedesktop.org/patch/msgid/20220321044330.27723-1-cooper.chiou@intel.com
> 
> 
> Cc: Shawn C Lee <shawn.c.lee@intel.com>
> Cc: Cooper Chiou <cooper.chiou@intel.com>
> Cc: william.tseng@intel.com
> Cc: ankit.k.nautiyal@intel.com
> Cc: ville.syrjala@linux.intel.com
> Cc: Drew Davenport <ddavenport@chromium.org>
> 
> Jani Nikula (19):
>   drm/edid: add drm_edid_extension_block_count() and drm_edid_size()
>   drm: use drm_edid_extension_block_count() and drm_edid_size()
>   drm/edid: clean up CEA data block tag definitions
>   drm/edid: add iterator for EDID base and extension blocks
>   drm/edid: add iterator for CEA data blocks
>   drm/edid: clean up cea_db_is_*() functions
>   drm/edid: convert add_cea_modes() to use cea db iter
>   drm/edid: convert drm_edid_to_speaker_allocation() to use cea db iter
>   drm/edid: convert drm_edid_to_sad() to use cea db iter
>   drm/edid: convert drm_detect_hdmi_monitor() to use cea db iter
>   drm/edid: convert drm_detect_monitor_audio() to use cea db iter
>   drm/edid: convert drm_parse_cea_ext() to use cea db iter
>   drm/edid: convert drm_edid_to_eld() to use cea db iter
>   drm/edid: sunset the old unused cea data block iterators
>   drm/edid: restore some type safety to cea_db_*() functions
>   drm/edid: detect basic audio only on CEA extension
>   drm/edid: detect color formats and CEA revision only on CEA extension
>   drm/edid: skip CEA extension scan in drm_edid_to_eld() just for CEA
>     rev
>   drm/edid: sunset drm_find_cea_extension()
> 
>  drivers/gpu/drm/drm_connector.c |   2 +-
>  drivers/gpu/drm/drm_debugfs.c   |   3 +-
>  drivers/gpu/drm/drm_edid.c      | 781 ++++++++++++++++++--------------
>  include/drm/drm_edid.h          |   2 +
>  4 files changed, 455 insertions(+), 333 deletions(-)
> 
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
