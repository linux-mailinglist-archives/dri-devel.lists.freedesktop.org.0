Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B73FF2F21CA
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 22:28:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C27088996E;
	Mon, 11 Jan 2021 21:28:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B40E8999E;
 Mon, 11 Jan 2021 21:28:43 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id d8so284989otq.6;
 Mon, 11 Jan 2021 13:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=L6rV20Xdr5h2sJR7FPyRAHmsj7qGE3iCwY0just4RS4=;
 b=T8e/YQcd2KHSenV74TjYgqb9xj+x66tHFhoWo3N01xCL+bNWieCyyMOh8QvcvNnTHj
 Ve9grHHRan+OWpTcYvMfk+1uZf5RwkaMRz4i86YBpbvysjqIhTMdCQZnW8H4VMojzUh5
 rNR6kmhjC1YIMRuaWdHDJq5oHmwSK1kltSjp76sQyLpOKCj+2XqPSd/M89H2WoY2Suey
 fC2JtCLXnc86WZtvgFvoIcjezTQuydIPtS6MkKu5ZAas+zEIMGCUdoKdsloDpUb2VH6q
 qPPYvIiAxCgX01E30yFWqKyLCgD6h831FiIRVMUp8QO4QdjeATSmXLI+QsA0fsWiab0J
 5dkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=L6rV20Xdr5h2sJR7FPyRAHmsj7qGE3iCwY0just4RS4=;
 b=gR6rau8/T5jRRlUhDEg4iGPpw12gp/VxUC6DcIwTVi2Ggx5qZx+tJCACJ+JmP62IXe
 unrJA3IhPoCrHQ3asslYWpY4ryr3JTXXmTU7PClM+bhJSzmY8hE0lWElU66Up9dSqduE
 GhijZsgV2BBqaChxbeLI6T5HMjMFy1y2sFuccvoXANb9Evl4aato6pCSivcJT6sZzpJV
 a+kOrQdI2Yp1ns0OF5g0cnFMsblupmr8wsMI39e0NxF507KX2WwTCysiIC6wHp3ib9Gt
 wZBr0FwUcVwVYrdWnAwyVPG3EDp16aogNMCQbGNkU+zMkG614dSpy4mDpq/YgVLayaLS
 94wQ==
X-Gm-Message-State: AOAM533qNpRwgzzlU+NLuyj0QKiy77Objs6rk6tpM4bO0lw/Gwq+Z3JY
 Ygs+mSRI+00BlBvj1DoeTKDYXpGWtqHqngo7HEdYrBUHg7E=
X-Google-Smtp-Source: ABdhPJwmYjDh2Mmz2DG3XJArULgg6mcvDrgdrsQ+OLMvS4zwugxW5VAQyCJP2be3vpvhXIqd5rYAw2hXfnHHNonILAc=
X-Received: by 2002:a9d:75d4:: with SMTP id c20mr703562otl.311.1610400522478; 
 Mon, 11 Jan 2021 13:28:42 -0800 (PST)
MIME-Version: 1.0
References: <20210110021142.28221-1-bas@basnieuwenhuizen.nl>
 <CADnq5_OVtCubsGP=-=q-hYJ3e6a3=pozi7ZhDiqdUkUKLCiwMg@mail.gmail.com>
 <CAP+8YyGAuYW+qOCDmQR+_X0y-jC5sKoxm+k7V8YrAEaTM942dA@mail.gmail.com>
In-Reply-To: <CAP+8YyGAuYW+qOCDmQR+_X0y-jC5sKoxm+k7V8YrAEaTM942dA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 11 Jan 2021 16:28:31 -0500
Message-ID: <CADnq5_PZ_yE-K6BzgcSUhOZ_b9nhWpbj7nau2ZopxMLa7igpQA@mail.gmail.com>
Subject: Re: [PATCH v2] drm: Check actual format for legacy pageflip.
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Zhan Liu <zhan.liu@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKYW4gMTEsIDIwMjEgYXQgMTE6MzkgQU0gQmFzIE5pZXV3ZW5odWl6ZW4KPGJhc0Bi
YXNuaWV1d2VuaHVpemVuLm5sPiB3cm90ZToKPgo+IE9uIE1vbiwgSmFuIDExLCAyMDIxIGF0IDQ6
MDIgUE0gQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+
IE9uIFNhdCwgSmFuIDksIDIwMjEgYXQgOToxMSBQTSBCYXMgTmlldXdlbmh1aXplbgo+ID4gPGJh
c0BiYXNuaWV1d2VuaHVpemVuLm5sPiB3cm90ZToKPiA+ID4KPiA+ID4gV2l0aCBtb2RpZmllcnMg
b25lIGNhbiBhY3R1YWxseSBoYXZlIGRpZmZlcmVudCBmb3JtYXRfaW5mbyBzdHJ1Y3RzCj4gPiA+
IGZvciB0aGUgc2FtZSBmb3JtYXQsIHdoaWNoIG5vdyBtYXR0ZXJzIGZvciBBTURHUFUgc2luY2Ug
d2UgY29udmVydAo+ID4gPiBpbXBsaWNpdCBtb2RpZmllcnMgdG8gZXhwbGljaXQgbW9kaWZpZXJz
IHdpdGggbXVsdGlwbGUgcGxhbmVzLgo+ID4gPgo+ID4gPiBJIGNoZWNrZWQgb3RoZXIgZHJpdmVy
cyBhbmQgaXQgZG9lc24ndCBsb29rIGxpa2UgdGhleSBlbmQgdXAgdHJpZ2dlcmluZwo+ID4gPiB0
aGlzIGNhc2Ugc28gSSB0aGluayB0aGlzIGlzIHNhZmUgdG8gcmVsYXguCj4gPiA+Cj4gPiA+IFNp
Z25lZC1vZmYtYnk6IEJhcyBOaWV1d2VuaHVpemVuIDxiYXNAYmFzbmlldXdlbmh1aXplbi5ubD4K
PiA+ID4gUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+
Cj4gPiA+IFJldmlld2VkLWJ5OiBaaGFuIExpdSA8emhhbi5saXVAYW1kLmNvbT4KPiA+ID4gQWNr
ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiA+ID4g
QWNrZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiA+ID4g
Rml4ZXM6IDgxNjg1M2Y5ZGM0MCAoImRybS9hbWQvZGlzcGxheTogU2V0IG5ldyBmb3JtYXQgaW5m
byBmb3IgY29udmVydGVkIG1ldGFkYXRhLiIpCj4gPgo+ID4gRG8geW91IGhhdmUgY29tbWl0IHJp
Z2h0cyB0byBkcm0tbWlzYyBvciBkbyB5b3UgbmVlZCBzb21lb25lIHRvIGNvbW1pdAo+ID4gdGhp
cyBmb3IgeW91Pwo+Cj4gSSBkb24ndCBoYXZlIGNvbW1pdCByaWdodHMgc28gaWYgdGhlIHBhdGNo
IGNvdWxkIGJlIGNvbW1pdHRlZCBmb3IgbWUKPiB0aGF0IHdvdWxkIGJlIGFwcHJlY2lhdGVkIQoK
UHVzaGVkIHRvIGRybS1taXNjLWZpeGVzLiAgVGhhbmtzIQoKSWYgeW91IHdhbnQgYWNjZXNzIHRv
IGRybS1taXNjLCBJIGRvbid0IHNlZSBhbnkgcmVhc29uIHlvdSBzaG91bGRuJ3QgaGF2ZSBpdC4K
CkFsZXgKCgo+ID4KPiA+IFRoYW5rcyEKPiA+Cj4gPiBBbGV4Cj4gPgo+ID4gPiAtLS0KPiA+ID4g
IGRyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYyB8IDkgKysrKysrKystCj4gPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+Cj4gPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X3BsYW5lLmMKPiA+ID4gaW5kZXggZTYyMzE5NDdmOTg3Li5hMGNiNzQ2YmNiMGEgMTAwNjQ0Cj4g
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYwo+ID4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX3BsYW5lLmMKPiA+ID4gQEAgLTExNjMsNyArMTE2MywxNCBAQCBpbnQgZHJt
X21vZGVfcGFnZV9mbGlwX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gPiA+ICAgICAg
ICAgaWYgKHJldCkKPiA+ID4gICAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ID4gPgo+ID4gPiAt
ICAgICAgIGlmIChvbGRfZmItPmZvcm1hdCAhPSBmYi0+Zm9ybWF0KSB7Cj4gPiA+ICsgICAgICAg
LyoKPiA+ID4gKyAgICAgICAgKiBPbmx5IGNoZWNrIHRoZSBGT1VSQ0MgZm9ybWF0IGNvZGUsIGV4
Y2x1ZGluZyBtb2RpZmllcnMuIFRoaXMgaXMKPiA+ID4gKyAgICAgICAgKiBlbm91Z2ggZm9yIGFs
bCBsZWdhY3kgZHJpdmVycy4gQXRvbWljIGRyaXZlcnMgaGF2ZSB0aGVpciBvd24KPiA+ID4gKyAg
ICAgICAgKiBjaGVja3MgaW4gdGhlaXIgLT5hdG9taWNfY2hlY2sgaW1wbGVtZW50YXRpb24sIHdo
aWNoIHdpbGwKPiA+ID4gKyAgICAgICAgKiByZXR1cm4gLUVJTlZBTCBpZiBhbnkgaHcgb3IgZHJp
dmVyIGNvbnN0cmFpbnQgaXMgdmlvbGF0ZWQgZHVlCj4gPiA+ICsgICAgICAgICogdG8gbW9kaWZp
ZXIgY2hhbmdlcy4KPiA+ID4gKyAgICAgICAgKi8KPiA+ID4gKyAgICAgICBpZiAob2xkX2ZiLT5m
b3JtYXQtPmZvcm1hdCAhPSBmYi0+Zm9ybWF0LT5mb3JtYXQpIHsKPiA+ID4gICAgICAgICAgICAg
ICAgIERSTV9ERUJVR19LTVMoIlBhZ2UgZmxpcCBpcyBub3QgYWxsb3dlZCB0byBjaGFuZ2UgZnJh
bWUgYnVmZmVyIGZvcm1hdC5cbiIpOwo+ID4gPiAgICAgICAgICAgICAgICAgcmV0ID0gLUVJTlZB
TDsKPiA+ID4gICAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ID4gPiAtLQo+ID4gPiAyLjI5LjIK
PiA+ID4KPiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiA+ID4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiA+ID4gYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiA+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
