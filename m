Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 756A45B1EF
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 23:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 317B689DFE;
	Sun, 30 Jun 2019 21:05:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A42B89D2E;
 Sun, 30 Jun 2019 21:05:38 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id m10so19201256edv.6;
 Sun, 30 Jun 2019 14:05:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nWkSzfQwWe28Oid571VUDPT1j3jqJiizt+sPBUmyYXc=;
 b=CwwYMF7h9lB9MVfyfNc3WDDTypIK/Kn13uk0J/VqTv8vseJdDJhbjI0Co9fTn/vhbK
 1OEIw69o6A2RiEpX4oPLw4O+WD6akHpAEVZHvXS8FHOOPZbou2PscTHsLs3a+iGWuTBq
 xhUymxFAT0OsN3FkSeq700tHk3DiAYgDq4Yrin3syXg4TohXfSolrx+8YuWQQPJoMDQI
 X8lZZiROctq+jGgfzkAakJKB52KSmL2vqI6Q58g1L8uW6SMIVG9Yaw9lXX3fX7w0qhMw
 +rAYMvgd+1xW/p5j5e3ajiMQW8bLKH96uHaGzEykGqTVOr/sa8PSXOg4rliZYVp3jmnd
 7Dzg==
X-Gm-Message-State: APjAAAXe0WozkSbkgn9H99eVjMNf9Y6420nNZahdu9NRu3k0PUcdiBNW
 D5ycFltGi144UOiFkVhRJiaJXkZiv+BqKxE4NjM=
X-Google-Smtp-Source: APXvYqyQ0wkKlgKDPqKrVBswiHBd8q2VTYiTxeXwUHkwUHPU3FRmk6Q91V6nRILqCyOCnPwhUWrbZa4ZFHhJIU1RIK8=
X-Received: by 2002:a17:906:f85:: with SMTP id
 q5mr18711715ejj.192.1561928737016; 
 Sun, 30 Jun 2019 14:05:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190630203614.5290-1-robdclark@gmail.com>
 <20190630204723.GH7043@pendragon.ideasonboard.com>
In-Reply-To: <20190630204723.GH7043@pendragon.ideasonboard.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 30 Jun 2019 14:05:21 -0700
Message-ID: <CAF6AEGvA-wVyC4jJC-nZU-pdVH=KYtye9twDgup-Nq0C_+wtvQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm+dt+efi: support devices with multiple possible
 panels
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=nWkSzfQwWe28Oid571VUDPT1j3jqJiizt+sPBUmyYXc=;
 b=usPdyelnSi4jYetKhxTjSp/C2Q/tSyY8vTWVz/sIz0yvDaZBJ4EdBe/mK0qEldHi3S
 44UE591gyw85bU15D17RNz4Xsc21haFCBRfg/ApmA3FtCoLOxsj4a58gKbgiS7sWDUxj
 v+9OECxNgNMECzxJXN0Q7AIAhZBOTQEKynq9Pp8Nt6ZxVU8lYTzbwu2dBnvt13Ev+6E1
 8NNOVzv4Y6InY8NZf8H0qzlFSngI8tO0e/DO6QlSi6qH9eqXtIScDtnrUsDIPRYAV2hd
 TTXgBe/RHYEmqX/1n7ZEwwr9uHpsbWwgiisrGDAg26d6gjCjOcXgcmV6awhVUrBETPO5
 AtTw==
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
Cc: Rob Clark <robdclark@chromium.org>, aarch64-laptops@lists.linaro.org,
 "open list:EXTENSIBLE FIRMWARE INTERFACE \(EFI\)"
 <linux-efi@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Julien Thierry <julien.thierry@arm.com>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 freedreno <freedreno@lists.freedesktop.org>, Ingo Molnar <mingo@kernel.org>,
 Steve Capper <steve.capper@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdW4gMzAsIDIwMTkgYXQgMTo0NyBQTSBMYXVyZW50IFBpbmNoYXJ0CjxsYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgo+Cj4gSGkgUm9iLAo+Cj4gVGhhbmsg
eW91IGZvciB0aGUgcGF0Y2guCj4KPiBPbiBTdW4sIEp1biAzMCwgMjAxOSBhdCAwMTozNjowNFBN
IC0wNzAwLCBSb2IgQ2xhcmsgd3JvdGU6Cj4gPiBGcm9tOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0Bj
aHJvbWl1bS5vcmc+Cj4gPgo+ID4gTm93IHRoYXQgd2UgY2FuIGRlYWwgZ3JhY2VmdWxseSB3aXRo
IGJvb3Rsb2FkZXIgKGZpcm13YXJlKSBpbml0aWFsaXplZAo+ID4gZGlzcGxheSBvbiBhYXJjaDY0
IGxhcHRvcHNbMV0sIHRoZSBuZXh0IHN0ZXAgaXMgdG8gZGVhbCB3aXRoIHRoZSBmYWN0Cj4gPiB0
aGF0IHRoZSBzYW1lIG1vZGVsIG9mIGxhcHRvcCBjYW4gaGF2ZSBvbmUgb2YgbXVsdGlwbGUgZGlm
ZmVyZW50IHBhbmVscy4KPiA+IChGb3IgdGhlIHlvZ2EgYzYzMCB0aGF0IEkgaGF2ZSwgSSBrbm93
IG9mIGF0IGxlYXN0IHR3byBwb3NzaWJsZSBwYW5lbHMsCj4gPiB0aGVyZSBtaWdodCBiZSBhIHRo
aXJkLikKPgo+IEkgaGF2ZSB0byBhc2sgdGhlIG9idmlvdXMgcXVlc3Rpb246IHdoeSBkb2Vzbid0
IHRoZSBib290IGxvYWRlciBqdXN0Cj4gcGFzcyBhIGNvcnJlY3QgRFQgdG8gTGludXggPyBUaGVy
ZSdzIG5vIHBvaW50IGluIHBhc3NpbmcgYSBsaXN0IG9mCj4gcGFuZWxzIHRoYXQgYXJlIG5vdCB0
aGVyZSwgdGhpcyBzZWVtcyBxdWl0ZSBhIGJpZyBoYWNrIHRvIG1lLiBBIHByb3Blcgo+IGJvb3Qg
bG9hZGVyIHNob3VsZCBjb25zdHJ1Y3QgdGhlIERUIGJhc2VkIG9uIGhhcmR3YXJlIGRldGVjdGlv
bi4KCkhpIExhdXJlbnQsCgpBY3R1YWxseSB0aGUgYm9vdGxvYWRlciBvbiB0aGVzZSBkZXZpY2Vz
IGlzIHBhc3NpbmcgKm5vKiBkdCAodGhleSBib290CkFDUEksIHdlIGFyZSBsb2FkaW5nIGR0YiBm
cm9tIGdydWIgY3VycmVudGx5KQoKSSB0aGluayBub3JtYWxseSBhIGRldmljZSBidWlsdCB3LyBk
dCBpbiBtaW5kIHdvdWxkIHBvcHVsYXRlCi9jaG9zZW4vcGFuZWwtaWQgZGlyZWN0bHkgKHJhdGhl
ciB0aGFuIHRoZSB3YXkgaXQgaXMgY3VycmVudGx5CnBvcHVsYXRlZCBiYXNlZCBvbiByZWFkaW5n
IGFuIGVmaSB2YXJpYWJsZSBwcmlvciB0byBFeGl0Qm9vdFNlcnZpY2VzKS4KQnV0IHRoYXQgaXMg
Y29uc2lkZXJhYmx5IGVhc2llciBhc2sgdGhhbiBoYXZpbmcgaXQgcmUtd3JpdGUgb2ZfZ3JhcGgK
YmluZGluZ3MuICBFaXRoZXIgd2F5LCB3ZSBhcmVuJ3QgaW4gY29udHJvbCBvZiB0aGUgYm9vdGxv
YWRlciBvbiB0aGVzZQpkZXZpY2VzLCBzbyBpdCBpcyBhIG1hdHRlciBvZiBjb21pbmcgdXAgd2l0
aCBzb21ldGhpbmcgdGhhdCB3b3JrcyBvbgphY3R1YWwgaHcgdGhhdCB3ZSBkb24ndCBsaWtlIHJh
dGhlciB0aGFuIGlkZWFsaXplZCBodyB0aGF0IHdlIGRvbid0CmhhdmUgOy0pCgpCUiwKLVIKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
