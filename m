Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 331DE3C9D1
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 13:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCF658918A;
	Tue, 11 Jun 2019 11:14:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22549890F7
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 11:14:51 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id a14so17599571edv.12
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 04:14:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=S73QLp7k1DkLPMyXaGEI7D4IlPsMyzjHBqCjsls845U=;
 b=lzaz2BuXNhd1/1/v9SuCs6yYf/H7/I3L4YODF52FPOgLV4lu/yjcdN2CLzKgpF9BUy
 tMJEIXpoRMIe20XAENPMigvsO+OMTO3GTZ4GliOakAgh1r8oVKujQU4Xo61KA/0GFzRw
 wC21We05p4UqiW67B5lDT6NsEnCtemQvN1iolQHkr68RJaxxfyFr0CiZfnPv1S6/4qO1
 +mTCrkJ9pzIOW/W5A3Kg2GYD2G+5LnI5X66CvdDooiBHuiTAOFXjcF5lPBx5GJdRPKT4
 gp39CYiX895PzKRcjJx3Q5hEdv4kQ4Foy3Ylq46n/roZAXVNkOl1UxUbEIwdNwAnasZ/
 mFbA==
X-Gm-Message-State: APjAAAVEsIxPB/xE+E4LjZeRu8qCxX3KWEJ3mwK6ATm5xHCk4VObmpbU
 +u/MCyvbx9vMC3xlwQJjwEo9Zw==
X-Google-Smtp-Source: APXvYqzUxEkCuN8r8cG9MfXkZcN34e68nY4KH42pTdAqiBno+kj8cmEaUq0yrdb9R0+twEpIPz8Y6g==
X-Received: by 2002:a50:a389:: with SMTP id s9mr80137619edb.113.1560251689829; 
 Tue, 11 Jun 2019 04:14:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n5sm3542176edt.65.2019.06.11.04.14.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 04:14:48 -0700 (PDT)
Date: Tue, 11 Jun 2019 13:14:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [GIT PULL FOR v5.3] R-Car DU changes, v2
Message-ID: <20190611111442.GA2458@phenom.ffwll.local>
References: <20190607234743.GD5110@pendragon.ideasonboard.com>
 <20190608134652.GE4786@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190608134652.GE4786@pendragon.ideasonboard.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=S73QLp7k1DkLPMyXaGEI7D4IlPsMyzjHBqCjsls845U=;
 b=PNIHMXWmURFR09YuixNt0dp7WyiPRhWU/2GKQB3+TssxtDwZBi43ksZoUk/wRPj7MR
 5yZWkZzpUPSsiP6PwnKZ34JcedWYC24gP/EGM0cXZsaxgsfhHUdZoFtmvh5l/58rltFG
 IZD9OeKm6dWT18OnXsqZhWLku2k+oMZcG02Qw=
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
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBKdW4gMDgsIDIwMTkgYXQgMDQ6NDY6NTJQTSArMDMwMCwgTGF1cmVudCBQaW5jaGFy
dCB3cm90ZToKPiBIaSBEYXZlLAo+IAo+IElmIHlvdSBoYXZlbid0IHB1bGxlZCB0aGUgcHJldmlv
dXMgcHVsbCByZXF1ZXN0IHlldCwgcGxlYXNlIGRpc3JlZ2FyZCBpdAo+IGFuZCBwcm9jZXNzIHRo
aXMgb25lIGluc3RlYWQuIEl0IGNvbnRhaW5zIGFkZGl0aW9uYWwgcGF0Y2hlcyB0aGF0IGFkZAo+
IHN1cHBvcnQgZm9yIG1vcmUgcGxhbmUgZm9ybWF0cy4KPiAKPiBUaGUgZm9sbG93aW5nIGNoYW5n
ZXMgc2luY2UgY29tbWl0IGExODgzMzljYTVhMzk2YWNjNTg4ZTU4NTFlZDdlMTlmNjZiMGViZDk6
Cj4gCj4gICBMaW51eCA1LjItcmMxICgyMDE5LTA1LTE5IDE1OjQ3OjA5IC0wNzAwKQo+IAo+IGFy
ZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Ogo+IAo+ICAgZ2l0Oi8vbGludXh0
di5vcmcvcGluY2hhcnRsL21lZGlhLmdpdCB0YWdzL2R1LW5leHQtMjAxOTA2MDgtMgo+IAo+IGZv
ciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBjYjVmMTViNzExZDNhY2U3YjI5MzY5NjU3NDg3
ZjEyODFhNGE1ZWFjOgo+IAo+ICAgZHJtOiByY2FyLWR1OiBBZGQgc3VwcG9ydCBmb3IgbWlzc2lu
ZyAxNi1iaXQgUkdCMTU1NSBmb3JtYXRzICgyMDE5LTA2LTA4IDE2OjM2OjQxICswMzAwKQo+IAo+
IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KPiBSLUNhciBEVSBjaGFuZ2VzIGZvciB2NS4zOgo+IAo+IC0gUjhBNzc0QTEgU29D
IHN1cHBvcnQKPiAtIExWRFMgZHVhbC1saW5rIG1vZGUgc3VwcG9ydAo+IC0gU3VwcG9ydCBmb3Ig
YWRkaXRpb25hbCBmb3JtYXRzCj4gLSBNaXNjIGZpeGVzCgpJIHdhc24ndCBxdWl0ZSBzdXJlIHdo
ZXRoZXIgdGhpcyBoYXMgZW5vdWdoIGR0LWFja3MsIGJ1dCBJIGd1ZXNzIG9uZSByLWIKZnJvbSBS
b2Igb24gdGhlIG1haW4gZHQgcGF0Y2ggc2hvdWxkIGJlIGVub3VnaC4gQW5kIGV2ZXJ5dGhpbmcg
ZWxzZSBsb29rcwp2ZXJ5IG5lYXRseSByZXZpZXdlZCEKClRoYW5rcywgcHVsbGVkLgotRGFuaWVs
Cgo+IAo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KPiBCaWp1IERhcyAoNCk6Cj4gICAgICAgZHQtYmluZGluZ3M6IGRpc3Bs
YXk6IHJlbmVzYXM6IGR1OiBEb2N1bWVudCB0aGUgcjhhNzc0YTEgYmluZGluZ3MKPiAgICAgICBk
dC1iaW5kaW5nczogZGlzcGxheTogcmVuZXNhczogbHZkczogRG9jdW1lbnQgcjhhNzc0YTEgYmlu
ZGluZ3MKPiAgICAgICBkcm06IHJjYXItZHU6IEFkZCBSOEE3NzRBMSBzdXBwb3J0Cj4gICAgICAg
ZHJtOiByY2FyLWR1OiBsdmRzOiBBZGQgcjhhNzc0YTEgc3VwcG9ydAo+IAo+IEtpZXJhbiBCaW5n
aGFtICgxKToKPiAgICAgICBkcm06IHJjYXItZHU6IHdyaXRlYmFjazogaW5jbHVkZSBpbnRlcmZh
Y2UgaGVhZGVyCj4gCj4gTGF1cmVudCBQaW5jaGFydCAoMTApOgo+ICAgICAgIGRybTogYnJpZGdl
OiBBZGQgZHVhbF9saW5rIGZpZWxkIHRvIHRoZSBkcm1fYnJpZGdlX3RpbWluZ3Mgc3RydWN0dXJl
Cj4gICAgICAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IGJyaWRnZTogdGhjNjNsdmQxMDI0OiBEb2N1
bWVudCBkdWFsLWxpbmsgb3BlcmF0aW9uCj4gICAgICAgZHJtOiBicmlkZ2U6IHRoYzYzOiBSZXBv
cnQgaW5wdXQgYnVzIG1vZGUgdGhyb3VnaCBicmlkZ2UgdGltaW5ncwo+ICAgICAgIGR0LWJpbmRp
bmdzOiBkaXNwbGF5OiByZW5lc2FzOiBsdmRzOiBBZGQgcmVuZXNhcyxjb21wYW5pb24gcHJvcGVy
dHkKPiAgICAgICBkcm06IHJjYXItZHU6IGx2ZHM6IFJlbW92ZSBMVkRTIGRvdWJsZS1lbmFibGUg
Y2hlY2tzCj4gICAgICAgZHJtOiByY2FyLWR1OiBsdmRzOiBBZGQgc3VwcG9ydCBmb3IgZHVhbC1s
aW5rIG1vZGUKPiAgICAgICBkcm06IHJjYXItZHU6IFNraXAgTFZEUzEgb3V0cHV0IG9uIEdlbjMg
d2hlbiB1c2luZyBkdWFsLWxpbmsgTFZEUyBtb2RlCj4gICAgICAgZHJtOiByY2FyLWR1OiBBZGQg
c3VwcG9ydCBmb3IgbWlzc2luZyAzMi1iaXQgUkdCIGZvcm1hdHMKPiAgICAgICBkcm06IHJjYXIt
ZHU6IEFkZCBzdXBwb3J0IGZvciBtaXNzaW5nIDE2LWJpdCBSR0I0NDQ0IGZvcm1hdHMKPiAgICAg
ICBkcm06IHJjYXItZHU6IEFkZCBzdXBwb3J0IGZvciBtaXNzaW5nIDE2LWJpdCBSR0IxNTU1IGZv
cm1hdHMKPiAKPiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3JlbmVzYXMsbHZkcy50eHQg
ICAgICAgfCAgMTkgKystCj4gIC4uLi9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS90aGluZSx0aGM2
M2x2ZDEwMjQudHh0IHwgICA2ICsKPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9y
ZW5lc2FzLGR1LnR4dCAgICAgfCAgIDIgKwo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RoYzYz
bHZkMTAyNC5jICAgICAgICAgICAgICB8ICA1NCArKysrKysrLS0KPiAgZHJpdmVycy9ncHUvZHJt
L3JjYXItZHUvcmNhcl9kdV9kcnYuYyAgICAgICAgICAgICAgfCAgMzAgKysrKysKPiAgZHJpdmVy
cy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9lbmNvZGVyLmMgICAgICAgICAgfCAgMTIgKysKPiAg
ZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9rbXMuYyAgICAgICAgICAgICAgfCAgODIg
KysrKysrKysrKysrLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X3dyaXRlYmFj
ay5jICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5j
ICAgICAgICAgICAgICAgIHwgMTI3ICsrKysrKysrKysrKysrKy0tLS0tLQo+ICBkcml2ZXJzL2dw
dS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuaCAgICAgICAgICAgICAgICB8ICAgNSArCj4gIGluY2x1
ZGUvZHJtL2RybV9icmlkZ2UuaCAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA4ICsrCj4g
IDExIGZpbGVzIGNoYW5nZWQsIDI5OCBpbnNlcnRpb25zKCspLCA0OCBkZWxldGlvbnMoLSkKPiAK
PiAtLSAKPiBSZWdhcmRzLAo+IAo+IExhdXJlbnQgUGluY2hhcnQKPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCi0tIApEYW5pZWwgVmV0dGVyClNv
ZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
