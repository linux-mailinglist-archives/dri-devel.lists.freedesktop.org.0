Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F0BD2B3A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 15:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F186EB38;
	Thu, 10 Oct 2019 13:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 150546EB38
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 13:24:33 +0000 (UTC)
Received: from dhcp-172-31-174-146.wireless.concordia.ca (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 87A4B2904C4;
 Thu, 10 Oct 2019 14:24:31 +0100 (BST)
Date: Thu, 10 Oct 2019 15:24:28 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 3/3] drm/atmel-hlcdc: Use swap() where appropriate
Message-ID: <20191010152428.40458dd0@dhcp-172-31-174-146.wireless.concordia.ca>
In-Reply-To: <20191010131159.17346-3-ville.syrjala@linux.intel.com>
References: <20191010131159.17346-1-ville.syrjala@linux.intel.com>
 <20191010131159.17346-3-ville.syrjala@linux.intel.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
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
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxMCBPY3QgMjAxOSAxNjoxMTo1OSArMDMwMApWaWxsZSBTeXJqYWxhIDx2aWxsZS5z
eXJqYWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cgo+IEZyb206IFZpbGxlIFN5cmrDpGzDpCA8
dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gCj4gQHN3YXBACj4gaWRlbnRpZmllciBU
RU1QOwo+IGV4cHJlc3Npb24gQSxCOwo+IEBACj4gLSBURU1QID0gQTsKPiAtIEEgPSBCOwo+IC0g
QiA9IFRFTVA7Cj4gKyBzd2FwKEEsIEIpOwo+IAo+IEBACj4gdHlwZSBUOwo+IGlkZW50aWZpZXIg
c3dhcC5URU1QOwo+IEBACj4gKAo+IC0gVCBURU1QOwo+IHwKPiAtIFQgVEVNUCA9IHsuLi59Owo+
ICkKPiAuLi4gd2hlbiAhPSBURU1QCj4gCj4gQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3Jn
Lm9yZz4KPiBDYzogQm9yaXMgQnJlemlsbG9uIDxiYnJlemlsbG9uQGtlcm5lbC5vcmc+Cj4gU2ln
bmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNv
bT4KClJldmlld2VkLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJv
cmEuY29tPgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2Rj
X3BsYW5lLmMgfCA1ICstLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNCBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2Rj
L2F0bWVsX2hsY2RjX3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxf
aGxjZGNfcGxhbmUuYwo+IGluZGV4IDg5ZjVhNzU2ZmEzNy4uMDM0ZjIwMmRmZThmIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19wbGFuZS5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX3BsYW5lLmMKPiBA
QCAtNjAxLDcgKzYwMSw2IEBAIHN0YXRpYyBpbnQgYXRtZWxfaGxjZGNfcGxhbmVfYXRvbWljX2No
ZWNrKHN0cnVjdCBkcm1fcGxhbmUgKnAsCj4gIAlzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiA9
IHN0YXRlLT5iYXNlLmZiOwo+ICAJY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGU7
Cj4gIAlzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKmNydGNfc3RhdGU7Cj4gLQl1bnNpZ25lZCBpbnQg
dG1wOwo+ICAJaW50IHJldDsKPiAgCWludCBpOwo+ICAKPiBAQCAtNjk0LDkgKzY5Myw3IEBAIHN0
YXRpYyBpbnQgYXRtZWxfaGxjZGNfcGxhbmVfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fcGxhbmUg
KnAsCj4gIAkgKiBTd2FwIHdpZHRoIGFuZCBzaXplIGluIGNhc2Ugb2YgOTAgb3IgMjcwIGRlZ3Jl
ZXMgcm90YXRpb24KPiAgCSAqLwo+ICAJaWYgKGRybV9yb3RhdGlvbl85MF9vcl8yNzAoc3RhdGUt
PmJhc2Uucm90YXRpb24pKSB7Cj4gLQkJdG1wID0gc3RhdGUtPnNyY193Owo+IC0JCXN0YXRlLT5z
cmNfdyA9IHN0YXRlLT5zcmNfaDsKPiAtCQlzdGF0ZS0+c3JjX2ggPSB0bXA7Cj4gKwkJc3dhcChz
dGF0ZS0+c3JjX3csIHN0YXRlLT5zcmNfaCk7Cj4gIAl9Cj4gIAo+ICAJaWYgKCFkZXNjLT5sYXlv
dXQuc2l6ZSAmJgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
