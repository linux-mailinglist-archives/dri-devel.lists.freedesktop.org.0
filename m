Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAB8295C19
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 11:38:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BA96F593;
	Thu, 22 Oct 2020 09:38:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F0426F583
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 09:38:18 +0000 (UTC)
Date: Thu, 22 Oct 2020 09:38:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1603359495;
 bh=LGRiWQ8po9v8ocniayvI1sADSQF1X+BLqPUzuucOBS0=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=cQML5i7FjocWCk7lAleenBG7hScssBYs/V8KBhnLi5k1UfdmGKfB76vGzSKRopp7r
 pK5jqHIF5dsJf0AB4l0ThIKN37eyU60oIyEElJH6lF2DKc9haIaRk3JvCgNGavAxyS
 xi2UO2AwnhaVKGNauIE6hJyn1QVY4Dk6fZIeapPMqEFsavDz11/KkVdpZHsBxAyGOd
 H3rfM8OKmkpPI/gD4tUW/zzIOy5SwZWaBaRmILuo+2BJl5oKuBscAakLV1AM9vHtPf
 M9MrV7TftPAfHckB5MhpaBx60l/X9vDAnowihQDmE+UmlZ6i4aIqDEMSyglqDrGJSn
 p67yzzdpZmHGQ==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm: document that blobs are ref'counted
Message-ID: <HNBtgIoryEkrMD_i_O5qy-HyxoyMYWSziPwHQQn9LYoOL8Ds5o7gvqMqz-Y0v7GZDqcYzBLC3d3KPfO37nRCl1doMWeQjKyHYv_pYFxYZ24=@emersion.fr>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlci1zcGFjZSBkb2Vzbid0IG5lZWQgdG8ga2VlcCB0cmFjayBvZiBibG9icyB0aGF0IG1pZ2h0
IGJlIGluIHVzZSBieQp0aGUga2VybmVsLiBVc2VyLXNwYWNlIGNhbiBqdXN0IGRlc3Ryb3kgYmxv
YnMgYXMgc29vbiBhcyB0aGV5IGRvbid0IG5lZWQKdGhlbSBhbnltb3JlLgoKU2lnbmVkLW9mZi1i
eTogU2ltb24gU2VyIDxjb250YWN0QGVtZXJzaW9uLmZyPgpDYzogUGVra2EgUGFhbGFuZW4gPHBw
YWFsYW5lbkBnbWFpbC5jb20+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNj
OiBKb25hcyDDhWRhaGwgPGphZGFobEBnbWFpbC5jb20+Ci0tLQogaW5jbHVkZS91YXBpL2RybS9k
cm1fbW9kZS5oIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oIGIvaW5jbHVkZS91YXBpL2RybS9k
cm1fbW9kZS5oCmluZGV4IDg2M2VkYTA0ODI2NS4uZjdjNDFhYTRiNWViIDEwMDY0NAotLS0gYS9p
bmNsdWRlL3VhcGkvZHJtL2RybV9tb2RlLmgKKysrIGIvaW5jbHVkZS91YXBpL2RybS9kcm1fbW9k
ZS5oCkBAIC05MjQsNiArOTI0LDEwIEBAIHN0cnVjdCBkcm1fbW9kZV9jcmVhdGVfYmxvYiB7CiAg
KiBzdHJ1Y3QgZHJtX21vZGVfZGVzdHJveV9ibG9iIC0gRGVzdHJveSB1c2VyIGJsb2IKICAqIEBi
bG9iX2lkOiBibG9iX2lkIHRvIGRlc3Ryb3kKICAqIERlc3Ryb3kgYSB1c2VyLWNyZWF0ZWQgYmxv
YiBwcm9wZXJ0eS4KKyAqCisgKiBCbG9icyBhcmUgcmVmZXJlbmNlLWNvdW50ZWQgYnkgdGhlIGtl
cm5lbCwgc28gdXNlci1zcGFjZSBjYW4gZGVzdHJveSB0aGVtIGFzCisgKiBzb29uIGFzIHRoZXkn
cmUgZG9uZSB3aXRoIHRoZW0uICBGb3IgaW5zdGFuY2UgdXNlci1zcGFjZSBjYW4gZGVzdHJveSBh
IGJsb2IKKyAqIHVzZWQgaW4gYW4gYXRvbWljIGNvbW1pdCByaWdodCBhZnRlciBwZXJmb3JtaW5n
IHRoZSBhdG9taWMgY29tbWl0IGlvY3RsLgogICovCiBzdHJ1Y3QgZHJtX21vZGVfZGVzdHJveV9i
bG9iIHsKIAlfX3UzMiBibG9iX2lkOwotLSAKMi4yOC4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
