Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D1C1D0046
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 23:12:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306A36E9A1;
	Tue, 12 May 2020 21:12:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD906E99F;
 Tue, 12 May 2020 21:12:16 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id g12so25518410wmh.3;
 Tue, 12 May 2020 14:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pLYCwLh/bjz54dBFKDYpXCCsMiFh7ugi78OcIyHdNMo=;
 b=lP/38E2f7hDc/lcxiazNY6iOfcDVgebacbmnahr0DCK5dsdqaRqI7ViKSsAxtsr3IU
 gqsGzO53JcgScCh5yusADIV5OlGOksYyB54R4PkzyiIUSMk6g5qNKQU2d4W+VFEUIrbr
 ZuUzhaV6bteInDfQGcADBl3vIo8S0gB6j36lyxSm4Z8cLl8dxnKuVTN/e29d2fAsIxoM
 TjnbrWaf/+kSawLGrhoEeTa7SWTH7RMLrv0YuPkwvckQ8R46/+UkAIt5UXY8HlYTeVtO
 m7mysjqQpc6A7nbcppFhFFLeVYYLd1n22KYUhBJxaWZaY8Q7aqGBKc1yCiwuF0wVcHvy
 aF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pLYCwLh/bjz54dBFKDYpXCCsMiFh7ugi78OcIyHdNMo=;
 b=NH9YmICzZaro3YuTi2Isk4sATOqsSmQwzN/GDF0IUvrDsGTS0SaDsPdXvtvSw7Ay99
 cQwx0seGT+F8sOZkT0u9pNn/W6RRiKg1+F5CNeQwFuNNGcg1fg0Ck1rhO+5i4ukcQFHM
 h7mVW6C8aAcJCikNv4ILiuZlNR7ewtNXWtARUXGJ9/wwiDIb0y574zcCbYzOaXMzclfC
 poynGc5gFpBFG3E2RJg69k+cnhedolZQTqh5JZ5lJ5+9HCajOZ+u7fqR5fCFkO9BvZy9
 uxDcoZvg/2d5X7SaHTLz/teLJNAa44hmE3qS6v4XwR0Aa1PaCsosyAp0QHATRSV8gpMq
 rSGQ==
X-Gm-Message-State: AGi0PuYgiDv7tvehw/BtlefD16APaguL8HM0Z/c6tCb8goptEdk8DW4O
 rrw2PGPWgp6hqhAFlS6DDhI33jWigxyidILtf8k=
X-Google-Smtp-Source: APiQypL9vXFi7J6y9Ng/AqiS1iiuyIhSOzR1EI1V1+5nFZTZ3zrvoaPI1hMmjODwUWYfaHsoapPr3RkyX0QpzCbXwTM=
X-Received: by 2002:a1c:1d41:: with SMTP id d62mr18919174wmd.79.1589317935386; 
 Tue, 12 May 2020 14:12:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200511171722.96576-1-christian.koenig@amd.com>
 <20200511171722.96576-2-christian.koenig@amd.com>
 <CADnq5_MyO_L+1w69qDLzhg34W6Qer-uSRR2tb7-2uXLC_6PXSg@mail.gmail.com>
 <ba0b1ab7-3078-a6f2-41cd-326ca21ee99f@daenzer.net>
 <CADnq5_MdbJUXs7wbG=HCOKj4Vp_NmLkcJng=EXynSXPe9gsyOQ@mail.gmail.com>
 <777c08d1-3ac3-16ca-0222-e2d62c281e50@spliet.org>
In-Reply-To: <777c08d1-3ac3-16ca-0222-e2d62c281e50@spliet.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 May 2020 17:12:04 -0400
Message-ID: <CADnq5_NK6ziShvkDug5xGHm7oZTf9qEu41gOxvNANQHFD2a-qQ@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 1/3] drm/radeon: remove AGP support
To: Roy Spliet <nouveau@spliet.org>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMTIsIDIwMjAgYXQgNDo1MiBQTSBSb3kgU3BsaWV0IDxub3V2ZWF1QHNwbGll
dC5vcmc+IHdyb3RlOgo+Cj4gT3AgMTItMDUtMjAyMCBvbSAxNDozNiBzY2hyZWVmIEFsZXggRGV1
Y2hlcjoKPiA+IE9uIFR1ZSwgTWF5IDEyLCAyMDIwIGF0IDQ6MTYgQU0gTWljaGVsIETDpG56ZXIg
PG1pY2hlbEBkYWVuemVyLm5ldD4gd3JvdGU6Cj4gPj4KPiA+PiBPbiAyMDIwLTA1LTExIDEwOjEy
IHAubS4sIEFsZXggRGV1Y2hlciB3cm90ZToKPiA+Pj4gT24gTW9uLCBNYXkgMTEsIDIwMjAgYXQg
MToxNyBQTSBDaHJpc3RpYW4gS8O2bmlnCj4gPj4+IDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdt
YWlsLmNvbT4gd3JvdGU6Cj4gPj4+Pgo+ID4+Pj4gQUdQIGlzIGRlcHJlY2F0ZWQgZm9yIDEwKyB5
ZWFycyBub3cgYW5kIG5vdCB1c2VkIGFueSBtb3JlIG9uIG1vZGVybiBoYXJkd2FyZS4KPiA+Pj4+
Cj4gPj4+PiBPbGQgaGFyZHdhcmUgc2hvdWxkIGNvbnRpbnVlIHRvIHdvcmsgaW4gUENJIG1vZGUu
Cj4gPj4+Cj4gPj4+IE1pZ2h0IHdhbnQgdG8gY2xhcmlmeSB0aGF0IHRoZXJlIGlzIG5vIGxvc3Mg
b2YgZnVuY3Rpb25hbGl0eSBoZXJlLgo+ID4+PiBTb21ldGhpbmcgbGlrZToKPiA+Pj4KPiA+Pj4g
IlRoZXJlIGlzIG5vIGxvc3Mgb2YgZnVuY3Rpb25hbGl0eSBoZXJlLiAgR1BVcyB3aWxsIGNvbnRp
bnVlIHRvCj4gPj4+IGZ1bmN0aW9uLiAgVGhpcyBqdXN0IGRyb3BzIHRoZSB1c2Ugb2YgdGhlIEFH
UCBNTVUgaW4gdGhlIGNoaXBzZXQgaW4KPiA+Pj4gZmF2b3Igb2YgdGhlIE1NVSBvbiB0aGUgZGV2
aWNlIHdoaWNoIGhhcyBwcm92ZW4gdG8gYmUgbXVjaCBtb3JlCj4gPj4+IHJlbGlhYmxlLiAgRHVl
IHRvIGl0cyB1bnJlbGlhYmlsaXR5LCBBR1Agc3VwcG9ydCBoYXMgYmVlbiBkaXNhYmxlZCBvbgo+
ID4+PiBQb3dlclBDIGZvciB5ZWFycyBhbHJlYWR5IHNvIHRoZXJlIGlzIG5vIGNoYW5nZSBvbiBQ
b3dlclBDLiIKPiA+Pgo+ID4+IFRoZXJlJ3MgYSBkaWZmZXJlbmNlIGJldHdlZW4gc29tZXRoaW5n
IGJlaW5nIGRpc2FibGVkIGJ5IGRlZmF1bHQgb3Igbm90Cj4gPj4gYmVpbmcgYXZhaWxhYmxlIGF0
IGFsbC4gV2UgbWF5IGRlY2lkZSBpdCdzIHdvcnRoIGl0IGFueXdheSwgYnV0IGxldCdzIGRvCj4g
Pj4gaXQgYmFzZWQgb24gZmFjdHMuCj4gPj4KPiA+Cj4gPiBJIGRpZG4ndCBtZWFuIHRvIGltcGx5
IHRoYXQgQUdQIEdBUlQgc3VwcG9ydCB3YXMgYWxyZWFkeSByZW1vdmVkLiAgQnV0Cj4gPiBmb3Ig
dGhlIHZhc3QgbWFqb3JpdHkgb2YgdXNlcnMgdGhlIGVuZCByZXN1bHQgaXMgdGhlIHNhbWUuICBJ
ZiB5b3UKPiA+IGtuZXcgZW5vdWdoIHJlLWVuYWJsZSBBR1AgR0FSVCwgeW91IHByb2JhYmx5IHdv
dWxkbid0IGhhdmUgYmVlbiBhcwo+ID4gY29uZnVzZWQgYWJvdXQgd2hhdCB0aGlzIHBhdGNoIHNl
dCBkb2VzIGVpdGhlci4gIFRvIHJlaXRlcmF0ZSwgdGhpcwo+ID4gcGF0Y2ggc2V0IGRvZXMgbm90
IHJlbW92ZSBzdXBwb3J0IGZvciBBR1AgY2FyZHMsIGl0IG9ubHkgcmVtb3ZlcyB0aGUKPiA+IHN1
cHBvcnQgZm9yIEFHUCBHQVJULiAgVGhlIGNhcmRzIHdpbGwgc3RpbGwgYmUgZnVuY3Rpb25hbCB1
c2luZyB0aGUKPiA+IGRldmljZSBHQVJULiAgVGhlcmUgbWF5IGJlIHBlcmZvcm1hbmNlIHRyYWRl
b2ZmcyB0aGVyZSBpbiBzb21lIGNhc2VzLgo+Cj4gSSdsbCB2b2x1bnRlZXIgdG8gYmUgdGhlIG9u
ZSBhc2tpbmc6IGhvdyBiaWcgaXMgdGhpcyBwZXJmb3JtYW5jZQo+IGRpZmZlcmVuY2U/IEhhdmUg
YW55IGJlbmNobWFya3MgYmVlbiBydW4gYmVmb3JlIGFuZCBhZnRlciByZW1vdmFsIG9mIEFHUAo+
IEdBUlQgY29kZSBvbiBhZmZlY3RlZCBub3V2ZWF1L3JhZGVvbiBzeXN0ZW1zPyBPciBpcyB0aGlz
IGNvZGUgYmVpbmcKPiBkcm9wcGVkIF9qdXN0XyBiZWNhdXNlIGl0J3MgY3VtYmVyc29tZSwgd2l0
aCBubyByZWdhcmQgZm9yIG1ldHJpY3MgdGhhdAo+IGRldGVybWluZSB0aGUgdmFsdWUgb2YgQUdQ
IEdBUlQgc3VwcG9ydD8KPgoKSSBkb24ndCB0aGluayBhbnlvbmUgaGFzIGFueSBzb2xpZCBudW1i
ZXJzLCBqdXN0IGFuZWNkb3RhbCBmcm9tCm1lbW9yeS4gIEkgY2VydGFpbmx5IGRvbid0IGhhdmUg
YW55IGZ1bmN0aW9uYWwgQUdQIHN5c3RlbXMgYXQgdGhpcwpwb2ludC4gIEl0J3MgbW9zdGx5IGp1
c3QgY3VtYmVyc29tZSBhbmQgd291bGQgYWxsb3cgdXMgdG8gY2xlYW4gdHRtCmFuZCBwcm9iYWJs
eSBpbXByb3ZlIHN0YWJpbGl0eSBhdCB0aGUgc2FtZSB0aW1lLiAgQXQgbGVhc3Qgb24gdGhlCnJh
ZGVvbiBzaWRlLCB0aGUgb25seSBuYXRpdmUgQUdQIGNhcmRzIHdlcmUgcjF4eCwgcjJ4eCwgYW5k
IHNvbWUgb2YKdGhlIGVhcmx5IHIzeHggYm9hcmRzLiAgT25jZSB3ZSBzd2l0Y2hlZCB0byBwY2ll
IG1pZC13YXkgdGhyb3VnaCByM3h4LApldmVyeXRoaW5nIHdhcyBuYXRpdmUgcGNpZSBhbmQgdGhl
IEFHUCBjYXJkcyB1c2VkIGEgcGNpZSB0byBBR1AgYnJpZGdlCmNoaXAgc28gdGhleSBoYWQgYSBk
ZWNlbnQgb24gY2hpcCBNTVUuICBUaG9zZSBvbGRlciBjYXJkcyB0b3BwZWQgb3V0CmF0IG1heWJl
IDMyIG9yIDY0IE1CIG9mIHZyYW0sIHNvIHRoZXkgYXJlIGdvaW5nIHRvIGJlIGhhcmQgcHJlc3Nl
ZCB0bwpkZWFsIHdpdGggbW9kZXJuIGRlc2t0b3BzIGFueXdheS4gIE5vIGlkZWEgd2hhdCBzb3J0
IG9mIEdBUlQKY2FwYWJpbGl0aWVzIE5WIEFHUCBoYXJkd2FyZSBhdCB0aGlzIHRpbWUgaGFkLgoK
QWxleAoKPiBSb3kKPgo+ID4KPiA+IEFsZXgKPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gPiBOb3V2ZWF1IG1haWxpbmcgbGlzdAo+ID4gTm91dmVh
dUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo+ID4KPgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
