Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D862CA9D2
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 18:37:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC3B89BB2;
	Tue,  1 Dec 2020 17:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC5D89BB2
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 17:37:08 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 895F62168B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 17:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606844227;
 bh=KNAM6f9lqa9mSdVyTIG/dKQEu1sW8SSDpknGMUKbCiU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=q7gvXsO8ykqAn2xVepDAm7HMlbTj1GN5iniIENiosDRNoP34C9CXV2n19OssOrOSf
 zrHyfvybHLN4CfnLGsVrl2JcsaJ+CdjwlOBwLTkB41lyPHgC9pllif5zp7zhSV4eOu
 N50+hBxxWoZ6tlmxD6bJrD1Hh6WkQ4KIF5fOnMpg=
Received: by mail-ej1-f47.google.com with SMTP id d17so5811478ejy.9
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Dec 2020 09:37:07 -0800 (PST)
X-Gm-Message-State: AOAM532af+snxZ9x1iJ40cZg9drrkljeI7PqbELkUPSVup4SBb2W0gXX
 BL2dw1EKDkJ5gohuEzgUFWB5xJoAC+rYQp5dGQ==
X-Google-Smtp-Source: ABdhPJxR2ypWVHPbsoaZHQu3SRgRb3mnZE4SCBgSJTl1wFd4t4AYEIvkGKfVCSCuJyrRSxZoQsFWoEqw9dgY/cytRY4=
X-Received: by 2002:a17:906:c20f:: with SMTP id
 d15mr4059120ejz.341.1606844225944; 
 Tue, 01 Dec 2020 09:37:05 -0800 (PST)
MIME-Version: 1.0
References: <1606746513-30909-1-git-send-email-kevin3.tang@gmail.com>
 <1606746513-30909-2-git-send-email-kevin3.tang@gmail.com>
 <CAL_Jsq+fC1TzygUopiwVtwBN8JtwmnGy=VMTEvkudSQUdXiMqg@mail.gmail.com>
 <CAFPSGXZLXh__GuXT2NPqF0jpO2DnMAhz+NtE721EZfMCSKLBjQ@mail.gmail.com>
In-Reply-To: <CAFPSGXZLXh__GuXT2NPqF0jpO2DnMAhz+NtE721EZfMCSKLBjQ@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 1 Dec 2020 10:36:54 -0700
X-Gmail-Original-Message-ID: <CAL_JsqJQE0-ScESutDd950GEac+w0KhzGcLv+_jb1xuVs6DQXw@mail.gmail.com>
Message-ID: <CAL_JsqJQE0-ScESutDd950GEac+w0KhzGcLv+_jb1xuVs6DQXw@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: display: add Unisoc's drm master bindings
To: Kevin Tang <kevin3.tang@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>,
 Lyra Zhang <zhang.lyra@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Orson Zhai <orsonzhai@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBEZWMgMSwgMjAyMCBhdCAxMjozNiBBTSBLZXZpbiBUYW5nIDxrZXZpbjMudGFuZ0Bn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgUm9iCj4KPiBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJu
ZWwub3JnPiDkuo4yMDIw5bm0MTLmnIgx5pel5ZGo5LqMIOS4iuWNiDQ6MjnlhpnpgZPvvJoKPiA+
Cj4gPiBPbiBNb24sIE5vdiAzMCwgMjAyMCBhdCA3OjI4IEFNIEtldmluIFRhbmcgPGtldmluMy50
YW5nQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEZyb206IEtldmluIFRhbmcgPGtldmlu
LnRhbmdAdW5pc29jLmNvbT4KPiA+Cj4gPiBPbmNlIGFnYWluLCBEVCBwYXRjaGVzIG11c3QgQ2Mg
dGhlIERUIGxpc3QgaWYgeW91IHdhbnQgdGhlbSByZXZpZXdlZC4KPiBPaywgaSB3aWxsIGFkZCBE
VCBsaXN0IHRvIG15IENjIGxpc3QuCj4gPgo+ID4gPgo+ID4gPiBUaGUgVW5pc29jIERSTSBtYXN0
ZXIgZGV2aWNlIGlzIGEgdmlydHVhbCBkZXZpY2UgbmVlZGVkIHRvIGxpc3QgYWxsCj4gPiA+IERQ
VSBkZXZpY2VzIG9yIG90aGVyIGRpc3BsYXkgaW50ZXJmYWNlIG5vZGVzIHRoYXQgY29tcHJpc2Ug
dGhlCj4gPiA+IGdyYXBoaWNzIHN1YnN5c3RlbQo+ID4gPgo+ID4gPiBDYzogT3Jzb24gWmhhaSA8
b3Jzb256aGFpQGdtYWlsLmNvbT4KPiA+ID4gQ2M6IENodW55YW4gWmhhbmcgPHpoYW5nLmx5cmFA
Z21haWwuY29tPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBLZXZpbiBUYW5nIDxrZXZpbi50YW5nQHVu
aXNvYy5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgLi4uL2Rpc3BsYXkvc3ByZC9zcHJkLGRpc3BsYXkt
c3Vic3lzdGVtLnlhbWwgICAgICAgfCAzOSArKysrKysrKysrKysrKysrKysrKysrCj4gPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKQo+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3NwcmQvc3ByZCxkaXNw
bGF5LXN1YnN5c3RlbS55YW1sCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zcHJkL3NwcmQsZGlzcGxheS1zdWJzeXN0ZW0u
eWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3NwcmQvc3By
ZCxkaXNwbGF5LXN1YnN5c3RlbS55YW1sCj4gPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiA+
IGluZGV4IDAwMDAwMDAuLjk0ODdhMzkKPiA+ID4gLS0tIC9kZXYvbnVsbAo+ID4gPiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zcHJkL3NwcmQsZGlzcGxh
eS1zdWJzeXN0ZW0ueWFtbAo+ID4gPiBAQCAtMCwwICsxLDM5IEBACj4gPiA+ICsjIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPiA+ID4gKyVZ
QU1MIDEuMgo+ID4gPiArLS0tCj4gPiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hl
bWFzL2Rpc3BsYXkvc3ByZC9zcHJkLGRpc3BsYXktc3Vic3lzdGVtLnlhbWwjCj4gPiA+ICskc2No
ZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiA+ID4g
Kwo+ID4gPiArdGl0bGU6IFVuaXNvYyBEUk0gbWFzdGVyIGRldmljZQo+ID4gPiArCj4gPiA+ICtt
YWludGFpbmVyczoKPiA+ID4gKyAgLSBLZXZpbiBUYW5nIDxrZXZpbi50YW5nQHVuaXNvYy5jb20+
Cj4gPiA+ICsKPiA+ID4gK2Rlc2NyaXB0aW9uOiB8Cj4gPiA+ICsgIFRoZSBVbmlzb2MgRFJNIG1h
c3RlciBkZXZpY2UgaXMgYSB2aXJ0dWFsIGRldmljZSBuZWVkZWQgdG8gbGlzdCBhbGwKPiA+ID4g
KyAgRFBVIGRldmljZXMgb3Igb3RoZXIgZGlzcGxheSBpbnRlcmZhY2Ugbm9kZXMgdGhhdCBjb21w
cmlzZSB0aGUKPiA+ID4gKyAgZ3JhcGhpY3Mgc3Vic3lzdGVtLgo+ID4gPiArCj4gPiA+ICtwcm9w
ZXJ0aWVzOgo+ID4gPiArICBjb21wYXRpYmxlOgo+ID4gPiArICAgIGNvbnN0OiBzcHJkLGRpc3Bs
YXktc3Vic3lzdGVtCj4gPgo+ID4gQXMgSSBzYWlkIGJlZm9yZSwgd2UgdHJ5IHRvIGF2b2lkIHRo
ZXNlIHZpcnR1YWwgbm9kZXMuIE1ha2UgdGhlIERSTQo+ID4gZHJpdmVyIGJpbmQgdG8gdGhlIERQ
VSBub2RlLgo+ID4KPiA+IFRoZSBjYXNlIHdoZXJlIHRoaXMgbWlnaHQgYmUgbmVlZGVkIGlzIGlm
IHlvdSBoYXZlIGgvdyB0aGF0J3MgYQo+ID4gbWl4dHVyZSBvZiBzaGFyZWQgYW5kIGRpc2NyZXRl
IGJsb2Nrcy4gSSBkb24ndCBzZWUgYW55dGhpbmcgaGVyZQo+ID4gbWF0Y2hpbmcgdGhhdC4KPgo+
IFRoaXMgaXMgaG93IEkgdW5kZXJzdGFuZCB0aGlzIHNlbnRlbmNlOiAiaC93IHRoYXQncyBhIG1p
eHR1cmUgb2Ygc2hhcmVkIGFuZCBkaXNjcmV0ZSBibG9ja3MiCj4gV2UgaGF2ZSBtdWx0aXBsZSBk
aXNwbGF5IGNvbnRyb2xsZXJzIGFuZCBjb3JyZXNwb25kaW5nIHBoeXNpY2FsIGludGVyZmFjZXMs
IHR5cGljYWwgZHVhbC1zY3JlZW4gZGlzcGxheSBzY2VuYXJpbwo+IEUuZzoKPiAxLiBkcHUwIGFu
ZCBkcHUxIGJvdGggYmluZGluZyB0byBEU0kgZm9yIGR1YWwgbWlwaS1kc2kgZGlzcGxheTsKPiAy
LiBkcHUwIGJpbmRpbmcgdG8gRFNJIGZvciBwcmltYXJ5IGRpc3BsYXksIGFuZCBkcHUxIGJpbmRp
bmcgdG8gRFAgZm9yIGV4dGVybmFsIGRpc3BsYXk7Cj4KPiBJdCBsb29rcyBsaWtlIHRoaXM6Cj4g
ZHB1MC0tLS0tLT5NSVBJLURTSS0tLS0tLT5EUEhZL0NQSFkgQ29tYm8tLS0tLS0+UGFuZWwwCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgXgo+ICAgICAtLS0tLS0tLS0tLS0tLS0tfAo+ICAgICB8
Cj4gZHB1MS0tLS0tLT5EaXNwbGF5UG9ydC0tLS0tLT5QSFktLS0tLS0+UGFuZWwxCj4KPiBGb3Ig
RFRTIGxpa2UgdGhpczoKPiBkaXNwbGF5LXN1YnN5c3RlbSB7Cj4gY29tcGF0aWJsZSA9ICJzcHJk
LGRpc3BsYXktc3Vic3lzdGVtIjsKPiBwb3J0cyA9IDwmZHB1MF9vdXQ+LCA8JmRwdTFfb3V0PjsK
PiB9OwoKWWVhaCwgdGhpcyB3b3VsZCBiZSBvbmUgc3VjaCBjYXNlLiBKdXN0IG1ha2UgdGhpcyBz
Y2VuYXJpbyBjbGVhciBpbgpjb21taXQgbWVzc2FnZS4KClJvYgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
