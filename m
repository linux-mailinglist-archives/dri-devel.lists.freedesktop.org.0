Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C8B91186
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:26:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80AD66EB42;
	Sat, 17 Aug 2019 15:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590F56E30C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 21:04:47 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id z3so8925301iog.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 14:04:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s2ZBxhaoOWF4XzyIdX2Kvd1IcJ2ogm2WPdSG/NZ+cHk=;
 b=V/PMyF/TyK3d7oxn1v+IW6D3qIkxg0V4vfq8VUo+NkX1JlAgGGCyGRos+nPqD6AY0H
 yITKV4PjufRGw0EDQqctIHaJof616aFkeZYNJlxILuBIgXrQnZtuMf55W7Z0/awV7XJj
 fjpYf5oSdEcGMbCzJHyhR7PipUEbvB+WMK0iPAV7ypmcMMwGZwEHVbxEfr+q/8rZLo0z
 1jd9wnYmnz4u+zku3ZLwwm5qz82RD72zV8+usQm/1vOHl7IAy0NgF9lulPb3iSZ9WXaF
 uBi3Asvt8Ke++xEzClkNRHMQKCDWRKtTqIh2OwC7cAEPSvvaMxgneH3b2QA/p/5/Tp74
 y0IA==
X-Gm-Message-State: APjAAAViXNU5epIxjFEjT01ammkhBvFoIRKNDb6gCVWMVKFS4qlNZ4kt
 cXKZ+cKc4lGFZa/Gic0mrhSnyB0fcKu49X17ASEUaQ==
X-Google-Smtp-Source: APXvYqwts082qPcfW8wQcKhac77m+kiLOKGgwLXDG/PpCvgImNQcMwgioRdTR9BSptcdU3ElXfdZLAB34kkoF2ZHZKA=
X-Received: by 2002:a5e:924d:: with SMTP id z13mr12554582iop.247.1565989486594; 
 Fri, 16 Aug 2019 14:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190814220011.26934-1-robdclark@gmail.com>
 <20190815065117.GA23761@lst.de>
 <CAJs_Fx4bS64s7+xQqsead3N80ZQpofqegFQu+tT=b3wcGd_2pA@mail.gmail.com>
 <20190815175346.GA19839@lst.de>
In-Reply-To: <20190815175346.GA19839@lst.de>
From: Rob Clark <robdclark@chromium.org>
Date: Fri, 16 Aug 2019 14:04:35 -0700
Message-ID: <CAJs_Fx6am7TeDFSG=CcTT=4KwhqrZX_jnn56NaWcDkGVizuakg@mail.gmail.com>
Subject: Re: [PATCH 0/6] drm+dma: cache support for arm, etc
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=s2ZBxhaoOWF4XzyIdX2Kvd1IcJ2ogm2WPdSG/NZ+cHk=;
 b=VV8Vh+knqRuk7GUG0+3pbm/YBPF2frCSqVFkN4P+uFmixSZ6gHA3fDaN4RsFw9h5CW
 2TmqnBG2qqz370eAeG53IhA7Zzjk6eSYUhoNdAdlHGWLJQfz3owLOgHbX3JGmMIO8WW+
 LJGMhINHoWDCJY1O7+5wM6fUKA1BZS+Jvfs3w=
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>,
 "Maciej W. Rozycki" <macro@linux-mips.org>, Eric Biggers <ebiggers@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Will Deacon <will@kernel.org>, Emil Velikov <emil.velikov@collabora.com>,
 Deepak Sharma <deepak.sharma@amd.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "moderated list:ARM64 PORT \(AARCH64 ARCHITECTURE\)"
 <linux-arm-kernel@lists.infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Joerg Roedel <jroedel@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, Jesper Dangaard Brouer <brouer@redhat.com>,
 "Wolfram Sang \(Renesas\)" <wsa+renesas@sang-engineering.com>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, Alexios Zavras <alexios.zavras@intel.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Doug Anderson <armlinux@m.disordat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, Allison Randal <allison@lohutok.net>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Enrico Weigelt <info@metux.net>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 open list <linux-kernel@vger.kernel.org>,
 Souptick Joarder <jrdr.linux@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMTA6NTMgQU0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBs
c3QuZGU+IHdyb3RlOgo+Cj4gT24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDY6NTQ6MzlBTSAtMDcw
MCwgUm9iIENsYXJrIHdyb3RlOgo+ID4gT24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMTE6NTEgUE0g
Q2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+IHdyb3RlOgo+ID4gPgo+ID4gPiBBcyBzYWlk
IGJlZm9yZSBJIGRvbid0IHRoaW5rIHRoZXNlIGxvdy1sZXZlbCBoZWxwZXJzIGFyZSB0aGUKPiA+
ID4gcmlnaHQgQVBJIHRvIGV4cG9ydCwgYnV0IGV2ZW4gaWYgdGhleSBkaWQgeW91J2QganVzdCBj
b3ZlciBhIHRpbnkKPiA+ID4gc3Vic2V0IG9mIHRoZSBhcmNoaXRlY3R1cmVzLgo+ID4KPiA+IEFy
ZSB5b3UgdGhpbmtpbmcgaW5zdGVhZCBzb21ldGhpbmcgbGlrZToKPiA+Cj4gPiB2b2lkIGRtYV9z
eW5jX3NnX2Zvcl97Y3B1LGRldmljZX0oc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3Qgc2NhdHRl
cmxpc3QgKnNnbCwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgbmVu
dHMsIGVudW0gZG1hX2RhdGFfZGlyZWN0aW9uIGRpcikKPiA+IHsKPiA+ICAgICBmb3JfZWFjaF9z
ZyhzZ2wsIHNnLCBuZW50cywgaSkgewo+ID4gICAgICAgICBhcmNoX3N5bmNfZG1hX2Zvcl8uLihk
ZXYsIHNnX3BoeXMoc2cpLCBzZy0+bGVuZ3RoLCBkaXIpOwo+ID4gICAgIH0KPiA+IH0KPiA+IEVY
UE9SVF9TWU1CT0xfR1BMKGRtYV9zeW5jX3NnX2Zvcl8uLikKPiA+Cj4gPiBvciBkaWQgeW91IGhh
dmUgc29tZXRoaW5nIGVsc2UgaW4gbWluZD8KPgo+IE5vLiAgV2UgcmVhbGx5IG5lZWQgYW4gaW50
ZXJmYWNlIHRoYXkgc2F5cyBwbGVhc2UgZ2l2ZSBtZSB1bmNhY2hlZAo+IG1lbW9yeSAoZm9yIHNv
bWUgZGVmaW5pdGlvbiBvZiB1bmNhY2hlZCB0aGF0IGluY2x1ZGVzIHRoYXQgZ3JhcGljcwo+IGRy
aXZlcnMgY2FsbCB3cml0ZSBjb21iaW5lKSwgYW5kIHRoZW4gbGV0IHRoZSBhcmNoaXRlY3R1cmUg
ZG8gdGhlIHJpZ2h0Cj4gdGhpbmcuICBCYXNpY2FsbHkgZG1hX2FsbG9jX2NvaGVyZW50IHdpdGgg
RE1BX0FUVFJfTk9fS0VSTkVMX01BUFBJTkcKPiBpcyBzdXBlcmZpY2lhbGx5IGNsb3NlIHRvIHdo
YXQgeW91IHdhbnQsIGV4Y2VwdCB0aGF0IHRoZSB3YXkgdGhlIGRybQo+IGRyaXZlcnMgd29yayB5
b3UgY2FuJ3QgYWN0dWFsbHkgdXNlIGl0LgoKSSBkb24ndCBkaXNhZ3JlZSBhYm91dCBuZWVkaW5n
IGFuIEFQSSB0byBnZXQgdW5jYWNoZWQgbWVtb3J5IChvcgppZGVhbGx5IGp1c3Qgc29tZXRoaW5n
IG91dHNpZGUgb2YgdGhlIGxpbmVhciBtYXApLiAgQnV0IEkgdGhpbmsgdGhpcwppcyBhIHNlcGFy
YXRlIHByb2JsZW0uCgpXaGF0IEkgd2FzIGhvcGluZyBmb3IsIGZvciB2NS40LCBpcyBhIHdheSB0
byBzdG9wIGFidXNpbmcgZG1hX21hcC9zeW5jCmZvciBjYWNoZSBvcHMgdG8gZ2V0IHJpZCBvZiB0
aGUgaGFjayBJIGhhZCB0byBtYWtlIGZvciB2NS4zLiAgQW5kIGFsc28KdG8gZml4IHZnZW0gb24g
bm9uLXg4Ni4gIChVbmZvcnR1bmF0ZWx5IGNoYW5naW5nIHZnZW0gdG8gdXNlZCBjYWNoZWQKbWFw
cGluZ3MgYnJlYWtzIHg4NiBDSSwgYnV0IGZpeGVzIENJIG9uIGFybS9hcm02NC4uKSAgV2UgY2Fu
IGRvIHRoYXQKd2l0aG91dCBhbnkgY2hhbmdlcyBpbiBhbGxvY2F0aW9uLiAgVGhlcmUgaXMgc3Rp
bGwgdGhlIHBvc3NpYmlsaXR5IGZvcgpwcm9ibGVtcyBkdWUgdG8gY2FjaGVkIGFsaWFzLCBidXQg
dGhhdCBoYXMgYmVlbiBhIHByb2JsZW0gdGhpcyB3aG9sZQp0aW1lLCBpdCBpc24ndCBzb21ldGhp
bmcgbmV3LgoKQlIsCi1SCgo+IFRoZSByZWFzb24gZm9yIHRoYXQgaXMgaWYgd2UgY2FuIHdlIHJl
YWxseSBuZWVkIHRvIG5vdCBjcmVhdGUgYW5vdGhlcgo+IHVuY2FjaGFibGUgYWxpYXMsIGJ1dCBp
bnN0ZWFkIGNoYW5nZSB0aGUgcGFnZSBhdHRyaWJ1dGVzIGluIHBsYWNlLgo+IE9uIHg4NiB3ZSBj
YW4gYW5kIG11c3QgZG8gdGhhdCBmb3IgZXhhbXBsZSwgYW5kIGJhc2VkIG9uIHRoZQo+IGNvbnZl
cnNhdGlvbiB3aXRoIFdpbGwgYXJtNjQgY291bGQgZG8gdGhhdCBmYWlybHkgZWFzaWx5LiAgYXJt
MzIgY2FuCj4gcmlnaHQgbm93IG9ubHkgZG8gdGhhdCBmb3IgQ01BLCB0aG91Z2guCj4KPiBUaGUg
YmlnIHF1ZXN0aW9uIGlzIHdoYXQgQVBJIGRvIHdlIHdhbnQuICBJIGhhZCBhIHByZXR0eSBzaW1p
bGFyCj4gZGlzY3Vzc2lvbiB3aXRoIENocmlzdGlhbiBvbiBkb2luZyBzdWNoIGFuIGFsbG9jYXRp
b24gZm9yIGFtZGdwdSwKPiB3aGVyZSB0aGUgZGV2aWNlIG5vcm1hbGx5IGlzIGNhY2hlIGNvaGVy
ZW50LCBidXQgdGhleSBhY3R1YWxseSB3YW50Cj4gdG8gdHVybiBpdCBpbnRvIG5vbi1jb2hlcmVu
dCBieSB1c2luZyBQQ0llIHVuc25vb3BlZCB0cmFuc2FjdGlvbnMuCj4KPiBIZXJlIGlzIG15IGhp
Z2ggbGV2ZWwgcGxhbiwgd2hpY2ggc3RpbGwgaGFzIGEgZmV3IGxvc2UgZW5kOgo+Cj4gICgxKSBw
cm92aWRlIGEgbmV3IEFQSToKPgo+ICAgICAgICAgc3RydWN0IHBhZ2UgKmRtYV9hbGxvY19wYWdl
cyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVkIG5yX3BhZ2VzLAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgIGdmcF90IGdmcCwgdW5zaWduZWQgbG9uZyBmbGFncyk7Cj4gICAgICAgICB2b2lk
IGRtYV9mcmVlX3BhZ2VzKHN0cnVjdCBkZXZpY2UgKmRldiwgdW5zaWduZWQgbnJfcGFnZXMsCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBmbGFncyk7Cj4KPiAgICAgIFRo
ZXNlIGdpdmUgeW91IGJhY2sgcGFnZSBiYWNrZWQgbWVtb3J5IHRoYXQgaXMgZ3VhcmFudGVlZCB0
byBiZQo+ICAgICAgYWRkcmVzc2FibGUgYnkgdGhlIGRldmljZSAobm8gc3dpb3RsYiBvciBzaW1p
bGFyKS4gIFRoZSBtZW1vcnkgY2FuCj4gICAgICB0aGVuIGJlIG1hcHBlZCB1c2luZyBkbWFfbWFw
KiwgaW5jbHVkaW5nIHVubWFwIGFuZCBkbWFfc3luYyB0bwo+ICAgICAgYm91bmNlIG93bmVyc2hp
cCBhcm91bmQuICBUaGlzIGlzIHRoZSByZXBsYWNlbWVudCBmb3IgdGhlIGN1cnJlbnQKPiAgICAg
IGRtYV9hbGxvY19hdHRycyB3aXRoIERNQV9BVFRSX05PTl9DT05TSVNURU5UIEFQSSwgdGhhdCBp
cyByYXRoZXIKPiAgICAgIGJhZGx5IGRlZmluZWQuCj4KPiAgKDIpIEFkZCBzdXBwb3J0IGZvciBE
TUFfQVRUUl9OT19LRVJORUxfTUFQUElORyB0byB0aGlzIG5ldyBBUEkgaW5zdGVhZAo+ICAgICAg
b2YgZG1hX2FsbG9jX2F0dHJzLiAgVGhlIGluaXRpYWwgZGlmZmVyZW5jZSB3aXRoIHRoYXQgZmxh
ZyBpcyBqdXN0Cj4gICAgICB0aGF0IHdlIGFsbG93IGhpZ2htZW0sIGJ1dCBpbiB0aGUgZnV0dXJl
IHdlIGNvdWxkIGFsc28gdW5tYXAgdGhpcwo+ICAgICAgbWVtb3J5IGZyb20gdGhlIGtlcm5lbCBs
aW5lYXIgbWFwcGluZyBlbnRpcmVseSBvbiBhcmNoaXRlY3R1cmVzCj4gICAgICB3aGVyZSB3ZSBj
YW4gZWFzaWx5IGRvIHRoYXQuCj4KPiAgKDMpIEFkZCBhIGRtYV9wYWdlc19tYXAvZG1hX3BhZ2Vz
X3VubWFwIG9yIHNpbWlsYXIgQVBJIHRoYXQgYWxsb3dzIHlvdQo+ICAgICAgdG8gZ2V0IGEga2Vy
bmVsIG1hcHBpbmcgZm9yIHBhcnRzIG9yIGFsbCBvZiBhCj4gICAgICBETUFfQVRUUl9OT19LRVJO
RUxfTUFQUElORyBhbGxvY2F0aW9uLiAgVGhpcyBpcyB0byByZXBsYWNlIHRoaW5ncwo+ICAgICAg
bGlrZSB5b3VyIG9wZW4tY29kZWQgdm1hcCBpbiBtc20gKG9yIHNpbWlsYXJseSBlbHNld2hlcmUg
aW4gZG1hLWJ1Zgo+ICAgICAgcHJvdmlkZXJzKS4KPgo+ICAoNCkgQWRkIHN1cHBvcnQgZm9yIGEg
RE1BX0FUVFJfVU5DQUNIQUJMRSBmbGFncyAob3Igc2ltaWxhcikgdG8gdGhlIG5ldwo+ICAgICAg
QVBJLCB0aGF0IG1hcHMgdGhlIHBhZ2VzIGFzIHVuY2FjaGFibGUgaWZmIHRoZXkgaGF2ZSBhIGtl
cm5lbAo+ICAgICAgbWFwcGluZywgaW5jbHVkaW5nIGludmFsaWRhdGluZyB0aGUgY2FjaGVzIGF0
IHRpbWUgb2YgdGhpcyBwYWdlCj4gICAgICBhdHRyaWJ1dGUgY2hhbmdlIChvciBjcmVhdGlvbiBv
ZiBhIG5ldyBtYXBwaW5nKS4gIFRoaXMgQVBJIHdpbGwgZmFpbAo+ICAgICAgaWYgdGhlIGFyY2hp
dGVjdHVyZSBkb2VzIG5vdCBhbGxvdyBpbi1wbGFjZSByZW1hcHBpbmcuICBOb3RlIHRoYXQgZm9y
Cj4gICAgICBhcm0zMiB3ZSBjb3VsZCBhbHdheXMgZGlwIGludG8gdGhlIENNQSBwb29sIGlmIG9u
ZSBpcyBwcmVzZW50IHRvIG5vdAo+ICAgICAgZmFpbC4gIFdlJ2xsIGFsc28gbmVlZCBzb21lIGhl
bHBlciB0byBtYXAgZnJvbSB0aGUgRE1BX0FUVFJfKiBmbGFncwo+ICAgICAgdG8gYSBwZ3Byb3Qg
Zm9yIG1hcHBpbmcgdGhlIHBhZ2UgdG8gdXNlcnNwYWNlLiAgVGhlcmUgaXMgYWxzbyBhIGZldwo+
ICAgICAgb3RoZXIgd2VpcmQgYml0cyBoZXJlLCBlLmcuIG9uIGFyY2hpdGVjdHVyZXMgbGlrZSBt
aXBzIHRoYXQgdXNlIGFuCj4gICAgICB1bmNhY2hlZCBzZWdtZW50IHdlJ2xsIGhhdmUgdG8gZmFp
bCB1c2Ugd2l0aCB0aGUgcGxhaW4KPiAgICAgIERNQV9BVFRSX1VOQ0FDSEFCTEUgZmxhZywgYnV0
IGl0IGNvdWxkIGJlIHN1cHBvcnRlZCB3aXRoCj4gICAgICBETUFfQVRUUl9VTkNBQ0hBQkxFIHwg
RE1BX0FUVFJfTk9fS0VSTkVMX01BUFBJTkcuCj4KPiBJIHdhcyBob3BpbmcgdG8gZ2V0IG1vc3Qg
b2YgdGhpcyBkb25lIGZvciB0aGlzIG1lcmdlIHdpbmRvdywgYnV0IEknbQo+IHByb2JhYmx5IGx1
Y2t5IGlmIEkgZ2V0IGF0IGxlYXN0IHBhcnRzIGRvbmUuICBUb28gbXVjaCBkaXN0cmFjdGlvbi4K
Pgo+ID4gSG1tLCBub3QgZW50aXJlbHkgc3VyZSB3aHkuLiB5b3Ugc2hvdWxkIGJlIG9uIHRoZSBj
YyBsaXN0IGZvciBlYWNoCj4gPiBpbmRpdmlkdWFsIHBhdGNoLgo+Cj4gVGhleSBmaW5hbGx5IG1h
ZGUgaXQsIGFsdGhvdWdoIGV2ZW4gd2l0aCB0aGUgZGVsYXkgdGhleSBvbmx5IGVuZGVkIHVwCj4g
aW4gdGhlIHNwYW0gbWFpbGJveC4gIEkgc3RpbGwgY2FuJ3Qgc2VlIHRoZW0gb24gdGhlIHZhcmlv
dXMgbWFpbGluZwo+IGxpc3RzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
