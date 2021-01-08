Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 681FD2EFA36
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 22:19:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD0E089320;
	Fri,  8 Jan 2021 21:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C0736E8DE;
 Fri,  8 Jan 2021 21:19:51 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id r9so11000434otk.11;
 Fri, 08 Jan 2021 13:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xpKOTSO9z0/uA/jBdJXRuqf0OMCjnmCkNWQ+uc2BgYY=;
 b=VMpglM/KLM6PpwbpnUURqHJ2NMGbf3vFOpVW2E8vqbPEk9W0drSgp5EE0ScKJ1e2mA
 yQ4HWIOVcE7pX47hfHHIR7KvxcfC5HoJSBS4I6OEPOEoq7/SNUuALIXJTAbTN6kN4T+2
 A/OC38cvU/LeXdvxrIm6ltMSilr3xoTnCNHrwIWZmIfNXlPqzu4/gS5HIMITEnBOG/eT
 /PbK/uHbf4j9vUq9M5uvIeEi2+63SDJMFaF4gdiVN5AWdUwFvTXqrpG/MvvAUMcM3ZFp
 kAy6Cl7xr5kEESXN4oA+gT08/J5Lo7CaNgkvkJNUHosqWUM5sRaTfRFqkUUAWdNVN1rs
 YseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xpKOTSO9z0/uA/jBdJXRuqf0OMCjnmCkNWQ+uc2BgYY=;
 b=bhx4N1TsFLK5mswUvwZC8Sysl48yOBdXWDfG2UgIwr3SzCx3YRtIaHyKSyTfTYA/Vl
 Upz/dwiV4UWE6qPYVK+lGUSOAMQzVRBXse784RwoHoAONEZ0Lp1ZqDkanFrzKo3/FkL0
 aIGgRlbDkw5puJUmdXmczy890lQJqAWPVL36xwTtgC+p1d2NBQxGp7b+tzDv5s83sMUV
 6uiPHmGcvvLWEXL2lN7/ltzbIE6Z4rBxsKh6QGwghWXCu3+yYiQSTzXJf6IzD9niXYAL
 vI5q5+CLTMYmj5+NdhZKNT2ZlNP7gU3jQ86no4B+G7kQRMhNZTZ2wImWzo5ZekpTgdwb
 vmbA==
X-Gm-Message-State: AOAM530oUhpFxsuNKKE+9DetVxJAgIE4N11f3gkf6gjDMWTqpZfebeFL
 U+CR2uNKdjv0iH8ZBH0luam5LsXUa1KbEXrLTPU=
X-Google-Smtp-Source: ABdhPJz+KDO44Y+LyCgARS0TkKG2wSDL0xKv2rNXv+hHBBZXTWDoLvv/qDajd7DRk1MPvTWpPmhqR8xyzAW6bl9/+Hw=
X-Received: by 2002:a9d:75d4:: with SMTP id c20mr3902944otl.311.1610140790582; 
 Fri, 08 Jan 2021 13:19:50 -0800 (PST)
MIME-Version: 1.0
References: <20210108201457.3078600-1-lee.jones@linaro.org>
 <20210108201457.3078600-32-lee.jones@linaro.org>
In-Reply-To: <20210108201457.3078600-32-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Jan 2021 16:19:39 -0500
Message-ID: <CADnq5_N-OrDEhJ_jPqgrXfHKqxruUVxH7baJ=cZ50_q_GjUG8g@mail.gmail.com>
Subject: Re: [PATCH 31/40] drm/amd/display/dc/dce/dce_opp: Make local
 functions and ones invoked by reference static
To: Lee Jones <lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, Mauro Rossi <issor.oruam@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKYW4gOCwgMjAyMSBhdCAzOjE1IFBNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+IHdyb3RlOgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9k
Y2UvZGNlX29wcC5jOjQyNzo2OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKA
mGRjZTYwX29wcF9zZXRfY2xhbXBpbmfigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+ICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZS9kY2Vfb3BwLmM6NTQ4OjY6
IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYZGNlNjBfb3BwX3Byb2dyYW1f
Yml0X2RlcHRoX3JlZHVjdGlvbuKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4gIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNlL2RjZV9vcHAuYzo1NzE6Njogd2Fy
bmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhkY2U2MF9vcHBfcHJvZ3JhbV9jbGFt
cGluZ19hbmRfcGl4ZWxfZW5jb2RpbmfigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+ICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZS9kY2Vfb3BwLmM6NjgxOjY6
IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYZGNlNjBfb3BwX3Byb2dyYW1f
Zm104oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPgo+IENjOiBIYXJyeSBXZW50bGFuZCA8aGFy
cnkud2VudGxhbmRAYW1kLmNvbT4KPiBDYzogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Cj4g
Q2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogIkNocmlz
dGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxp
ZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNo
Pgo+IENjOiBNYXVybyBSb3NzaSA8aXNzb3Iub3J1YW1AZ21haWwuY29tPgo+IENjOiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCkFw
cGxpZWQuICBUaGFua3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNlL2RjZV9vcHAuYyB8IDggKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9vcHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY2UvZGNlX29wcC5jCj4gaW5kZXggZTQ1OWFlNjVhYWY3Ni4uMmJmOGY1YTJlMGMy
MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9v
cHAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX29wcC5j
Cj4gQEAgLTQyNCw3ICs0MjQsNyBAQCB2b2lkIGRjZTExMF9vcHBfc2V0X2NsYW1waW5nKAo+ICAg
KiAgICAgICAgICAgICA3IGZvciBwcm9ncmFtYWJsZQo+ICAgKiAgICAgMikgRW5hYmxlIGNsYW1w
IGlmIExpbWl0ZWQgcmFuZ2UgcmVxdWVzdGVkCj4gICAqLwo+IC12b2lkIGRjZTYwX29wcF9zZXRf
Y2xhbXBpbmcoCj4gK3N0YXRpYyB2b2lkIGRjZTYwX29wcF9zZXRfY2xhbXBpbmcoCj4gICAgICAg
ICBzdHJ1Y3QgZGNlMTEwX29wcCAqb3BwMTEwLAo+ICAgICAgICAgY29uc3Qgc3RydWN0IGNsYW1w
aW5nX2FuZF9waXhlbF9lbmNvZGluZ19wYXJhbXMgKnBhcmFtcykKPiAgewo+IEBAIC01NDUsNyAr
NTQ1LDcgQEAgdm9pZCBkY2UxMTBfb3BwX3Byb2dyYW1fYml0X2RlcHRoX3JlZHVjdGlvbigKPiAg
fQo+Cj4gICNpZiBkZWZpbmVkKENPTkZJR19EUk1fQU1EX0RDX1NJKQo+IC12b2lkIGRjZTYwX29w
cF9wcm9ncmFtX2JpdF9kZXB0aF9yZWR1Y3Rpb24oCj4gK3N0YXRpYyB2b2lkIGRjZTYwX29wcF9w
cm9ncmFtX2JpdF9kZXB0aF9yZWR1Y3Rpb24oCj4gICAgICAgICBzdHJ1Y3Qgb3V0cHV0X3BpeGVs
X3Byb2Nlc3NvciAqb3BwLAo+ICAgICAgICAgY29uc3Qgc3RydWN0IGJpdF9kZXB0aF9yZWR1Y3Rp
b25fcGFyYW1zICpwYXJhbXMpCj4gIHsKPiBAQCAtNTY4LDcgKzU2OCw3IEBAIHZvaWQgZGNlMTEw
X29wcF9wcm9ncmFtX2NsYW1waW5nX2FuZF9waXhlbF9lbmNvZGluZygKPiAgfQo+Cj4gICNpZiBk
ZWZpbmVkKENPTkZJR19EUk1fQU1EX0RDX1NJKQo+IC12b2lkIGRjZTYwX29wcF9wcm9ncmFtX2Ns
YW1waW5nX2FuZF9waXhlbF9lbmNvZGluZygKPiArc3RhdGljIHZvaWQgZGNlNjBfb3BwX3Byb2dy
YW1fY2xhbXBpbmdfYW5kX3BpeGVsX2VuY29kaW5nKAo+ICAgICAgICAgc3RydWN0IG91dHB1dF9w
aXhlbF9wcm9jZXNzb3IgKm9wcCwKPiAgICAgICAgIGNvbnN0IHN0cnVjdCBjbGFtcGluZ19hbmRf
cGl4ZWxfZW5jb2RpbmdfcGFyYW1zICpwYXJhbXMpCj4gIHsKPiBAQCAtNjc4LDcgKzY3OCw3IEBA
IHZvaWQgZGNlMTEwX29wcF9wcm9ncmFtX2ZtdCgKPiAgfQo+Cj4gICNpZiBkZWZpbmVkKENPTkZJ
R19EUk1fQU1EX0RDX1NJKQo+IC12b2lkIGRjZTYwX29wcF9wcm9ncmFtX2ZtdCgKPiArc3RhdGlj
IHZvaWQgZGNlNjBfb3BwX3Byb2dyYW1fZm10KAo+ICAgICAgICAgc3RydWN0IG91dHB1dF9waXhl
bF9wcm9jZXNzb3IgKm9wcCwKPiAgICAgICAgIHN0cnVjdCBiaXRfZGVwdGhfcmVkdWN0aW9uX3Bh
cmFtcyAqZm10X2JpdF9kZXB0aCwKPiAgICAgICAgIHN0cnVjdCBjbGFtcGluZ19hbmRfcGl4ZWxf
ZW5jb2RpbmdfcGFyYW1zICpjbGFtcGluZykKPiAtLQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBs
aXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
