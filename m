Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F21F613BEB
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 18:10:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF1610E091;
	Mon, 31 Oct 2022 17:10:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 550B410E091
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 17:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667236210; x=1698772210;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=SAXQrfesOB3YLTPAk7qxauA2Uhq6ODe+CXHF5a+y0Aw=;
 b=MMkRPAa0no3nFXe7uPrFQb4r96+iNrPZ9Y3PZGgqnhbQubWegd3YZh0v
 kACw4BEBOEOO9QSU+YqmwkRR2uh62MvXub1gyDXXKBqTqxlwEXi7k77Ba
 Lscsidl5pqEoHhrFDnuxiZ8MW6p7qJ8SzjYtU0jPTXJqcyJA3vhZcWVX5
 zn9v6GqQ9Zf3ltc145pZu76hcJfKCq+Yi8nPM9lVzdc2JRjkqIDWi1HIx
 ZudwEG5565B+PDdJCJ3qOlEi/mAaeHv4AYzU00GMLGQNJ7PLnCBH5dtIr
 s0u+IeR08RD9detUQBW1uSAM/Rs5BpC1povcmPsH/pk6eLOqmjciQ/m+E A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="395266638"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="395266638"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 10:10:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="697099364"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="697099364"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga008.fm.intel.com with SMTP; 31 Oct 2022 10:10:02 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 31 Oct 2022 19:10:02 +0200
Date: Mon, 31 Oct 2022 19:10:02 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pavel Machek <pavel@ucw.cz>
Subject: Re: 6.1-rc: names of video outputs changed?
Message-ID: <Y2ABatgNLVAAjpSW@intel.com>
References: <20221031165834.GA10150@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221031165834.GA10150@duo.ucw.cz>
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org,
 kernel list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 31, 2022 at 05:58:34PM +0100, Pavel Machek wrote:
> Hi!
> 
> I used to be able to do:
> 
> pavel@duo:~$     xrandr --output HDMI1 --mode 1920x1080 --primary
> warning: output HDMI1 not found; ignoring
> pavel@duo:~$     xrandr --output VGA1 --mode 1280x1024 --below HDMI1
> warning: output VGA1 not found; ignoring
> 
> ...but now I have to do:
> 
> pavel@duo:~$     xrandr --output VGA-1 --mode 1280x1024 --below HDMI-1
> xrandr: cannot find crtc for output VGA-1
> pavel@duo:~$     xrandr --output LVDS-1 --off
> pavel@duo:~$     xrandr --output VGA-1 --mode 1280x1024 --below HDMI-1
> 
> Notice the change from HDMI1 to HDMI-1. I believe that's new in 6.1 or
> so. Who did it and why? Hardware is thinkpad x220, and this breaks my
> scripts :-(.

Are you sure you didn't just switch from intel ddx to modesetting ddx?

-- 
Ville Syrjälä
Intel
