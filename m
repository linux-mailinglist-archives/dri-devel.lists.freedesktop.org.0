Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 045DA286329
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 18:05:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00EA689343;
	Wed,  7 Oct 2020 16:05:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94CFE8800B;
 Wed,  7 Oct 2020 16:05:33 +0000 (UTC)
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 45201216C4;
 Wed,  7 Oct 2020 16:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602086733;
 bh=vXNBYzjXxgbdXR2tBuhidFU6GMj6pIUq/B/IITpLXDs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dcc2vXHJQISo+MwSjajQGEZC9HEuZFgDht6Yeoio+aDQTnlvGn4WsTjAa5wbfw7PC
 XHBPXDOTxGKwiAMAirMa8q5iOO18gG0fT1b34FQu5S7R3tWuwpVnMsyFAaZpR9thGS
 dWimx005lmeEE8n8GzjfAeeTvMs22MTTa64KLvFM=
Date: Wed, 7 Oct 2020 11:11:33 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 14/14] drm/amd/pm: Replace one-element array with
 flexible-array in struct ATOM_Vega10_GFXCLK_Dependency_Table
Message-ID: <00a464a7e2141dc3117720784d76048e7e3dbed6.1602020074.git.gustavoars@kernel.org>
References: <cover.1602020074.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1602020074.git.gustavoars@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, amd-gfx@lists.freedesktop.org,
 linux-hardening@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUgaXMgYSByZWd1bGFyIG5lZWQgaW4gdGhlIGtlcm5lbCB0byBwcm92aWRlIGEgd2F5IHRv
IGRlY2xhcmUgaGF2aW5nCmEgZHluYW1pY2FsbHkgc2l6ZWQgc2V0IG9mIHRyYWlsaW5nIGVsZW1l
bnRzIGluIGEgc3RydWN0dXJlLiBLZXJuZWwgY29kZQpzaG91bGQgYWx3YXlzIHVzZSDigJxmbGV4
aWJsZSBhcnJheSBtZW1iZXJz4oCdWzFdIGZvciB0aGVzZSBjYXNlcy4gVGhlIG9sZGVyCnN0eWxl
IG9mIG9uZS1lbGVtZW50IG9yIHplcm8tbGVuZ3RoIGFycmF5cyBzaG91bGQgbm8gbG9uZ2VyIGJl
IHVzZWRbMl0uCgpVc2UgYSBmbGV4aWJsZS1hcnJheSBtZW1iZXIgaW4gc3RydWN0IEFUT01fVmVn
YTEwX0dGWENMS19EZXBlbmRlbmN5X1RhYmxlCmluc3RlYWQgb2YgYSBvbmUtZWxlbWVudCBhcnJh
eS4KClsxXSBodHRwczovL2VuLndpa2lwZWRpYS5vcmcvd2lraS9GbGV4aWJsZV9hcnJheV9tZW1i
ZXIKWzJdIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvdjUuOS1yYzEvcHJvY2Vzcy9k
ZXByZWNhdGVkLmh0bWwjemVyby1sZW5ndGgtYW5kLW9uZS1lbGVtZW50LWFycmF5cwoKQnVpbGQt
dGVzdGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KTGluazogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC81ZjdkNjFkZC5POGp4eEk1QzZQOUZPYiUyRmQlMjVsa3BA
aW50ZWwuY29tLwpTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvYXJz
QGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3Iv
dmVnYTEwX3BwdGFibGUuaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJw
bGF5L2h3bWdyL3ZlZ2ExMF9wcHRhYmxlLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2Vy
cGxheS9od21nci92ZWdhMTBfcHB0YWJsZS5oCmluZGV4IGM5MzRlOTYxMmMxYi4uYTY5NjgwMDlh
Y2M0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci92
ZWdhMTBfcHB0YWJsZS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3
bWdyL3ZlZ2ExMF9wcHRhYmxlLmgKQEAgLTE2Myw3ICsxNjMsNyBAQCB0eXBlZGVmIHN0cnVjdCBf
QVRPTV9WZWdhMTBfTUNMS19EZXBlbmRlbmN5X1JlY29yZCB7CiB0eXBlZGVmIHN0cnVjdCBfQVRP
TV9WZWdhMTBfR0ZYQ0xLX0RlcGVuZGVuY3lfVGFibGUgewogICAgIFVDSEFSIHVjUmV2SWQ7CiAg
ICAgVUNIQVIgdWNOdW1FbnRyaWVzOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgLyogTnVtYmVyIG9mIGVudHJpZXMuICovCi0gICAgQVRPTV9WZWdhMTBfR0ZYQ0xLX0Rl
cGVuZGVuY3lfUmVjb3JkIGVudHJpZXNbMV07ICAgICAgICAgICAgLyogRHluYW1pY2FsbHkgYWxs
b2NhdGUgZW50cmllcy4gKi8KKyAgICBBVE9NX1ZlZ2ExMF9HRlhDTEtfRGVwZW5kZW5jeV9SZWNv
cmQgZW50cmllc1tdOyAgICAgICAgICAgICAvKiBEeW5hbWljYWxseSBhbGxvY2F0ZSBlbnRyaWVz
LiAqLwogfSBBVE9NX1ZlZ2ExMF9HRlhDTEtfRGVwZW5kZW5jeV9UYWJsZTsKIAogdHlwZWRlZiBz
dHJ1Y3QgX0FUT01fVmVnYTEwX01DTEtfRGVwZW5kZW5jeV9UYWJsZSB7Ci0tIAoyLjI3LjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
