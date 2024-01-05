Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7F2825308
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 12:42:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA18A10E5D6;
	Fri,  5 Jan 2024 11:41:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 977FF10E5D6;
 Fri,  5 Jan 2024 11:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704454918; x=1735990918;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=AIqKrJa1Ir72muVTZKMCEU6U6ADnPC25ZR4ehwhrhgU=;
 b=JKqtMYa6SbYs6SF0IrY2t0AtshRNywQZ3hBHVLc6wyL+qz0cGq/vq6BG
 lU2TjKrS31b6zjXz7CJ/1nVdLfjZV3NrGvfwBDOuxEMlBF9295OE2xuhp
 StDkdDrvrWv1y0sNrjnNHWzeHkjnir0lZe3JKGl3UgQFfESmJyHsC8/cB
 AGh/KCJwcCzkvn13a9szBOfV55kgd2oTJ71vuHV6syl1YzGe5p+bQJqkK
 GCOHLhwc1e4p7FsDP57uiRrdwQWiq0/WKbFXRnEGlohDGe8GIPk+u1+ws
 GsGpWG8q83+omBsQRzAjJpMTF3GtI5sQYVgly4naoYeQFBSjaWar6C/w/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="382466866"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="382466866"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 03:41:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="756922330"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="756922330"
Received: from amaslenx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.36.106])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 03:41:56 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: Re: [RESEND] drm/edid: prefer forward declarations over includes in
 drm_edid.h
In-Reply-To: <2d74c31f-7a54-449d-9ddd-9a902be86ee1@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240104211028.1129606-1-jani.nikula@intel.com>
 <2d74c31f-7a54-449d-9ddd-9a902be86ee1@suse.de>
Date: Fri, 05 Jan 2024 13:41:53 +0200
Message-ID: <87zfxkxb0e.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 05 Jan 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 04.01.24 um 22:10 schrieb Jani Nikula:
>> There's no need to include either linux/hdmi.h or drm/drm_mode.h. They
>> can be removed by using forward declarations.
>> 
>> While at it, group the forward declarations together, and remove the
>> unnecessary ones.
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks, pushed to drm-misc-next.

BR,
Jani.


-- 
Jani Nikula, Intel
