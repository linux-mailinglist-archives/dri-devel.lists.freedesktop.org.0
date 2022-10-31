Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD117613C2C
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 18:30:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E6310E11D;
	Mon, 31 Oct 2022 17:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6766510E11D
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 17:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667237401; x=1698773401;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=3ltsP6T9EWEyCrM8OqXT5q3fuQGDY4Ku8Nj+QBZFxHI=;
 b=eiUQqxPok9W/McHKCoJDI00SuV9w/ZGORitw2ozgkXGvtHi8atZlqMVw
 2syiR0Tnm6TegvDIOgy2iGr57Q0HsEWPH5d68O+6GqVDR/sb8KQNqduGk
 9oKnGWe3fNDvGmbwN5NLmT/o9ZLDyGt3iiGv+mXqoHcHZK+0rYYaemmnS
 82DL1982fQuSnCAEOvCFO3eLdf8joU/DPzOzuf6URJBmS2Ujza7ii8PVJ
 /ThS0UH3rvpw/jNFjuzWbA4X2S97QEVzjwLEdwMww8wBDvBZUFgz2IXBJ
 5HHn1kIMBOuIr9MMAEQq31e3WsARVwc8erzIbUFM2r4gXX3HsP8GkM/BT A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="296375131"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="296375131"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 10:30:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="808627981"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="808627981"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga005.jf.intel.com with SMTP; 31 Oct 2022 10:29:57 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 31 Oct 2022 19:29:56 +0200
Date: Mon, 31 Oct 2022 19:29:56 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pavel Machek <pavel@ucw.cz>
Subject: Re: 6.1-rc: names of video outputs changed?
Message-ID: <Y2AGFPsvY79RE4Jn@intel.com>
References: <20221031165834.GA10150@duo.ucw.cz> <Y2ABatgNLVAAjpSW@intel.com>
 <20221031171952.GA10666@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221031171952.GA10666@duo.ucw.cz>
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

On Mon, Oct 31, 2022 at 06:19:52PM +0100, Pavel Machek wrote:
> Hi!
> 
> > > I used to be able to do:
> > > 
> > > pavel@duo:~$     xrandr --output HDMI1 --mode 1920x1080 --primary
> > > warning: output HDMI1 not found; ignoring
> > > pavel@duo:~$     xrandr --output VGA1 --mode 1280x1024 --below HDMI1
> > > warning: output VGA1 not found; ignoring
> > > 
> > > ...but now I have to do:
> > > 
> > > pavel@duo:~$     xrandr --output VGA-1 --mode 1280x1024 --below HDMI-1
> > > xrandr: cannot find crtc for output VGA-1
> > > pavel@duo:~$     xrandr --output LVDS-1 --off
> > > pavel@duo:~$     xrandr --output VGA-1 --mode 1280x1024 --below HDMI-1
> > > 
> > > Notice the change from HDMI1 to HDMI-1. I believe that's new in 6.1 or
> > > so. Who did it and why? Hardware is thinkpad x220, and this breaks my
> > > scripts :-(.
> > 
> > Are you sure you didn't just switch from intel ddx to modesetting ddx?
> 
> How do I tell?

You can read through your Xorg log file.

Or you can do something like this:
lsof -p $(pidof X) | grep _drv.so

-- 
Ville Syrjälä
Intel
