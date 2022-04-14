Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C91635007B8
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 10:02:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C44310E286;
	Thu, 14 Apr 2022 08:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95BBA10E286;
 Thu, 14 Apr 2022 08:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649923348; x=1681459348;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=G0tciW/UHApLvYuv6d7WeKQxRv3KKek2gtNhQj5Dy5w=;
 b=nUNu9jD7TRCThj52sx98QlLGE5UyJh7aW8tq4fuWKDEgwQifQogdykDi
 il6OC0HHGIzJVSix4Q/amcmTIdEAtcdhZzkkLPsHQeg56+TUWyRBdEeDU
 Rq7fXemLi8umHl7qMIZQ/5ILp2TqbmkGFP7KUVWeXP8blj0TrTUouhnbm
 ltnfMTmCt1laTxYLALYl0WkJzvNdYW7VvaM3c4/po8NIdCmbTGCtRa8mZ
 jPdi0PeZMRg6NNkPolOjzP1jPTgpvf14X+QlBiKIS68dvOMuXPZLinsCp
 FGK0LbZoa4/Gupnl4fl0X5nz61cuMg0kuigmjSBrYfBoWy/1rAi4BnEaq g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="323320201"
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="323320201"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 01:02:27 -0700
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="803043373"
Received: from unknown (HELO intel.com) ([10.237.72.65])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 01:02:25 -0700
Date: Thu, 14 Apr 2022 11:03:12 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: =?iso-8859-1?Q?Fran=E7ois?= Valenduc <francoisvalenduc@gmail.com>
Subject: Re: commit 15512021eb3975a8c2366e3883337e252bb0eee5 causes white
 spots in console screens
Message-ID: <20220414080312.GA31389@intel.com>
References: <0da21aec-d299-1834-99f3-9a598e4649f7@gmail.com>
 <87v8vcgb63.fsf@intel.com> <20220414063139.GA31013@intel.com>
 <9d497fb9-4504-9e64-1d7f-9353cf96624c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9d497fb9-4504-9e64-1d7f-9353cf96624c@gmail.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 14, 2022 at 08:33:35AM +0200, François Valenduc wrote:
> Le 14/04/22 à 08:31, Lisovskiy, Stanislav a écrit :
> > On Wed, Apr 13, 2022 at 08:12:20PM +0300, Jani Nikula wrote:
> > > On Wed, 13 Apr 2022, François Valenduc <francoisvalenduc@gmail.com> wrote:
> > > > Commit 15512021eb3975a8c2366e3883337e252bb0eee5
> > > > (15512021eb3975a8c2366e3883337e252bb0eee5) causes a lof of white spots
> > > > to appears on the right upper corner of all console screens (see
> > > > https://drive.google.com/file/d/13GabEvOIKSAj5yox6ybAZEDu3Ixncw5Q/view).
> > > > git-bisect shows that this is the offending commit and if I revert it,
> > > > the problem goes away. The problem still occurs with kernel 5.18-rc2 and
> > > > to all stable trees where it was applied.
> > > > Can somebody explains what happens ?
> > > > 
> > > > The video card is the following: VGA compatible controller: Intel
> > > > Corporation WhiskeyLake-U GT2 [UHD Graphics 620] (rev 02) (prog-if 00
> > > > [VGA controller])
> > > > 
> > > > Please tell me if you need more info.
> > > That's commit 15512021eb39 ("drm/i915: Workaround broken BIOS DBUF
> > > configuration on TGL/RKL"), adding Cc's.
> > > 
> > > Please file a report at fdo gitlab [1] and attach dmesg etc. there.
> > That commit looks like it is just disabling all the planes, if wrong
> > dbuf/wm configuration is detected.
> > However it should do that only once during boot as I understand.
> > 
> > Are you sure that is exactly this commit which is causing this?
> > Does the issue appear always?
> > 
> > Ville Syrjälä, thoughts?
> > 
> > Stan
> > 
> > > Thanks,
> > > Jani.
> > > 
> > > 
> > > [1] https://gitlab.freedesktop.org/drm/intel/wikis/How-to-file-i915-bugs
> > > 
> > > 
> > > -- 
> > > Jani Nikula, Intel Open Source Graphics Center
> 
> As I said, git-bisect shows it's the offending commit and if I revert it,
> the problem doesn't happens. Otherwise, it always occurs.
> 
> François
>

Does it just happen all the time or some steps/certain circumstances needed
for it to happen?

Only suspicion after looking briefly is that once suspend/resume is done
it might be messing something up. Just a quick guess..

Stan 
