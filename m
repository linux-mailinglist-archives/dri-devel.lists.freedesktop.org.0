Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE78E19A4
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 14:12:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930BC6EA60;
	Wed, 23 Oct 2019 12:12:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from frontdoor.pr.hu (frontdoor.pr.hu
 [IPv6:2a02:808:1:101:250:56ff:fe8e:136b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB5826EA5F;
 Wed, 23 Oct 2019 12:12:11 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
 by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <zboszor@pr.hu>)
 id 1iNFUn-00068U-QE; Wed, 23 Oct 2019 14:12:09 +0200
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
 helo=[192.168.1.13])
 by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <zboszor@pr.hu>)
 id 1iNFUj-0004jQ-Ss; Wed, 23 Oct 2019 14:12:07 +0200
Subject: Re: UDL device cannot get its own screen
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <536af56f-924d-f089-a2d8-180f4dee1613@pr.hu>
 <20191023104225.60f969a0@eldfell.localdomain>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Message-ID: <aabe43c6-e0a9-270a-4748-09824ffeec33@pr.hu>
Date: Wed, 23 Oct 2019 14:12:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191023104225.60f969a0@eldfell.localdomain>
Content-Language: en-US
X-Spam-Score: -1.8 (-)
X-Scan-Signature: e60d8c77b9093fb5a9e5e1cf29f3793d
X-Spam-Tracer: backend.mail.pr.hu -1.8 20191023121207Z
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=pr.hu; 
 s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a4vN0B7JRcxdel2dhYf+FANunyFh9Gj8QLR0OV+McX0=; b=XLWCFVNpo27a0tpkOnVrYJgN/+
 n2/35uDaxM4dRpxI8tiALDE7wuXCEgeWUJx1VX1iogcRkQo9tjk0SYArSJq5d8BiYgtPtBKfd+/RC
 vCA486JlEKtLqc6W8GVZ5AWdI6CUmaS33PWc6p2DBntidgk7WJF6VN2wB1j9koZtMqtdfIOsFzy5R
 SuWFKQdo1D96KyRTxQVdWcaIvM5BQ8n6GFVOkQXPS7k/B7aRZmJG4H3JSZ7RUvz8TZWiCyf/ALerI
 FpMFJT52SHpXB3UtM1MMqaQvfXZS/SMfg+H8n80eaFm1uOn47yE8eR5M74Kjd/vNTYO2QobFn8con
 8+nAFbrQ==;
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
Cc: xorg@lists.x.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjAxOS4gMTAuIDIzLiA5OjQyIGtlbHRlesOpc3NlbCwgUGVra2EgUGFhbGFuZW4gw61ydGE6Cj4g
T24gVHVlLCAyMiBPY3QgMjAxOSAxNzo1MDoyMSArMDIwMAo+IELDtnN6w7ZybcOpbnlpIFpvbHTD
oW4gPHpib3N6b3JAcHIuaHU+IHdyb3RlOgo+IAo+PiBIaSwKPj4KPj4gSSBoYXZlIHRoZSBiZWxv
dyBjb25maWd1cmF0aW9uIGZvciBhbiBJbnRlbCBiYXNlZCBQT1Mgc3lzdGVtIHRoYXQsCj4+IHdo
aWxlIGFkdmVydGlzZXMgMyBvdXRwdXRzIChEUDEsIFZHQTEgYW5kIEhETUkxIHdpdGggeGY4Ni12
aWRlby1pbnRlbCksCj4+IG9ubHkgdHdvIGFyZSB1c2FibGUuIERQMSBmb3IgdGhlIGJ1aWx0LWlu
IHRvdWNoc2NyZWVuIGFuZCBWR0ExIGZvcgo+PiB0aGUgZXh0ZXJuYWwgVkdBIGNvbm5lY3Rvci4K
Pj4KPj4gSSB3YW50ZWQgdG8gdXNlIGFuIFVTQiBEaXNwbGF5TGluayBkZXZpY2UgYXMgdGhlIDNy
ZCBvdXRwdXQsIHdpdGggYWxsCj4+IHRocmVlIG91dHB1dCB1c2luZyBpdHMgb3duIFNjcmVlbiBu
dW1iZXIsIGkuZS4gOjAuMCA6MC4xIGFuZCA6MC4yLgo+IAo+IC4uLgo+IAo+PiBUaGUgdGhpcmQg
b2JzZXJ2YXRpb24gaXMgdGhhdCB3aGlsZSBJIGFtIHVzaW5nIHRoaXMgY29uZmlndXJhdGlvbiBi
ZWxvdywKPj4gc28gdGhlIFVETCBkZXZpY2Ugc2hvdWxkIGJlIGFzc2lnbmVkIHRvIDowLjIgKGFu
ZCBhY3RpdmUhKSwgaXQgaXMgcmVhbGx5Cj4+IGFzc2lnbmVkIHRvIDowWy4wXSBhcyBhbiBpbmFj
dGl2ZSBvdXRwdXQuIFNlZSB0aGF0IHRoZXJlJ3Mgbm8gIioiIGluZGljYXRvcgo+PiBzZXQgZm9y
IGFueSBvZiB0aGUgc3VwcG9ydGVkIG1vZGVzIG9uIERWSS1JLTEtMS4KPj4KPj4gSG93IGNhbiBJ
IHNldCB1cCAzIGRpZmZlcmVudCBTY3JlZW5zIGNvcnJlY3RseSBmb3IgMyBzZXBhcmF0ZSBmdWxs
c2NyZWVuCj4+IGFwcGxpY2F0aW9ucz8KPj4KPj4gSSBhbSB1c2luZyBYb3JnIDEuMjAuNCBwYXRj
aGVkIHdpdGggdGhlICJhdXRvYmluZCBHUFVzIHRvIHRoZSBzY3JlZW4iCj4+IHBhdGNoIGZyb20g
RGF2ZSBBaXJsaWUgdGhhdCBhdCBsZWFzdCB3YWtlcyB1cCB0aGUgVURMIGRldmljZSBhbmQgbWFr
ZXMKPj4gaXQgdmlzaWJsZSB3aXRob3V0IGV4dHJhIG1hZ2ljIHdpdGggcHJvdmlkZXJzL3Npbmtz
Lgo+IAo+IEhpLAo+IAo+IGZvciB5b3VyIHNwZWNpZmljIHVzZSBjYXNlLCBhdXRvLWJpbmQgaXMg
ZXhhY3RseSB3aGF0IHlvdSBkbyBub3Qgd2FudC4KPiBTbyBkcm9wIHRoZSBwYXRjaCBvciAoc2lu
Y2UgdGhlIHBhdGNoIGlzIGluIHVwc3RyZWFtIG1hc3RlciBhbHJlYWR5KQo+IHVzZSB0aGUgb3B0
aW9uIGl0IGFkZHMgdG8gc3RvcCBhdXRvLWJpbmRpbmcuCgpXaXRoIE9wdGlvbiAiQXV0b0JpbmRH
UFUiICJmYWxzZSIgaW4gZWZmZWN0IChlcXVpdmFsZW50IG9mIGJhY2tpbmcgdGhlCnBhdGNoIG91
dCkgdGhlIFVETCBkZXZpY2UgZG9lcyBub3QgZ2V0IGFzc2lnbmVkIHRvIEFOWSBvZiB0aGUgc2Ny
ZWVucy4KCkkgd2FudCBpdCB0byBoYXZlIGl0cyBvd24gOjAuMiBiaXQgdGhhdCBkb2Vzbid0IGhh
cHBlbi4KCj4gCj4gCj4gVGhhbmtzLAo+IHBxCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
