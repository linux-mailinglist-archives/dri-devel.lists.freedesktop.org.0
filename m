Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 867A12DC20E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 15:21:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 149DE6E17E;
	Wed, 16 Dec 2020 14:21:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA518954A
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 14:21:43 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id a109so23023075otc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 06:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=32rCXC2EDS68fEcTr1TB/kDCfbesPlNgshRl0HihrAI=;
 b=kysWtIDghbbKp+dOXRSoIqq4RTce9HcRsFRJzO2zV4BH0gcoMKF9Pbv3IGQxKHwAra
 bEQfLu23OgLRNqOI7sqVh58UpxhEhIVzXQx96MEqvA8UGJPRVZYq0rUJluM8Zy8+GGkY
 fXSaOUVuB7d7rWwQdJOnyE3EmpqDLfVWhs9Hw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=32rCXC2EDS68fEcTr1TB/kDCfbesPlNgshRl0HihrAI=;
 b=P6iw5HZ3d0fU9YqXbr3UkR54dTMG8k6x4Y4oV0zFa85KbwW310VAewZrv0qkN8dBdJ
 osXfbCqqJsNJN2F5eCTGw77faxLFP6hq0BNa78bTu9AdjVPhKe3ukmqMru8QtmekmzxS
 sfer4RyCnnYrTIHiy9MiglRAWTW9h2s6cj9LGPBthmL6SDAyGpWfnuHlfiaWiRtgDSKp
 9XkfIVXhjdqbB2uK5PNWptqGoqStp9JfVTMDqsAENXvizP9CczbtWdsqomSkYnJwVbNc
 nPplN5Rn1NcnReLMsnIjQK74McZVMeO5JvrV0rs/xw/y8A925NuLRDalhjPyNigOM7nM
 5QbQ==
X-Gm-Message-State: AOAM530irfeBK+/Jfpe92fBbZOh6wQU+z/A03L3UbJhC4YoeEq8qjETx
 aRw4BTFFjvRcCmYpJirvXUaaNjgmt1jY3Fo2KauzFA==
X-Google-Smtp-Source: ABdhPJxokpuetS3wrfVhDAggXGMVgcJSPZmM8yhumm2K4bM4lNqaUYCk9GovBfE9czrBpYHywFRmrJGL//3JdXuuEp0=
X-Received: by 2002:a9d:4e08:: with SMTP id p8mr26247753otf.188.1608128502994; 
 Wed, 16 Dec 2020 06:21:42 -0800 (PST)
MIME-Version: 1.0
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <1605936082-3099-6-git-send-email-andrey.grodzovsky@amd.com>
 <28332cf0-612c-10bd-c64e-fff6e1f18653@gmail.com>
 <320ff94c-78f4-b9a5-4c6f-40f7ce162bd3@amd.com>
 <41b35672-2dd6-13e2-8383-c65279fdb648@gmail.com>
 <e2f4f1dc-2a2a-face-87b2-6d61ed7d3305@amd.com>
 <01280cba-56b8-77c6-b40f-d7e69a5ad4c6@amd.com>
 <0ceca974-80f8-feb3-d5e9-5182f35bb2c4@amd.com>
 <20288c45-270c-3ed7-2ac4-eeb6e5c50776@amd.com>
 <2df98c1a-8ed4-fb87-f8f7-e3962e8d9c52@amd.com>
 <041210e5-e237-b72e-dcbc-17027d057c55@gmail.com>
 <1fa4dd77-deec-aa7b-7499-0537e9a01919@amd.com>
 <a818be68-518c-754d-f63b-3754ce882fdc@gmail.com>
In-Reply-To: <a818be68-518c-754d-f63b-3754ce882fdc@gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 16 Dec 2020 15:21:31 +0100
Message-ID: <CAKMK7uEx631E1NB1=NYh7V2_+X=pK0WhA_sBwpxCGOhFaYw9wQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/12] drm/ttm: Expose ttm_tt_unpopulate for driver use
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Qiang Yu <yuq825@gmail.com>,
 Alex Deucher <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBEZWMgMTYsIDIwMjAgYXQgOTowNCBBTSBDaHJpc3RpYW4gS8O2bmlnCjxja29lbmln
LmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBbSAxNS4xMi4yMCB1bSAyMTox
OCBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+ID4gW1NOSVBdCj4gPj4+Cj4gPj4+IFdoaWxl
IHdlIGNhbid0IGNvbnRyb2wgdXNlciBhcHBsaWNhdGlvbiBhY2Nlc3NlcyB0byB0aGUgbWFwcGVk
Cj4gPj4+IGJ1ZmZlcnMgZXhwbGljaXRseSBhbmQgaGVuY2Ugd2UgdXNlIHBhZ2UgZmF1bHQgcmVy
b3V0aW5nCj4gPj4+IEkgYW0gdGhpbmtpbmcgdGhhdCBpbiB0aGlzICBjYXNlIHdlIG1heSBiZSBh
YmxlIHRvIHNwcmlua2xlCj4gPj4+IGRybV9kZXZfZW50ZXIvZXhpdCBpbiBhbnkgc3VjaCBzZW5z
aXRpdmUgcGxhY2Ugd2VyZSB3ZSBtaWdodAo+ID4+PiBDUFUgYWNjZXNzIGEgRE1BIGJ1ZmZlciBm
cm9tIHRoZSBrZXJuZWwgPwo+ID4+Cj4gPj4gWWVzLCBJIGZlYXIgd2UgYXJlIGdvaW5nIHRvIG5l
ZWQgdGhhdC4KPiA+Pgo+ID4+PiBUaGluZ3MgbGlrZSBDUFUgcGFnZSB0YWJsZSB1cGRhdGVzLCBy
aW5nIGJ1ZmZlciBhY2Nlc3NlcyBhbmQgRlcKPiA+Pj4gbWVtY3B5ID8gSXMgdGhlcmUgb3RoZXIg
cGxhY2VzID8KPiA+Pgo+ID4+IFB1aCwgZ29vZCBxdWVzdGlvbi4gSSBoYXZlIG5vIGlkZWEuCj4g
Pj4KPiA+Pj4gQW5vdGhlciBwb2ludCBpcyB0aGF0IGF0IHRoaXMgcG9pbnQgdGhlIGRyaXZlciBz
aG91bGRuJ3QgYWNjZXNzIGFueQo+ID4+PiBzdWNoIGJ1ZmZlcnMgYXMgd2UgYXJlIGF0IHRoZSBw
cm9jZXNzIGZpbmlzaGluZyB0aGUgZGV2aWNlLgo+ID4+PiBBRkFJSyB0aGVyZSBpcyBubyBwYWdl
IGZhdWx0IG1lY2hhbmlzbSBmb3Iga2VybmVsIG1hcHBpbmdzIHNvIEkKPiA+Pj4gZG9uJ3QgdGhp
bmsgdGhlcmUgaXMgYW55dGhpbmcgZWxzZSB0byBkbyA/Cj4gPj4KPiA+PiBXZWxsIHRoZXJlIGlz
IGEgcGFnZSBmYXVsdCBoYW5kbGVyIGZvciBrZXJuZWwgbWFwcGluZ3MsIGJ1dCB0aGF0IG9uZQo+
ID4+IGp1c3QgcHJpbnRzIHRoZSBzdGFjayB0cmFjZSBpbnRvIHRoZSBzeXN0ZW0gbG9nIGFuZCBj
YWxscyBCVUcoKTsgOikKPiA+Pgo+ID4+IExvbmcgc3Rvcnkgc2hvcnQgd2UgbmVlZCB0byBhdm9p
ZCBhbnkgYWNjZXNzIHRvIHJlbGVhc2VkIHBhZ2VzIGFmdGVyCj4gPj4gdW5wbHVnLiBObyBtYXR0
ZXIgaWYgaXQncyBmcm9tIHRoZSBrZXJuZWwgb3IgdXNlcnNwYWNlLgo+ID4KPiA+Cj4gPiBJIHdh
cyBqdXN0IGFib3V0IHRvIHN0YXJ0IGd1YXJkaW5nIHdpdGggZHJtX2Rldl9lbnRlci9leGl0IENQ
VQo+ID4gYWNjZXNzZXMgZnJvbSBrZXJuZWwgdG8gR1RUIG90IFZSQU0gYnVmZmVycyBidXQgdGhl
biBpIGxvb2tlZCBtb3JlIGluCj4gPiB0aGUgY29kZQo+ID4gYW5kIHNlZW1zIGxpa2UgdHRtX3R0
X3VucG9wdWxhdGUganVzdCBkZWxldGVzIERNQSBtYXBwaW5ncyAoZm9yIHRoZQo+ID4gc2FrZSBv
ZiBkZXZpY2UgdG8gbWFpbiBtZW1vcnkgYWNjZXNzKS4gS2VybmVsIHBhZ2UgdGFibGUgaXMgbm90
IHRvdWNoZWQKPiA+IHVudGlsIGxhc3QgYm8gcmVmY291bnQgaXMgZHJvcHBlZCBhbmQgdGhlIGJv
IGlzIHJlbGVhc2VkCj4gPiAodHRtX2JvX3JlbGVhc2UtPmRlc3Ryb3ktPmFtZGdwdV9ib19kZXN0
cm95LT5hbWRncHVfYm9fa3VubWFwKS4gVGhpcwo+ID4gaXMgYm90aAo+ID4gZm9yIEdUVCBCT3Mg
bWFwZWQgdG8ga2VybmVsIGJ5IGttYXAgKG9yIHZtYXApIGFuZCBmb3IgVlJBTSBCT3MgbWFwcGVk
Cj4gPiBieSBpb3JlbWFwLiBTbyBhcyBpIHNlZSBpdCwgbm90aGluZyB3aWxsIGJhZCB3aWxsIGhh
cHBlbiBhZnRlciB3ZQo+ID4gdW5wb3B1bGF0ZSBhIEJPIHdoaWxlIHdlIHN0aWxsIHRyeSB0byB1
c2UgYSBrZXJuZWwgbWFwcGluZyBmb3IgaXQsCj4gPiBzeXN0ZW0gbWVtb3J5IHBhZ2VzIGJhY2tp
bmcgR1RUIEJPcyBhcmUgc3RpbGwgbWFwcGVkIGFuZCBub3QgZnJlZWQgYW5kCj4gPiBmb3IKPiA+
IFZSQU0gQk9zIHNhbWUgaXMgZm9yIHRoZSBJTyBwaHlzaWNhbCByYW5nZXMgbWFwcGVkIGludG8g
dGhlIGtlcm5lbAo+ID4gcGFnZSB0YWJsZSBzaW5jZSBpb3VubWFwIHdhc24ndCBjYWxsZWQgeWV0
Lgo+Cj4gVGhlIHByb2JsZW0gaXMgdGhlIHN5c3RlbSBwYWdlcyB3b3VsZCBiZSBmcmVlZCBhbmQg
aWYgd2Uga2VybmVsIGRyaXZlcgo+IHN0aWxsIGhhcHBpbHkgd3JpdGUgdG8gdGhlbSB3ZSBhcmUg
cHJldHR5IG11Y2ggYnVzdGVkIGJlY2F1c2Ugd2Ugd3JpdGUKPiB0byBmcmVlZCB1cCBtZW1vcnku
CgpTaW1pbGFyIGZvciB2cmFtLCBpZiB0aGlzIGlzIGFjdHVhbCBob3R1bnBsdWcgYW5kIHRoZW4g
cmVwbHVnLCB0aGVyZSdzCmdvaW5nIHRvIGJlIGEgZGlmZmVyZW50IGRldmljZSBiZWhpbmQgdGhl
IHNhbWUgbW1pbyBiYXIgcmFuZ2UgbW9zdApsaWtlbHkgKHRoZSBoaWdoZXIgYnJpZGdlcyBhbGwg
dGhpcyBoYXZlIHRoZSBzYW1lIHdpbmRvd3MgYXNzaWduZWQpLAphbmQgdGhhdCdzIGJhZCBuZXdz
IGlmIHdlIGtlZXAgdXNpbmcgaXQgZm9yIGN1cnJlbnQgZHJpdmVycy4gU28gd2UKcmVhbGx5IGhh
dmUgdG8gcG9pbnQgYWxsIHRoZXNlIGNwdSBwdGVzIHRvIHNvbWUgb3RoZXIgcGxhY2UuCi1EYW5p
ZWwKCj4KPiBDaHJpc3RpYW4uCj4KPiA+IEkgbG9hZGVkIHRoZSBkcml2ZXIgd2l0aCB2bV91cGRh
dGVfbW9kZT0zCj4gPiBtZWFuaW5nIGFsbCBWTSB1cGRhdGVzIGRvbmUgdXNpbmcgQ1BVIGFuZCBo
YXNuJ3Qgc2VlbiBhbnkgT09QcyBhZnRlcgo+ID4gcmVtb3ZpbmcgdGhlIGRldmljZS4gSSBndWVz
cyBpIGNhbiB0ZXN0IGl0IG1vcmUgYnkgYWxsb2NhdGluZyBHVFQgYW5kCj4gPiBWUkFNIEJPcwo+
ID4gYW5kIHRyeWluZyB0byByZWFkL3dyaXRlIHRvIHRoZW0gYWZ0ZXIgZGV2aWNlIGlzIHJlbW92
ZWQuCj4gPgo+ID4gQW5kcmV5Cj4gPgo+ID4KPiA+Pgo+ID4+IFJlZ2FyZHMsCj4gPj4gQ2hyaXN0
aWFuLgo+ID4+Cj4gPj4+Cj4gPj4+IEFuZHJleQo+ID4+Cj4gPj4KPiA+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBhbWQtZ2Z4IG1haWxpbmcgbGlz
dAo+ID4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo+CgoKLS0gCkRhbmllbCBWZXR0
ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xs
LmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
