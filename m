Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D4836CCA
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 09:04:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19516893C0;
	Thu,  6 Jun 2019 07:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF8C8930E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 12:40:31 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id s21so12347461lji.8
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 05:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F3z++oW2IhMf1GzZIotPJ3MBv9UbyrLqG9Y4gz4WZQ4=;
 b=p+RrWxaCX4ExlGyC9JCmhOekjPmgbault8hlKPlJNW3gKt45XGgYajWxldpZ2Hjceq
 7J+TIwnjTK+0vysRbLhuxoZp4+WwNJLZixabdzcxAphtqZfv8lN/XUWADyRfQETYRjkG
 c39W5zKuj1TDz5WcZo24z2/bx/HiXAv9/Cnl/IIgAQqXQxkcB0rz0ApU720z3gOV8uRg
 npZhTTqq9r+1S7eHfire8tN44Jmun5Pe8z7ydg2pbCPvPKbNj376OKoTuts3bm6uykkf
 t2BCQBPHogTMa7IuP/xuDKec8cKBruLtCWkyISmzBVAaBHvMwYpptMsaSWGxtINUVo/x
 9rGA==
X-Gm-Message-State: APjAAAVzvpltwNacxhpSSJX/fXvoR2xM2IvvmEzp4Gc/v4INzLshXysJ
 RKJIWXLESZHz+w2Q3F9VRoh36NuI
X-Google-Smtp-Source: APXvYqwYTtGzhqh+0GiYfqc6mnUR1wFzn9JInJTf9okH1F98QuT9sANak87M24pwKwB+myjqfQxfMg==
X-Received: by 2002:a2e:95d5:: with SMTP id y21mr3747681ljh.84.1559738430123; 
 Wed, 05 Jun 2019 05:40:30 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.35.141])
 by smtp.googlemail.com with ESMTPSA id u10sm4651043lfu.18.2019.06.05.05.40.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Jun 2019 05:40:29 -0700 (PDT)
Subject: Re: [PATCH] gpu: host1x: Do not output error message for deferred
 probe
To: Thierry Reding <thierry.reding@gmail.com>
References: <20190604153150.22265-1-thierry.reding@gmail.com>
 <21c2443c-9166-edc0-5d7b-46b9e3c48e70@gmail.com>
 <20190605082848.GB10944@ulmo>
 <1654b4cb-930c-dbc7-b40d-1f854ff2ac69@gmail.com> <20190605123226.GA724@ulmo>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <60f6e811-e4de-7bc6-fc9d-53a8bb8aff53@gmail.com>
Date: Wed, 5 Jun 2019 15:40:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190605123226.GA724@ulmo>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 06 Jun 2019 07:03:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=F3z++oW2IhMf1GzZIotPJ3MBv9UbyrLqG9Y4gz4WZQ4=;
 b=ZNpomXs+e7K4V0UYU/JcvfauHnAQn+2+/7m6uu7jLqSk8Ox/52l8y5XBYjYLb08eRY
 GREfhFm78JlkpnKYRV5GavYecCSXrTy5NwUnoD8AEMWbtW556mGxtyZ8DWT7oiMlW23A
 fRYktfLaPNLrsd4Cnm7QsEnQAKvZr11OF21gTz+uYcFVP3A3bhZDZxECG7bysnJwJSA/
 yZtXOVnnHuVZZnIr+Q6/9hiJ69ZfiQNKwXAMlk9ZglgBv4Y3rBCmGuAuapgrTVVxiqBV
 V6q00LqU9KXuT3Hs0Nt7X0wjXVLw/Zmij6Uhy8VwWWuG9LK9Ucy1ePjxgVVc8P7T0RZr
 SZGQ==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDUuMDYuMjAxOSAxNTozMiwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBPbiBXZWQsIEp1
biAwNSwgMjAxOSBhdCAwMjoyNTo0M1BNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+
IDA1LjA2LjIwMTkgMTE6MjgsIFRoaWVycnkgUmVkaW5nINC/0LjRiNC10YI6Cj4+PiBPbiBUdWUs
IEp1biAwNCwgMjAxOSBhdCAwNzowNzo0MlBNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6
Cj4+Pj4gMDQuMDYuMjAxOSAxODozMSwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPj4+Pj4g
RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPj4+Pj4KPj4+Pj4gV2hl
biBkZWZlcnJpbmcgcHJvYmUsIGF2b2lkIGxvZ2dpbmcgYSBjb25mdXNpbmcgZXJyb3IgbWVzc2Fn
ZS4gV2hpbGUgYXQKPj4+Pj4gaXQsIG1ha2UgdGhlIGVycm9yIG1lc3NhZ2UgbW9yZSBpbmZvcm1h
dGlvbmFsLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGlu
Z0BudmlkaWEuY29tPgo+Pj4+PiAtLS0KPj4+Pj4gIGRyaXZlcnMvZ3B1L2hvc3QxeC9kZXYuYyB8
IDUgKysrKy0KPj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2hvc3QxeC9kZXYuYyBi
L2RyaXZlcnMvZ3B1L2hvc3QxeC9kZXYuYwo+Pj4+PiBpbmRleCBjNTVlMmQ2MzQ4ODcuLjVhM2Y3
OTcyNDBkNCAxMDA2NDQKPj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvaG9zdDF4L2Rldi5jCj4+Pj4+
ICsrKyBiL2RyaXZlcnMvZ3B1L2hvc3QxeC9kZXYuYwo+Pj4+PiBAQCAtMjQ3LDggKzI0NywxMSBA
QCBzdGF0aWMgaW50IGhvc3QxeF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+
Pj4+PiAgCj4+Pj4+ICAJaG9zdC0+Y2xrID0gZGV2bV9jbGtfZ2V0KCZwZGV2LT5kZXYsIE5VTEwp
Owo+Pj4+PiAgCWlmIChJU19FUlIoaG9zdC0+Y2xrKSkgewo+Pj4+PiAtCQlkZXZfZXJyKCZwZGV2
LT5kZXYsICJmYWlsZWQgdG8gZ2V0IGNsb2NrXG4iKTsKPj4+Pj4gIAkJZXJyID0gUFRSX0VSUiho
b3N0LT5jbGspOwo+Pj4+PiArCj4+Pj4+ICsJCWlmIChlcnIgIT0gLUVQUk9CRV9ERUZFUikKPj4+
Pj4gKwkJCWRldl9lcnIoJnBkZXYtPmRldiwgImZhaWxlZCB0byBnZXQgY2xvY2s6ICVkXG4iLCBl
cnIpOwo+Pj4+PiArCj4+Pj4+ICAJCXJldHVybiBlcnI7Cj4+Pj4+ICAJfQo+Pj4+Cj4+Pj4gVGhl
IGNsb2NrIGRyaXZlciBzaG91bGQgYmUgYXZhaWxhYmxlIGF0IHRoZSB0aW1lIG9mIGhvc3QxeCdz
IHByb2Jpbmcgb24KPj4+PiBhbGwgVGVncmEncyBiZWNhdXNlIGl0IGlzIG9uZSBvZiBlc3NlbnRp
YWwgY29yZSBkcml2ZXJzIHRoYXQgYmVjb21lCj4+Pj4gYXZhaWxhYmxlIGVhcmx5IGR1cmluZyBi
b290Lgo+Pj4KPj4+IFRoYXQncyB0aGUgY3VycmVudGx5IGJha2VkLWluIGFzc3VtcHRpb24uIEhv
d2V2ZXIsIHRoZXJlIGNhbiBiZSBhbnkKPj4+IG51bWJlciBvZiByZWFzb25zIGZvciB3aHkgdGhl
IGNsb2NrcyBtYXkgbm90IHNob3cgdXAgYXMgZWFybHkgYXMKPj4+IGV4cGVjdGVkLCBhcyBldmlk
ZW5jZWQgaW4gdGhlIGNhc2Ugb2YgVGVncmExODYuCj4+Pgo+Pj4+IEkgZ3Vlc3MgeW91J3JlIG1h
a2luZyB0aGlzIGNoYW5nZSBmb3IgVDE4NiwgaXMgaXQgYmVjYXVzZSB0aGUgQlBNUAo+Pj4+IGRy
aXZlcidzIHByb2JlIGdldHRpbmcgZGVmZXJyZWQ/IElmIHllcywgd29uJ3QgaXQgYmUgcG9zc2li
bGUgdG8gZml4IHRoZQo+Pj4+IGRlZmVyIG9mIHRoZSBjbG9jayBkcml2ZXIgaW5zdGVhZCBvZiBt
YWtpbmcgc3VjaCBjaGFuZ2VzIGluIHRoZSBhZmZlY3RlZAo+Pj4+IGRyaXZlcnM/Cj4+Pgo+Pj4g
VGhlIHJlYXNvbiB3aHkgdGhpcyBpcyBub3cgaGFwcGVuaW5nIG9uIFRlZ3JhMTg2IGlzIGJlY2F1
c2UgdGhlIEJQTVAgaXMKPj4+IGJvdW5kIHRvIGFuIElPTU1VIHRvIGF2b2lkIGdldHRpbmcgZmF1
bHRzIGZyb20gdGhlIG5ldyBuby1ieXBhc3MgcG9saWN5Cj4+PiB0aGF0IHRoZSBBUk0gU01NVSBk
cml2ZXIgaXMgaW1wbGVtZW50aW5nIGFzIG9mIHY1LjItcmMxLgo+Pj4KPj4+IEFzIGEgcmVzdWx0
IG9mIGJpbmRpbmcgdG8gYW4gSU9NTVUsIHRoZSBmaXJzdCBwcm9iZSBvZiB0aGUgQlBNUCBkcml2
ZXIKPj4+IHdpbGwgZ2V0IGRlZmVycmVkLCBzbyBhbnkgZHJpdmVyIHRyeWluZyB0byByZXF1ZXN0
IGEgY2xvY2sgYWZ0ZXIgdGhhdAo+Pj4gYW5kIGJlZm9yZSBCUE1QIGdldHMgcHJvYmVkIHN1Y2Nl
c3NmdWxseSB0aGUgbmV4dCB0aW1lLCBhbnkgY2xrX2dldCgpCj4+PiBjYWxscyB3aWxsIGZhaWwg
d2l0aCAtRVBST0JFX0RFRkVSLgo+Pj4KPj4+IFRoaXMgaXMgYSBiaXQgdW5mb3J0dW5hdGUsIGJ1
dCBsaWtlIEkgc2FpZCwgdGhlc2Uga2luZHMgb2YgdGhpbmdzIGNhbgo+Pj4gaGFwcGVuLCBhbmQg
cHJvYmUgZGVmZXJyYWwgd2FzIGRlc2lnbmVkIHNwZWNpZmljYWxseSB0byBkZWFsIHdpdGggdGhh
dAo+Pj4ga2luZCBvZiBzaXR1YXRpb24gc28gdGhhdCB3ZSB3b3VsZG4ndCBoYXZlIHRvIHJlbHkg
b24gYWxsIG9mIHRoZXNlCj4+PiBidWlsdC1pbiBhc3N1bXB0aW9ucyB0aGF0IG9jY2FzaW9uYWxs
eSBicmVhay4KPj4+Cj4+PiBUaGUgZHJpdmVyIGFsc28gYWxyZWFkeSBoYW5kbGVzIGRlZmVycmVk
IHByb2JlIHByb3Blcmx5LiBUaGUgb25seSB0aGluZwo+Pj4gdGhhdCB0aGlzIHBhdGNoIHJlYWxs
eSBjaGFuZ2VzIGlzIHRvIG5vIGxvbmdlciBjb25zaWRlciAtRVBST0JFX0RFRkVSIGFuCj4+PiBl
cnJvci4gSXQncyBpbiBmYWN0IGEgcHJldHR5IGNvbW1vbiBzaXR1YXRpb24gaW4gbWFueSBkcml2
ZXJzIGFuZCBzaG91bGQKPj4+IG5vdCB3YXJyYW50IGEga2VybmVsIGxvZyBtZXNzYWdlLgo+Pgo+
PiBZb3UncmUgdHJ5aW5nIHRvIG1hc2sgc3ltcHRvbXMgaW5zdGVhZCBvZiBjdXJpbmcgdGhlIGRl
Y2Vhc2UgYW5kIGl0IGxvb2tzCj4+IGxpa2UgdGhlIGRlY2Vhc2UgY291bGQgYmUgY3VyZWQuCj4g
Cj4gVGhlcmUncyBub3RoaW5nIGhlcmUgdG8gY3VyZS4gLUVQUk9CRV9ERUZFUiB3YXMgZGVzaWdu
ZWQgc3BlY2lmaWNhbGx5IHRvCj4gYXZvaWQgaGF2aW5nIHRvIHBsYXkgdGhlc2Uga2luZHMgb2Yg
Z2FtZXMgd2l0aCBpbml0Y2FsbCBsZXZlbHMuCj4gCj4gV2hhdCB0aGlzIHBhdGNoIHRyaWVzIHRv
IGRvIGlzIGp1c3QgdG8gYXZvaWQgcHJpbnRpbmcgYW4gZXJyb3IgbWVzc2FnZQo+IGZvciBzb21l
dGhpbmcgdGhhdCBpcyBub3QgYW4gZXJyb3IuIC1FUFJPQkVfREVGRVIgaXMgdG90YWxseSBleHBl
Y3RlZCB0bwo+IGhhcHBlbiwgaXQncyBub3JtYWwsIGl0J3Mgbm90IHNvbWV0aGluZyB0aGF0IHdl
IHNob3VsZCBib3RoZXIgdXNlcnMgd2l0aAo+IGJlY2F1c2UgdGhpbmdzIGVuZCB1cCBzb3J0aW5n
IHRoZW1zZWx2ZXMgb3V0IGluIHRoZSBlbmQuCj4gCj4+IFdvbid0IHNvbWV0aGluZyBsaWtlIHRo
aXMgd29yayBmb3IgeW91Pwo+IAo+IEknbSBzdXJlIHdlIGNvdWxkIGZpbmQgYSBudW1iZXIgb2Yg
d2F5cyB0byBmaXggdGhpcy4gQnV0IHRoZXJlJ3Mgbm8gbmVlZAo+IHRvIGZpeCB0aGlzIGJlY2F1
c2UgaXQncyBub3QgYnJva2VuLiBXaGF0IGlzIGJyb2tlbiBpcyB0aGF0IHdlIG91dHB1dCBhbgo+
IGVycm9yIG1lc3NhZ2Ugd2hlbiB0aGlzIGhhcHBlbnMgYW5kIG1ha2UgYW4gZWxlcGhhbnQgb3V0
IG9mIGEgZmx5LgoKU3VyZSwgdGhpcyBpcyBhYnNvbHV0ZWx5IG5vdCBjcml0aWNhbCBhbmQgZGVm
ZXJyZWQgcHJvYmUgaXMgZG9pbmcgaXRzIGpvYi4KQnV0IGRvbid0IHlvdSBhZ3JlZSB0aGF0IGl0
J3MgYmV0dGVyIHRvIGZpeCB0aGUgcm9vdCBvZiB0aGUgYW5ub3lhbmNlIG9uY2UKYW5kIGZvciBh
bGw/CgpXb3VsZCBiZSBhd2Vzb21lIGlmIHlvdSBjb3VsZCBnaXZlIGEgd2hpcmwgdG8gdGhlIHBh
dGNoZXMgdGhhdCBJJ20gc3VnZ2VzdGluZy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
