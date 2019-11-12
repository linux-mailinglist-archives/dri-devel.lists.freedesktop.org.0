Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2F6F86F0
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 03:39:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F04F6E0D2;
	Tue, 12 Nov 2019 02:39:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0182.hostedemail.com
 [216.40.44.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 222366E0D2;
 Tue, 12 Nov 2019 02:39:34 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id 7B961181D3026;
 Tue, 12 Nov 2019 02:39:33 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com,
 :::::::::::::::::::::::::::::::::::,
 RULES_HIT:41:355:379:599:968:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3866:3868:3871:3872:4321:5007:6737:7903:8957:9592:10004:10400:10848:11026:11232:11473:11657:11658:11914:12043:12048:12296:12297:12555:12740:12760:12895:13069:13311:13357:13439:14659:14721:21080:21451:21627:30054:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: end54_35f6dbbf31b05
X-Filterd-Recvd-Size: 2553
Received: from XPS-9350.home (unknown [47.151.135.224])
 (Authenticated sender: joe@perches.com)
 by omf16.hostedemail.com (Postfix) with ESMTPA;
 Tue, 12 Nov 2019 02:39:30 +0000 (UTC)
Message-ID: <01c630e6d4c58b3f6184603e158f53fb9aaeae7d.camel@perches.com>
Subject: Re: [PATCH -next] drm/amd/display: Fix old-style declaration
From: Joe Perches <joe@perches.com>
To: YueHaibing <yuehaibing@huawei.com>, harry.wentland@amd.com, 
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com, 
 David1.Zhou@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 Bhawanpreet.Lakha@amd.com,  Jun.Lei@amd.com, David.Francis@amd.com,
 Dmytro.Laktyushkin@amd.com,  nicholas.kazlauskas@amd.com,
 martin.leung@amd.com, Chris.Park@amd.com
Date: Mon, 11 Nov 2019 18:39:15 -0800
In-Reply-To: <20191111122801.18584-1-yuehaibing@huawei.com>
References: <20191111122801.18584-1-yuehaibing@huawei.com>
User-Agent: Evolution 3.34.1-2 
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDE5LTExLTExIGF0IDIwOjI4ICswODAwLCBZdWVIYWliaW5nIHdyb3RlOgo+IEZp
eCBhIGJ1aWxkIHdhcm5pbmc6Cj4gCj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlz
cGxheS9kYy9jb3JlL2RjLmM6NzU6MToKPiAgd2FybmluZzogJ3N0YXRpYycgaXMgbm90IGF0IGJl
Z2lubmluZyBvZiBkZWNsYXJhdGlvbiBbLVdvbGQtc3R5bGUtZGVjbGFyYXRpb25dCltdCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jCltdCj4gQEAgLTY5LDcgKzY5LDcg
QEAKPiAgI2RlZmluZSBEQ19MT0dHRVIgXAo+ICAJZGMtPmN0eC0+bG9nZ2VyCj4gIAo+IC1jb25z
dCBzdGF0aWMgY2hhciBEQ19CVUlMRF9JRFtdID0gInByb2R1Y3Rpb24tYnVpbGQiOwo+ICtzdGF0
aWMgY29uc3QgY2hhciBEQ19CVUlMRF9JRFtdID0gInByb2R1Y3Rpb24tYnVpbGQiOwoKRENfQlVJ
TERfSUQgaXMgdXNlZCBleGFjdGx5IG9uY2UuCk1heWJlIGp1c3QgdXNlIGl0IGRpcmVjdGx5IGFu
ZCByZW1vdmUgRENfQlVJTERfSUQgaW5zdGVhZD8KCi0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2NvcmUvZGMuYyB8IDQgKy0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9jb3JlL2RjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9k
Yy5jCmluZGV4IDFmZGJhMTMuLjgwM2RjMTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9jb3JlL2RjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2NvcmUvZGMuYwpAQCAtNjksOCArNjksNiBAQAogI2RlZmluZSBEQ19MT0dHRVIgXAogCWRj
LT5jdHgtPmxvZ2dlcgogCi1jb25zdCBzdGF0aWMgY2hhciBEQ19CVUlMRF9JRFtdID0gInByb2R1
Y3Rpb24tYnVpbGQiOwotCiAvKioKICAqIERPQzogT3ZlcnZpZXcKICAqCkBAIC04MTUsNyArODEz
LDcgQEAgc3RydWN0IGRjICpkY19jcmVhdGUoY29uc3Qgc3RydWN0IGRjX2luaXRfZGF0YSAqaW5p
dF9wYXJhbXMpCiAJaWYgKGRjLT5yZXNfcG9vbC0+ZG1jdSAhPSBOVUxMKQogCQlkYy0+dmVyc2lv
bnMuZG1jdV92ZXJzaW9uID0gZGMtPnJlc19wb29sLT5kbWN1LT5kbWN1X3ZlcnNpb247CiAKLQlk
Yy0+YnVpbGRfaWQgPSBEQ19CVUlMRF9JRDsKKwlkYy0+YnVpbGRfaWQgPSAicHJvZHVjdGlvbi1i
dWlsZCI7CiAKIAlEQ19MT0dfREMoIkRpc3BsYXkgQ29yZSBpbml0aWFsaXplZFxuIik7CiAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
