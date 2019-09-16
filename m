Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CD0B4804
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 09:17:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79766EAF0;
	Tue, 17 Sep 2019 07:17:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E6B6E194
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 10:20:29 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id d3so16751007plr.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 03:20:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=PgMhf4u6wd7uXXmiG7j+1xjg99Rx0SZibnkM881GiKc=;
 b=U7lJIiHmRj+UfF+G8LnLak6JQVkwyDJOeOsUjFDzzUTsyua7zH5gQJ72uqCgebwCEq
 OJLPSspnfMTsjKjZ4mt3wSpl/xb/gJiyLLnnEMYAJyoklJg0K3IkyRThSMGAPqzd7Szq
 huHRG1U3qYN9fbBeq2IuLj33h3k5HdWJhYwSIn6MKQiVgvo9z79TBB3JcUxYEoM/CNGt
 0CRiy3tTQ9VDDpcAHk9dT5Ea6uOxh7vx1gERfLLVTUR6lCBQhnP+kfDsHq5zCpLNPPNP
 zt79r8x0u2WcSEeeD2p+i0yTrR8KTEgOsE0q4AT0NnSu4HuZUGTNaVWXlEqHlWpR8DwR
 HKkQ==
X-Gm-Message-State: APjAAAWd6vR3B4dOdsvWNsy+3quwkn6zow3bnjZW/9e2arEt+GdW/16O
 uR60VINfdkkCPth6rHefna7ZtC8tkaHdJ5RG6YOBGQ==
X-Google-Smtp-Source: APXvYqxrWE5fxfNBfNr40u6IDNGY6yf7hOyH/DW0yWt50bM+njfYEBq6JACqzGAVmhDtAcI4434+A+URP5u7HppODyo=
X-Received: by 2002:a17:902:5a44:: with SMTP id
 f4mr20011448plm.31.1568629228733; 
 Mon, 16 Sep 2019 03:20:28 -0700 (PDT)
MIME-Version: 1.0
From: Jerry Han <jerry.han.hq@gmail.com>
Date: Mon, 16 Sep 2019 18:20:17 +0800
Message-ID: <CA+quO7LUBB8JuZyQNR+StpYJ16Dt3z0LNPPKX4M4Wgokt6proQ@mail.gmail.com>
Subject: [PATCH 7/9] [v10, 7/9] drm/panel:Add Boe Himax8279d MIPI-DSI LCD panel
To: ML dri-devel <dri-devel@lists.freedesktop.org>, 
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Jitao Shi <jitao.shi@mediatek.com>, 
 Derek Basehore <dbasehore@chromium.org>, Rock wang <rock_wang@himax.com.cn>, 
 Emil Velikov <emil.l.velikov@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="000000000000f7175b0592a8f3dd"
X-Mailman-Approved-At: Tue, 17 Sep 2019 07:17:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=PgMhf4u6wd7uXXmiG7j+1xjg99Rx0SZibnkM881GiKc=;
 b=urjWJBjydNR+VsA133p7jGl1dA8VII6fGtC+m6cCPEwAHLTzpfGYBNCr8RH11A+j3X
 c/hMrqKGD8lvntJmOJOkeV/5GAHy191mdk+QGxoAesxtdfeLt9bqXYkHVlH3UL2DyU4c
 bY/1eF+GwEEyCJNTuajAGt1IsoQCZlKFLNUZAENvTAUI+8mCXeV9IjiyE7Z+X1wpflpo
 fnHh9gExIBnr+Z2tRSUPhZkegMYajKvh/tVGu01APk98M3NCoDrWHWAA3wqCcxunz7N3
 LrzVz27c2H/1rw2FgaSyvJDeyLck8sDYpnQl9y5bmsKc3phPPaKU6f76d7K5u/LKheTB
 MpOQ==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000f7175b0592a8f3dd
Content-Type: text/plain; charset="UTF-8"



--000000000000f7175b0592a8f3dd
Content-Type: application/octet-stream; 
	name="0007-v10-7-9-drm-panel-Add-Boe-Himax8279d-MIPI-DSI-LCD-pa.patch"
Content-Disposition: attachment; 
	filename="0007-v10-7-9-drm-panel-Add-Boe-Himax8279d-MIPI-DSI-LCD-pa.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k0m9bj0n0>
X-Attachment-Id: f_k0m9bj0n0

RnJvbSAyODViNmQ3MzZiNDQxZGFlYjkzOGVkOTExODY0MTE0ZjQxZTNkZTAyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKZXJyeSBIYW4gPGplcnJ5Lmhhbi5ocUBnbWFpbC5jb20+CkRh
dGU6IE1vbiwgMTYgU2VwIDIwMTkgMTc6MTI6MTYgKzA4MDAKU3ViamVjdDogW1BBVENIIDcvOV0g
W3YxMCw3LzldIGRybS9wYW5lbDogQWRkIEJvZSBIaW1heDgyNzlkIE1JUEktRFNJIExDRAogcGFu
ZWwKClN1cHBvcnQgQm9lIEhpbWF4ODI3OWQgOC4wIiAxMjAweDE5MjAgVEZUIExDRCBwYW5lbCwg
aXQgaXMgYSBNSVBJIERTSQpwYW5lbC4KClY3OgotIE1vZGlmeSBjb21tdW5pY2F0aW9uIGFkZHJl
c3MKClY2OgotIEFkZCB0aGUgaW5mb3JtYXRpb24gb2YgdGhlIHJldmlld2VyCi0gUmVtb3ZlIHVu
bmVjZXNzYXJ5IGRlbGF5cywgVGhlIHVkZWxheV9yYW5nZSBjb2RlIGdyYWNlZnVsbHkgcmV0dXJu
cwogICAgd2l0aG91dCBoaXR0aW5nIHRoZSBzY2hlZHVsZXIgb24gYSBkZWxheSBvZiAwLiAoRGVy
ZWspCi0gTWVyZ2UgdGhlIHNhbWUgZGF0YSBzdHJ1Y3R1cmVzLCBsaWtlIGRpc3BsYXlfbW9kZSBh
bmQgb2ZmX2NtZHMgKERlcmVrKQotIE9wdGltaXplIHRoZSBwcm9jZXNzaW5nIG9mIHJlc3VsdHMg
cmV0dXJuZWQgYnkKICAgIGRldm1fZ3Bpb2RfZ2V0X29wdGlvbmFsIChEZXJlaykKClY1OgotIEFk
ZCB0aGUgaW5mb3JtYXRpb24gb2YgdGhlIHJldmlld2VyIChTYW0pCi0gRGVsZXRlIHVubmVjZXNz
YXJ5IGhlYWRlciBmaWxlcyAjaW5jbHVkZSA8bGludXgvZmIuaD4gKFNhbSkKLSBUaGUgY29uZmln
IERSTV9QQU5FTF9CT0VfSElNQVg4Mjc5RCBhcHBlYXJzIHR3aWNlLiBEcm9wIG9uZSBvZiB0aGVt
IChTYW0pCi0gQUREIHN0YXRpYywgc2V0X2dwaW9zIGZ1bmN0aW9uIGlzIG5vdCB1c2VkIG91dHNp
ZGUgdGhpcyBtb2R1bGUgKFNhbSkKClY0OgotIEZyZWZpeCBhbGwgZnVuY3Rpb24gbWFlcyB3aXRo
IGJvZV8gKFNhbSkKLSBGc2VkICJlbmFibGVfZ3BpbyIgcmVwbGFjZSAicmVzZXRfZ3BpbyIsIE1h
a2UgaXQgbG9vayBjbGVhcmVyIChTYW0pCi0gU29ydCBpbmNsdWRlIGxpbmVzIGFscGhhYmV0aWNh
bGx5IChTYW0pCi0gRml4ZWQgZW50cmllcyBpbiB0aGUgbWFrZWZpbGUgbXVzdCBiZSBzb3J0ZWQg
YWxwaGFiZXRpY2FsbHkgKFNhbSkKLSBBZGQgc2VuZF9taXBpX2NtZHMgZnVuY3Rpb24gdG8gYXZv
aWQgZHVwbGljYXRpbmcgdGhlIGNvZGUgKFNhbSkKLSBBZGQgdGhlIG5lY2Vzc2FyeSBkZWxheShy
ZXNldF9kZWxheV90NSkgYmV0d2VlbiByZXNldCBhbmQgc2VuZGluZwogICAgdGhlIGluaXRpYWxp
emF0aW9uIGNvbW1hbmQgKFJvY2sgd2FuZykKClYzOgotIFJlbW92ZSB1bm5lY2Vzc2FyeSBkZWxh
eXMgaW4gc2VuZGluZyBpbml0aWFsaXphdGlvbiBjb21tYW5kcyAoSml0YW8gU2hpKQoKVjI6Ci0g
VXNlIFNQRFggaWRlbnRpZmllciAoU2FtKQotIFVzZSBuZWNlc3NhcnkgaGVhZGVyIGZpbGVzIHJl
cGxhY2UgZHJtUC5oIChTYW0pCi0gRGVsZXRlIHVubmVjZXNzYXJ5IGhlYWRlciBmaWxlcyAjaW5j
bHVkZSA8bGludXgvZXJyLmg+IChTYW0pCi0gU3BlY2lmaWVzIGEgR1BJT3MgYXJyYXkgdG8gY29u
dHJvbCB0aGUgcmVzZXQgdGltaW5nLAogICAgaW5zdGVhZCBvZiByZWFkaW5nICJkc2ktcmVzZXQt
c2VxdWVuY2UiIGRhdGEgZnJvbSBEVFMgKFNhbSkKLSBEZWxldGUgYmFja2xpZ2h0X2Rpc2FibGUo
KSBmdW5jdGlvbiB3aGVuIGFscmVhZHkgZGlzYWJsZWQgKFNhbSkKLSBVc2UgZGV2bV9vZl9maW5k
X2JhY2tsaWdodCgpIHJlcGxhY2Ugb2ZfZmluZF9iYWNrbGlnaHRfYnlfbm9kZSgpIChTYW0pCi0g
TW92ZSB0aGUgbmVjZXNzYXJ5IGRhdGEgaW4gdGhlIERUUyB0byB0aGUgY3VycmVudCBmaWxlLAog
ICAgbGlrZSBwb3JjaCwgZGlzcGxheV9tb2RlIGFuZCBJbml0IGNvZGUgZXRjLiAoU2FtKQotIEFk
ZCBjb21wYXRpYmxlIGRldmljZSAiYm9lLGhpbWF4ODI3OWQxMHAiIChTYW0pCgpWMToKLSBTdXBw
b3J0IEJvZSBIaW1heDgyNzlkIDguMCIgMTIwMHgxOTIwIFRGVCBMQ0QgcGFuZWwsIGl0IGlzIGEg
TUlQSSBEU0kKICAgIHBhbmVsLgoKU2lnbmVkLW9mZi1ieTogSmVycnkgSGFuIDxqZXJyeS5oYW4u
aHFAZ21haWwuY29tPgpSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3Jn
PgpSZXZpZXdlZC1ieTogRGVyZWsgQmFzZWhvcmUgPGRiYXNlaG9yZUBjaHJvbWl1bS5vcmc+CkNj
OiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+CkNjOiBSb2NrIHdhbmcgPHJvY2tf
d2FuZ0BoaW1heC5jb20uY24+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWJvZS1o
aW1heDgyNzlkLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWJv
ZS1oaW1heDgyNzlkLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtYm9lLWhpbWF4ODI3
OWQuYwppbmRleCBmZjVhODllMzhmZDcuLjljOGVjZTRmYTMwYSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3BhbmVsL3BhbmVsLWJvZS1oaW1heDgyNzlkLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLWJvZS1oaW1heDgyNzlkLmMKQEAgLTIsNyArMiw3IEBACiAvKgogICog
Q29weXJpZ2h0IChjKSAyMDE5LCBIdWFxaW4gVGVsZWNvbSBUZWNobm9sb2d5IENvLiwgTHRkCiAg
KgotICogQXV0aG9yOiBKZXJyeSBIYW4gPGhhbnh1NUBodWFxaW4uY29ycC1wYXJ0bmVyLmdvb2ds
ZS5jb20+CisgKiBBdXRob3I6IEplcnJ5IEhhbiA8amVycnkuaGFuLmhxQGdtYWlsLmNvbT4KICAq
CiAgKi8KIApAQCAtMTA0NSw2ICsxMDQ1LDYgQEAgc3RhdGljIHN0cnVjdCBtaXBpX2RzaV9kcml2
ZXIgcGFuZWxfZHJpdmVyID0gewogfTsKIG1vZHVsZV9taXBpX2RzaV9kcml2ZXIocGFuZWxfZHJp
dmVyKTsKIAotTU9EVUxFX0FVVEhPUigiSmVycnkgSGFuIDxoYW54dTVAaHVhcWluLmNvcnAtcGFy
dG5lci5nb29nbGUuY29tPiIpOworTU9EVUxFX0FVVEhPUigiSmVycnkgSGFuIDxqZXJyeS5oYW4u
aHFAZ21haWwuY29tPiIpOwogTU9EVUxFX0RFU0NSSVBUSU9OKCJCb2UgSGltYXg4Mjc5ZCBkcml2
ZXIiKTsKIE1PRFVMRV9MSUNFTlNFKCJHUEwgdjIiKTsKLS0gCjIuMTcuMQoK
--000000000000f7175b0592a8f3dd
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--000000000000f7175b0592a8f3dd--
