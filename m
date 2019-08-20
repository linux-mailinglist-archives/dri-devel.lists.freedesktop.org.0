Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 380AF95A88
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 11:00:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A57FF89B3B;
	Tue, 20 Aug 2019 09:00:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8C889B3C
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 09:00:04 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id h13so5438927edq.10
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 02:00:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=CplLebVnHKp+Bo2pMoZ3/QCHp2aER4JzLA1rf8nhh98=;
 b=rWnOnEw71abgM548LavxpoxXSNCd+v8nTyMf26edtccjTCbZTxDqYNR2lq8nHHEapS
 Ixrgl/PYmJ2JUsMprTW9Qv2kJkz5A+xgIDm8GTj32BTeuQE2kGps9esBVCFB7uWoIUf7
 /lec9pK6LSWcXaE4fhspTDN2D0e4qtTDUBorAD0AkjrW40j3U0duDdMrEtqaZbFiZu9w
 8x7IFZyAPvI7kdby9V/mhfjeSfy4oSqQgnEnjJKOwFDE9DFJUVyQ5yeiMo+L/hm6hVQG
 6Z3kZKBHXhcUxt060rIrA5gtUOrnZoLK8NY/5mTiEwJjIafpwG451zcS3yW8nLUI2LTL
 sPFQ==
X-Gm-Message-State: APjAAAUo5DqaT9IHGA9cZblYqvznVh0wi31i9oKDBjMbwz3ZeMXvJD/y
 FrkeGyX3SdUsU616CemjojGjhA==
X-Google-Smtp-Source: APXvYqx0W2lSQ7x9CXjPnx56UlU+GARep3Xj9t36tLq2IvkE0LlryFWv7PJMDF6JL7DV/VmR+P6IZA==
X-Received: by 2002:a50:c38f:: with SMTP id h15mr8239225edf.256.1566291601764; 
 Tue, 20 Aug 2019 02:00:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id va28sm2485148ejb.36.2019.08.20.02.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 02:00:01 -0700 (PDT)
Date: Tue, 20 Aug 2019 10:59:59 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 1/2] video: omapfb2: Make standard and custom panel
 drivers mutually exclusive
Message-ID: <20190820085959.GD11147@phenom.ffwll.local>
References: <20190816122228.9475-1-laurent.pinchart@ideasonboard.com>
 <20190816122228.9475-2-laurent.pinchart@ideasonboard.com>
 <20190816173105.GA9934@ravnborg.org>
 <20190816183905.GA17858@pendragon.ideasonboard.com>
 <20190816191131.GA29151@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190816191131.GA29151@ravnborg.org>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=CplLebVnHKp+Bo2pMoZ3/QCHp2aER4JzLA1rf8nhh98=;
 b=AwXSkGYAegT2JvYdbZQ5tmv2mrOJNMwo6n0eP+UfAGJEcgLRWKjdQgepV85KHjWoGT
 ajLGgw3ln1RY/pHWB5yiRv20hNCP8u9tD9xU9sdm6/qHj6c6UJEBp713DJN/zoTwd0dk
 NcJII1fR2FCTW//Q4ucaAIByS10Sb0U9aFeh4=
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMDk6MTE6MzFQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IEhpIExhdXJlbnQuCj4gCj4gT24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMDk6Mzk6MDVQ
TSArMDMwMCwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiA+IEhpIFNhbSwKPiA+IAo+ID4gT24g
RnJpLCBBdWcgMTYsIDIwMTkgYXQgMDc6MzE6MDVQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdyb3Rl
Ogo+ID4gPiBIaSBMYXVyZW50Cj4gPiA+IAo+ID4gPiBUaGFua3MgZm9yIGJlYXRpbmcgbWUgb24g
dGhpcyEKPiA+ID4gCj4gPiA+IE9uIEZyaSwgQXVnIDE2LCAyMDE5IGF0IDAzOjIyOjI3UE0gKzAz
MDAsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gPiA+ID4gU3RhbmRhcmQgRFJNIHBhbmVsIGRy
aXZlcnMgZm9yIHNldmVyYWwgcGFuZWxzIHVzZWQgYnkgb21hcGZiMiBhcmUgbm93Cj4gPiA+ID4g
YXZhaWxhYmxlLiBUaGVpciBtb2R1bGUgbmFtZSBjbGFzaGVzIHdpdGggdGhlIG1vZHVsZXMgZnJv
bQo+ID4gPiA+IGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rpc3BsYXlzLywgcGFydCBvZiB0aGUg
ZGVwcmVjYXRlZCBvbWFwZmIyIGZiZGV2Cj4gPiA+ID4gZHJpdmVyLiBBcyBvbWFwZmIyIGNhbiBv
bmx5IGJlIGNvbXBpbGVkIHdoZW4gdGhlIG9tYXBkcm0gZHJpdmVyIGlzCj4gPiA+ID4gZGlzYWJs
ZWQsIGFuZCB0aGUgRFJNIHBhbmVsIGRyaXZlcnMgYXJlIHVzZWxlc3MgaW4gdGhhdCBjYXNlLCBt
YWtlIHRoZQo+ID4gPiA+IG9tYXBmYjIgcGFuZWxzIGRlcGVuZCBvbiB0aGUgc3RhbmRhcmQgRFJN
IHBhbmVscyBiZWluZyBkaXNhYmxlZCB0byBmaXgKPiA+ID4gPiB0aGUgbmFtZSBjbGFzaC4KPiA+
ID4gPiAKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBp
bmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIGRyaXZlcnMvdmlk
ZW8vZmJkZXYvb21hcDIvb21hcGZiL2Rpc3BsYXlzL0tjb25maWcgfCA1ICsrKysrCj4gPiA+ID4g
IDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPiA+ID4gPiAKPiA+ID4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9vbWFwMi9vbWFwZmIvZGlzcGxheXMvS2NvbmZpZyBi
L2RyaXZlcnMvdmlkZW8vZmJkZXYvb21hcDIvb21hcGZiL2Rpc3BsYXlzL0tjb25maWcKPiA+ID4g
PiBpbmRleCA4YzFjNWE0Y2ZlMTguLjc0NDQxNmRjNTMwZSAxMDA2NDQKPiA+ID4gPiAtLS0gYS9k
cml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kaXNwbGF5cy9LY29uZmlnCj4gPiA+ID4g
KysrIGIvZHJpdmVycy92aWRlby9mYmRldi9vbWFwMi9vbWFwZmIvZGlzcGxheXMvS2NvbmZpZwo+
ID4gPiA+IEBAIC00OSw2ICs0OSw3IEBAIGNvbmZpZyBGQl9PTUFQMl9QQU5FTF9EU0lfQ00KPiA+
ID4gPiAgY29uZmlnIEZCX09NQVAyX1BBTkVMX1NPTllfQUNYNTY1QUtNCj4gPiA+ID4gIAl0cmlz
dGF0ZSAiQUNYNTY1QUtNIFBhbmVsIgo+ID4gPiA+ICAJZGVwZW5kcyBvbiBTUEkgJiYgQkFDS0xJ
R0hUX0NMQVNTX0RFVklDRQo+ID4gPiA+ICsJZGVwZW5kcyBvbiBEUk1fUEFORUxfU09OWV9BQ1g1
NjVBS00gPSBuCj4gPiA+IAo+ID4gPiBXb3VsZDoKPiA+ID4gCWRlcGVuZHMgb24gIURSTV9QQU5F
TF9TT05ZX0FDWDU2NUFLTQo+ID4gPiAKPiA+ID4gZG8gdGhlIHNhbWU/Cj4gPiA+IAo+ID4gPiBF
eGFtcGxlOgo+ID4gPiBjb25maWcgRkJfSU5URUwKPiA+ID4gICAgICAgICB0cmlzdGF0ZSAiSW50
ZWwgODMwTS84NDVHLzg1MkdNLzg1NUdNLzg2NUcvOTE1Ry85NDVHLzk0NUdNLzk2NUcvOTY1R00g
c3VwcG9ydCIKPiA+ID4gICAgICAgICBkZXBlbmRzIG9uIEZCICYmIFBDSSAmJiBYODYgJiYgQUdQ
X0lOVEVMICYmIEVYUEVSVAo+ID4gPiAJLi4uCj4gPiA+ICAgICAgICAgZGVwZW5kcyBvbiAhRFJN
X0k5MTUKPiA+ID4gCj4gPiA+IAo+ID4gPiBEUk1fOTE1IGlzIGEgdHJpc3RhdGUgc3ltYm9sLgo+
ID4gPiAKPiA+ID4gSXQgaXMgbWF5YmUgYmlrZXNoZWRkaW5nLCBidXQgdGhlICE8U1lNQk9MPiBz
ZWVtcyBtb3JlIGxvZ2ljYWwvcmVhZGFibGUgdG8gbWUuCj4gPiAKPiA+IFRoZSB0d28gYXJlIGVx
dWl2YWxlbnQgYXMgZmFyIGFzIEkgY2FuIHRlbGwsIHNvIEknbSBmaW5lIHdpdGggITxTWU1CT0w+
Lgo+ID4gV291bGQgeW91IGNoYW5nZSB0aGF0IHdoZW4gYXBwbHlpbmcsIG9yIHNob3VsZCBJIHNl
bmQgYSB2MiA/Cj4gCj4gSSBmYWlsZWQgdG8gY29udmluY2UgbXlzZWxmIHRoZXkgYXJlIGVxdWl2
YWxlbnQuCj4gCj4gRnJvbSBrY29uZmlnLWxhbmd1YWUucnN0Ogo+IAo+ICIKPiAnIScgPGV4cHI+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgKDYpCj4gKDYpIFJldHVybnMgdGhlIHJlc3VsdCBv
ZiAoMi0vZXhwci8pLgo+IAo+IEFuIGV4cHJlc3Npb24gY2FuIGhhdmUgYSB2YWx1ZSBvZiAnbics
ICdtJyBvciAneScgKG9yIDAsIDEsIDIKPiByZXNwZWN0aXZlbHkgZm9yIGNhbGN1bGF0aW9ucyku
IEEgbWVudSBlbnRyeSBiZWNvbWVzIHZpc2libGUgd2hlbiBpdHMKPiBleHByZXNzaW9uIGV2YWx1
YXRlcyB0byAnbScgb3IgJ3knLgo+ICIKPiAKPiBTbyAhPFNZTUJPTD4gZXF1YWxzIDEgZm9yIG0g
YW5kIDAgZm9yIHkuIElmIEkgZ2V0IGl0IHJpZ2h0Lgo+IAo+IE15IHRlc3Rpbmcgd2FzIG5vdCBm
dWxseSBjb25jbHVzaXZlLgo+IAo+IFNvIEkgbGVmdCBpdCBhcyBpcy4KPiBBZGRlZCBhIGZldyBG
aXhlczogZXRjLiB0YWdzLgo+IEFwcGxpZWQgYW5kIHB1c2hlZCB0byBkcm0tbWlzYy1uZXh0Lgo+
IAo+IE9oaCwgYW5kIGRpbSBjYW1lIHRvIG15IHJlc2N1ZS4gTXkgRml4ZXM6IHN5bnRheCB3YXMg
d3JvbmcgYnV0IGl0IHdhcwo+IGNhdWdodCBpbiBteSAiZGltIHB1c2giIC0gbmljZS4KCkFzaWRl
OiBkaW0gZml4ZXMgYW5kIGRpbSBjaXRlIHNob3VsZCBnZW5lcmF0ZSBjb25mb3JtYW50IGNvbW1p
dCBjaXRhdGlvbnMuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIs
IEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
