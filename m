Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6360C45987
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 11:54:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B1B89700;
	Fri, 14 Jun 2019 09:54:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534BA896F7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 09:54:15 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id r12so483798edo.5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 02:54:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qHuGCrXRTUkFQGayB4c7fw1V8CKP+g27HnNUqp7luJE=;
 b=FxtvZ47kWjPzINjxB+3qB/e4co6C1qacuWUBxz2T/LhmHk9BzC2ruxh7Z1nzPmOy/j
 90EcNbC+WO+AUpaD+Su2Oui4tRJFfTgEZNjXLJ6wRdJ2Hvt0N+cjv0a4tCMtmXruz02t
 zj0xS2Z3oAU1kzfkOp+VuZuuasBkgJKixhCBvo5XqWCOBazfxw1pRVvXMfoktHfGPODm
 JCKQcWbIMRY/o7arlGDcenuI0RNmFTEkY2a1SJC72dCVf9vTvOScd35lfP3ekAY8sN24
 lLq53JYGBc6CKbM25gHEgoM5DDn4CoKtlOFoVHhg+nJlboRc+pK9a905bo6KYCvQs398
 JlzQ==
X-Gm-Message-State: APjAAAVfg5dBiSJ4SNB3K+jWwNsrKtdaGb6VMvldSMshN/MKoo2BzdCI
 Yz57eVRoYaOpWnfx0Lkj2h/Z77MDIU8=
X-Google-Smtp-Source: APXvYqwf5upEVFiDVnsKF6lwbcdtKMZ2VHZsM2lBFuduBd+bHriZlzPwsdDDUNV2k1KlHR+opB0ZfA==
X-Received: by 2002:a50:c908:: with SMTP id o8mr70317643edh.131.1560506053116; 
 Fri, 14 Jun 2019 02:54:13 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com.
 [209.85.128.45])
 by smtp.gmail.com with ESMTPSA id g18sm718869edh.13.2019.06.14.02.54.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 02:54:12 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id x15so1673905wmj.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 02:54:11 -0700 (PDT)
X-Received: by 2002:a1c:a186:: with SMTP id k128mr7440554wme.125.1560506051478; 
 Fri, 14 Jun 2019 02:54:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190613185241.22800-1-jagan@amarulasolutions.com>
 <20190613185241.22800-6-jagan@amarulasolutions.com>
 <CAGb2v654p=HZuXCTJkrbWbFP_kEkpRWHwj-7_Ck_=XbyMFmvFw@mail.gmail.com>
 <CAMty3ZD0atS2uWJmPB-n1wmy324JEpwt42=_wpKeF-8uxM-GbQ@mail.gmail.com>
In-Reply-To: <CAMty3ZD0atS2uWJmPB-n1wmy324JEpwt42=_wpKeF-8uxM-GbQ@mail.gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 14 Jun 2019 17:53:58 +0800
X-Gmail-Original-Message-ID: <CAGb2v66BOOydMRQprKAo87F2rpr+xgqWgpGt_cccoHf8+9AoNA@mail.gmail.com>
Message-ID: <CAGb2v66BOOydMRQprKAo87F2rpr+xgqWgpGt_cccoHf8+9AoNA@mail.gmail.com>
Subject: Re: [PATCH 5/9] ARM: dts: sun8i: r40: Add TCON TOP LCD clocking
To: Jagan Teki <jagan@amarulasolutions.com>
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

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgNTo0OCBQTSBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxh
c29sdXRpb25zLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIEp1biAxNCwgMjAxOSBhdCA5OjE2IEFN
IENoZW4tWXUgVHNhaSA8d2Vuc0Bjc2llLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gRnJpLCBKdW4g
MTQsIDIwMTkgYXQgMjo1NCBBTSBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxhc29sdXRpb25zLmNv
bT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEFjY29yZGluZyB0byBGaWcgNy0yLiBUQ09OIFRvcCBCbG9j
ayBEaWFncmFtIGluIFVzZXIgbWFudWFsLgo+ID4gPgo+ID4gPiBUQ09OIFRPUCBjYW4gaGF2ZSBh
biBoaWVyYXJjaHkgZm9yIFRDT05fTENEMCwgTENEMSBsaWtlCj4gPiA+IFRDT05fVFYwLCBUVjEg
c28sIHRoZSB0Y29uIHRvcCB3b3VsZCBoYW5kbGUgdGhlIGNsb2NrcyBvZgo+ID4gPiBUQ09OX0xD
RDAsIExDRDEgc2ltaWxhciBsaWtlIFRWMCwgVFYxLgo+ID4KPiA+IFRoYXQgaXMgbm90IGd1YXJh
bnRlZWQuIFRoZSBkaWFncmFtIHNob3dzIHRoZSBwaXhlbCBkYXRhIHBhdGgsCj4gPiBub3QgbmVj
ZXNzYXJpbHkgdGhlIGNsb2Nrcy4gSW4gYWRkaXRpb24sIHRoZSBMQ0QgVENPTnMgaGF2ZSBhbgo+
ID4gaW50ZXJuYWwgY2xvY2sgZ2F0ZSBmb3IgdGhlIGRvdC1jbG9jayBvdXRwdXQsIHdoaWNoIHRo
ZSBUViB2YXJpYW50cwo+ID4gZG8gbm90LiBUaGF0IG1pZ2h0IGV4cGxhaW4gdGhlIG5lZWQgZm9y
IHRoZSBnYXRlcyBpbiBUQ09OIFRPUC4KPgo+IENvcnJlY3QsIHRoZSBhY3R1YWwgaWRlYSBhYm91
dCBleHBsYW5hdGlvbiBoZXJlIGlzIHRvIG1lbnRpb24gdGhlCj4gY2xvY2tzIGRlZmluaXRpb24g
aW4gdGNvbiB0b3AgbGV2ZWwgYW5kIGludGVybmFsIHR2IGFuZCBsY2QgY2FuIGhhbmRsZQo+IGFz
IHlvdSBleHBsYWluZWQuCj4KPiA+Cj4gPiA+IEJ1dCwgdGhlIGN1cnJlbnQgdGNvbl90b3Agbm9k
ZSBpcyB1c2luZyBkc2kgY2xvY2sgbmFtZSB3aXRoCj4gPiA+IENMS19EU0lfRFBIWSB3aGljaCBp
cyBpZGVhbGx5IGhhbmRsZSB2aWEgZHBoeSB3aGljaCBpbmRlZWQKPiA+ID4gYSBzZXBhcmF0ZSBp
bnRlcmZhY2UgYmxvY2suCj4gPiA+Cj4gPiA+IFNvLCB1c2UgdGNvbi1sY2QwIGluc3RlYWQgb2Yg
ZHNpIHdoaWNoIHdvdWxkIHJlZmVyIHRoZQo+ID4gPiBDTEtfVENPTl9MQ0QwIHNpbWlsYXIgbGlr
ZSBDTEtfVENPTl9UVjAgd2l0aCB0Y29uLXR2MC4KPiA+ID4KPiA+ID4gVGhpcyB3YXkgd2UgY2Fu
IHJlZmVyIENMS19UQ09OX0xDRDAgZnJvbSB0Y29uX3RvcCBjbG9jayBpbgo+ID4gPiB0Y29uX2xj
ZDAgbm9kZSBhbmQgdGhlIGFjdHVhbCBEU0lfRFBIWSBjbG9jayBub2RlIHdvdWxkCj4gPiA+IHJl
ZmVyIGluIGRwaHkgbm9kZS4KPiA+Cj4gPiBUaGF0IGRvZXNuJ3QgbWFrZSBzZW5zZS4gV2hhdCBh
Ym91dCBUQ09OX0xDRDE/Cj4gPgo+ID4gVGhlIENDVSBhbHJlYWR5IGhhcyBDTEtfVENPTl9MQ0Qw
IGFuZCBDTEtfVENPTl9MQ0QxLiBXaGF0IG1ha2VzCj4gPiB5b3UgdGhpbmsgdGhhdCB0aGUgVENP
TnMgZG9uJ3QgdXNlIHRoZW0gZGlyZWN0bHk/Cj4gPgo+ID4gT3IgbWF5YmUgdGhleSBkbyBnbyB0
aHJvdWdoIFRDT05fVE9QLCBidXQgdGhlcmUncyBubyBnYXRlLAo+ID4gc28gd2UgZG9uJ3Qga25v
dyBhYm91dCBpdC4KPiA+Cj4gPiBZb3UgbmVlZCB0byByZXRoaW5rIHRoaXMuIFdoYXQgYXJlIHlv
dSB0cnlpbmcgdG8gZGVhbCB3aXRoPwo+Cj4gWWVzLCBJIHVuZGVyc3RhbmQgd2hhdCB5b3VyIGFz
a2luZyBmb3IgYW5kIGluZGVlZCB0aGlzIGlzIHdoZXJlIEkgZ2V0Cj4gY29uZnVzZWQgYW5kIHRy
aWVkIHRoaXMgd2F5IGluaXRpYWxseSBhbmQgYXR0YWNoIHRoZSBkc2kgcmVmZXJlbmNlIGluCj4g
ZHBoeSBzb21ldGhpbmcgbGlrZQo+Cj4gdGNvbl9sY2QwIHsKPiAgICAgICAgICAgICAgICAgY2xv
Y2tzID0gPCZjY3UgQ0xLX0JVU19UQ09OX0xDRDA+LCA8JmNjdSBDTEtfVENPTl9MQ0QwPjsKPiAg
ICAgICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAiYWhiIiwgInRjb24tY2gwIjsKPiB9Owo+Cj4g
ZHBoeSB7Cj4gICAgICAgICAgICAgICAgY2xvY2tzID0gPCZjY3UgQ0xLX0JVU19NSVBJX0RTST4s
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZ0Y29uX3RvcCBDTEtfVENPTl9UT1Bf
RFNJPjsKPiAgICAgICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJidXMiLCAibW9kIjsKPiB9Owo+
Cj4gVGhpcyB3b3VsZCBlbmRlZC11cCwgcGh5IHdvbnQgZ2V0dGluZyB0aGUgbW9kIGNsb2NrIGtl
ZXAgcHJvYmluZyBmb3IKPiAtRVBST0JFLURFRkVSIHNpbmNlIHRjb24gdG9wIGRyaXZlciBtaWdo
dCBub3QgYmUgbG9hZGVkIGF0IHRoZSB0aW1lCj4gbWlwaSBkcml2ZXIuIFRoaXMgd2F5IHdlIGhh
dmUgdHYwLCB0djEgYW5kIGRzaSBnYXRlcyBzdXBwb3J0ZWQgYXMKPiBleGlzdGVkLiBEb2VzIGl0
IG1ha2Ugc2Vuc2U/CgpMb29rcyBsaWtlIHRoYXQgaGFwcGVucyBiZWNhdXNlIHRoZSBjbG9ja3Mg
YXJlIG9ubHkgcmVnaXN0ZXJlZCBhdAp0aGUgY29tcG9uZW50IGJpbmQgcGhhc2UsIHJhdGhlciB0
aGFuIHRoZSBwcm9iZSBwaGFzZS4gQW5kIHRvIGJpbmQKYWxsIHRoZSBjb21wb25lbnRzLCB0aGUg
RFNJIGNvbnRyb2xsZXIgd2FudHMgdGhlIERQSFkgYXZhaWxhYmxlLAp3aGljaCBpc24ndCBiZWNh
dXNlIGl0J3Mgc3RpbGwgd2FpdGluZyBmb3IgdGhlIGNsb2NrLgoKU28geW91IGNvdWxkIHRyeSBt
b3ZpbmcgdGhlIGJpdHMgdGhhdCByZWdpc3RlciB0aGUgY2xvY2tzIGluIHRoZQpUQ09OIFRPUCBk
cml2ZXIgdG8gdGhlIHByb2JlIGZ1bmN0aW9uLCBhbmQgc2VlIGlmIHRoYXQgc29sdmVzCnRoZSBj
aXJjdWxhciBkZXBlbmRlbmN5IGlzc3VlLgoKQ2hlbll1Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
