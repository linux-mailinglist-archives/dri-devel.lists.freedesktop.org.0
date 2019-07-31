Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D70617B972
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 08:06:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C4289C19;
	Wed, 31 Jul 2019 06:06:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0033.hostedemail.com
 [216.40.44.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 896A189C19
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 06:06:26 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id 692871802E6E7;
 Wed, 31 Jul 2019 06:06:25 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, :::::::::::::::,
 RULES_HIT:41:355:379:599:967:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2525:2553:2559:2563:2682:2685:2828:2859:2902:2904:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3352:3622:3865:3867:3868:3870:3871:3873:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4250:4321:4605:5007:6119:9025:10004:10400:10848:11026:11232:11657:11658:11914:12043:12296:12297:12438:12555:12740:12760:12895:13019:13069:13311:13357:13439:14181:14659:14721:21080:21433:21627:30054:30070:30090:30091,
 0,
 RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:25,
 LUA_SUMMARY:none
X-HE-Tag: door01_1ac50e83e2663
X-Filterd-Recvd-Size: 2235
Received: from XPS-9350 (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
 (Authenticated sender: joe@perches.com)
 by omf06.hostedemail.com (Postfix) with ESMTPA;
 Wed, 31 Jul 2019 06:06:23 +0000 (UTC)
Message-ID: <520bd0f7367e77ffd2e0150187f6ffb64b0e8b71.camel@perches.com>
Subject: Re: [PATCH] drm: use trace_printk rather than printk in drm_dbg.
From: Joe Perches <joe@perches.com>
To: Fuqian Huang <huangfq.daxian@gmail.com>
Date: Tue, 30 Jul 2019 23:06:22 -0700
In-Reply-To: <20190731024533.22264-1-huangfq.daxian@gmail.com>
References: <20190731024533.22264-1-huangfq.daxian@gmail.com>
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDE5LTA3LTMxIGF0IDEwOjQ1ICswODAwLCBGdXFpYW4gSHVhbmcgd3JvdGU6Cj4g
SW4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2loLmMsCj4gYW1kZ3B1X2loX3By
b2Nlc3MgY2FsbHMgRFJNX0RFQlVHIHdoaWNoIGNhbGxzIGRybV9kYmcgYW5kCj4gZmluYWxseSBj
YWxscyBwcmludGsuCj4gQXMgYW1kZ3B1X2loX3Byb2Nlc3MgaXMgY2FsbGVkIGZyb20gYW4gaW50
ZXJydXB0IGhhbmRsZXIsCj4gYW5kIGludGVycnVwdCBoYW5kbGVyIHNob3VsZCBiZSBzaG9ydCBh
cyBwb3NzaWJsZS4KPiAKPiBBcyBwcmludGsgbWF5IGxlYWQgdG8gYm9nZ2luZyBkb3duIHRoZSBz
eXN0ZW0gb3IgY2FuIGV2ZW4KPiBjcmVhdGUgYSBsaXZlIGxvY2suIHByaW50ayBzaG91bGQgbm90
IGJlIHVzZWQgaW4gSVJRIGNvbnRleHQuCj4gSW5zdGVhZCwgdHJhY2VfcHJpbnRrIGlzIHJlY29t
bWVuZGVkLgo+IExpbms6IGh0dHBzOi8vbHduLm5ldC9BcnRpY2xlcy8zNjU4MzUKW10KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9wcmludC5jIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9wcmludC5jCltdCj4gQEAgLTIzNiw3ICsyMzYsNyBAQCB2b2lkIGRybV9kYmcodW5zaWduZWQg
aW50IGNhdGVnb3J5LCBjb25zdCBjaGFyICpmb3JtYXQsIC4uLikKPiAgCXZhZi5mbXQgPSBmb3Jt
YXQ7Cj4gIAl2YWYudmEgPSAmYXJnczsKPiAgCj4gLQlwcmludGsoS0VSTl9ERUJVRyAiWyIgRFJN
X05BTUUgIjolcHNdICVwViIsCj4gKwl0cmFjZV9wcmludGsoS0VSTl9ERUJVRyAiWyIgRFJNX05B
TUUgIjolcHNdICVwViIsCj4gIAkgICAgICAgX19idWlsdGluX3JldHVybl9hZGRyZXNzKDApLCAm
dmFmKTsKPiAgCj4gIAl2YV9lbmQoYXJncyk7CgpUaGlzIG1ha2VzIGFsbCA0MDAwKyBkcm1fZGJn
L0RSTV9ERUJVRyB1c2VzIGVtaXQKYSB0cmFjZV9wcmludGsuCgpJIHN1Z2dlc3QgaW5zdGVhZCB5
b3UgbWFrZSBvbmx5IHRoZSBpbnRlcnJ1cHQgdXNlcwp1c2UgYSBkaWZmZXJlbnQgZnVuY3Rpb24g
YW5kIG5vdCBkcm1fZGJnLgoKT3IgbWF5YmUgYWRkIGFuIGluX2ludGVycnVwdCgpIGNoZWNrIGxp
a2UKCglpZiAoaW5faW50ZXJydXB0KCkpCgkJcHJpbnRrKEtFUk5fREVCVUcgZXRjLi4uKQoJZWxz
ZQoJCXRyYWNlX3ByaW50ayhldGMuLi4pCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
