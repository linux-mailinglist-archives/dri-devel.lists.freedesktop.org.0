Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BF0F6CB6
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 03:30:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A0E66E82C;
	Mon, 11 Nov 2019 02:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80AA6E32D
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Nov 2019 14:18:27 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id w11so3315247qvu.13
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Nov 2019 06:18:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=ng53qPLNs5kHgfs4uey3AtSUtfr+RGwf85rqHKv2lzw=;
 b=c+VTxUW5BplWh1qVI/Yvxdf3SprvSWo9OSzafmv6oUdjbz0U65+QnVGfGKcs5RKTFo
 X1hMhCU68VGyJVmWxutT9Yz2fLcWswO9m8Ayn/Kqi79wiEiIHejtCauAutNxBnUyoKIg
 blQyevln+E7tXy8tFXeWMQ+xcycaRis2I3+FtIAi0aBeaFotDe0tFN0uLmOPptNb7Zlx
 wTWzRb7QBjyvYlgWTgMScu6aaWdMvtvuUQOb0EdOGsWud0d8q0DCPwF+d9xjFvTZQc8h
 /bMENCoXreMxuqIno0V49EMq4TRkiRT+MwDCN0F/fDfknalJrL42yQvSS58e75JxPZYp
 w+og==
X-Gm-Message-State: APjAAAVGPmV4ESPMRpOYBrRX/FvCeWieb9rrulwNhHTnTYykhUYw3Onk
 finB6QjatqTGpIdHzrI/CSRK7A==
X-Google-Smtp-Source: APXvYqz8X8jV8NSwC/puYzOueVgLBZtpBZacvKCplg3EpDC+DGLkqoSeOMkbTj1mXraWyuEDzqSw/w==
X-Received: by 2002:a05:6214:11f2:: with SMTP id
 e18mr15775725qvu.86.1573309106651; 
 Sat, 09 Nov 2019 06:18:26 -0800 (PST)
Received: from skullcanyon ([192.222.193.21])
 by smtp.gmail.com with ESMTPSA id 7sm4226879qkf.67.2019.11.09.06.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2019 06:18:25 -0800 (PST)
Message-ID: <d7c8c26b2f941b455f9da9f5abc2f96693286f6e.camel@ndufresne.ca>
Subject: Re: Overlay support in the i.MX7 display
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Pekka Paalanen <ppaalanen@gmail.com>, Stefan Agner <stefan@agner.ch>
Date: Sat, 09 Nov 2019 09:18:24 -0500
In-Reply-To: <20191104100947.4e198e72@eldfell.localdomain>
References: <20191101084318.GA8428@pendragon.ideasonboard.com>
 <67057f1082886726268f346f49c23051@agner.ch>
 <20191104100947.4e198e72@eldfell.localdomain>
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 11 Nov 2019 02:29:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=ng53qPLNs5kHgfs4uey3AtSUtfr+RGwf85rqHKv2lzw=;
 b=DPW0dTJUGUzkE9oPjW0Rc+otzF+87DSY5ltFGz/2OSFCurB+UH+Ul29jBmkzqFTa7B
 yCQy/EFRlQX6MNQuco11mMR9olSy1qv8Dwtp6CJxcPeV/+3rrEE1uMRzU8tOwWBjNAxY
 yREXYNQZDl96Oua/RUj9S5SdbF1C7f+zfM29KmdPn+8O7ReKdnou6nZXKVOFSKsm3SwJ
 OzncDN+wLRuFr51ubDueBf0hwXVCN0LOP0JErgHjSvySHGzlFi5IuIwiOEaugDJH6069
 8hYM0FSVJkcc4wtnfQLFZJhZnMAeKT6vgSKwATxpD7UieGn1TCo3BNhrwI1kAkArUFsK
 Y0Sg==
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
Cc: Marek Vasut <marex@denx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgbHVuZGkgMDQgbm92ZW1icmUgMjAxOSDDoCAxMDowOSArMDIwMCwgUGVra2EgUGFhbGFuZW4g
YSDDqWNyaXQgOgo+IE9uIFN1biwgMDMgTm92IDIwMTkgMTk6MTU6NDkgKzAxMDAKPiBTdGVmYW4g
QWduZXIgPHN0ZWZhbkBhZ25lci5jaD4gd3JvdGU6Cj4gCj4gPiBIaSBMYXVyZW50LAo+ID4gCj4g
PiBPbiAyMDE5LTExLTAxIDA5OjQzLCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+ID4gPiBIZWxs
bywKPiA+ID4gCj4gPiA+IEknbSBsb29raW5nIGF0IHRoZSBhdmFpbGFibGUgb3B0aW9ucyB0byBz
dXBwb3J0IG92ZXJsYXlzIGluIHRoZSBkaXNwbGF5Cj4gPiA+IHBpcGVsaW5lIG9mIHRoZSBpLk1Y
Ny4gVGhlIExDRElGIGl0c2VsZiB1bmZvcnR1bmFsdGV5IGRvZXNuJ3Qgc3VwcG9ydAo+ID4gPiBv
dmVybGF5cywgdGhlIGZlYXR1cmUgYmVpbmcgaW1wbGVtZW50ZWQgaW4gdGhlIFBYUC4gQSBkcml2
ZXIgZm9yIHRoZSBQWFAKPiA+ID4gaXMgYXZhaWxhYmxlIGJ1dCBvbmx5IHN1cHBvcnRzIG9sZGVy
IFNvQ3Mgd2hvc2UgUFhQIGRvZXNuJ3Qgc3VwcG9ydAo+ID4gPiBvdmVybGF5cy4gVGhpcyBkcml2
ZXIgaXMgaW1wbGVtZW50ZWQgYXMgYSBWNEwyIG1lbTJtZW0gZHJpdmVyLCB3aGljaAo+ID4gPiBt
YWtlcyBzdXBwb3J0IG9mIGFkZGl0aW9uYWwgaW5wdXQgY2hhbm5lbHMgaW1wb3NzaWJsZS4gIAo+
ID4gCj4gPiBUaGFua3MgZm9yIGJyaW5naW5nIHRoaXMgdXAsIGl0IGlzIGEgdG9waWMgSSBoYXZl
IHdvbmRlcmVkIHRvbzoKPiA+IEludGVyYWN0aW9uIGJldHdlZW4gUFhQIGFuZCBteHNmYi4KPiA+
IAo+ID4gSSBhbSBub3QgdmVyeSBmYW1pbGlhciB3aXRoIHRoZSBWNEwyIHN1YnN5c3RlbSBzbyB0
YWtlIG15IG9waW5pb25zIHdpdGgKPiA+IGEgZ3JhaW4gb2Ygc2FsdC4KPiA+IAo+ID4gPiBIZXJl
IGFyZSB0aGUgb3B0aW9ucyBJIGNhbiBlbnZpc2lvbjoKPiA+ID4gCj4gPiA+IC0gRXh0ZW5kIHRo
ZSBleGlzdGluZyBQWFAgZHJpdmVyIHRvIHN1cHBvcnQgbXVsdGlwbGUgY2hhbm5lbHMuIFRoaXMg
aXMKPiA+ID4gICB0ZWNobmljYWxseSBmZWFzaWJsZSwgYnV0IHdpbGwgcmVxdWlyZSBtb3Zpbmcg
YXdheSBmcm9tIHRoZSBWNEwyCj4gPiA+ICAgbWVtMm1lbSBmcmFtZXdvcmssIHdoaWNoIHdvdWxk
IGJyZWFrIHVzZXJzcGFjZS4gSSBkb24ndCB0aGluayB0aGlzCj4gPiA+ICAgcGF0aCBjb3VsZCBs
ZWFkIGFueXdoZXJlLgo+ID4gPiAKPiA+ID4gLSBXcml0ZSBhIG5ldyBQWFAgZHJpdmVyIGZvciB0
aGUgaS5NWDcsIHN0aWxsIHVzaW5nIFY0TDIsIGJ1dCB3aXRoCj4gPiA+ICAgbXVsdGlwbGUgdmlk
ZW8gbm9kZXMuIFRoaXMgd291bGQgYWxsb3cgYmxlbmRpbmcgbXVsdGlwbGUgbGF5ZXJzLCBidXQK
PiA+ID4gICB3b3VsZCByZXF1aXJlIHdyaXRpbmcgdGhlIG91dHB1dCB0byBtZW1vcnksIHdoaWxl
IHRoZSBQWFAgaGFzIHN1cHBvcnQKPiA+ID4gICBmb3IgZGlyZWN0IGNvbm5lY3Rpb25zIHRvIHRo
ZSBMQ0RJRiAodGhyb3VnaCBzbWFsbCBTUkFNIGJ1ZmZlcnMpLgo+ID4gPiAgIFBlcmZvcm1hbmNl
cyB3b3VsZCB0aHVzIGJlIHN1Ym9wdGltYWwuIFRoZSBBUEkgd291bGQgYWxzbyBiZSBhd2t3YXJk
LAo+ID4gPiAgIGFzIHVzaW5nIHRoZSBQWFAgZm9yIGRpc3BsYXkgd291bGQgcmVxdWlyZSB1c2Fn
ZSBvZiBWNEwyIGluCj4gPiA+ICAgYXBwbGljYXRpb25zLiAgCj4gPiAKPiA+IFNvIHRoZSB2aWRl
byBub2RlcyB3b3VsZCBiZSBzaW5rcz8gSSB3b3VsZCBleHBlY3Qgb3ZlcmxheXMgdG8gYmUgdXNh
YmxlCj4gPiB0aHJvdWdoIEtNUywgSSBndWVzcyB0aGF0IHdvdWxkIHRoZW4gbm90IHdvcmssIGNv
cnJlY3Q/Cj4gPiAKPiA+ID4gLSBFeHRlbmQgdGhlIG14c2ZiIGRyaXZlciB3aXRoIFBYUCBzdXBw
b3J0LCBhbmQgZXhwb3NlIHRoZSBQWFAgaW5wdXRzIGFzCj4gPiA+ICAgS01TIHBsYW5lcy4gVGhl
IFBYUCB3b3VsZCBvbmx5IGJlIHVzZWQgd2hlbiBhdmFpbGFibGUsIGFuZCB3b3VsZCBiZQo+ID4g
PiAgIHRyYW5zcGFyZW50IHRvIGFwcGxpY2F0aW9ucy4gVGhpcyB3b3VsZCBob3dldmVyIHByZXZl
bnQgdXNpbmcgaXQKPiA+ID4gICBzZXBhcmF0ZWx5IGZyb20gdGhlIGRpc3BsYXkgKHRvIHBlcmZv
cm0gbXVsdGktcGFzcyBhbHBoYSBibGVuZGluZyBmb3IKPiA+ID4gICBpbnN0YW5jZSkuICAKPiA+
IAo+ID4gS01TIHBsYW5lcyBhcmUgd2VsbCBkZWZpbmVkIGFuZCBhcmUgd2VsbCBpbnRlZ3JhdGVk
IHdpdGggdGhlIEtNUyBBUEksIHNvCj4gPiBJIHByZWZlciB0aGlzIG9wdGlvbi4gQnV0IGlzIHRo
aXMgY29tcGF0aWJsZSB3aXRoIHRoZSBjdXJyZW50bHkKPiA+IHN1cHBvcnRlZCB2aWRlbyB1c2Ut
Y2FzZT8gRS5nLiBjb3VsZCB3ZSBtYWtlIFBYUCBhdmFpbGFibGUgdGhyb3VnaCBWNEwyCj4gPiBh
bmQgdGhyb3VnaCBEUk0vbXhzZmI/Cj4gPiAKPiA+IE5vdCBzdXJlIHdoYXQgeW91ciB1c2UgY2Fz
ZSBpcyBleGFjdGx5LCBidXQgd2hlbiBwbGF5aW5nIGEgdmlkZW8gSQo+ID4gd29uZGVyIHdoZXJl
IGlzIHRoZSBoaWdoZXIgdmFsdWUgdXNpbmcgUFhQOiBDb2xvciBjb252ZXJzaW9uIGFuZCBzY2Fs
aW5nCj4gPiBvciBjb21wb3NpdGluZy4uLj8gSSB3b3VsZCBleHBlY3QgaGlnaGVyIHZhbHVlIGlu
IHRoZSBmb3JtZXIgdXNlIGNhc2UuCj4gCj4gSGksCj4gCj4gbWluZCwgd2l0aCBXYXlsYW5kIGFy
Y2hpdGVjdHVyZSwgY29sb3IgY29udmVyc2lvbiBhbmQgc2NhbGluZyBjb3VsZCBiZQo+IGF0IHRo
ZSBzYW1lIGxldmVsL3N0ZXAgYXMgY29tcG9zaXRpbmcsIGluIHRoZSBkaXNwbGF5IHNlcnZlciBp
bnN0ZWFkIG9mCj4gYW4gYXBwbGljYXRpb24uIEhlbmNlIGlmIHRoZSBQWFAgY2FwYWJpbGl0aWVz
IHdlcmUgYWR2ZXJ0aXNlZCBhcyBLTVMKPiBwbGFuZXMsIHRoZXJlIHNob3VsZCBiZSBub3RoaW5n
IHRvIHBhdGNoIGluIFdheWxhbmQtZGVzaWduZWQKPiBhcHBsaWNhdGlvbnMgdG8gbWFrZSB1c2Ug
b2YgdGhlbSwgYXNzdW1pbmcgdGhlIGFwcGxpY2F0aW9ucyBkaWQgbm90Cj4gYWxyZWFkeSByZWx5
IG9uIFY0TDIgTTJNIGRldmljZXMuCgpUaGUgUFhQIGNhbiBhbHJlYWR5IGJlIHVzZWQgd2l0aCBH
U3RyZWFtZXIgdjRsMmNvbnZlcnQgZWxlbWVudCwgZm9yIENTQwphbmQgc2NhbGluZy4KCj4gCj4g
V291bGQgaXQgbm90IGJlIHBvc3NpYmxlIHRvIGV4cG9zZSBQWFAgdGhyb3VnaCBib3RoIHVBUEkg
aW50ZXJmYWNlcz8gQXQKPiBsZWFzdCBLTVMgYXRvbWljJ3MgVEVTVF9PTkxZIGZlYXR1cmUgd291
bGQgbWFrZSBpdCBlYXN5IHRvIHNheSAibm8iIHRvCj4gdXNlcnNwYWNlIGlmIGFub3RoZXIgYml0
IG9mIHVzZXJzcGFjZSBhbHJlYWR5IHJlc2VydmVkIHRoZSBkZXZpY2UgdmlhCj4gZS5nLiBWNEwy
LgoKU2FtZSBleGlzdCBmb3IgZGVjb2RlcnMgd2l0aCBmaXhlZCBudW1iZXIgb2Ygc3RyZWFtcy9p
bnN0YW5jZXMgSSB0aGluay4KCj4gCj4gCj4gVGhhbmtzLAo+IHBxCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
