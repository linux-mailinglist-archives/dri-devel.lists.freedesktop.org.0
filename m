Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1336A05B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 03:37:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE8F6E07B;
	Tue, 16 Jul 2019 01:37:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D8589561;
 Mon, 15 Jul 2019 15:39:37 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c2so14423669wrm.8;
 Mon, 15 Jul 2019 08:39:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ApxKfd4/dGSgTrlf0Sey/fxPy5xS/D0myVrb8BNCXsA=;
 b=nn9RgoevJkH+PdUGVZV8SKkBLeekUOtI1F30t46z0FlP41CjDwzW3F2Vg/MvHVtyrh
 CBf1Lh9UzSAdQ1iv2HF/rzwKRMorG1fDr95YrGxbE3M4ucMmuiSmy5+8iXZt70QwyzjV
 4snZ8SM4YaGe+cS+mvkSV67iuTnxni3736osKAder9aXRc7m6lJX9x2KTBaKaFDoAm4M
 3QBHRi29I0H4xY6bJAX8WARtHi6ozYNhQmvyW2Of2fiZHUoXKz5DjQlmu4cu4qeA0I7N
 GhptIi4Wd0w478TzV4v6zJuPT6fCSZPwNQUuB/KgvsBpz0vJX2vAsaR+6IhnMpXP/DPG
 EYhA==
X-Gm-Message-State: APjAAAUsXbY5yikuoswcbHEtpwdnUFOEPSUj3xJaOOCKoEYn8b/mL6Fn
 jIr/XMbp16p57LHPfZ5NcHA=
X-Google-Smtp-Source: APXvYqzn8uIhzmrjHt7o/XOwvHMX9sErWPnWtKDLcyfUbxGbrrCDuH009+6MckgvfwL/Sif3ZGyqJQ==
X-Received: by 2002:adf:f646:: with SMTP id x6mr31705623wrp.18.1563205175486; 
 Mon, 15 Jul 2019 08:39:35 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
 by smtp.gmail.com with ESMTPSA id z25sm19536196wmf.38.2019.07.15.08.39.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 08:39:34 -0700 (PDT)
Date: Mon, 15 Jul 2019 08:39:32 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 6/7] drm/amd/powerplay: Use proper enums in
 vega20_print_clk_levels
Message-ID: <20190715153932.GA41785@archlinux-threadripper>
References: <20190704055217.45860-1-natechancellor@gmail.com>
 <20190704055217.45860-7-natechancellor@gmail.com>
 <CAK8P3a1e4xKTZc1Fcd9KLwaGG_wpcAnSNu7mrB6zw+aBJ0e0CA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a1e4xKTZc1Fcd9KLwaGG_wpcAnSNu7mrB6zw+aBJ0e0CA@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Tue, 16 Jul 2019 01:36:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ApxKfd4/dGSgTrlf0Sey/fxPy5xS/D0myVrb8BNCXsA=;
 b=NMaNwLeIMvQsJR44JNtC2Sq8RfJgsx5xO543hshM9QHe0ctJb4kViTaJ7OTSjIZGyQ
 mACZrfwA3mIAuomTBnxe4A7gnZYHwBxJTXB+38TWjWmAR/OS9kWcO/e4AJV/PhwGe+YJ
 qakkacr+rn7JU6580QnVLyMz6VKu1I/Y2+t+dhjGmiNiU+JnK05YrjIbDw7o4s0k7VOA
 UKIaf5vqaKIkfJhmdvAjcJmWuURDy+KLrXl/GyvvmegC1NiWuhw8KH+XbSMMKQbTthw5
 DqfJxZyfZ0bS4poC9Wt4E9G77BN1UNByCooZZZeRFi97Txz032rAuJPovELRtN4wpv+G
 WM3A==
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
Cc: clang-built-linux <clang-built-linux@googlegroups.com>,
 Leo Li <sunpeng.li@amd.com>, Rex Zhu <rex.zhu@amd.com>,
 Kevin Wang <kevin1.wang@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgMTE6MjU6MjlBTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBPbiBUaHUsIEp1bCA0LCAyMDE5IGF0IDc6NTIgQU0gTmF0aGFuIENoYW5jZWxsb3IK
PiA8bmF0ZWNoYW5jZWxsb3JAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBjbGFuZyB3YXJuczoK
PiA+Cj4gPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wb3dlcnBsYXkvdmVnYTIwX3Bw
dC5jOjk5NTozOTogd2FybmluZzoKPiA+IGltcGxpY2l0IGNvbnZlcnNpb24gZnJvbSBlbnVtZXJh
dGlvbiB0eXBlICdQUENMS19lJyB0byBkaWZmZXJlbnQKPiA+IGVudW1lcmF0aW9uIHR5cGUgJ2Vu
dW0gc211X2Nsa190eXBlJyBbLVdlbnVtLWNvbnZlcnNpb25dCj4gPiAgICAgICAgICAgICAgICAg
cmV0ID0gc211X2dldF9jdXJyZW50X2Nsa19mcmVxKHNtdSwgUFBDTEtfU09DQ0xLLCAmbm93KTsK
PiA+ICAgICAgICAgICAgICAgICAgICAgICB+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5e
fn5+fn5+fn5+fn5+fn5+fn5+Cj4gPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wb3dl
cnBsYXkvdmVnYTIwX3BwdC5jOjEwMTY6Mzk6IHdhcm5pbmc6Cj4gPiBpbXBsaWNpdCBjb252ZXJz
aW9uIGZyb20gZW51bWVyYXRpb24gdHlwZSAnUFBDTEtfZScgdG8gZGlmZmVyZW50Cj4gPiBlbnVt
ZXJhdGlvbiB0eXBlICdlbnVtIHNtdV9jbGtfdHlwZScgWy1XZW51bS1jb252ZXJzaW9uXQo+ID4g
ICAgICAgICAgICAgICAgIHJldCA9IHNtdV9nZXRfY3VycmVudF9jbGtfZnJlcShzbXUsIFBQQ0xL
X0ZDTEssICZub3cpOwo+ID4gICAgICAgICAgICAgICAgICAgICAgIH5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fl5+fn5+fn5+fn5+fn5+fn5+Cj4gPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS8uLi9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jOjEwMzE6Mzk6IHdhcm5pbmc6Cj4gPiBpbXBs
aWNpdCBjb252ZXJzaW9uIGZyb20gZW51bWVyYXRpb24gdHlwZSAnUFBDTEtfZScgdG8gZGlmZmVy
ZW50Cj4gPiBlbnVtZXJhdGlvbiB0eXBlICdlbnVtIHNtdV9jbGtfdHlwZScgWy1XZW51bS1jb252
ZXJzaW9uXQo+ID4gICAgICAgICAgICAgICAgIHJldCA9IHNtdV9nZXRfY3VycmVudF9jbGtfZnJl
cShzbXUsIFBQQ0xLX0RDRUZDTEssICZub3cpOwo+ID4gICAgICAgICAgICAgICAgICAgICAgIH5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fl5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gPgo+ID4g
VGhlIHZhbHVlcyBhcmUgbWFwcGVkIG9uZSB0byBvbmUgaW4gdmVnYTIwX2dldF9zbXVfY2xrX2lu
ZGV4IHNvIGp1c3QgdXNlCj4gPiB0aGUgcHJvcGVyIGVudW1zIGhlcmUuCj4gPgo+ID4gRml4ZXM6
IDA5Njc2MTAxNDIyNyAoImRybS9hbWQvcG93ZXJwbGF5OiBzdXBwb3J0IHN5c2ZzIHRvIGdldCBz
b2NjbGssIGZjbGssIGRjZWZjbGsiKQo+ID4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL0NsYW5n
QnVpbHRMaW51eC9saW51eC9pc3N1ZXMvNTg3Cj4gPiBTaWduZWQtb2ZmLWJ5OiBOYXRoYW4gQ2hh
bmNlbGxvciA8bmF0ZWNoYW5jZWxsb3JAZ21haWwuY29tPgo+ID4gLS0tCj4gCj4gQWRkaW5nIEtl
dmluIFdhbmcgZm9yIGZ1cnRoZXIgcmV2aWV3LCBhcyBoZSBzZW50IGEgcmVsYXRlZCBwYXRjaCBp
bgo+IGQzNjg5MzM2MmQyMiAoImRybS9hbWQvcG93ZXJwbGF5OiBmaXggc211IGNsb2NrIHR5cGUg
Y2hhbmdlIG1pc3MgZXJyb3IiKQo+IAo+IEkgYXNzdW1lIHRoaXMgb25lIGlzIHN0aWxsIHJlcXVp
cmVkIGFzIGl0IHRyaWdnZXJzIHRoZSBzYW1lIHdhcm5pbmcuCj4gS2V2aW4sIGNhbiB5b3UgaGF2
ZSBhIGxvb2s/Cj4gCj4gICAgICAgQXJuZAoKSW5kZWVkLCB0aGlzIG9uZSBhbmQgaHR0cHM6Ly9n
aXRodWIuY29tL0NsYW5nQnVpbHRMaW51eC9saW51eC9pc3N1ZXMvNTg2CmFyZSBzdGlsbCBvdXRz
dGFuZGluZy4KCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8zMTU1ODEv
CgpDaGVlcnMsCk5hdGhhbgoKPiAKPiA+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92
ZWdhMjBfcHB0LmMgfCA2ICsrKy0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L3ZlZ2EyMF9wcHQuYwo+ID4gaW5kZXggMGYxNGZlMTRlY2Q4Li5lNjJkZDY5MTliMjQgMTAwNjQ0
Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKPiA+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYwo+ID4gQEAg
LTk5Miw3ICs5OTIsNyBAQCBzdGF0aWMgaW50IHZlZ2EyMF9wcmludF9jbGtfbGV2ZWxzKHN0cnVj
dCBzbXVfY29udGV4dCAqc211LAo+ID4gICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4KPiA+ICAg
ICAgICAgY2FzZSBTTVVfU09DQ0xLOgo+ID4gLSAgICAgICAgICAgICAgIHJldCA9IHNtdV9nZXRf
Y3VycmVudF9jbGtfZnJlcShzbXUsIFBQQ0xLX1NPQ0NMSywgJm5vdyk7Cj4gPiArICAgICAgICAg
ICAgICAgcmV0ID0gc211X2dldF9jdXJyZW50X2Nsa19mcmVxKHNtdSwgU01VX1NPQ0NMSywgJm5v
dyk7Cj4gPiAgICAgICAgICAgICAgICAgaWYgKHJldCkgewo+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgcHJfZXJyKCJBdHRlbXB0IHRvIGdldCBjdXJyZW50IHNvY2NsayBGYWlsZWQhIik7Cj4g
PiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gQEAgLTEwMTMsNyArMTAx
Myw3IEBAIHN0YXRpYyBpbnQgdmVnYTIwX3ByaW50X2Nsa19sZXZlbHMoc3RydWN0IHNtdV9jb250
ZXh0ICpzbXUsCj4gPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPgo+ID4gICAgICAgICBjYXNl
IFNNVV9GQ0xLOgo+ID4gLSAgICAgICAgICAgICAgIHJldCA9IHNtdV9nZXRfY3VycmVudF9jbGtf
ZnJlcShzbXUsIFBQQ0xLX0ZDTEssICZub3cpOwo+ID4gKyAgICAgICAgICAgICAgIHJldCA9IHNt
dV9nZXRfY3VycmVudF9jbGtfZnJlcShzbXUsIFNNVV9GQ0xLLCAmbm93KTsKPiA+ICAgICAgICAg
ICAgICAgICBpZiAocmV0KSB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBwcl9lcnIoIkF0
dGVtcHQgdG8gZ2V0IGN1cnJlbnQgZmNsayBGYWlsZWQhIik7Cj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICByZXR1cm4gcmV0Owo+ID4gQEAgLTEwMjgsNyArMTAyOCw3IEBAIHN0YXRpYyBpbnQg
dmVnYTIwX3ByaW50X2Nsa19sZXZlbHMoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCj4gPiAgICAg
ICAgICAgICAgICAgYnJlYWs7Cj4gPgo+ID4gICAgICAgICBjYXNlIFNNVV9EQ0VGQ0xLOgo+ID4g
LSAgICAgICAgICAgICAgIHJldCA9IHNtdV9nZXRfY3VycmVudF9jbGtfZnJlcShzbXUsIFBQQ0xL
X0RDRUZDTEssICZub3cpOwo+ID4gKyAgICAgICAgICAgICAgIHJldCA9IHNtdV9nZXRfY3VycmVu
dF9jbGtfZnJlcShzbXUsIFNNVV9EQ0VGQ0xLLCAmbm93KTsKPiA+ICAgICAgICAgICAgICAgICBp
ZiAocmV0KSB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBwcl9lcnIoIkF0dGVtcHQgdG8g
Z2V0IGN1cnJlbnQgZGNlZmNsayBGYWlsZWQhIik7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICByZXR1cm4gcmV0OwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
