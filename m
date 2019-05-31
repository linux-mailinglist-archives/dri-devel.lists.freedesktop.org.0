Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 882F6315C1
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2019 21:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF6E2898FA;
	Fri, 31 May 2019 19:58:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-it1-x142.google.com (mail-it1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12DAC89385
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 12:13:14 +0000 (UTC)
Received: by mail-it1-x142.google.com with SMTP id h11so14827876itf.5
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 05:13:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=atIK3Z4pOl58AUWDjMScnZMywy+rlJAUd7dwx6jXLYM=;
 b=nVMZ+1pPiyxeGi+X4v60vdMFozHXzn5PSUH+YhtKnqQhcLC+9VU96OdDpi+MrDaV1x
 Fm99i9R3XGh/JH+bEhjOS3HnLK5pxJ/pXv0R8/AuQHxjGaJUlY+n0cgtvKtnzrt7+zoq
 T+oc6JIjHQRs/1Jn9wWuQ7R9YeBy0eAfrHwebe/baZ5+cBl2KLmFLsOVSbdychjbW6/S
 syzQdgshQlEYoh0RO9jbf6FnArL2C5HVwB2uhkfVYUJvv5O0R3YMDMV9H18tXfv+yWHv
 CyqIN6xSsxs6nV90+fx7hBZ6rM1VMIAKnycOZZflt2inn7GqfJFkXZuh77pvqdj17ajj
 5Z5g==
X-Gm-Message-State: APjAAAUWLixOlppJy5P8ca3vzMkFZ7ka1OXhL1HaPt12FDj5/wqbe8rn
 JnVOjDeLnA2suo6P8VNNmtntCTAqk9DEZx9ZUCs=
X-Google-Smtp-Source: APXvYqz3dZ1ERvd9Fqykdr5sI5iUqO7/DPRb8FpoL6306O+rT/e6QvjuUYL4RuJjfXLC0sNYcoFFAcEz969Hm0wJxcA=
X-Received: by 2002:a24:9ac7:: with SMTP id l190mr5943232ite.100.1559304793222; 
 Fri, 31 May 2019 05:13:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190510194229.20628-1-aford173@gmail.com>
 <af325707-3e42-493d-e858-77878ef06138@ti.com>
 <CAHCN7xLzoCNW6q5yDCsqMHeNvdNegkGhd0N+q9+Gd8JUGbG=_g@mail.gmail.com>
 <7ada0752-6f65-2906-cb29-a47c9490fd57@ti.com>
In-Reply-To: <7ada0752-6f65-2906-cb29-a47c9490fd57@ti.com>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 31 May 2019 07:13:01 -0500
Message-ID: <CAHCN7xLNCuqDyvOvtQef+CnRCMit2U2XTDP+=XKkjfmrnVv4kg@mail.gmail.com>
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
X-Mailman-Approved-At: Fri, 31 May 2019 19:58:01 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=atIK3Z4pOl58AUWDjMScnZMywy+rlJAUd7dwx6jXLYM=;
 b=JfNlnKh14mQcZkvyBftIv2uN55Gi1+AGQx8AQbO7XTXI65apQbd43bz6KZLpAd2Qob
 euiTzNdju+Y3idHhtfaJs4vqKwttbD3BEvRCqDp0gLHQIwRd9Eg/urVpmxQK4RRvxSt+
 KdXndu9KABgQN5UFXx2Xuhg+eZzPPRxGkWMOJ2LKPCLfHBNsmbIdexrIdS+KWeGBuIvK
 rDXO4Hq8+qxZJ5AxOOJg3jgHJMIdQg+HKkoDDbM+5thrSrO6JbGHuWzZHsZ1QYsyPKWm
 2IGeqmVZKc/nLYACzJSBsZ21IEEWlqA4vPuvfg/yGfcp+1d6efBUaed+a2H3WPp5SpBy
 gsEQ==
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Tony Lindgren <tony@atomide.com>,
 Rob Herring <robh+dt@kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>,
 Adam Ford <adam.ford@logicpd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgMTA6NTMgQU0gVG9taSBWYWxrZWluZW4gPHRvbWkudmFs
a2VpbmVuQHRpLmNvbT4gd3JvdGU6Cj4KPiBIaSwKPgo+IE9uIDI4LzA1LzIwMTkgMTg6MDksIEFk
YW0gRm9yZCB3cm90ZToKPiA+IE9uIFR1ZSwgTWF5IDI4LCAyMDE5IGF0IDQ6MTEgQU0gVG9taSBW
YWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4gd3JvdGU6Cj4gPj4KPiA+PiBIaSwKPiA+
Pgo+ID4+IE9uIDEwLzA1LzIwMTkgMjI6NDIsIEFkYW0gRm9yZCB3cm90ZToKPiA+Pj4gQ3VycmVu
dGx5IHRoZSBzb3VyY2UgY29kZSBpcyBjb21waWxlZCB1c2luZyBoYXJkLWNvZGVkIHZhbHVlcwo+
ID4+PiBmcm9tIENPTkZJR19PTUFQMl9EU1NfTUlOX0ZDS19QRVJfUENLLiAgVGhpcyBwYXRjaCBh
bGxvd3MgdGhpcwo+ID4+PiBjbG9jayBkaXZpZGVyIHZhbHVlIHRvIGJlIG1vdmVkIHRvIHRoZSBk
ZXZpY2UgdHJlZSBhbmQgYmUgY2hhbmdlZAo+ID4+PiB3aXRob3V0IGhhdmluZyB0byByZWNvbXBp
bGUgdGhlIGtlcm5lbC4KPiA+Pj4KPiA+Pj4gU2lnbmVkLW9mZi1ieTogQWRhbSBGb3JkIDxhZm9y
ZDE3M0BnbWFpbC5jb20+Cj4gPj4KPiA+PiBJIHVuZGVyc3RhbmQgd2h5IHlvdSB3YW50IHRvIGRv
IHRoaXMsIGJ1dCBJJ20gbm90IHN1cmUgaXQncyBhIGdvb2QgaWRlYS4KPiA+PiBJdCdzIHJlYWxs
eSBzb21ldGhpbmcgdGhlIGRyaXZlciBzaG91bGQgZmlndXJlIG91dCwgYW5kIGlmIHdlIGFkZCBp
dCB0bwo+ID4+IHRoZSBEVCwgaXQgZWZmZWN0aXZlbHkgYmVjb21lcyBhbiBBQkkuCj4gPj4KPiA+
PiBUaGF0IHNhaWQuLi4gSSdtIG5vdCBzdXJlIGhvdyBnb29kIG9mIGEgam9iIHRoZSBkcml2ZXIg
Y291bGQgZXZlciBkbywgYXMKPiA+PiBpdCBjYW4ndCBrbm93IHRoZSBmdXR1cmUgc2NhbGluZyBu
ZWVkcyBvZiB0aGUgdXNlcnNwYWNlIGF0IHRoZSB0aW1lIGl0Cj4gPj4gaXMgY29uZmlndXJpbmcg
dGhlIGNsb2NrLiBBbmQgc28sIEknbSBub3QgbmFja2luZyB0aGlzIHBhdGNoLCBidXQgSQo+ID4+
IGRvbid0IGZlZWwgdmVyeSBnb29kIGFib3V0IHRoaXMgcGF0Y2guLi4KPiA+Pgo+ID4+IFRoZSBz
ZXR0aW5nIGFsc28gYWZmZWN0cyBhbGwgb3V0cHV0cyAoZXhsdWRpbmcgdmVuYyksIHdoaWNoIG1h
eSBub3QgYmUKPiA+PiB3aGF0IHRoZSB1c2VyIHdhbnRzLiBUaGVuIGFnYWluLCBJIHRoaW5rIHRo
aXMgc2V0dGluZyBpcyByZWFsbHkgb25seQo+ID4+IG5lZWRlZCBvbiBPTUFQMiAmIDMsIHdoaWNo
IGhhdmUgb25seSBhIHNpbmdsZSBvdXRwdXQuIEJ1dCB0aGF0J3MgdGhlCj4gPj4gc2FtZSB3aXRo
IHRoZSBjdXJyZW50IGtjb25maWcgb3B0aW9uLCBvZiBjb3Vyc2UuCj4gPj4KPiA+PiBTbywgdGhl
IGN1cnJlbnQgQ09ORklHX09NQVAyX0RTU19NSU5fRkNLX1BFUl9QQ0sgaXMgYW4gdWdseSBoYWNr
LCBpbiBteQo+ID4+IG9waW5pb24sIGFuZCBtb3ZpbmcgaXQgdG8gRFQgbWFrZXMgaXQgYSB3b3Jz
ZSBoYWNrID0pLiBCdXQgSSBkb24ndCBoYXZlCj4gPj4gYW55IGdvb2Qgc3VnZ2VzdGlvbnMgZWl0
aGVyLgo+ID4KPiA+IEFzIGl0IHN0YW5kcyB0aGUgTG9naWMgUEQgT01BUDM1IGFuZCBBTTM3L0RN
MzcgYm9hcmRzIChTT00tTFYgYW5kCj4gPiBUb3JwZWRvKSByZXF1aXJlIHRoaXMgdG8gYmUgaGFy
ZCBjb2RlZCB0byA0IG9yIGl0IGhhbmdzIGR1cmluZyBzdGFydC4KPiA+IFRoaXMgaXMgdGhlIGNh
c2UgZm9yIGFsbCB2ZXJzaW9ucyA0LjIrLiAgSSBoYXZlbid0IHRlc3RlZCBpdCB3aXRoCj4gPiBv
bGRlciBzdHVmZi4gIFRvbnkgaGFzIGEgRE0zNzMwIFRvcnBlZG8ga2l0IGFuZCByZXBvcnRlZCB0
aGUgaGFuZ2luZwo+ID4gaXNzdWUgdG8gbWUuIEkgdG9sZCBoaW0gdG8gc2V0IHRoYXQgdmFsdWUg
dG8gNCB0byBtYWtlIGl0IG5vdCBoYW5nLgo+ID4gSGUgYXNrZWQgdGhhdCBJIG1vdmUgaXQgdG8g
dGhlIERUIHRvIGF2b2lkIGN1c3RvbSBrZXJuZWxzLiAgSSBhZ3JlZQo+ID4gaXQncyBhIGhhY2ss
IGJ1dCBpZiBpdCdzIGNyZWF0ZSBhIGN1c3RvbWl6ZWQgZGVmY29uZmlnIGZpbGUgZm9yIDQKPiA+
IGJvYXJkcyBvciBtb2RpZnkgdGhlIGRldmljZSB0cmVlLCBpdCBzZWVtcyBsaWtlIHRoZSBkZXZp
Y2UgdHJlZQo+ID4gYXBwcm9hY2ggaXMgbGVzcyBpbnRydXNpdmUuCj4KPiBPaywgd2VsbCwgSSB0
aGluayB0aGF0J3MgYSBzZXBhcmF0ZSB0aGluZyBmcm9tIGl0cyBpbnRlbmRlZCB1c2UuIFRoZQo+
IHBvaW50IG9mIHRoZSBrY29uZmlnIG9wdGlvbiBpcyB0byBlbnN1cmUgdGhhdCB0aGUgZmNsay9w
Y2xrIHJhdGlvIHN0YXlzCj4gdW5kZXIgYSBjZXJ0YWluIG51bWJlciB0byBhbGxvdyBlbm91Z2gg
c2NhbGluZyByYW5nZS4gSXQgc2hvdWxkIG5ldmVyCj4gYWZmZWN0IGEgYmFzaWMgbm9uLXNjYWxp
bmcgdXNlIGNhc2UsIHVubGVzcyB5b3Ugc2V0IGl0IHRvIGEgdG9vIGhpZ2gKPiB2YWx1ZSwgd2hp
Y2ggcHJldmVudHMgZmluZGluZyBhbnkgcGNsay4KPgo+IEhhcyBhbnlvbmUgZGVidWdnZWQgd2h5
IHRoZSBoYW5nIGlzIGhhcHBlbmluZz8KCkkgdHJpZWQgZGVidWdnaW5nIHRoaXMgeWVhcnMgYWdv
LCBhbmQgSSB3YXMgdG9sZCB0byB1c2UgdGhlCkNPTkZJR19PTUFQMl9EU1NfTUlOX0ZDS19QRVJf
UENLLgo+Cj4gSWYgd2UgY2FuJ3QgZml4IHRoZSBidWcgaXRzZWxmLCByYXRoZXIgdGhhbiBhZGRp
bmcgYSBEVCBvcHRpb24sIHdlIGNvdWxkCj4gY2hhbmdlIGFkZCBhIG1pbl9mY2tfcGVyX3BjayBm
aWVsZCAoYXMgeW91IGRvKSwga2VlcCB0aGUga2NvbmZpZyBvcHRpb24sCj4gYW5kIHNldCB0aGUg
bWluX2Zja19wZXJfcGNrIGJhc2VkIG9uIHRoZSBrY29uZmlnIG9wdGlvbiwgX29yXyBpbiBjYXNl
IG9mCj4gdGhvc2UgYWZmZWN0ZWQgU29Dcywgc2V0IHRoZSBtaW5fZmNrX3Blcl9wY2sgZXZlbiB3
aXRob3V0IHRoZSBrY29uZmlnCj4gb3B0aW9uLgoKSSBhbSBqdXN0IGN1cmlvdXMgaWYgYW55b25l
IGVsc2Ugc2VlcyB0aGlzLiAgSWYgbm9ib2R5IGlzIHVzaW5nIHRoaXMKaGFjaywgSSB3b25kZXIg
aG93IG11Y2ggb2YgdGhlIGltcGFjdCBpdCB3aWxsIGJlLiAgSSdtIHRyeWluZyB0cnlpbmcKdG8g
Z2V0IG15IGJvYXJkIHRvIGJvb3Qgd2l0aG91dCBoYW5naW5nIHdpdGhvdXQgY3JlYXRpbmcgYSBj
dXN0b20KZGVmY29uZmlnLgoKYWRhbQo+Cj4gICBUb21pCj4KPiAtLQo+IFRleGFzIEluc3RydW1l
bnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgo+IFktdHVu
bnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtp
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
