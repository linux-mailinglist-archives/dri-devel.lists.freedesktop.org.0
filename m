Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FA32B6EB
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 15:48:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 906CD89216;
	Mon, 27 May 2019 13:48:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D20C89216
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 13:48:18 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4RDmBow053952;
 Mon, 27 May 2019 08:48:11 -0500
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4RDmBnm026368
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 27 May 2019 08:48:11 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 27
 May 2019 08:48:11 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 27 May 2019 08:48:11 -0500
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4RDlviI065947;
 Mon, 27 May 2019 08:48:09 -0500
From: Jyri Sarha <jsarha@ti.com>
To: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v8 5/6] dt-bindings: display: sii902x: Add HDMI audio bindings
Date: Mon, 27 May 2019 16:47:56 +0300
Message-ID: <f790277fabc45f987f90075dd842368705226a84.1558964241.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1558964241.git.jsarha@ti.com>
References: <cover.1558964241.git.jsarha@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1558964891;
 bh=tXdIuQWjAhHLfchDCp84KHyZg8p1JChPL/Ztp9I9tiA=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=LFu9LiSht6nSP8iT+FEf/C0tJVePpm8+Kz/8V3ApTVfhrbQ8Tz2vFJpi57Rum8IBT
 nOaRxDmDUG/vTSbTHqT883j5ZCkFUX5JNifROWf3YlSMRS867hvGEumvvu0v7qZOjF
 XSb25qYGuMAA0mle7nMAKqJUJsxT98nqSOEmvfB0=
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
Cc: peter.ujfalusi@ti.com, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHNpaTkwMnggY2hpcCBmYW1pbHkgc3VwcG9ydHMgYWxzbyBIRE1JIGF1ZGlvLiBBZGQgYmlu
ZGluZyBmb3IKZGVzY3JpYmluZyB0aGUgbmVjZXNzYXJ5IGkycyBhbmQgbWNsayB3aXJpbmcgZm9y
IGl0LgoKU2lnbmVkLW9mZi1ieTogSnlyaSBTYXJoYSA8anNhcmhhQHRpLmNvbT4KUmV2aWV3ZWQt
Ynk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ci0tLQogLi4uL2JpbmRpbmdzL2Rpc3Bs
YXkvYnJpZGdlL3NpaTkwMngudHh0ICAgICAgIHwgNDAgKysrKysrKysrKysrKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2Uvc2lpOTAyeC50eHQgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2Uvc2lpOTAyeC50eHQKaW5k
ZXggYzRjMTg1NWNhNjU0Li4yZGY0NGI3ZDM4MjEgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9zaWk5MDJ4LnR4dAorKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2Uvc2lpOTAyeC50eHQK
QEAgLTksNiArOSw0MCBAQCBPcHRpb25hbCBwcm9wZXJ0aWVzOgogCSAgYWJvdXQgaG90cGx1ZyBl
dmVudHMuCiAJLSByZXNldC1ncGlvczogT0YgZGV2aWNlLXRyZWUgZ3BpbyBzcGVjaWZpY2F0aW9u
IGZvciBSU1RfTiBwaW4uCiAKKwlIRE1JIGF1ZGlvIHByb3BlcnRpZXM6CisJLSAjc291bmQtZGFp
LWNlbGxzOiA8MD4gb3IgPDE+LiA8MD4gaWYgb25seSBpMnMgb3Igc3BkaWYgcGluCisJICAgaXMg
d2lyZWQsIDwxPiBpZiB0aGUgYm90aCBhcmUgd2lyZWQuIEhETUkgYXVkaW8gaXMKKwkgICBjb25m
aWd1cmVkIG9ubHkgaWYgdGhpcyBwcm9wZXJ0eSBpcyBmb3VuZC4KKwktIHNpbCxpMnMtZGF0YS1s
YW5lczogQXJyYXkgb2YgdXAgdG8gNCBpbnRlZ2VycyB3aXRoIHZhbHVlcyBvZiAwLTMKKwkgICBF
YWNoIGludGVnZXIgaW5kaWNhdGVzIHdoaWNoIGkycyBwaW4gaXMgY29ubmVjdGVkIHRvIHdoaWNo
CisJICAgYXVkaW8gZmlmby4gVGhlIGZpcnN0IGludGVnZXIgc2VsZWN0cyBpMnMgYXVkaW8gcGlu
IGZvciB0aGUKKwkgICBmaXJzdCBhdWRpbyBmaWZvIzAgKEhETUkgY2hhbm5lbHMgMSYyKSwgc2Vj
b25kIGZvciBmaWZvIzEKKwkgICAoSERNSSBjaGFubmVscyAzJjQpLCBhbmQgc28gb24uIFRoZXJl
IGlzIDQgZmlmb3MgYW5kIDQgaTJzCisJICAgcGlucyAoU0QwIC0gU0QzKS4gQW55IGkycyBwaW4g
Y2FuIGJlIGNvbm5lY3RlZCB0byBhbnkgZmlmbywKKwkgICBidXQgdGhlcmUgY2FuIGJlIG5vIGdh
cHMuIEUuZy4gYW4gaTJzIHBpbiBtdXN0IGJlIG1hcHBlZCB0bworCSAgIGZpZm8jMCBhbmQgZmlm
byMxIGJlZm9yZSBtYXBwaW5nIGEgY2hhbm5lbCB0byBmaWZvIzIuIERlZmF1bHQKKwkgICB2YWx1
ZSBpcyA8MD4sIGRlc2NyaWJpbmcgU0QwIHBpbiBiZWlnaW5nIHJvdXRlZCB0byBoZG1pIGF1ZGlv
CisJICAgZmlmbyAjMC4KKwktIGNsb2NrczogcGhhbmRsZSBhbmQgY2xvY2sgc3BlY2lmaWVyIGZv
ciBlYWNoIGNsb2NrIGxpc3RlZCBpbgorICAgICAgICAgICB0aGUgY2xvY2stbmFtZXMgcHJvcGVy
dHkKKwktIGNsb2NrLW5hbWVzOiAibWNsayIKKwkgICBEZXNjcmliZXMgU0lJOTAyeCBNQ0xLIGlu
cHV0LiBNQ0xLIGlzIHVzZWQgdG8gcHJvZHVjZQorCSAgIEhETUkgYXVkaW8gQ1RTIHZhbHVlcy4g
VGhpcyBwcm9wZXJ0eSBpcyByZXF1aXJlZCBpZgorCSAgICIjc291bmQtZGFpLWNlbGxzIi1wcm9w
ZXJ0eSBpcyBwcmVzZW50LiBUaGlzIHByb3BlcnR5IGZvbGxvd3MKKwkgICBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svY2xvY2stYmluZGluZ3MudHh0CisJICAgY29uc3Vt
ZXIgYmluZGluZy4KKworCUlmIEhETUkgYXVkaW8gaXMgY29uZmlndXJlZCB0aGUgc2lpOTAyeCBk
ZXZpY2UgYmVjb21lcyBhbiBJMlMKKwlhbmQvb3Igc3BkaWYgYXVkaW8gY29kZWMgY29tcG9uZW50
IChlLmcgYSBkaWdpdGFsIGF1ZGlvIHNpbmspLAorCXRoYXQgY2FuIGJlIHVzZWQgaW4gY29uZmln
dXJpbmcgYSBmdWxsIGF1ZGlvIGRldmljZXMgd2l0aAorCXNpbXBsZS1jYXJkIG9yIGF1ZGlvLWdy
YXBoLWNhcmQgYmluZGluZy4gU2VlIHRoZWlyIGJpbmRpbmcKKwlkb2N1bWVudHMgb24gaG93IHRv
IGRlc2NyaWJlIHRoZSB3YXkgdGhlIHNpaTkwMnggZGV2aWNlIGlzCisJY29ubmVjdGVkIHRvIHRo
ZSByZXN0IG9mIHRoZSBhdWRpbyBzeXN0ZW06CisJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3NvdW5kL3NpbXBsZS1jYXJkLnR4dAorCURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9zb3VuZC9hdWRpby1ncmFwaC1jYXJkLnR4dAorCU5vdGU6IEluIGNhc2Ugb2YgdGhl
IGF1ZGlvLWdyYXBoLWNhcmQgYmluZGluZyB0aGUgdXNlZCBwb3J0CisJaW5kZXggc2hvdWxkIGJl
IDMuCisKIE9wdGlvbmFsIHN1Ym5vZGVzOgogCS0gdmlkZW8gaW5wdXQ6IHRoaXMgc3Vibm9kZSBj
YW4gY29udGFpbiBhIHZpZGVvIGlucHV0IHBvcnQgbm9kZQogCSAgdG8gY29ubmVjdCB0aGUgYnJp
ZGdlIHRvIGEgZGlzcGxheSBjb250cm9sbGVyIG91dHB1dCAoU2VlIHRoaXMKQEAgLTIxLDYgKzU1
LDEyIEBAIEV4YW1wbGU6CiAJCWNvbXBhdGlibGUgPSAic2lsLHNpaTkwMjIiOwogCQlyZWcgPSA8
MHgzOT47CiAJCXJlc2V0LWdwaW9zID0gPCZwaW9BIDEgMD47CisKKwkJI3NvdW5kLWRhaS1jZWxs
cyA9IDwwPjsKKwkJc2lsLGkycy1kYXRhLWxhbmVzID0gPCAwIDEgMiA+OworCQljbG9ja3MgPSA8
Jm1jbGs+OworCQljbG9jay1uYW1lcyA9ICJtY2xrIjsKKwogCQlwb3J0cyB7CiAJCQkjYWRkcmVz
cy1jZWxscyA9IDwxPjsKIAkJCSNzaXplLWNlbGxzID0gPDA+OwotLSAKVGV4YXMgSW5zdHJ1bWVu
dHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuIFktdHVubnVz
L0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
