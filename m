Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8134271FAE
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 20:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 092726E398;
	Tue, 23 Jul 2019 18:55:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5CF36E398;
 Tue, 23 Jul 2019 18:55:24 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id 31so44331332wrm.1;
 Tue, 23 Jul 2019 11:55:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uofN7ppO5lpu2W/w0X7jwZptyjk30DWo2WCuwRs1qEQ=;
 b=gnQUnc/czvwmaXgdSSNu3hf0GcShDvZuWbmGtyk7aRZvxdzDk+kz1EB2uXyXKwMuqp
 vWZbmPtDp6Uc0YalIHhbIJUYslrxGQgwkBTGqwSfmsJTgOHjT/sCcFvdeYniai6/eXAF
 RTJI0mcTuLp9rBsdbSxxdotfxgZhYFgJGc93j8K2+doBVGehnD4OZwjOofzpCqtGZS89
 Rb+Nlcaf6fIM0OBzgsm5RXJ/2sRr+epzeqTOljgbJ8hbgdavtU7Lep//zKHt0YRlskdc
 8yJcKVcdywI1JAM2TGlkT7ivgDhtuU/i7ab04vvKst2CVOF5cvK21D0DUqyMZjt7lrIn
 Mirg==
X-Gm-Message-State: APjAAAWu1lPIDHBOA+G4fjv9vE7dY4/KvXlJB5ZcklI6o8uX+lpnu43h
 3DLcoUZNv04N4sQ9S4iP+lgMaQXRtZlbY174aDU=
X-Google-Smtp-Source: APXvYqytEF/30ZRLvCDiDRUiLAC7Ki41TP937AiiImWIfRwtcmAZO1g6dOGFW8ThB6MwY+NEc5NDfzimhsYBX1OD/c4=
X-Received: by 2002:adf:dfc5:: with SMTP id q5mr26863661wrn.142.1563908123361; 
 Tue, 23 Jul 2019 11:55:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190723142312.4013-1-colin.king@canonical.com>
In-Reply-To: <20190723142312.4013-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 23 Jul 2019 14:55:12 -0400
Message-ID: <CADnq5_Ni9T-jkLrv-s-v1VD8J=VQmyz6S43Na52=1sjdB-uJZA@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/display: fix a missing null check on a
 failed kzalloc
To: Colin King <colin.king@canonical.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=uofN7ppO5lpu2W/w0X7jwZptyjk30DWo2WCuwRs1qEQ=;
 b=LJDz0No9XLAJGTv1sXKvOFaNgPg9sv6MM5Lo1bYMmmvVOaeaLUl96lQ0blrnDkMBK2
 RhByqPJg+ftBThBEDHmQjMQEzCTSVi/YfZxMiYa9JIakqR2YKWPdrrDW6xuiLX/PETf7
 L/1W7JNelejLi3Q63bJ6h4Dl9GZ93Inv9owOuquzk0WWxDNlzwhkWcEx69ablsLn3k5J
 2BdHIdqSZsAQvKJK0YWPxoBAs7V7XQdbvNFJI3+HbloI4oM44R6LoCznZVDwxjsNkqEl
 2HPWMDLWGjg0VrC2cAfFmt2W2YNFeWjo/m1CAJ/0LcQHxJAxg8t9UTEpsoBHpLtnm/IH
 bg0A==
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
Cc: Leo Li <sunpeng.li@amd.com>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMTA6MjMgQU0gQ29saW4gS2luZyA8Y29saW4ua2luZ0Bj
YW5vbmljYWwuY29tPiB3cm90ZToKPgo+IEZyb206IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5n
QGNhbm9uaWNhbC5jb20+Cj4KPiBDdXJyZW50bHkgdGhlIGFsbG9jYXRpb24gb2YgY29uZmlnIG1h
eSBmYWlsIGFuZCBhIG51bGwgcG9pbnRlcgo+IGRlcmVmZXJlbmNlIG9uIGNvbmZpZyBjYW4gb2Nj
dXIuICBGaXggdGhpcyBieSBhZGRlZCBhIG51bGwKPiBjaGVjayBvbiBhIGZhaWxlZCBhbGxvY2F0
aW9uIG9mIGNvbmZpZy4KPgo+IEFkZHJlc3Nlcy1Db3Zlcml0eTogKCJEZXJlZmVyZW5jZSBudWxs
IHJldHVybiIpCj4gRml4ZXM6IGMyY2Q5ZDA0ZWNmMCAoImRybS9hbWQvZGlzcGxheTogSG9vayB1
cCBjYWxscyB0byBkbyBzdGVyZW8gbXV4IGFuZCBkaWcgcHJvZ3JhbW1pbmcgdG8gc3RlcmVvIGNv
bnRyb2wgaW50ZXJmYWNlIikKPiBTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4u
a2luZ0BjYW5vbmljYWwuY29tPgoKQXBwbGllZC4gIHRoYW5rcyEKCkFsZXgKCj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgfCAyICsrCj4gIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2NvcmUvZGMuYwo+IGluZGV4IDE2OGY0YTdkZmZkZi4uN2NjZTJiYWVjMmFmIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jCj4gQEAgLTEyNTksNiArMTI1OSw4
IEBAIGJvb2wgZGNfc2V0X2dlbmVyaWNfZ3Bpb19mb3Jfc3RlcmVvKGJvb2wgZW5hYmxlLAo+ICAg
ICAgICAgc3RydWN0IGdwaW9fZ2VuZXJpY19tdXhfY29uZmlnICpjb25maWcgPSBremFsbG9jKHNp
emVvZihzdHJ1Y3QgZ3Bpb19nZW5lcmljX211eF9jb25maWcpLAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIEdGUF9LRVJORUwpOwo+Cj4gKyAgICAgICBpZiAoIWNvbmZpZykKPiArICAgICAg
ICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ICAgICAgICAgcGluX2luZm8gPSBkYWxfZ3Bpb19nZXRf
Z2VuZXJpY19waW5faW5mbyhncGlvX3NlcnZpY2UsIEdQSU9fSURfR0VORVJJQywgMCk7Cj4KPiAg
ICAgICAgIGlmIChwaW5faW5mby5tYXNrID09IDB4RkZGRkZGRkYgfHwgcGluX2luZm8ub2Zmc2V0
ID09IDB4RkZGRkZGRkYpIHsKPiAtLQo+IDIuMjAuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
