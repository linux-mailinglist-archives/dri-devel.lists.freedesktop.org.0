Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3881CD249
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 09:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0BDC6E1EC;
	Mon, 11 May 2020 07:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 631476E091
 for <dri-devel@lists.freedesktop.org>; Sat,  9 May 2020 19:40:19 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id w6so4689978ilg.1
 for <dri-devel@lists.freedesktop.org>; Sat, 09 May 2020 12:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AXMoscz34BvUkaGZKiocNbIEMJzmsL0RLa7UcnIMMW4=;
 b=sJ5R/6GAv/OSD+RFQkoR+crmtLAGIGBMhUYkxWLC3X094RfqN/rAdQZ3SXLbLXesC+
 hLWwztbPLhmibeH/Ient9hDU9ViCs7dyFWhSSnr2svymor8w/AGx4K9nHF+NsKPfUBHe
 Z6ds0tZPNQLEzkT3++xNImcWsV0VFgMvIZ/7Ld7isrVgGNhvRJB/sMMZHnGdIjYepOzx
 MCgTlha2hbeE10wTpG5JPV6BL7N22WrlVcHZ0iaU+n2/6yRTewVzMS4BGv/vfRgZGsVi
 zaekxYHPsSoNWE71romXK4RDm/coYzVqdk/cftlXUfBITsbe2TW4z5vzbkMf5HHtw7mg
 EatQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AXMoscz34BvUkaGZKiocNbIEMJzmsL0RLa7UcnIMMW4=;
 b=j/nOZCQGlb7bsOOc/0DDLYmL7tV3wpMxPoyKW8bebiwmDZNyFqILLryuEKPVHxVq7y
 NUbSHpTpqoVRtS7g3Bs/MOEMtCacPrKWgZ5X7qrK+uAQvp1gq6Z2Yb7n6x9K12ZKxVBo
 ku1QZgR0mwaP7+qI+O8bugtwWGgkfPmAd8/kUtfz+eJsNMDQIe+VKqh9cLOLNN6xMDQQ
 QJbCM5SizacN7KdSGILWbT2fuJp5g8o6wtKMAPBCy+8TAC1KMcL4BpeXByysibDy+p7b
 mR+PYrmLXGgcm1EtRnvTXBAxGW2yYW12gZoOMptlX9G04FPtRm2Nq8x57el23dONiy8M
 gS6g==
X-Gm-Message-State: AGi0Puac9AFRZSw4ON3CrzQAiKcvEbOSUAaDA/bZNSgmOQiajFLuyKAW
 cnJlWejOiMUOPWshXLJt1XVaaqiTjABdxgLTc5Y=
X-Google-Smtp-Source: APiQypKbxxscjzAVwvky05YXR+g2C9sZUwC+lGC35pzbzr3atJmC7XfBZjINwvQ74R842jraRcBSUJy3wVhjilQ/x+0=
X-Received: by 2002:a92:d151:: with SMTP id t17mr8325323ilg.35.1589053218512; 
 Sat, 09 May 2020 12:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200411200632.4045-1-peron.clem@gmail.com>
 <20200411200632.4045-2-peron.clem@gmail.com>
 <c96f31a2-6ff4-31aa-aaac-2ce9eafb3bfe@arm.com>
 <CAJiuCcegkNGQ7j4jcT1rBpSLqG1c-nb8g0wq+Nbvt-dGj7am2Q@mail.gmail.com>
 <CAJiuCceU662o7QGJ=mmT3pzVWK7uJUN=6+NKQnZ=Cfj9c2nw7A@mail.gmail.com>
 <d6465e7e-8e05-8b7d-16bd-f40877969089@arm.com>
 <CAJiuCccv2XPLY6sjcgvvrG5a8ONYHa_xn9i-YUDKUDK5a0DY=A@mail.gmail.com>
 <CAJiuCcfa9ro1V4nBzfD48cCuHpEsLaNA5P0bb-tQ3hcWUCtpkA@mail.gmail.com>
 <000f26f4-3640-797f-c7f6-4b31a5e2669e@arm.com>
 <CAJiuCcfrMhu5Mi7YZTttw2k+hGui0GFAmOhPh_9fv4Te27M0+A@mail.gmail.com>
 <13285d84-5a5e-c695-2a8b-7ca50c976b90@arm.com>
 <CAJiuCcduOw1jZ60j+i8GnAda6HACUeCD-DyqoY1aYisSOcuiXQ@mail.gmail.com>
In-Reply-To: <CAJiuCcduOw1jZ60j+i8GnAda6HACUeCD-DyqoY1aYisSOcuiXQ@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sat, 9 May 2020 21:40:07 +0200
Message-ID: <CAJiuCcfeOZjaunQp3g+X8NQNQaKxO8QEHM6wjYpjgUWx376EJg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panfrost: add devfreq regulator support
To: Steven Price <steven.price@arm.com>
X-Mailman-Approved-At: Mon, 11 May 2020 07:17:28 +0000
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
Cc: Nishanth Menon <nm@ti.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCA5IE1heSAyMDIwIGF0IDE4OjI4LCBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1A
Z21haWwuY29tPiB3cm90ZToKPgo+IEhpIFN0ZXZlbiwKPgo+IE9uIFRodSwgNyBNYXkgMjAyMCBh
dCAxNjozMCwgU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4gd3JvdGU6Cj4gPgo+
ID4gT24gMDIvMDUvMjAyMCAyMzowNywgQ2zDqW1lbnQgUMOpcm9uIHdyb3RlOgo+ID4gPiBIaSBT
dGV2ZW4sCj4gPiA+Cj4gPiA+IE9uIFR1ZSwgMTQgQXByIDIwMjAgYXQgMTU6MTAsIFN0ZXZlbiBQ
cmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+IHdyb3RlOgo+ID4gPj4KPiA+ID4+IEhpIENsw6lt
ZW50LAo+ID4gPj4KPiA+ID4+IE9uIDEzLzA0LzIwMjAgMTg6MjgsIENsw6ltZW50IFDDqXJvbiB3
cm90ZToKPiA+ID4+PiBIaSBTdGV2ZW4sCj4gPiA+Pj4KPiA+ID4KPiA8c25pcD4KPiA+Cj4gPiBT
aW5jZSB5b3UndmUgZ290IGEgcmVwcm9kdWN0aW9uIC0gY2FuIHlvdSBnZXQgYSBiYWNrdHJhY2Ug
d2hlcmUgdGhlCj4gPiByZWd1bGF0b3IgaXMgZ2V0dGluZyBkaXNhYmxlZD8KPgo+IFJlZ3VsYXRv
ciBpcyBkaXNhYmxlZCBmcm9tIHJlZ3VsYXRvcl9sYXRlX2NsZWFudXAoKQo+Cj4gWyAgIDMzLjc1
NzY1MF0gdmRkLWdwdTogZGlzYWJsaW5nCj4gWyAgIDMzLjc2MDcxOF0gQ1BVOiAyIFBJRDogMzEg
Q29tbToga3dvcmtlci8yOjEgTm90IHRhaW50ZWQKPiA1LjcuMC1yYzItbmV4dC0yMDIwMDQyNCAj
OAo+IFsgICAzMy43NjgzNjJdIEhhcmR3YXJlIG5hbWU6IEJlZWxpbmsgR1MxIChEVCkKPiBbICAg
MzMuNzcyNTUzXSBXb3JrcXVldWU6IGV2ZW50cyByZWd1bGF0b3JfaW5pdF9jb21wbGV0ZV93b3Jr
X2Z1bmN0aW9uCj4gWyAgIDMzLjc3ODgxM10gQ2FsbCB0cmFjZToKPiBbICAgMzMuNzgxMjYxXSAg
ZHVtcF9iYWNrdHJhY2UrMHgwLzB4MWEwCj4gWyAgIDMzLjc4NDkyMl0gIHNob3dfc3RhY2srMHgx
OC8weDMwCj4gWyAgIDMzLjc4ODIzOF0gIGR1bXBfc3RhY2srMHhjMC8weDExNAo+IFsgICAzMy43
OTE2MzhdICByZWd1bGF0b3JfbGF0ZV9jbGVhbnVwKzB4MTY0LzB4MWYwCj4gWyAgIDMzLjc5NjE2
NV0gIGNsYXNzX2Zvcl9lYWNoX2RldmljZSsweDY0LzB4ZTAKPiBbICAgMzMuODAwNDMxXSAgcmVn
dWxhdG9yX2luaXRfY29tcGxldGVfd29ya19mdW5jdGlvbisweDRjLzB4NjAKPiBbICAgMzMuODA2
MDg0XSAgcHJvY2Vzc19vbmVfd29yaysweDE5Yy8weDMzMAo+IFsgICAzMy44MTAwOTBdICB3b3Jr
ZXJfdGhyZWFkKzB4NGMvMHg0MzAKPiBbICAgMzMuODEzNzQ4XSAga3RocmVhZCsweDEzOC8weDE2
MAo+IFsgICAzMy44MTY5NzNdICByZXRfZnJvbV9mb3JrKzB4MTAvMHgyNAo+Cj4gdGhlIHVzZV9j
b3VudCBpcyBhdCAwLi4uCj4KPiBJIGhhdmUgY2hlY2sgYW5kIHRoZSByZWd1bGF0b3JfZ2V0IGlz
IGNhbGxlZCBhbmQgcmVndWxhdG9yX3B1dCBpcwo+IG5ldmVyIGNhbGxlZCBmb3IgdmRkLWdwdS4K
PiBOb3Qgc3VyZSB3aGF0IGlzIGhhcHBlbmluZyBoZXJlLi4uCgpMb29rcyBsaWtlIHRoZSBPUFAg
ZnJhbWV3b3JrIG9ubHkgZ2V0IHRoZSByZWd1bGF0b3IgYnV0IG5ldmVyIGVuYWJsZSBpdC4uLgoK
SSB3aWxsIHNlbmQgYSBxdWVzdGlvbiB0byBPUFAgTWFpbnRhaW5lciBhYm91dCB0aGlzLgoKUmVn
YXJkcywKQ0xlbWVudAoKPgo+Cj4gPgo+ID4gPiAgIC0gVGhlIENvb2xpbmcgbWFwIGlzIG5vdCBw
cm9iZSBjb3JyZWN0bHkgOgo+ID4gPiBbICAgIDIuNTQ1NzU2XSBwYW5mcm9zdCAxODAwMDAwLmdw
dTogW2RybTpwYW5mcm9zdF9kZXZmcmVxX2luaXQKPiA+ID4gW3BhbmZyb3N0XV0gRmFpbGVkIHRv
IHJlZ2lzdGVyIGNvb2xpbmcgZGV2aWNlCj4gPiA+IEludHJvZHVjZSBpbiB0aGlzIGNvbW1pdCA6
Cj4gPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9jbGVtZW50cGVyb24vbGludXgvY29tbWl0LzAyNTJj
MzhmZDU1YWQ3ODM2NmFjNGIxNzE0ZTI4NWM4OGRiMzQ1NTcKPiA+ID4KPiA+ID4gRG8geW91IGhh
dmUgYW4gaGludCBhYm91dCB3aGF0IEknbSBtaXNzaW5nID8KPiA+Cj4gPiBTb3JyeSwgbXkga25v
d2xlZGdlIG9mIHRoZSBjb29saW5nIGZyYW1ld29yayBpcyB2ZXJ5IGxpbWl0ZWQuIFdoYXQKPiA+
IHlvdSd2ZSBnb3QgbG9va3MgcGxhdXNpYmxlLCBidXQgSSdtIGFmcmFpZCBJIGNhbid0IHJlYWxs
eSBoZWxwIGJleW9uZAo+ID4gdGhhdCEgQXMgYmVmb3JlIC0gY2FuIHlvdSB0cnkgYWRkaW5nIHNv
bWUgcHJpbnRrKClzIGluIGUuZy4KPiA+IG9mX2RldmZyZXFfY29vbGluZ19yZWdpc3Rlcl9wb3dl
cigpIGFuZCBmaW5kIG91dCB3aGVyZSBpdCBpcyBiYWlsaW5nIG91dD8KPgo+IER1bWIgaXNzdWUs
IEkgd2FzIG1pc3NpbmcgdGhlIENPTkZJR19ERVZGUkVRX1RIRVJNQUwgLV8tLCBJIHdpbGwgbWFr
ZQo+IGEgcGF0Y2ggdG8gZW5hYmxlIGl0IGluIGFybTY0IGRlZmNvbmZpZy4KPgo+IFJlZ2FyZHMs
Cj4gQ2xlbWVudAo+Cj4gPgo+ID4gU3RldmUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
