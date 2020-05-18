Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C28ED1D7B0E
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 16:22:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE3789BAF;
	Mon, 18 May 2020 14:22:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0770489BAF
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 14:22:55 +0000 (UTC)
Date: Mon, 18 May 2020 14:22:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1589811772;
 bh=wroxRdOoBf+KXBVDm3osHFbt94BI6EVmqm1w7k7e6hI=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=k8Ob7LZ/8fvPz9qkBnq0Jpx1IBa7ktKGCDyMyIoCaVKcZ712ERDqG/qbdTDXgh/FN
 XKkmqOOBFqlFF1tUpLOY4fDv3gcwlGgh6eT1vWXSN0PxphVhwJVeL1vujReRFJQhxM
 fiEC589hJkiAjfkhPDZD2WWh49adpXLQ0yoQ0DU4=
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 2/2] drm: add docs for standard CRTC properties
Message-ID: <FFaYYfloz0zbXJxx2uxoPluNTicf8VUdrLHL7DBuruShcow3aqIQUZui6VL3RNhFu6HlXvm-1jxmw1N3mKX-K9dr73osz_XQ77CaJ9W5zKI=@emersion.fr>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBhZGRzIGRvY3MgZm9yIHRoZSBBQ1RJVkUgYW5kIE1PREVfSUQgQ1JUQyBwcm9w
ZXJ0aWVzLgoKU2lnbmVkLW9mZi1ieTogU2ltb24gU2VyIDxjb250YWN0QGVtZXJzaW9uLmZyPgpD
YzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBWaWxsZSBTeXJq
YWxhIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6IFBla2thIFBhYWxhbmVuIDxw
ZWtrYS5wYWFsYW5lbkBjb2xsYWJvcmEuY28udWs+CkNjOiBNaWNoZWwgRMOkbnplciA8bWljaGVs
QGRhZW56ZXIubmV0PgotLS0KCkxldCBtZSBrbm93IGlmIHlvdSB0aGluayBvZiBvdGhlciB0aGlu
Z3MgdG8gYWRkLgoKU2hvdWxkIHdlIHJlZmVyIHRvIEFMTE9XX01PREVTRVQgaW4gdGhlIE1PREVf
SUQgZG9jcz8KCiBEb2N1bWVudGF0aW9uL2dwdS9kcm0ta21zLnJzdCB8ICA1ICsrKysrCiBkcml2
ZXJzL2dwdS9kcm0vZHJtX2NydGMuYyAgICB8IDE2ICsrKysrKysrKysrKysrKysKIDIgZmlsZXMg
Y2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZ3B1
L2RybS1rbXMucnN0IGIvRG9jdW1lbnRhdGlvbi9ncHUvZHJtLWttcy5yc3QKaW5kZXggMzk3MzE0
ZDA4Zjc3Li40Mjg5YjcyMDU2OTYgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZ3B1L2RybS1r
bXMucnN0CisrKyBiL0RvY3VtZW50YXRpb24vZ3B1L2RybS1rbXMucnN0CkBAIC00NjAsNiArNDYw
LDExIEBAIEhETUkgU3BlY2lmaWMgQ29ubmVjdG9yIFByb3BlcnRpZXMKIC4uIGtlcm5lbC1kb2M6
OiBkcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jCiAgICA6ZG9jOiBIRE1JIGNvbm5lY3Rv
ciBwcm9wZXJ0aWVzCiAKK1N0YW5kYXJkIENSVEMgUHJvcGVydGllcworCisuLiBrZXJuZWwtZG9j
OjogZHJpdmVycy9ncHUvZHJtL2RybV9jcnRjLmMKKyAgIDpkb2M6IHN0YW5kYXJkIENSVEMgcHJv
cGVydGllcworCiBQbGFuZSBDb21wb3NpdGlvbiBQcm9wZXJ0aWVzCiAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY3J0Yy5jIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9jcnRjLmMKaW5kZXggNDkzNmUxMDgwZTQxLi5jMjhlNjYyYzFl
OTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY3J0Yy5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fY3J0Yy5jCkBAIC0yMDQsNiArMjA0LDIyIEBAIHN0cnVjdCBkbWFfZmVuY2Ug
KmRybV9jcnRjX2NyZWF0ZV9mZW5jZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCiAJcmV0dXJuIGZl
bmNlOwogfQogCisvKioKKyAqIERPQzogc3RhbmRhcmQgQ1JUQyBwcm9wZXJ0aWVzCisgKgorICog
RFJNIENSVENzIGhhdmUgYSBmZXcgc3RhbmRhcmRpemVkIHByb3BlcnRpZXM6CisgKgorICogQUNU
SVZFOgorICogCUF0b21pYyBwcm9wZXJ0eSBmb3Igc2V0dGluZyB0aGUgcG93ZXIgc3RhdGUgb2Yg
dGhlIENSVEMuIFdoZW4gc2V0IHRvIDEgdGhlCisgKiAJQ1JUQyB3aWxsIGFjdGl2ZWx5IGRpc3Bs
YXkgY29udGVudC4gV2hlbiBzZXQgdG8gMCB0aGUgQ1JUQyB3aWxsIGJlIHBvd2VyZWQKKyAqIAlv
ZmYuIFRoZXJlIGlzIG5vIGV4cGVjdGF0aW9uIHRoYXQgdXNlci1zcGFjZSB3aWxsIHJlc2V0IENS
VEMgcmVzb3VyY2VzIGxpa2UKKyAqIAl0aGUgbW9kZSBhbmQgcGxhbmVzIHdoZW4gc2V0dGluZyBB
Q1RJVkUgdG8gMC4KKyAqIE1PREVfSUQ6CisgKiAJQXRvbWljIHByb3BlcnR5IGZvciBzZXR0aW5n
IHRoZSBDUlRDIGRpc3BsYXkgdGltaW5ncy4gVGhlIHZhbHVlIGlzIHRoZSBJRAorICogCW9mIGEg
YmxvYiBjb250YWluaW5nIHRoZSBEUk0gbW9kZSBpbmZvLiBUbyBkaXNhYmxlIHRoZSBDUlRDLCB1
c2VyLXNwYWNlCisgKiAJbXVzdCBzZXQgdGhpcyBwcm9wZXJ0eSB0byAwLgorICovCisKIC8qKgog
ICogZHJtX2NydGNfaW5pdF93aXRoX3BsYW5lcyAtIEluaXRpYWxpc2UgYSBuZXcgQ1JUQyBvYmpl
Y3Qgd2l0aAogICogICAgc3BlY2lmaWVkIHByaW1hcnkgYW5kIGN1cnNvciBwbGFuZXMuCi0tIAoy
LjI2LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
