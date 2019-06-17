Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3008247FAC
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 12:30:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1CC18919F;
	Mon, 17 Jun 2019 10:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B51C78919F
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 10:30:02 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id s7so19916505iob.11
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 03:30:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A3LvCS5kePEpWEvClGh/PP2SpGvm/yzihiihioMrY5k=;
 b=dX8jDSbvGrGegwmqNAG3+0VDe24HUCsE92a0yJfDN+z1WXnHDZl7tyigqqK3NocGRR
 NrWGiq8PbItsLMMvZ8N9sk5pBuLkNmSLLBnTKG+zRCkCV2yygtI6iS8HVpDuIC4XReKG
 qHQXUVH/BnuBsLg726MFL6MgdTLm3nYet/kF0bWV6KsUManD+oLwPx64TGshyA2NJvva
 mHIJG0boZEsHf/xdDJvI1WBjkRg1kmz1sIAVR/IC4tGTZG6q3qV6I8L3F+k73mvvRTN3
 wfY19XFx48DFz6JFlakZMygmlT7g2CbNt4FMA57hkJsSnbKF+Tfs4DCMaCXOTwAKjKyG
 mrHA==
X-Gm-Message-State: APjAAAUgkNEcSsIr5Hq517udR/YsdVbJ/IhZk9ughWGl1SdPJD6qMnGC
 TsFnwfZpdTx0RkZYlL/UhqfGPN3pWqZyVsoeGcvI6yng
X-Google-Smtp-Source: APXvYqwFp+6Q3sGP5PFjt5uFYyYV/cL8x1qFEQcCbsgfGJqgag+OTV6Q8i7mdcX7I9kfq1V+jaLpKIKwbvN+TA1OVNU=
X-Received: by 2002:a02:3217:: with SMTP id j23mr84513181jaa.79.1560767401947; 
 Mon, 17 Jun 2019 03:30:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190614164324.9427-1-jagan@amarulasolutions.com>
 <20190614164324.9427-6-jagan@amarulasolutions.com>
 <CAGb2v669MprYgy2wc_a7Kz8VpzzNGZxDxsj0z_Ujx5bV25+AWQ@mail.gmail.com>
In-Reply-To: <CAGb2v669MprYgy2wc_a7Kz8VpzzNGZxDxsj0z_Ujx5bV25+AWQ@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 17 Jun 2019 15:59:50 +0530
Message-ID: <CAMty3ZDRYBPKrGQxAZoB+trFiDLJ5BxDfNUOnPzgd+UWcpwCoQ@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH v2 5/9] drm/sun4i: tcon_top: Register clock
 gates in probe
To: Chen-Yu Tsai <wens@csie.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=A3LvCS5kePEpWEvClGh/PP2SpGvm/yzihiihioMrY5k=;
 b=jqOLuFeF4GE1iGwe0cDirezg+Mb6UQt3wXl2PORtVhgBmE9NFT/nmPOxg0c7AfaGQh
 EgRs0yehyHSaINpG+JBfl2z9p4qjCTaHYSNjRWS7+//YkWGC9Z63BrC4T0eWwes7EQWK
 Pb7HfML/Ga1WpDYchH7O24sH/hoVsOgWkj7So=
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdW4gMTYsIDIwMTkgYXQgMTE6MDEgQU0gQ2hlbi1ZdSBUc2FpIDx3ZW5zQGNzaWUu
b3JnPiB3cm90ZToKPgo+IE9uIFNhdCwgSnVuIDE1LCAyMDE5IGF0IDEyOjQ0IEFNIEphZ2FuIFRl
a2kgPGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29tPiB3cm90ZToKPiA+Cj4gPiBUQ09OIFRPUCBo
YXZlIGNsb2NrIGdhdGVzIGZvciBUVjAsIFRWMSwgZHNpIGFuZCByaWdodAo+ID4gbm93IHRoZXNl
IGFyZSByZWdpc3RlciBkdXJpbmcgYmluZCBjYWxsLgo+ID4KPiA+IE9mIHdoaWNoLCBkc2kgY2xv
Y2sgZ2F0ZSB3b3VsZCByZXF1aXJlZCBkdXJpbmcgRFBIWSBwcm9iZQo+ID4gYnV0IHNhbWUgY2Fu
IG1pc3MgdG8gZ2V0IHNpbmNlIHRjb24gdG9wIGlzIG5vdCBib3VuZCBhdAo+ID4gdGhhdCB0aW1l
Lgo+ID4KPiA+IFRvIHNvbHZlLCB0aGlzIGNpcmN1bGFyIGRlcGVuZGVuY3kgbW92ZSB0aGUgY2xv
Y2sgZ2F0ZQo+ID4gcmVnaXN0cmF0aW9uIGZyb20gYmluZCB0byBwcm9iZSBzby10aGF0IERQSFkg
Y2FuIGdldCB0aGUKPiA+IGRzaSBnYXRlIGNsb2NrIG9uIHRpbWUuCj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogSmFnYW4gVGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gPiAtLS0KPiA+
ICBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfdGNvbl90b3AuYyB8IDk0ICsrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKyksIDQ1
IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkv
c3VuOGlfdGNvbl90b3AuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW44aV90Y29uX3RvcC5j
Cj4gPiBpbmRleCA0NjVlOWIwY2RmZWUuLmE4OTc4YjNmZTg1MSAxMDA2NDQKPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9zdW40aS9zdW44aV90Y29uX3RvcC5jCj4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vc3VuNGkvc3VuOGlfdGNvbl90b3AuYwo+ID4gQEAgLTEyNCw3ICsxMjQsNTMgQEAgc3Rh
dGljIHN0cnVjdCBjbGtfaHcgKnN1bjhpX3Rjb25fdG9wX3JlZ2lzdGVyX2dhdGUoc3RydWN0IGRl
dmljZSAqZGV2LAo+ID4gIHN0YXRpYyBpbnQgc3VuOGlfdGNvbl90b3BfYmluZChzdHJ1Y3QgZGV2
aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3RlciwKPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB2b2lkICpkYXRhKQo+ID4gIHsKPiA+IC0gICAgICAgc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldiA9IHRvX3BsYXRmb3JtX2RldmljZShkZXYpOwo+ID4gKyAgICAgICBzdHJ1
Y3Qgc3VuOGlfdGNvbl90b3AgKnRjb25fdG9wID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4gPiAr
ICAgICAgIGludCByZXQ7Cj4gPiArCj4gPiArICAgICAgIHJldCA9IHJlc2V0X2NvbnRyb2xfZGVh
c3NlcnQodGNvbl90b3AtPnJzdCk7Cj4gPiArICAgICAgIGlmIChyZXQpIHsKPiA+ICsgICAgICAg
ICAgICAgICBkZXZfZXJyKGRldiwgIkNvdWxkIG5vdCBkZWFzc2VydCBjdHJsIHJlc2V0IGNvbnRy
b2xcbiIpOwo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiArICAgICAgIH0KPiA+
ICsKPiA+ICsgICAgICAgcmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxlKHRjb25fdG9wLT5idXMpOwo+
ID4gKyAgICAgICBpZiAocmV0KSB7Cj4gPiArICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJD
b3VsZCBub3QgZW5hYmxlIGJ1cyBjbG9ja1xuIik7Cj4gPiArICAgICAgICAgICAgICAgZ290byBl
cnJfYXNzZXJ0X3Jlc2V0Owo+ID4gKyAgICAgICB9Cj4KPiBZb3UgaGF2ZSB0byBkZS1hc3NlcnQg
dGhlIHJlc2V0IGNvbnRyb2wgYW5kIGVuYWJsZSB0aGUgY2xvY2sgYmVmb3JlIHRoZQo+IGNsb2Nr
cyBpdCBwcm92aWRlcyBhcmUgcmVnaXN0ZXJlZC4gT3RoZXJ3aXNlIGEgY29uc3VtZXIgbWF5IGNv
bWUgaW4gYW5kCj4gYXNrIGZvciB0aGUgcHJvdmlkZWQgY2xvY2sgdG8gYmUgZW5hYmxlZCwgYnV0
IHNpbmNlIHRoZSBUQ09OIFRPUCdzIG93bgo+IHJlc2V0IGFuZCBjbG9jayBhcmUgc3RpbGwgZGlz
YWJsZWQsIHlvdSBjYW4ndCBhY3R1YWxseSBhY2Nlc3MgdGhlIHJlZ2lzdGVycwo+IHRoYXQgY29u
dHJvbHMgdGhlIHByb3ZpZGVkIGNsb2NrLgoKVGhlc2UgcnN0IGFuZCBidXMgYXJlIGNvbW1vbiBy
ZXNldCBhbmQgYnVzIGNsb2NrcyBub3QgdGNvbiB0b3AgY2xvY2tzCnRoYXQgYXJlIHRyeWluZyB0
byByZWdpc3RlciBoZXJlLiBpZSByZWFzb24gSSBoYXZlIG5vdCBtb3ZlZCBpdCBpbgp0b3AuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
