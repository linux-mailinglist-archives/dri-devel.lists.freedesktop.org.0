Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C5B70AE3
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 22:54:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 185968928D;
	Mon, 22 Jul 2019 20:54:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D9E89183
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 20:54:21 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id u17so18229853pgi.6
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 13:54:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=aHUdEX2ULV+TDjjhsxnkJoyyNmoo7KbS8aN0PdtSzBA=;
 b=jnd2Ps94vRIFmUUs5InS3lnTdoQGotf7kznJ0xfjr6LjQMjMWE9uXpBbLQ+SqWi0wY
 zCeXbKVzqSgnMAyf/Shagfku6DSyqPJ+8BxOZE1A8gDJRiQpbuS0OaIEZa9YbO3NRbhF
 Q+vPriK0lup3DxFsScN2Lpzx9UtTaMV0MsxruKFZVenbJGuo/8CNBALAfg11jh8dOB48
 2qU+dKGmKNKJ59qqUGZKwmpeM+ktNarG3fbCa970yBkZ7gGEjsGmTLeYISoVg/I3vtwN
 V0xxetnDwznnHbVEZf89DD3z1LhGYUznvXhCsXkIwc9adsyhAHWPWAv4ylaQV1XxboZ4
 vong==
X-Gm-Message-State: APjAAAV0zYyFi/HXVnRYnyivd1I4Uprgspku9lavCJpHcJH0oDKijrB4
 j5tBstdA9MxHo74MCC9dsmk/DBoWQ5o=
X-Google-Smtp-Source: APXvYqzCFNwpofDCIDkf3fwqg29xodZS2cLtFiiYiDDdohkscENChmgwkkiOnJjfaFyz/OroSmmFeg==
X-Received: by 2002:a65:5c02:: with SMTP id u2mr3592167pgr.367.1563828861466; 
 Mon, 22 Jul 2019 13:54:21 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
 by smtp.gmail.com with ESMTPSA id c8sm45616120pjq.2.2019.07.22.13.54.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jul 2019 13:54:20 -0700 (PDT)
Date: Mon, 22 Jul 2019 13:54:19 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2] drm/bridge: dw-hdmi: Refuse DDC/CI transfers on the
 internal I2C controller
Message-ID: <20190722205419.GY250418@google.com>
References: <20190722181945.244395-1-mka@chromium.org>
 <CAD=FV=XP=3z9GWPU+K15jmzHeOWT9uzqgaC6zL3M+Wm7b4jOhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=XP=3z9GWPU+K15jmzHeOWT9uzqgaC6zL3M+Wm7b4jOhQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=aHUdEX2ULV+TDjjhsxnkJoyyNmoo7KbS8aN0PdtSzBA=;
 b=GGeXaV2UIdvQLIYZetuz+R47tXFQa2bSV4X/3q7FX28x5V7fMw1Zf0JaF+D3OcoujM
 VoZ8HXGilcEUvYhpUDnJWW6U7SNJ4bf6O6iuULjnhWMB0kJx4c5spqUUgPN5D5q3czIz
 1Z/WCCz0fXtchf4xoANXGVOI+rcG1Jz0phIiE=
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMDE6MTI6NDBQTSAtMDcwMCwgRG91ZyBBbmRlcnNvbiB3
cm90ZToKPiBIaSwKPiAKPiBPbiBNb24sIEp1bCAyMiwgMjAxOSBhdCAxMToxOSBBTSBNYXR0aGlh
cyBLYWVobGNrZSA8bWthQGNocm9taXVtLm9yZz4gd3JvdGU6Cj4gPgo+ID4gVGhlIEREQy9DSSBw
cm90b2NvbCBpbnZvbHZlcyBzZW5kaW5nIGEgbXVsdGktYnl0ZSByZXF1ZXN0IHRvIHRoZQo+ID4g
ZGlzcGxheSB2aWEgSTJDLCB3aGljaCBpcyB0eXBpY2FsbHkgZm9sbG93ZWQgYnkgYSBtdWx0aS1i
eXRlCj4gPiByZXNwb25zZS4gVGhlIGludGVybmFsIEkyQyBjb250cm9sbGVyIG9ubHkgYWxsb3dz
IHNpbmdsZSBieXRlCj4gPiByZWFkcy93cml0ZXMgb3IgcmVhZHMgb2YgOCBzZXF1ZW50aWFsIGJ5
dGVzLCBoZW5jZSBEREMvQ0kgaXMgbm90Cj4gPiBzdXBwb3J0ZWQgd2hlbiB0aGUgaW50ZXJuYWwg
STJDIGNvbnRyb2xsZXIgaXMgdXNlZC4gVGhlIEkyQwo+ID4gdHJhbnNmZXJzIGNvbXBsZXRlIHdp
dGhvdXQgZXJyb3JzLCBob3dldmVyIHRoZSBkYXRhIGluIHRoZSByZXNwb25zZQo+ID4gaXMgZ2Fy
YmFnZS4gQWJvcnQgdHJhbnNmZXJzIHRvL2Zyb20gc2xhdmUgYWRkcmVzcyAweDM3IChEREMpIHdp
dGgKPiA+IC1FT1BOT1RTVVBQLCB0byBtYWtlIGl0IGV2aWRlbnQgdGhhdCB0aGUgY29tbXVuaWNh
dGlvbiBpcyBmYWlsaW5nLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IE1hdHRoaWFzIEthZWhsY2tl
IDxta2FAY2hyb21pdW0ub3JnPgo+ID4gLS0tCj4gPiBDaGFuZ2VzIGluIHYyOgo+ID4gLSBjaGFu
Z2VkIEREQ19JMkNfQUREUiB0byBERENfQ0lfQUREUgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgfCA4ICsrKysrKysrCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lu
b3BzeXMvZHctaGRtaS5jCj4gPiBpbmRleCAwNDViMWIxM2ZkMGUuLjI4OTMzNjI5ZjNjNyAxMDA2
NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCj4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+ID4gQEAg
LTM1LDYgKzM1LDcgQEAKPiA+Cj4gPiAgI2luY2x1ZGUgPG1lZGlhL2NlYy1ub3RpZmllci5oPgo+
ID4KPiA+ICsjZGVmaW5lIEREQ19DSV9BRERSICAgICAgICAgICAgMHgzNwo+ID4gICNkZWZpbmUg
RERDX1NFR01FTlRfQUREUiAgICAgICAweDMwCj4gPgo+ID4gICNkZWZpbmUgSERNSV9FRElEX0xF
TiAgICAgICAgICA1MTIKPiA+IEBAIC0zMjIsNiArMzIzLDEzIEBAIHN0YXRpYyBpbnQgZHdfaGRt
aV9pMmNfeGZlcihzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFkYXAsCj4gPiAgICAgICAgIHU4IGFkZHIg
PSBtc2dzWzBdLmFkZHI7Cj4gPiAgICAgICAgIGludCBpLCByZXQgPSAwOwo+ID4KPiA+ICsgICAg
ICAgaWYgKGFkZHIgPT0gRERDX0NJX0FERFIpCj4gPiArICAgICAgICAgICAgICAgLyoKPiA+ICsg
ICAgICAgICAgICAgICAgKiBUaGUgaW50ZXJuYWwgSTJDIGNvbnRyb2xsZXIgZG9lcyBub3Qgc3Vw
cG9ydCB0aGUgbXVsdGktYnl0ZQo+ID4gKyAgICAgICAgICAgICAgICAqIHJlYWQgYW5kIHdyaXRl
IG9wZXJhdGlvbnMgbmVlZGVkIGZvciBEREMvQ0kuCj4gPiArICAgICAgICAgICAgICAgICovCj4g
PiArICAgICAgICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOwo+ID4gKwo+IAo+IEluIHRoZW9y
eSB3ZSBjb3VsZCBhbHNvIHNvbHZlIHRoaXMgYnkgZGV0ZWN0aW5nIChpbiBvdGhlciBwYXJ0cyBv
ZiB0aGUKPiBmdW5jdGlvbikgdGhlIGJhZCBtdWx0aS1ieXRlIHJlYWQvd3JpdGUgb3BlcmF0aW9u
cy4gIFRoYXQgd291bGQgbWF5YmUKPiBiZSBtb3JlIGdlbmVyaWMgKEFLQSBpdCB3b3VsZCBtb3Jl
IHByb3Blcmx5IGhhbmRsZSByYW5kb20gdXNlcnNwYWNlCj4gdG9vbHMgZmlkZGxpbmcgd2l0aCBp
MmMtZGV2KSBidXQgYWRkIGNvbXBsZXhpdHkgdG8gdGhlIGNvZGUuCgpCdXQgaG93IGRvIHlvdSBr
bm93IGl0J3MgYW4gdW5zdXBwb3J0ZWQgb3BlcmF0aW9uLCBhbmQgbm90IHRoZSBkcml2ZXIKa25v
d2luZyB0aGUgd2Fja3kgbGltaXRhdGlvbnMgZG9pbmcgc29tZXRoaW5nIHZhbGlkLgoKRS5nLiB5
b3UgZ2V0IHRoZSBzZXF1ZW5jZToKCjB4MDEgMHgwYSAweDBiIDB4MGMgMHgwZAoKVGhpcyBjb3Vs
ZCBiZSBpbnRlcnByZXRlZCBhcyAic2VuZCB0aGUgYWJvdmUgYnl0ZXMgdG8gdGhlIHNsYXZlIiBv
cgphcyAic2VuZCAweDBhIHRvIGFkZHJlc3MgMHgwMSwgMHgwYiB0byAweDAyLCAweDBjIHRvIDB4
MDMgYW5kIDB4MGQgdG8KMHgwNCIgKGF0IGxlYXN0IGJ5IHRoaXMgZHJpdmVyIDstKSAuIFRoZSBs
YXR0ZXIgY291bGQgYmUgaW50ZW5kZWQuCgo+IC4uLnBvc3NpYmx5IGEgYmV0dGVyIGxvbmctdGVy
bSBzb2x1dGlvbiBpcyB0byBqdXN0IHRvdGFsbHkgc3RvcAo+IGVtdWxhdGluZyBhIHJlZ3VsYXIg
aTJjIGFkYXB0ZXIgd2hlbiB0aGUgaGFyZHdhcmUganVzdCBkb2Vzbid0IHN1cHBvcnQKPiB0aGF0
LiAgSW4gdGhlb3J5IHdlIGNvdWxkIHJlbW92ZSB0aGUgImRybV9nZXRfZWRpZCgpIiBjYWxsIGlu
Cj4gZHdfaGRtaV9jb25uZWN0b3JfZ2V0X21vZGVzKCkgYW5kIHJlcGxhY2UgaXQgd2l0aCBhIGRp
cmVjdCBjYWxsIHRvCj4gZHJtX2RvX2dldF9lZGlkKCkgaWYgd2UncmUgdXNpbmcgdGhlIGJ1aWx0
LWluIGFkYXB0ZXIuICBQb3NzaWJseQo+ICJ0ZGE5OTh4X2Rydi5jIiB3b3VsZCBiZSBhIGdvb2Qg
cmVmZXJlbmNlLiAgSWYgd2UgZGlkIHRoYXQsIHdlIGNvdWxkCj4gcmVtb3ZlIGFsbCB0aGUgd2Vp
cmQgLyBoYWNreSBpMmMgY29kZSBpbiB0aGlzIGRyaXZlci4KCnllcywgdGhhdCB3b3VsZCBiZSBh
bm90aGVyIGFuZCBwcm9iYWJseSBiZXR0ZXIgb3B0aW9uIHRoYW4gdHJ5aW5nIHRvCmRldGVjdCB1
bnN1cHBvcnRlZCB0cmFuc2FjdGlvbi4KCj4gU2luY2UgdGhlIGJpZ2dlciBjbGVhbnVwIHNlZW1z
IGxpa2UgYSBiaXQgbXVjaCB0byBhc2ssIEknbSBPSyB3aXRoCj4gdGhpcyBhcyBhIHN0b3BnYXAg
dG8gYXQgbGVhc3QgcHJldmVudCB1c2Vyc3BhY2UgdG9vbHMgZnJvbSBnZXR0aW5nCj4gY29uZnVz
ZWQuICBUaHVzOgo+IAo+IFJldmlld2VkLWJ5OiBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0Bj
aHJvbWl1bS5vcmc+CgpUaGFua3MhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
