Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9E1E2A83
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 08:47:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F4FD6E0ED;
	Thu, 24 Oct 2019 06:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03CD86E0ED
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 06:47:30 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id r1so14864631wrs.9
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 23:47:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=UclEmd8YX++NCf8kPKkA+46Pa3LHuXqjjWzo9Z3XdYM=;
 b=Y1v5szUSI4U99HymdAGof0TtzTpodB+F3jqmzdzAG1myb30HHDuvxEx9w2gUg0dP2X
 jovIn3NVZ5V4xfN7x5oWHTpBst9T7fBu0CvEN00jy4Ew8sm9XThF+KZ8K+ggy/0+sgeG
 lb44PVx6d+oYigxQ5bvYd3ROXAPtQko846WX6V+R9dCFtZgv7jrU4JPpxAwQAuZNGmgP
 z/rSdnnmrlG1R14Q3B8fTgVXLyQ0vnJDM/b1dsPHdj3Nh9g4XIdN2fGccV8OG090CyLL
 gH49tN0Y0L3hyui9QIQRSJFSh0Aql6ZeEbyLfgJZRcVDgk4esUlk3pen/1dP60M39nqj
 79zw==
X-Gm-Message-State: APjAAAWG7MKYKGYLsxJM4ZasCeCjsPhanOjPy7M1hInsFo0tygZYUl/f
 FL4UhBuQbbPGWlJs8I/Zm3xrGA==
X-Google-Smtp-Source: APXvYqypA7QDjMUQSuSTEtC5xtMr2uR+W7rMNaXx381pXfKuL3lSrfZeffkl8xEc2dweA8MOowi2LA==
X-Received: by 2002:adf:e34b:: with SMTP id n11mr2183760wrj.250.1571899648399; 
 Wed, 23 Oct 2019 23:47:28 -0700 (PDT)
Received: from dell ([95.149.164.99])
 by smtp.gmail.com with ESMTPSA id q11sm1694268wmq.21.2019.10.23.23.47.27
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 23 Oct 2019 23:47:27 -0700 (PDT)
Date: Thu, 24 Oct 2019 07:47:26 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH v7 0/9] backlight: gpio: simplify the driver
Message-ID: <20191024064726.GB15843@dell>
References: <20191022083630.28175-1-brgl@bgdev.pl>
 <CAMRc=MeyrDZgmHJ+2SMipP7y9NggxiVfkAh4kCLePFWvUku9aQ@mail.gmail.com>
 <20191023155941.q563d3cfizre4zvt@holly.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191023155941.q563d3cfizre4zvt@holly.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=UclEmd8YX++NCf8kPKkA+46Pa3LHuXqjjWzo9Z3XdYM=;
 b=SO7SqUbR2Vy59Qq6nC05Ir/m4UFWccS9Wg42Qz+tm9gLjOJBtQVpbadit9ajsImgB8
 c8fISobck8KfXDkvhVEAnmQQnj/ONNNXGGRdnlPWFSRZNoHaRE7yF/P0cfwLmTpjqdj/
 o5OntZbUc+OPgDWBm113VxzXeoq8Q1/qkHgFnq10DL28gdpjzZWxSDUC/Yj86kvQO/ty
 kIU+AlVHw0avbfCfFkY02yWNr9dkyKePz29U7S/ucuVeQxt4fC7HtLggOu4eqCEw+pZo
 jrazNHTw0zilOZKo4xWqKHCeWWdeLZLc51W7hWl1BXY5W8cXvNGqmOH+TqBFnCufB1qz
 ViCA==
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
Cc: Jacopo Mondi <jacopo@jmondi.org>, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMyBPY3QgMjAxOSwgRGFuaWVsIFRob21wc29uIHdyb3RlOgoKPiBPbiBUdWUsIE9j
dCAyMiwgMjAxOSBhdCAxMToyOTo1NEFNICswMjAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3Rl
Ogo+ID4gd3QuLCAyMiBwYcW6IDIwMTkgbyAxMDozNiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxicmds
QGJnZGV2LnBsPiBuYXBpc2HFgihhKToKPiA+ID4KPiA+ID4gRnJvbTogQmFydG9zeiBHb2xhc3pl
d3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KPiA+ID4KPiA+ID4gV2hpbGUgd29ya2lu
ZyBvbiBteSBvdGhlciBzZXJpZXMgcmVsYXRlZCB0byBncGlvLWJhY2tsaWdodFsxXSBJIG5vdGlj
ZWQKPiA+ID4gdGhhdCB3ZSBjb3VsZCBzaW1wbGlmeSB0aGUgZHJpdmVyIGlmIHdlIG1hZGUgdGhl
IG9ubHkgdXNlciBvZiBwbGF0Zm9ybQo+ID4gPiBkYXRhIHVzZSBHUElPIGxvb2t1cHMgYW5kIGRl
dmljZSBwcm9wZXJ0aWVzLiBUaGlzIHNlcmllcyB0cmllcyB0byBkbwo+ID4gPiB0aGF0Lgo+ID4g
Pgo+ID4gPiBGaXJzdCB0d28gcGF0Y2hlcyBjb250YWluIG1pbm9yIGZpeGVzLiBUaGlyZCBwYXRj
aCBtYWtlcyB0aGUgZHJpdmVyCj4gPiA+IGV4cGxpY2l0bHkgZHJpdmUgdGhlIEdQSU8gbGluZS4g
Rm91cnRoIHBhdGNoIGFkZHMgYWxsIG5lY2Vzc2FyeSBkYXRhCj4gPiA+IHN0cnVjdHVyZXMgdG8g
ZWNvdmVjMjQuIFBhdGNoIDUvOSB1bmlmaWVzIG11Y2ggb2YgdGhlIGNvZGUgZm9yIGJvdGgKPiA+
ID4gcGRhdGEgYW5kIG5vbi1wZGF0YSBjYXNlcy4gUGF0Y2hlcyA2LTcvOSByZW1vdmUgdW51c2Vk
IHBsYXRmb3JtIGRhdGEKPiA+ID4gZmllbGRzLiBMYXN0IHR3byBwYXRjaGVzIGNvbnRhaW4gYWRk
aXRpb25hbCBpbXByb3ZlbWVudHMgZm9yIHRoZSBHUElPCj4gPiA+IGJhY2tsaWdodCBkcml2ZXIg
d2hpbGUgd2UncmUgYWxyZWFkeSBtb2RpZnlpbmcgaXQuCj4gPiA+Cj4gPiA+IEkgZG9uJ3QgaGF2
ZSBhY2Nlc3MgdG8gdGhpcyBIVyBidXQgaG9wZWZ1bGx5IHRoaXMgd29ya3MuIE9ubHkgY29tcGls
ZQo+ID4gPiB0ZXN0ZWQuCj4gPiA+Cj4gPiA+IFsxXSBodHRwczovL2xrbWwub3JnL2xrbWwvMjAx
OS82LzI1LzkwMAo+ID4gPgo+ID4gPiB2MSAtPiB2MjoKPiA+ID4gLSByZWJhc2VkIG9uIHRvcCBv
ZiB2NS4zLXJjMSBhbmQgYWRqdXN0ZWQgdG8gdGhlIHJlY2VudCBjaGFuZ2VzIGZyb20gQW5keQo+
ID4gPiAtIGFkZGVkIGFkZGl0aW9uYWwgdHdvIHBhdGNoZXMgd2l0aCBtaW5vciBpbXByb3ZlbWVu
dHMKPiA+ID4KPiA+ID4gdjIgLT4gdjM6Cj4gPiA+IC0gaW4gcGF0Y2ggNy83OiB1c2VkIGluaXRp
YWxpemVycyB0byBzZXQgdmFsdWVzIGZvciBwZGF0YSBhbmQgZGV2IGxvY2FsIHZhcnMKPiA+ID4K
PiA+ID4gdjMgLT4gdjQ6Cj4gPiA+IC0gcmViYXNlZCBvbiB0b3Agb2YgdjUuNC1yYzEKPiA+ID4g
LSByZW1vdmVkIGNoYW5nZXMgdGhhdCBhcmUgbm8gbG9uZ2VyIHJlbGV2YW50IGFmdGVyIGNvbW1p
dCBlYzY2NWI3NTZlNmYKPiA+ID4gICAoImJhY2tsaWdodDogZ3Bpby1iYWNrbGlnaHQ6IENvcnJl
Y3QgaW5pdGlhbCBwb3dlciBzdGF0ZSBoYW5kbGluZyIpCj4gPiA+IC0gYWRkZWQgcGF0Y2ggNy83
Cj4gPiA+Cj4gPiA+IHY0IC0+IHY1Ogo+ID4gPiAtIGluIHBhdGNoIDcvNzogYWRkZWQgYSBjb21t
ZW50IHJlcGxhY2luZyB0aGUgbmFtZSBvZiB0aGUgZnVuY3Rpb24gYmVpbmcKPiA+ID4gICBwdWxs
ZWQgaW50byBwcm9iZSgpCj4gPiA+Cj4gPiA+IHY1IC0+IHY2Ogo+ID4gPiAtIGFkZGVkIGEgcGF0
Y2ggbWFraW5nIHRoZSBkcml2ZXIgZXhwbGljaXRseSBzZXQgdGhlIGRpcmVjdGlvbiBvZiB0aGUg
R1BJTwo+ID4gPiAgIHRvIG91dHB1dAo+ID4gPiAtIGFkZGVkIGEgcGF0Y2ggcmVtb3ZpbmcgYSBy
ZWR1bmRhbnQgbmV3bGluZQo+ID4gPgo+ID4gPiB2NiAtPiB2NzoKPiA+ID4gLSByZW5hbWVkIHRo
ZSBmdW5jdGlvbiBjYWxjdWxhdGluZyB0aGUgbmV3IEdQSU8gdmFsdWUgZm9yIHN0YXR1cyB1cGRh
dGUKPiA+ID4gLSBjb2xsZWN0ZWQgbW9yZSB0YWdzCj4gPiA+Cj4gPiA+IEJhcnRvc3ogR29sYXN6
ZXdza2kgKDkpOgo+ID4gPiAgIGJhY2tsaWdodDogZ3BpbzogcmVtb3ZlIHVubmVlZGVkIGluY2x1
ZGUKPiA+ID4gICBiYWNrbGlnaHQ6IGdwaW86IHJlbW92ZSBzdHJheSBuZXdsaW5lCj4gPiA+ICAg
YmFja2xpZ2h0OiBncGlvOiBleHBsaWNpdGx5IHNldCB0aGUgZGlyZWN0aW9uIG9mIHRoZSBHUElP
Cj4gPiA+ICAgc2g6IGVjb3ZlYzI0OiBhZGQgYWRkaXRpb25hbCBwcm9wZXJ0aWVzIHRvIHRoZSBi
YWNrbGlnaHQgZGV2aWNlCj4gPiA+ICAgYmFja2xpZ2h0OiBncGlvOiBzaW1wbGlmeSB0aGUgcGxh
dGZvcm0gZGF0YSBoYW5kbGluZwo+ID4gPiAgIHNoOiBlY292ZWMyNDogZG9uJ3Qgc2V0IHVudXNl
ZCBmaWVsZHMgaW4gcGxhdGZvcm0gZGF0YQo+ID4gPiAgIGJhY2tsaWdodDogZ3BpbzogcmVtb3Zl
IHVudXNlZCBmaWVsZHMgZnJvbSBwbGF0Zm9ybSBkYXRhCj4gPiA+ICAgYmFja2xpZ2h0OiBncGlv
OiB1c2UgYSBoZWxwZXIgdmFyaWFibGUgZm9yICZwZGV2LT5kZXYKPiA+ID4gICBiYWNrbGlnaHQ6
IGdwaW86IHB1bGwgZ3Bpb19iYWNrbGlnaHRfaW5pdGlhbF9wb3dlcl9zdGF0ZSgpIGludG8gcHJv
YmUKPiA+ID4KPiA+ID4gIGFyY2gvc2gvYm9hcmRzL21hY2gtZWNvdmVjMjQvc2V0dXAuYyAgICAg
ICAgIHwgIDMzICsrKy0tCj4gPiA+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2ts
aWdodC5jICAgICB8IDEyOCArKysrKysrLS0tLS0tLS0tLS0tCj4gPiA+ICBpbmNsdWRlL2xpbnV4
L3BsYXRmb3JtX2RhdGEvZ3Bpb19iYWNrbGlnaHQuaCB8ICAgMyAtCj4gPiA+ICAzIGZpbGVzIGNo
YW5nZWQsIDY5IGluc2VydGlvbnMoKyksIDk1IGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPgo+ID4g
Cj4gPiBMZWUsIERhbmllbCwgSmluZ29vLAo+ID4gCj4gPiBKYWNvcG8gaXMgdHJhdmVsbGluZyB1
bnRpbCBOb3ZlbWJlciAxc3QgYW5kIHdvbid0IGJlIGFibGUgdG8gdGVzdCB0aGlzCj4gPiBhZ2Fp
biBiZWZvcmUgdGhpcyBkYXRlLiBEbyB5b3UgdGhpbmsgeW91IGNhbiBwaWNrIGl0IHVwIGFuZCBp
biBjYXNlCj4gPiBhbnl0aGluZydzIGJyb2tlbiBvbiBTSCwgd2UgY2FuIGZpeCBpdCBhZnRlciB2
NS41LXJjMSwgc28gdGhhdCBpdAo+ID4gZG9lc24ndCBtaXNzIGFub3RoZXIgbWVyZ2Ugd2luZG93
PwoKTm92ZW1iZXIgMXN0ICgtcmM2KSB3aWxsIGJlIGZpbmUuCgpJJ2QgcmF0aGVyIGFwcGx5IGl0
IGxhdGUtdGVzdGVkIHRoYW4gZWFybHktbm9uLXRlc3RlZC4KCkhvcGVmdWxseSBKYWNvcG8gY2Fu
IHByaW9yaXRpc2UgdGVzdGluZyB0aGlzIG9uIFRodXJzZGF5IG9yIEZyaWRheSwKc2luY2UgTW9u
ZGF5IHdpbGwgYmUgLXJjNyB3aGljaCBpcyByZWFsbHkgY3V0dGluZyBpdCBmaW5lLgoKPiBPdXRz
aWRlIG9mIGhvbGlkYXlzIGFuZCBvdGhlciBlbWVyZ2VuY2llcyBMZWUgdXN1YWxseSBjb2xsZWN0
cyB1cCB0aGUKPiBwYXRjaGVzIGZvciBiYWNrbGlnaHQuIEknbSBub3Qgc3VyZSB3aGVuIGhlIHBs
YW5zIHRvIGNsb3NlIHRoaW5ncyBmb3IKPiB2NS41LgoKSW4gc3BlY2lhbCBjYXNlcyBzdWNoIGFz
IHRoZXNlIEkgY2FuIHJlbWFpbiBmbGV4aWJsZS4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10K
TGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNl
IHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIg
fCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
