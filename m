Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 903CC177109
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:24:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1021A6E9F4;
	Tue,  3 Mar 2020 08:24:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dodo.xh.is (dodo.xh.is
 [IPv6:2001:19f0:8001:184d:5400:2ff:fe7b:e8bd])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA056E183
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 23:36:44 +0000 (UTC)
Received: by dodo.xh.is (OpenSMTPD) with ESMTPSA id 6f977d6c
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Mon, 2 Mar 2020 15:36:43 -0800 (PST)
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender:
 icenowy@aosc.io)
 by hermes.aosc.io (Postfix) with ESMTPSA id E0E954B45F;
 Mon,  2 Mar 2020 23:36:40 +0000 (UTC)
Date: Tue, 03 Mar 2020 07:36:35 +0800
In-Reply-To: <20200302203452.17977-4-ville.syrjala@linux.intel.com>
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-4-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 03/33] drm/panel-feixin-k101-im2ba02: Fix dotclock
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
From: Icenowy Zheng <icenowy@aosc.io>
Message-ID: <43A69486-0A19-41CF-B7DD-56489D8E6DB6@aosc.io>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aosc.io; s=dkim;
 t=1583192201;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references;
 bh=veyIo/ROybFs2h9sMXeq6vmv4W2LGJQ95jfTokE9yoM=;
 b=t86wSjaRnV1JDM8s0N3tAkcJW0Fp/jUXj4KgD9T0o9Q6rUZ6txTm0C91GdAe8ZHUDH0Nr0
 A/t6dA3nk347N7qih6EngqeG+Vgpa9pPz3LOp6e6j7AU+ZfGrCbLrno5GE5ei+3CIeq4kd
 xrBMceRimJ9nM1Q8JLK1srCtw3hpAl0=
X-Mailman-Approved-At: Tue, 03 Mar 2020 08:24:06 +0000
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
Cc: Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgrkuo4gMjAyMOW5tDPmnIgz5pelIEdNVCswODowMCDkuIrljYg0OjM0OjIyLCBWaWxsZSBTeXJq
YWxhIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4g5YaZ5YiwOgo+RnJvbTogVmlsbGUg
U3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPgo+VGhlIGN1cnJlbnRs
eSBsaXN0ZWQgZG90Y2xvY2sgZGlzYWdyZWVzIHdpdGggdGhlIGN1cnJlbnRseQo+bGlzdGVkIHZy
ZWZyZXNoIHJhdGUuIENoYW5nZSB0aGUgZG90Y2xvY2sgdG8gbWF0Y2ggdGhlIHZyZWZyZXNoLgo+
Cj5Tb21lb25lIHRlbGwgbWUgd2hpY2ggKGlmIGVpdGhlcikgb2YgdGhlIGRvdGNsb2NrIG9yIHZy
ZXJlc2ggaXMKPmNvcnJlY3Q/Cgpkb3RjbG9jayBpcyBjb3JyZWN0IGFuZCB2cmVmcmVzaCBpcyBv
bmx5IGEgcGxhY2Vob2xkZXIgdmFsdWUuCgo+Cj5DYzogSWNlbm93eSBaaGVuZyA8aWNlbm93eUBh
b3NjLmlvPgo+Q2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPlNpZ25lZC1vZmYt
Ynk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4tLS0K
PiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtZmVpeGluLWsxMDEtaW0yYmEwMi5jIHwgMiAr
LQo+IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj5kaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWZlaXhpbi1rMTAxLWltMmJhMDIu
Ywo+Yi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtZmVpeGluLWsxMDEtaW0yYmEwMi5jCj5p
bmRleCBmZGRiZmRkZjY1NjYuLjhkZWJlZTg1ZjRlYyAxMDA2NDQKPi0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9wYW5lbC9wYW5lbC1mZWl4aW4tazEwMS1pbTJiYTAyLmMKPisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9wYW5lbC9wYW5lbC1mZWl4aW4tazEwMS1pbTJiYTAyLmMKPkBAIC0zOTEsNyArMzkxLDcg
QEAgc3RhdGljIGludCBrMTAxX2ltMmJhMDJfdW5wcmVwYXJlKHN0cnVjdCBkcm1fcGFuZWwKPipw
YW5lbCkKPiB9Cj4gCj4gc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIGsxMDFf
aW0yYmEwMl9kZWZhdWx0X21vZGUgPSB7Cj4tCS5jbG9jayA9IDcwMDAwLAo+KwkuY2xvY2sgPSA2
NzI4NiwKPiAJLnZyZWZyZXNoID0gNjAsCj4gCj4gCS5oZGlzcGxheSA9IDgwMCwKCi0tIArkvb/n
lKggSy05IE1haWwg5Y+R6YCB6Ieq5oiR55qEQW5kcm9pZOiuvuWkh+OAggpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
