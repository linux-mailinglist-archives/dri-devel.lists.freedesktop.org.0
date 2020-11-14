Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6D12B302D
	for <lists+dri-devel@lfdr.de>; Sat, 14 Nov 2020 20:29:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 995A36E94F;
	Sat, 14 Nov 2020 19:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13FDC6E94F
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 19:29:23 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 9DA0E804D0;
 Sat, 14 Nov 2020 20:29:20 +0100 (CET)
Date: Sat, 14 Nov 2020 20:29:19 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v1 1/1] drm/panel: samsumg-ld9040: fix spi id_table
Message-ID: <20201114192919.GD3797389@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VafZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=IkcTkHD0fZMA:10 a=hD80L64hAAAA:8 a=KKAkSRfTAAAA:8 a=7gkXJVJtAAAA:8
 a=pGLkceISAAAA:8 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=Vw4kKXAnOJ_B_rS-NTQA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QSBXPTEgYnVpbGQgcmVzdWx0ZWQgaW4gdGhlIGZvbGxvd2luZyB3YXJuaW5nOgoKICAgIHBhbmVs
LXNhbXN1bmctbGQ5MDQwLmM6Mzc3OjM1OiB3YXJuaW5nOiDigJhsZDkwNDBfaWRz4oCZIGRlZmlu
ZWQgYnV0IG5vdCB1c2VkCgpUaGUgcm9vdCBjYXVzZSB3YXMgYSBtaXNzaW5nIGFzc2lnbm1lbnQg
dG8gc3BpX2RyaXZlci5pZF90YWJsZS4KCkZpeGVzOiA2OTE1ZGIzNDYwMzkgKCJkcm0vcGFuZWw6
IGxkOTA0MDogYWRkIE1PRFVMRV9ERVZJQ0VfVEFCTEUgd2l0aCBTUEkgSURzIikKQ2M6IE1hcmVr
IFN6eXByb3dza2kgPG0uc3p5cHJvd3NraUBzYW1zdW5nLmNvbT4KQ2M6IExlZSBKb25lcyA8bGVl
LmpvbmVzQGxpbmFyby5vcmc+CkNjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkNj
OiBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgpDYzogZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ICMgdjUu
NysKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zYW1zdW5nLWxkOTA0MC5jIHwgMSArCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFu
ZWwvcGFuZWwtc2Ftc3VuZy1sZDkwNDAuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1z
YW1zdW5nLWxkOTA0MC5jCmluZGV4IGY0ODQxNDdmYzNhNi4uYzRiMzg4ODUwYTEzIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2Ftc3VuZy1sZDkwNDAuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2Ftc3VuZy1sZDkwNDAuYwpAQCAtMzgzLDYgKzM4
Myw3IEBAIE1PRFVMRV9ERVZJQ0VfVEFCTEUoc3BpLCBsZDkwNDBfaWRzKTsKIHN0YXRpYyBzdHJ1
Y3Qgc3BpX2RyaXZlciBsZDkwNDBfZHJpdmVyID0gewogCS5wcm9iZSA9IGxkOTA0MF9wcm9iZSwK
IAkucmVtb3ZlID0gbGQ5MDQwX3JlbW92ZSwKKwkuaWRfdGFibGUgPSBsZDkwNDBfaWRzLAogCS5k
cml2ZXIgPSB7CiAJCS5uYW1lID0gInBhbmVsLXNhbXN1bmctbGQ5MDQwIiwKIAkJLm9mX21hdGNo
X3RhYmxlID0gbGQ5MDQwX29mX21hdGNoLAotLSAKMi4yNy4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
