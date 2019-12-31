Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E70A612D75A
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2019 10:23:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68006E0F2;
	Tue, 31 Dec 2019 09:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37656E0F2
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2019 09:22:58 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id v28so34772214edw.12
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2019 01:22:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=zcMF0DszYjdAAeSzpwgiwYYj0Rmxb5AATwzX117pufo=;
 b=FCIhoLfFlNpN5RYVFKSpY5LTrNstuxm8fu1uiXdnDMdQsibDm/krxSM2oYUrtm/K+o
 YVx/RJDeKjRv/YqkPLJqRk2jIYPO0rEG6xl+98i5v455TYD/Nu/wvAHWM50MJeRbuvx/
 0UdxBV9Ktw9TSK7yswjS5pCwuSIs8Y02U4xW1qp3cdMBwTLMTWcxF9urgnUXHy/lJHXr
 J1CFBZ46oqoDW+emNDcTTWa/6+HiPSkXetJAp4kRwbteNh6KM8doCu8NpkCr09ZPEGE6
 3IyrH3HegkGHq+rNHv2xPY8ix9N6lTbvGH6ErTKoHDJnHo5kEV99BeTlTnUqsBkkCzVp
 Jkxw==
X-Gm-Message-State: APjAAAVM4hoGsKpjB/RKU9gLUuABcq6C66ftuWo6Q/5AW27V4s7SM+Su
 aYjz/An8iGWyqp/SVSb3MhE=
X-Google-Smtp-Source: APXvYqzgzVpvRf+8IP6z3ujB3SZIWKfFAGfLl8aejvQf9p703WelAn4funQmIQW8H6z6pzmhM0Yc6w==
X-Received: by 2002:a17:906:1fd5:: with SMTP id
 e21mr44856105ejt.97.1577784177492; 
 Tue, 31 Dec 2019 01:22:57 -0800 (PST)
Received: from pi3 ([194.230.155.138])
 by smtp.googlemail.com with ESMTPSA id x15sm5693555edl.48.2019.12.31.01.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Dec 2019 01:22:56 -0800 (PST)
Date: Tue, 31 Dec 2019 10:22:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Artur =?utf-8?B?xZp3aWdvxYQ=?= <a.swigon@samsung.com>
Subject: Re: [RFC PATCH v3 4/7] arm: dts: exynos: Add interconnect bindings
 for Exynos4412
Message-ID: <20191231092254.GA6939@pi3>
References: <20191220115653.6487-1-a.swigon@samsung.com>
 <CGME20191220120144eucas1p119ececf161a6d45a6a194e432bbbd1f9@eucas1p1.samsung.com>
 <20191220115653.6487-5-a.swigon@samsung.com>
 <20191230154405.GC4918@pi3>
 <2922135223b01126277ef92a53e6b294bc17bb5c.camel@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2922135223b01126277ef92a53e6b294bc17bb5c.camel@samsung.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, b.zolnierkie@samsung.com, sw0312.kim@samsung.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cw00.choi@samsung.com, myungjoo.ham@samsung.com, leonard.crestez@nxp.com,
 georgi.djakov@linaro.org, linux-arm-kernel@lists.infradead.org,
 m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBEZWMgMzEsIDIwMTkgYXQgMDg6MTg6MDFBTSArMDEwMCwgQXJ0dXIgxZp3aWdvxYQg
d3JvdGU6Cj4gSGksCj4gCj4gT24gTW9uLCAyMDE5LTEyLTMwIGF0IDE2OjQ0ICswMTAwLCBLcnp5
c3p0b2YgS296bG93c2tpIHdyb3RlOgo+ID4gT24gRnJpLCBEZWMgMjAsIDIwMTkgYXQgMTI6NTY6
NTBQTSArMDEwMCwgQXJ0dXIgxZp3aWdvxYQgd3JvdGU6Cj4gPiA+IFRoaXMgcGF0Y2ggYWRkcyB0
aGUgZm9sbG93aW5nIHByb3BlcnRpZXMgdG8gdGhlIEV4eW5vczQ0MTIgRFQ6Cj4gPiA+ICAgLSBl
eHlub3MsaW50ZXJjb25uZWN0LXBhcmVudC1ub2RlOiB0byBkZWNsYXJlIGNvbm5lY3Rpb25zIGJl
dHdlZW4KPiA+ID4gICAgIG5vZGVzIGluIG9yZGVyIHRvIGd1YXJhbnRlZSBQTSBRb1MgcmVxdWly
ZW1lbnRzIGJldHdlZW4gbm9kZXM7Cj4gPiA+ICAgLSAjaW50ZXJjb25uZWN0LWNlbGxzOiByZXF1
aXJlZCBieSB0aGUgaW50ZXJjb25uZWN0IGZyYW1ld29yay4KPiA+ID4gCj4gPiA+IE5vdGUgdGhh
dCAjaW50ZXJjb25uZWN0LWNlbGxzIGlzIGFsd2F5cyB6ZXJvIGFuZCBub2RlIElEcyBhcmUgbm90
Cj4gPiA+IGhhcmRjb2RlZCBhbnl3aGVyZS4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEFy
dHVyIMWad2lnb8WEIDxhLnN3aWdvbkBzYW1zdW5nLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBhcmNo
L2FybS9ib290L2R0cy9leHlub3M0NDEyLW9kcm9pZC1jb21tb24uZHRzaSB8IDUgKysrKysKPiA+
ID4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPiA+IAo+ID4gVGhlIG9yZGVyIG9m
IHBhdGNoZXMgaXMgY29uZnVzaW5nLiBQYXRjaGVzIDQgYW5kIDYgYXJlIHNwbGl0IC0gZG8gdGhl
Cj4gPiBkZXBlbmQgb24gNT8gSSBkb3VidCBidXQuLi4KPiAKPiBMZXQgbWUgZWxhYm9yYXRlOgo+
IAo+IFRoZSBvcmRlciBvZiB0aGUgcGF0Y2hlcyBpbiB0aGlzIHNlcmllcyBpcyBzdWNoIHRoYXQg
ZXZlcnkgc3Vic2VxdWVudAo+IHBhdGNoIGFkZHMgc29tZSBmdW5jdGlvbmFsaXR5IChhbmQsIG9m
IGNvdXJzZSwgYXBwbHlpbmcgcGF0Y2hlcyBvbmUtYnktb25lCj4geWllbGRzIGEgd29ya2luZyBr
ZXJuZWwgYXQgZXZlcnkgc3RlcCkuIFNwZWNpZmljYWxseSBmb3IgcGF0Y2hlcyAwNC0tMDc6Cj4g
Cj4gIC0tIHBhdGNoIDA0IGFkZHMgaW50ZXJjb25uZWN0IF9wcm92aWRlcl8gcHJvcGVydGllcyBm
b3IgRXh5bm9zNDQxMjsKPiAgLS0gcGF0Y2ggMDUgaW1wbGVtZW50cyBpbnRlcmNvbm5lY3QgcHJv
dmlkZXIgbG9naWMgKGRlcGVuZHMgb24gcGF0Y2ggMDQpOwo+ICAtLSBwYXRjaCAwNiBhZGRzIGlu
dGVyY29ubmVjdCBfY29uc3VtZXJfIHByb3BlcnRpZXMgZm9yIEV4eW5vczQ0MTIgbWl4ZXI7Cj4g
IC0tIHBhdGNoIDA3IGltcGxlbWVudHMgaW50ZXJjb25uZWN0IGNvbnN1bWVyIGxvZ2ljIChkZXBl
bmRzIG9uIHBhdGNoZXMKPiAgICAgMDUgJiAwNik7Cj4gCj4gTXkgcmVhc29uaW5nIGlzIHRoYXQg
dGhpcyBvcmRlciBhbGxvd3MgdG8gZS5nLiwgbWVyZ2UgdGhlIGludGVyY29ubmVjdAo+IHByb3Zp
ZGVyIGZvciBleHlub3MtYnVzIGFuZCBsZWF2ZSB0aGUgY29uc3VtZXJzIGZvciBsYXRlciAobm90
IGxpbWl0ZWQgdG8KPiB0aGUgbWl4ZXIpLiBJIGhvcGUgdGhpcyBtYWtlcyBzZW5zZS4KCkl0IGlz
IHdyb25nLiBUaGUgZHJpdmVyIHNob3VsZCBub3QgZGVwZW5kIG9uIERUUyBjaGFuZ2VzIGJlY2F1
c2U6CjEuIERUUyBhbHdheXMgZ28gdGhyb3VnaCBzZXBhcmF0ZSBicmFuY2ggYW5kIHRyZWUsIHNv
IGxhc3QgcGF0Y2gKICAgd2lsbCBoYXZlIHRvIHdhaXQgdXAgdG8gMyBjeWNsZXMgKCEhISksCjIu
IFlvdSBicmVhayBiYWNrd2FyZCBjb21wYXRpYmlsaXR5LgoKSW4gY2VydGFpbiBjYXNlcyBkZXBl
bmRlbmN5IG9uIERUUyBjaGFuZ2VzIGlzIG9rOgoxLiBDbGVhbmluZyB1cCBkZXByZWNhdGVkIHBy
b3BlcnRpZXMsCjIuIElnbm9yaW5nIHRoZSBiYWNrd2FyZCBjb21wYXRpYmlsaXR5IGZvciBlLmcu
IG5ldyBwbGF0Zm9ybXMuCgpOb25lIG9mIHRoZXNlIGFyZSBhcHBsaWNhYmxlIGhlcmUuCgpZb3Ug
bmVlZCB0byByZXdvcmsgaXQsIHB1dCBEVFMgY2hhbmdlcyBhdCB0aGUgZW5kLiBUaGlzIGNsZWFy
bHkgc2hvd3MKdGhhdCB0aGVyZSBpcyBubyB3cm9uZyBkZXBlbmRlbmN5LgoKPiAKPiA+IEFkanVz
dCB0aGUgdGl0bGUgdG8gbWF0Y2ggdGhlIGNvbnRlbnRzIC0geW91IGFyZSBub3QgYWRkaW5nIGJp
bmRpbmdzIGJ1dAo+ID4gcHJvcGVydGllcyB0byBidXMgbm9kZXMuIEFsc28gdGhlIHByZWZpeCBp
cyBBUk06IChsb29rIGF0IHJlY2VudAo+ID4gY29tbWl0cykuCj4gCj4gT0suCj4gCj4gPiA+IAo+
ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxMi1vZHJvaWQtY29t
bW9uLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9leHlub3M0NDEyLW9kcm9pZC1jb21tb24uZHRz
aQo+ID4gPiBpbmRleCA0Y2UzZDc3YTY3MDQuLmQ5ZDcwZWFjZmNhZiAxMDA2NDQKPiA+ID4gLS0t
IGEvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxMi1vZHJvaWQtY29tbW9uLmR0c2kKPiA+ID4g
KysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxMi1vZHJvaWQtY29tbW9uLmR0c2kKPiA+
ID4gQEAgLTkwLDYgKzkwLDcgQEAKPiA+ID4gICZidXNfZG1jIHsKPiA+ID4gIAlleHlub3MscHBt
dS1kZXZpY2UgPSA8JnBwbXVfZG1jMF8zPiwgPCZwcG11X2RtYzFfMz47Cj4gPiA+ICAJdmRkLXN1
cHBseSA9IDwmYnVjazFfcmVnPjsKPiA+ID4gKwkjaW50ZXJjb25uZWN0LWNlbGxzID0gPDA+Owo+
ID4gCj4gPiBUaGlzIGRvZXMgbm90IGxvb2sgbGlrZSBwcm9wZXJ0eSBvZiBPZHJvaWQgYnV0IEV4
eW5vczQ0MTIgb3IgRXh5bm9zNC4KPiAKPiBTdHJhbmdlbHkgZW5vdWdoLCB0aGlzIGZpbGUgaXMg
d2hlcmUgdGhlICdleHlub3MscGFyZW50LWJ1cycgKGFrYS4gJ2RldmZyZXEnKQo+IHByb3BlcnRp
ZXMgYXJlIGxvY2F0ZWQgKGFuZCBldmVyeXRoaW5nIGluIHRoaXMgUkZDIGNvbmNlcm5zIGRldmZy
ZXEpLgoKSSBjYW5ub3QgZmluZCBleHlub3MscGFyZW50LWJ1cyBpbiBleHlub3M0NDEyLW9kcm9p
ZC1jb21tb24uZHRzaS4gQ2FuCnlvdSBlbGFib3JhdGU/CgpCZXN0IHJlZ2FyZHMsCktyenlzenRv
ZgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
