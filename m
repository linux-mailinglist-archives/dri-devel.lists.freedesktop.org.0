Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D3CDEFAC
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 16:34:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 814F06E0A0;
	Mon, 21 Oct 2019 14:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A9A46E0A0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 14:34:43 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r1so4477414wrs.9
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 07:34:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xI6DDM9+eBFT37uLDZ8HbO12EoHTpX0SP6BkaoQ8n2o=;
 b=EmuEALZFgczofNdW/f7YQavCEBXp79l8V1yo1FL/S7PcutrHPJ4bcW9dAwHBYY07TJ
 ihQO3InJgWy8nnzInZTcOfBa+CbZUv7bqekPjzPp+CVbFkIsJHhXA83famiQvoCBGIDW
 TmCTteNyTMSRvJeibjqFtJFpjjncnBgdXWkMIcOd+uB9JKTN1iGu8Zkd2bCXubirnxec
 a5ZzQ/+dMaAJPPaeSq+03rfQGfNTuaYb678ymQzj8T16lVRqd2Swnynkw/ewbUdo0MG4
 qXlSRlVTztICbn6lrTm1tnbHbpbeyneku5NJTgs6n1EpG0jS9Ap38uSfWLcqiXQdfGR1
 A+5Q==
X-Gm-Message-State: APjAAAX8gZXX30E59cG2Jb7VkMELBpEPwMw81FMAQwRIhelcChaIB0tC
 607M66haHU/VvY3Gyu1sB70KkZmY
X-Google-Smtp-Source: APXvYqyUTlMxdnu93mctV8HSTKTC/nInGnbDIc67kg5t0u9P/b0KOWu2sp/MG9nevNU1U8fyJGH8Ag==
X-Received: by 2002:adf:e542:: with SMTP id z2mr18958238wrm.338.1571668481205; 
 Mon, 21 Oct 2019 07:34:41 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id s12sm15950815wra.82.2019.10.21.07.34.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 07:34:38 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 00/13] drm/dp: Move drm_dp_link helpers to Tegra DRM
Date: Mon, 21 Oct 2019 16:34:24 +0200
Message-Id: <20191021143437.1477719-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xI6DDM9+eBFT37uLDZ8HbO12EoHTpX0SP6BkaoQ8n2o=;
 b=taAF/6gS1/Sovqne5TSmeaP1TjBacc4eJRJQimciHhPr9ChJqhQFNdAKbB8RUgVG2g
 oko1TZ/gsCg+YoQDj+sdaSdadtMQmkiuWAuTX3ybZfiSaHd5vCsetUDmaBC4Gq2+B70s
 Kf6tmfkkYkRcgGHl/BIV6sRqF227xX+btS99YsC5gQ7pzMGaVOP95bRs+8qSVBu74hs0
 GHBz9DDPZBw/XA/HPde/IpMBS5knUfrD0aQ06NCRvqshDnY0M5hUQOxgblCFvbLda4qg
 uy4fLmcG65jCW/cFb9RmvHwuljK8NgouDyxTAFtquAZgC5XYD4Gqt4jKPNLNLWGjB1Oy
 dtZQ==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkhpLAoKRm9sbG93aW5n
IHVwIG9uIHRoZSBkaXNjdXNzaW9uIGFib3V0IHRoZSB1c2VmdWxuZXNzIG9mIHRoZSBkcm1fZHBf
bGluawpoZWxwZXJzLCBoZXJlJ3MgYSBuZXcgc2VyaWVzIHRoYXQgYWRkcyBhIGNvdXBsZSBvZiBu
ZXcgRFBDRCBwYXJzZXIKZnVuY3Rpb25zIGFuZCB0aGVuIHB1c2hlcyB0aGUgZHJtX2RwX2xpbmsg
aGVscGVycyBkb3duIGludG8gZHJpdmVycy4KRm9yIG1vc3QgZHJpdmVycyB0aGlzIHdhcyBwcmV0
dHkgZWFzeSB0byBkbyBzaW5jZSB0aGV5IGRpZG4ndCBoZWF2aWx5CnJlbHkgb24gdGhlIHN0cnVj
dCBkcm1fZHBfbGluay4gSSBkZWNpZGVkIHRvIG1vdmUgdGhlIGRybV9kcF9saW5rCmhlbHBlcnMg
dG8gdGhlIFRlZ3JhIGRyaXZlciBiZWNhdXNlIHRoZXkgYXJlIG1vcmUgaGVhdmlseSB1c2VkIHRo
ZXJlCmFuZCBJIGhhdmUgYSBzdWJzZXF1ZW50IHNlcmllcyB0aGF0IGFkZHMgc3VwcG9ydCBmb3Ig
RGlzcGxheVBvcnQgb24KdmFyaW91cyBUZWdyYSBib2FyZHMgYmFzZWQgb24gdGhvc2UgaGVscGVy
cy4KClRoZSBwbGFuIGlzIHRvIG1lcmdlIHRoaXMgc2VyaWVzIGludG8gZHJtLW1pc2Mgb25jZSBy
ZXZpZXdlZCBzbyB0aGF0IEkKY2FuIHJlYmFzZSBteSBUZWdyYSBEUCBzdXBwb3J0IHBhdGNoZXMg
b24gdGhhdCwgaG9wZWZ1bGx5IGluIHRpbWUgZm9yCnY1LjUuCgpJIGRvbid0IGhhdmUgYWNjZXNz
IHRvIHRoZSBicmlkZ2VzLCBSb2NrY2hpcCBvciBNU00gaGFyZHdhcmUsIHNvIHRob3NlCmRyaXZl
cnMgYXJlIG9ubHkgYnVpbGQtdGVzdGVkLiBTaW5jZSB0aGlzIHNlcmllcyByZWFsbHkgb25seSBy
ZXBsYWNlcwp2YXJpYWJsZXMsIEkgZG9uJ3QgdGhpbmsgdGhlcmUncyBhIGhpZ2ggcmlzayBvZiBi
cmVha2luZyBhbnl0aGluZy4KCkNoYW5nZXMgaW4gdjM6Ci0gZHJvcCBkcm1fZHBfYXV4X3JkX2lu
dGVydmFsKCkgaGVscGVyIHBhdGNoOyB0aGlzIHR1cm5lZCBvdXQgdG8gYmUKICBpbmNvbXBsZXRl
IGFuZCBmaXhpbmcgaXQgbWFkZSBpdCB1c2VsZXNzIG92ZXIgZXhpc3RpbmcgaGVscGVycwotIGFk
ZCBSZXZpZXdlZC1ieSBmcm9tIEx5dWRlCi0gYWRkcmVzcyByZXZpZXcgY29tbWVudHMKClRoaWVy
cnkKClRoaWVycnkgUmVkaW5nICgxMyk6CiAgZHJtL2RwOiBTb3J0IGluY2x1ZGVzIGFscGhhYmV0
aWNhbGx5CiAgZHJtL2RwOiBSZW1vdmUgYSBncmF0dWl0dW91cyBibGFuayBsaW5lCiAgZHJtL2Rw
OiBBZGQgZHJtX2RwX2Zhc3RfdHJhaW5pbmdfY2FwKCkgaGVscGVyCiAgZHJtL2RwOiBBZGQgZHJt
X2RwX2NoYW5uZWxfY29kaW5nX3N1cHBvcnRlZCgpIGhlbHBlcgogIGRybS9kcDogQWRkIGRybV9k
cF9hbHRlcm5hdGVfc2NyYW1ibGVyX3Jlc2V0X2NhcCgpIGhlbHBlcgogIGRybS9kcDogRG8gbm90
IGJ1c3ktbG9vcCBkdXJpbmcgbGluayB0cmFpbmluZwogIGRybS9kcDogQWRkIGhlbHBlciB0byBn
ZXQgcG9zdC1jdXJzb3IgYWRqdXN0bWVudHMKICBkcm0vYnJpZGdlOiBhbmFsb2dpeC1hbng3OHh4
OiBBdm9pZCBkcm1fZHBfbGluayBoZWxwZXJzCiAgZHJtL2JyaWRnZTogdGMzNTg3Njc6IEF2b2lk
IGRybV9kcF9saW5rIGhlbHBlcnMKICBkcm0vYnJpZGdlOiB0YzM1ODc2NzogVXNlIERQIG5vbWVu
Y2xhdHVyZQogIGRybS9tc206IGVkcDogQXZvaWQgZHJtX2RwX2xpbmsgaGVscGVycwogIGRybS9y
b2NrY2hpcDogQXZvaWQgZHJtX2RwX2xpbmsgaGVscGVycwogIGRybS90ZWdyYTogTW92ZSBkcm1f
ZHBfbGluayBoZWxwZXJzIHRvIFRlZ3JhIERSTQoKIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5h
bG9naXgtYW54Nzh4eC5jIHwgIDU3ICsrKysrKy0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3Rj
MzU4NzY3LmMgICAgICAgICB8ICA2NSArKysrKystLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBf
aGVscGVyLmMgICAgICAgICAgIHwgMTY5ICsrKystLS0tLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMv
Z3B1L2RybS9tc20vZWRwL2VkcF9jdHJsLmMgICAgICAgIHwgIDcwICsrKysrKy0tLQogZHJpdmVy
cy9ncHUvZHJtL3JvY2tjaGlwL2Nkbi1kcC1jb3JlLmMgICAgfCAgMTIgKy0KIGRyaXZlcnMvZ3B1
L2RybS9yb2NrY2hpcC9jZG4tZHAtY29yZS5oICAgIHwgICAzICstCiBkcml2ZXJzL2dwdS9kcm0v
cm9ja2NoaXAvY2RuLWRwLXJlZy5jICAgICB8ICAxOSArKy0KIGRyaXZlcnMvZ3B1L2RybS90ZWdy
YS9NYWtlZmlsZSAgICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcC5j
ICAgICAgICAgICAgICAgIHwgMTMzICsrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0v
dGVncmEvZHAuaCAgICAgICAgICAgICAgICB8ICAyNiArKysrCiBkcml2ZXJzL2dwdS9kcm0vdGVn
cmEvZHBhdXguYyAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvc29y
LmMgICAgICAgICAgICAgICB8ICAgMSArCiBpbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmggICAg
ICAgICAgICAgICB8ICA1MSArKysrLS0tCiAxMyBmaWxlcyBjaGFuZ2VkLCAzNzMgaW5zZXJ0aW9u
cygrKSwgMjM1IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2Ry
bS90ZWdyYS9kcC5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2Rw
LmgKCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
