Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A7271F86
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 20:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC5389C89;
	Tue, 23 Jul 2019 18:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A387789B18;
 Tue, 23 Jul 2019 18:45:19 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id x1so29269439wrr.9;
 Tue, 23 Jul 2019 11:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5uJhkLXJdGxLJxdwTXXjbtfErmAZdUMl9oepnhVnpJU=;
 b=KkyvZv6FOGiG+VG61unWjhNdljtw8moNlzhC1nynuYJI38OvfURhMKLk0a+Hths1qz
 bC9FS9yKlbnXPXFaSAd4g/oIcj/x352brvwjW8GybEigINKiWXzeF6qRLls5boX+WUvK
 3Au8OJo9y93Vod8IalwNnXi0Uyy/4xiKhwznIc028H0I7nAxM8rV64et5MXjxySciFsB
 MJMHGjcZj1E7zMkZC38VfrfTDPsNLXMGFdWT43vvezH8pSNhiPqUkorUhH4/AnhJVLFm
 f4Shl5kx3oL8eG4pyuKikcm2S0NtRux6EY+Vd4wm5tNDaX8UTbbKw85U4HM8TBZ71EyL
 visg==
X-Gm-Message-State: APjAAAWtOpR166ATGN+nptEXUwhSpk2vkyuWrK5M5DmMalwrK2BSDClK
 2tQuPmhcxxqZMmpH9iPEtCR4PTV5rY2e44G8TEU=
X-Google-Smtp-Source: APXvYqyHjjqtHDgklRtxzyV71CQoAnoB9+E/YFBvxbOAhcaWr0Ba2y8dm7WcuR5DTH12Yf9Afxc8MjOei6MHmqudqBk=
X-Received: by 2002:adf:f94a:: with SMTP id q10mr59242784wrr.341.1563907518245; 
 Tue, 23 Jul 2019 11:45:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190723134120.28441-1-colin.king@canonical.com>
In-Reply-To: <20190723134120.28441-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 23 Jul 2019 14:45:07 -0400
Message-ID: <CADnq5_PE1rDzqd13MPWJmeK_BUS0EthH=WcZ0wruTy55yarnpw@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amdgpu: remove redundant assignment to pointer
 'ring'
To: Colin King <colin.king@canonical.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=5uJhkLXJdGxLJxdwTXXjbtfErmAZdUMl9oepnhVnpJU=;
 b=KCHVNkndiWJSE0kTr3cYX3OnwDHz9/b3q+v6QwNjzUH61qyGRuSe4P2eo3ZE4NwOrf
 xfqW2OzYPUKqMNRHbt26vA7ZMjGAJMF92jul6OW7k//Mdxxc3utIM/pjDCYohTfRPrdd
 1XPzRDlmA7tEd0sNJavA0Ffo5bNDFi8tv8KI8Xl1iDTt/ukbtRQZLX5Nh6+3b+bIxtV+
 J+9T8sABvI8OXdd/nC3eYbB0h21KU4JPf2Tb5+qzT2rG0lfeDLXYtParESonPFKsHc98
 Lnun+5anztR5gJaS1lQRGUTgP8y6V3SCqfYdFtDdAjAQa1Vv4LkCoU6VqPVn31WlV+Jq
 5kUQ==
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
 Alex Deucher <alexander.deucher@amd.com>, Leo Liu <leo.liu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgOTo0MSBBTSBDb2xpbiBLaW5nIDxjb2xpbi5raW5nQGNh
bm9uaWNhbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdA
Y2Fub25pY2FsLmNvbT4KPgo+IFRoZSBwb2ludGVyICdyaW5nJyBpcyBiZWluZyBhc3NpZ25lZCBh
IHZhbHVlIHRoYXQgaXMgbmV2ZXIKPiByZWFkLCBoZW5jZSB0aGUgYXNzaWdubWVudCBpcyByZWR1
bmRhbnQgYW5kIGNhbiBiZSByZW1vdmVkLgo+Cj4gQWRkcmVzc2VzLUNvdmVyaXR5OiAoIlVudXNl
ZCB2YWx1ZSIpCj4gU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fu
b25pY2FsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YxXzAu
YyB8IDEgLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92MV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS92Y25fdjFfMC5jCj4gaW5kZXggOTNiMzUwMGU1MjJiLi5hMmE4Y2E5NDJmMzQg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YxXzAuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92MV8wLmMKPiBAQCAtMTMzMSw3ICsx
MzMxLDYgQEAgc3RhdGljIGludCB2Y25fdjFfMF9wYXVzZV9kcGdfbW9kZShzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFdSRUczMl9T
T0MxNShVVkQsIDAsIG1tVVZEX0pSQkNfUkJfQ05UTCwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFVWRF9KUkJDX1JCX0NOVExfX1JCX1JQ
VFJfV1JfRU5fTUFTSyk7Cj4KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJpbmcg
PSAmYWRldi0+dmNuLmluc3QtPnJpbmdfZGVjOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgV1JFRzMyX1NPQzE1KFVWRCwgMCwgbW1VVkRfUkJDX1JCX1dQVFIsCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUlJFRzMyX1NPQzE1KFVW
RCwgMCwgbW1VVkRfU0NSQVRDSDIpICYgMHg3RkZGRkZGRik7Cj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBTT0MxNV9XQUlUX09OX1JSRUcoVVZELCAwLCBtbVVWRF9QT1dFUl9TVEFU
VVMsCgpXaGlsZSB3ZSBkb24ndCB1c2UgcmluZyBoZXJlLCBJIHRoaW5rIHRoZSBhc3NpZ25tZW50
IGlzIHVzZWZ1bCB0bwpkZWxpbmVhdGUgdGhhdCB3ZSBhcmUgbm8gbG9uZ2VyIHdvcmtpbmcgd2l0
aCB0aGUganBlZyByaW5nLCBidXQgcmF0aGVyCnRoZSBkZWNvZGUgcmluZy4gIFRoZSBtbVVWRF9S
QkNfUkJfV1BUUiByZWdpc3RlciBpcyBwYXJ0IG9mIHRoZSBkZWNvZGUKcmluZywgbm90IGpwZWcu
ICBXZSB3b3VsZCBub3JtYWxseSB1c2UgdGhlIHJpbmctPndwdHIgbGlrZSB3ZSBkbyBmb3IKdGhl
IG90aGVyIHJpbmdzLCBidXQgaW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2UsIHRoZSB2YWx1ZSBoYXBw
ZW5zIHRvIGJlCnNoYWRvd2VkIHRvIGEgc2NyYXRjaCByZWdpc3RlciBkdWUgdG8gdGhlIHdheSB0
aGUgZHluYW1pYyBwb3dlciBnYXRpbmcKd29ya3Mgb24gdGhhdCByaW5nLgoKQWxleAoKPiAtLQo+
IDIuMjAuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
