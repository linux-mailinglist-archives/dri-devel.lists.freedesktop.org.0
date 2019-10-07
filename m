Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9D8CF3D0
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 09:29:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE8B6E25F;
	Tue,  8 Oct 2019 07:29:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 393686E4BB
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 08:23:14 +0000 (UTC)
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR82Ncd3IXOg=="
X-RZG-CLASS-ID: mo00
Received: from groucho.site by smtp.strato.de (RZmta 44.28.0 DYNA|AUTH)
 with ESMTPSA id i07086v978MWftY
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH
 bits, eq. 15360 bits RSA)) (Client did not present a certificate);
 Mon, 7 Oct 2019 10:22:32 +0200 (CEST)
From: Ulrich Hecht <uli@fpond.eu>
To: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 jitao.shi@mediatek.com
Subject: [PATCH v20 0/2] PS8640 MIPI-to-eDP bridge
Date: Mon,  7 Oct 2019 10:22:27 +0200
Message-Id: <1570436549-8694-1-git-send-email-uli@fpond.eu>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Tue, 08 Oct 2019 07:28:35 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1570436592; 
 s=strato-dkim-0002; d=fpond.eu;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=K4lPRF6A8fnUsH8X93B6bF22TBUJNSeza1MuRKIljOM=;
 b=sShCFFfGVxCT5s7grbJ7j7N8zzUbSX2KT46iBrV29+UxRnoprHHumcyG9MoOxhYzdS
 zOjnP8Z6VbEVreEMVRXpTkRjLqWVjTGXxD4GWaTwMF1a96JLhS7OBGUdOcfK3oEKttFi
 PbYKFRYGr4SGefRHSKT6ZxQerXR5eTmYFZ0MWYMRZvqFvQfGvfol4LEj7BmDmSkA0jAm
 CQVFq2zEvWFtutoXHAEwAWxXDqaltyv9lOSEOxkMUVv7JMJ/akgx/K+YUAcqqbqY7V3M
 P91Ta6TDZO18GHZF6w/ocfm9haxd2eUEqKomVQS7OBLikBbeBwT89+lswj1yzSo8KpVX
 Xang==
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
Cc: mark.rutland@arm.com, Ulrich Hecht <uli@fpond.eu>, stonea168@163.com,
 ajaykumar.rs@samsung.com, architt@codeaurora.org, vpalatin@chromium.org,
 cawa.cheng@mediatek.com, yingjoe.chen@mediatek.com, devicetree@vger.kernel.org,
 pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, robh+dt@kernel.org,
 seanpaul@chromium.org, matthias.bgg@gmail.com, eddie.huang@mediatek.com,
 rahul.sharma@samsung.com, kernel@pengutronix.de, galak@codeaurora.org,
 enric.balletbo@collabora.com, andy.yan@rock-chips.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkhCgpUaGlzIHJldmlzaW9uIGZpeGVzIGEgbWlub3IgaXNzdWUgdGhhdCBrZWVwcyB0aGUgZHJp
dmVyIGZyb20gcHJvYmluZyBvbgp0aGUgRWxtIHBsYXRmb3JtLiBUaGFua3MgdG8gTWF0dGhpYXMg
QnJ1Z2dlciBmb3IgdGVzdGluZy4KClRoaXMgZHJpdmVyIHNlZW1zIHRvIGhhdmUgZmFsbGVuIGJ5
IHRoZSB3YXlzaWRlIGJlY2F1c2UsIHdoaWxlIG90aGVyd2lzZQpmaW5lLCBpdCBoYXMgYSBmaXJt
d2FyZSB1cGRhdGUgZmVhdHVyZSB0aGF0IHJlcXVpcmVzIGEgYmxvYiB0aGF0IGlzIG5vdCBpbgp0
aGUgbGludXgtZmlybXdhcmUgcmVwby5bMV0KCldoYXRldmVyIHRoZSBjYXVzZSBmb3IgdGhhdCBt
YXkgYmUsIHRoZSB1cGRhdGUgY29kZSBpcyBlbnRpcmVseSBvcHRpb25hbAoobXkgY2hpcCB3b3Jr
cyBmaW5lIHdpdGggd2hhdGV2ZXIgZmlybXdhcmUgaXMgY3VycmVudGx5IGluc3RhbGxlZCksIHNv
IEkKaGF2ZSByZW1vdmVkIGl0IGluIG9yZGVyIHRvIGdldCB0aGlzIG1lcmdlZCBhZnRlciBhbGwu
IEkgaGF2ZSBhbHNvCmZvbGxvd2VkIHZhcmlvdXMgdHJpdmlhbCBBUEkgY2hhbmdlcyB0aGF0IGhh
dmUgcGlsZWQgdXAgc2luY2UgMjAxNjsgc2VlCnRoZSBpbmRpdmlkdWFsIHBhdGNoZXMgZm9yIGRl
dGFpbHMuCgpJJ20gdXNpbmcgdGhpcyBkcml2ZXIgb24gYW4gQWNlciBDaHJvbWVib29rIFIxMyAo
IkVsbSIpOyBzZWUKaHR0cHM6Ly9naXRodWIuY29tL3VsaS9rZXJuZWwvdHJlZS9lbG0td29ya2lu
Zy01LjQuCgpDVQpVbGkKClsxXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzk0
Mjc1NDMvCgoKSml0YW8gU2hpICgyKToKICBEb2N1bWVudGF0aW9uOiBicmlkZ2U6IEFkZCBkb2N1
bWVudGF0aW9uIGZvciBwczg2NDAgRFQgcHJvcGVydGllcwogIGRybS9icmlkZ2U6IEFkZCBJMkMg
YmFzZWQgZHJpdmVyIGZvciBwczg2NDAgYnJpZGdlCgogLi4uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9icmlkZ2UvcHM4NjQwLnR4dCAgfCAgNDQgKysKIGRyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgIHwgIDEyICsKIGRyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvcGFyYWRlLXBzODY0MC5jICAgICAgICAgICAgIHwgNjcyICsrKysrKysrKysrKysr
KysrKysrKwogNCBmaWxlcyBjaGFuZ2VkLCA3MjkgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9w
czg2NDAudHh0CiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9wYXJh
ZGUtcHM4NjQwLmMKCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
