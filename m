Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29923AC76A
	for <lists+dri-devel@lfdr.de>; Sat,  7 Sep 2019 17:56:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C1589D4D;
	Sat,  7 Sep 2019 15:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 372 seconds by postgrey-1.36 at gabe;
 Sat, 07 Sep 2019 15:56:51 UTC
Received: from smtprelay.hostedemail.com (smtprelay0131.hostedemail.com
 [216.40.44.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C1A89D4D;
 Sat,  7 Sep 2019 15:56:51 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave03.hostedemail.com (Postfix) with ESMTP id 3A68C180357DB;
 Sat,  7 Sep 2019 15:50:39 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id CD557180A884B;
 Sat,  7 Sep 2019 15:50:37 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com,
 :::::::::::::::::::::,
 RULES_HIT:41:355:379:599:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1537:1560:1593:1594:1711:1714:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3622:3865:3866:3867:3872:3874:4321:5007:8531:10004:10400:10848:11658:11914:12297:12740:12760:12895:13069:13311:13357:13439:14659:21080:21627:30051:30054:30060:30069:30091,
 0,
 RBL:47.151.152.152:@perches.com:.lbl8.mailshell.net-62.8.0.100 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:27,
 LUA_SUMMARY:none
X-HE-Tag: rake73_3f7a51a030944
X-Filterd-Recvd-Size: 1669
Received: from XPS-9350.home (unknown [47.151.152.152])
 (Authenticated sender: joe@perches.com)
 by omf04.hostedemail.com (Postfix) with ESMTPA;
 Sat,  7 Sep 2019 15:50:36 +0000 (UTC)
Message-ID: <b387b7ea498eb96d94f47b22ac4b11c75518513a.camel@perches.com>
Subject: Re: [PATCH AUTOSEL 4.19 044/167] drm/amdgpu: validate user pitch
 alignment
From: Joe Perches <joe@perches.com>
To: Sasha Levin <sashal@kernel.org>, Michel =?ISO-8859-1?Q?D=E4nzer?=
 <michel@daenzer.net>
Date: Sat, 07 Sep 2019 08:50:34 -0700
In-Reply-To: <20190904120823.GW5281@sasha-vm>
References: <20190903162519.7136-1-sashal@kernel.org>
 <20190903162519.7136-44-sashal@kernel.org>
 <7957107d-634f-4771-327e-99fdd5e6474e@daenzer.net>
 <20190903170347.GA24357@kroah.com> <20190903200139.GJ5281@sasha-vm>
 <CAKMK7uFpBnkF4xABdkDMZ8TYhL4jg6ZuGyHGyVeBxc9rkyUtXQ@mail.gmail.com>
 <829c5912-cf80-81d0-7400-d01d286861fc@daenzer.net>
 <20190904120823.GW5281@sasha-vm>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Yu Zhao <yuzhao@google.com>, Dave Airlie <airlied@linux.ie>,
 Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDE5LTA5LTA0IGF0IDA4OjA4IC0wNDAwLCBTYXNoYSBMZXZpbiB3cm90ZToKPiBp
dCdzIGJldHRlciB0byBnZXQKPiBpdCByaWdodCByYXRoZXIgdGhhbiB0byBiZSBkb25lIHF1aWNr
bHkgOikKClRoYXQgYWxzbyBhcHBsaWVzIHRvIHRoZSBpbml0aWFsIHNlbGVjdGlvbiBvZgpwYXRj
aGVzIGZvciB0aGUgc3RhYmxlIHRyZWVzLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
