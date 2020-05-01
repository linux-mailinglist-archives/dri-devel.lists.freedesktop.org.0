Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E47BF1C2420
	for <lists+dri-devel@lfdr.de>; Sat,  2 May 2020 10:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8EEA6EEA5;
	Sat,  2 May 2020 08:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BBB76ED56
 for <dri-devel@lists.freedesktop.org>; Fri,  1 May 2020 21:30:01 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id w2so8265794edx.4
 for <dri-devel@lists.freedesktop.org>; Fri, 01 May 2020 14:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=k4vhp0VlA+4eKJJcpzlGuSTcol2cbO4w29cWTar5YXw=;
 b=rePtkf+jPvelgNBY44aw3nYMFa5z7pgcs5SldQ92lZp43pUqhAGeePfH2odr3ADJDA
 QcZ2cYJvsG8/zzDg8bG5QqCa5nIgYZUXusJKm70zAXfwDKs2VRWUnGzmiCKrgFLSp4md
 AxGc42MrTZwXh0z5npeuKdDg/q0hsILpewPYO3tmaGmP4e5ZTaTMubB/inuhUXp3f5Lv
 mGpNnEBsRoH8SFO5PuH61qp73o+idjmg7CjB9UnzjvHyMRcpu/uBjAQeWhU3OQmQEDx1
 3fjjnP3++pQIv+Bh+qPKNRhTiU2fnq4OoNZugrikgH7RDm4xhW75IKYDqC6XT3Kl1Q0q
 wojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=k4vhp0VlA+4eKJJcpzlGuSTcol2cbO4w29cWTar5YXw=;
 b=JKkv8d0AJbt/bwH+5j61cgpMlu1YxuoNLpzPhiiF+yk4tf4IHvyZBh0RZTa6Ih63vz
 Mbn5NL57++41UlgakVy3964Q4/9DINJYwxYuaT+ijwTh8ySYSfKg6ljNT5+19tjeOpZ2
 nzJG0TWDP9j7BCOFelSKe4FI95XNeGtzEllGfNryMZBZ4Gd85k8p/zcC+ainB5wORCT1
 thPUreeeDorlTUms69Ou7hu5amW8tTqiX0rSNNOM7j+o5X31AK0y1DSfqVGJWQ01ABRM
 9d8B4cNnq55wb24JZrxFjQ7mkuZ3vTnw2qPSZPqBI9O4o7OS5W14Icf+UVFgRXtLykGJ
 WNhA==
X-Gm-Message-State: AGi0PuaLAEYnrBI/swxMH1gnV5lWp8rLvw4k7oylb2enKn+gpX2rPoY8
 cHB3kMWtL9BvvxMUix9X9iNWOGmNMqryW9fQoX52K7HI7gM=
X-Google-Smtp-Source: APiQypJtLZZnIVsTjvuuhCzWaXfXP7wpnGa9G6PIdiNusehMFzCx8SssWzyKYi0NZLrZBEfGDbSYqPU6qlS+yngIqY4=
X-Received: by 2002:aa7:dcc3:: with SMTP id w3mr5012926edu.231.1588368599999; 
 Fri, 01 May 2020 14:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200501204825.146424-1-konradybcio@gmail.com>
 <20200501210038.GB26726@ravnborg.org>
In-Reply-To: <20200501210038.GB26726@ravnborg.org>
From: Konrad Dybcio <konradybcio@gmail.com>
Date: Fri, 1 May 2020 23:29:24 +0200
Message-ID: <CAMS8qEXLAoY9mA5iEA8hqhpejwvDQj1CC_E6QFh3+qgrEWb6cA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add support for TM5P5 NT35596 video mode panel
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Approved-At: Sat, 02 May 2020 08:34:27 +0000
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
Cc: devicetree@vger.kernel.org, skrzynka@konradybcio.pl,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VmVyeSBzdHJhbmdlLi4gSSBqdXN0IGZldGNoZWQgZHJtLW1pc2MtbmV4dCBhbmQgaGFkIG5vIGlz
c3VlcyBidWlsZGluZy4uLgoKVGhhbmtzIGZvciB5b3VyIGluaXRpYWwgdGhvdWdodHMhCgpwdC4s
IDEgbWFqIDIwMjAgbyAyMzowMCBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+IG5hcGlz
YcWCKGEpOgo+Cj4gSGkgS29ucmFkLgo+Cj4gT24gRnJpLCBNYXkgMDEsIDIwMjAgYXQgMTA6NDg6
MjFQTSArMDIwMCwgS29ucmFkIER5YmNpbyB3cm90ZToKPiA+IEkgYW0gYXdhcmUgb2YgdGhlIGZh
Y3QgdGhhdCB0aGlzIGlzIHByb2JhYmx5IG5vdCB0aGUgY29ycmVjdAo+ID4gbmFtaW5nIG9mIHRo
aXMgcGFuZWwsIHlldCBJIGFtIHVuYWJsZSB0byByZXRyaWV2ZSBhbnkgYWRkaXRpb25hbAo+ID4g
aW5mb3JtYXRpb24gYWJvdXQgaXQsIGFzIGl0IGlzIHVzZWQgaW4gYSBzbWFydHBob25lIHRvIHdo
aWNoIG5vCj4gPiBzY2hlbWF0aWNzIGFyZSByZWxlYXNlZC4KPiA+Cj4gPiBUaGUgZHJpdmVyIGhh
cyBiZWVuIGdlbmVyYXRlZCB3aXRoIHRoZSBoZWxwIG9mCj4gPiBsaW51eC1tZHNzLWRzaS1wYW5l
bC1kcml2ZXItZ2VuZXJhdG9yIFsxXSBhbmQgd29ya3MgcGVyZmVjdGx5Cj4gPiBvbiBhIEFzdXMg
WmVuZm9uZSAyIExhc2VyIFowMFQgc21hcnRwaG9uZSwgaW5jbHVkaW5nIGJyaWdobmVzcwo+ID4g
Y29udHJvbCBhbmQgc3dpdGNoaW5nIG9uL29mZi4KPiA+Cj4gPiBbMV0gaHR0cHM6Ly9naXRodWIu
Y29tL21zbTg5MTYtbWFpbmxpbmUvbGludXgtbWRzcy1kc2ktcGFuZWwtZHJpdmVyLWdlbmVyYXRv
cgo+Cj4gUGFubGUgZHJpdmVyIGxvb2tzIGdvb2QuCj4gV2lsbCB0YWtlIGEgY2xvc2VyIGxvb2sg
dG9tb3Jyb3cuCj4KPiBBbnkgY2hhbmNlIHlvdSBjYW4gd29yayBvbiB0aGUgVE9ETyBpbiB0aGUg
ZHJpdmVyIHNvIHdlIGNhbiBoYXZlIHRoYXQKPiByZXNvbHZlZCBiZWZvcmUgd2UgYXBwbHkgaXQ/
Cj4KPiBBbHNvIGZvciBhIHYyIGl0IHdvdWxkIGJlIHBlcmZlY3QgaWYgeW91IGNvdWxkIHdvcmsg
b24gdG9wIG9mCj4gZHJtLW1pc2MtbmV4dC4KPiBUaGVyZSBpcyBhdCBsZWFzdCBvbmUgc21hbGwg
Zml4IG5lZWRlZCB0byBidWlsZCB0aGF0IEkgc3BvdHRlZC4KPgo+IEJ1dCB3YWl0IHVudGlsIEkg
Z2V0IGJhY2sgb24gdGhlIGRyaXZlciBwYXRjaCBiZWZvcmUgc3VibWl0dGluZyBhIHYyLgo+Cj4g
ICAgICAgICBTYW0KPgo+ID4KPiA+IEtvbnJhZCBEeWJjaW8gKDIpOgo+ID4gICBkcml2ZXJzOiBk
cm06IHBhbmVsOiBBZGQgVE01UDUgTlQzNTU5NiBwYW5lbCBkcml2ZXIKPiA+ICAgZHQtYmluZGlu
Z3M6IGRpc3BsYXk6IERvY3VtZW50IFRNNVA1IE5UMzU1OTYgcGFuZWwgY29tcGF0aWJsZQo+ID4K
PiA+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9wYW5lbC90bTVwNSxudDM1NTk2LnR4dCAgfCAgIDcg
Kwo+ID4gIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9LY29uZmlnICAgICAgICAgICAgICAgICB8ICAg
OSArCj4gPiAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL01ha2VmaWxlICAgICAgICAgICAgICAgIHwg
ICAxICsKPiA+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtdG01cDUtbnQzNTU5Ni5jICAg
fCAzNjYgKysrKysrKysrKysrKysrKysrCj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCAzODMgaW5zZXJ0
aW9ucygrKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9wYW5lbC90bTVwNSxudDM1NTk2LnR4dAo+ID4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtdG01cDUtbnQzNTU5Ni5jCj4gPgo+
ID4gLS0KPiA+IDIuMjYuMQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
