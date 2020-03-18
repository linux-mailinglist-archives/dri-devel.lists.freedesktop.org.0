Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9C818A0CE
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 17:45:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B166E926;
	Wed, 18 Mar 2020 16:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0088.hostedemail.com
 [216.40.44.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBA76E926
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 16:45:44 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id AE11318028500;
 Wed, 18 Mar 2020 16:45:41 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:800:966:967:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2196:2199:2393:2525:2553:2560:2563:2682:2685:2828:2859:2902:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3870:3871:3873:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:4362:4385:5007:6119:7903:9025:10004:10400:10848:11232:11658:11914:12043:12297:12438:12555:12663:12740:12760:12895:12986:13069:13311:13357:13439:14181:14659:14721:21080:21433:21627:21811:21939:30054:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:3, LUA_SUMMARY:none
X-HE-Tag: boys55_88d5603ee8550
X-Filterd-Recvd-Size: 2457
Received: from XPS-9350.home (unknown [47.151.143.254])
 (Authenticated sender: joe@perches.com)
 by omf19.hostedemail.com (Postfix) with ESMTPA;
 Wed, 18 Mar 2020 16:45:39 +0000 (UTC)
Message-ID: <1c01f0bae24856e4139c551ca07b9581424aa995.camel@perches.com>
Subject: Re: [PATCH 1/3] drm: drm_vm: Use fallthrough;
From: Joe Perches <joe@perches.com>
To: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 18 Mar 2020 09:43:49 -0700
In-Reply-To: <20200318134909.GW2363188@phenom.ffwll.local>
References: <cover.1584040050.git.joe@perches.com>
 <398db73cdc8a584fd7f34f5013c04df13ba90f64.1584040050.git.joe@perches.com>
 <20200317164806.GO2363188@phenom.ffwll.local>
 <623eb1bc61951ed3c68a9224b9aa99a25e763913.camel@perches.com>
 <20200318134909.GW2363188@phenom.ffwll.local>
User-Agent: Evolution 3.34.1-2 
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2020-03-18 at 14:49 +0100, Daniel Vetter wrote:
> On Tue, Mar 17, 2020 at 03:13:29PM -0700, Joe Perches wrote:
> > On Tue, 2020-03-17 at 17:48 +0100, Daniel Vetter wrote:
> > > On Thu, Mar 12, 2020 at 12:17:12PM -0700, Joe Perches wrote:
> > > > Convert /* fallthrough */ style comments to fallthrough;
> > > > 
> > > > Convert the various uses of fallthrough comments to fallthrough;
> > > > 
> > > > Done via script
> > > > Link: https://lore.kernel.org/lkml/b56602fcf79f849e733e7b521bb0e17895d390fa.1582230379.git.joe@perches.com/
> > > > 
> > > > And by hand:
> > > > 
> > > > This file has a fallthrough comment outside of an #ifdef block
> > > > that causes gcc to emit a warning if converted in-place.
> > > > 
> > > > So move the new fallthrough; inside the containing #ifdef/#endif too.
[]
> > > I'm assuming this all lands through a special pull? Or should I apply
> > > this?
[]
> > I think you should apply this.
> > 
> > The idea here is to allow a scripted conversion at some
> > point and this patch is necessary to avoid new compiler
> > warnings after running the script.
> 
> Ok, put into the queue but missed the 5.7 feature freeze for drm so 5.8
> probably.

Thanks, no worries.
Any scripted conversion like this isn't a high priority.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
