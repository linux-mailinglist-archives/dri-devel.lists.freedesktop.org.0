Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B82F372659
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 09:10:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F5F06EA8B;
	Tue,  4 May 2021 07:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0566EA8B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 07:10:35 +0000 (UTC)
Received: from mail-03.mail-europe.com (mail-0301.mail-europe.com
 [188.165.51.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41103.protonmail.ch (Postfix) with ESMTPS id 4FZ9wT1kzCz4x0dD
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 07:10:33 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
 dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="fmKP2nME"
Date: Tue, 04 May 2021 07:10:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1620112228;
 bh=n3qtrmA4kyXeqfGp3Z22tUAdN0erGv0VeyurimTLBxk=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=fmKP2nME42Zb/3qWl+g+8652dANT8JOJKsYZdsttQqi4LSnvu6/AvkkIGdlVKrkIg
 JHCj38a+j3eDEky4iyKEx0VcRP3LM4YLoxl15KqnszoKOnJ/Rwm/bRWkzKVjyuiZ/t
 GVK6SV3GRUz9jK8Nxw6Z/JFZBc7oqXe5vaZ4ynLc=
To: Daniel Thompson <daniel.thompson@linaro.org>
From: pgeiem <pgeiem@protonmail.com>
Subject: Re: [led-backlight] default-brightness-level issue
Message-ID: <nWt-MsQqcZxadSz0_6t5wBwTdvQP_6yEUjQF4C4ZYrXVXhlbnSFg0X4ArKqA4VBS-UBot2nZoAzjQjvpWp0vtW3a3vFAjeC5FDWmnbwcdww=@protonmail.com>
In-Reply-To: <20210429120727.vdei5rt6avfo6xxp@maple.lan>
References: <e_WDxLKZ_lxATxDaTMkr5jVLhIs2O0NQOSd-Inff7IMEU7i1QyX_BTldVJZgP_Yb-lgzTmpPxni_1YCQmhyGmi_ahjHbG5aCNtUngw35g0M=@protonmail.com>
 <20210429110016.76huj54zijvhtuan@maple.lan>
 <iOsaGQwBS7Kf3OTapGfH6piU_e_SL0O_FyccdxfGlPCCVF6oHrjk4pMrqAbMA7S8DjTPKs47t8e4C_dq5fjDT5rasK5GSkFTWpW5j9saxTE=@protonmail.com>
 <20210429120727.vdei5rt6avfo6xxp@maple.lan>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: pgeiem <pgeiem@protonmail.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

4oCQ4oCQ4oCQ4oCQ4oCQ4oCQ4oCQIE9yaWdpbmFsIE1lc3NhZ2Ug4oCQ4oCQ4oCQ4oCQ4oCQ4oCQ
4oCQCk9uIFRodXJzZGF5LCBBcHJpbCAyOSwgMjAyMSAyOjA3IFBNLCBEYW5pZWwgVGhvbXBzb24g
PGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPiB3cm90ZToKCj4gT24gVGh1LCBBcHIgMjksIDIw
MjEgYXQgMTE6MzE6MjBBTSArMDAwMCwgcGdlaWVtIHdyb3RlOgo+Cj4gPiBPbiBUaHVyc2RheSwg
QXByaWwgMjksIDIwMjEgMTowMCBQTSwgRGFuaWVsIFRob21wc29uIGRhbmllbC50aG9tcHNvbkBs
aW5hcm8ub3JnIHdyb3RlOgo+ID4KPiA+ID4gT24gRnJpLCBBcHIgMjMsIDIwMjEgYXQgMDE6MDQ6
MjNQTSArMDAwMCwgcGdlaWVtIHdyb3RlOgo+ID4gPgo+ID4gPiA+IERlYXIgYWxsLAo+ID4gPiA+
IE9uIGEgY3VzdG9tIGJvYXJkIEkgaGF2ZSBhIHNpbXBsZSBEUEkgcGFuZWwuIFBhbmVsJ3MgYmFj
a2xpZ2h0IGlzCj4gPiA+ID4gZHJpdmUgd2l0aCBhbiBJMkMgbGVkIGRyaXZlciAoUENBOTYzMiku
IGxlZC1iYWNrbGlnaHQgZHJpdmVyIGlzIHN1ZWQKPiA+ID4gPiB0byBtYW5hZ2UgdGhpcyBhcyBh
IGJhY2tsaWdodC4KPiA+ID4gPiBXaGVuIHVzaW5nIGJyaWdodG5lc3MtbGV2ZWxzIGFuZCBkZWZh
dWx0LWJyaWdodG5lc3MtbGV2ZWwgdGhlCj4gPiA+ID4gYmFja2xpZ2h0IHN0YXkgdHVybmVkLW9m
ZiBldmVuIGlmIG1hbnVhbGx5IHRyeWluZyB0byBzZXQgYSBkaWZmZXJlbnQKPiA+ID4gPiBpbmRl
eCB2YWx1ZSB0byBicmlnaHRuZXNzIHRocm91Z2ggc3lzZnMuCj4gPiA+ID4gSSB0cmFjZWQgdGhp
cyBpc3N1ZSBhcyBmb2xsb3c6IFdoZW4gbGVkX2JsX3VwZGF0ZV9zdGF0dXMoKSBpcyBjYWxsZWQK
PiA+ID4gPiB0aGUgYnJpZ2h0bmVzcyB2YWx1ZSBpcyByZXR1cm5lZCBmcm9tIGJhY2tsaWdodF9n
ZXRfYnJpZ2h0bmVzcygpIHdoaWNoCj4gPiA+ID4gY2FsbCBiYWNrbGlnaHRfaXNfYmxhbmsoKS4g
SW4gbXkgY2FzZSBiYWNrbGlnaHRfaXNfYmxhbmsoKSByZXR1cm4gdHJ1ZQo+ID4gPiA+IGR1ZSB0
byBwcm9wcy5wb3dlciA9IEZCX0JMQU5LX1BPV0VSRE9XTiB3aGljaCBpcyAhPSBGQl9CTEFOS19V
TkJMQU5LLgo+ID4gPiA+IEkgdHJhY2VkIHdoeSBhdCBzdGFydHVwIHByb3BzLnBvd2VyIGlzIEZC
X0JMQU5LX1BPV0VSRE9XTiBhbmQgZm91bmQKPiA+ID4gPiB0aGF0IGluIGxlZF9ibF9wcm9iZSgp
IHdoZW4gYSBkZWZhdWx0IGJyaWdodG5lc3MgaXMgc2V0ICg+MCkKPiA+ID4gPiBwcm9wcy5wb3dl
ciBpcyBzZXQgdG8gRkJfQkxBTktfUE9XRVJET1dOIHdoaWNoIHNlZW1zIGluY29ycmVjdCB0byBt
ZS4KPiA+ID4gPiBJIG1hZGUgdGhlIHNtYWxsIGNoYW5nZSBiZWxvdyBhbmQgZGVmYXVsdCBicmln
aHRuZXNzIGlzIGNvcnJlY3RseSB1c2VkCj4gPiA+ID4gYXQgc3RhcnR1cC4gSSBhbSBub3QgcmVh
bGx5IHN1cmUgdGhpcyBpcyBhbiBpc3N1ZSBhbmQgaWYgbXkgY2hhbmdlIGlzCj4gPiA+ID4gY29y
cmVjdCBvciBpZiBJIGFtIGRvaW5nIHNvbWV0aGluZyBpbmNvcnJlY3Qgc29tZXdoZXJlIGVsc2Uu
IFNvIEkKPiA+ID4gPiBmaXJzdCB3b3VsZCBsaWtlIHRvIGdldCB5b3VyIG9waW5pb24gb24gdGhp
cyBhbmQgaWYgY29ycmVjdCB3aWxsIHNlbmQKPiA+ID4gPiBhIHBhdGNoLgo+ID4gPgo+ID4gPiBN
YWtlcyBzZW5zZS4gUGxlYXNlIHNlbmQgdGhpcyBhcyBhIHBhdGNoLgo+ID4gPiBEYW5pZWwuCj4g
Pgo+ID4gSSBmaW5hbGx5IGJlbGlldmUgdGhpcyB3YXMgY29ycmVjdC4KPiA+IEEgbGluayBiZXR3
ZWVuIHRoZSBwYW5lbCBhbmQgdGhlIGJhY2tsaWdodCB3YXMgbWlzc2luZyBpbiBkdHMuIFdpdGgg
dGhpcyBsaW5rIHRoZSBiYWNrbGlnaHQgaXMgdHVybmVkIG9uIChwcm9wcy5wb3dlciA9IEZCX0JM
QU5LX1VOQkxBTkspIGZyb20gZHJtX3BhbmVsX2VuYWJsZSBmdW5jdGlvbiBhZnRlciBlbmFibGlu
ZyB0aGUgcGFuZWwuCj4gPiBMZXQgbWUga25vdyBpZiB5b3UgZGlzYWdyZWUgYW5kIHN0aWxsIGJl
bGlldmUgSSBzaG91bGQgc2VuZCB0aGUgcGF0Y2guCj4KPiBUaGUgb3JpZ2luYWwgbG9naWMgaXMg
ZGVmaW5pdGVseSB3cm9uZy4KPgo+IEhvd2V2ZXIgdGhhdCBkb2Vzbid0IG1lYW4gdGhlIGRyaXZl
ciB3aWxsIGJlIGZ1bGx5IGNvcnJlY3QgYWZ0ZXIgZml4aW5nCj4gc2luY2UgaXQgZG9lcyBsb29r
IGxpa2UgaXMgbWlzc2luZyB0aGUgbG9naWMgZm91bmQgaW4gb3RoZXIgc2ltaWxhcgo+IGRyaXZl
cnMgKHB3bS1ibC5jIGFuZCBncGlvX2JhY2tsaWdodC5jKSB0byBoYW5kbGUgdGhlIHZhcmlvdXMg
ZGlmZmVyZW50Cj4gY2FzZXMgdy5yLnQuIGhhbmRvdmVyIGZyb20gYWN0aXZlIGJhY2tsaWdodCBi
eSB0aGUgYm9vdGxvYWRlci4KPgo+IERhbmllbC4KCm9rIHlvdSBhcmUgcmlnaHQsIHdpbGwgc2Vl
IGlmIEkgY2FuIHBvcnQgdGhlIGxvZ2ljIGZyb20gb3RoZXJzIGJhY2tsaWdodCBkcml2ZXJzIHRv
IHRoaXMgb25lLgoKUGF0cmljawpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
