Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 418EA9C6A9
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 02:19:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D1A56E146;
	Mon, 26 Aug 2019 00:19:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net
 [194.109.24.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBFC289E11
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 11:24:33 +0000 (UTC)
Received: from tschai.fritz.box ([46.9.232.237])
 by smtp-cloud7.xs4all.net with ESMTPA
 id 17gBikVExThuu17gGiolqn; Fri, 23 Aug 2019 13:24:32 +0200
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: [PATCH 2/3] drm/sun4i/sun4i_hdmi_enc: call cec_s_conn_info()
Date: Fri, 23 Aug 2019 13:24:26 +0200
Message-Id: <20190823112427.42394-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190823112427.42394-1-hverkuil-cisco@xs4all.nl>
References: <20190823112427.42394-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfGFE4NH+mS+hq0jRHj36UTNmU2gUS9qgz/Zv1ssR/aVMa28g+KX37hJzsioRxyHt8cEQkJqR3qQh1lNbVV9tOxb2Au9FsG2kPqdWTym8oD4X8g+dh8ts
 ln5rZ72YV6saavbgYlGUQvtHyTUJkflvXjT3BmHR65XXlIxXbPtedf3YN7sLBUEfuz8CC6FTUSevvNvexNhjQ15wxxBiw47W5QUeRMf7zD4VgezlydfMAOaF
 yXBp5bw2wHsjSAhYaSlGFr+MCR2UmmGb0bfxEp1M8DicDLB4gTN04uUC8t25zOhRJxuhbb527b3/IHvmI2qXjlCRCK3s5oIRV0pr9Lq8ZODN6HtuMyasXp9m
 n80GWpkI8Ou5lZcutrZitM9wRMuco2aH4eXXvN5AvGnJS4z3/QYQuuuZAhuRb/mwLpInhTwIHOkhvJFLIQwDC9t6bKjuFg==
X-Mailman-Approved-At: Mon, 26 Aug 2019 00:18:57 +0000
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
Cc: Archit Taneja <architt@codeaurora.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Dariusz Marcinkiewicz <darekm@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2V0IHRoZSBjb25uZWN0b3IgaW5mbyBmb3IgdGhlIENFQyBhZGFwdGVyLiBUaGlzIGhlbHBzCnVz
ZXJzcGFjZSB0byBhc3NvY2lhdGUgdGhlIENFQyBkZXZpY2Ugd2l0aCB0aGUgSERNSSBjb25uZWN0
b3IuCgpUZXN0ZWQgb24gYSBDdWJpZWJvYXJkLgoKU2lnbmVkLW9mZi1ieTogSGFucyBWZXJrdWls
IDxodmVya3VpbC1jaXNjb0B4czRhbGwubmw+ClRlc3RlZC1ieTogSGFucyBWZXJrdWlsIDxodmVy
a3VpbC1jaXNjb0B4czRhbGwubmw+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX2hk
bWlfZW5jLmMgfCA2ICsrKystLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfaGRt
aV9lbmMuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV9oZG1pX2VuYy5jCmluZGV4IDlj
M2Y5OTMzOWI4Mi4uMjJmMDgyYzMyZTFmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3Vu
NGkvc3VuNGlfaGRtaV9lbmMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfaGRt
aV9lbmMuYwpAQCAtNDg5LDYgKzQ4OSw3IEBAIHN0YXRpYyBpbnQgc3VuNGlfaGRtaV9iaW5kKHN0
cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLAogewogCXN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYgPSB0b19wbGF0Zm9ybV9kZXZpY2UoZGV2KTsKIAlzdHJ1Y3QgZHJt
X2RldmljZSAqZHJtID0gZGF0YTsKKwlzdHJ1Y3QgY2VjX2Nvbm5lY3Rvcl9pbmZvIGNvbm5faW5m
bzsKIAlzdHJ1Y3Qgc3VuNGlfZHJ2ICpkcnYgPSBkcm0tPmRldl9wcml2YXRlOwogCXN0cnVjdCBz
dW40aV9oZG1pICpoZG1pOwogCXN0cnVjdCByZXNvdXJjZSAqcmVzOwpAQCAtNjI4LDggKzYyOSw3
IEBAIHN0YXRpYyBpbnQgc3VuNGlfaGRtaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0
IGRldmljZSAqbWFzdGVyLAogCiAjaWZkZWYgQ09ORklHX0RSTV9TVU40SV9IRE1JX0NFQwogCWhk
bWktPmNlY19hZGFwID0gY2VjX3Bpbl9hbGxvY2F0ZV9hZGFwdGVyKCZzdW40aV9oZG1pX2NlY19w
aW5fb3BzLAotCQloZG1pLCAic3VuNGkiLCBDRUNfQ0FQX1RSQU5TTUlUIHwgQ0VDX0NBUF9MT0df
QUREUlMgfAotCQlDRUNfQ0FQX1BBU1NUSFJPVUdIIHwgQ0VDX0NBUF9SQyk7CisJCWhkbWksICJz
dW40aSIsIENFQ19DQVBfREVGQVVMVFMgfCBDRUNfQ0FQX0NPTk5FQ1RPUl9JTkZPKTsKIAlyZXQg
PSBQVFJfRVJSX09SX1pFUk8oaGRtaS0+Y2VjX2FkYXApOwogCWlmIChyZXQgPCAwKQogCQlnb3Rv
IGVycl9jbGVhbnVwX2Nvbm5lY3RvcjsKQEAgLTY0Nyw2ICs2NDcsOCBAQCBzdGF0aWMgaW50IHN1
bjRpX2hkbWlfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3RlciwK
IAkJCSJDb3VsZG4ndCBpbml0aWFsaXNlIHRoZSBIRE1JIGNvbm5lY3RvclxuIik7CiAJCWdvdG8g
ZXJyX2NsZWFudXBfY29ubmVjdG9yOwogCX0KKwljZWNfZmlsbF9jb25uX2luZm9fZnJvbV9kcm0o
JmNvbm5faW5mbywgJmhkbWktPmNvbm5lY3Rvcik7CisJY2VjX3NfY29ubl9pbmZvKGhkbWktPmNl
Y19hZGFwLCAmY29ubl9pbmZvKTsKIAogCS8qIFRoZXJlIGlzIG5vIEhQRCBpbnRlcnJ1cHQsIHNv
IHdlIG5lZWQgdG8gcG9sbCB0aGUgY29udHJvbGxlciAqLwogCWhkbWktPmNvbm5lY3Rvci5wb2xs
ZWQgPSBEUk1fQ09OTkVDVE9SX1BPTExfQ09OTkVDVCB8Ci0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
