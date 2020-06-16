Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6581FC73C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 09:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A2C6EA9D;
	Wed, 17 Jun 2020 07:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99B26E83F
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 16:38:43 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id u25so5659714lfm.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 09:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=goTjruJDxLjz4AJd/syAHegMRf5NuYWgRb49fm6LsE0=;
 b=vHepsuqmzRFE/eoj9fB/+OVEMXjR1MyCFDI5crng09VxEJLwAFfUIHMp5o0K9qT4rt
 L1Yh51cGsH3Jy53L05nHILmYaqmKz44ieslnmH84OOhIvslnV8zH+HzpO6DUCnIiUd1d
 5nn5rmwXUK52TGX3UTkXqxav5GAajxYhUw5a4KJcnY7Ulb3IJVDsYhL/bXeiFEDYWjIG
 875oWxRwZl4i5mGm9tVo2L5GAb5V5+NmAJP6dIzpl21fOeYBgOqANXiD1WljVcmBwX9i
 jNT59Z0hMcmbnYwTPl5O7VZ8K6f1V5LYumAUk3w3OHi+PaZg9h1uy6+e3V5U5FCDF6Nh
 8Jkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=goTjruJDxLjz4AJd/syAHegMRf5NuYWgRb49fm6LsE0=;
 b=gBQ2tIYpvqCZObh7KZcoOSN8HQhvdWt2R3e5wbQsUKQfuZtARxohGo5o5GDH0O35lI
 JI57FgBbxpK2Fo8oB8ob3iE/ioBmYvdRpu9nYlz569raAzkztbpEpXV1YVEiAX8yXnG8
 RwZDG8ANt7rs8/bWwuirKeBntSog+A/Q6O7aN6y+NlHj4avPK9hU6WCtHg28T+wIGFj1
 rdwpeU9eL/fFjK82dFk+bMzUkEZ5ZpvXy54xBb0nOf2N97qIm+Gg/SUMK6N3uIjyWbWS
 TFOgZXw5qU5PRs0NGFbUlRD80PDEq+QsyK/BiUiVhOLH+fDmmiq/Y4FfU2pCVFRYu0rL
 3Eow==
X-Gm-Message-State: AOAM531arqi+lzMbq9KctOCFzLvGMk25G+IaINTF82K8yVJXp696kDdu
 KXp11xb6BoTmQb5VudKUcks=
X-Google-Smtp-Source: ABdhPJwjGtdQRc29lKLhwd+XFnY0aTIdP/fKM26BJVc2NCs6StmmoDyRYP4CLesmh6GLfsD7U7kehA==
X-Received: by 2002:a19:cb92:: with SMTP id b140mr2239964lfg.63.1592325522081; 
 Tue, 16 Jun 2020 09:38:42 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id w26sm4463879ljj.114.2020.06.16.09.38.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2020 09:38:41 -0700 (PDT)
Subject: Re: [PATCH v2] drm/tegra: Add zpos property for cursor planes
To: Thierry Reding <thierry.reding@gmail.com>
References: <20200616121713.2983627-1-thierry.reding@gmail.com>
 <c34c97ab-08de-341e-05e5-77e2651d956f@gmail.com>
 <20200616161341.GA3009091@ulmo>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <515daee1-464f-31ab-53c4-ec01fbf42c2d@gmail.com>
Date: Tue, 16 Jun 2020 19:38:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200616161341.GA3009091@ulmo>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 17 Jun 2020 07:26:03 +0000
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTYuMDYuMjAyMCAxOToxMywgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBPbiBUdWUsIEp1
biAxNiwgMjAyMCBhdCAwNjo1NDozNVBNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+
IDE2LjA2LjIwMjAgMTU6MTcsIFRoaWVycnkgUmVkaW5nINC/0LjRiNC10YI6Cj4+PiBGcm9tOiBU
aGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+Pj4KPj4+IEFzIG9mIGNvbW1pdCA0
ZGM1NTUyNWIwOTUgKCJkcm06IHBsYW5lOiBWZXJpZnkgdGhhdCBubyBvciBhbGwgcGxhbmVzCj4+
PiBoYXZlIGEgenBvcyBwcm9wZXJ0eSIpIGEgd2FybmluZyBpcyBlbWl0dGVkIGlmIHRoZXJlJ3Mg
YSBtaXggb2YgcGxhbmVzCj4+PiB3aXRoIGFuZCB3aXRob3V0IGEgenBvcyBwcm9wZXJ0eS4KPj4+
Cj4+PiBPbiBUZWdyYSwgY3Vyc29yIHBsYW5lcyBhcmUgYWx3YXlzIGNvbXBvc2l0ZWQgb24gdG9w
IG9mIGFsbCBvdGhlcgo+Pj4gcGxhbmVzLCB3aGljaCBpcyB3aHkgdGhleSBuZXZlciBoYWQgYSB6
cG9zIHByb3BlcnR5IGF0dGFjaGVkIHRvIHRoZW0uCj4+PiBIb3dldmVyLCBzaW5jZSB0aGUgY29t
cG9zaXRpb24gb3JkZXIgaXMgZml4ZWQsIHRoaXMgaXMgdHJpdmlhbCB0bwo+Pj4gcmVtZWR5IGJ5
IHNpbXBseSBhdHRhY2hpbmcgYW4gaW1tdXRhYmxlIHpwb3MgcHJvcGVydHkgdG8gdGhlbS4KPj4+
Cj4+PiBDaGFuZ2VzIGluIHYyOgo+Pj4gLSBoYXJkY29kZSBjdXJzb3IgcGxhbmUgenBvcyB0byAy
NTUgaW5zdGVhZCBvZiAwIChWaWxsZSkKPj4+Cj4+PiBSZXBvcnRlZC1ieTogSm9uYXRoYW4gSHVu
dGVyIDxqb25hdGhhbmhAbnZpZGlhLmNvbT4KPj4+IFNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVk
aW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4+PiAtLS0KPj4+ICBkcml2ZXJzL2dwdS9kcm0vdGVn
cmEvZGMuYyAgfCA5ICsrKysrKystLQo+Pj4gIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9odWIuYyB8
IDIgKy0KPj4+ICAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RjLmMgYi9kcml2
ZXJzL2dwdS9kcm0vdGVncmEvZGMuYwo+Pj4gaW5kZXggODNmMzFjNmU4OTFjLi44NTQwOGVlZDQ2
ODUgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuYwo+Pj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RjLmMKPj4+IEBAIC03ODcsNyArNzg3LDcgQEAgc3RhdGlj
IHN0cnVjdCBkcm1fcGxhbmUgKnRlZ3JhX3ByaW1hcnlfcGxhbmVfY3JlYXRlKHN0cnVjdCBkcm1f
ZGV2aWNlICpkcm0sCj4+PiAgCX0KPj4+ICAKPj4+ICAJZHJtX3BsYW5lX2hlbHBlcl9hZGQoJnBs
YW5lLT5iYXNlLCAmdGVncmFfcGxhbmVfaGVscGVyX2Z1bmNzKTsKPj4+IC0JZHJtX3BsYW5lX2Ny
ZWF0ZV96cG9zX3Byb3BlcnR5KCZwbGFuZS0+YmFzZSwgcGxhbmUtPmluZGV4LCAwLCAyNTUpOwo+
Pj4gKwlkcm1fcGxhbmVfY3JlYXRlX3pwb3NfcHJvcGVydHkoJnBsYW5lLT5iYXNlLCBwbGFuZS0+
aW5kZXgsIDAsIDI1NCk7Cj4+PiAgCj4+PiAgCWVyciA9IGRybV9wbGFuZV9jcmVhdGVfcm90YXRp
b25fcHJvcGVydHkoJnBsYW5lLT5iYXNlLAo+Pj4gIAkJCQkJCSBEUk1fTU9ERV9ST1RBVEVfMCwK
Pj4+IEBAIC05NTcsNiArOTU3LDcgQEAgc3RhdGljIHN0cnVjdCBkcm1fcGxhbmUgKnRlZ3JhX2Rj
X2N1cnNvcl9wbGFuZV9jcmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRybSwKPj4+ICAJfQo+Pj4g
IAo+Pj4gIAlkcm1fcGxhbmVfaGVscGVyX2FkZCgmcGxhbmUtPmJhc2UsICZ0ZWdyYV9jdXJzb3Jf
cGxhbmVfaGVscGVyX2Z1bmNzKTsKPj4+ICsJZHJtX3BsYW5lX2NyZWF0ZV96cG9zX2ltbXV0YWJs
ZV9wcm9wZXJ0eSgmcGxhbmUtPmJhc2UsIDI1NSk7Cj4+PiAgCj4+PiAgCXJldHVybiAmcGxhbmUt
PmJhc2U7Cj4+PiAgfQo+Pj4gQEAgLTEwNzQsNyArMTA3NSwxMSBAQCBzdGF0aWMgc3RydWN0IGRy
bV9wbGFuZSAqdGVncmFfZGNfb3ZlcmxheV9wbGFuZV9jcmVhdGUoc3RydWN0IGRybV9kZXZpY2Ug
KmRybSwKPj4+ICAJfQo+Pj4gIAo+Pj4gIAlkcm1fcGxhbmVfaGVscGVyX2FkZCgmcGxhbmUtPmJh
c2UsICZ0ZWdyYV9wbGFuZV9oZWxwZXJfZnVuY3MpOwo+Pj4gLQlkcm1fcGxhbmVfY3JlYXRlX3pw
b3NfcHJvcGVydHkoJnBsYW5lLT5iYXNlLCBwbGFuZS0+aW5kZXgsIDAsIDI1NSk7Cj4+PiArCj4+
PiArCWlmICghY3Vyc29yKQo+Pj4gKwkJZHJtX3BsYW5lX2NyZWF0ZV96cG9zX3Byb3BlcnR5KCZw
bGFuZS0+YmFzZSwgcGxhbmUtPmluZGV4LCAwLCAyNTQpOwo+Pj4gKwllbHNlCj4+PiArCQlkcm1f
cGxhbmVfY3JlYXRlX3pwb3NfaW1tdXRhYmxlX3Byb3BlcnR5KCZwbGFuZS0+YmFzZSwgMjU1KTsK
Pj4KPj4gT24gVDIwLzMwIHdlJ3JlIGFyZSBzZXR0aW5nIHRoZSBwbGFuZSdzIHR5cGUgdG8gQ1VS
U09SIGJlY2F1c2Ugd2Ugd2FudAo+PiB0byB1c2Ugb25lIG92ZXJsYXkgcGxhbmUgZm9yIHRoZSBt
b3VzZSBjdXJzb3IuIE5ldmVydGhlbGVzcywgaXQncyBzdGlsbAo+PiBhIGdlbmVyaWMgb3Zlcmxh
eSBwbGFuZSB0aGF0IGNhbiBjaGFuZ2UgaXRzIHotcG9zaXRpb24sIGFuZCB0aHVzLCBpdCdzCj4+
IHdyb25nIHRvIG1ha2UgenBvcyBpbW11dGFibGUgaGVyZS4KPiAKPiBCdXQgaXQgZG9lc24ndCBy
ZWFsbHkgbWFrZSBzZW5zZSBmb3IgdGhlIGN1cnNvciBwbGFuZSB0byBjaGFuZ2Ugei0KPiBwb3Np
dGlvbiwgZXZlbiBpZiBpdCdzIHRlY2huaWNhbGx5IHBvc3NpYmxlLiBXZSBkbyB3YW50IGl0IHRv
IGFsd2F5cyBiZQo+IG9uIHRvcCBhbnl3YXkuIERvaW5nIGl0IHRoaXMgd2F5IG1ha2VzIHRoZSBj
dXJzb3IgYmVoYXZlIHRoZSBzYW1lIHdheQo+IGlycmVzcGVjdGl2ZSBvZiB0aGUgVGVncmEgZ2Vu
ZXJhdGlvbiB0aGF0IHdlJ3JlIHJ1bm5pbmcgb24uCj4gCj4gWWVzLCB0aGF0IG1heSBub3QgZnVs
bHkgZXhwb3NlIHRoZSBjYXBhYmlsaXRpZXMgb2YgdGhlIGhhcmR3YXJlLCBidXQgd2UKPiBhcmUg
YWxyZWFkeSByZXN0cmljdGluZyB0aGUgaGFyZHdhcmUgY2FwYWJpbGl0aWVzIGJ5IGV4cG9zaW5n
IHRoZQo+IG92ZXJsYXkgcGxhbmUgYXMgYSBjdXJzb3IgcGxhbmUgaW4gdGhlIGZpcnN0IHBsYWNl
LgoKVXNlcnNwYWNlIGlzIGZyZWUgdG8gcmV1c2UgY3Vyc29yJ3MgcGxhbmUgZm9yIGRpZmZlcmVu
dCBwdXJwb3Nlcy4gRm9yCmV4YW1wbGUsIGN1cnNvciBtYXkgYmUgbm90IG5lZWRlZCBhdCBhbGwg
YW5kIHRoZW4gY3Vyc29yIHBsYW5lIGNvdWxkIGJlCnVzZWQgYXMgYSByZWd1bGFyIG92ZXJsYXkg
cGxhbmUuCgpUaGUgcGF0Y2gncyB0aXRsZSBhbmQgY29tbWl0J3MgZGVzY3JpcHRpb24gc2F5cyAi
KkFkZCogenBvcyBwcm9wZXJ0eSBmb3IKY3Vyc29yIHBsYW5lcyIsIGJ1dCBpbiB0aGlzIGNhc2Ug
enBvcyBwcm9wZXJ0eSBhbHJlYWR5IGV4aXN0ZWQgYmVmb3JlCnRoaXMgcGF0Y2gsIGhlbmNlIHlv
dSdyZSBjaGFuZ2luZyB0aGUgb2xkIGJlaGF2aW9yIGhlcmUuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
