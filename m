Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE521416E9
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jan 2020 10:55:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98B326F9E8;
	Sat, 18 Jan 2020 09:55:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 569 seconds by postgrey-1.36 at gabe;
 Sat, 18 Jan 2020 08:16:00 UTC
Received: from mail.kaowomen.cn (unknown [175.24.100.79])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2AC306F9C4
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jan 2020 08:16:00 +0000 (UTC)
Received: by mail.kaowomen.cn (Postfix, from userid 5002)
 id 2ECB1E0F18; Sat, 18 Jan 2020 16:06:28 +0800 (CST)
Date: Sat, 18 Jan 2020 16:06:28 +0800
From: Bo YU <tsu.yubo@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, irlied@linux.ie,
 daniel@ffwll.ch, airlied@redhat.com, tprevite@gmail.com
Subject: [PATCH -next] drm/drm_dp_mst:remove set but not used variable
 'origlen'
Message-ID: <20200118080628.mxcx7bfwdas5m7un@kaowomen.cn>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: NeoMutt/20171215
X-Mailman-Approved-At: Sat, 18 Jan 2020 09:55:11 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9n
cHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYzozNjkzOjE2OiB3YXJuaW5nOiB2YXJpYWJsZQri
gJhvcmlnbGVu4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVd
CiAgaW50IHJlcGx5bGVuLCBvcmlnbGVuLCBjdXJyZXBseTsKCkl0IGxvb2tzIGxpa2UgbmV2ZXIg
dXNlIHZhcmlhYmxlIG9yaWdsZW4gYWZ0ZXIgYXNzaWduIHZhbHVlIHRvIGl0LgoKRml4ZXM6IGFk
N2Y4YTFmOWNlZDcgKGRybS9oZWxwZXI6IGFkZCBEaXNwbGF5cG9ydCBtdWx0aS1zdHJlYW0gaGVs
cGVyICh2MC42KSkKU2lnbmVkLW9mZi1ieTogQm8gWVUgPHRzdS55dWJvQGdtYWlsLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwgMyArLS0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9k
cF9tc3RfdG9wb2xvZ3kuYwppbmRleCA0Yjc0MTkzYjg5Y2UuLjRjNzZlNjczMjA2YiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCkBAIC0zNjkwLDcgKzM2OTAsNyBAQCBzdGF0
aWMgYm9vbCBkcm1fZHBfZ2V0X29uZV9zYl9tc2coc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lf
bWdyICptZ3IsIGJvb2wgdXApCiB7CiAJaW50IGxlbjsKIAl1OCByZXBseWJsb2NrWzMyXTsKLQlp
bnQgcmVwbHlsZW4sIG9yaWdsZW4sIGN1cnJlcGx5OworCWludCByZXBseWxlbiwgY3VycmVwbHk7
CiAJaW50IHJldDsKIAlzdHJ1Y3QgZHJtX2RwX3NpZGViYW5kX21zZ19yeCAqbXNnOwogCWludCBi
YXNlcmVnID0gdXAgPyBEUF9TSURFQkFORF9NU0dfVVBfUkVRX0JBU0UgOiBEUF9TSURFQkFORF9N
U0dfRE9XTl9SRVBfQkFTRTsKQEAgLTM3MTAsNyArMzcxMCw2IEBAIHN0YXRpYyBib29sIGRybV9k
cF9nZXRfb25lX3NiX21zZyhzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciwgYm9v
bCB1cCkKIAl9CiAJcmVwbHlsZW4gPSBtc2ctPmN1cmNodW5rX2xlbiArIG1zZy0+Y3VyY2h1bmtf
aGRybGVuOwogCi0Jb3JpZ2xlbiA9IHJlcGx5bGVuOwogCXJlcGx5bGVuIC09IGxlbjsKIAljdXJy
ZXBseSA9IGxlbjsKIAl3aGlsZSAocmVwbHlsZW4gPiAwKSB7Ci0tIAoyLjExLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
