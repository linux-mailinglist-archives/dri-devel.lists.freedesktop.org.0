Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DEE25BDC6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 10:50:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF7E6E1BC;
	Thu,  3 Sep 2020 08:50:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F88689DFD
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 16:55:53 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id e33so2845444pgm.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 09:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hdYVEuQJsLS8XipihWRuhbU3xPPXwqeBIMKPtKZRZo4=;
 b=cDnF5SnhZNkKDN5xqO/nwzRTKGXbJtKhz2wo6fMl7N6OYIyZ9DhZmIExeDp7ypJukE
 t9LFfSW0AEXg8Hyro1hyHQgcLQ/9HjPz3vezytz3BlEoMZsICuou0ZO4dxoLyvn3MoCk
 lCcK/gz0Tbo8fWbaFqa84owdYWvTj7NyCroVfddXUr1jKqijmoXYtyrUNllSbs/wVzCj
 95W8X3HL/JDzH4UDTiJj0Sm0AF7d04YyVpugLCXHKaRUq86TzC4BtFETDlOc41tdokJA
 sVfz5l7G820XUE/1DW9U6mfr+BgDbnLX/647gxhvzr0ENHjxMfy8eJl7TZx+ndzz0WZS
 W86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hdYVEuQJsLS8XipihWRuhbU3xPPXwqeBIMKPtKZRZo4=;
 b=bRfFJpJyxLNJFbeHxtFfGz8LB09FEO5Djq/akQvTpuLhkGnFeqQ/gghFYzK02ADdyF
 MTL7Z/mKuw4iWjwALxuM2mmiqYPktcoQ354vOpPC0H30wDlyVELUPC40teYvSw9rbNkB
 1hUeNbxYAelXeDP3PHzBVB4Qj7nO7wGNaVyWhNYcKdtQLfucR3n7t90ZC2TA2twym6vm
 ebXYBYzjundpWuFJknGKbZ728LCBIFYqLPEZmAR3ONRxj1REyutgR4WVKOkxzSsKVFnO
 yepRGiH7EkAoH0F8kucuNFvQ277qklgoBfdPVvcGHyF13YzujAFTgqS8PUdj+sGg0o/4
 2I9w==
X-Gm-Message-State: AOAM532/6EhWRKGH8ICHvVtj0Y4otF6L0UU6A3v1f6R7g3LoqGM+d82b
 I11FEFJ7naMhPkoP4c7+41gH2xgVqXakxff/7rU=
X-Google-Smtp-Source: ABdhPJwLErBx9enNDGjL8lSgkYJi5XasZCfAETGqZUaa95fqW4paWq8Pxt264+W62PlQimkVKhODvhcxNH02K3PvxoY=
X-Received: by 2002:a63:f14c:: with SMTP id o12mr2596315pgk.150.1599065753099; 
 Wed, 02 Sep 2020 09:55:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200901220305.6809-1-jernej.skrabec@siol.net>
 <CAGphcdnT4U8AztL_B_B2HYskQSAYKRgCQcnO3Q8Qj+UFO082hQ@mail.gmail.com>
 <10671571.W45mMbEh4O@kista>
In-Reply-To: <10671571.W45mMbEh4O@kista>
From: Roman Stratiienko <r.stratiienko@gmail.com>
Date: Wed, 2 Sep 2020 19:55:42 +0300
Message-ID: <CAGphcdmfb0Ha0h2UX_Ez7049r7sm2Np6amg_paTcqfPB42Ga9w@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: Fix DE2 YVU handling
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@siol.net>
X-Mailman-Approved-At: Thu, 03 Sep 2020 08:50:07 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: irlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

0YHRgCwgMiDRgdC10L3Rgi4gMjAyMCDQsy4g0LIgMTk6NDYsIEplcm5laiDFoGtyYWJlYyA8amVy
bmVqLnNrcmFiZWNAc2lvbC5uZXQ+Ogo+Cj4gRG5lIHNyZWRhLCAwMi4gc2VwdGVtYmVyIDIwMjAg
b2IgMDk6MDE6MTcgQ0VTVCBqZSBSb21hbiBTdHJhdGlpZW5rbwo+IG5hcGlzYWwoYSk6Cj4gPiDR
gdGALCAyINGB0LXQvdGCLiAyMDIwINCzLiDQsiAwMDo1OCwgSmVybmVqIFNrcmFiZWMgPGplcm5l
ai5za3JhYmVjQHNpb2wubmV0PjoKPiA+ID4gRnVuY3Rpb24gc3VuOGlfdmlfbGF5ZXJfZ2V0X2Nz
Y19tb2RlKCkgaXMgc3VwcG9zZWQgdG8gcmV0dXJuIENTQyBtb2RlCj4gPiA+IGJ1dCBkdWUgdG8g
aW5wcm9wZXIgcmV0dXJuIHR5cGUgKGJvb2wgaW5zdGVhZCBvZiB1MzIpIGl0IHJldHVybnMganVz
dCAwCj4gPiA+IG9yIDEuIENvbG9ycyBhcmUgd3JvbmcgZm9yIFlWVSBmb3JtYXRzIGJlY2F1c2Ug
b2YgdGhhdC4KPiA+ID4KPiA+ID4gRml4ZXM6IGRhYWIzZDBlOGUyYiAoImRybS9zdW40aTogZGUy
OiBjc2NfbW9kZSBpbiBkZTIgZm9ybWF0IHN0cnVjdCBpcwo+ID4gPiBtb3N0bHkgcmVkdW5kYW50
IikgUmVwb3J0ZWQtYnk6IFJvbWFuIFN0cmF0aWllbmtvCj4gPiA+IDxyLnN0cmF0aWllbmtvQGdt
YWlsLmNvbT4KPiA+ID4gU2lnbmVkLW9mZi1ieTogSmVybmVqIFNrcmFiZWMgPGplcm5lai5za3Jh
YmVjQHNpb2wubmV0Pgo+ID4gPiAtLS0KPiA+ID4KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9zdW40
aS9zdW44aV92aV9sYXllci5jIHwgMiArLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vc3VuNGkvc3VuOGlfdmlfbGF5ZXIuYwo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS9zdW40
aS9zdW44aV92aV9sYXllci5jIGluZGV4IDIyYzhjNTM3NWQwZC4uYzAxNDdhZjZhODQwCj4gPiA+
IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfdmlfbGF5ZXIu
Ywo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfdmlfbGF5ZXIuYwo+ID4g
PiBAQCAtMjExLDcgKzIxMSw3IEBAIHN0YXRpYyBpbnQgc3VuOGlfdmlfbGF5ZXJfdXBkYXRlX2Nv
b3JkKHN0cnVjdAo+ID4gPiBzdW44aV9taXhlciAqbWl4ZXIsIGludCBjaGFubmVsLD4KPiA+ID4g
ICAgICAgICByZXR1cm4gMDsKPiA+ID4KPiA+ID4gIH0KPiA+ID4KPiA+ID4gLXN0YXRpYyBib29s
IHN1bjhpX3ZpX2xheWVyX2dldF9jc2NfbW9kZShjb25zdCBzdHJ1Y3QgZHJtX2Zvcm1hdF9pbmZv
Cj4gPiA+ICpmb3JtYXQpICtzdGF0aWMgdTMyIHN1bjhpX3ZpX2xheWVyX2dldF9jc2NfbW9kZShj
b25zdCBzdHJ1Y3QKPiA+ID4gZHJtX2Zvcm1hdF9pbmZvICpmb3JtYXQpPgo+ID4gPiAgewo+ID4g
Pgo+ID4gPiAgICAgICAgIGlmICghZm9ybWF0LT5pc195dXYpCj4gPiA+Cj4gPiA+ICAgICAgICAg
ICAgICAgICByZXR1cm4gU1VOOElfQ1NDX01PREVfT0ZGOwo+ID4gPgo+ID4gPiAtLQo+ID4gPiAy
LjI4LjAKPiA+Cj4gPiBIaSBKZXJuZWosCj4gPgo+ID4gVGhhbmsgeW91IGZvciB0aGUgZml4Lgo+
ID4gSSBjYW4gY29uZmlybSB0aGlzIHBhdGNoIGZpeGVzIHRoZSBpc3N1ZSB3aXRoIHdyb25nIGNv
bG9ycy4KPgo+IFRoYW5rcyEgQ2FuIEkgYXNzdW1lIHRoYXQgdGhpcyBtZWFucyB5b3VyIFRlc3Rl
ZC1ieSB0YWcgY2FuIGJlIGFkZGVkPwoKU3VyZS4KClRlc3RlZC1ieTogUm9tYW4gU3RyYXRpaWVu
a28gPHIuc3RyYXRpaWVua29AZ21haWwuY29tPgoKPgo+ID4KPiA+IExldCBtZSBzaGFyZSBteSB0
aG91Z2h0czoKPiA+IEkndmUgbG9va2VkIGludG8gY3NjIGNvZGUsIGFuZCBpdCBzZWVtcyB0byBt
ZSByZW9yZGVyaW5nIFUsIFYgb2Zmc2V0cwo+ID4gc2hvdWxkIGJlIGEgbXVjaCBzaW1wbGVyIHNv
bHV0aW9uIHRoYW4gYXBwbHlpbmcKPiA+IGNvbG9yIHRyYW5zZm9ybWF0aW9uIG1hdHJpY2VzLkl0
IHNob3VsZCBhbHNvIHNpbXBsaWZ5IGFkZGluZyBtb3JlCj4gPiBjb2xvciBlbmNvZGluZ3MgaW4g
dGhlIGZ1dHVyZS4KPgo+IFN3aXRjaGluZyBvZmZzZXRzIGFzc3VtZXMgdGhhdCB5b3UgaGF2ZSBz
ZXBhcmF0ZSBwbGFuZXMgZm9yIFUgYW5kIFYgd2hpY2ggbWF5Cj4gbm90IGJlIHRydWUgaW4gdGhl
IGZ1dHVyZS4gSSBhZ3JlZSB0aGF0IENTQyBtYXRyaWNlcyBhcmUgbmVlZGxlc3NseSBkdXBsaWNh
dGVkCj4gZm9yIGhhbmRsaW5nIFUvViBzd2l0Y2guIEkgaGF2ZSBhIHBhdGNoIHdoaWNoIHJlb3Jn
YW5pemUgbWF0cml4IG9uIHRoZSBmbHkgd2hlbgo+IGNvZWZmaWNpZW50cyBhcmUgd3JpdHRlbiBp
biByZWdpc3RlcnMgYnV0IHNpbmNlIGl0J3MgYSBwYXJ0IG9mIGEgYmlnZ2VyLAo+IHVuZmluaXNo
ZWQgc2VyaWVzLCBJIGRpZG4ndCBzZW50IGl0IG91dCB5ZXQuIE9ubHkgZGlmZmVyZW5jZSBpbiBZ
VVYgYW5kIFlWVSBDU0MKPiBtYXRyaWNlcyBhcmUgc3dpdGNoZWQgMm5kIGFuZCAzcmQgY29sdW1u
LgoKVGhpcyBzb3VuZHMgcmVhc29uYWJsZS4gVGhhbmsgeW91IGZvciB5b3VyIGV4cGxhbmF0aW9u
LgoKUmVnYXJkcywKUm9tYW4KCj4KPiBCZXN0IHJlZ2FyZHMsCj4gSmVybmVqCj4KPiA+Cj4gPiBS
ZWdhcmRzLAo+ID4gUm9tYW4KPgo+Cj4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
