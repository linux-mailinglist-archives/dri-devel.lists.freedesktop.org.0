Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6801A7446
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 09:07:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 967276E487;
	Tue, 14 Apr 2020 07:06:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4841C89FA7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 17:29:05 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id s18so6824266ioe.10
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 10:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GM+yN/jrRse2ioNNBGH5SQs0AMwRsnLkkraZtwr6CoY=;
 b=crec7vuGJUFCG6HZ8oF3y83LTntbWyX/4L3lni+1zG/o8PgBmLyzOfBzHz6qnL6tSj
 l+l9LpJa679B/LnAqWaJbhsxb0d64hdqsZynPhb15VhGNyDcRY1PXsrHUhtdjUmWVg8Q
 BoLClymw6kYrW57hEemjU1COZwxtRQblFLIk3pQ/9niAAjic0MmlV1XKp3uVhmTOztSm
 RVtNmVRhhkhq9mv5/2jadImmx1g3pbw5HgNahHuaR0pgx62+o8zJbvUPEd32xhCzpPhp
 0JZOomS+hLdgBCw5s+ilGopXLcC2B/SNRaDgAANB1wwl859qVd5EE5qE3lvt23NCS+8j
 wPJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GM+yN/jrRse2ioNNBGH5SQs0AMwRsnLkkraZtwr6CoY=;
 b=QF6fFoYvcm1auvXFfkX4yV8ZiwD6knrXe+mY0m53qbUvNqTus1jRYveVp8jTm9JJ6L
 +9efcqQXriMwx3jTtESPobgw41IthDYVzDyA2TrROrCe0adUWgG7QVIKXSJ1lyNTCC8K
 WqoGIPG+JQ4eW7GL4WjA7RMqX2nbOFLOyujFzY1M3G2Ug1g9GC5Td4coYNcYPej8fSFx
 ubOmeIY7phwikuoZDdlAREC0Me3zU8EC48xfZrbEbEmn7lq+qG+IIKQx+MP4KO01WUKb
 vkssV8dsOXC38f9xglKGqbL+tXcHV8feyvZbTkl25OmY/UXPNVbkcRd3/PPqlEZrb8mX
 PTug==
X-Gm-Message-State: AGi0PuZewoiWWa8j4iXpsO8lJwU8F25cI94yEe6RZV+4Df0kpYhrb9T9
 RjW/I8A2aFI01++drW2bYOqDSpHOoKjLgQN3+wY=
X-Google-Smtp-Source: APiQypKD2Hi/qjbQxc6mLnbTEZOd0gAygUhDFJ/V70Ab1dMABhoQoHZbNNKFfSGHsAh5K6aqiqL9tKd0WPc9fHRfcWw=
X-Received: by 2002:a5d:9494:: with SMTP id v20mr17384079ioj.101.1586798944353; 
 Mon, 13 Apr 2020 10:29:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200411200632.4045-1-peron.clem@gmail.com>
 <20200411200632.4045-2-peron.clem@gmail.com>
 <c96f31a2-6ff4-31aa-aaac-2ce9eafb3bfe@arm.com>
 <CAJiuCcegkNGQ7j4jcT1rBpSLqG1c-nb8g0wq+Nbvt-dGj7am2Q@mail.gmail.com>
 <CAJiuCceU662o7QGJ=mmT3pzVWK7uJUN=6+NKQnZ=Cfj9c2nw7A@mail.gmail.com>
 <d6465e7e-8e05-8b7d-16bd-f40877969089@arm.com>
 <CAJiuCccv2XPLY6sjcgvvrG5a8ONYHa_xn9i-YUDKUDK5a0DY=A@mail.gmail.com>
In-Reply-To: <CAJiuCccv2XPLY6sjcgvvrG5a8ONYHa_xn9i-YUDKUDK5a0DY=A@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Mon, 13 Apr 2020 19:28:53 +0200
Message-ID: <CAJiuCcfa9ro1V4nBzfD48cCuHpEsLaNA5P0bb-tQ3hcWUCtpkA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panfrost: add devfreq regulator support
To: Steven Price <steven.price@arm.com>
X-Mailman-Approved-At: Tue, 14 Apr 2020 07:06:18 +0000
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
Cc: Nishanth Menon <nm@ti.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU3RldmVuLAoKT24gTW9uLCAxMyBBcHIgMjAyMCBhdCAxODozNSwgQ2zDqW1lbnQgUMOpcm9u
IDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBTdGV2ZW4sCj4KPiBPbiBNb24s
IDEzIEFwciAyMDIwIGF0IDE3OjU1LCBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29t
PiB3cm90ZToKPiA+Cj4gPiBPbiAxMy8wNC8yMDIwIDE1OjMxLCBDbMOpbWVudCBQw6lyb24gd3Jv
dGU6Cj4gPiA+IEhpLAo+ID4gPgo+ID4gPiBPbiBNb24sIDEzIEFwciAyMDIwIGF0IDE2OjE4LCBD
bMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21haWwuY29tPiB3cm90ZToKPiA+ID4+Cj4gPiA+
PiBIaSBTdGV2ZW4sCj4gPiA+Pgo+ID4gPj4gT24gTW9uLCAxMyBBcHIgMjAyMCBhdCAxNToxOCwg
U3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4gd3JvdGU6Cj4gPiA+Pj4KPiA+ID4+
PiBPbiAxMS8wNC8yMDIwIDIxOjA2LCBDbMOpbWVudCBQw6lyb24gd3JvdGU6Cj4gPiA+Pj4+IE9Q
UCB0YWJsZSBjYW4gZGVmaW5lZCBib3RoIGZyZXF1ZW5jeSBhbmQgdm9sdGFnZS4KPiA+ID4+Pj4K
PiA+ID4+Pj4gUmVnaXN0ZXIgdGhlIG1hbGkgcmVndWxhdG9yIGlmIGl0IGV4aXN0Lgo+ID4gPj4+
Pgo+ID4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21h
aWwuY29tPgo+ID4gPj4+PiAtLS0KPiA+ID4+Pj4gICAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0
L3BhbmZyb3N0X2RldmZyZXEuYyB8IDM0ICsrKysrKysrKysrKysrKysrKy0tLQo+ID4gPj4+PiAg
ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmggIHwgIDEgKwo+ID4g
Pj4+PiAgICAyIGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
Cj4gPiA+Pj4+Cj4gPiA+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3Qv
cGFuZnJvc3RfZGV2ZnJlcS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rl
dmZyZXEuYwo+ID4gPj4+PiBpbmRleCA2MjU0MWY0ZWRkODEuLjJkYzhlMjM1NTM1OCAxMDA2NDQK
PiA+ID4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEu
Ywo+ID4gPj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJl
cS5jCj4gPiA+Pj4+IEBAIC03OCwxMiArNzgsMjYgQEAgaW50IHBhbmZyb3N0X2RldmZyZXFfaW5p
dChzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKPiA+ID4+Pj4gICAgICAgIHN0cnVjdCBk
ZXZpY2UgKmRldiA9ICZwZmRldi0+cGRldi0+ZGV2Owo+ID4gPj4+PiAgICAgICAgc3RydWN0IGRl
dmZyZXEgKmRldmZyZXE7Cj4gPiA+Pj4+ICAgICAgICBzdHJ1Y3QgdGhlcm1hbF9jb29saW5nX2Rl
dmljZSAqY29vbGluZzsKPiA+ID4+Pj4gKyAgICAgY29uc3QgY2hhciAqbWFsaSA9ICJtYWxpIjsK
PiA+ID4+Pj4gKyAgICAgc3RydWN0IG9wcF90YWJsZSAqb3BwX3RhYmxlID0gTlVMTDsKPiA+ID4+
Pj4gKwo+ID4gPj4+PiArICAgICAvKiBSZWd1bGF0b3IgaXMgb3B0aW9uYWwgKi8KPiA+ID4+Pj4g
KyAgICAgb3BwX3RhYmxlID0gZGV2X3BtX29wcF9zZXRfcmVndWxhdG9ycyhkZXYsICZtYWxpLCAx
KTsKPiA+ID4+Pgo+ID4gPj4+IFRoaXMgbG9va3MgbGlrZSBpdCBhcHBsaWVzIGJlZm9yZSAzZTEz
OTliY2NmNTEgKCJkcm0vcGFuZnJvc3Q6IEFkZAo+ID4gPj4+IHN1cHBvcnQgZm9yIG11bHRpcGxl
IHJlZ3VsYXRvcnMiKSB3aGljaCBpcyBjdXJyZW50bHkgaW4gZHJtLW1pc2MtbmV4dAo+ID4gPj4+
IChhbmQgbGludXgtbmV4dCkuIFlvdSB3YW50IHNvbWV0aGluZyBtb3JlIGxpa2U6Cj4gPiA+Pgo+
ID4gPj4gVGhhbmtzIGZvciB5b3UgcmV2aWV3LCBpbmRlZWQgSSBkaWRuJ3Qgc2VlIHRoYXQgbXVs
dGlwbGUgcmVndWxhdG9ycwo+ID4gPj4gc3VwcG9ydCBoYXMgYmVlbiBhZGRlZC4KPiA+ID4+IFdp
bGwgdXBkYXRlIGluIHYyLgo+ID4gPj4KPiA+ID4+Pgo+ID4gPj4+ICAgICAgIG9wcF90YWJsZSA9
IGRldl9wbV9vcHBfc2V0X3JlZ3VsYXRvcnMoZGV2LAo+ID4gPj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcGZkZXYtPmNvbXAtPnN1cHBseV9uYW1lcywKPiA+
ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBmZGV2LT5j
b21wLT5udW1fc3VwcGxpZXMpOwo+ID4gPj4+Cj4gPiA+Pj4gT3RoZXJ3aXNlIGEgcGxhdGZvcm0g
d2l0aCBtdWx0aXBsZSByZWd1bGF0b3JzIHdvbid0IHdvcmsgY29ycmVjdGx5Lgo+ID4gPj4+Cj4g
PiA+Pj4gQWxzbyBydW5uaW5nIG9uIG15IGZpcmVmbHkgKFJLMzI4OCkgYm9hcmQgSSBnZXQgdGhl
IGZvbGxvd2luZyB3YXJuaW5nOgo+ID4gPj4+Cj4gPiA+Pj4gICAgICBkZWJ1Z2ZzOiBEaXJlY3Rv
cnkgJ2ZmYTMwMDAwLmdwdS1tYWxpJyB3aXRoIHBhcmVudCAndmRkX2dwdScgYWxyZWFkeQo+ID4g
Pj4+IHByZXNlbnQhCgpJIHRyeSB0byByZXByb2R1Y2UgYnV0IGl0IGNhbid0CnJlZ3VsYXRvciBp
cyBtb3VudCBhdCA6Ci4vcmVndWxhdG9yL3ZkZC1ncHUKd2hlcmVhcyBPUFAgaXMgbW91bnQgOgou
L29wcC9zb2MtMTgwMDAwMC5ncHUvb3BwOjc1NjAwMDAwMC9zdXBwbHktMC8KCkkgc2VlIHRoYXQg
ZmlyZWZseSBhcyAyIHJlZ3VsYXRvcnMgd2l0aCB0aGUgc2FtZSBuYW1lIDoKdmRkX2dwdSBmcm9t
IHN5cjgyOAooaHR0cHM6Ly9naXRodWIuY29tL21vcHBsYXllci9GaXJlZmx5LVJLMzI4OC1LZXJu
ZWwtV2l0aC1NYWxpNzY0L2Jsb2IvbWFzdGVyL2FyY2gvYXJtL2Jvb3QvZHRzL2ZpcmVmbHktcmsz
Mjg4LmR0cyNMNDUzKQp2ZGRfZ3B1IGZyb20gcms4MDhfZGNkYzJfcmVnCihodHRwczovL2dpdGh1
Yi5jb20vbW9wcGxheWVyL0ZpcmVmbHktUkszMjg4LUtlcm5lbC1XaXRoLU1hbGk3NjQvYmxvYi9t
YXN0ZXIvYXJjaC9hcm0vYm9vdC9kdHMvZmlyZWZseS1yazMyODguZHRzI0w4NDEpCgpTbyBpIHRo
aW5rIHRoZSBpc3N1ZSBpcyBmcm9tIHRoZSBmaXJlZmx5IGRldmljZS10cmVlLgoKUmVnYXJkcywK
Q2xlbWVudAoKPiA+ID4+Pgo+ID4gPj4+IFRoaXMgaXMgZHVlIHRvIHRoZSByZWd1bGF0b3IgZGVi
dWdmcyBlbnRyaWVzIGdldHRpbmcgY3JlYXRlZCB0d2ljZSAob25jZQo+ID4gPj4+IGluIHBhbmZy
b3N0X3JlZ3VsYXRvcl9pbml0KCkgYW5kIG9uY2UgaGVyZSkuCj4gPiA+Pgo+ID4gPj4gSXMgaXQg
YSB3YXJuaW5nIHRoYXQgc2hvdWxkIGJlIGNvbnNpZGVyIGFzIGFuIGVycm9yPyBMb29rJ3MgbW9y
ZSBhbiBpbmZvIG5vPwo+ID4gPj4gV2hhdCBzaG91bGQgYmUgdGhlIGNvcnJlY3QgYmVoYXZpb3Ig
aWYgYSBkZXZpY2Ugd2FudCB0byByZWdpc3RlciB0d28KPiA+ID4+IHRpbWVzIHRoZSBzYW1lIHJl
Z3VsYXRvcj8KPiA+ID4KPiA+ID4gT3Igd2UgY2FuIGNoYW5nZSB0aGUgbmFtZSBmcm9tIHZkZF9Y
WFggdG8gb3BwX3ZkZF9YWFggPwo+ID4gPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51
eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvb3BwL2RlYnVnZnMuYyNMNDUKPiA+Cj4gPiBZZXMsIEkn
bSBub3Qgc3VyZSB0aGF0IGl0J3MgYWN0dWFsbHkgYSBwcm9ibGVtIGluIHByYWN0aWNlLiBBbmQg
aXQgbWF5Cj4gPiB3ZWxsIGJlIGNvcnJlY3QgdG8gY2hhbmdlIHRoaXMgaW4gdGhlIGdlbmVyaWMg
Y29kZSByYXRoZXIgdGhhbiB0cnkgdG8KPiA+IHdvcmsgYXJvdW5kIGl0IGluIFBhbmZyb3N0LiBC
dXQgd2Ugc2hvdWxkbid0IHNwYW0gdGhlIHVzZXIgd2l0aCB3YXJuaW5ncwo+ID4gYXMgdGhhdCBt
YWtlcyByZWFsIGlzc3VlcyBoYXJkZXIgdG8gc2VlLgo+ID4KPiA+IFlvdXIgc3VnZ2VzdGlvbiB0
byBjaGFuZ2UgdGhlIG5hbWUgc2VlbXMgcmVhc29uYWJsZSB0byBtZSwgYnV0IEkgZG9uJ3QKPiA+
IGZ1bGx5IHVuZGVyc3RhbmQgdGhlIG9wcCBjb2RlLCBzbyB3ZSdkIG5lZWQgc29tZSByZXZpZXcg
ZnJvbSB0aGUgT1BQCj4gPiBtYWludGFpbmVycy4gSG9wZWZ1bGx5IFZpcmVzaCwgTmlzaGFudGgg
b3IgU3RlcGhlbiBjYW4gcHJvdmlkZSBzb21lIGluc2lnaHQuCj4KPiBBZ3JlZSwgSSB3aWxsIHNl
bmQgYSB2MiB3aXRoIHRoZSByZW5hbWUgYW5kIHNlZSBpZiBPUFAgTWFpbnRhaW5lcnMgYWdyZWUu
Cj4KPiBSZWdhcmRzLAo+IENsZW1lbnQKPgo+ID4KPiA+IFN0ZXZlCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
