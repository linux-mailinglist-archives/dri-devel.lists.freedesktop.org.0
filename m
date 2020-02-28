Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D69F173DCB
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 18:00:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B6D76F489;
	Fri, 28 Feb 2020 17:00:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA376F488;
 Fri, 28 Feb 2020 17:00:43 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id c26so4121920eds.8;
 Fri, 28 Feb 2020 09:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=t9YiIycZVF0Hu5aCAfarmS/T54kw0IBJHApMv3cYyyo=;
 b=jN0nIDBfY2ec/EKrTiSc5Aq9wsDCRonITliImv6ykJo+pekRswPAxsdv8ZpdqALnNT
 vzqeEJXtDoG39hKaeRXk3G+WmXkYLAaJuYyMTdWab6MVOnaCiZ9PUamQplXkrXNGiI4F
 xEtWliCIsxI+uPoQDTQ1oU/N/gRUdYZe0s3XTWdrIVq1soP992B7EUqF3eyDyltesBQq
 JSP6t9LEX2x2NNJy4R8KIf9NQmWw6vK9I2Tco0JSOKjPYI2ZWNbu8bHpcLzVrqE6TVVH
 4u2FCr4rWb5WYc6sazE4+2qihNrxywdBJRh34awoZ2V3NB9sMS1SfuOBQV5aTu061/DP
 yO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=t9YiIycZVF0Hu5aCAfarmS/T54kw0IBJHApMv3cYyyo=;
 b=LpEn0AqmfaKoVWlPN297as1l2q4YViOixluH4gjtVOQ+6VhOxA1s3WkeNYW2puagJu
 Q8W2YabBx6Z1PDbKktMvN7R1/ar7ngrp54wm3VAPY64BPcwLpce9zY+CzjFOKNNgSZ69
 WL9esjE/2Q38HoZt7tpzrVigoECkY3cUyyJ3n2EgI+LRnv3gaKt5q5BRKtxAqerSkAVk
 SxJz2aYMqRJG5fUx4URt1anWDiq8UydJd+U7o0BSSHXredfG8bd5sxgFwFnQCih7aAPw
 ePjiI0hC8iGzIQL6j3jxbSnzUn9vjWZ6yWrU0EzJdaG31yrPxdHhwuy9yYTQJ+MtKYWQ
 KQSg==
X-Gm-Message-State: APjAAAVNo2HnWr65kEAUk4GDwdCd0WX7IGNEKcj60JW/KBc1bhma1SWP
 1hXybAhzQ+sd2hEMMQIX2acKXu7NddXXH5ylcl4=
X-Google-Smtp-Source: APXvYqxbjCqrpCI1OkxCpw8KyES2BvRzo2pZAN2KOEt7Qtynvj4pBA/I1ZuC8e6htAAuU45HTRB4V6ehhZByiCnplzM=
X-Received: by 2002:a17:906:b751:: with SMTP id
 fx17mr3511604ejb.207.1582909241537; 
 Fri, 28 Feb 2020 09:00:41 -0800 (PST)
MIME-Version: 1.0
References: <CAKMK7uHHK2SsCfpmZwEUyTJJHsoccKoadoko3cEBOoYDFkmeAw@mail.gmail.com>
 <CAPM=9txcGPvFdSzMtYZXyqLKnWyacSMuHdoXdV63M53fLFVFpw@mail.gmail.com>
 <b398161ff7d0268454413058dc6c194cf93f5990.camel@collabora.com>
 <a7727f84-ba85-f19d-9823-c7ba04fd1bb8@daenzer.net>
In-Reply-To: <a7727f84-ba85-f19d-9823-c7ba04fd1bb8@daenzer.net>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 28 Feb 2020 09:00:29 -0800
Message-ID: <CAF6AEGspENM8iRxnfzOSvWp2Y-CfAcxV+=Do4t0Ojp5Qo3O3YA@mail.gmail.com>
Subject: Re: [Intel-gfx] [Mesa-dev] gitlab.fd.o financial situation and impact
 on services
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
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
Cc: Erik Faye-Lund <erik.faye-lund@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 "X.Org development" <xorg-devel@lists.x.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 "X.Org Foundation Board" <board@foundation.x.org>,
 Xorg Members List <members@x.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Mesa Dev <mesa-dev@lists.freedesktop.org>,
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBGZWIgMjgsIDIwMjAgYXQgMzo0MyBBTSBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRh
ZW56ZXIubmV0PiB3cm90ZToKPgo+IE9uIDIwMjAtMDItMjggMTA6MjggYS5tLiwgRXJpayBGYXll
LUx1bmQgd3JvdGU6Cj4gPgo+ID4gV2UgY291bGQgYWxzbyBkbyBzdHVmZiBsaWtlIHJlZHVjaW5n
IHRoZSBhbW91bnQgb2YgdGVzdHMgd2UgcnVuIG9uIGVhY2gKPiA+IGNvbW1pdCwgYW5kIHB1bnQg
c29tZSB0ZXN0aW5nIHRvIGEgcGVyLXdlZWtlbmQgdGVzdC1ydW4gb3Igc29tZXRpbmcKPiA+IGxp
a2UgdGhhdC4gV2UgZG9uJ3QgKm5lZWQqIHRvIGtub3cgYWJvdXQgZXZlcnkgcHJvYmxlbSB1cCBm
cm9udCwganVzdAo+ID4gdGhlIHN0dWZmIHRoYXQncyBhYm91dCB0byBiZSByZWxlYXNlZCwgcmVh
bGx5LiBUaGUgb3RoZXIgc3R1ZmYgaXMganVzdAo+ID4gbmljZSB0byBoYXZlLiBJZiBpdCdzIHRv
byBleHBlbnNpdmUsIEkgd291bGQgc2F5IGRyb3AgaXQuCj4KPiBJIGRvbid0IGFncmVlIHRoYXQg
cHJlLW1lcmdlIHRlc3RpbmcgaXMganVzdCBuaWNlIHRvIGhhdmUuIEEgcHJvYmxlbQo+IHdoaWNo
IGlzIG9ubHkgY2F1Z2h0IGFmdGVyIGl0IGxhbmRzIGluIG1haW5saW5lIGhhcyBhIG11Y2ggYmln
Z2VyIGltcGFjdAo+IHRoYW4gb25lIHdoaWNoIGlzIGFscmVhZHkgY2F1Z2h0IGVhcmxpZXIuCj4K
Cm9uZSB0aG91Z2h0Li4gc2luY2Ugd2l0aCBtZXNhK21hcmdlYm90IHdlIGVmZmVjdGl2ZWx5IGdl
dCBhdCBsZWFzdAp0d28oaXNoKSBDSSBydW5zIHBlciBNUiwgaWUuIG9uZSB3aGVuIGl0IGlzIGlu
aXRpYWxseSBwdXNoZWQsIGFuZCBvbmUKd2hlbiBtYXJnZWJvdCByZWJhc2VzIGFuZCB0cmllcyB0
byBtZXJnZSwgY291bGQgd2UgbGV2ZXJhZ2UgdGhpcyB0bwpoYXZlIHRyaW1tZWQgZG93biBwcmUt
bWFyZ2Vib3QgQ0kgd2hpY2ggdHJpZXMgdG8ganVzdCB0YXJnZXQgYWZmZWN0ZWQKZHJpdmVycywg
d2l0aCBtYXJnZWJvdCBkb2luZyBhIGZ1bGwgQ0kgcnVuICh3aGVuIGl0IGlzIHBvdGVudGlhbGx5
CmJhdGNoaW5nIHRvZ2V0aGVyIG11bHRpcGxlIE1Scyk/CgpTZWVtcyBsaWtlIGEgd2F5IHRvIHJl
ZHVjZSBvdXIgQ0kgcnVucyB3aXRoIGEgZ29vZCBzYWZldHkgbmV0IHRvCnByZXZlbnQgdGhpbmdz
IGZyb20gc2xpcHBpbmcgdGhyb3VnaCB0aGUgY3JhY2tzLgoKKE5vdCBzdXJlIGhvdyBtdWNoIHRo
YXQgd291bGQgaGVscCByZWR1Y2UgYmFuZHdpZHRoIGNvc3RzLCBidXQgSSBndWVzcwppdCBzaG91
bGQgaGVscCBhIGJpdC4pCgpCUiwKLVIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
