Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9EF6B71D
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 09:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 705506E241;
	Wed, 17 Jul 2019 07:08:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D00C6E120
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 13:32:23 +0000 (UTC)
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp06-01.back.ox.d0m.de by smtp-ox.front (RZmta 44.24 AUTH)
 with ESMTPSA id h0a328v6GDWMcYQ
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Tue, 16 Jul 2019 15:32:22 +0200 (CEST)
Date: Tue, 16 Jul 2019 15:32:22 +0200 (CEST)
From: Ulrich Hecht <uli@fpond.eu>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>,
 laurent.pinchart@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie, daniel@ffwll.ch
Message-ID: <273966608.62651.1563283942512@webmail.strato.com>
In-Reply-To: <20190706140746.29132-19-jacopo+renesas@jmondi.org>
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
 <20190706140746.29132-19-jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v2 18/19] drm: rcar-du: crtc: Register GAMMA_LUT properties
MIME-Version: 1.0
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev59
X-Originating-IP: 85.212.152.154
X-Originating-Client: open-xchange-appsuite
X-Mailman-Approved-At: Wed, 17 Jul 2019 07:08:01 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1563283942; 
 s=strato-dkim-0002; d=fpond.eu;
 h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=8mz6aWMUS/XpFE++5r1IztZv0Z9gZ0BIsNuqP/EzEN8=;
 b=KjUQpRuJiChRcP8HiGRc7FiFEgaxuSub2g0D5hN/UEhIHc8KYF1UF7JWf7PnBUO7+A
 IzP6gIFSjtq3OyCpuR3wr0UkxeFkPojyrZ6ioQnz7i9OLASzy5Mo9n52qlqfNsDR4jZM
 k0CbHcOfnpYUrSp1szpuXkPibi3PaxAcP1UrXCzfzoo7bqNUqcX3PFAPwu8quoZt/QJX
 IQ7Nn6QCwUYSgDlh+rtSCOYJUb/CsVmZTGWd+ANvmailoRTNePkOmeh27DJGroWaQ4H0
 MdFgOlMHZz4Z5qDIGPK92wEI0/aWh2cQJAr9nzozeSv2TvuTpJqjdggKORcnAK8fVq1B
 BucQ==
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
Cc: muroya@ksk.co.jp, koji.matsuoka.xm@renesas.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, VenkataRajesh.Kalakodima@in.bosch.com,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cj4gT24gSnVseSA2LCAyMDE5IGF0IDQ6MDcgUE0gSmFjb3BvIE1vbmRpIDxqYWNvcG8rcmVuZXNh
c0BqbW9uZGkub3JnPiB3cm90ZToKPiAKPiAKPiBFbmFibGUgdGhlIEdBTU1BX0xVVCBLTVMgcHJv
cGVydHkgdXNpbmcgdGhlIGZyYW1ld29yayBoZWxwZXJzIHRvCj4gcmVnaXN0ZXIgdGhlIHByb2Vw
cnR5IGFuZCB0aGUgYXNzb2NpYXRlZCBnYW1tYSB0YWJsZSBzaXplIG1heGltdW0gc2l6ZS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+
Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfY3J0Yy5jIHwgNCArKysr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmNh
ci1kdS9yY2FyX2R1X2NydGMuYwo+IGluZGV4IDNkYWM2MDVjM2E2Ny4uMjIyY2NjMjBkNmQ4IDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfY3J0Yy5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9jcnRjLmMKPiBAQCAtMTA4Miw2ICsx
MDgyLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY3J0Y19mdW5jcyBjcnRjX2Z1bmNzX2dl
bjMgPSB7Cj4gIAkuc2V0X2NyY19zb3VyY2UgPSByY2FyX2R1X2NydGNfc2V0X2NyY19zb3VyY2Us
Cj4gIAkudmVyaWZ5X2NyY19zb3VyY2UgPSByY2FyX2R1X2NydGNfdmVyaWZ5X2NyY19zb3VyY2Us
Cj4gIAkuZ2V0X2NyY19zb3VyY2VzID0gcmNhcl9kdV9jcnRjX2dldF9jcmNfc291cmNlcywKPiAr
CS5nYW1tYV9zZXQgPSBkcm1fYXRvbWljX2hlbHBlcl9sZWdhY3lfZ2FtbWFfc2V0LAo+ICB9Owo+
ICAKPiAgLyogLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBAQCAtMTIwNSw2ICsxMjA2LDkgQEAgaW50
IHJjYXJfZHVfY3J0Y19jcmVhdGUoc3RydWN0IHJjYXJfZHVfZ3JvdXAgKnJncnAsIHVuc2lnbmVk
IGludCBzd2luZGV4LAo+ICAJaWYgKHJjZHUtPmNtbXNbc3dpbmRleF0pIHsKPiAgCQlyY3J0Yy0+
Y21tID0gcmNkdS0+Y21tc1tzd2luZGV4XTsKPiAgCQlyZ3JwLT5jbW1zX21hc2sgfD0gQklUKGh3
aW5kZXggJSAyKTsKPiArCj4gKwkJZHJtX21vZGVfY3J0Y19zZXRfZ2FtbWFfc2l6ZShjcnRjLCBD
TU1fR0FNTUFfTFVUX1NJWkUpOwo+ICsJCWRybV9jcnRjX2VuYWJsZV9jb2xvcl9tZ210KGNydGMs
IDAsIGZhbHNlLCBDTU1fR0FNTUFfTFVUX1NJWkUpOwo+ICAJfQo+ICAKPiAgCWRybV9jcnRjX2hl
bHBlcl9hZGQoY3J0YywgJmNydGNfaGVscGVyX2Z1bmNzKTsKPiAtLSAKPiAyLjIxLjAKPgoKUmV2
aWV3ZWQtYnk6IFVscmljaCBIZWNodCA8dWxpK3JlbmVzYXNAZnBvbmQuZXU+CgpDVQpVbGkKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
