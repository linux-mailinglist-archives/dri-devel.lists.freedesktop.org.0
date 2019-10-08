Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 918FFD07FF
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 09:13:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F806E904;
	Wed,  9 Oct 2019 07:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505EF6E878
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 17:00:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6F213B1FF;
 Tue,  8 Oct 2019 17:00:56 +0000 (UTC)
Date: Tue, 8 Oct 2019 09:59:42 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH 09/11] lib/interval-tree: convert interval_tree to half
 closed intervals
Message-ID: <20191008165942.vxfwbectycuersdx@linux-p48b>
Mail-Followup-To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "walken@google.com" <walken@google.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Doug Ledford <dledford@redhat.com>, Joerg Roedel <joro@8bytes.org>,
 J?r?me Glisse <jglisse@redhat.com>,
 Davidlohr Bueso <dbueso@suse.de>
References: <20191003201858.11666-1-dave@stgolabs.net>
 <20191003201858.11666-10-dave@stgolabs.net>
 <bc45a4c6-35ab-54a3-487f-ce41b75dd99c@amd.com>
 <d1f5de2f-006f-5e76-cd1b-1524b8bc2cb0@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d1f5de2f-006f-5e76-cd1b-1524b8bc2cb0@amd.com>
User-Agent: NeoMutt/20180716
X-Mailman-Approved-At: Wed, 09 Oct 2019 07:12:50 +0000
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
Cc: J?r?me Glisse <jglisse@redhat.com>, Davidlohr Bueso <dbueso@suse.de>,
 "peterz@infradead.org" <peterz@infradead.org>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Doug Ledford <dledford@redhat.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "walken@google.com" <walken@google.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAwNCBPY3QgMjAxOSwgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6Cgo+QW0gMDQuMTAu
MTkgdW0gMDg6NTcgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+PiBBbSAwMy4xMC4xOSB1bSAy
MjoxOCBzY2hyaWViIERhdmlkbG9ociBCdWVzbzoKPj4+IFRoZSBnZW5lcmljIHRyZWUgdHJlZSBy
ZWFsbHkgd2FudHMgW2EsIGIpIGludGVydmFscywgbm90IGZ1bGx5IGNsb3NlZC4KPj4+IEFzIHN1
Y2ggY29udmVydCBpdCB0byB1c2UgdGhlIG5ldyBpbnRlcnZhbF90cmVlX2dlbi5oLiBNb3N0IG9m
IHRoZQo+Pj4gY29udmVyc2lvbnMgYXJlIHN0cmFpZ2h0Zm9yd2FyZCwgd2l0aCB0aGUgZXhjZXB0
aW9uIG9mIHBlcmhhcHMKPj4+IHJhZGVvbl92bV9ib19zZXRfYWRkcigpLCBidXQgc2VtYW50aWNz
IGhhdmUgYmVlbiB0cmllZCB0byBiZSBsZWZ0Cj4+PiB1bnRvdWNoZWQuCj4+Cj4+IE5BSywgdGhl
IHdob2xlIHRoaW5nIHdvbid0IHdvcmsuCj4+Cj4+IFNlZSB3ZSBuZWVkIHRvIGhhbmRsZSB0aGUg
ZnVsbCBkZXZpY2UgYWRkcmVzcyBzcGFjZSB3aGljaCBtZWFucyB3ZQo+PiBoYXZlIHZhbHVlcyBp
biB0aGUgcmFuZ2Ugb2YgMHgwLTB4ZmZmZmZmZmYuCj4+Cj4+IElmIHlvdSBtYWtlIHRoaXMgYSBj
bG9zZWQgaW50ZXJ2YWwgdGhlbiB0aGUgZW5kIHdvdWxkIHdyYXAgYXJvdW5kIHRvCj4+IDB4MCBp
ZiBsb25nIGlzIG9ubHkgMzJiaXQuCj4KPldlbGwgSSd2ZSBqdXN0IG5vdyByZS1yZWFkIHRoZSBz
dWJqZWN0IGxpbmUuIEZyb20gdGhhdCBpdCBzb3VuZHMgbGlrZQo+eW91IGFyZSBhY3R1YWxseSB0
cnlpbmcgdG8gZml4IHRoZSBpbnRlcnZhbCB0cmVlIHRvIHVzZSBhIGhhbGYgY2xvc2VkCj5pbnRl
cnZhbCwgZS5nLiBzb21ldGhpbmcgbGlrZSBbYSwgYlsKCkNvcnJlY3QuCgo+Cj5CdXQgeW91ciBj
b2RlIGNoYW5nZXMgc29tZXRpbWVzIGRvZXNuJ3Qgc2VlbSB0byByZWZsZWN0IHRoYXQuCgpIbW0g
dGhlIGNoYW5nZSBzaW1wbHkgYWltcyBhdCBhdm9pZGluZyB0aGUgZW5kIC0gMSB0cmljayB3aGVu
IGRlYWxpbmcKd2l0aCBpbnRlcnZhbF90cmVlIGluc2VydGlvbnMgYW5kIGxvb2t1cHM7IHRoZSBy
ZXN0IG9mIHRoZSBzZXJpZXMKY29udmVydHMgb3RoZXIgaW50ZXJ2YWwgdHJlZSB1c2VycyBpbiBh
IHNpbWlsYXIgd2F5LCBhbGJlaXQgc29tZSBlcnJvcnMKd2hpY2ggd2lsbCBiZSB1cGRhdGVkLiBX
aGF0IGFyZSB5b3VyIGNvbmNlcm5zIGFib3V0IHRoaXMgcGF0Y2g/CgpUaGFua3MsCkRhdmlkbG9o
cgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
