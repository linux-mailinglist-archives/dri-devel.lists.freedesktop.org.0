Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41231B1BF1
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 13:05:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FEF36EF13;
	Fri, 13 Sep 2019 11:05:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A766EF13
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 11:05:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1CBED10C0929;
 Fri, 13 Sep 2019 11:05:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6DB91608C2;
 Fri, 13 Sep 2019 11:05:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 71D0445CD; Fri, 13 Sep 2019 13:05:44 +0200 (CEST)
Date: Fri, 13 Sep 2019 13:05:44 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [RFC PATCH] drm/virtio: Export resource handles via DMA-buf API
Message-ID: <20190913110544.htmslqt4yzejugs4@sirius.home.kraxel.org>
References: <20190912094121.228435-1-tfiga@chromium.org>
 <20190912123821.rraib5entkcxt5p5@sirius.home.kraxel.org>
 <CAAFQd5AFXfu7ysFCi1XQS61DK8nbSk5-=UHkvpYWDtFae5YQ6Q@mail.gmail.com>
 <20190913080707.unhyoezesvfhx5np@sirius.home.kraxel.org>
 <CAAFQd5BUKdWkp7zvhLHyY+rjcwVLYXk1NKsrrfhoOHT_68T==Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAFQd5BUKdWkp7zvhLHyY+rjcwVLYXk1NKsrrfhoOHT_68T==Q@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Fri, 13 Sep 2019 11:05:46 +0000 (UTC)
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
Cc: Zach Reizner <zachr@chromium.org>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 Keiichi Watanabe <keiichiw@chromium.org>, stevensd@chromium.org,
 =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>,
 Pawel Osciak <posciak@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gPiBOby4gIERNQSBtYXN0ZXIgYWRkcmVzcyBzcGFjZSBpbiB2aXJ0dWFsIG1hY2hp
bmVzIGlzIHByZXR0eSBtdWNoIHRoZQo+ID4gc2FtZSBpdCBpcyBvbiBwaHlzaWNhbCBtYWNoaW5l
cy4gIFNvLCBvbiB4ODYgd2l0aG91dCBpb21tdSwgaWRlbnRpY2FsCj4gPiB0byAoZ3Vlc3QpIHBo
eXNpY2FsIGFkZHJlc3Mgc3BhY2UuICBZb3UgY2FuJ3QgcmUtZGVmaW5lIGl0IGxpa2UgdGhhdC4K
PiAKPiBUaGF0J3Mgbm90IHRydWUuIEV2ZW4gb24geDg2IHdpdGhvdXQgaW9tbXUgdGhlIERNQSBh
ZGRyZXNzIHNwYWNlIGNhbgo+IGJlIGRpZmZlcmVudCBmcm9tIHRoZSBwaHlzaWNhbCBhZGRyZXNz
IHNwYWNlLgoKT24gYSBzdGFuZGFyZCBwYyAobGlrZSB0aGUgb25lcyBlbXVsYXRlZCBieSBxZW11
KSB0aGF0IGlzIHRoZSBjYXNlLgpJdCdzIGRpZmZlcmVudCBvbiAheDg2LCBpdCBhbHNvIGNoYW5n
ZXMgd2l0aCBhIGlvbW11IGJlaW5nIHByZXNlbnQuCgpCdXQgdGhhdCBpcyBub3QgdGhlIG1haW4g
cG9pbnQgaGVyZS4gIFRoZSBwb2ludCBpcyB0aGUgZG1hIG1hc3RlcgphZGRyZXNzIGFscmVhZHkg
aGFzIGEgZGVmaW5pdGlvbiBhbmQgeW91IGNhbid0IHNpbXBseSBjaGFuZ2UgdGhhdC4KCj4gVGhh
dCBjb3VsZCBiZSBzdGlsbCBqdXN0Cj4gYSBzaW1wbGUgYWRkaXRpb24vc3VidHJhY3Rpb24gYnkg
Y29uc3RhbnQsIGJ1dCBzdGlsbCwgdGhlIHR3byBhcmUKPiBleHBsaWNpdGx5IGRlZmluZWQgd2l0
aG91dCBhbnkgZ3VhcmFudGVlcyBhYm91dCBhIHNpbXBsZSBtYXBwaW5nCj4gYmV0d2VlbiBvbmUg
b3IgYW5vdGhlciBleGlzdGluZy4KClN1cmUuCgo+ICJBIENQVSBjYW5ub3QgcmVmZXJlbmNlIGEg
ZG1hX2FkZHJfdCBkaXJlY3RseSBiZWNhdXNlIHRoZXJlIG1heSBiZQo+IHRyYW5zbGF0aW9uIGJl
dHdlZW4gaXRzIHBoeXNpY2FsCj4gYWRkcmVzcyBzcGFjZSBhbmQgdGhlIERNQSBhZGRyZXNzIHNw
YWNlLiIKCkFsc28gbm90ZSB0aGF0IGRtYSBhZGRyZXNzIHNwYWNlIGlzIGRldmljZS1zcGVjaWZp
Yy4gIEluIGNhc2UgYSBpb21tdQppcyBwcmVzZW50IGluIHRoZSBzeXN0ZW0geW91IGNhbiBoYXZl
ICptdWx0aXBsZSogZG1hIGFkZHJlc3Mgc3BhY2VzLApzZXBhcmF0aW5nIChncm91cHMgb2YpIGRl
dmljZXMgZnJvbSBlYWNoIG90aGVyLiAgU28gcGFzc2luZyBhIGRtYQphZGRyZXNzIGZyb20gb25l
IGRldmljZSB0byBhbm90aGVyIGlzbid0IGdvaW5nIHRvIHdvcmsuCgo+ID4gPiBIb3dldmVyLCB3
ZSBjb3VsZCBhcyB3ZWxsIGludHJvZHVjZSBhIHNlcGFyYXRlIERNQSBhZGRyZXNzCj4gPiA+IHNw
YWNlIGlmIHJlc291cmNlIGhhbmRsZXMgYXJlIG5vdCB0aGUgcmlnaHQgd2F5IHRvIHJlZmVyIHRv
IHRoZSBtZW1vcnkKPiA+ID4gZnJvbSBvdGhlciB2aXJ0aW8gZGV2aWNlcy4KPiA+Cj4gPiBzL290
aGVyIHZpcnRpbyBkZXZpY2VzL290aGVyIGRldmljZXMvCj4gPgo+ID4gZG1hLWJ1ZnMgYXJlIGZv
ciBidWZmZXIgc2hhcmluZyBiZXR3ZWVuIGRldmljZXMsIG5vdCBsaW1pdGVkIHRvIHZpcnRpby4K
PiA+IFlvdSBjYW4ndCByZS1kZWZpbmUgdGhhdCBpbiBzb21lIHZpcnRpby1zcGVjaWZpYyB3YXku
Cj4gPgo+IAo+IFdlIGRvbid0IG5lZWQgdG8gbGltaXQgdGhpcyB0byB2aXJ0aW8gZGV2aWNlcyBv
bmx5LiBJbiBmYWN0IEkgYWN0dWFsbHkKPiBmb3Jlc2VlIHRoaXMgaGF2aW5nIGEgdXNlIGNhc2Ug
d2l0aCB0aGUgZW11bGF0ZWQgVVNCIGhvc3QgY29udHJvbGxlciwKPiB3aGljaCBpc24ndCBhIHZp
cnRpbyBkZXZpY2UuCgpXaGF0IGV4YWN0bHk/Cgo+IFRoYXQgc2FpZCwgSSBkZWxpYmVyYXRlbHkg
cmVmZXJyZWQgdG8gdmlydGlvIHRvIGtlZXAgdGhlIHNjb3BlIG9mIHRoZQo+IHByb2JsZW0gaW4g
Y29udHJvbC4gSWYgdGhlcmUgaXMgYSBzb2x1dGlvbiB0aGF0IGNvdWxkIHdvcmsgd2l0aG91dAo+
IHN1Y2ggYXNzdW1wdGlvbiwgSSdtIG1vcmUgdGhhbiBvcGVuIHRvIGRpc2N1c3MgaXQsIG9mIGNv
dXJzZS4KCkJ1dCBpdCBtaWdodCBsZWFkIHRvIHRha2luZyB2aXJ0aW8tc3BlY2lmaWMgKG9yIHZp
cnR1YWxpemF0aW9uLXNwZWNpZmljKQpzaG9ydGN1dHMgd2hpY2ggd2lsbCBodXJ0IGluIHRoZSBs
b25nIHJ1biAuLi4KCj4gQXMgcGVyIG15IHVuZGVyc3RhbmRpbmcgb2YgdGhlIERNQSBhZGRyZXNz
LCBhbnl0aGluZyB0aGF0IGxldHMgdGhlIERNQQo+IG1hc3RlciBhY2Nlc3MgdGhlIHRhcmdldCBt
ZW1vcnkgd291bGQgcXVhbGlmeSBhbmQgdGhlcmUgd291bGQgYmUgbm8KPiBuZWVkIGZvciBhbiBJ
T01NVSBpbiBiZXR3ZWVuLgoKWWVzLiAgQnV0IHRoYXQgRE1BIGFkZHJlc3MgaXMgYWxyZWFkeSBk
ZWZpbmVkIGJ5IHRoZSBwbGF0Zm9ybSwgeW91IGNhbid0CmZyZWVseSByZS1kZWZpbmUgaXQuICBX
ZWxsLCB5b3Ugc29ydC1vZiBjYW4gd2hlbiB5b3UgZGVzaWduIHlvdXIgb3duCnZpcnR1YWwgaW9t
bXUgZm9yIHFlbXUuICBCdXQgZXZlbiB0aGVuIHlvdSBjYW4ndCBqdXN0IHBhc3MgYXJvdW5kIG1h
Z2ljCmNvb2tpZXMgbWFzcXVlcmFkZWQgYXMgZG1hIGFkZHJlc3MuICBZb3UgaGF2ZSB0byBtYWtl
IHN1cmUgdGhleSBhY3R1YWxseQpmb3JtIGFuIGFkZHJlc3Mgc3BhY2UsIHdpdGhvdXQgYnVmZmVy
cyBvdmVybGFwcGluZywgLi4uCgo+IEV4YWN0bHkuIFRoZSB2ZXJ5IHNwZWNpZmljIGZpcnN0IHNj
ZW5hcmlvIHRoYXQgd2Ugd2FudCB0byBzdGFydCB3aXRoCj4gaXMgYWxsb2NhdGluZyBob3N0IG1l
bW9yeSB0aHJvdWdoIHZpcnRpby1ncHUgYW5kIHVzaW5nIHRoYXQgbWVtb3J5Cj4gYm90aCBhcyBv
dXRwdXQgb2YgYSB2aWRlbyBkZWNvZGVyIGFuZCBhcyBpbnB1dCAodGV4dHVyZSkgdG8gVmlyZ2ls
M0QuCj4gVGhlIG1lbW9yeSBuZWVkcyB0byBiZSBzcGVjaWZpY2FsbHkgYWxsb2NhdGVkIGJ5IHRo
ZSBob3N0IGFzIG9ubHkgdGhlCj4gaG9zdCBjYW4ga25vdyB0aGUgcmVxdWlyZW1lbnRzIGZvciBt
ZW1vcnkgYWxsb2NhdGlvbiBvZiB0aGUgdmlkZW8KPiBkZWNvZGUgYWNjZWxlcmF0b3IgaGFyZHdh
cmUuCgpTbyB5b3UgcHJvYmFibHkgaGF2ZSBzb21lIHZpcnRpby12aWRlby1kZWNvZGVyLiAgWW91
IGFsbG9jYXRlIGEgZ3B1CmJ1ZmZlciwgZXhwb3J0IGl0IGFzIGRtYS1idWYsIGltcG9ydCBpdCBp
bnRvIHRoZSBkZWNvZGVyLCB0aGVuIGxldCB0aGUKdmlkZW8gZGVjb2RlciByZW5kZXIgdG8gaXQu
ICBSaWdodD8KClVzaW5nIGRtYWJ1ZnMgbWFrZXMgc2Vuc2UgZm9yIHN1cmUuICBCdXQgd2UgbmVl
ZCBhbiBzZXBhcmF0ZSBmaWVsZCBpbgpzdHJ1Y3QgZG1hX2J1ZiBmb3IgYW4gKG9wdGlvbmFsKSBo
b3N0IGRtYWJ1ZiBpZGVudGlmaWVyLCB3ZSBjYW4ndCBqdXN0CmhpamFjayB0aGUgZG1hIGFkZHJl
c3MuCgpjaGVlcnMsCiAgR2VyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
