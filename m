Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D82FE33CA49
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 01:15:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF1306E17C;
	Tue, 16 Mar 2021 00:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD796E17C
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 00:15:52 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id bf3so19420898edb.6
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 17:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=28nqg1xmsyjFbTSbx/wbcsodSq/hFYEsvygv5IB6mm0=;
 b=R7h/8v9SkMRVHr7h7ch57fCwOCvxexKAvmlZzntnih1B+z6tcgYiJiDsDzL2SqBqjO
 Ee8pvsuYLLg8Sa++N/LwQ4eLy6QaNcmyuZ3CGRWVABLK/oso9D8c5ygXVid12KTeoG+r
 hP7ayAaBfWBEgFSYQ2LumO2AoyZtnVCZYFwri507ldiBrGlerTlV0zn9V0sYR9n2t7Db
 tVgDTVB8d/vEa9j3NsSagTEwk0SA4LCO0iUx9H1OQYJGpIWkbNqBU59n2KD0ZYGfm9MO
 gDeycI+yiAhfQgd1Weasu3yTyB9v0B0nvdEMwK9azO3MaHv0FzcY80905IUYXNnhOpSx
 vZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=28nqg1xmsyjFbTSbx/wbcsodSq/hFYEsvygv5IB6mm0=;
 b=CEN6wfEhmHlP7Ej1yaldF600tYMC9cmO3gx/ug3Mnx6R3VUcsMUAxmJMGMw8jezzYS
 ldUM9QIjpJmidW+1YfdLM1aDXOjyPbthU1RWCu5HeU/5Slm9QEpVZe9vGCa0pfNJ6gqR
 nMdLsqbdmnLOxaKZIB6LCeRbnoqgMrOPBYbkFEA4DC5gYOU/F0l9EHoFyCMPz4nGjMp2
 uFUZeB6jUcZzT/tbsMALSEVNtIyU2YUHoNfViHgUIoGol9NAzmw3qaNGCGS9MomrUYAN
 YEJMD70i+bamGFsc+jmwXydZzApPk0c5A5RlAEJLBKk+/inmtdRI5uwZMqTiEzRoIGL3
 j3Ow==
X-Gm-Message-State: AOAM531jjtcKQOCUnj1Jdv+VK42kehcmnplGO31usTOestkKX6m2KStv
 QN57EOllLPW2MzTUKrFVjpFPRZbUlbAAlX51Y71uPnp/WTeLoA==
X-Google-Smtp-Source: ABdhPJwMT9Ck4hS3h5sVCSWMLVTpwcgqrd8FNGfbXakLZPepfyuVJXRap8Q+HhJoOBhlVO4qUMduOm42WGH76xGVYmA=
X-Received: by 2002:a05:6402:17d6:: with SMTP id
 s22mr32546824edy.232.1615853750518; 
 Mon, 15 Mar 2021 17:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200317212115.419358-1-jason@jlekstrand.net>
 <20210315210453.1667925-1-jason@jlekstrand.net>
In-Reply-To: <20210315210453.1667925-1-jason@jlekstrand.net>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 15 Mar 2021 19:15:39 -0500
Message-ID: <CAOFGe95+sX2R+=xtF0SGXas0V2WXv70z+M0qrMkOQ5Pu9qnbWg@mail.gmail.com>
Subject: Re: [PATCH 0/3] dma-buf: Add an API for exporting sync files (v6)
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
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
Cc: Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Stone <daniels@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SS1HLVQgdGVzdHM6IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2lndC1k
ZXYvMjAyMS1NYXJjaC8wMjk4MjUuaHRtbAoKT24gTW9uLCBNYXIgMTUsIDIwMjEgYXQgNDowNCBQ
TSBKYXNvbiBFa3N0cmFuZCA8amFzb25Aamxla3N0cmFuZC5uZXQ+IHdyb3RlOgo+Cj4gTW9kZXJu
IHVzZXJzcGFjZSBBUElzIGxpa2UgVnVsa2FuIGFyZSBidWlsdCBvbiBhbiBleHBsaWNpdAo+IHN5
bmNocm9uaXphdGlvbiBtb2RlbC4gIFRoaXMgZG9lc24ndCBhbHdheXMgcGxheSBuaWNlbHkgd2l0
aCB0aGUKPiBpbXBsaWNpdCBzeW5jaHJvbml6YXRpb24gdXNlZCBpbiB0aGUga2VybmVsIGFuZCBh
c3N1bWVkIGJ5IFgxMSBhbmQKPiBXYXlsYW5kLiAgVGhlIGNsaWVudCAtPiBjb21wb3NpdG9yIGhh
bGYgb2YgdGhlIHN5bmNocm9uaXphdGlvbiBpc24ndCB0b28KPiBiYWQsIGF0IGxlYXN0IG9uIGlu
dGVsLCBiZWNhdXNlIHdlIGNhbiBjb250cm9sIHdoZXRoZXIgb3Igbm90IGk5MTUKPiBzeW5jaHJv
bml6ZXMgb24gdGhlIGJ1ZmZlciBhbmQgd2hldGhlciBvciBub3QgaXQncyBjb25zaWRlcmVkIHdy
aXR0ZW4uCj4KPiBUaGUgaGFyZGVyIHBhcnQgaXMgdGhlIGNvbXBvc2l0b3IgLT4gY2xpZW50IHN5
bmNocm9uaXphdGlvbiB3aGVuIHdlIGdldAo+IHRoZSBidWZmZXIgYmFjayBmcm9tIHRoZSBjb21w
b3NpdG9yLiAgV2UncmUgcmVxdWlyZWQgdG8gYmUgYWJsZSB0bwo+IHByb3ZpZGUgdGhlIGNsaWVu
dCB3aXRoIGEgVmtTZW1hcGhvcmUgYW5kIFZrRmVuY2UgcmVwcmVzZW50aW5nIHRoZSBwb2ludAo+
IGluIHRpbWUgd2hlcmUgdGhlIHdpbmRvdyBzeXN0ZW0gKGNvbXBvc2l0b3IgYW5kL29yIGRpc3Bs
YXkpIGZpbmlzaGVkCj4gdXNpbmcgdGhlIGJ1ZmZlci4gIFdpdGggY3VycmVudCBBUElzLCBpdCdz
IHZlcnkgaGFyZCB0byBkbyB0aGlzIGluIHN1Y2gKPiBhIHdheSB0aGF0IHdlIGRvbid0IGdldCBj
b25mdXNlZCBieSB0aGUgVnVsa2FuIGRyaXZlcidzIGFjY2VzcyBvZiB0aGUKPiBidWZmZXIuICBJ
biBwYXJ0aWN1bGFyLCBvbmNlIHdlIHRlbGwgdGhlIGtlcm5lbCB0aGF0IHdlJ3JlIHJlbmRlcmlu
ZyB0bwo+IHRoZSBidWZmZXIgYWdhaW4sIGFueSBDUFUgd2FpdHMgb24gdGhlIGJ1ZmZlciBvciBH
UFUgZGVwZW5kZW5jaWVzIHdpbGwKPiB3YWl0IG9uIHNvbWUgb2YgdGhlIGNsaWVudCByZW5kZXJp
bmcgYW5kIG5vdCBqdXN0IHRoZSBjb21wb3NpdG9yLgo+Cj4gVGhpcyBuZXcgSU9DVEwgc29sdmVz
IHRoaXMgcHJvYmxlbSBieSBhbGxvd2luZyB1cyB0byBnZXQgYSBzbmFwc2hvdCBvZgo+IHRoZSBp
bXBsaWNpdCBzeW5jaHJvbml6YXRpb24gc3RhdGUgb2YgYSBnaXZlbiBkbWEtYnVmIGluIHRoZSBm
b3JtIG9mIGEKPiBzeW5jIGZpbGUuICBJdCdzIGVmZmVjdGl2ZWx5IHRoZSBzYW1lIGFzIGEgcG9s
bCgpIG9yIEk5MTVfR0VNX1dBSVQgb25seSwKPiBpbnN0ZWFkIG9mIENQVSB3YWl0aW5nIGRpcmVj
dGx5LCBpdCBlbmNhcHN1bGF0ZXMgdGhlIHdhaXQgb3BlcmF0aW9uLCBhdAo+IHRoZSBjdXJyZW50
IG1vbWVudCBpbiB0aW1lLCBpbiBhIHN5bmNfZmlsZSBzbyB3ZSBjYW4gY2hlY2svd2FpdCBvbiBp
dAo+IGxhdGVyLiAgQXMgbG9uZyBhcyB0aGUgVnVsa2FuIGRyaXZlciBkb2VzIHRoZSBzeW5jX2Zp
bGUgZXhwb3J0IGZyb20gdGhlCj4gZG1hLWJ1ZiBiZWZvcmUgd2UgcmUtaW50cm9kdWNlIGl0IGZv
ciByZW5kZXJpbmcsIGl0IHdpbGwgb25seSBjb250YWluCj4gZmVuY2VzIGZyb20gdGhlIGNvbXBv
c2l0b3Igb3IgZGlzcGxheS4gIFRoaXMgYWxsb3dzIHRvIGFjY3VyYXRlbHkgdHVybgo+IGl0IGlu
dG8gYSBWa0ZlbmNlIG9yIFZrU2VtYXBob3JlIHdpdGhvdXQgYW55IG92ZXItIHN5bmNocm9uaXph
dGlvbi4KPgo+IE1lc2EgTVI6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL21l
c2EvLS9tZXJnZV9yZXF1ZXN0cy80MDM3Cj4KPiBDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRhZW56ZXIu
bmV0Pgo+IENjOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+IENjOiBCYXMgTmll
dXdlbmh1aXplbiA8YmFzQGJhc25pZXV3ZW5odWl6ZW4ubmw+Cj4gQ2M6IERhbmllbCBTdG9uZSA8
ZGFuaWVsc0Bjb2xsYWJvcmEuY29tPgo+Cj4gQ2hyaXN0aWFuIEvDtm5pZyAoMik6Cj4gICBkbWEt
YnVmOiBhZGQgZG1hX2ZlbmNlX2FycmF5X2Zvcl9lYWNoICh2MikKPiAgIGRtYS1idWY6IGFkZCBk
bWFfcmVzdl9nZXRfc2luZ2xldG9uICh2MikKPgo+IEphc29uIEVrc3RyYW5kICgxKToKPiAgIGRt
YS1idWY6IEFkZCBhbiBBUEkgZm9yIGV4cG9ydGluZyBzeW5jIGZpbGVzICh2NikKPgo+ICBkcml2
ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jICAgICAgICAgfCAgNTUgKysrKysrKysrKysrKysKPiAgZHJp
dmVycy9kbWEtYnVmL2RtYS1mZW5jZS1hcnJheS5jIHwgIDI3ICsrKysrKysKPiAgZHJpdmVycy9k
bWEtYnVmL2RtYS1yZXN2LmMgICAgICAgIHwgMTE4ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwo+ICBpbmNsdWRlL2xpbnV4L2RtYS1mZW5jZS1hcnJheS5oICAgfCAgMTcgKysrKysKPiAg
aW5jbHVkZS9saW51eC9kbWEtcmVzdi5oICAgICAgICAgIHwgICAzICsKPiAgaW5jbHVkZS91YXBp
L2xpbnV4L2RtYS1idWYuaCAgICAgIHwgICA2ICsrCj4gIDYgZmlsZXMgY2hhbmdlZCwgMjI2IGlu
c2VydGlvbnMoKykKPgo+IC0tCj4gMi4yOS4yCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
