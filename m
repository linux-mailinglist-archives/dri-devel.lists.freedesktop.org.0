Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7671A1C21
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 08:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 751686E95B;
	Wed,  8 Apr 2020 06:59:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F3B6E059
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 20:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1586292160; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q+FvC4XrLYIWwIznQtEtJGiSIyNwCJPa2O+6Y13/D1Y=;
 b=XybXO52Bb73UeY0k0PUQZJ/7CBWIlD7SV5NlZYvlki77j/NDjXjVwlh+VITccU6RFW0lnf
 8MDVY0ltU8aUJmuFboD6n2wHHxS6IMvzWX2HqtdXhbV+K8q8TWErm+272Snz3zkr7O9S9d
 XnL1eM1/weVj7em5PTi9oZEWBC2htKY=
Date: Tue, 07 Apr 2020 22:42:29 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] gpu/drm: ingenic: Delete an error message in
 ingenic_drm_probe()
To: Markus Elfring <Markus.Elfring@web.de>
Message-Id: <TUQF8Q.MM4L7PYRPUYD@crapouillou.net>
In-Reply-To: <e03e7106-0f22-99c4-ad21-b288e8990b5a@web.de>
References: <e03e7106-0f22-99c4-ad21-b288e8990b5a@web.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 08 Apr 2020 06:59:23 +0000
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
Cc: Tang Bin <tangbin@cmss.chinamobile.com>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWFya3VzLAoKTGUgZGltLiA1IGF2cmlsIDIwMjAgw6AgMTE6MzAsIE1hcmt1cyBFbGZyaW5n
IDxNYXJrdXMuRWxmcmluZ0B3ZWIuZGU+IGEgCsOpY3JpdCA6Cj4gRnJvbTogTWFya3VzIEVsZnJp
bmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0Pgo+IERhdGU6IFN1biwgNSBBcHIgMjAy
MCAxMToyNTozMCArMDIwMAo+IAo+IFRoZSBmdW5jdGlvbiDigJxwbGF0Zm9ybV9nZXRfaXJx4oCd
IGNhbiBsb2cgYW4gZXJyb3IgYWxyZWFkeS4KPiBUaHVzIG9taXQgYSByZWR1bmRhbnQgbWVzc2Fn
ZSBmb3IgdGhlIGV4Y2VwdGlvbiBoYW5kbGluZyBpbiB0aGUKPiBjYWxsaW5nIGZ1bmN0aW9uLgo+
IAo+IFRoaXMgaXNzdWUgd2FzIGRldGVjdGVkIGJ5IHVzaW5nIHRoZSBDb2NjaW5lbGxlIHNvZnR3
YXJlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hcmt1cyBFbGZyaW5nIDxlbGZyaW5nQHVzZXJzLnNv
dXJjZWZvcmdlLm5ldD4KCkFwcGxpZWQgdG8gZHJtLW1pc2MtbmV4dCwgdGhhbmtzLgoKLVBhdWwK
Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pbmdlbmljL2luZ2VuaWMtZHJtLmMgfCA0ICstLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS5jIAo+IGIvZHJp
dmVycy9ncHUvZHJtL2luZ2VuaWMvaW5nZW5pYy1kcm0uYwo+IGluZGV4IDlkZmU3Y2I1MzBlMS4u
MDZjYTc1MmI3NmVlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pbmdlbmljL2luZ2Vu
aWMtZHJtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS5jCj4g
QEAgLTY2MSwxMCArNjYxLDggQEAgc3RhdGljIGludCBpbmdlbmljX2RybV9wcm9iZShzdHJ1Y3Qg
Cj4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJfQo+IAo+ICAJaXJxID0gcGxhdGZvcm1fZ2V0
X2lycShwZGV2LCAwKTsKPiAtCWlmIChpcnEgPCAwKSB7Cj4gLQkJZGV2X2VycihkZXYsICJGYWls
ZWQgdG8gZ2V0IHBsYXRmb3JtIGlycSIpOwo+ICsJaWYgKGlycSA8IDApCj4gIAkJcmV0dXJuIGly
cTsKPiAtCX0KPiAKPiAgCWlmIChzb2NfaW5mby0+bmVlZHNfZGV2X2Nsaykgewo+ICAJCXByaXYt
PmxjZF9jbGsgPSBkZXZtX2Nsa19nZXQoZGV2LCAibGNkIik7Cj4gLS0KPiAyLjI2LjAKPiAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
