Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC842AA028
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 23:23:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C32446EB3A;
	Fri,  6 Nov 2020 22:23:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D6FD6EB3A
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 22:23:31 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 9EDD020068;
 Fri,  6 Nov 2020 23:23:29 +0100 (CET)
Date: Fri, 6 Nov 2020 23:23:28 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 05/19] drm/mga/mga_state: Remove unused variable 'buf_priv'
Message-ID: <20201106222328.GC826715@ravnborg.org>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
 <20201106214949.2042120-6-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201106214949.2042120-6-lee.jones@linaro.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=IkcTkHD0fZMA:10 a=UyPj0cawAAAA:8 a=UYoTZ2hgAAAA:8 a=977SQLHdAAAA:8
 a=e5mUnYsNAAAA:8 a=KKAkSRfTAAAA:8 a=gqZkrEa1Z6pZK_9Cb08A:9
 a=QEXdDO2ut3YA:10 a=Y6pI1GxSO5a61sAuGrKI:22 a=V6L1DCqn-8WKw3iEt1hp:22
 a=X9mgP9w9NIdro0Z1KHhB:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=cvBusfyB2V15izCimMoJ:22
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
 dri-devel@lists.freedesktop.org, by <jhartmann@precisioninsight.com>,
 Keith Whitwell <keith@tungstengraphics.com>,
 Jeff Hartmann <jhartmann@valinux.com>, Gareth Hughes <gareth@valinux.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMDYsIDIwMjAgYXQgMDk6NDk6MzVQTSArMDAwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgo+IAo+
ICBkcml2ZXJzL2dwdS9kcm0vbWdhL21nYV9zdGF0ZS5jOiBJbiBmdW5jdGlvbiDigJhtZ2FfZG1h
X2lsb2Fk4oCZOgo+ICBkcml2ZXJzL2dwdS9kcm0vbWdhL21nYV9zdGF0ZS5jOjk0NToyMjogd2Fy
bmluZzogdmFyaWFibGUg4oCYYnVmX3ByaXbigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQt
YnV0LXNldC12YXJpYWJsZV0KPiAKPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4Lmll
Pgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IGJ5IDxqaGFydG1h
bm5AcHJlY2lzaW9uaW5zaWdodC5jb20+Cj4gQ2M6IEplZmYgSGFydG1hbm4gPGpoYXJ0bWFubkB2
YWxpbnV4LmNvbT4KPiBDYzogS2VpdGggV2hpdHdlbGwgPGtlaXRoQHR1bmdzdGVuZ3JhcGhpY3Mu
Y29tPgo+IENjOiBHYXJldGggSHVnaGVzIDxnYXJldGhAdmFsaW51eC5jb20+Cj4gQ2M6IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxl
ZS5qb25lc0BsaW5hcm8ub3JnPgpMaWtld2lzZSBhcHBsaWVkLAoKCVNhbQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
