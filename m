Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA36E8F37D
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 20:34:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A9B96EA31;
	Thu, 15 Aug 2019 18:34:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C21DD6E8A5;
 Thu, 15 Aug 2019 18:34:22 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id y8so3036041wrn.10;
 Thu, 15 Aug 2019 11:34:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rlVguU9XpgwsYUA+9hxlWvJwepLXZJiyhWUMhPLxtJU=;
 b=KWzZfy6MPQmaCYxEw7eIN3ULWw5A9EcAZDZJ4AhgHrErvuqT2b6RlK4xk0yURwwzdw
 YX2LtzrmngF+Jv7XCMgNG2xDNUKsaEYHqkKczlyT6IAgVrM59oek4lxSNSG3DGw+U7MB
 kTIpwmVBW3YI6OQGU4OOYXi8CsywZjrSaiZzsA0kCo5L5vBZPMVPgdKCs9nz69RppIyM
 1o0fncorxHmEiiiPtVnZwLNh3v+BhDLOE/rZ8Uy2mL3m5DnEo/IOYHaRebmEbVKVTVT6
 jwGzKydnsaW/ndNJi2aouKs6ksmwgdS4oYb9twmXm3pSCP5Fv74q/p+w2DsfqPoigTy4
 K7JQ==
X-Gm-Message-State: APjAAAUEVolqFp+Cqp4I0Cx9mKgXy4BRxtWmIK+sCtUjS7kDoQczayLh
 0y0Xhq6zQRW+96uYTI7xNeQ2erP5UH1TFBG8IBM=
X-Google-Smtp-Source: APXvYqyEYQ3MDWckUx7xMxV4vAgWCFUTxdu/OBl8PZlVVNfOq+IDthemb8Lkhb3bespAR/hO1pGNxfGZ4U16NcUBy8U=
X-Received: by 2002:a5d:6b11:: with SMTP id v17mr6707303wrw.323.1565894061188; 
 Thu, 15 Aug 2019 11:34:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190814213118.28473-1-kherbst@redhat.com>
 <20190814213118.28473-2-kherbst@redhat.com>
 <CAPM=9ty7yEUqKrcixV1tTuWCpyh6UikA3rxX8BF1E3fDb6WLQQ@mail.gmail.com>
 <5e05532328324d01bc554c573f6298f8@AUSX13MPC101.AMER.DELL.COM>
 <CACO55tsDA1WpMGtAPqUJpWt0AmPDnv9LuC09g2KB5GXB-VSCew@mail.gmail.com>
 <3fc22fe8bcaf4304bb07534b61c4de90@AUSX13MPC101.AMER.DELL.COM>
 <CACO55tvDfxYMZr0BGv2ROSNEVB4GvXZnBnWBy=RDPOG5hnk7OA@mail.gmail.com>
 <CADnq5_Nv6tsW0J20td5rQSLq048HtTcw1b4c25jP6ZR6XWZ-eA@mail.gmail.com>
 <s5ho90qa34m.wl-tiwai@suse.de>
 <8724585e50004bc8b6f310587555f4a1@AUSX13MPC101.AMER.DELL.COM>
In-Reply-To: <8724585e50004bc8b6f310587555f4a1@AUSX13MPC101.AMER.DELL.COM>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 15 Aug 2019 14:34:08 -0400
Message-ID: <CADnq5_NKyK7=C+j+yvxME4u1eN3XEB7n2QnVPEn2QqvwAhquDA@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 1/7] Revert "ACPI / OSI: Add OEM _OSI string to
 enable dGPU direct output"
To: Mario.Limonciello@dell.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=rlVguU9XpgwsYUA+9hxlWvJwepLXZJiyhWUMhPLxtJU=;
 b=nFJj2RJysrbujouemgWcvH+rthi9Gn3IReFReTGfCZ7pkcyb8fVOcEZaV3NpXxBRfo
 3IvIKtwf26fF96Gr0SANwOcGwnKLF7CiOUiYs3kVIQ/2K8iGwHXLlJD1NPqz9mlzPHpi
 U+t5c2qQsGDELMj0ARpQlNcAAjNTmKFY6BwzGiToVX5+Q2Yh8UpCUQT5ejpcpZg2+bci
 SRCfOJSvCUTE1iijQRQ8dxFBIb1asehXC5g+ii3NZm77FxjHQp5wAWPmRPV++RUgHc7G
 mF0WyAtDnAlST0LrJPbec4Jp7Q0PTm4gGUZe0iCGzWkfisDZ0HhfHQ32rV6snu+aFqGh
 qPbw==
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau <nouveau@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux ACPI <linux-acpi@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMTI6MTkgUE0gPE1hcmlvLkxpbW9uY2llbGxvQGRlbGwu
Y29tPiB3cm90ZToKPgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IFRh
a2FzaGkgSXdhaSA8dGl3YWlAc3VzZS5kZT4KPiA+IFNlbnQ6IFRodXJzZGF5LCBBdWd1c3QgMTUs
IDIwMTkgOTo1NyBBTQo+ID4gVG86IEFsZXggRGV1Y2hlcgo+ID4gQ2M6IEthcm9sIEhlcmJzdDsg
TGltb25jaWVsbG8sIE1hcmlvOyBub3V2ZWF1OyBSYWZhZWwgSiAuIFd5c29ja2k7IExLTUw7IGRy
aS1kZXZlbDsKPiA+IExpbnV4IEFDUEkgTWFpbGluZyBMaXN0OyBBbGV4IEh1bmc7IEJlbiBTa2Vn
Z3M7IERhdmlkIEFpcmxpZQo+ID4gU3ViamVjdDogUmU6IFtOb3V2ZWF1XSBbUEFUQ0ggMS83XSBS
ZXZlcnQgIkFDUEkgLyBPU0k6IEFkZCBPRU0gX09TSSBzdHJpbmcgdG8KPiA+IGVuYWJsZSBkR1BV
IGRpcmVjdCBvdXRwdXQiCj4gPgo+ID4KPiA+IFtFWFRFUk5BTCBFTUFJTF0KPiA+Cj4gPiBPbiBU
aHUsIDE1IEF1ZyAyMDE5IDE2OjM3OjA1ICswMjAwLAo+ID4gQWxleCBEZXVjaGVyIHdyb3RlOgo+
ID4gPgo+ID4gPiBPbiBUaHUsIEF1ZyAxNSwgMjAxOSBhdCAxMDoyNSBBTSBLYXJvbCBIZXJic3Qg
PGtoZXJic3RAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBUaHUsIEF1ZyAx
NSwgMjAxOSBhdCA0OjIwIFBNIDxNYXJpby5MaW1vbmNpZWxsb0BkZWxsLmNvbT4gd3JvdGU6Cj4g
PiA+ID4gPgo+ID4gPiA+ID4gPiA+IFRoZXJlIGFyZSBkZWZpbml0ZWx5IGdvaW5nIHRvIGJlIHJl
Z3Jlc3Npb25zIG9uIG1hY2hpbmVzIGluIHRoZSBmaWVsZAo+ID4gd2l0aCB0aGUKPiA+ID4gPiA+
ID4gPiBpbiB0cmVlIGRyaXZlcnMgYnkgcmV2ZXJ0aW5nIHRoaXMuICBJIHRoaW5rIHdlIHNob3Vs
ZCBoYXZlIGFuIGFuc3dlciBmb3IgYWxsCj4gPiBvZgo+ID4gPiA+ID4gPiB0aG9zZQo+ID4gPiA+
ID4gPiA+IGJlZm9yZSB0aGlzIHJldmVydCBpcyBhY2NlcHRlZC4KPiA+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPiA+IFJlZ2FyZGluZyBzeXN0ZW1zIHdpdGggSW50ZWwrTlZJRElBLCB3ZSdsbCBoYXZl
IHRvIHdvcmsgd2l0aCBwYXJ0bmVycwo+ID4gdG8KPiA+ID4gPiA+ID4gY29sbGVjdAo+ID4gPiA+
ID4gPiA+IHNvbWUgaW5mb3JtYXRpb24gb24gdGhlIGltcGFjdCBvZiByZXZlcnRpbmcgdGhpcy4K
PiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IFdoZW4gdGhpcyBpcyB1c2VkIG9uIGEgc3lzdGVt
IHdpdGggSW50ZWwrQU1EIHRoZSBBU0wgY29uZmlndXJlcyBBTUQKPiA+IEdQVSB0bwo+ID4gPiA+
ID4gPiB1c2UKPiA+ID4gPiA+ID4gPiAiSHlicmlkIEdyYXBoaWNzIiB3aGVuIG9uIFdpbmRvd3Mg
YW5kICJQb3dlciBFeHByZXNzIiBhbmQKPiA+ICJTd2l0Y2hhYmxlCj4gPiA+ID4gPiA+IEdyYXBo
aWNzIgo+ID4gPiA+ID4gPiA+IHdoZW4gb24gTGludXguCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
IGFuZCB3aGF0J3MgZXhhY3RseSB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRob3NlPyBBbmQgd2hh
dCdzIHRoZSBhY3R1YWwKPiA+ID4gPiA+ID4gaXNzdWUgaGVyZT8KPiA+ID4gPiA+Cj4gPiA+ID4g
PiBEUC9IRE1JIGlzIG5vdCBkZXRlY3RlZCB1bmxlc3MgcGx1Z2dlZCBpbiBhdCBib290dXAuICBJ
dCdzIGR1ZSB0byBtaXNzaW5nCj4gPiBIUEQKPiA+ID4gPiA+IGV2ZW50cy4KPiA+ID4gPiA+Cj4g
PiA+ID4KPiA+ID4gPiBhZmFpayBMeXVkZSB3YXMgd29ya2luZyBvbiBmaXhpbmcgYWxsIHRoYXQs
IGF0IGxlYXN0IGZvciBzb21lIGRyaXZlcnMuCj4gPiA+ID4gSWYgdGhlcmUgaXMgc29tZXRoaW5n
IHdyb25nLCB3ZSBzdGlsbCBzaG91bGQgZml4IHRoZSBkcml2ZXJzLCBub3QKPiA+ID4gPiBhZGRp
bmcgQUNQSSB3b3JrYXJvdW5kcy4KPiA+ID4gPgo+ID4gPiA+IEFsZXg6IGRvIHlvdSBrbm93IGlm
IHRoZXJlIGFyZSByZW1haW5pbmcgaXNzdWVzIHJlZ2FyZGluZyB0aGF0IHdpdGggYW1kZ3B1Pwo+
ID4gPgo+ID4gPiBUaGVyZSB3YXMgYW4gaXNzdWUgd2l0aCBocGQgZXZlbnRzIG5vdCBtYWtpbmcg
aXQgdG8gdGhlIGF1ZGlvIHNpZGUKPiA+ID4gd2hlbiB0aGluZ3Mgd2VyZSBwb3dlcmVkIGRvd24g
dGhhdCB3YXMgZml4ZWQgd2l0aCB0aGlzIHBhdGNoIHNldDoKPiA+ID4gaHR0cHM6Ly9wYXRjaHdv
cmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzMxNjc5My8KPiA+ID4gVGhvc2UgcGF0Y2hlcyBkZXBl
bmRlZCBvbiBhIGJ1bmNoIG9mIGFsc2EgY2hhbmdlcyBhcyB3ZWxsIHdoaWNoIG1heQo+ID4gPiBo
YXZlIG5vdCBiZWVuIGF2YWlsYWJsZSBpbiB0aGUgZGlzdHJvIHVzZWQgZm9yIGEgcGFydGljdWxh
ciBPRU0KPiA+ID4gcHJvZ3JhbS4KPiA+Cj4gPiBGWUksIHRoZSBjb3JyZXNwb25kaW5nIGNvbW1p
dCBmb3IgQUxTQSBwYXJ0IGlzIGRlc3RpbmVkIGZvciA1LjQKPiA+IGtlcm5lbDoKPiA+Cj4gPiBo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90aXdhaS9zb3Vu
ZC5naXQvY29tbWl0Lz9pZD1hZGUKPiA+IDQ5ZGIzMzdhOWQ0NGFjNTgzNWNmY2UxZWU4NzM1NDkw
MTFiMjcKPiA+Cj4gPiBCVFcsIE5vdXZlYXUgc2hvdWxkIHN1ZmZlciBmcm9tIHRoZSBzYW1lIHBy
b2JsZW0uICBUaGUgcGF0Y2ggdG8gYWRkCj4gPiB0aGUgYXVkaW8gY29tcG9uZW50IHN1cHBvcnQg
aXMgZm91bmQgYXQ6Cj4gPiAgIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRj
aC8zMTkxMzEvCj4gPgo+ID4KPgo+IEl0IHNvdW5kcyBsaWtlIDUuM3JjWCB3b24ndCBiZSBhIHVz
ZWZ1bCBjaGVjayB0aGVuLgo+Cj4gU28gYW0gSSBjb3JyZWN0IHRvIHVuZGVyc3RhbmQgdGhhdCBl
dmVyeXRoaW5nIHJlbGF0ZWQgdG8gdGhlIEFNRCBmYWlsdXJlcwo+IGRlc2NyaWJlZCBpbiB0aGlz
IHRocmVhZCBzaG91bGQgYmUgaW4gbGludXgtbmV4dCBhdCB0aGlzIHBvaW50Pwo+CgpBc3N1bWlu
ZyB5b3UgbWVhbiB0aGUgbWlzc2luZyBhdWRpbyBob3RwbHVnIGV2ZW50cywgdGhlbiB5ZXMuCgpB
bGV4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
