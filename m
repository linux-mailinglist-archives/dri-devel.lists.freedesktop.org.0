Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1621AB64
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2019 10:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2828989C;
	Sun, 12 May 2019 08:59:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
 [209.85.217.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A35B38989C
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2019 08:59:06 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id g187so6204286vsc.8
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2019 01:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xmj+I9tVEtlvAoJOYekCEKipPaHuy5E98bYFqplmOIM=;
 b=rMwK526kJomD4RlUEsZm4u7M0RnSaDQ0M1VtdYsVWrkhFmPOvi5XFSpd8GXkm00Euj
 1pUsKT/5j4zyhT9lzTpsW0fHCxSfu8HK7JfSS9XVn/+LqbKraHhE4oqCVPshc8E1jQJi
 4c50FFcX7HCsIH3P/U3XXgKU1AOM6WqbGEja8pPzs5Z7KrnLa0/JBO8U4Q9xsnQJRf/V
 jxs4KFkm2t8v972/aFX0EHcy1Xg6ogiLzX70qtbwdh0Ck5hjpBWyVd+1BZ/n8Bt7agrT
 EFlneEaVapWtlZ8H07zqoLSJcnpmAvn3xw32FnwqYJdIubaEfUAyQ4lj/bzKWcHB4v5T
 lEwg==
X-Gm-Message-State: APjAAAXFEArNPO6Qs+0IDHYgDQCuy3zXdNvYcV+8C+tjDKM/xpd13orn
 8icudt5Qr3LOxPaaXPpvBf6cGkqB+UN+SoJui98=
X-Google-Smtp-Source: APXvYqwV94aZ1VL4lfwYJEp/40rS1E/jr9iHPIrwVquCH0M7ZMjOYI5S9d7KrlTj86tVN5eQc1pUBKt2ei04wyvboDs=
X-Received: by 2002:a67:7c93:: with SMTP id x141mr3348581vsc.96.1557651545711; 
 Sun, 12 May 2019 01:59:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190511210702.18394-3-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20190511210702.18394-3-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 12 May 2019 10:58:54 +0200
Message-ID: <CAMuHMdXtg3Kv+zt6kS9tViu93AjaHsOrSSotemt8T=8XVJcdyA@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] dt-bindings: display: bridge: thc63lvd1024:
 Document dual-link operation
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwKCk9uIFNhdCwgTWF5IDExLCAyMDE5IGF0IDExOjA3IFBNIExhdXJlbnQgUGlu
Y2hhcnQKPGxhdXJlbnQucGluY2hhcnQrcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPiB3cm90ZToK
PiBUaGUgVEhDNjNMVkQxMDI0IExWRFMgZGVjb2RlciBjYW4gb3BlcmF0ZSBpbiB0d28gbW9kZXMs
IHNpbmdsZS1saW5rIG9yCj4gZHVhbC1saW5rLiBJbiBkdWFsLWxpbmsgbW9kZSBib3RoIGlucHV0
IHBvcnRzIGFyZSB1c2VkIHRvIGNhcnJ5IGV2ZW4tCj4gYW5kIG9kZC1udW1iZXJlZCBwaXhlbHMg
c2VwYXJhdGVseS4gRG9jdW1lbnQgdGhpcyBpbiB0aGUgRFQgYmluZGluZ3MsCj4gYWxvbmcgd2l0
aCB0aGUgcmVsYXRlZCBydWxlcyBnb3Zlcm5pbmcgcG9ydCBhbmQgdXNhZ2UuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0K3JlbmVzYXNAaWRlYXNv
bmJvYXJkLmNvbT4KPiBSZXZpZXdlZC1ieTogSmFjb3BvIE1vbmRpIDxqYWNvcG8rcmVuZXNhc0Bq
bW9uZGkub3JnPgo+IC0tLQo+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvdGhpbmUsdGhj
NjNsdmQxMDI0LnR4dCAgICAgICAgICB8IDYgKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9icmlkZ2UvdGhpbmUsdGhjNjNsdmQxMDI0LnR4dCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS90aGluZSx0aGM2M2x2ZDEwMjQu
dHh0Cj4gaW5kZXggMzdmMGMwNGQ1YTI4Li5kMTdkMWU1ODIwZDcgMTAwNjQ0Cj4gLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3RoaW5lLHRoYzYz
bHZkMTAyNC50eHQKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9icmlkZ2UvdGhpbmUsdGhjNjNsdmQxMDI0LnR4dAo+IEBAIC0yOCw2ICsyOCwxMiBAQCBP
cHRpb25hbCB2aWRlbyBwb3J0IG5vZGVzOgo+ICAtIHBvcnRAMTogU2Vjb25kIExWRFMgaW5wdXQg
cG9ydAo+ICAtIHBvcnRAMzogU2Vjb25kIGRpZ2l0YWwgQ01PUy9UVEwgcGFyYWxsZWwgb3V0cHV0
Cj4KPiArVGhlIGRldmljZSBjYW4gb3BlcmF0ZSBpbiBzaW5nbGUtbGluayBtb2RlIG9yIGR1YWwt
bGluayBtb2RlLiBJbiBzaW5nbGUtbGluawo+ICttb2RlLCBhbGwgcGl4ZWxzIGFyZSByZWNlaXZl
ZCBvbiBwb3J0QDAsIGFuZCBwb3J0QDEgc2hhbGwgbm90IGNvbnRhaW4gYW55Cj4gK2VuZHBvaW50
LiBJbiBkdWFsLWxpbmsgbW9kZSwgZXZlbi1udW1iZXJlZCBwaXhlbHMgYXJlIHJlY2VpdmVkIG9u
IHBvcnRAMCBhbmQKPiArb2RkLW51bWJlcmVkIHBpeGVscyBvbiBwb3J0QDEsIGFuZCBib3RoIHBv
cnRAMCBhbmQgcG9ydEAxIHNoYWxsIGNvbnRhaW4KPiArZW5kcG9pbnRzLgoKVGhpcyBkZXNjcmli
ZXMgc2luZ2xlL2R1YWwgaW5wdXQuCkRvZXMgc2luZ2xlL2R1YWwgb3V0cHV0IG5lZWQgdG8gYmUg
ZGVzY3JpYmVkLCB0b28/CgpCVFcsIEkgc2VlIHRoZSBzZWNvbmQgaW5wdXQvb3V0cHV0IHNldCBp
cyBvcHRpb25hbCwgd2lsZSB0aGUgZmlyc3Qgc2V0CmlzIHJlcXVpcmVkLiAgQ291bGQgaXQgaGFw
cGVuIHRoZSBoYXJkd2FyZSBpcyB3aXJlZCBmb3IgdGhlIHNlY29uZApzZXQgb25seT8KCkdye29l
dGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBV
eXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0
QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2Fs
IHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8g
am91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhh
dC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
