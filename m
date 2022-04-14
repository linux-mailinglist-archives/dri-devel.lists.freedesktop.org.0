Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6193A50061F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 08:31:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187EE10FCF7;
	Thu, 14 Apr 2022 06:30:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E2A10FCA2;
 Thu, 14 Apr 2022 06:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649917858; x=1681453858;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=DZzHK51pJYRSdJGq2ZuFG5xDG05xMqmcM20l9ST/1BQ=;
 b=ei2f+IwWWdGPzwQwTpdZIX0fsSyPC3dXi+cW1pZ+tDYeBDZ2zA8koy3w
 HyVVpXbQ7JyjvyntiSGV5x0vmLLXhdqiHSk6bch6dn7vbe8Q9RMpebyEL
 dxTbMrxbuXouGVotQItAvkYEXqfVg9Uo2MT2KPjNxji9pe6wMcsxKhEa/
 LD1g3errG7eVzASuuvyK7AJxegbw3sCCDmJvvq6/6kBA+bqFZrk6OLCir
 +23c2l4+gILn0nT+Tl8QiWD+0+RkwXKsHGWud1yDx1mlwyS8XBv5gVYpE
 IiYCbwdzzmixj7jpqR9lvz5roJNAvfcx/jT2klm1iYr05kazViwOXMEHT Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="244745765"
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="244745765"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 23:30:57 -0700
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="661241635"
Received: from unknown (HELO intel.com) ([10.237.72.65])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 23:30:55 -0700
Date: Thu, 14 Apr 2022 09:31:39 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: commit 15512021eb3975a8c2366e3883337e252bb0eee5 causes white
 spots in console screens
Message-ID: <20220414063139.GA31013@intel.com>
References: <0da21aec-d299-1834-99f3-9a598e4649f7@gmail.com>
 <87v8vcgb63.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87v8vcgb63.fsf@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 =?iso-8859-1?Q?Fran=E7ois?= Valenduc <francoisvalenduc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 13, 2022 at 08:12:20PM +0300, Jani Nikula wrote:
> On Wed, 13 Apr 2022, François Valenduc <francoisvalenduc@gmail.com> wrote:
> > Commit 15512021eb3975a8c2366e3883337e252bb0eee5 
> > (15512021eb3975a8c2366e3883337e252bb0eee5) causes a lof of white spots 
> > to appears on the right upper corner of all console screens (see 
> > https://drive.google.com/file/d/13GabEvOIKSAj5yox6ybAZEDu3Ixncw5Q/view). 
> > git-bisect shows that this is the offending commit and if I revert it, 
> > the problem goes away. The problem still occurs with kernel 5.18-rc2 and 
> > to all stable trees where it was applied.
> > Can somebody explains what happens ?
> >
> > The video card is the following: VGA compatible controller: Intel 
> > Corporation WhiskeyLake-U GT2 [UHD Graphics 620] (rev 02) (prog-if 00 
> > [VGA controller])
> >
> > Please tell me if you need more info.
> 
> That's commit 15512021eb39 ("drm/i915: Workaround broken BIOS DBUF
> configuration on TGL/RKL"), adding Cc's.
> 
> Please file a report at fdo gitlab [1] and attach dmesg etc. there.

That commit looks like it is just disabling all the planes, if wrong
dbuf/wm configuration is detected.
However it should do that only once during boot as I understand.

Are you sure that is exactly this commit which is causing this?
Does the issue appear always?

Ville Syrjälä, thoughts?

Stan

> 
> Thanks,
> Jani.
> 
> 
> [1] https://gitlab.freedesktop.org/drm/intel/wikis/How-to-file-i915-bugs
> 
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
