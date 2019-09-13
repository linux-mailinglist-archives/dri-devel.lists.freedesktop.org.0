Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B50B3B1950
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 10:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B1D66EEC6;
	Fri, 13 Sep 2019 08:07:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61CB36EEC6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 08:07:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C7EFF30655F9;
 Fri, 13 Sep 2019 08:07:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E23360C63;
 Fri, 13 Sep 2019 08:07:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6171A9D75; Fri, 13 Sep 2019 10:07:07 +0200 (CEST)
Date: Fri, 13 Sep 2019 10:07:07 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [RFC PATCH] drm/virtio: Export resource handles via DMA-buf API
Message-ID: <20190913080707.unhyoezesvfhx5np@sirius.home.kraxel.org>
References: <20190912094121.228435-1-tfiga@chromium.org>
 <20190912123821.rraib5entkcxt5p5@sirius.home.kraxel.org>
 <CAAFQd5AFXfu7ysFCi1XQS61DK8nbSk5-=UHkvpYWDtFae5YQ6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAFQd5AFXfu7ysFCi1XQS61DK8nbSk5-=UHkvpYWDtFae5YQ6Q@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Fri, 13 Sep 2019 08:07:09 +0000 (UTC)
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

ICBIaSwKCj4gPiA+IFRvIHNlYW1sZXNzbHkgZW5hYmxlIGJ1ZmZlciBzaGFyaW5nIHdpdGggZHJp
dmVycyB1c2luZyBzdWNoIGZyYW1ld29ya3MsCj4gPiA+IG1ha2UgdGhlIHZpcnRpby1ncHUgZHJp
dmVyIGV4cG9zZSB0aGUgcmVzb3VyY2UgaGFuZGxlIGFzIHRoZSBETUEgYWRkcmVzcwo+ID4gPiBv
ZiB0aGUgYnVmZmVyIHJldHVybmVkIGZyb20gdGhlIERNQS1idWYgbWFwcGluZyBvcGVyYXRpb24u
ICBBcmd1YWJseSwgdGhlCj4gPiA+IHJlc291cmNlIGhhbmRsZSBpcyBhIGtpbmQgb2YgRE1BIGFk
ZHJlc3MgYWxyZWFkeSwgYXMgaXQgaXMgdGhlIGJ1ZmZlcgo+ID4gPiBpZGVudGlmaWVyIHRoYXQg
dGhlIGRldmljZSBuZWVkcyB0byBhY2Nlc3MgdGhlIGJhY2tpbmcgbWVtb3J5LCB3aGljaCBpcwo+
ID4gPiBleGFjdGx5IHRoZSBzYW1lIHJvbGUgYSBETUEgYWRkcmVzcyBwcm92aWRlcyBmb3IgbmF0
aXZlIGRldmljZXMuCj4gCj4gRmlyc3Qgb2YgYWxsLCB0aGFua3MgZm9yIHRha2luZyBhIGxvb2sg
YXQgdGhpcy4KPiAKPiA+IE5vLiAgQSBzY2F0dGVyIGxpc3QgaGFzIGd1ZXN0IGRtYSBhZGRyZXNz
ZXMsIHBlcmlvZC4gIFN0dWZmaW5nIHNvbWV0aGluZwo+ID4gZWxzZSBpbnRvIGEgc2NhdHRlcmxp
c3QgaXMgYXNraW5nIGZvciB0cm91YmxlLCB0aGluZ3Mgd2lsbCBnbyBzZXJpb3VzbHkKPiA+IHdy
b25nIHdoZW4gc29tZW9uZSB0cmllcyB0byB1c2Ugc3VjaCBhIGZha2Ugc2NhdHRlcmxpc3QgYXMg
cmVhbCBzY2F0dGVybGlzdC4KPiAKPiBXaGF0IGlzIGEgImd1ZXN0IGRtYSBhZGRyZXNzIj8gVGhl
IGRlZmluaXRpb24gb2YgYSBETUEgYWRkcmVzcyBpbiB0aGUKPiBMaW51eCBETUEgQVBJIGlzIGFu
IGFkZHJlc3MgaW50ZXJuYWwgdG8gdGhlIERNQSBtYXN0ZXIgYWRkcmVzcyBzcGFjZS4KPiBGb3Ig
dmlydGlvLCB0aGUgcmVzb3VyY2UgaGFuZGxlIG5hbWVzcGFjZSBtYXkgYmUgc3VjaCBhbiBhZGRy
ZXNzCj4gc3BhY2UuCgpOby4gIERNQSBtYXN0ZXIgYWRkcmVzcyBzcGFjZSBpbiB2aXJ0dWFsIG1h
Y2hpbmVzIGlzIHByZXR0eSBtdWNoIHRoZQpzYW1lIGl0IGlzIG9uIHBoeXNpY2FsIG1hY2hpbmVz
LiAgU28sIG9uIHg4NiB3aXRob3V0IGlvbW11LCBpZGVudGljYWwKdG8gKGd1ZXN0KSBwaHlzaWNh
bCBhZGRyZXNzIHNwYWNlLiAgWW91IGNhbid0IHJlLWRlZmluZSBpdCBsaWtlIHRoYXQuCgo+IEhv
d2V2ZXIsIHdlIGNvdWxkIGFzIHdlbGwgaW50cm9kdWNlIGEgc2VwYXJhdGUgRE1BIGFkZHJlc3MK
PiBzcGFjZSBpZiByZXNvdXJjZSBoYW5kbGVzIGFyZSBub3QgdGhlIHJpZ2h0IHdheSB0byByZWZl
ciB0byB0aGUgbWVtb3J5Cj4gZnJvbSBvdGhlciB2aXJ0aW8gZGV2aWNlcy4KCnMvb3RoZXIgdmly
dGlvIGRldmljZXMvb3RoZXIgZGV2aWNlcy8KCmRtYS1idWZzIGFyZSBmb3IgYnVmZmVyIHNoYXJp
bmcgYmV0d2VlbiBkZXZpY2VzLCBub3QgbGltaXRlZCB0byB2aXJ0aW8uCllvdSBjYW4ndCByZS1k
ZWZpbmUgdGhhdCBpbiBzb21lIHZpcnRpby1zcGVjaWZpYyB3YXkuCgo+ID4gQWxzbyBub3RlIHRo
YXQgInRoZSBETUEgYWRkcmVzcyBvZiB0aGUgYnVmZmVyIiBpcyBib25rZXJzIGluIHZpcnRpby1n
cHUKPiA+IGNvbnRleHQuICB2aXJ0aW8tZ3B1IHJlc291cmNlcyBhcmUgbm90IHJlcXVpcmVkIHRv
IGJlIHBoeXNpY2FsbHkKPiA+IGNvbnRpZ291cyBpbiBtZW1vcnksIHNvIHR5cGljYWxseSB5b3Ug
YWN0dWFsbHkgbmVlZCBhIHNjYXR0ZXIgbGlzdCB0bwo+ID4gZGVzY3JpYmUgdGhlbS4KPiAKPiBU
aGVyZSBpcyBubyBzdWNoIHJlcXVpcmVtZW50IGV2ZW4gb24gYSBiYXJlIG1ldGFsIHN5c3RlbSwg
c2VlIGFueQo+IHN5c3RlbSB0aGF0IGhhcyBhbiBJT01NVSwgd2hpY2ggaXMgdHlwaWNhbCBvbiBB
Uk0vQVJNNjQuIFRoZSBETUEKPiBhZGRyZXNzIHNwYWNlIG11c3QgYmUgY29udGlndW91cyBvbmx5
IGZyb20gdGhlIERNQSBtYXN0ZXIgcG9pbnQgb2YKPiB2aWV3LgoKWWVzLCB0aGUgaW9tbXUgKGlm
IHByZXNlbnQpIGNvdWxkIHJlbWFwIHlvdXIgc2NhdHRlcmxpc3QgdGhhdCB3YXkuICBZb3UKY2Fu
J3QgZGVwZW5kIG9uIHRoYXQgdGhvdWdoLgoKV2hhdCBpcyB0aGUgcGxhbiBoZXJlPyAgSG9zdC1z
aWRlIGJ1ZmZlciBzaGFyaW5nIEkgZ3Vlc3M/ICBTbyB5b3UgYXJlCmxvb2tpbmcgZm9yIHNvbWUg
d2F5IHRvIHBhc3MgYnVmZmVyIGhhbmRsZXMgZnJvbSB0aGUgZ3Vlc3QgdG8gdGhlIGhvc3QsCmV2
ZW4gaW4gY2FzZSB0aG9zZSBidWZmZXJzIGFyZSBub3QgY3JlYXRlZCBieSB5b3VyIGRyaXZlciBi
dXQgaW1wb3J0ZWQKZnJvbSBzb21ld2hlcmUgZWxzZT8KCmNoZWVycywKICBHZXJkCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
