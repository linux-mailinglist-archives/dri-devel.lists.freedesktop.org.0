Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F4C120EDB
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 17:10:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08CE89803;
	Mon, 16 Dec 2019 16:10:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB4F189803
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 16:10:18 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c9so7953509wrw.8
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 08:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=wBlvcCO8Ml/H3509NAX+qSULZon7Go2sxTKRNZ2ctvE=;
 b=cXv6nwlv5pmdDWI5Y7fvYBC08HVao0ujeoZ+7ojLX6RoCDn8hreHedCs3lAgk0Gk/1
 UHW3JvpWt+pi/gzHwcOvv05kCPRivGFMzcHyMcYP0x35zcal9iIdwDatmGkcF5fcQ6Xs
 VBY8rQawpt+crj27oTb9ERdm/cu8IMc5iKJWzLYMu/ROqZaWhXSo/iSTzLK5L6+T7kz5
 vzU8CftoZwUEP4SDSneANgLgQ8v1+lwSWYMjy/hIOtryfimxrX1odtPyTx0+4bqQNFEa
 2eJkifCe0okcSE/VE71ZqbBTpPzP8FFPc+tXIK6kL8zAPr47XlZAkzPidGzT3wtnFD9/
 D4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=wBlvcCO8Ml/H3509NAX+qSULZon7Go2sxTKRNZ2ctvE=;
 b=oPYy/C/nl4pifOjzOLjjDanR+h5ZNd9Pnx8h0lzQ2CGzxo1Mf/CuuYZkD9c0rxJUmW
 Ar0oQpfLVNBSmw+9Za3QFJkFn6/841Ulq7mpnAnAacM9o5yApbigdSLpHFe44l9CPGvE
 KzM08VUaoNYZrjEgdmnigBwdZBA/ot/SREvj+17YD5+vFkD+vqwll7+taLKC+Bzfxpp7
 aQtCHzoCc/3ow+XsxpmX8QgeozrzSRrxrUBzFbAZO1c8bPSna31vbch1z9I/9x62Dgad
 /HHT3ZEw5ZGpSZzo0CO/ly+0rpCCeLjqZOtisPEwNEVNhaPD9BmcpPGwxPqUh8gC7Mhk
 N81Q==
X-Gm-Message-State: APjAAAX7n/yOLko9FiWbzj60aEB6AcZYTMWmtRl26xboY8b2uRTk+yNa
 XM4EpUVEcaHCfbbPfJHA97Oa4A==
X-Google-Smtp-Source: APXvYqx5XSE4BmIOlkRofxhble/1rYpcYC58fzYcnPbCJdxQ+lw+Sz3KW8autUMHTKtkQigKTBxOnQ==
X-Received: by 2002:adf:ebc3:: with SMTP id v3mr30755356wrn.280.1576512617135; 
 Mon, 16 Dec 2019 08:10:17 -0800 (PST)
Received: from dell ([185.17.149.202])
 by smtp.gmail.com with ESMTPSA id f1sm21916406wro.85.2019.12.16.08.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2019 08:10:16 -0800 (PST)
Date: Mon, 16 Dec 2019 16:10:15 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH 0/5] drm/i915/dsi: Control panel and backlight enable
 GPIOs from VBT
Message-ID: <20191216161015.GM2369@dell>
References: <20191215163810.52356-1-hdegoede@redhat.com>
 <20191216121840.GS32742@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191216121840.GS32742@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAxNiBEZWMgMjAxOSwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgoKPiBPbiBTdW4sIERl
YyAxNSwgMjAxOSBhdCAwNTozODowNVBNICswMTAwLCBIYW5zIGRlIEdvZWRlIHdyb3RlOgo+ID4g
SGkgQWxsLAo+ID4gCj4gPiBUaGlzIGlzIGEgbmV3IChjb21wbGV0ZWx5IHJld3JpdHRlbikgdmVy
c2lvbiBvZiBteSBwYXRjaGVzIHRvIG1ha2UgdGhlCj4gPiBpOTE1IGNvZGUgY29udHJvbCB0aGUg
U29DIHBhbmVsLSBhbmQgYmFja2xpZ2h0LWVuYWJsZSBHUElPcyBvbiBCYXkgVHJhaWwKPiA+IGRl
dmljZXMgd2hlbiB0aGUgVkJUIGluZGljYXRlcyB0aGF0IHRoZSBTb0Mgc2hvdWxkIGJlIHVzZWQg
Zm9yIGJhY2tsaWdodAo+ID4gY29udHJvbC4gVGhpcyBmaXhlcyB0aGUgcGFuZWwgbm90IGxpZ2h0
aW5nIHVwIG9uIHZhcmlvdXMgZGV2aWNlcyB3aGVuCj4gPiBib290ZWQgd2l0aCBhIEhETUkgbW9u
aXRvciBjb25uZWN0ZWQsIGluIHdoaWNoIGNhc2UgdGhlIGZpcm13YXJlIHNraXBzCj4gPiBpbml0
aWFsaXppbmcgdGhlIHBhbmVsIGFzIGl0IGluaXRzIHRoZSBIRE1JIGluc3RlYWQuCj4gPiAKPiA+
IFRoaXMgc2VyaWVzIGhhcyBiZWVuIHRlc3RlZCBvbjsgYW5kIGZpeGVzIHRoaXMgaXNzdWUgb247
IHRoZSBmb2xsb3dpbmcgbW9kZWxzOgo+ID4gCj4gPiBQZWFxIEMxMDEwCj4gPiBQb2ludCBvZiBW
aWV3IE1PQklJIFRBQi1QODAwVwo+ID4gUG9pbnQgb2YgVmlldyBNT0JJSSBUQUItUDEwMDVXCj4g
PiBUZXJyYSBQYWQgMTA2MQo+ID4gVGh1bmRlcnNvZnQgVFNUMTc4Cj4gPiBZb3VycyBZOFc4MQo+
ID4gCj4gPiBMaW51cywgdGhpcyBzZXJpZXMgc3RhcnRzIHdpdGggdGhlIGFscmVhZHkgZGlzY3Vz
c2VkIHBpbmN0cmwgY2hhbmdlIHRvCj4gPiBleHBvcnQgdGhlIGZ1bmN0aW9uIHRvIHVucmVnaXN0
ZXIgYSBwaW5jdHJsLW1hcC4gV2UgY2FuIGVpdGhlciBtZXJnZSB0aGlzCj4gPiB0aHJvdWdoIGRy
bS1pbnRlbCwgb3IgeW91IGNvdWxkIHBpY2sgaXQgdXAgYW5kIHRoZW4gcHJvdmlkZSBhbiBpbW11
dGFibGUKPiA+IGJyYW5jaCB3aXRoIGl0IGZvciBtZXJnaW5nIGludG8gZHJtLWludGVsLW5leHQu
IFdoaWNoIG9wdGlvbiBkbyB5b3UgcHJlZmVyPwo+ID4gCj4gPiBMZWUsIEkga25vdyB5b3UgZG9u
J3QgbGlrZSB0aGlzLCBidXQgdW5mb3J0dW5hdGVseSB0aGlzIHNlcmllcyBpbnRyb2N1ZGVzCj4g
PiBzb21lIChvdGhlcikgY2hhbmdlcyB0byBkcml2ZXJzL21mZC9pbnRlbF9zb2NfcG1pY19jb3Jl
LmMuIFRoZSBHUElPIHN1YnN5cwo+ID4gYWxsb3dzIG9ubHkgb25lIG1hcHBpbmctdGFibGUgcGVy
IGNvbnN1bWVyLCBzbyBpbiBoaW5kc2lnaHQgYWRkaW5nIHRoZSBjb2RlCj4gPiB3aGljaCBhZGRz
IHRoZSBtYXBwaW5nIGZvciB0aGUgUE1JQyBwYW5lbC1lbmFibGUgcGluIHRvIHRoZSBQTUlDIG1m
ZCBkcml2ZXIKPiA+IHdhcyBhIG1pc3Rha2UsIGFzIHRoZSBQTUlDIGNvZGUgaXMgYSBwcm92aWRl
ciB3aGVyZSBhcyBtYXBwaW5nLXRhYmxlcyBhcmUKPiA+IHBlciBjb25zdW1lci4gVGhlIDR0aCBw
YXRjaCBmaXhlcyB0aGlzIGJ5IG1vdmluZyB0aGUgbWFwcGluZy10YWJsZSB0byB0aGUKPiA+IGk5
MTUgY29kZSwgc28gdGhhdCB3ZSBjYW4gYWxzbyBhZGQgbWFwcGluZ3MgZm9yIHNvbWUgb2YgdGhl
IHBpbnMgb24gdGhlIFNvQwo+ID4gaXRzZWxmLiBTaW5jZSB0aGlzIHdob2xlIHNlcmllcyBtYWtl
cyBjaGFuZ2UgdG8gdGhlIGk5MTUgY29kZSBJIHBsYW4gdG8KPiA+IG1lcmdlIHRoaXMgbWZkIGNo
YW5nZSB0byB0aGUgZHJtLWludGVsIHRyZWUuCj4gCj4gRldJVywgTGVlLCBJIGJlbGlldmUgdGhl
cmUgd2lsbCBiZSBubyAoc2lnbmlmaWNhbnQpIGNoYW5nZXMgaW4gdGhlIGRyaXZlciBIYW5zCj4g
dG91Y2hlZC4gRm9yIHRoZSByZWNvcmQgaXQgc2VlbXMgb25seSBIYW5zIGlzIHRvdWNoaW5nIGRy
aXZlcnMgZm9yIG9sZCBJbnRlbAo+IHBsYXRmb3JtcyAoc3VjaCBhcyBCYXl0cmFpbCBhbmQgQ2hl
cnJ5dmlldykuCgpNb3JlIGV4Y2VwdGlvbnMsIHlheSEKCkFnYWluLCBpbiAqdGhpcyogY2FzZSwg
aXQncyBwcm9iYWJseSBmaW5lLiAgV2hhdCBJIHdhbnQgdG8ga25vdyBpczsKd2hhdCBoYXBwZW5z
IHdoZW4gaXQncyBub3QgZmluZT8gIFdoYXQgaGFwcGVucyB3aGVuIHlvdSBvciBzb21lb25lCmVs
c2Ugc3RhcnRzIGNoYW5naW5nIE1GRCBhbmQgRFJNIG9uIG1vcmUgYWN0aXZlIGZpbGVzPyAgVGhl
biBJIHdpbGwKaGF2ZSB0byBpbnNpc3Qgb24gYW4gaW1tdXRhYmxlIGJyYW5jaC4gIFNvIGl0IHdv
dWxkIGJlIGJldHRlciBmb3IgdGhlCkRSTSB0cmVlIHRvIGJlIGFibGUgdG8gaGFuZGxlIHRoYXQg
dXNlLWNhc2Ugc29vbmVyIHJhdGhlciB0aGFuIGxhdGVyLApyZWdhcmRsZXNzIG9mIHdobyBoYXMg
dGhlIG1vc3QgY2h1cm4uCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNl
cyBUZWNobmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3Ig
QVJNIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
