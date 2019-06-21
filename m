Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C854E2D3
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 11:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1626E83F;
	Fri, 21 Jun 2019 09:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF136E83F
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 09:13:53 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id s49so9110018edb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 02:13:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=2bGIaORqqfh7NthvfPKeSWzPcbNzBBYxFsaIjbRgqzI=;
 b=WPPzs8aWSQgC2M++xhzJud4auh2aJ2yxegppcw2/JOZ5P32RueAbjNVtdcbdBzrSkZ
 kwtKHFY/29Dy27SvRs9Jltqc9wtUcpGVHIjqSO6u034NjgTCo0YhZer+OCJKAEG3pOIE
 PP5TuftL456yflvcZVEizb7/AlBqW9V4nSernTo+b6kX5auaHbu6HxG7UVIyVviwEUeB
 cAHeIHuNPQtuUbb61S4Lrdri2rHetDEByaR39jM72GJSL0FMVBtpekQRBHHqR0hpQp/n
 huf8Ta4nlrxxc77EmLbIt99wkoUwG3B6wJ23VzmZHQ9ztEk/zQMgEoQjsX8bseA5yPtn
 OSkA==
X-Gm-Message-State: APjAAAUAaceWfZG1+vLSSOquqlyxQwuhMRViETi6UN1GzZOjKTVgWwW2
 lcZ+IpQL43M11rky7m2+5sGa/Q==
X-Google-Smtp-Source: APXvYqw14PDnEzjHiPPTDgNf/p3y3XKQE24CKUmI/tC7fQOPfvWanfqpuXk6IlS1WmRPiRcr2v9GQA==
X-Received: by 2002:aa7:c619:: with SMTP id h25mr82941231edq.295.1561108431657; 
 Fri, 21 Jun 2019 02:13:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id p18sm327962ejr.61.2019.06.21.02.13.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 21 Jun 2019 02:13:50 -0700 (PDT)
Date: Fri, 21 Jun 2019 11:13:43 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 2/2] DRM: Add KMS driver for the Ingenic JZ47xx SoCs
Message-ID: <20190621091343.GA12905@phenom.ffwll.local>
Mail-Followup-To: Paul Cercueil <paul@crapouillou.net>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, od@zcrc.me,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Artur Rojek <contact@artur-rojek.eu>
References: <20190603152331.23160-1-paul@crapouillou.net>
 <20190603152331.23160-2-paul@crapouillou.net>
 <20190619122622.GB29084@ravnborg.org>
 <1561040159.1978.0@crapouillou.net>
 <20190621090411.GY12905@phenom.ffwll.local>
 <1561108050.1777.0@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1561108050.1777.0@crapouillou.net>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=2bGIaORqqfh7NthvfPKeSWzPcbNzBBYxFsaIjbRgqzI=;
 b=cVvcQJ3ufJ+1Qqgqq4fWCNNUQ+RUopn+7hW8VyzYhB/jgWEmSBwXkOA93mdNxl3+4x
 zec6W4/WvUs2j9kiT0afQFuRDsf2jTsrbeZ/NhVF42PG33pIHNkX5BLj1IoYDgn31T0W
 iD8ZlugNc30sg2bDloI5XgFiyGiO1MB3lbZrE=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, od@zcrc.me,
 Artur Rojek <contact@artur-rojek.eu>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMTE6MDc6MzBBTSArMDIwMCwgUGF1bCBDZXJjdWVpbCB3
cm90ZToKPiAKPiAKPiBMZSB2ZW4uIDIxIGp1aW4gMjAxOSDDoCAxMTowNCwgRGFuaWVsIFZldHRl
ciA8ZGFuaWVsQGZmd2xsLmNoPiBhIMOpY3JpdCA6Cj4gPiBPbiBUaHUsIEp1biAyMCwgMjAxOSBh
dCAwNDoxNTo1OVBNICswMjAwLCBQYXVsIENlcmN1ZWlsIHdyb3RlOgo+ID4gPiAKPiA+ID4gCj4g
PiA+ICBMZSBtZXIuIDE5IGp1aW4gMjAxOSDDoCAxNDoyNiwgU2FtIFJhdm5ib3JnIDxzYW1AcmF2
bmJvcmcub3JnPiBhCj4gPiA+IMOpY3JpdCA6Cj4gPiA+ICA+IEhpIFBhdWwuCj4gPiA+ICA+Cj4g
PiA+ICA+IE9uIE1vbiwgSnVuIDAzLCAyMDE5IGF0IDA1OjIzOjMxUE0gKzAyMDAsIFBhdWwgQ2Vy
Y3VlaWwgd3JvdGU6Cj4gPiA+ICA+ID4gIEFkZCBhIEtNUyBkcml2ZXIgZm9yIHRoZSBJbmdlbmlj
IEpaNDd4eCBmYW1pbHkgb2YgU29Dcy4KPiA+ID4gID4gPiAgVGhpcyBkcml2ZXIgaXMgbWVhbnQg
dG8gcmVwbGFjZSB0aGUgYWdpbmcgano0NzQwLWZiIGRyaXZlci4KPiA+ID4gID4gPgo+ID4gPiAg
PiA+ICBUaGlzIGRyaXZlciBkb2VzIG5vdCBtYWtlIHVzZSBvZiB0aGUgc2ltcGxlIHBpcGUgaGVs
cGVyLCBmb3IKPiA+ID4gdGhlCj4gPiA+ICA+ID4gcmVhc29uCj4gPiA+ICA+ID4gIHRoYXQgaXQg
d2lsbCBzb29uIGJlIHVwZGF0ZWQgdG8gc3VwcG9ydCBtb3JlIGFkdmFuY2VkIGZlYXR1cmVzCj4g
PiA+IGxpa2UKPiA+ID4gID4gPiAgbXVsdGlwbGUgcGxhbmVzLCBJUFUgaW50ZWdyYXRpb24gZm9y
IGNvbG9yc3BhY2UgY29udmVyc2lvbiBhbmQKPiA+ID4gID4gPiB1cC9kb3duCj4gPiA+ICA+ID4g
IHNjYWxpbmcsIHN1cHBvcnQgZm9yIERTSSBkaXNwbGF5cywgYW5kIFRWLW91dCBhbmQgSERNSSBv
dXRwdXRzLgo+ID4gPiAgPiA+Cj4gPiA+ICA+ID4gIFNpZ25lZC1vZmYtYnk6IFBhdWwgQ2VyY3Vl
aWwgPHBhdWxAY3JhcG91aWxsb3UubmV0Pgo+ID4gPiAgPiA+ICBUZXN0ZWQtYnk6IEFydHVyIFJv
amVrIDxjb250YWN0QGFydHVyLXJvamVrLmV1Pgo+ID4gPiAgPiA+ICAtLS0KPiA+ID4gID4gPgo+
ID4gPiAgPiA+ICBOb3RlczoKPiA+ID4gID4gPiAgICAgIHYyOiAtIFJlbW92ZSBjdXN0b20gaGFu
ZGxpbmcgb2YgcGFuZWwuIFRoZSBwYW5lbCBpcyBub3cKPiA+ID4gID4gPiBkaXNjb3ZlcmVkIHVz
aW5nCj4gPiA+ICA+ID4gICAgICAJICB0aGUgc3RhbmRhcmQgQVBJLgo+ID4gPiAgPiA+ICAgICAg
CS0gTG90cyBvZiBzbWFsbCB0d2Vha3Mgc3VnZ2VzdGVkIGJ5IHVwc3RyZWFtCj4gPiA+ICA+ID4K
PiA+ID4gID4gPiAgICAgIHYzOiAtIFVzZSBkZXZtX2RybV9kZXZfaW5pdCgpCj4gPiA+ICA+ID4g
ICAgICAJLSBVcGRhdGUgY29tcGF0aWJsZSBzdHJpbmdzIHRvIC1sY2QgaW5zdGVhZCBvZiAtZHJt
Cj4gPiA+ICA+ID4gICAgICAJLSBBZGQgZGVzdHJveSgpIGNhbGxiYWNrcyB0byBwbGFuZSBhbmQg
Y3J0Ywo+ID4gPiAgPiA+ICAgICAgCS0gVGhlIGluZ2VuaWMsbGNkLW1vZGUgaXMgbm93IHJlYWQg
ZnJvbSB0aGUgYnJpZGdlJ3MgRFQKPiA+ID4gbm9kZQo+ID4gPiAgPiA+Cj4gPiA+ICA+ID4gICAg
ICB2NDogUmVtb3ZlIGluZ2VuaWMsbGNkLW1vZGUgcHJvcGVydHkgY29tcGxldGVseS4gVGhlCj4g
PiA+IHZhcmlvdXMKPiA+ID4gID4gPiBtb2RlcyBhcmUgbm93Cj4gPiA+ICA+ID4gICAgICAJZGVk
dWNlZCBmcm9tIHRoZSBjb25uZWN0b3IgdHlwZSwgdGhlIHBpeGVsIGZvcm1hdCBvciB0aGUKPiA+
ID4gYnVzCj4gPiA+ICA+ID4gZmxhZ3MuCj4gPiA+ICA+ID4KPiA+ID4gID4gPiAgICAgIHY1OiAt
IEZpeCBmcmFtZWJ1ZmZlciBzaXplIGluY29ycmVjdGx5IGNhbGN1bGF0ZWQgZm9yIDI0YnBwCj4g
PiA+ICA+ID4gZnJhbWVidWZmZXJzCj4gPiA+ICA+ID4gICAgICAJLSBVc2UgMzJicHAgZnJhbWVi
dWZmZXIgaW5zdGVhZCBvZiAxNmJwcCwgYXMgaXQnbGwgd29yawo+ID4gPiB3aXRoCj4gPiA+ICA+
ID4gYm90aAo+ID4gPiAgPiA+ICAgICAgCSAgMTYtYml0IGFuZCAyNC1iaXQgcGFuZWwKPiA+ID4g
ID4gPiAgICAgIAktIEdldCByaWQgb2YgZHJtX2Zvcm1hdF9wbGFuZV9jcHAoKSB3aGljaCBoYXMg
YmVlbiBkcm9wcGVkCj4gPiA+ICA+ID4gdXBzdHJlYW0KPiA+ID4gID4gPiAgICAgIAktIEF2b2lk
IHVzaW5nIGRybV9mb3JtYXRfaW5mby0+ZGVwdGgsIHdoaWNoIGlzIGRlcHJlY2F0ZWQuCj4gPiA+
ICA+IEluIHRoZSBkcm0gd29ybGQgd2UgaW5jbHVkZSB0aGUgcmV2aXNpb24gbm90ZXMgaW4gdGhl
IGNoYW5nZWxvZy4KPiA+ID4gID4gU28gSSBkaWQgdGhpcyB3aGVuIEkgYXBwbGllZCBpdCB0byBk
cm0tbWlzYy1uZXh0Lgo+ID4gPiAgPgo+ID4gPiAgPiBGaXhlZCBhIGZldyB0cml2aWFsIGNoZWNr
cGF0Y2ggd2FybmluZ3MgYWJvdXQgaW5kZW50IHRvby4KPiA+ID4gID4gVGhlcmUgd2FzIGEgZmV3
IHRvby1sb25nLWxpbmVzIHdhcm5pbmdzIHRoYXQgSSBpZ25vcmVkLiBGaXhpbmcKPiA+ID4gdGhl
bQo+ID4gPiAgPiB3b3VsZCBoYXZlIGh1cnQgcmVhZGFiaWxpdHkuCj4gPiA+IAo+ID4gPiAgVGhh
bmtzLgo+ID4gPiAKPiA+ID4gID4gSSBhc3N1bWUgeW91IHdpbGwgbWFpbnRhaW4gdGhpcyBkcml2
ZXIgb253YXJkcyBmcm9tIG5vdy4KPiA+ID4gID4gUGxlYXNlIHJlcXVlc3QgZHJtLW1pc2MgY29t
bWl0IHJpZ2h0cyAoc2VlCj4gPiA+ICA+IGh0dHBzOi8vd3d3LmZyZWVkZXNrdG9wLm9yZy93aWtp
L0FjY291bnRSZXF1ZXN0cy8pCj4gPiA+ICA+IFlvdSB3aWxsIG5lZWQgYSBsZWdhY3kgU1NIIGFj
Y291bnQuCj4gPiA+IAo+ID4gPiAgSSByZXF1ZXN0ZWQgYW4gYWNjb3VudCBoZXJlOgo+ID4gPiAg
aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2ZyZWVkZXNrdG9wL2ZyZWVkZXNrdG9wL2lz
c3Vlcy8xNjIKPiA+IAo+ID4gVGhpcyA0MDRzIGZvciBtZS4gRGlkIHlvdSBzZXQgdGhlIGlzc3Vl
IHRvIHByaXZhdGUgYnkgYW55IGNoYW5jZT8gT3IKPiA+IGRlbGV0ZWQgYWxyZWFkeSBhZ2Fpbj8K
PiA+IC1EYW5pZWwKPiAKPiBTb3JyeSwgeWVzLCBJIHNldCBpdCB0byBwcml2YXRlLiBJIHRob3Vn
aHQgSSBoYWQgdG8gOigKCldlbGwgSSBjYW4ndCBhY2sgaXQgaWYgaXRzIHByaXZhdGUsIHNvIHBs
ZWFzZSBjaGFuZ2UgdGhhdC4gQWxzbywKZXZlcnl0aGluZyBpcyBwdWJsaWMgYXJvdW5kIGhlcmUs
IG9yIGFsbW9zdCBldmVyeXRoaW5nIC4uLgotRGFuaWVsCgo+IAo+IC1QYXVsCj4gCj4gCj4gPiA+
IAo+ID4gPiAgPiBBbmQgeW91IHNob3VsZCBmYW1pbGlhcml6ZSB5b3Vyc2VsZiB3aXRoIHRoZSBt
YWludGFpbmVyLXRvb2xzOgo+ID4gPiAgPiBodHRwczovL2RybS5wYWdlcy5mcmVlZGVza3RvcC5v
cmcvbWFpbnRhaW5lci10b29scy9pbmRleC5odG1sCj4gPiA+ICA+Cj4gPiA+ICA+IEZvciBteSB1
c2UgSSB1c2UgImRpbSB1cGRhdGUtYnJhbmNoZXM7IGRpbSBhcHBseTsgZGltIHB1c2gKPiA+ID4g
ID4gU28gb25seSBhIHNtYWxsIHN1YnNldCBpIG5lZWRlZCBmb3Igc2ltcGxlIHVzZS4KPiA+ID4g
ID4KPiA+ID4gID4gCVNhbQo+ID4gPiAKPiA+ID4gCj4gPiAKPiA+IC0tCj4gPiBEYW5pZWwgVmV0
dGVyCj4gPiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KPiA+IGh0dHA6Ly9i
bG9nLmZmd2xsLmNoCj4gCj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwg
SW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
