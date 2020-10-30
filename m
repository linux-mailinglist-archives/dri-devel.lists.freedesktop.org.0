Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3AB2A205F
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 18:37:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80CC86EB22;
	Sun,  1 Nov 2020 17:36:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD936EDBC;
 Fri, 30 Oct 2020 11:19:13 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id t11so6161250edj.13;
 Fri, 30 Oct 2020 04:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0Bio/v4ZtLiE540NPLGsg4zm25sQfEKR1TzDT+ehFjU=;
 b=QCqN2JeZ6j0DKHQQS+CXVkzwXNCyGppBlDRFLsJCyR2l9dE5eFsvnEHprWAVITNHe/
 b50Q3kEgVDD6NwuI5vvun1/5aoLMKNHH51y7ZLfS1xhQ+D37ky96V5fQeosYD+GWrICj
 d+CCE0RDtC32PSHk2wOC8lPM8MrktC1Cp8yLSN+NrL3hmuUwEC8jVFDPyQ0jwl4gfFV4
 I5cpmUk1hOO+SkpJ7HNfSnGq1yy7UY3H5jYdk/NX4TlFhvKX1Z9d9Oxj+o3gf8WH20XY
 uey60IW6twCqrClT/hVDpxRC10ZVYHM1axzHd4hPxiMUQ17T/vSBCFEkC8Wd3M0WaUIv
 8NTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0Bio/v4ZtLiE540NPLGsg4zm25sQfEKR1TzDT+ehFjU=;
 b=UasT21Qa+lLoKDslRrSouC9QwpwxPDqVQYBOhc4kjeNKsVkPmoVy9f2jk7jIZ8M1/R
 Xkj6ayI1aOlpDepFUcq0SVg9TH2mjAFGlPdAeDaTc+iIAlAkREEFKJcCzDx9pzYny6Ii
 uJhjZcTdB6y8Md2bqEdISRgYIOxJuyoxrYU3bjaucOfSzQ1V6UAtywJQKxV6dTpEl424
 SO8bHc7Vc+Kaw1ksyCePcZ5YAd+jixYIFJdQVXB39txx2Kf/fI4IynWZFtR2UdPGRlAd
 MVtwsVJbqXDnZdfom6ZzS9chAOKRsv0yfTjle7+2uMCXNoaX+vV7YDVzvamdOc691Fw3
 vU/A==
X-Gm-Message-State: AOAM5318MRevoXa7l09En07DBZt5Prg86rlHE6cd6aArGFZ2sUhTIwMp
 4KngOXOU80YTMlPLCSXzT9IQlD+jXzuTmPWSWfw=
X-Google-Smtp-Source: ABdhPJwvqEm5pZuWmeOrmp8SDuL5ILCfj40cZZI7zsZuebllxG6q1P0isA2txHkQgJiWvHzXhJYWWc31Zq+h4UhXDNA=
X-Received: by 2002:a50:9e82:: with SMTP id a2mr1681188edf.117.1604056752432; 
 Fri, 30 Oct 2020 04:19:12 -0700 (PDT)
MIME-Version: 1.0
References: <20201012135517.19468-1-frank@allwinnertech.com>
 <20201012135517.19468-3-frank@allwinnertech.com>
 <20201028102942.zc5hgqpo2bfrn6in@vireshk-i7>
 <CAEExFWvNgK2wbvmxZjsJR4g-VBq=ggsBLew77rzmNdkpqTRuDA@mail.gmail.com>
 <20201028144628.qm2t2hbzmouqkciy@vireshk-i7>
In-Reply-To: <20201028144628.qm2t2hbzmouqkciy@vireshk-i7>
From: Frank Lee <tiny.windzz@gmail.com>
Date: Fri, 30 Oct 2020 19:19:00 +0800
Message-ID: <CAEExFWtYrT3psuLC0fd7cX2GrmPaYxqZK65OLUv+2s97ehz97g@mail.gmail.com>
Subject: Re: [PATCH 2/3] opp: Add devres wrapper for dev_pm_opp_set_prop_name
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Mailman-Approved-At: Sun, 01 Nov 2020 17:36:56 +0000
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
Cc: Nishanth Menon <nm@ti.com>, freedreno@lists.freedesktop.org,
 Frank Lee <frank@allwinnertech.com>, airlied@linux.ie,
 Viresh Kumar <vireshk@kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, dri-devel@lists.freedesktop.org,
 gustavoars@kernel.org, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, kholk11@gmail.com, Sean Paul <sean@poorly.run>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 emil.velikov@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMjgsIDIwMjAgYXQgMTA6NDYgUE0gVmlyZXNoIEt1bWFyIDx2aXJlc2gua3Vt
YXJAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiAyOC0xMC0yMCwgMTk6MDIsIEZyYW5rIExlZSB3
cm90ZToKPiA+IE9uIFdlZCwgT2N0IDI4LCAyMDIwIGF0IDY6MjkgUE0gVmlyZXNoIEt1bWFyIDx2
aXJlc2gua3VtYXJAbGluYXJvLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIDEyLTEwLTIwLCAy
MTo1NSwgRnJhbmsgTGVlIHdyb3RlOgo+ID4gPiA+IEZyb206IFlhbmd0YW8gTGkgPHRpbnkud2lu
ZHp6QGdtYWlsLmNvbT4KPiA+ID4gPgo+ID4gPiA+IEFkZCBkZXZyZXMgd3JhcHBlciBmb3IgZGV2
X3BtX29wcF9zZXRfcHJvcF9uYW1lKCkgdG8gc2ltcGxpZnkgZHJpdmVyCj4gPiA+ID4gY29kZS4K
PiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFlhbmd0YW8gTGkgPHRpbnkud2luZHp6QGdt
YWlsLmNvbT4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBZYW5ndGFvIExpIDxmcmFua0BhbGx3aW5u
ZXJ0ZWNoLmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgZHJpdmVycy9vcHAvY29yZS5jICAgICB8
IDM5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gPiA+ICBpbmNs
dWRlL2xpbnV4L3BtX29wcC5oIHwgIDYgKysrKysrCj4gPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwg
NDUgaW5zZXJ0aW9ucygrKQo+ID4gPgo+ID4gPiBPbiBhIHNlY29uZCB0aG91Z2h0IEkgYW0gbG9v
a2luZyBhdCBkcm9wcGluZyB0aGlzIG9uZSBhcyB5b3UgaGF2ZW4ndAo+ID4gPiBhZGRlZCBhbnkg
dXNlcnMgeWV0IGFuZCBJIGFtIGFmcmFpZCBpdCB3aWxsIHN0YXkgdW51c2VkLgo+ID4KPiA+IE5v
dyBpdCBsb29rcyBsaWtlIHRoYXQgZGV2X3BtX29wcF9zZXRfcHJvcF9uYW1lKCkgaXMgdXNlZCBy
ZWxhdGl2ZWx5IGxlc3MuCj4gPiBNYXliZSB3ZSBjYW4gd2FpdCB1bnRpbCBhIGNhbGxlciwgYW5k
IHRoZW4gcGljayB1cCB0aGUgcGF0Y2guCj4KPiBJIGFtIGV2ZW4gd29uZGVyaW5nIGlmIHdlIHNo
b3VsZCBiZSBhZGRpbmcgYW55IG9mIHRoZSBkZXZtXyogaGVscGVycwo+IGZvciBub3cgdG8gYmUg
aG9uZXN0LiBFdmVuIGZvciB0aGUgb3RoZXIgb25lIHdlIGhhdmUgb25seSBvbmUgdXNlci4KPiBU
aGVtIG1ham9yIHVzZXIgb2YgdGhlIE9QUCBjb3JlIGlzIHRoZSBDUFUgc3Vic3lzdGVtIGFuZCBp
dCBpcyBuZXZlcgo+IGdvaW5nIHRvIHVzZSB0aGVzZSBkZXZtXyogaGVscGVycyBhcyB0aGUgQ1BV
IGRldmljZSBkb2Vzbid0IGdldCBib3VuZAo+IHRvIGEgZHJpdmVyLCBpdCBpcyByYXRoZXIgYSBm
YWtlIHBsYXRmb3JtIGRldmljZSB3aGljaCBnZXRzIHRoZQo+IGNwdWZyZXEgZHJpdmVycyBwcm9i
ZWQuIFNvIHRoZSBvbmx5IHVzZXJzIG9mIHRoZXNlIGRldm1fKiBoZWxwZXJzIGlzCj4gZ29pbmcg
dG8gYmUgbm9uLUNQVSBkZXZpY2VzLiBDb25zaWRlcmluZyB0aGF0IHdlIGhhdmUgb25seSBvbmUg
dXNlcgo+IHJpZ2h0IG5vdywgaXQgbWF5IGJlIGJldHRlciB0byBqdXN0IGZpeCBpdCBpbnN0ZWFk
IG9mIGFkZGluZyBhbnkgb2YKPiB0aGUgZGV2bV8qIGhlbHBlcnMuCgpHUFUgaXMgYWxzbyBhIHJl
bGF0aXZlbHkgbGFyZ2UgbnVtYmVyIG9mIG9wcCBjb25zdW1lcnMuCk1vc3Qgb2YgdGhlIHRpbWUs
IHRoZSBkZXZfcG1fb3BwX3NldF8qIGZ1bmN0aW9ucyB3aWxsIG9ubHkgYmUgc2V0IG9uY2UuCklm
IGRvbid0IG5lZWQgdGhlIGRyaXZlciB0byBkeW5hbWljYWxseSBtYW5hZ2UgYW5kIHJlbGVhc2Ug
dGhlIG9wcCwgaXQKbWF5IGJlIE9L77yfCgpZYW5ndGFvCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
