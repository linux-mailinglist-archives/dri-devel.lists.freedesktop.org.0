Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD00C315566
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 18:52:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDEE46EADB;
	Tue,  9 Feb 2021 17:52:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E9246EADB
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 17:52:48 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id m1so4351886wml.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Feb 2021 09:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qurygo4Yly3E1f1TWQ/u0Ebw8nzovdEmMUxw2+PKiCo=;
 b=K35gV+8NMJSWwwxDrkLuHwrWWuHpkmJkmG4mvkTBKjTAaGngMJCLk5NZ/hTQ4U4LL6
 qRMkICzaKw/y171PpJTFQqr9T+a6vhtnGWfCTQ6hB1maXAS6vSw8jm5q57LQmusLAEtq
 h2EjKTzOaINuT+DiBTluDESqMOm8eMPz7EQW65rFigeH8Fqgtro1IEtFjrEyigKBDx7J
 intSDB7+hXaetanspdaqRq5Gm5JRn1H/Gb0dDZi29GSZSIBkJHZV1XeFiT2tkv+gIthJ
 0tLJ87YnrUp1AwZlT1YgHVI2+ompMTtfyCg51ddCb2p3S35Mt19EqT2m0IwMtaUhaJI7
 AFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qurygo4Yly3E1f1TWQ/u0Ebw8nzovdEmMUxw2+PKiCo=;
 b=arU0eqmXmVv0YRYahyD+YfmMAkUxZVRbLGlNtg3K1aOCcpFpxfiCnfjxmd11UT/6xA
 dMGeHPhfMnGmmRoktip+Y13S48k8tsaCGithJ0r6q7TtPwER8qCXCwWKtx0gVJvRZI2O
 BHqQSqfSEG6vQw/L1F9D3hfnd0vaopFrE5RRy0jCLFZyjVouMVqv0heX998CfLHuvXtY
 bL+1EPk4Gozo4vkLS5owS6+pwdAqUX7GSsequf5AJCmyCYlp8Wk+vG1o/karDfb4mhUU
 jb+8twEn0KKNWyuEIaT+/r4EM726iVIqwLZtIshRy4p5jJ6Yaug5Dpm4GuU2MSeCr0Dt
 AQQQ==
X-Gm-Message-State: AOAM530wbFJV3E9j5E6zyP5mHan2obGq8f5ASH22eLDbR2qEkctXdK+t
 fb0dS5Cj36TEGnDUAcNAiS4fZ66mTa4S5CdFrKhekA==
X-Google-Smtp-Source: ABdhPJw/ZzytWg5CW789jXtqWr/Y1tuEN+eZ9OSIglt0n9y2jznG7vlnoXKyR+aJ+kNl/OAcTgGKefXnuLeCi6HOwfU=
X-Received: by 2002:a05:600c:4e92:: with SMTP id
 f18mr4467411wmq.126.1612893166675; 
 Tue, 09 Feb 2021 09:52:46 -0800 (PST)
MIME-Version: 1.0
References: <20210205080621.3102035-1-john.stultz@linaro.org>
 <20210205080621.3102035-2-john.stultz@linaro.org>
 <4471b3b0-603e-6dbb-8064-ff4a95afbba9@amd.com>
 <CALAqxLWZkUFvJX5r2OU2erW4tU3j=+u==VTyzYkt+95LwwVCUA@mail.gmail.com>
 <48225879-2fe1-22ac-daae-c61d52465aea@amd.com>
 <a9dd7f8a-ef30-9eb4-4834-37801d43b96f@amd.com>
 <CAJuCfpE-T4Cs_h6LfrgHE+T_iOVywU2oNzLquYETudOaBMauMQ@mail.gmail.com>
 <c7df099f-27f7-adc6-4e87-9903ac00cbea@amd.com>
In-Reply-To: <c7df099f-27f7-adc6-4e87-9903ac00cbea@amd.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 9 Feb 2021 09:52:35 -0800
Message-ID: <CAJuCfpHrvv8PAWdSMPK-=mtrgje9LrrNC-NC81=T5S+4YOw63w@mail.gmail.com>
Subject: Re: [RFC][PATCH v6 1/7] drm: Add a sharable drm page-pool
 implementation
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Sandeep Patil <sspatil@google.com>, Ezequiel Garcia <ezequiel@collabora.com>,
 James Jones <jajones@nvidia.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@kernel.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
 linux-media <linux-media@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBGZWIgOSwgMjAyMSBhdCA5OjQ2IEFNIENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4KPgo+Cj4gQW0gMDkuMDIuMjEgdW0gMTg6MzMgc2No
cmllYiBTdXJlbiBCYWdoZGFzYXJ5YW46Cj4gPiBPbiBUdWUsIEZlYiA5LCAyMDIxIGF0IDQ6NTcg
QU0gQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPiA+
PiBBbSAwOS4wMi4yMSB1bSAxMzoxMSBzY2hyaWViIENocmlzdGlhbiBLw7ZuaWc6Cj4gPj4+IFtT
TklQXQo+ID4+Pj4+PiArdm9pZCBkcm1fcGFnZV9wb29sX2FkZChzdHJ1Y3QgZHJtX3BhZ2VfcG9v
bCAqcG9vbCwgc3RydWN0IHBhZ2UgKnBhZ2UpCj4gPj4+Pj4+ICt7Cj4gPj4+Pj4+ICsgICAgIHNw
aW5fbG9jaygmcG9vbC0+bG9jayk7Cj4gPj4+Pj4+ICsgICAgIGxpc3RfYWRkX3RhaWwoJnBhZ2Ut
PmxydSwgJnBvb2wtPml0ZW1zKTsKPiA+Pj4+Pj4gKyAgICAgcG9vbC0+Y291bnQrKzsKPiA+Pj4+
Pj4gKyAgICAgYXRvbWljX2xvbmdfYWRkKDEgPDwgcG9vbC0+b3JkZXIsICZ0b3RhbF9wYWdlcyk7
Cj4gPj4+Pj4+ICsgICAgIHNwaW5fdW5sb2NrKCZwb29sLT5sb2NrKTsKPiA+Pj4+Pj4gKwo+ID4+
Pj4+PiArICAgICBtb2Rfbm9kZV9wYWdlX3N0YXRlKHBhZ2VfcGdkYXQocGFnZSksCj4gPj4+Pj4+
IE5SX0tFUk5FTF9NSVNDX1JFQ0xBSU1BQkxFLAo+ID4+Pj4+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgIDEgPDwgcG9vbC0+b3JkZXIpOwo+ID4+Pj4+IEh1aSB3aGF0PyBXaGF0IHNob3VsZCB0
aGF0IGJlIGdvb2QgZm9yPwo+ID4+Pj4gVGhpcyBpcyBhIGNhcnJ5b3ZlciBmcm9tIHRoZSBJT04g
cGFnZSBwb29sIGltcGxlbWVudGF0aW9uOgo+ID4+Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3Mu
cHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZ2l0Lmtlcm5lbC5vcmcl
MkZwdWIlMkZzY20lMkZsaW51eCUyRmtlcm5lbCUyRmdpdCUyRnRvcnZhbGRzJTJGbGludXguZ2l0
JTJGdHJlZSUyRmRyaXZlcnMlMkZzdGFnaW5nJTJGYW5kcm9pZCUyRmlvbiUyRmlvbl9wYWdlX3Bv
b2wuYyUzRmglM0R2NS4xMCUyM24yOCZhbXA7ZGF0YT0wNCU3QzAxJTdDY2hyaXN0aWFuLmtvZW5p
ZyU0MGFtZC5jb20lN0NkY2NjY2ZmOGVkY2Q0ZDE0N2E1YjA4ZDhjZDIwY2ZmMiU3QzNkZDg5NjFm
ZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2Mzc0ODQ4ODgxMTQ5MjM1ODAlN0NV
bmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklp
TENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9OSUyQklCQzB0
ZXpTVjZDaTRTM2tXZlclMkJRdkptNG1kdW5uM2RGNkMwa3lmQ3clM0QmYW1wO3Jlc2VydmVkPTAK
PiA+Pj4+Cj4gPj4+Pgo+ID4+Pj4gTXkgc2Vuc2UgaXMgaXQgaGVscHMgd2l0aCB0aGUgdm1zdGF0
L21lbWluZm8gYWNjb3VudGluZyBzbyBmb2xrcyBjYW4KPiA+Pj4+IHNlZSB0aGUgY2FjaGVkIHBh
Z2VzIGFyZSBzaHJpbmthYmxlL2ZyZWVhYmxlLiBUaGlzIG1heWJlIGZhbGxzIHVuZGVyCj4gPj4+
PiBvdGhlciBkbWFidWYgYWNjb3VudGluZy9zdGF0cyBkaXNjdXNzaW9ucywgc28gSSdtIGhhcHB5
IHRvIHJlbW92ZSBpdAo+ID4+Pj4gZm9yIG5vdywgb3IgbGV0IHRoZSBkcml2ZXJzIHVzaW5nIHRo
ZSBzaGFyZWQgcGFnZSBwb29sIGxvZ2ljIGhhbmRsZQo+ID4+Pj4gdGhlIGFjY291bnRpbmcgdGhl
bXNlbHZlcz8KPiA+PiBJbnRlbnRpb25hbGx5IHNlcGFyYXRlZCB0aGUgZGlzY3Vzc2lvbiBmb3Ig
dGhhdCBoZXJlLgo+ID4+Cj4gPj4gQXMgZmFyIGFzIEkgY2FuIHNlZSB0aGlzIGlzIGp1c3QgYmx1
bnRseSBpbmNvcnJlY3QuCj4gPj4KPiA+PiBFaXRoZXIgdGhlIHBhZ2UgaXMgcmVjbGFpbWFibGUg
b3IgaXQgaXMgcGFydCBvZiBvdXIgcG9vbCBhbmQgZnJlZWFibGUKPiA+PiB0aHJvdWdoIHRoZSBz
aHJpbmtlciwgYnV0IG5ldmVyIGV2ZXIgYm90aC4KPiA+IElJUkMgdGhlIG9yaWdpbmFsIG1vdGl2
YXRpb24gZm9yIGNvdW50aW5nIElPTiBwb29sZWQgcGFnZXMgYXMKPiA+IHJlY2xhaW1hYmxlIHdh
cyB0byBpbmNsdWRlIHRoZW0gaW50byAvcHJvYy9tZW1pbmZvJ3MgTWVtQXZhaWxhYmxlCj4gPiBj
YWxjdWxhdGlvbnMuIE5SX0tFUk5FTF9NSVNDX1JFQ0xBSU1BQkxFIGRlZmluZWQgYXMgInJlY2xh
aW1hYmxlCj4gPiBub24tc2xhYiBrZXJuZWwgcGFnZXMiIHNlZW1zIGxpa2UgYSBnb29kIHBsYWNl
IHRvIGFjY291bnQgZm9yIHRoZW0gYnV0Cj4gPiBJIG1pZ2h0IGJlIHdyb25nLgo+Cj4gWWVhaCwg
dGhhdCdzIHdoYXQgSSBzZWUgaGVyZSBhcyB3ZWxsLiBCdXQgZXhhY3RseSB0aGF0IGlzIHV0dGVy
bHkgbm9uc2Vuc2UuCj4KPiBUaG9zZSBwYWdlcyBhcmUgbm90ICJmcmVlIiBpbiB0aGUgc2Vuc2Ug
dGhhdCBnZXRfZnJlZV9wYWdlIGNvdWxkIHJldHVybgo+IHRoZW0gZGlyZWN0bHkuCgpBbnkgaWRl
YXMgd2hlcmUgdGhlc2UgcGFnZXMgd291bGQgZml0IGJldHRlcj8gV2UgZG8gd2FudCB0byBrbm93
IHRoYXQKdW5kZXIgbWVtb3J5IHByZXNzdXJlIHRoZXNlIHBhZ2VzIGNhbiBiZSBtYWRlIGF2YWls
YWJsZSAod2hpY2ggaXMgSQp0aGluayB3aGF0IE1lbUF2YWlsYWJsZSBtZWFucykuCgo+Cj4gUmVn
YXJkcywKPiBDaHJpc3RpYW4uCj4KPiA+Cj4gPj4gSW4gdGhlIGJlc3QgY2FzZSB0aGlzIGp1c3Qg
bWVzc2VzIHVwIHRoZSBhY2NvdW50aW5nLCBpbiB0aGUgd29yc3QgY2FzZQo+ID4+IGl0IGNhbiBj
YXVzZSBtZW1vcnkgY29ycnVwdGlvbi4KPiA+Pgo+ID4+IENocmlzdGlhbi4KPgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
