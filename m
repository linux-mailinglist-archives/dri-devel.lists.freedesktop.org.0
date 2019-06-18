Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84ACC4B2C3
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:11:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4416E2CA;
	Wed, 19 Jun 2019 07:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 129406E157
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 12:38:52 +0000 (UTC)
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp03-03.back.ox.d0m.de by smtp-ox.front (RZmta 44.24 AUTH)
 with ESMTPSA id h0a328v5ICZl0nu
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Tue, 18 Jun 2019 14:35:47 +0200 (CEST)
Date: Tue, 18 Jun 2019 14:35:47 +0200 (CEST)
From: Ulrich Hecht <uli@fpond.eu>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Message-ID: <1560656267.787381.1560861347138@webmail.strato.com>
In-Reply-To: <20190617210930.6054-3-laurent.pinchart+renesas@ideasonboard.com>
References: <20190617210930.6054-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190617210930.6054-3-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 02/10] media: vsp1: drm: Don't configure hardware
 when the pipeline is disabled
MIME-Version: 1.0
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev58
X-Originating-IP: 85.212.220.45
X-Originating-Client: open-xchange-appsuite
X-Mailman-Approved-At: Wed, 19 Jun 2019 07:10:14 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1560861531; 
 s=strato-dkim-0002; d=fpond.eu;
 h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=m2kTGoAEuFNvqkVPWqBQC5qo0c6Kg6FRykTE++BQQBM=;
 b=XU+BQtq2B3h/MkqDr8k35ZeCXtl37P5s9quJO9VhIv0rm1L5VoYD18QG1NKtxAbUr1
 wRNZsiFMliqFq3S8xXYSNDQOnba79tAHzfUIbCPRPM1LPkwRltoisEuXB5WbzVlhATTY
 ED5NI2ZS4IXWAlQUGJY6lY2Wj53JOmXqttaPEYqLcUrqIOTzfcH3lynd+BPFdrxGlKS2
 8yoVt0TJuH46Xs5AB6kBFq9CnJPNxagv0+UccM59FhlZHdaYQ3tN8uKkGq6eWlm62oVV
 R3k5pfgFeU/nM4lasZZ6GCYer8WwXCbuNsiDDTbGTY3Me1Tdh1767+DCEHjn6D2XnJOh
 RcUQ==
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cj4gT24gSnVuZSAxNywgMjAxOSBhdCAxMTowOSBQTSBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50
LnBpbmNoYXJ0K3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4gd3JvdGU6Cj4gCj4gCj4gVGhlIHZz
cDFfZHVfYXRvbWljX2ZsdXNoKCkgZnVuY3Rpb24gY2FsbHMgdnNwMV9kdV9waXBlbGluZV9jb25m
aWd1cmUoKQo+IHRvIGNvbmZpZ3VyZSB0aGUgaGFyZHdhcmUgcGlwZWxpbmUuIFRoZSBmdW5jdGlv
biBpcyBjdXJyZW50bHkgZ3VhcmFudGVlZAo+IHRvIGJlIGNhbGxlZCB3aXRoIHRoZSBwaXBlbGlu
ZSBlbmFibGVkLCBidXQgdGhpcyB3aWxsIGNoYW5nZSBieSBmdXR1cmUKPiByZXdvcmsgb2YgdGhl
IERVIGRyaXZlci4gR3VhcmQgdGhlIGhhcmR3YXJlIGNvbmZpZ3VyYXRpb24gdG8gc2tpcCBpdAo+
IHdoZW4gdGhlIHBpcGVsaW5lIGlzIGRpc2FibGVkLiBUaGUgaGFyZHdhcmUgd2lsbCBiZSBjb25m
aWd1cmVkIHRoZSBuZXh0Cj4gdGltZSB0aGUgcGlwZWxpbmUgZ2V0cyBlbmFibGVkLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnQrcmVuZXNhc0Bp
ZGVhc29uYm9hcmQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL3ZzcDEvdnNw
MV9kcm0uYyB8IDEzICsrKysrKysrKysrKy0KPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS92c3Ax
L3ZzcDFfZHJtLmggfCAgMiArKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS92
c3AxL3ZzcDFfZHJtLmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3ZzcDEvdnNwMV9kcm0uYwo+
IGluZGV4IDc5NTdlMTQzOWRlMC4uOTAwNDY1Y2FmMWJmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vdnNwMS92c3AxX2RybS5jCj4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS92c3AxL3ZzcDFfZHJtLmMKPiBAQCAtNzIzLDYgKzcyMyw4IEBAIGludCB2c3AxX2R1X2F0
b21pY19lbmFibGUoc3RydWN0IGRldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgcGlwZV9pbmRleCwK
PiAgCS8qIENvbmZpZ3VyZSBhbGwgZW50aXRpZXMgaW4gdGhlIHBpcGVsaW5lLiAqLwo+ICAJdnNw
MV9kdV9waXBlbGluZV9jb25maWd1cmUocGlwZSk7Cj4gIAo+ICsJZHJtX3BpcGUtPmVuYWJsZWQg
PSB0cnVlOwo+ICsKPiAgdW5sb2NrOgo+ICAJbXV0ZXhfdW5sb2NrKCZ2c3AxLT5kcm0tPmxvY2sp
Owo+ICAKPiBAQCAtODAwLDYgKzgwMiw4IEBAIGludCB2c3AxX2R1X2F0b21pY19kaXNhYmxlKHN0
cnVjdCBkZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IHBpcGVfaW5kZXgpCj4gIAlwaXBlLT5icngt
PnBpcGUgPSBOVUxMOwo+ICAJcGlwZS0+YnJ4ID0gTlVMTDsKPiAgCj4gKwlkcm1fcGlwZS0+ZW5h
YmxlZCA9IGZhbHNlOwo+ICsKPiAgCW11dGV4X3VubG9jaygmdnNwMS0+ZHJtLT5sb2NrKTsKPiAg
Cj4gIAl2c3AxX2RsbV9yZXNldChwaXBlLT5vdXRwdXQtPmRsbSk7Cj4gQEAgLTk5Miw3ICs5OTYs
MTQgQEAgdm9pZCB2c3AxX2R1X2F0b21pY19mbHVzaChzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2ln
bmVkIGludCBwaXBlX2luZGV4LAo+ICAJfQo+ICAKPiAgCXZzcDFfZHVfcGlwZWxpbmVfc2V0dXBf
aW5wdXRzKHZzcDEsIHBpcGUpOwo+IC0JdnNwMV9kdV9waXBlbGluZV9jb25maWd1cmUocGlwZSk7
Cj4gKwo+ICsJLyoKPiArCSAqIFdlIG1heSBnZXQgY2FsbGVkIGJlZm9yZSB0aGUgcGlwZWxpbmUg
Z2V0cyBlbmFibGVkLCBwb3N0cG9uZQo+ICsJICogY29uZmlndXJhdGlvbiBpbiB0aGF0IGNhc2Uu
IHZzcDFfZHVfcGlwZWxpbmVfY29uZmlndXJlKCkgd2lsbCBiZQo+ICsJICogY2FsbGVkIGZyb20g
dnNwMV9kdV9hdG9taWNfZW5hYmxlKCkuCj4gKwkgKi8KPiArCWlmIChkcm1fcGlwZS0+ZW5hYmxl
ZCkKPiArCQl2c3AxX2R1X3BpcGVsaW5lX2NvbmZpZ3VyZShwaXBlKTsKPiAgCj4gIGRvbmU6Cj4g
IAltdXRleF91bmxvY2soJnZzcDEtPmRybS0+bG9jayk7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vdnNwMS92c3AxX2RybS5oIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS92
c3AxL3ZzcDFfZHJtLmgKPiBpbmRleCBlODVhZDQzNjZmYmIuLmQ3ODBkYWZjMTMyNCAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3ZzcDEvdnNwMV9kcm0uaAo+ICsrKyBiL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vdnNwMS92c3AxX2RybS5oCj4gQEAgLTIwLDYgKzIwLDcgQEAK
PiAgLyoqCj4gICAqIHZzcDFfZHJtX3BpcGVsaW5lIC0gU3RhdGUgZm9yIHRoZSBBUEkgZXhwb3Nl
ZCB0byB0aGUgRFJNIGRyaXZlcgo+ICAgKiBAcGlwZTogdGhlIFZTUDEgcGlwZWxpbmUgdXNlZCBm
b3IgZGlzcGxheQo+ICsgKiBAZW5hYmxlZDogdHJ1ZSBpZiB0aGUgcGlwZWxpbmUgaXMgZW5hYmxl
ZAo+ICAgKiBAd2lkdGg6IG91dHB1dCBkaXNwbGF5IHdpZHRoCj4gICAqIEBoZWlnaHQ6IG91dHB1
dCBkaXNwbGF5IGhlaWdodAo+ICAgKiBAZm9yY2VfYnJ4X3JlbGVhc2U6IHdoZW4gc2V0LCByZWxl
YXNlIHRoZSBCUnggZHVyaW5nIHRoZSBuZXh0IHJlY29uZmlndXJhdGlvbgo+IEBAIC0zMSw2ICsz
Miw3IEBACj4gICAqLwo+ICBzdHJ1Y3QgdnNwMV9kcm1fcGlwZWxpbmUgewo+ICAJc3RydWN0IHZz
cDFfcGlwZWxpbmUgcGlwZTsKPiArCWJvb2wgZW5hYmxlZDsKPiAgCj4gIAl1bnNpZ25lZCBpbnQg
d2lkdGg7Cj4gIAl1bnNpZ25lZCBpbnQgaGVpZ2h0Owo+IC0tIAo+IFJlZ2FyZHMsCj4gCj4gTGF1
cmVudCBQaW5jaGFydAo+CgpSZXZpZXdlZC1ieTogVWxyaWNoIEhlY2h0IDx1bGkrcmVuZXNhc0Bm
cG9uZC5ldT4KCkNVClVsaQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
