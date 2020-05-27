Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F161E3CA6
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 10:52:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDCA189650;
	Wed, 27 May 2020 08:52:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 437EE89650
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 08:52:09 +0000 (UTC)
Date: Wed, 27 May 2020 08:52:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1590569526;
 bh=X+0ecasd7FUIHFNK2Fw3IvKWFcsiHKstT7sk71vx9wo=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=uTJeLv14q93yyOs0AFKJPxT+htZkWCV3LIOFaocWnVP4FYWozWRxFB+Hq5PzYAQ12
 TBBRGdIznnvF3ArpsvY/F8IvqzaLeN1ZrHX9AnLECX7ALIJc/OnTCeLGnSNqtHj5RM
 wo1OOVnzrdRGphwXai04zmt7j+EP7eLmlqprHgK0=
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm/fourcc: document modifier uniqueness requirements
Message-ID: <oiOTNO-CVtaRiMyv-cHHP3CGvE4-9eSZRMmmdzXMb56vWw6CppnmT95NRUStbuV_RJLF-G_7usijW0kXKm64IuTJK9g49DycnAuE80yGlyo=@emersion.fr>
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
Cc: =?UTF-8?Q?Marek_Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUgaGF2ZSBzdWdnZXN0aW9ucyB0byBiYWtlIHBpdGNoIGFsaWdubWVudCwgYWRkcmVzcyBh
bGlnbmVtZW50LApjb250aWd1b3VzIG1lbW9yeSBvciBvdGhlciBwbGFjZW1lbnQgKGhpZGRlbiBW
UkFNLCBHVFQvQkFSLCBldGMpCmNvbnN0cmFpbnRzIGludG8gbW9kaWZpZXJzLiBMYXN0IHRpbWUg
dGhpcyB3YXMgYnJvdWdodCB1cCBpdCBzZWVtZWQKbGlrZSB0aGUgY29uc2Vuc3VzIHdhcyB0byBu
b3QgYWxsb3cgdGhpcy4gRG9jdW1lbnQgdGhpcyBpbiBkcm1fZm91cmNjLmguCgpUaGVyZSBhcmUg
c2V2ZXJhbCByZWFzb25zIGZvciB0aGlzLgoKLSBFbmNvZGluZyBhbGwgb2YgdGhlc2UgY29uc3Ry
YWludHMgaW4gdGhlIG1vZGlmaWVycyB3b3VsZCBleHBsb2RlIHRoZQogIHNlYXJjaCBzcGFjZSBw
cmV0dHkgcXVpY2tseSAod2Ugb25seSBoYXZlIDY0IGJpdHMgdG8gd29yayB3aXRoKS4KLSBNb2Rp
ZmllcnMgbmVlZCB0byBiZSB1bmFtYmlndW91czogYSBidWZmZXIgY2FuIG9ubHkgaGF2ZSBhIHNp
bmdsZQogIG1vZGlmaWVyLgotIE1vZGlmaWVyIHVzZXJzIGFyZW4ndCBleHBlY3RlZCB0byBwYXJz
ZSBtb2RpZmllcnMuCgpTaWduZWQtb2ZmLWJ5OiBTaW1vbiBTZXIgPGNvbnRhY3RAZW1lcnNpb24u
ZnI+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBEYW5pZWwgU3RvbmUg
PGRhbmllbEBmb29pc2hiYXIub3JnPgpDYzogQmFzIE5pZXV3ZW5odWl6ZW4gPGJhc0BiYXNuaWV1
d2VuaHVpemVuLm5sPgpDYzogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPgpDYzogTWFy
ZWsgT2zFocOhayA8bWFyYWVvQGdtYWlsLmNvbT4KLS0tCiBpbmNsdWRlL3VhcGkvZHJtL2RybV9m
b3VyY2MuaCB8IDExICsrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oIGIvaW5jbHVkZS91
YXBpL2RybS9kcm1fZm91cmNjLmgKaW5kZXggNDkwMTQzNTAwYTUwLi45N2ViMGYxY2Y5ZjggMTAw
NjQ0Ci0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oCisrKyBiL2luY2x1ZGUvdWFw
aS9kcm0vZHJtX2ZvdXJjYy5oCkBAIC01OCw2ICs1OCwxNyBAQCBleHRlcm4gIkMiIHsKICAqIG1h
eSBwcmVzZXJ2ZSBtZWFuaW5nIC0gc3VjaCBhcyBudW1iZXIgb2YgcGxhbmVzIC0gZnJvbSB0aGUg
Zm91cmNjIGNvZGUsCiAgKiB3aGVyZWFzIG90aGVycyBtYXkgbm90LgogICoKKyAqIE1vZGlmaWVy
cyBtdXN0IHVuaXF1ZWx5IGVuY29kZSBidWZmZXIgbGF5b3V0LiBJbiBvdGhlciB3b3JkcywgYSBi
dWZmZXIgbXVzdAorICogbWF0Y2ggb25seSBhIHNpbmdsZSBtb2RpZmllci4gQSBtb2RpZmllciBt
dXN0IG5vdCBiZSBhIHN1YnNldCBvZiBsYXlvdXRzIG9mCisgKiBhbm90aGVyIG1vZGlmaWVyLiBG
b3IgaW5zdGFuY2UsIGl0J3MgaW5jb3JyZWN0IHRvIGVuY29kZSBwaXRjaCBhbGlnbm1lbnQgaW4K
KyAqIGEgbW9kaWZpZXI6IGEgYnVmZmVyIG1heSBtYXRjaCBhIDY0LXBpeGVsIGFsaWduZWQgbW9k
aWZpZXIgYW5kIGEgMzItcGl4ZWwKKyAqIGFsaWduZWQgbW9kaWZpZXIuIFRoYXQgc2FpZCwgbW9k
aWZpZXJzIGNhbiBoYXZlIGltcGxpY2l0IG1pbmltYWwKKyAqIHJlcXVpcmVtZW50cy4KKyAqCisg
KiBVc2VycyBzZWUgbW9kaWZpZXJzIGFzIG9wYXF1ZSB0b2tlbnMgdGhleSBjYW4gY2hlY2sgZm9y
IGVxdWFsaXR5IGFuZAorICogaW50ZXJzZWN0LiBVc2VycyBtdXNuJ3QgbmVlZCB0byBrbm93IHRv
IHJlYXNvbiBhYm91dCB0aGUgbW9kaWZpZXIgdmFsdWUKKyAqIChpLmUuIHVzZXJzIGFyZSBub3Qg
ZXhwZWN0ZWQgdG8gZXh0cmFjdCBpbmZvcm1hdGlvbiBvdXQgb2YgdGhlIG1vZGlmaWVyKS4KKyAq
CiAgKiBWZW5kb3JzIHNob3VsZCBkb2N1bWVudCB0aGVpciBtb2RpZmllciB1c2FnZSBpbiBhcyBt
dWNoIGRldGFpbCBhcwogICogcG9zc2libGUsIHRvIGVuc3VyZSBtYXhpbXVtIGNvbXBhdGliaWxp
dHkgYWNyb3NzIGRldmljZXMsIGRyaXZlcnMgYW5kCiAgKiBhcHBsaWNhdGlvbnMuCi0tIAoyLjI2
LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
