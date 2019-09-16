Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA78B481A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 09:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF0C6EB09;
	Tue, 17 Sep 2019 07:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4006E1F8
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 10:19:17 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id x10so1661409pgi.5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 03:19:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ezDCZO8ng8d/sb9STteD2Jhgrgq/wMpWdo/Vgdu2ZgY=;
 b=aJyGVhZX1D2VYEL6x8yxVlKyo6GkKzvwZHmBq14wqt2ZzUkSl9AQYL5oJwkmzyX858
 QuSNmTl2Rwv+SmgmfZ/aD1HIIKYLGkAeWyR8TJfgXB/2xMqoZZJQdD020hCAw5no+xPA
 5DX3A93Yh5NhI301JPSGgvG06iKo+4ZvptReIzZmxRWEjCWq5PgLfcqufJH7a3BzFnGv
 k5F6/jGFlOQK01QzpTRWarrD4Ggjw8Lq95YzH3iBOcJLHdqZzjFMx/cRkbQ8y9cOKGCD
 jsSCoJQpSchmX7sGwOMbXU7b9E7A3YM7uJ70BwoQYG0Y3e7tDgoxmGvhLNT2nyuWn30P
 SzBg==
X-Gm-Message-State: APjAAAXHh8SE1IAOykvYo/XbYGsY6WH+f4WdEyS2QqQ42OSybXTOY4S9
 yMtMp2aAs+HeCAd45ScnRowPfVC/IDO/Hd5doQy3Vg==
X-Google-Smtp-Source: APXvYqw7xfqeFpfEiEFaWHlRdd5I6jeo8onGIRkBBKQLHuP9EzoMVsTSyZZiGyBE0wjdhOxdJQrYdVMmQaELKG7N2sg=
X-Received: by 2002:a65:66c4:: with SMTP id c4mr16283195pgw.246.1568629156646; 
 Mon, 16 Sep 2019 03:19:16 -0700 (PDT)
MIME-Version: 1.0
From: Jerry Han <jerry.han.hq@gmail.com>
Date: Mon, 16 Sep 2019 18:19:05 +0800
Message-ID: <CA+quO7KFcEhmN=rWRjTc8D+Zy_7yMkS9J58ytazuoG2fNZ5sQQ@mail.gmail.com>
Subject: [PATCH 5/9] [v10, 5/9] drm/panel:Add Boe Himax8279d MIPI-DSI LCD panel
To: ML dri-devel <dri-devel@lists.freedesktop.org>, 
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Jitao Shi <jitao.shi@mediatek.com>, 
 Derek Basehore <dbasehore@chromium.org>, Rock wang <rock_wang@himax.com.cn>, 
 Emil Velikov <emil.l.velikov@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="000000000000aabbad0592a8efe6"
X-Mailman-Approved-At: Tue, 17 Sep 2019 07:17:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ezDCZO8ng8d/sb9STteD2Jhgrgq/wMpWdo/Vgdu2ZgY=;
 b=CgtPK0VfzNyPvHYskDkG5cNhNNepnMDsKkTewdWEuWc1fKA8iuU1wRZleEFfEExc3U
 ba2lgSWAHlQxyOmJaL+VNz91vAufvClS8g9Hm05aCqerYB5GVbUWVjYnRXn6igd/kLWj
 gtYlQy1BJRXYGiD8ReZpTHCpmMntzuyhN+Rrmypt/ggFrnyttoX/rUX5NxRUI0y6a6un
 3rhJdc8S+I3EnsemRY6mK4rIT2Id+asZRp2UZAB7VD1WllRLvy7kicWF5LSnyH8vhlU8
 AARlJb6QnRttSdIHvJZ+Ci3P5YjwshNDZr9gfkX9VJgR7dPHsUOdCJngEgoiib1f5804
 dYWQ==
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

--000000000000aabbad0592a8efe6
Content-Type: text/plain; charset="UTF-8"



--000000000000aabbad0592a8efe6
Content-Type: application/octet-stream; 
	name="0005-v10-5-9-drm-panel-Add-Boe-Himax8279d-MIPI-DSI-LCD-pa.patch"
Content-Disposition: attachment; 
	filename="0005-v10-5-9-drm-panel-Add-Boe-Himax8279d-MIPI-DSI-LCD-pa.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k0m9afzo0>
X-Attachment-Id: f_k0m9afzo0

RnJvbSA1NjFjZDFjN2I5MDA4NzNmYzU4OTE4N2MwNWYyYTMyOTc5OTEwNTczIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKZXJyeSBIYW4gPGplcnJ5Lmhhbi5ocUBnbWFpbC5jb20+CkRh
dGU6IE1vbiwgMTYgU2VwIDIwMTkgMTc6MDQ6MDEgKzA4MDAKU3ViamVjdDogW1BBVENIIDUvOV0g
W3YxMCw1LzldIGRybS9wYW5lbDogQWRkIEJvZSBIaW1heDgyNzlkIE1JUEktRFNJIExDRAogcGFu
ZWwKClN1cHBvcnQgQm9lIEhpbWF4ODI3OWQgOC4wIiAxMjAweDE5MjAgVEZUIExDRCBwYW5lbCwg
aXQgaXMgYSBNSVBJIERTSQpwYW5lbC4KClY1OgotIEFkZCB0aGUgaW5mb3JtYXRpb24gb2YgdGhl
IHJldmlld2VyIChTYW0pCi0gRGVsZXRlIHVubmVjZXNzYXJ5IGhlYWRlciBmaWxlcyAjaW5jbHVk
ZSA8bGludXgvZmIuaD4gKFNhbSkKLSBUaGUgY29uZmlnIERSTV9QQU5FTF9CT0VfSElNQVg4Mjc5
RCBhcHBlYXJzIHR3aWNlLiBEcm9wIG9uZSBvZiB0aGVtIChTYW0pCi0gQUREIHN0YXRpYywgc2V0
X2dwaW9zIGZ1bmN0aW9uIGlzIG5vdCB1c2VkIG91dHNpZGUgdGhpcyBtb2R1bGUgKFNhbSkKClY0
OgotIEZyZWZpeCBhbGwgZnVuY3Rpb24gbWFlcyB3aXRoIGJvZV8gKFNhbSkKLSBGc2VkICJlbmFi
bGVfZ3BpbyIgcmVwbGFjZSAicmVzZXRfZ3BpbyIsIE1ha2UgaXQgbG9vayBjbGVhcmVyIChTYW0p
Ci0gU29ydCBpbmNsdWRlIGxpbmVzIGFscGhhYmV0aWNhbGx5IChTYW0pCi0gRml4ZWQgZW50cmll
cyBpbiB0aGUgbWFrZWZpbGUgbXVzdCBiZSBzb3J0ZWQgYWxwaGFiZXRpY2FsbHkgKFNhbSkKLSBB
ZGQgc2VuZF9taXBpX2NtZHMgZnVuY3Rpb24gdG8gYXZvaWQgZHVwbGljYXRpbmcgdGhlIGNvZGUg
KFNhbSkKLSBBZGQgdGhlIG5lY2Vzc2FyeSBkZWxheShyZXNldF9kZWxheV90NSkgYmV0d2VlbiBy
ZXNldCBhbmQgc2VuZGluZwogICAgdGhlIGluaXRpYWxpemF0aW9uIGNvbW1hbmQgKFJvY2sgd2Fu
ZykKClYzOgotIFJlbW92ZSB1bm5lY2Vzc2FyeSBkZWxheXMgaW4gc2VuZGluZyBpbml0aWFsaXph
dGlvbiBjb21tYW5kcyAoSml0YW8gU2hpKQoKVjI6Ci0gVXNlIFNQRFggaWRlbnRpZmllciAoU2Ft
KQotIFVzZSBuZWNlc3NhcnkgaGVhZGVyIGZpbGVzIHJlcGxhY2UgZHJtUC5oIChTYW0pCi0gRGVs
ZXRlIHVubmVjZXNzYXJ5IGhlYWRlciBmaWxlcyAjaW5jbHVkZSA8bGludXgvZXJyLmg+IChTYW0p
Ci0gU3BlY2lmaWVzIGEgR1BJT3MgYXJyYXkgdG8gY29udHJvbCB0aGUgcmVzZXQgdGltaW5nLAog
ICAgaW5zdGVhZCBvZiByZWFkaW5nICJkc2ktcmVzZXQtc2VxdWVuY2UiIGRhdGEgZnJvbSBEVFMg
KFNhbSkKLSBEZWxldGUgYmFja2xpZ2h0X2Rpc2FibGUoKSBmdW5jdGlvbiB3aGVuIGFscmVhZHkg
ZGlzYWJsZWQgKFNhbSkKLSBVc2UgZGV2bV9vZl9maW5kX2JhY2tsaWdodCgpIHJlcGxhY2Ugb2Zf
ZmluZF9iYWNrbGlnaHRfYnlfbm9kZSgpIChTYW0pCi0gTW92ZSB0aGUgbmVjZXNzYXJ5IGRhdGEg
aW4gdGhlIERUUyB0byB0aGUgY3VycmVudCBmaWxlLAogICAgbGlrZSBwb3JjaCwgZGlzcGxheV9t
b2RlIGFuZCBJbml0IGNvZGUgZXRjLiAoU2FtKQotIEFkZCBjb21wYXRpYmxlIGRldmljZSAiYm9l
LGhpbWF4ODI3OWQxMHAiIChTYW0pCgpWMToKLSBTdXBwb3J0IEJvZSBIaW1heDgyNzlkIDguMCIg
MTIwMHgxOTIwIFRGVCBMQ0QgcGFuZWwsIGl0IGlzIGEgTUlQSSBEU0kKICAgIHBhbmVsLgoKU2ln
bmVkLW9mZi1ieTogSmVycnkgSGFuIDxoYW54dTVAaHVhcWluLmNvcnAtcGFydG5lci5nb29nbGUu
Y29tPgpSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzogSml0
YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPgpDYzogRGVyZWsgQmFzZWhvcmUgPGRiYXNl
aG9yZUBjaHJvbWl1bS5vcmc+CkNjOiBSb2NrIHdhbmcgPHJvY2tfd2FuZ0BoaW1heC5jb20uY24+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWJvZS1oaW1heDgyNzlkLmMgfCAzICst
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1ib2UtaGltYXg4Mjc5ZC5jIGIvZHJp
dmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWJvZS1oaW1heDgyNzlkLmMKaW5kZXggYWE3ZDkxMjc5
ODE5Li5jMDUwYTQ4NDg3YTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5l
bC1ib2UtaGltYXg4Mjc5ZC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1ib2Ut
aGltYXg4Mjc5ZC5jCkBAIC04LDcgKzgsNiBAQAogCiAjaW5jbHVkZSA8bGludXgvYmFja2xpZ2h0
Lmg+CiAjaW5jbHVkZSA8bGludXgvZGVsYXkuaD4KLSNpbmNsdWRlIDxsaW51eC9mYi5oPgogI2lu
Y2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgogI2luY2x1
ZGUgPGxpbnV4L29mLmg+CkBAIC03Miw3ICs3MSw3IEBAIHN0YXRpYyBpbmxpbmUgc3RydWN0IHBh
bmVsX2luZm8gKnRvX3BhbmVsX2luZm8oc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpCiAJcmV0dXJu
IGNvbnRhaW5lcl9vZihwYW5lbCwgc3RydWN0IHBhbmVsX2luZm8sIGJhc2UpOwogfQogCi12b2lk
IHNldF9ncGlvcyhzdHJ1Y3QgcGFuZWxfaW5mbyAqcGluZm8sIGludCBlbmFibGUpCitzdGF0aWMg
dm9pZCBzZXRfZ3Bpb3Moc3RydWN0IHBhbmVsX2luZm8gKnBpbmZvLCBpbnQgZW5hYmxlKQogewog
CWdwaW9kX3NldF92YWx1ZShwaW5mby0+ZW5hYmxlX2dwaW8sIGVuYWJsZSk7CiAJZ3Bpb2Rfc2V0
X3ZhbHVlKHBpbmZvLT5wcDMzX2dwaW8sIGVuYWJsZSk7Ci0tIAoyLjE3LjEKCg==
--000000000000aabbad0592a8efe6
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--000000000000aabbad0592a8efe6--
