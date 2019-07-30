Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDCD7B674
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 01:59:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F1AC89101;
	Tue, 30 Jul 2019 23:59:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CDFB8861A
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 23:59:23 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id k8so64023887eds.7
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 16:59:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m6L07MYm2XUREWdGGxm/q3wDS0RhzZLGHAZkdnpAJv0=;
 b=CGkcWUOxkIiKQI6sABclEqSmSkEedB2QG/NB+5UNs4SPlTa3BnM3j/YhjInO1yvrj4
 hcWQiTMdxXIkA8NPLVGdW8zahl2DdbzgxFdn9HKCaTLrp+Wb+2oMhPR2IGllL8kxkkkn
 Q0msqDMdynhd8qAjA4ODZkIu81YAmxPnTZHVR+YOmP6x87TEm93Eh36crmbZC+ZVefYZ
 Wty41Ep0ty6rIIR5aEWf8dmo2p412NEbGSe3ghnRmFpJmITy3jYR4rnIG6cBOIRN5/fF
 8tQu0rNFu43TPNnYgDRdo6CM0hWtHJXTIik8ce7PtFaDQnkxt/U83b8DhbiOUUwx/sk6
 +jMQ==
X-Gm-Message-State: APjAAAX7Wi7HWBCQS1xOV/CRynsu/rCrg5eHOL0tuLkLq1gpc2jsDaAn
 cL2fRFuxczhIa2qFvQOsCpSB54/o5c7oTocjmyeII+kn
X-Google-Smtp-Source: APXvYqx4PX+CqhLKT8Fr6q2Ml2NHtV/F3E2eYjRMIvt5WgPWUpc5t44qvE7khZiUJJWtb50UqV+XTKXefqw+cMeXC74=
X-Received: by 2002:a17:906:6bc4:: with SMTP id
 t4mr94346685ejs.256.1564531161620; 
 Tue, 30 Jul 2019 16:59:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190730225852.30319-1-robdclark@gmail.com>
In-Reply-To: <20190730225852.30319-1-robdclark@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 30 Jul 2019 16:59:10 -0700
Message-ID: <CAF6AEGvLTbTQjH+-Gbk4Vr1Cp8aL5e+3XD=XoTabzX2YoRoBCw@mail.gmail.com>
Subject: Re: [PATCH] drm: add cache support for arm64
To: dri-devel <dri-devel@lists.freedesktop.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=m6L07MYm2XUREWdGGxm/q3wDS0RhzZLGHAZkdnpAJv0=;
 b=UgoRjWXYlcZIgPmz9GDErbiOBm3M9jhIFl9wjh+Dc2ZlNE/L6VSVht0anlDxUG9UVu
 gb6hEZgc0N+p+UpQGFv34suB0UnrI0mhggxyBth8Xw35Uf9L1TZDS25N0DLJeI9qQvpF
 24a5+ulOqpD4mdk6/DBaFTR5ttxB7qwMTP7v1qMY4RxK/Xw3d5i4iD1N9gHf1G1YqWj5
 K8uWQvPYDlxPjIijdnoyLAiF7unrjLDI0ANrpXfDj1/3v+gTv1QSobwf6UJkHw8H+gdV
 pz1pQX4vpuFheYB0xJxgL7BLyqo0HnXZI6rfwpF1fIU5iFjOQC7OmqpN6gN1rkJM+NzR
 eRyw==
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
Cc: Rob Clark <robdclark@chromium.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgNDowMSBQTSBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3Jn
Pgo+Cj4gU2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgo+
IC0tLQo+IE5vdCBzdXJlIGFib3V0IDMyYiBhcm0sIGJ1dCBhdCBsZWFzdCBmb3IgYWFyY2g2NCB0
aGlzIGlzIHJlbGF0aXZlbHkKPiBlYXN5LiAgU28gbGV0cyBhdCBsZWFzdCBlbmFibGUgZm9yIGFy
bTY0LgoKaG1tLCBibGVoLCBJIHRob3VnaHQgdGhpcyB3YXMgdG9vIGVhc3kuLiBJIGhhZG4ndCBu
b3RpY2VkIHRoYXQgKGV2ZW4KdGhvdWdoIGRyaXZlciB3YXMgPW0pIENPTkZJR19EUk0gd2FzID15
CgpDYW4gd2UgbWFrZSBkcm1fY2FjaGUubyBidWlsdC1pbiBldmVuIGlmIHRoZSByZXN0IG9mIGRy
bSBpcyBhIG1vZHVsZT8KCkJSLAotUgoKPgo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2NhY2hlLmMg
fCAyMCArKysrKysrKysrKysrKysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2NhY2hlLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NhY2hlLmMKPiBpbmRleCAzYmQ3NmU5MThi
NWQuLjkwMTA1YzYzNzc5NyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2NhY2hl
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NhY2hlLmMKPiBAQCAtNjksNiArNjksMTQg
QEAgc3RhdGljIHZvaWQgZHJtX2NhY2hlX2ZsdXNoX2NsZmx1c2goc3RydWN0IHBhZ2UgKnBhZ2Vz
W10sCj4gIH0KPiAgI2VuZGlmCj4KPiArI2lmIGRlZmluZWQoX19wb3dlcnBjX18pCj4gK3N0YXRp
YyB2b2lkIF9fZmx1c2hfZGNhY2hlX2FyZWEodm9pZCAqYWRkciwgc2l6ZV90IGxlbikKPiArewo+
ICsgICAgICAgZmx1c2hfZGNhY2hlX3JhbmdlKCh1bnNpZ25lZCBsb25nKWFkZHIsCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgKHVuc2lnbmVkIGxvbmcpYWRkciArIFBBR0VfU0laRSk7Cj4g
K30KPiArI2VuZGlmCj4gKwo+ICAvKioKPiAgICogZHJtX2NsZmx1c2hfcGFnZXMgLSBGbHVzaCBk
Y2FjaGUgbGluZXMgb2YgYSBzZXQgb2YgcGFnZXMuCj4gICAqIEBwYWdlczogTGlzdCBvZiBwYWdl
cyB0byBiZSBmbHVzaGVkLgo+IEBAIC05MCw3ICs5OCw3IEBAIGRybV9jbGZsdXNoX3BhZ2VzKHN0
cnVjdCBwYWdlICpwYWdlc1tdLCB1bnNpZ25lZCBsb25nIG51bV9wYWdlcykKPiAgICAgICAgIGlm
ICh3YmludmRfb25fYWxsX2NwdXMoKSkKPiAgICAgICAgICAgICAgICAgcHJfZXJyKCJUaW1lZCBv
dXQgd2FpdGluZyBmb3IgY2FjaGUgZmx1c2hcbiIpOwo+Cj4gLSNlbGlmIGRlZmluZWQoX19wb3dl
cnBjX18pCj4gKyNlbGlmIGRlZmluZWQoX19wb3dlcnBjX18pIHx8IGRlZmluZWQoQ09ORklHX0FS
TTY0KQo+ICAgICAgICAgdW5zaWduZWQgbG9uZyBpOwo+ICAgICAgICAgZm9yIChpID0gMDsgaSA8
IG51bV9wYWdlczsgaSsrKSB7Cj4gICAgICAgICAgICAgICAgIHN0cnVjdCBwYWdlICpwYWdlID0g
cGFnZXNbaV07Cj4gQEAgLTEwMCw4ICsxMDgsNyBAQCBkcm1fY2xmbHVzaF9wYWdlcyhzdHJ1Y3Qg
cGFnZSAqcGFnZXNbXSwgdW5zaWduZWQgbG9uZyBudW1fcGFnZXMpCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgY29udGludWU7Cj4KPiAgICAgICAgICAgICAgICAgcGFnZV92aXJ0dWFsID0ga21h
cF9hdG9taWMocGFnZSk7Cj4gLSAgICAgICAgICAgICAgIGZsdXNoX2RjYWNoZV9yYW5nZSgodW5z
aWduZWQgbG9uZylwYWdlX3ZpcnR1YWwsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAodW5zaWduZWQgbG9uZylwYWdlX3ZpcnR1YWwgKyBQQUdFX1NJWkUpOwo+ICsgICAgICAg
ICAgICAgICBfX2ZsdXNoX2RjYWNoZV9hcmVhKHBhZ2VfdmlydHVhbCwgUEFHRV9TSVpFKTsKPiAg
ICAgICAgICAgICAgICAga3VubWFwX2F0b21pYyhwYWdlX3ZpcnR1YWwpOwo+ICAgICAgICAgfQo+
ICAjZWxzZQo+IEBAIC0xMzUsNiArMTQyLDEzIEBAIGRybV9jbGZsdXNoX3NnKHN0cnVjdCBzZ190
YWJsZSAqc3QpCj4KPiAgICAgICAgIGlmICh3YmludmRfb25fYWxsX2NwdXMoKSkKPiAgICAgICAg
ICAgICAgICAgcHJfZXJyKCJUaW1lZCBvdXQgd2FpdGluZyBmb3IgY2FjaGUgZmx1c2hcbiIpOwo+
ICsjZWxpZiBkZWZpbmVkKENPTkZJR19BUk02NCkKPiArICAgICAgIHN0cnVjdCBzZ19wYWdlX2l0
ZXIgc2dfaXRlcjsKPiArCj4gKyAgICAgICBmb3JfZWFjaF9zZ19wYWdlKHN0LT5zZ2wsICZzZ19p
dGVyLCBzdC0+bmVudHMsIDApIHsKPiArICAgICAgICAgICAgICAgc3RydWN0IHBhZ2UgKnAgPSBz
Z19wYWdlX2l0ZXJfcGFnZSgmc2dfaXRlcik7Cj4gKyAgICAgICAgICAgICAgIGRybV9jbGZsdXNo
X3BhZ2VzKCZwLCAxKTsKPiArICAgICAgIH0KPiAgI2Vsc2UKPiAgICAgICAgIHByX2VycigiQXJj
aGl0ZWN0dXJlIGhhcyBubyBkcm1fY2FjaGUuYyBzdXBwb3J0XG4iKTsKPiAgICAgICAgIFdBUk5f
T05fT05DRSgxKTsKPiAtLQo+IDIuMjEuMAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
