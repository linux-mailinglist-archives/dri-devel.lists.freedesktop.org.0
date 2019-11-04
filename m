Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DA9EE7C8
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 19:58:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E55A66E820;
	Mon,  4 Nov 2019 18:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF156E820
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 18:57:56 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id u13so15381112ote.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2019 10:57:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z3NXmbQZe9ZnT7fbe+EIvkpInJMLKjVbW03x8y81A38=;
 b=BE21WnvmJ9xmBEcD6Hunb0/ItD0/Nr2xnQnpRilWw7S2b2RHRwzXnaawZIW8qVMJ5q
 1Gimn9OPMhpxleIdT2/ls6FAOB82lyA3DfqH04tAr5z+Vlr74z0aPxEVUJPl72S5+qiE
 itJrCYKqBW85+IMDTSzeZ8AqNzcwYlGAaipp18gC4hfanFPUJpE6zwAVVUUqlCO1LUJT
 bMdc6I6dRfeQ/hBxpmO7K2qBGigUBC96LsoBhfvdl/GJCMdp8fq3xz4Ke9VSSJr5iqs6
 7Jw9gkHIBOo3WR3yvZ/CPPS2dUwok7GiJC5AjsNx9yDsOqjZ9Rvjw1PuRqu3RJxtULmZ
 VfpQ==
X-Gm-Message-State: APjAAAWPEqHwbfYoI3zaWGyDpmlt8cjHJlPBWhX4FofkN3VOr6yoNEd4
 tfxcG1HFzWjlUE98oz2XdBKA5Tnv6SHnutftlceXTw==
X-Google-Smtp-Source: APXvYqwd8cmeVMOTe+JQ+j2QX+t3I35Dixid5qlgqiNrKFgTlCT0qjVcLrqc+RT374J9gbd5lphfL5RyiFI2gFJjRPk=
X-Received: by 2002:a9d:630c:: with SMTP id q12mr19353256otk.332.1572893875375; 
 Mon, 04 Nov 2019 10:57:55 -0800 (PST)
MIME-Version: 1.0
References: <20191025234834.28214-1-john.stultz@linaro.org>
 <20191104095823.GD10326@phenom.ffwll.local>
In-Reply-To: <20191104095823.GD10326@phenom.ffwll.local>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 4 Nov 2019 10:57:44 -0800
Message-ID: <CALAqxLW_CoAn-KXki0dGKK+vo-R4CTnjt1Azrw=mRdL8BUFGWw@mail.gmail.com>
Subject: Re: [RFC][PATCH 0/2] Allow DMA BUF heaps to be loaded as modules
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=z3NXmbQZe9ZnT7fbe+EIvkpInJMLKjVbW03x8y81A38=;
 b=fFfD5MFPiJ1kIysRVmZVrDEnc3iHR5WePrk035gRLGZj4EECNcsralgOCLF45h65vB
 zenyoBMjR85Vqj/x36CUNK59ZtiTlUDkITY/CzP1ZxrbI2sdcj5VZxH1Ya8f7y2/oRMU
 04v6lxIY4znf+l+FSL39uRNT+VCYMGLoV4IJWITuemgu0AOvHpJ00pkatCucMRC4FUzE
 BNujdNj2j/A6MvTohDixsW5gE1mGAsAqbwSkfhATzBtYiaSmed2IpcJMFzTXOb9qzd8w
 CO73Iet24BAdstCgmFamT2zFZemCUpQlyCiE1E2zt4+1yTYhn8JvFB20wFSLRl7NL0Jf
 U8vg==
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
Cc: Sandeep Patil <sspatil@google.com>, Chenbo Feng <fengc@google.com>,
 Alistair Strachan <astrachan@google.com>, Liam Mark <lmark@codeaurora.org>,
 lkml <linux-kernel@vger.kernel.org>, Yue Hu <huyue2@yulong.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Andrew F . Davis" <afd@ti.com>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgNCwgMjAxOSBhdCAxOjU4IEFNIERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4gd3JvdGU6Cj4gT24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgMTE6NDg6MzJQTSArMDAwMCwg
Sm9obiBTdHVsdHogd3JvdGU6Cj4gPiBOb3cgdGhhdCB0aGUgRE1BIEJVRiBoZWFwcyBjb3JlIGNv
ZGUgaGFzIGJlZW4gcXVldWVkLCBJIHdhbnRlZAo+ID4gdG8gc2VuZCBvdXQgc29tZSBvZiB0aGUg
cGVuZGluZyBjaGFuZ2VzIHRoYXQgSSd2ZSBiZWVuIHdvcmtpbmcKPiA+IG9uLgo+ID4KPiA+IEZv
ciB1c2Ugd2l0aCBBbmRyb2lkIGFuZCB0aGVpciBHS0kgZWZmb3J0LCBpdCBpcyBkZXNpcmVkIHRo
YXQKPiA+IERNQSBCVUYgaGVhcHMgYXJlIGFibGUgdG8gYmUgbG9hZGVkIGFzIG1vZHVsZXMuIFRo
aXMgaXMgcmVxdWlyZWQKPiA+IGZvciBtaWdyYXRpbmcgdmVuZG9ycyBvZmYgb2YgSU9OIHdoaWNo
IHdhcyBhbHNvIHJlY2VudGx5IGNoYW5nZWQKPiA+IHRvIHN1cHBvcnQgbW9kdWxlcy4KPiA+Cj4g
PiBTbyB0aGlzIHBhdGNoIHNlcmllcyBzaW1wbHkgcHJvdmlkZXMgdGhlIG5lY2Vzc2FyeSBleHBv
cnRlZAo+ID4gc3ltYm9scyBhbmQgYWxsb3dzIHRoZSBzeXN0ZW0gYW5kIENNQSBkcml2ZXJzIHRv
IGJlIGJ1aWx0Cj4gPiBhcyBtb2R1bGVzLgo+ID4KPiA+IER1ZSB0byB0aGUgZmFjdCB0aGF0IGRt
YWJ1ZidzIGFsbG9jYXRlZCBmcm9tIGEgaGVhcCBtYXkKPiA+IGJlIGluIHVzZSBmb3IgcXVpdGUg
c29tZSB0aW1lLCB0aGVyZSBpc24ndCBhIHdheSB0byBzYWZlbHkKPiA+IHVubG9hZCB0aGUgZHJp
dmVyIG9uY2UgaXQgaGFzIGJlZW4gbG9hZGVkLiBUaHVzIHRoZXNlCj4gPiBkcml2ZXJzIGRvIG5v
IGltcGxlbWVudCBtb2R1bGVfZXhpdCgpIGZ1bmN0aW9ucyBhbmQgd2lsbAo+ID4gc2hvdyB1cCBp
biBsc21vZCBhcyAiW3Blcm1hbmVudF0iCj4gPgo+ID4gRmVlZGJhY2sgYW5kIHRob3VnaHRzIG9u
IHRoaXMgd291bGQgYmUgZ3JlYXRseSBhcHByZWNpYXRlZCEKPgo+IERvIHdlIGFjdHVhbGx5IHdh
bnQgdGhpcz8KCkkgZ3Vlc3MgdGhhdCBhbHdheXMgZGVwZW5kcyBvbiB0aGUgZGVmaW5pdGlvbiBv
ZiAid2UiIDopCgo+IEkgZmlndXJlZCBpZiB3ZSBqdXN0IHN0YXRlIHRoYXQgdmVuZG9ycyBzaG91
bGQgc2V0IHVwIGFsbCB0aGUgcmlnaHQKPiBkbWEtYnVmIGhlYXBzIGluIGR0LCBpcyB0aGF0IG5v
dCBlbm91Z2g/CgpTbyBldmVuIGlmIHRoZSBoZWFwcyBhcmUgY29uZmlndXJlZCB2aWEgRFQgKHdo
aWNoIGF0IHRoZSBtb21lbnQgdGhlcmUKaXMgbm8gc3VjaCBiaW5kaW5nLCBzbyB0aGF0J3Mgbm90
IHJlYWxseSBhIHZhbGlkIG1ldGhvZCB5ZXQpLCB0aGVyZSdzCnN0aWxsIHRoZSBxdWVzdGlvbiBv
ZiBpZiB0aGUgaGVhcCBpcyBuZWNlc3NhcnkvbWFrZXMgc2Vuc2Ugb24gdGhlCmRldmljZS4gQW5k
IHRoZSBEVCB3b3VsZCBvbmx5IGNvbnRyb2wgdGhlIGF2YWlsYWJpbGl0eSBvZiB0aGUgaGVhcApp
bnRlcmZhY2UsIG5vdCBpZiB0aGUgaGVhcCBkcml2ZXIgaXMgbG9hZGVkIG9yIG5vdC4KCk9uIHRo
ZSBIaUtleS9IaUtleTk2MCBib2FyZHMsIHdlIGhhdmUgdG8gYWxsb2NhdGUgY29udGlndW91cyBi
dWZmZXJzCmZvciB0aGUgZGlzcGxheSBmcmFtZWJ1ZmZlci4gU28gZ3JhbGxvYyB1c2VzIElPTiB0
byBhbGxvY2F0ZSBmcm9tIHRoZQpDTUEgaGVhcC4gSG93ZXZlciBvbiB0aGUgZGI4NDVjLCBpdCBo
YXMgbm8gc3VjaCByZXN0cmljdGlvbnMsIHNvIHRoZQpDTUEgaGVhcCBpc24ndCBuZWNlc3Nhcnku
CgpXaXRoIEFuZHJvaWQncyBHS0kgZWZmb3J0LCB0aGVyZSBuZWVkcyB0byBiZSBvbmUga2VybmVs
IHRoYXQgd29ya3Mgb24KYWxsIHRoZSBkZXZpY2VzLCBhbmQgdGhleSBhcmUgdXNpbmcgbW9kdWxl
cyB0byB0cnkgdG8gbWluaW1pemUgdGhlCmFtb3VudCBvZiBtZW1vcnkgc3BlbnQgb24gZnVuY3Rp
b25hbGl0eSB0aGF0IGlzbid0IHVuaXZlcnNhbGx5IG5lZWRlZC4KU28gb24gZGV2aWNlcyB0aGF0
IGRvbid0IG5lZWQgdGhlIENNQSBoZWFwLCB0aGV5J2QgcHJvYmFibHkgcHJlZmVyIG5vdAp0byBs
b2FkIHRoZSBDTUEgZG1hYnVmIGhlYXAgZHJpdmVyLCBzbyBpdCB3b3VsZCBiZSBiZXN0IGlmIGl0
IGNvdWxkIGJlCmJ1aWx0IGFzIGEgbW9kdWxlLiAgSWYgd2Ugd2FudCB0byBidWlsZCB0aGUgQ01B
IGhlYXAgYXMgYSBtb2R1bGUsIHRoZQpzeW1ib2xzIGl0IHVzZXMgbmVlZCB0byBiZSBleHBvcnRl
ZC4KCj4gRXhwb3J0aW5nIHN5bWJvbHMgZm9yIG5vIHJlYWwgaW4tdHJlZSB1c2VycyBmZWVscyBm
aXNoeS4KCkknbSBzdWJtaXR0aW5nIGFuIGluLXRyZWUgdXNlciBoZXJlLiBTbyBJJ20gbm90IHN1
cmUgd2hhdCB5b3UgbWVhbj8gIEkKc3VzcGVjdCB5b3UncmUgdGhpbmtpbmcgdGhlcmUgaXMgc29t
ZSBoaWRkZW4vbmVmYXJpb3VzIHBsYW4gaGVyZSwgYnV0CnJlYWxseSB0aGVyZSBpc24ndC4KCnRo
YW5rcwotam9obgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
