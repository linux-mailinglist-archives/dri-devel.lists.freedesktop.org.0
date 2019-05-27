Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A307F2B10D
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 11:09:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E3789812;
	Mon, 27 May 2019 09:09:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA32489812
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 09:09:52 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id z23so10983694wma.4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 02:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=4auxLB+9hbjGusGlzFhLdKzs4olnTMbjWB47B0YVVa8=;
 b=t9K61uR3aHsQTuMAWyfv5h83hEcyzwsOsEXT0AFWOT1lUm6wPf3PTT1RSHgpdJkVRs
 pAEWwsLqCptaik/IMSWVxwf7MfaQHIg88ph+jImuQtRa7HhU5zdc5VLdoa5z4zHTDLAL
 sVQepC9i2iVsTm8rf5L1X3ORcgzR4C0qrroitvao2zJ6m7M1mI4tnfwf8Die1SzQsxeO
 7HlorcxIErlovcgkwsf0zM0DM8V5tvQDvpQUjj7vs/JHfkCkBMSHonWIBQ8sehnzuLmU
 WnGUioucvUB8+0Ub+N/XuTF74jv3Mk7raUThFYMz+HjgTYnyQwKiH/5ykAit5HLHn+WF
 8OBw==
X-Gm-Message-State: APjAAAUVzTA2blgOc5LeNguaPlp/9IlI++ybOuMV04QeOQ32Gz1oqczq
 Thvv0Is1AGgp9ckCw/TSzAA=
X-Google-Smtp-Source: APXvYqzsZqRKyfLfbmUDkqn2voEdfKadI05aZST6nykaJi6q2GWCmsX8ny9mj93B7kjTGAOvkc7awQ==
X-Received: by 2002:a7b:cc72:: with SMTP id n18mr9396926wmj.129.1558948191441; 
 Mon, 27 May 2019 02:09:51 -0700 (PDT)
Received: from arch-x1c3 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net.
 [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id z193sm13710066wmc.20.2019.05.27.02.09.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 27 May 2019 02:09:50 -0700 (PDT)
Date: Mon, 27 May 2019 10:08:26 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Thomas Hellstrom <thellstrom@vmware.com>
Subject: Re: [PATCH 4/5] drm/vmwgfx: remove custom ioctl io encoding check
Message-ID: <20190527090826.GA13920@arch-x1c3>
References: <20190522164119.24139-1-emil.l.velikov@gmail.com>
 <20190522164119.24139-4-emil.l.velikov@gmail.com>
 <a2ec4b6f529ffdc6146903decec6b5ba4cab0a1d.camel@vmware.com>
 <20190524121410.GB6233@arch-x1c3>
 <280025344d8590a4d10edfd9990d26d15a983264.camel@vmware.com>
 <20190524152648.GD8938@arch-x1c3>
 <27cb3f6d2002edcf45a4d50e6cef0854ba80766a.camel@vmware.com>
 <7dd79b21d58dc74b9b2d81d6aa812fe8d4564596.camel@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7dd79b21d58dc74b9b2d81d6aa812fe8d4564596.camel@vmware.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=4auxLB+9hbjGusGlzFhLdKzs4olnTMbjWB47B0YVVa8=;
 b=r1pE2R3WpPTofsAnzUU/I48a6/VZRK32uMmVx3dSFUyCVvB+A6eNBFVoImPlqdNlsT
 f5MKCqdlZEERCydwT8QcoH73XGDaLWBXcfUY+z/HPZkiNvp3Epr5cVTPN66K9OsQq3rC
 q8zbiK/t31Y62gq/nKmCLwJXTuyhGh+RpWRq8nGP8SsE4FVLLQeu8tGJ+45+uD0ivDf7
 XEnx/tkbYnwMnPfG7kCWC7sqCTnn3nw9071xbpNJJLX5w5YalD++8VB1zmA4pxkB4qf+
 yl/Uk/fNFI8s/3OTfhbty/WcvMruFBo0Tg1U7vxpWsPgnscFv6ZJPT8+jkGxCUsgPajs
 mupA==
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
Cc: "kernel@collabora.com" <kernel@collabora.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS8wNS8yNSwgVGhvbWFzIEhlbGxzdHJvbSB3cm90ZToKPiBPbiBTYXQsIDIwMTktMDUt
MjUgYXQgMDA6MzkgKzAyMDAsIFRob21hcyBIZWxsc3Ryw7ZtIHdyb3RlOgo+ID4gSGksIEVtaWwK
PiA+IAo+ID4gT24gRnJpLCAyMDE5LTA1LTI0IGF0IDE2OjI2ICswMTAwLCBFbWlsIFZlbGlrb3Yg
d3JvdGU6Cj4gPiA+IE9uIDIwMTkvMDUvMjQsIFRob21hcyBIZWxsc3Ryb20gd3JvdGU6Cj4gPiA+
ID4gT24gRnJpLCAyMDE5LTA1LTI0IGF0IDEzOjE0ICswMTAwLCBFbWlsIFZlbGlrb3Ygd3JvdGU6
Cj4gPiA+ID4gPiBPbiAyMDE5LzA1LzIzLCBUaG9tYXMgSGVsbHN0cm9tIHdyb3RlOgo+ID4gPiA+
ID4gPiBIaSwgRW1pbCwKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IE9uIFdlZCwgMjAxOS0wNS0y
MiBhdCAxNzo0MSArMDEwMCwgRW1pbCBWZWxpa292IHdyb3RlOgo+ID4gPiA+ID4gPiA+IEZyb206
IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4gPiA+ID4gPiA+ID4g
Cj4gPiA+ID4gPiA+ID4gRHJvcCB0aGUgY3VzdG9tIGlvY3RsIGlvIGVuY29kaW5nIGNoZWNrIC0g
Y29yZSBkcm0gZG9lcyBpdAo+ID4gPiA+ID4gPiA+IGZvcgo+ID4gPiA+ID4gPiA+IHVzLgo+ID4g
PiA+ID4gPiAKPiA+ID4gPiA+ID4gSSBmYWlsIHRvIHNlZSB3aGVyZSB0aGUgY29yZSBkb2VzIHRo
aXMsIG9yIGRvIEkgbWlzcwo+ID4gPiA+ID4gPiBzb21ldGhpbmc/Cj4gPiA+ID4gPiAKPiA+ID4g
PiA+IGRybV9pb2N0bCgpIGFsbG93cyBmb3IgdGhlIGVuY29kaW5nIHRvIGJlIGNoYW5nZWQgYW5k
Cj4gPiA+ID4gPiBhdHRyaWJ1dGVzCj4gPiA+ID4gPiB0aGF0Cj4gPiA+ID4gPiBvbmx5IHRoZQo+
ID4gPiA+ID4gYXBwcm9wcmlhdGUgc2l6ZSBpcyBjb3BpZWQgaW4vb3V0IG9mIHRoZSBrZXJuZWwu
Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IFRlY2huaWNhbGx5IHRoZSBmdW5jdGlvbiBpcyBtb3JlIHJl
bGF4ZWQgcmVsYXRpdmUgdG8gdGhlIHZtd2dmeAo+ID4gPiA+ID4gY2hlY2ssIHlldAo+ID4gPiA+
ID4gc2VlbXMgcGVyZmVjdGx5IHJlYXNvbmFibGUuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IElzIHRo
ZXJlIGFueSBjb3JuZXItY2FzZSB0aGF0IGlzbid0IGJ1dCBzaG91bGQgYmUgaGFuZGxlZCBpbgo+
ID4gPiA+ID4gZHJtX2lvY3RsKCk/Cj4gPiA+ID4gCj4gPiA+ID4gSSdkIGxpa2UgdG8gdHVybiB0
aGUgcXVlc3Rpb24gYXJvdW5kIGFuZCBhc2sgd2hldGhlciB0aGVyZSdzIGEKPiA+ID4gPiByZWFz
b24KPiA+ID4gPiB3ZSBzaG91bGQgcmVsYXggdGhlIHZtd2dmeCB0ZXN0PyBJbiB0aGUgcGFzdCBp
dCBoYXMgdHJhcHBlZCBxdWl0ZQo+ID4gPiA+IGEKPiA+ID4gPiBmZXcKPiA+ID4gPiB1c2VyLXNw
YWNlIGVycm9ycy4KPiA+ID4gPiAKPiA+ID4gVGhlIHdheSBJIHNlZSBpdCBlaXRoZXI6Cj4gPiA+
ICAtIHRoZSBjaGVjaywgYXMtaXMsIGlzIHVubmVzc2VzYXJ5LCBvcgo+ID4gPiAgLSBpdCBpcyBu
ZWVkZWQsIGFuZCB3ZSBzaG91bGQgZG8gc29tZXRoaW5nIGVxdWl2YWxlbnQgZm9yIGFsbCBvZgo+
ID4gPiBEUk0KPiA+ID4gCj4gPiA+IFdlIGhhZCBhIHZlcnkgbG9uZyBicmFpbnN0b3JtaW5nIHNl
c3Npb24gd2l0aCBhIGNvbGxlYWd1ZSBhbmQgd2UKPiA+ID4gY291bGQgbm90IHNlZQo+ID4gPiBh
bnkgY2FzZXMgd2hlcmUgdGhpcyB3b3VsZCBjYXVzZSBhIHByb2JsZW0uIElmIHlvdSByZWNhbGwg
YW55dGhpbmcKPiA+ID4gY29uY3JldGUKPiA+ID4gcGxlYXNlIGxldCBtZSBrbm93IC0gSSB3b3Vs
ZCBiZSBtb3JlIHRoYW4gaGFwcHkgdG8gdGFrZSBhIGNsb3Nlcgo+ID4gPiBsb29rLgo+ID4gCj4g
PiBJZiB5b3UgaGF2ZSBhIGdvb2QgcmVhc29uIHRvIGRyb3AgYW4gaW9jdGwgc2FuaXR5IGNoZWNr
LCBJJ2QgYmUKPiA+IHBlcmZlY3RseSBoYXBweSB0byBkbyBpdC4gVG8gbWUsIGEgZ29vZCByZWFz
b24gZXZlbiBpbmNsdWRlcyAiSSBoYXZlCj4gPiBhCj4gPiBub24tb3Blbi1zb3VyY2UgY3VzdG9t
ZXIgaGF2aW5nIHByb2JsZW1zIHdpdGggdGhpcyBjaGVjayIgYmVjYXVzZSBvZgo+ID4gcmVhc29u
IGV0Yy4gZXRjLiBhcyBsb25nIGFzIEkgaGF2ZSBhIHdheSB0byBldmFsdWF0ZSB0aG9zZSByZWFz
b25zCj4gPiBhbmQKPiA+IGRldGVybWluZSBpZiB0aGV5J3JlIHZhbGlkIG9yIG5vdC4gIk5vIG90
aGVyIGRybSBkcml2ZXIgbm9yIHRoZSBjb3JlCj4gPiBpcwo+ID4gZG9pbmcgdGhpcyIgaXMgTk9U
IGEgdmFsaWQgcmVhc29uIHRvIG1lLiBJbiBwYXJ0aWN1bGFyIGlmIHRoZSBjaGVjawo+ID4gaXMK
PiA+IG5vdCBhZmZlY3RpbmcgcGVyZm9ybWFuY2UuIFNvIHVubGVzcyB5b3UgcHJvdmlkZSBhZGRp
dGlvbmFsIHJlYXNvbnMKPiA+IHRvCj4gPiBkcm9wIHRoaXMgY2hlY2ssIGl0J3MgYSBzb2xpZCBO
QUsgZnJvbSBteSBzaWRlLgo+IAo+IFRvIGNsYXJpZnkgbXkgcG9pbnQgb2YgdmlldyBhIGJpdCwg
dGhpcyBjaGVjayBpcyB1c2VmdWwgdG8gZWFybHkgY2F0Y2gKPiB1c2Vyc3BhY2UgdXNpbmcgaW5j
b3JyZWN0IGZsYWdzIGFuZCBzaXplcywgd2hpY2ggb3RoZXJ3aXNlIG1pZ2h0IG1ha2UKPiBpdCBv
dXQgdG8gZGlzdHJvcyBhbmQgYWZ0ZXIgdGhhdCwgaW50cm9kdWNpbmcgYSBjaGVjayBsaWtlIHRo
aXMgd291bGQKPiBiZSBpbXBvc3NpYmxlLCBzaW5jZSBpdCBtaWdodCBicmVhayBvbGQgdXNlci1z
cGFjZS4gRm9yIHRoZSBzYW1lIHJlYXNvbgo+IGl0IHdvdWxkIHByb2JhYmx5IGJlIHZlcnkgZGlm
ZmljdWx0IHRvIGludHJvZHVjZSBpdCBpbiBjb3JlIGRybS4gCj4gCkkgdGhpbmsgd2UgbWlnaHQg
YmUgdGFsa2luZyBwYXN0IGVhY2ggb3RoZXIsIGxldCdzIHRha2UgYSBzdGVwIGJhY2s6CgogLSBh
cyBvZiBwcmV2aW91cyBwYXRjaCwgYWxsIG9mIHZtd2dmeCBpb2N0bHMgc2l6ZSBpcyBjb25zaXN0
ZW50bHkKaGFuZGxlZCBieSB0aGUgY29yZQogLSBoYW5kbGluZyBvZiBmZWF0dWUgZmxhZ3MsIGFz
IGFsd2F5cywgaXMgcmVzcG9uc2liaWxpdHkgb2YgdGhlIGRyaXZlcgppZnNlbGYKIC0gd2l0aCB0
aGlzIHBhdGNoLCBpb2N0bCBkaXJlY3Rpb24gaXMgYWxzbyBoYW5kbGVkIGJ5IGNvcmUuCgpIZXJl
IGNvcmUgZW5zdXJlcyB3ZSBvbmx5IGNvcHkgaW4vb3V0IGFzIG11Y2ggZGF0YSBhcyB0aGUga2Vy
bmVsCmltcGxlbWVudGF0aW9uIGNhbiBoYW5kbGUuCgoKTGV0J3MgY29uc2lkZXIgdGhlIGZvbGxv
d2luZyByZWFsIHdvcmxkIGV4YW1wbGUgLSBtc20gYW5kIHZpcnRpb19ncHUuCgpBbiBpbiBmaWVs
ZCBvZiBhbiBfSU9XIGlvY3RsIGJlY29tZXMgaW4vb3V0IGFrYSBfSU9SVyBpb2N0bC4KIC0gd2Ug
YWRkIGEgZmxhZyB0byBhbm5vdGF0ZS9yZXF1ZXN0IHRoZSBvdXQsIGFzIGFsd2F5cyBpbnZhbGlk
IGZsYWdzCmFyZSByZXR1cm4gLUVJTlZBTAogLSB3ZSBjaGFuZ2UgdGhlIGlvY3RsIGVuY29kaW5n
CgpBcyBjdXJyZW50bHkgaGFuZGxlZCBieSBjb3JlIERSTSwgb2xkIGtlcm5lbC9uZXcgdXNlcnNw
YWNlIGFuZAp2aWNlLXZlcnNhIHdvcmtzIGp1c3QgZmluZS4gU2FkbHksIHZtd2dmeCB3aWxsIGVy
cm9yIG91dCwgd2hpbGUgaXQgY291bGQKYmUgYXZvaWRlZC4KCkFzIHNhaWQgYWJvdmUsIEknbGwg
Z2xhZGx5IGFkanVzdCBjb3JlIGFuZC9vciBvdGhlcnMsIGlmIHRoaXMgcmVsYXhlZAphcHByb2Fj
aCBjYXVzZXMgYW4gaXNzdWUgc29tZXdoZXJlLiBBIHNwZWNpZmljIHVzZS1jYXNlLCByZWFsIG9y
Cmh5cG90aGV0aWNhbCB3aWxsIGJlIGFwcHJlY2lhdGVkLgoKCkFsbCB0aGlzIGlzIHBhcnQgb2Yg
YW4gImV2aWwiIHBsYW4gb2YgbWluZSwgdG8gcG9ydCBjb29sIGZlYXR1cmVzIGZyb20Kdm13Z2Z4
IHRvIGNvcmUgYW5kIGVmZmVjdGl2ZWx5IHJlbW92ZSB0aGUgdm13X2dlbmVyaWNfaW9jdGwoKSB3
cmFwcGVyLgoKCkhvcGUgdGhlIGJpZ2dlciBwaWN0dXJlIGlzIGNsZWFyZXIgbm93LCBpZiBub3Qg
cGxlYXNlIGxldCBtZSBrbm93LgoKVGhhbmtzCkVtaWwKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
