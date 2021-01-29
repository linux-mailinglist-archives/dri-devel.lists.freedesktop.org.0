Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7709308401
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 04:01:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0036EA6B;
	Fri, 29 Jan 2021 03:01:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 912 seconds by postgrey-1.36 at gabe;
 Fri, 29 Jan 2021 03:01:11 UTC
Received: from rockwork.org (unknown
 [IPv6:2001:19f0:6001:1139:5400:2ff:feee:29a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 445466EA3F;
 Fri, 29 Jan 2021 03:01:11 +0000 (UTC)
Received: from [192.168.43.200] (unknown [36.19.57.1])
 by rockwork.org (Postfix) with ESMTPSA id ACF4DFBC2E;
 Fri, 29 Jan 2021 03:00:59 +0000 (UTC)
Subject: Re: [RFC PATCH 0/9] cgroup support for GPU devices
To: Brian Welty <brian.welty@intel.com>, cgroups@vger.kernel.org,
 Tejun Heo <tj@kernel.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, Kenny Ho <Kenny.Ho@amd.com>,
 amd-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Eero Tamminen <eero.t.tamminen@intel.com>
References: <20210126214626.16260-1-brian.welty@intel.com>
From: Xingyou Chen <rockrush@rockwork.org>
Message-ID: <84b79978-84c9-52aa-b761-3f4be929064e@rockwork.org>
Date: Fri, 29 Jan 2021 11:00:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210126214626.16260-1-brian.welty@intel.com>
Content-Language: en-US
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMS8xLzI3IOS4iuWNiDU6NDYsIEJyaWFuIFdlbHR5IHdyb3RlOgoKPiBXZSdkIGxpa2Ug
dG8gcmV2aXNpdCB0aGUgcHJvcG9zYWwgb2YgYSBHUFUgY2dyb3VwIGNvbnRyb2xsZXIgZm9yIG1h
bmFnaW5nCj4gR1BVIGRldmljZXMgYnV0IHdpdGgganVzdCBhIGJhc2ljIHNldCBvZiBjb250cm9s
cy4gIFRoaXMgc2VyaWVzIGlzIGJhc2VkIG9uIAo+IHRoZSBwcmlvciBwYXRjaCBzZXJpZXMgZnJv
bSBLZW5ueSBIbyBbMV0uICBXZSB0YWtlIEtlbm55J3MgYmFzZSBwYXRjaGVzCj4gd2hpY2ggaW1w
bGVtZW50IHRoZSBiYXNpYyBmcmFtZXdvcmsgZm9yIHRoZSBjb250cm9sbGVyLCBidXQgd2UgcHJv
cG9zZSBhbgo+IGFsdGVybmF0ZSBzZXQgb2YgY29udHJvbCBmaWxlcy4gIEhlcmUgd2UndmUgdGFr
ZW4gYSBzdWJzZXQgb2YgdGhlIGNvbnRyb2xzCj4gcHJvcG9zZWQgaW4gZWFybGllciBkaXNjdXNz
aW9uIG9uIE1MIGhlcmUgWzJdLiAKPgo+IFRoaXMgc2VyaWVzIHByb3Bvc2VzIGEgc2V0IG9mIGRl
dmljZSBtZW1vcnkgY29udHJvbHMgKGdwdS5tZW1vcnkuY3VycmVudCwKPiBncHUubWVtb3J5Lm1h
eCwgYW5kIGdwdS5tZW1vcnkudG90YWwpIGFuZCBhY2NvdW50aW5nIG9mIEdQVSB0aW1lIHVzYWdl
Cj4gKGdwdS5zY2hlZC5ydW50aW1lKS4gIEdQVSB0aW1lIHNoYXJpbmcgY29udHJvbHMgYXJlIGxl
ZnQgYXMgZnV0dXJlIHdvcmsuCj4gVGhlc2UgYXJlIGltcGxlbWVudGVkIHdpdGhpbiB0aGUgR1BV
IGNvbnRyb2xsZXIgYWxvbmcgd2l0aCBpbnRlZ3JhdGlvbi91c2FnZQo+IG9mIHRoZSBkZXZpY2Ug
bWVtb3J5IGNvbnRyb2xzIGJ5IHRoZSBpOTE1IGRldmljZSBkcml2ZXIuCj4KPiBBcyBhbiBhY2Nl
bGVyYXRvciBvciBHUFUgZGV2aWNlIGlzIHNpbWlsYXIgaW4gbWFueSByZXNwZWN0cyB0byBhIENQ
VSB3aXRoCj4gKG9yIHdpdGhvdXQpIGF0dGFjaGVkIHN5c3RlbSBtZW1vcnksIHRoZSBiYXNpYyBw
cmluY2lwbGUgaGVyZSBpcyB0cnkgdG8KPiBjb3B5IHRoZSBzZW1hbnRpY3Mgb2YgZXhpc3Rpbmcg
Y29udHJvbHMgZnJvbSBvdGhlciBjb250cm9sbGVycyB3aGVuIHBvc3NpYmxlCj4gYW5kIHdoZXJl
IHRoZXNlIGNvbnRyb2xzIHNlcnZlIHRoZSBzYW1lIHVuZGVybHlpbmcgcHVycG9zZS4KPiBGb3Ig
ZXhhbXBsZSwgdGhlIG1lbW9yeS5tYXggYW5kIG1lbW9yeS5jdXJyZW50IGNvbnRyb2xzIGFyZSBi
YXNlZCBvbgo+IHNhbWUgY29udHJvbHMgZnJvbSBNRU1DRyBjb250cm9sbGVyLgoKSXQgc2VlbXMg
bm90IHRvIGJlIERSTSBzcGVjaWZpYywgb3IgZXZlbiBHUFUgc3BlY2lmaWMuIFdvdWxkIHdlIGhh
dmUgYW4gdW5pdmVyc2FsCmNvbnRyb2wgZ3JvdXAgZm9yIGFueSBhY2NlbGVyYXRvciwgR1BHUFUg
ZGV2aWNlIGV0YywgdGhhdCBob2xkIHNoYXJhYmxlIHJlc291cmNlcwpsaWtlIGRldmljZSBtZW1v
cnksIGNvbXB1dGUgdXRpbGl0eSwgYmFuZHdpZHRoLCB3aXRoIGV4dHJhIGNvbnRyb2wgZmlsZSB0
byBzZWxlY3QKYmV0d2VlbiBkZXZpY2VzKG9yIHZlbmRvcnMpPwoKZS5nLiAvY2duYW1lLmRldmlj
ZSB0aGF0IHN0b3JlcyBQQ0kgQkRG77yMIG9yIGVudW0oaW50ZWwsIGFtZGdwdSwgbnZpZGlhLCAu
Li4pLApkZWZhdWx0cyB0byBub25lLCBtZWFucyBub3QgZW5hYmxlZC4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
