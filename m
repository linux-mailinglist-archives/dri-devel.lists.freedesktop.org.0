Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3EAC9116
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 20:47:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 103586E17E;
	Wed,  2 Oct 2019 18:47:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C716E17D;
 Wed,  2 Oct 2019 18:47:24 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id v17so11478wml.4;
 Wed, 02 Oct 2019 11:47:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rl3HwNc1oPPqrMvALhFW3tFOkISeqhdk4UKaPBcY6s0=;
 b=biJ3qIANYfjbbCDeBU4Bmoa6SNxmfA8+T10hIccPOpCmC+yzSRgBMK2KzgOulDKHi4
 cgqnMsO+wMIPwM03Bh1SRqweNgwFTLDBPsn9jg+iAYBv8PmZKJpsflq5oJQxRw11LItq
 Y/xpeFnCP/DdbP48V4J6xvqD81/z7s7LZczqWjeeRcu+D7zX8B8V/hm65/QsApGDxbpa
 BFV0MjTArOOrCC18GdQz2xlKQlURtu2Ec3PCzpnWJMbCJg9022b0zW2AkldTL4q8ctd+
 KUI1IiWCTEuoN1T8Sqmk6ebM6pDLB56mSig4/Xj+UDkpIBdLHaV2ZoY4/rFqY5aiYkQw
 DvlA==
X-Gm-Message-State: APjAAAV452emg4/54nQmRz4d0/Kj6EtwAx+GTs5juRH1RTTzw0BDyToW
 A8CT/BxYlFMA+Ju8htRbcyhOlkIwWAqND9egKn8=
X-Google-Smtp-Source: APXvYqyadvQZt/5r+wPSV1oq1Tc7kuGgYq0Qtbq3Xvtf/2EtBqF6rMDvmldFOj48UiW4aroqZt4JfknMTY9l3qmJeMM=
X-Received: by 2002:a1c:1a45:: with SMTP id a66mr3986539wma.102.1570042042540; 
 Wed, 02 Oct 2019 11:47:22 -0700 (PDT)
MIME-Version: 1.0
References: <20191002120136.1777161-1-arnd@arndb.de>
In-Reply-To: <20191002120136.1777161-1-arnd@arndb.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 2 Oct 2019 14:47:10 -0400
Message-ID: <CADnq5_MLg=J5dmSGzx8jC=1--d2S3HJzWH3EHhyzT6da5a3wcA@mail.gmail.com>
Subject: Re: [PATCH 0/6] amdgpu build fixes
To: Arnd Bergmann <arnd@arndb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=rl3HwNc1oPPqrMvALhFW3tFOkISeqhdk4UKaPBcY6s0=;
 b=azaA/Cc2WKbblHOERF1vzi7jLDwr6FIH836aAU4kxozXuaEVRWIrk2ayHEmJ6MP8iG
 7aXeTyQcvL6Gq6M2WGSQ/28uNNEuh5Sk+Wb8lDMJmtg0U19KU+TfSM06N54QFV2ytHLe
 6TT3WglYH2oMlHLNMc7jNg6rKJ1RPE2OwuMjUwULL45KaOhLj1AmJc94IldmDG/TcJjt
 pQ4D0y7Tc374OZ59vjD0p2XegEz5DAT3wo/h/xf07hKe86jRbIZWEu4h6FoQw2xYq16R
 aqpoMgBsr5nb1p67OTE9jmExlVs4fzMYAHkcKW6TThhd8akohCbf7npIwFg9mSvvsdm7
 dFWQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMiwgMjAxOSBhdCA4OjAyIEFNIEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIu
ZGU+IHdyb3RlOgo+Cj4gSGVyZSBhcmUgYSBjb3VwbGUgb2YgYnVpbGQgZml4ZXMgZnJvbSBteSBi
YWNrbG9nIGluIHRoZSByYW5kY29uZmlnCj4gdHJlZS4gSXQgd291bGQgYmUgZ29vZCB0byBnZXQg
dGhlbSBhbGwgaW50byBsaW51eC01LjQuCj4KPiAgICAgIEFybmQKPgo+IEFybmQgQmVyZ21hbm4g
KDYpOgo+ICAgZHJtL2FtZGdwdTogbWFrZSBwbXUgc3VwcG9ydCBvcHRpb25hbCwgYWdhaW4KPiAg
IGRybS9hbWRncHU6IGhpZGUgYW5vdGhlciAjd2FybmluZwo+ICAgZHJtL2FtZGdwdTogZGlzcGxh
eV9tb2RlX3ZiYV8yMTogcmVtb3ZlIHVpbnQgdHlwZWRlZgo+ICAgZHJtL2FtZC9kaXNwbGF5OiBm
aXggZGNuMjEgTWFrZWZpbGUgZm9yIGNsYW5nCj4gICBbUkVTRU5EXSBkcm0vYW1kL2Rpc3BsYXk6
IGhpZGUgYW4gdW51c2VkIHZhcmlhYmxlCj4gICBbUkVTRU5EXSBkcm0vYW1kZ3B1OiB3b3JrIGFy
b3VuZCBsbHZtIGJ1ZyAjNDI1NzYKCkkndmUgYXBwbGllZCAxLTUgYW5kIEknbGwgc2VuZCB0aGVt
IGZvciA1LjQuICBUaGVyZSBzdGlsbCBzZWVtcyB0byBiZQpzb21lIGRlYmF0ZSBhYm91dCA2LgoK
VGhhbmtzLgoKQWxleAoKPgo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9NYWtlZmlsZSAg
ICAgICAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1h
X3Y0XzAuYyAgICAgICAgICAgICAgfCAgMSArCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3NvYzE1LmMgICAgICAgICAgICAgICAgICB8ICAyIC0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgICB8ICAyICsrCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY24yMS9NYWtlZmlsZSAgICAgICB8IDEyICsrKysrKysrKysrLQo+
ICAuLi4vYW1kL2Rpc3BsYXkvZGMvZG1sL2RjbjIxL2Rpc3BsYXlfbW9kZV92YmFfMjEuYyAgfCAx
MyArKysrKy0tLS0tLS0tCj4gIDYgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMTIg
ZGVsZXRpb25zKC0pCj4KPiAtLQo+IDIuMjAuMAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
