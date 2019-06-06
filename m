Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEA2369D7
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 04:11:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B003889296;
	Thu,  6 Jun 2019 02:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11F289296
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 02:11:26 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id a15so931379qtn.7
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 19:11:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GCRlSUdz6Ow6CJdaxIx3Rxosc3F4BR6YdzFu7+L5uKQ=;
 b=fEOdE/BLxN4ad6g38jkJ4KGldXU4hDK6AptBZjXj6X/fvwp7ycRT1+6hEXlkEfgWZ9
 K39252rvPEhTwh5MeFNFLJEXxuE0cj5O3Q7y+tNkHg0uWSlbNzmL+jbSc4AdOVEIht5k
 5uK8K/K+kt02QvuuVJtTPwBBzK5Qs1O23lkFvY5EtVE3JK1TC13+eV1KZTgIMudi204T
 docEwtwGfKUxFHuqVmIL/+I1XFXUEB2t3wYoGv5/euYV5Ix+XgVhUpDizrTq63Mg1ow0
 NMb7dhEdFw96mnOH8qeORTPBDZgv48CekdBEgbpShNNHq5z3P/5LKjmBQtJkwG54Tj69
 RONw==
X-Gm-Message-State: APjAAAVclZgUeNqtj3sLHB8XEiDs43OKc6HajMcq76hRzwClHA89Xt/5
 +KbaYDlE8AzIquaXCvVGVQwpF/0JAuD8mPWhWQg54/B/INk=
X-Google-Smtp-Source: APXvYqxtrHQGMry9b7DMYOmda7hORhbe66cAN8lYFBeCl9PyLctKW5z4b6Av/zklhijCCgb/+ooIxBs/xaQH41PrECU=
X-Received: by 2002:ac8:2744:: with SMTP id h4mr38248930qth.180.1559787085520; 
 Wed, 05 Jun 2019 19:11:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190604144205.GO15316@e110455-lin.cambridge.arm.com>
In-Reply-To: <20190604144205.GO15316@e110455-lin.cambridge.arm.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 6 Jun 2019 12:11:14 +1000
Message-ID: <CAPM=9tw+xO6QPcCdtFE_4t5wVrwY0CHdZ4YFNrb13SqOUHVcEA@mail.gmail.com>
Subject: Re: [GIT PULL] v5.2 fixes for Arm drivers
To: Liviu Dudau <Liviu.Dudau@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GCRlSUdz6Ow6CJdaxIx3Rxosc3F4BR6YdzFu7+L5uKQ=;
 b=iTQrlLSHMSGU2J1uDbGFqqVHVslwiehQw9qGApFY4j8iP8ndSodA3GWspEapmMFVz1
 BtvjhHtYazqAeY+H/0TfazWVVXqfATTV2PgELl25N1ja/ZFUcWHDUNDU+Ps4EHAgIuj2
 wEAatkwU67g2yh6i/DeqYf5fInzJ+6OJqG6TE51sFYNU/ptMKyB/o/2AWBDd9M6G2IOG
 2n7RnUQNw7mbl82oNONN1MNHkxBaR99FrRWOfQcLcbnZhXFmakcqQPPG8LlNydGpnskk
 j8efV2yH5HaFRVFLtkzyREdqS/VP5HiP1VhodkRcBQlo3K723EP5uzn18O3BjXQyCOIn
 4rzA==
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
Cc: Wen He <wen.he_1@nxp.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI devel <dri-devel@lists.freedesktop.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 MaliDP Maintainers <malidp@foss.arm.com>,
 "Lowry Li \(Arm Technology China\)" <lowry.li@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGl2aXUsCgpkaW06IGM0M2RlNjM2YTQ2OSAoImRybS9rb21lZGE6IFBvdGVudGlhbCBlcnJv
ciBwb2ludGVyIGRlcmVmZXJlbmNlIik6CmNvbW1pdHRlciBTaWduZWQtb2ZmLWJ5IG1pc3Npbmcu
CmRpbTogYzQzZGU2MzZhNDY5ICgiZHJtL2tvbWVkYTogUG90ZW50aWFsIGVycm9yIHBvaW50ZXIg
ZGVyZWZlcmVuY2UiKToKU0hBMSBpbiBmaXhlcyBsaW5lIG5vdCBmb3VuZDoKZGltOiAgICAgN2Qz
MWI5ZTdhNTUwICgiZHJtL2tvbWVkYTogQWRkIGtvbWVkYV9wbGFuZS9wbGFuZV9oZWxwZXJfZnVu
Y3MiKQoKVGhlc2UgYXJlIHJlYWwsIHBsZWFzZSBmaXggYW5kIHJlc3VibWl0LgoKRGF2ZS4KCk9u
IFdlZCwgNSBKdW4gMjAxOSBhdCAwMDo0MiwgTGl2aXUgRHVkYXUgPExpdml1LkR1ZGF1QGFybS5j
b20+IHdyb3RlOgo+Cj4gSGVsbG8gRFJNIG1haW50YWluZXJzLAo+Cj4gSSBoYXZlIGNvbGxlY3Rl
ZCBhbiBhc3NvcnRlZCBzZXQgb2YgcGF0Y2hlcyBmb3IgQXJtIERSTSBkcml2ZXJzIHRoYXQgSSBt
YWludGFpbgo+IGluIG15IHRyZWUsIHNvIGl0J3MgdGltZSB0byBmbHVzaCB0aGVtIG91dC4gUGxl
YXNlIHB1bGwhCj4KPiBCZXN0IHJlZ2FyZHMsCj4gTGl2aXUKPgo+Cj4gVGhlIGZvbGxvd2luZyBj
aGFuZ2VzIHNpbmNlIGNvbW1pdCAyYTNlMGI3MTYyOTZhNTA0ZDllNjVmZWE3YWNiMzc5Yzg2ZmU0
MjgzOgo+Cj4gICBNZXJnZSB0YWcgJ2lteC1kcm0tZml4ZXMtMjAxOS0wNS0yOScgb2YgZ2l0Oi8v
Z2l0LnBlbmd1dHJvbml4LmRlL2dpdC9wemEvbGludXggaW50byBkcm0tZml4ZXMgKDIwMTktMDUt
MzEgMDk6MTU6MjUgKzEwMDApCj4KPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9y
eSBhdDoKPgo+ICAgZ2l0Oi8vbGludXgtYXJtLm9yZy9saW51eC1sZC5naXQgbWFsaWRwLWZpeGVz
Cj4KPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gYzQzZGU2MzZhNDY5YTQyYzdiMDQw
YzhkNDhlZGE2ZDVjMzk3N2I5YzoKPgo+ICAgZHJtL2tvbWVkYTogUG90ZW50aWFsIGVycm9yIHBv
aW50ZXIgZGVyZWZlcmVuY2UgKDIwMTktMDYtMDQgMTU6MTk6NDAgKzAxMDApCj4KPiAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Cj4gRGFuIENhcnBlbnRlciAoMSk6Cj4gICAgICAgZHJtL2tvbWVkYTogUG90ZW50aWFsIGVycm9y
IHBvaW50ZXIgZGVyZWZlcmVuY2UKPgo+IExvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkg
KDEpOgo+ICAgICAgIGRybS9rb21lZGE6IGZpeGluZyBvZiBETUEgbWFwcGluZyBzZyBzZWdtZW50
IHdhcm5pbmcKPgo+IFJvYmluIE11cnBoeSAoMik6Cj4gICAgICAgZHJtL2FybS9oZGxjZDogQWN0
dWFsbHkgdmFsaWRhdGUgQ1JUQyBtb2Rlcwo+ICAgICAgIGRybS9hcm0vaGRsY2Q6IEFsbG93IGEg
Yml0IG9mIGNsb2NrIHRvbGVyYW5jZQo+Cj4gV2VuIEhlICgxKToKPiAgICAgICBkcm0vYXJtL21h
bGktZHA6IEFkZCBhIGxvb3AgYXJvdW5kIHRoZSBzZWNvbmQgc2V0IENWQUwgYW5kIHRyeSA1IHRp
bWVzCj4KPiBZdWVIYWliaW5nICgxKToKPiAgICAgICBkcm0va29tZWRhOiByZW1vdmUgc2V0IGJ1
dCBub3QgdXNlZCB2YXJpYWJsZSAna2NydGMnCj4KPiBqYW1lcyBxaWFuIHdhbmcgKEFybSBUZWNo
bm9sb2d5IENoaW5hKSAoMSk6Cj4gICAgICAgZHJtL2tvbWVkYTogQ29uc3RpZnkgdGhlIHVzYWdl
IG9mIGtvbWVkYV9jb21wb25lbnQvcGlwZWxpbmUvZGV2X2Z1bmNzCj4KPiAgZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jIHwgIDggKysrKy0tLS0K
PiAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2Rldi5jICAgICAg
IHwgIDQgKystLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9j
cnRjLmMgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9kZXYuYyAgICAgICAgfCAgNiArKysrKy0KPiAgZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmggICAgICAgIHwgIDggKysrKystLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuYyAgIHwgIDQgKyst
LQo+ICBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5o
ICAgfCAxMCArKysrKy0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX3BsYW5lLmMgICAgICB8ICA0ICstLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FybS9oZGxj
ZF9jcnRjLmMgICAgICAgICAgICAgICAgICAgICAgIHwgMTQgKysrKysrKy0tLS0tLS0KPiAgZHJp
dmVycy9ncHUvZHJtL2FybS9tYWxpZHBfZHJ2LmMgICAgICAgICAgICAgICAgICAgICAgIHwgMTMg
KysrKysrKysrKysrLQo+ICAxMCBmaWxlcyBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspLCAyOSBk
ZWxldGlvbnMoLSkKPiAtLQo+ID09PT09PT09PT09PT09PT09PT09Cj4gfCBJIHdvdWxkIGxpa2Ug
dG8gfAo+IHwgZml4IHRoZSB3b3JsZCwgIHwKPiB8IGJ1dCB0aGV5J3JlIG5vdCB8Cj4gfCBnaXZp
bmcgbWUgdGhlICAgfAo+ICBcIHNvdXJjZSBjb2RlISAgLwo+ICAgLS0tLS0tLS0tLS0tLS0tCj4g
ICAgIMKvXF8o44OEKV8vwq8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
