Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B681294ED
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 12:18:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F24616E25F;
	Mon, 23 Dec 2019 11:18:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0237.hostedemail.com
 [216.40.44.237])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5469C6E25F
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2019 11:18:51 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id 0E2AB181D3025;
 Mon, 23 Dec 2019 11:18:49 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, :::::::::::,
 RULES_HIT:41:355:379:599:800:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1538:1568:1593:1594:1711:1714:1730:1747:1777:1792:2198:2199:2393:2553:2559:2562:2693:2828:3138:3139:3140:3141:3142:3622:3865:3867:3870:3871:3872:3874:4321:5007:6120:7901:8603:10004:10400:10848:11232:11658:11914:12048:12297:12663:12740:12760:12895:13069:13146:13230:13311:13357:13439:14181:14659:14721:21080:21627:30012:30030:30054:30070:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:95, LUA_SUMMARY:none
X-HE-Tag: map44_87049f013165e
X-Filterd-Recvd-Size: 1370
Received: from XPS-9350.home (unknown [47.151.135.224])
 (Authenticated sender: joe@perches.com)
 by omf02.hostedemail.com (Postfix) with ESMTPA;
 Mon, 23 Dec 2019 11:18:47 +0000 (UTC)
Message-ID: <4624005b279530f7f43aaa1da596bb5ed4732903.camel@perches.com>
Subject: Re: [PATCH v1 3/8] drm/print: add new logging helper for drm logging
From: Joe Perches <joe@perches.com>
To: Jani Nikula <jani.nikula@intel.com>, Sam Ravnborg <sam@ravnborg.org>, 
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 23 Dec 2019 03:18:06 -0800
In-Reply-To: <8736dbwavi.fsf@intel.com>
References: <20191221095553.13332-1-sam@ravnborg.org>
 <20191221095553.13332-4-sam@ravnborg.org> <8736dbwavi.fsf@intel.com>
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
Cc: Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2019-12-23 at 13:16 +0200, Jani Nikula wrote:
> On Sat, 21 Dec 2019, Sam Ravnborg <sam@ravnborg.org> wrote:
> > Add new helper so logging can use the standard logging
> > functions without an extra helper function.
> 
> The main functional change here is that this will no longer print the
> function names in the debug logs. I am not sure if we want to make that
> change.

It will also increase overall code size


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
