Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A82D1ACD7D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 18:23:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C7C6E33F;
	Thu, 16 Apr 2020 16:23:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A6E6E33F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 16:23:06 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BACEB22265
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 16:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587054186;
 bh=dYe0L8knPjq4V+e3C0CynMr68uvk2h/61C1ujyYiF70=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=V7MEdxx39YfP2AZW0LEXomuLOzYhPDadjG1M1p7YwOqsORcQXVVHXqavfTvWDpr3Y
 V0GXNVV7w9U9mLckuLo1G5UOleiYYbm0f0waGgvIz8XD716xxxFe8xxthHC9utiK9J
 V7soWb53dKIFjDhjqfA3Y52gqMKkkEL6j8qy0tXg=
Received: by mail-ej1-f53.google.com with SMTP id re23so1712073ejb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 09:23:05 -0700 (PDT)
X-Gm-Message-State: AGi0PubICsoj6hR4/3ZQ5j/oN8xsxIW3HtG4Io4UH0qDrn7asm1S4JTL
 4yAsAy8Hfc21QG4ZAaADVCzu1zEZEw8MovWrGQ==
X-Google-Smtp-Source: APiQypJY17+s5/o0+wlz0famZC0WrI5UI7Klts8JPoOZRnB9zgY8QO2uzy/FBMWzeg9CvxriYGO6Q1j1IF4pKi5aPZw=
X-Received: by 2002:a17:906:2ad4:: with SMTP id
 m20mr10975923eje.324.1587054183934; 
 Thu, 16 Apr 2020 09:23:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200311165322.1594233-1-enric.balletbo@collabora.com>
 <20200311165322.1594233-5-enric.balletbo@collabora.com>
 <02290a21-7392-a2cf-576c-215091ec05e8@suse.com>
 <1585177534.26117.4.camel@mtksdaap41>
 <f3c2926a-ef92-b004-9786-5be1645af497@suse.com>
 <1585234277.12089.3.camel@mtksdaap41>
 <73ef0b8e-2802-a047-2a56-936b63d264cb@suse.com>
In-Reply-To: <73ef0b8e-2802-a047-2a56-936b63d264cb@suse.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 17 Apr 2020 00:22:52 +0800
X-Gmail-Original-Message-ID: <CAAOTY__EV8PHau9CzSiA8up1QAmZxfK2QnaTid0WrNOsn2Xcag@mail.gmail.com>
Message-ID: <CAAOTY__EV8PHau9CzSiA8up1QAmZxfK2QnaTid0WrNOsn2Xcag@mail.gmail.com>
Subject: Re: [PATCH v12 4/5] soc / drm: mediatek: Move routing control to
 mmsys device
To: Matthias Brugger <mbrugger@suse.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Richard Fontana <rfontana@redhat.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 ulrich.hecht+renesas@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 linux-clk@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>, wens@csie.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 mtk01761 <wendell.lin@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Frank Wunderlich <frank-w@public-files.de>,
 Seiya Wang <seiya.wang@mediatek.com>, sean.wang@mediatek.com,
 Houlong Wei <houlong.wei@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Allison Randal <allison@lohutok.net>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rdunlap@infradead.org,
 linux-kernel <linux-kernel@vger.kernel.org>, matthias.bgg@kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIE1hdHRoaWFzOgoKTWF0dGhpYXMgQnJ1Z2dlciA8bWJydWdnZXJAc3VzZS5jb20+IOaWvCAy
MDIw5bm0M+aciDI25pelIOmAseWbmyDkuIvljYgxMTo0NeWvq+mBk++8mgo+Cj4KPgo+IE9uIDI2
LzAzLzIwMjAgMTU6NTEsIENLIEh1IHdyb3RlOgo+ID4gSGksIE1hdHRoaWFzOgo+ID4KPiA+IE9u
IFRodSwgMjAyMC0wMy0yNiBhdCAxMjo1NCArMDEwMCwgTWF0dGhpYXMgQnJ1Z2dlciB3cm90ZToK
PiA+PiBIaSBDSywKPiA+Pgo+ID4+IE9uIDI2LzAzLzIwMjAgMDA6MDUsIENLIEh1IHdyb3RlOgo+
ID4+PiBIaSwgTWF0dGhpYXM6Cj4gPj4+Cj4gPj4+IE9uIFdlZCwgMjAyMC0wMy0yNSBhdCAxNzox
NiArMDEwMCwgTWF0dGhpYXMgQnJ1Z2dlciB3cm90ZToKPiA+Pj4+Cj4gPj4+PiBPbiAxMS8wMy8y
MDIwIDE3OjUzLCBFbnJpYyBCYWxsZXRibyBpIFNlcnJhIHdyb3RlOgo+ID4+Pj4+IFByb3ZpZGUg
YSBtdGtfbW1zeXNfZGRwX2Nvbm5lY3QoKSBhbmQgbXRrX21tc3lzX2Rpc2Nvbm5lY3QoKSBmdW5j
dGlvbnMgdG8KPiA+Pj4+PiByZXBsYWNlIG10a19kZHBfYWRkX2NvbXBfdG9fcGF0aCgpIGFuZCBt
dGtfZGRwX3JlbW92ZV9jb21wX2Zyb21fcGF0aCgpLgo+ID4+Pj4+IFRob3NlIGZ1bmN0aW9ucyB3
aWxsIGFsbG93IERSTSBkcml2ZXIgYW5kIG90aGVycyB0byBjb250cm9sIHRoZSBkYXRhCj4gPj4+
Pj4gcGF0aCByb3V0aW5nLgo+ID4+Pj4+Cj4gPj4+Pj4gU2lnbmVkLW9mZi1ieTogRW5yaWMgQmFs
bGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFib3JhLmNvbT4KPiA+Pj4+PiBSZXZp
ZXdlZC1ieTogTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4KPiA+Pj4+
PiBSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KPiA+Pj4+PiBBY2tlZC1i
eTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KPiA+Pj4+Cj4gPj4+PiBUaGlzIHBhdGNoIGRv
ZXMgbm90IGFwcGx5IGFnYWluc3QgdjUuNi1yYzEuCj4gPj4+PiBQbGVhc2UgcmViYXNlIGFzIHRo
aXMgaXMgYSBxdWl0ZSBiaWcgcGF0Y2ggYW5kIGl0IHdvbid0IGJlIGVhc3kgdG8gZG8gdGhhdCBi
eSBoYW5kLgo+ID4+Pgo+ID4+PiBJIHRoaW5rIHRoaXMgcGF0Y2ggZGVwZW5kcyBvbiBbMV0gd2hp
Y2ggaGFzIGJlZW4gYWNrZWQgYnkgbWUgYW5kIEkgaGF2ZQo+ID4+PiBub3QgcGlja2VkIGl0LiBU
aGUgc2ltcGxlIHdheSBpcyB0aGF0IHlvdSBwaWNrIFsxXSBmaXJzdCBhbmQgdGhlbiBwaWNrCj4g
Pj4+IHRoaXMgc2VyaWVzLgo+ID4+Pgo+ID4+PiBbMV0KPiA+Pj4gaHR0cHM6Ly9wYXRjaHdvcmsu
a2VybmVsLm9yZy9wYXRjaC8xMTQwNjIyNy8KPiA+Pj4KPiA+Pgo+ID4+IFlvdSB3b3VsZCBuZWVk
IHRvIHByb3ZpZGUgYSBzdGFibGUgdGFnIGZvciBtZSB0aGF0IEkgY2FuIG1lcmdlIGludG8gbXkg
dHJlZS4gWW91Cj4gPj4gY2FuIGFsc28gdHJ5IHRvIG1lcmdlIG15IGZvci1uZXh0IFsxXSB3aGlj
aCBoYXMgdGhlIG5ld2VzdCB2ZXJzaW9uIGZyb20gRW5yaWMuCj4gPj4gSWYgeW91IHNlZSBhbnkg
bWVyZ2UgY29uZmxpY3QsIHRoZW4gd2UgaGF2ZSB0byBkbyBzb21ldGhpbmcgYWJvdXQgaXQgOikK
PiA+Pgo+ID4+IFJlZ2FyZHMsCj4gPj4gTWF0dGhpYXMKPiA+Pgo+ID4+IFsxXQo+ID4+IGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L21hdHRoaWFzLmJnZy9s
aW51eC5naXQvbG9nLz9oPWZvci1uZXh0Cj4gPj4KPiA+Cj4gPiBZb3UgaGF2ZSBhcHBsaWVkIHRo
aXMgc2VyaWVzLCBzbyBJIHdvdWxkIG5vdCBhcHBseSBvdGhlciBwYXRjaGVzIHdoaWNoCj4gPiB3
b3VsZCBjb25mbGljdCB3aXRoIHRoaXMgc2VyaWVzLiBBZnRlciB0aGlzIHNlcmllcyBsYW5kIG9u
IG1haW4gc3RyZWFtCj4gPiAod2lzaCBpdCBoYXBwZW4gaW4gdGhpcyBtZXJnZSB3aW5kb3cpLCBJ
IHdvdWxkIHJlYmFzZSBvdGhlciBwYXRjaCBvbgo+ID4gbWFpbiBzdHJlYW0uCj4gPgo+Cj4gSSBo
YXZlbid0ICh5ZXQpIHNlbmQgdGhlIHB1bGwgcmVxdWVzdC4gSWYgeW91IHdhbnQgdG8gYnJpbmcg
aW4geW91ciBwYXRjaGVzIGluCj4gdjUuNyBhcyB3ZWxsIHdlIGNhbiBmaW5kIGEgc29sdXRpb24g
dG8gdGhhdC4gU2hhbGwgSSBwcm92aWRlIHlvdSB3aXRoIGEgc3RhYmxlCj4gYnJhbmNoIHdoaWNo
IHlvdSBjYW4gbWVyZ2U/IFRoaXMgd2F5IHlvdSBjYW4gYWRkIGFsbCB5b3VyIHBhdGNoZXMgaW4g
dGhlIHB1bGwKPiByZXF1ZXN0IGFzIHdlbGwgYW5kIHdlIGRvbid0IGhhdmUgdG8gd2FpdCBmb3Ig
djUuOCB0byBnZXQgdGhpbmdzIGludG8gbWFpbmxpbmUuCj4KPiBMZXQgbWUga25vdyBhbmQgSSds
bCBwcm92aWRlIHlvdSB3aXRoIGEgc3RhYmxlIGJyYW5jaC4KClRoaXMgc2VyaWVzIGlzIGluIGxp
bnV4LW5leHQgYnV0IGRvZXMgbm90IGluIG1haW4gc3RyZWFtLiBTbyB3b3VsZCB5b3UKcGxlYXNl
IHByb3ZpZGUgYSBzdGFibGUgYnJhbmNoIHNvIEkgY291bGQgcHVsbCB0aGlzIHNlcmllcz8KClJl
Z2FyZHMsCkNodW4tS3VhbmcuCgo+Cj4gUmVnYXJkcywKPiBNYXR0aGlhcwo+Cj4gPiBSZWdhcmRz
LAo+ID4gQ0sKPiA+Cj4gPj4+IFJlZ2FyZHMsCj4gPj4+IENLCj4gPj4+Cj4gPj4+Pgo+ID4+Pj4g
UmVnYXJkcywKPiA+Pj4+IE1hdHRoaWFzCj4gPj4+Pgo+ID4+Pj4+IC0tLQo+ID4+Pj4+Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
