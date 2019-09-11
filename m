Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02935AF578
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 07:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 147B66EA08;
	Wed, 11 Sep 2019 05:36:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gateway24.websitewelcome.com (gateway24.websitewelcome.com
 [192.185.50.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD6C6EA04
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 05:36:42 +0000 (UTC)
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
 by gateway24.websitewelcome.com (Postfix) with ESMTP id 072999BE4
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 00:36:41 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id 7vJ2icMR14FKp7vJ2iduCp; Wed, 11 Sep 2019 00:36:41 -0500
X-Authority-Reason: nr=8
Received: from [148.69.85.38] (port=52756 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1i7vJ1-003qzX-C1; Wed, 11 Sep 2019 00:36:39 -0500
Date: Wed, 11 Sep 2019 06:36:04 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Timur Tabi <timur@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] video: fbdev: fsl-diu-fb: mark expected switch fall-throughs
Message-ID: <20190911113604.GA31512@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 148.69.85.38
X-Source-L: No
X-Exim-ID: 1i7vJ1-003qzX-C1
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [148.69.85.38]:52756
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 4
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QW8Cjbds0p1BI81ZMmirUfnVh51hLTx7oCbg0nDi9BU=; b=C08mn0247w1HM7YgYgPU9P42ln
 lgAo+3lCI6Jcv/4DS7qbd+aKdAq82wyLPlZ/bM9w2GFID6wTc/iu1lYnLE4AWLs0oO38KLd64JPtV
 NZllHTqjWdv6dLptdCtG8k3o2yhWvntuvqRz80lYJP9RbVTvlxwiaB0JFz3B1pIfz8d1b9BkG0u94
 5SV2efmrHsg5iehwFVmci5pIj3Hn5/oP2t4Gm5Y743UdGJzLCpOqS5cOiA8bJs/xFCFhfBqplKyyf
 hA4V1SQRY7k/tLmnYxHFLMBY+bEvmnvf3lrbFLkeF+36AX63BKUGaASrryeta3n7tHdO+v1icAhT0
 /v4pvLUw==;
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWFyayBzd2l0Y2ggY2FzZXMgd2hlcmUgd2UgYXJlIGV4cGVjdGluZyB0byBmYWxsIHRocm91Z2gu
CgpGaXggdGhlIGZvbGxvd2luZyB3YXJuaW5ncyAoQnVpbGRpbmc6IG1wYzUxMnhfZGVmY29uZmln
IHBvd2VycGMpOgoKZHJpdmVycy92aWRlby9mYmRldi9mc2wtZGl1LWZiLmM6IEluIGZ1bmN0aW9u
IOKAmGZzbF9kaXVfaW9jdGzigJk6Ci4vaW5jbHVkZS9saW51eC9kZXZpY2UuaDoxNzUwOjI6IHdh
cm5pbmc6IHRoaXMgc3RhdGVtZW50IG1heSBmYWxsIHRocm91Z2ggWy1XaW1wbGljaXQtZmFsbHRo
cm91Z2g9XQogIF9kZXZfd2FybihkZXYsIGRldl9mbXQoZm10KSwgIyNfX1ZBX0FSR1NfXykKICBe
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CmRyaXZlcnMvdmlkZW8v
ZmJkZXYvZnNsLWRpdS1mYi5jOjEyODc6Mzogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKA
mGRldl93YXJu4oCZCiAgIGRldl93YXJuKGluZm8tPmRldiwKICAgXn5+fn5+fn4KZHJpdmVycy92
aWRlby9mYmRldi9mc2wtZGl1LWZiLmM6MTI5MDoyOiBub3RlOiBoZXJlCiAgY2FzZSBNRkJfU0VU
X1BJWEZNVDoKICBefn5+CkluIGZpbGUgaW5jbHVkZWQgZnJvbSAuL2luY2x1ZGUvbGludXgvYWNw
aS5oOjE1OjAsCiAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGludXgvaTJjLmg6MTMs
CiAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvdWFwaS9saW51eC9mYi5oOjYsCiAgICAg
ICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGludXgvZmIuaDo2LAogICAgICAgICAgICAgICAg
IGZyb20gZHJpdmVycy92aWRlby9mYmRldi9mc2wtZGl1LWZiLmM6MjA6Ci4vaW5jbHVkZS9saW51
eC9kZXZpY2UuaDoxNzUwOjI6IHdhcm5pbmc6IHRoaXMgc3RhdGVtZW50IG1heSBmYWxsIHRocm91
Z2ggWy1XaW1wbGljaXQtZmFsbHRocm91Z2g9XQogIF9kZXZfd2FybihkZXYsIGRldl9mbXQoZm10
KSwgIyNfX1ZBX0FSR1NfXykKICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+CmRyaXZlcnMvdmlkZW8vZmJkZXYvZnNsLWRpdS1mYi5jOjEyOTY6Mzogbm90ZTogaW4g
ZXhwYW5zaW9uIG9mIG1hY3JvIOKAmGRldl93YXJu4oCZCiAgIGRldl93YXJuKGluZm8tPmRldiwK
ICAgXn5+fn5+fn4KZHJpdmVycy92aWRlby9mYmRldi9mc2wtZGl1LWZiLmM6MTI5OToyOiBub3Rl
OiBoZXJlCiAgY2FzZSBNRkJfR0VUX1BJWEZNVDoKICBefn5+CgpSZXBvcnRlZC1ieToga2J1aWxk
IHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8gQS4gUi4g
U2lsdmEgPGd1c3Rhdm9AZW1iZWRkZWRvci5jb20+Ci0tLQogZHJpdmVycy92aWRlby9mYmRldi9m
c2wtZGl1LWZiLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9mc2wtZGl1LWZiLmMgYi9kcml2ZXJzL3ZpZGVv
L2ZiZGV2L2ZzbC1kaXUtZmIuYwppbmRleCBkMTlmNTgyNjNiNGUuLjNlNDEwYjllYjI3MiAxMDA2
NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9mc2wtZGl1LWZiLmMKKysrIGIvZHJpdmVycy92
aWRlby9mYmRldi9mc2wtZGl1LWZiLmMKQEAgLTEyODcsNiArMTI4Nyw3IEBAIHN0YXRpYyBpbnQg
ZnNsX2RpdV9pb2N0bChzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgdW5zaWduZWQgaW50IGNtZCwKIAkJ
ZGV2X3dhcm4oaW5mby0+ZGV2LAogCQkJICJNRkJfU0VUX1BJWEZNVCB2YWx1ZSBvZiAweCUwOHgg
aXMgZGVwcmVjYXRlZC5cbiIsCiAJCQkgTUZCX1NFVF9QSVhGTVRfT0xEKTsKKwkJLyogZmFsbCB0
aHJvdWdoICovCiAJY2FzZSBNRkJfU0VUX1BJWEZNVDoKIAkJaWYgKGNvcHlfZnJvbV91c2VyKCZw
aXhfZm10LCBidWYsIHNpemVvZihwaXhfZm10KSkpCiAJCQlyZXR1cm4gLUVGQVVMVDsKQEAgLTEy
OTYsNiArMTI5Nyw3IEBAIHN0YXRpYyBpbnQgZnNsX2RpdV9pb2N0bChzdHJ1Y3QgZmJfaW5mbyAq
aW5mbywgdW5zaWduZWQgaW50IGNtZCwKIAkJZGV2X3dhcm4oaW5mby0+ZGV2LAogCQkJICJNRkJf
R0VUX1BJWEZNVCB2YWx1ZSBvZiAweCUwOHggaXMgZGVwcmVjYXRlZC5cbiIsCiAJCQkgTUZCX0dF
VF9QSVhGTVRfT0xEKTsKKwkJLyogZmFsbCB0aHJvdWdoICovCiAJY2FzZSBNRkJfR0VUX1BJWEZN
VDoKIAkJcGl4X2ZtdCA9IGFkLT5waXhfZm10OwogCQlpZiAoY29weV90b191c2VyKGJ1ZiwgJnBp
eF9mbXQsIHNpemVvZihwaXhfZm10KSkpCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
