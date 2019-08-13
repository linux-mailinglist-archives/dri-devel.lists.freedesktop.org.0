Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8818BAEF
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 15:58:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D166E150;
	Tue, 13 Aug 2019 13:58:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C776E150;
 Tue, 13 Aug 2019 13:58:45 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id g17so107849787wrr.5;
 Tue, 13 Aug 2019 06:58:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zfy6948lUCOH92chkbvQy5u5Vo5igoZFuLdDnErvh/A=;
 b=HssGOiws/4cDn7B/TPit6IQ7zeEwaYua4DLatHnf5jS9miFishkLyT2BPfDkIeEvzu
 +h49SESh/b06PFJO3nUYw665oghSBYdWnsqxo71QuLlt4u+vHRPSaljhff3lbK5GWoBC
 x5RCf5wYxchNniDECz8FlyOW2fQHkH8fev2M3Xpt1vnQ8gErihkudK5ITJsJ4lpFYBDy
 bU7VFXaO9SCyZ1sO/2CV0Ak7jLKLZyASH8Hnqo8ixN+Sb9yUKUU+4JUT39RpAsk/pnFB
 P/4d42dQrPa+EdvpF/vKsQ5jkXGmQWIpQKCLaWPppxl4pxi8nH9IAcw7f9ViAzoEtV8t
 g5jQ==
X-Gm-Message-State: APjAAAUjPrOwOmf+PRQ0tobpG382Mv5+WxK3G/QT8P5AHKkEuKB+gGwR
 PWrqOF8Wd5UEQpoHnf0n8MUEL4j5bLGrwtSUeenM2A==
X-Google-Smtp-Source: APXvYqxxFFU/uYf0Bs2fkypX/f2q7giWV1wCz2O0fpuwjUUfiCJon9Ab+ZGb6Su5aKytZMAno3nfTqkgLxpw3afkFuc=
X-Received: by 2002:adf:f94a:: with SMTP id q10mr43676562wrr.341.1565704723878; 
 Tue, 13 Aug 2019 06:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190813103340.11051-1-colin.king@canonical.com>
In-Reply-To: <20190813103340.11051-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 13 Aug 2019 09:58:31 -0400
Message-ID: <CADnq5_MihuON5NRn7gbjbD9br37=vL+ZtjNqqFE2XQGrA_P7Zw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/powerplay: fix spelling mistake "unsuported"
 -> "unsupported"
To: Colin King <colin.king@canonical.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=zfy6948lUCOH92chkbvQy5u5Vo5igoZFuLdDnErvh/A=;
 b=siHyO+zpdjCbmYJUB8AsKVn3x5BCxwl2tdS+wgEd51z0mxogY/e7MqaZp7UtV2u/LY
 Jo+scdY/Tuv1p39KbQOMUa++vBzRJk3ULd7ruis7M4CX1KZjBX6pDtErNC3BCJlMwiU6
 wQ8T4006wJaBMfzGp1Xqg7BXzepb1zjn6q0SkD8Pmhw6t0Gdvw2gXduZ4slbwPlmWbW3
 pOSMee4YOfv97mCHzkZLoIWy6XTmVbcpvu991oOjSQju5vrZjp3h2aDRxm8y3jbNsKt6
 DeNxCbdboaTkvOyclEtebepz+KTExLHBv7Q2OBlbln72g/JSlDf+OWJDa+j7ZHbikQwu
 t40w==
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Rex Zhu <rex.zhu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIFR1ZSwgQXVnIDEzLCAyMDE5IGF0IDY6MzMgQU0g
Q29saW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPiB3cm90ZToKPgo+IEZyb206IENv
bGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4KPiBUaGVyZSBpcyBhIHNw
ZWxsaW5nIG1pc3Rha2UgaW4gYSBwcl9lcnIgZXJyb3IgbWVzc2FnZS4gRml4IGl0LiBBbHNvCj4g
YWRkIGEgc3BhY2UgYWZ0ZXIgYSBjb21tYSB0byBjbGVhbiB1cCBhIGNoZWNrcGF0Y2ggd2Fybmlu
Zy4KPgo+IFNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNh
bC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5j
IHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
Pgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jCj4gaW5kZXggOGJi
Y2YwMzQ3OTljLi5kMzI0YmQyODkzNGQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvc211X3YxMV8wLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9zbXVfdjExXzAuYwo+IEBAIC0yODgsNyArMjg4LDcgQEAgc3RhdGljIGludCBzbXVfdjEx
XzBfY2hlY2tfZndfdmVyc2lvbihzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKPiAgICAgICAgICAg
ICAgICAgc211LT5zbWNfaWZfdmVyc2lvbiA9IFNNVTExX0RSSVZFUl9JRl9WRVJTSU9OX05WMTQ7
Cj4gICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgZGVmYXVsdDoKPiAtICAgICAgICAg
ICAgICAgcHJfZXJyKCJzbXUgdW5zdXBvcnRlZCBhc2ljIHR5cGU6JWQuXG4iLHNtdS0+YWRldi0+
YXNpY190eXBlKTsKPiArICAgICAgICAgICAgICAgcHJfZXJyKCJzbXUgdW5zdXBwb3J0ZWQgYXNp
YyB0eXBlOiVkLlxuIiwgc211LT5hZGV2LT5hc2ljX3R5cGUpOwo+ICAgICAgICAgICAgICAgICBz
bXUtPnNtY19pZl92ZXJzaW9uID0gU01VMTFfRFJJVkVSX0lGX1ZFUlNJT05fSU5WOwo+ICAgICAg
ICAgICAgICAgICBicmVhazsKPiAgICAgICAgIH0KPiAtLQo+IDIuMjAuMQo+Cj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
