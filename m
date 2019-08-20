Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C9A9595F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 10:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 315F16E69E;
	Tue, 20 Aug 2019 07:53:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B486E69E
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 07:53:56 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id c7so4209613otp.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 00:53:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UeZCihW1/iCQp+6FgwvqZaN1t+fpmStZoau36fwpTT8=;
 b=LxN11BCZt+qlNW/cxHM0m9QxZjG461RqAafkQ0DFcnQ+er9pnGKMVKsxS759uT2a9Z
 d3/BdvCkq1DURpB/JuZ0iO82Ig4hab+baZjUDhbfDkSrxbOyX563dZtwcKHDwKdDViMd
 5fbVxldDgfzLKvizmhqo75i/d28xBMh4hmI1donsHcTUXPDYbgxlSRb3J4CePvYewt6u
 ZvWyxngmU1FV8A2fl0LeKdLv1AoLldpWq8mOoQTnYpPE+xsEi4TXokDJ/pyiPZWTi75b
 8kXBul0q+7khR1OtFAzKblPEVB5vj4E6bRkQB1XwL5ke6xGfuwzX9PF4NYQOtVEkAuoq
 IpqQ==
X-Gm-Message-State: APjAAAXjjq7+rtO6ecV67NzSzvVGmdYz4e2+De1Sb3kwi06xew9m0O1J
 HOz+8L9D0rkGjgMMeABKKM8CeIZugkYBEXPYlpE=
X-Google-Smtp-Source: APXvYqxi285mUlLiZy1iYv/ah5Dqi221sPkvqG1lYm/S6M3NNg6Amld+nigmYA87ocdOf24hemH7ijB43JtXkfCd1Yc=
X-Received: by 2002:a9d:68c5:: with SMTP id i5mr21320045oto.250.1566287635275; 
 Tue, 20 Aug 2019 00:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
 <20190706140746.29132-2-jacopo+renesas@jmondi.org>
 <CAMuHMdWVzm8yoZSoKZh3MJsaX4jCRXQCbn2x2LAu4UWtb1yYjw@mail.gmail.com>
 <CAMuHMdWFHDGPSZt2_H_sC9rCKDYBR0XDLn0TGxzPRxZsrOTEHw@mail.gmail.com>
 <20190820074826.5rdzeqyk6ylpjr7o@uno.localdomain>
In-Reply-To: <20190820074826.5rdzeqyk6ylpjr7o@uno.localdomain>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Aug 2019 09:53:44 +0200
Message-ID: <CAMuHMdXNJLLRqZCZ5KHkdUKgtwmE-F-s5Vi6P10xHR38n_=HrA@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] dt-bindings: display: renesas,
 cmm: Add R-Car CMM documentation
To: Jacopo Mondi <jacopo@jmondi.org>
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
Cc: muroya@ksk.co.jp, VenkataRajesh.Kalakodima@in.bosch.com,
 David Airlie <airlied@linux.ie>, Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKT24gVHVlLCBBdWcgMjAsIDIwMTkgYXQgOTo0NyBBTSBKYWNvcG8gTW9uZGkg
PGphY29wb0BqbW9uZGkub3JnPiB3cm90ZToKPiBPbiBNb24sIEF1ZyAxOSwgMjAxOSBhdCAwMzo0
NTo1NFBNICswMjAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gPiBPbiBNb24sIEp1bCA4
LCAyMDE5IGF0IDk6NTggQU0gR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9y
Zz4gd3JvdGU6Cj4gPiA+IE9uIFNhdCwgSnVsIDYsIDIwMTkgYXQgNDowNyBQTSBKYWNvcG8gTW9u
ZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+IHdyb3RlOgo+ID4gPiA+IEFkZCBkZXZpY2Ug
dHJlZSBiaW5kaW5ncyBkb2N1bWVudGF0aW9uIGZvciB0aGUgUmVuZXNhcyBSLUNhciBEaXNwbGF5
Cj4gPiA+ID4gVW5pdCBDb2xvciBNYW5hZ2VtZW50IE1vZHVsZS4KPiA+ID4gPgo+ID4gPiA+IENN
TSBpcyB0aGUgaW1hZ2UgZW5oYW5jZW1lbnQgbW9kdWxlIGF2YWlsYWJsZSBvbiBlYWNoIFItQ2Fy
IERVIHZpZGVvCj4gPiA+ID4gY2hhbm5lbCBvbiBSLUNhciBHZW4yIGFuZCBHZW4zIFNvQ3MgKFYz
SCBhbmQgVjNNIGV4Y2x1ZGVkKS4KPiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEphY29w
byBNb25kaSA8amFjb3BvK3JlbmVzYXNAam1vbmRpLm9yZz4KPiA+ID4gPiBSZXZpZXdlZC1ieTog
TGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+ID4g
Pgo+ID4gPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghCj4gPiA+Cj4gPiA+ID4gLS0tIC9kZXYvbnVs
bAo+ID4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L3JlbmVzYXMsY21tLnR4dAo+ID4gPiA+IEBAIC0wLDAgKzEsMjUgQEAKPiA+ID4gPiArKiBSZW5l
c2FzIFItQ2FyIENvbG9yIE1hbmFnZW1lbnQgTW9kdWxlIChDTU0pCj4gPiA+ID4gKwo+ID4gPiA+
ICtSZW5lc2FzIFItQ2FyIGltYWdlIGVuaGFuY2VtZW50IG1vZHVsZSBjb25uZWN0ZWQgdG8gUi1D
YXIgRFUgdmlkZW8gY2hhbm5lbHMuCj4gPiA+ID4gKwo+ID4gPiA+ICtSZXF1aXJlZCBwcm9wZXJ0
aWVzOgo+ID4gPiA+ICsgLSBjb21wYXRpYmxlOiBzaGFsbCBiZSBvbmUgb2Y6Cj4gPiA+ID4gKyAg
IC0gInJlbmVzYXMscmNhci1nZW4zLWNtbSIKPiA+ID4gPiArICAgLSAicmVuZXNhcyxyY2FyLWdl
bjItY21tIgo+ID4gPgo+ID4gPiBXaHkgZG8geW91IHRoaW5rIHlvdSBkbyBub3QgbmVlZCBTb0Mt
c3BlY2lmaWMgY29tcGF0aWJsZSB2YWx1ZXM/Cj4gPiA+IFdoYXQgaWYgeW91IGRpc2NvdmVyIGEg
ZGlmZmVyZW50IGFjcm9zcyB0aGUgUi1DYXIgR2VuMyBsaW5lIHRvbW9ycm93Pwo+ID4gPiBEb2Vz
IHRoZSBJUCBibG9jayBoYXZlIGEgdmVyc2lvbiByZWdpc3Rlcj8KPiA+Cj4gPiBEbyB5b3UgaGF2
ZSBhbiBhbnN3ZXIgdG8gdGhlc2UgcXVlc3Rpb25zPwo+Cj4gSXQgZG9lcyBub3Qgc2VlbSB0byBt
ZSB0aGF0IENNTSBoYXMgYW55IHZlcnNpb24gcmVnaXN0ZXIsIG5vciB0aGVyZQo+IGFyZSBkaWZm
ZXJlbmNlcyBiZXR3ZWVuIHRoZSBkaWZmZXJlbnQgR2VuMyBTb0NzLi4KPgo+IEhvd2V2ZXIsIGV2
ZW4gaWYgd2Ugbm93IGRlZmluZSBhIHNpbmdsZSBjb21wYXRpYmxlIHByb3BlcnR5IGZvcgo+IGdl
bjMvZ2VuMiBhbmQgd2UgbGF0ZXIgZmluZCBvdXQgb25lIG9mIHRoZSBTb0MgbmVlZHMgYSBzb2Mt
c3BlY2lmaWMKPiBwcm9wZXJ0eSB3ZSBjYW4gc2FmZWx5IGFkZCBpdCBhbmQga2VlcCB0aGUgZ2Vu
ZXJpYyBnZW4zL2dlbjIgb25lIGFzCj4gZmFsbGJhY2suLiBEb2VzIGl0IHdvcmsgZm9yIHlvdT8K
ClVuZm9ydHVuYXRlbHkgdGhhdCB3b24ndCB3b3JrLCBhcyB0aGUgZXhpc3RpbmcgRFRCcyB3b24n
dCBoYXZlIHRoZQpzb2Mtc3BlY2lmaWMgY29tcGF0aWJsZSB2YWx1ZS4KWW91IGNvdWxkIHN0aWxs
IHJlc29ydCB0byBzb2NfZGV2aWNlX21hdGNoKCksIGJ1dCBpdCBpcyBiZXR0ZXIgdG8gYXZvaWQg
dGhhdC4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQK
Ci0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBp
YTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdp
dGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdt
IHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRo
aW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBU
b3J2YWxkcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
