Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8F83083EF
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 03:52:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B129A6E3AC;
	Fri, 29 Jan 2021 02:52:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 411 seconds by postgrey-1.36 at gabe;
 Fri, 29 Jan 2021 02:52:50 UTC
Received: from rockwork.org (unknown [45.32.92.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9306E3AC;
 Fri, 29 Jan 2021 02:52:50 +0000 (UTC)
Received: from [192.168.43.200] (unknown [36.19.57.1])
 by rockwork.org (Postfix) with ESMTPSA id 30EF5FBC2E;
 Fri, 29 Jan 2021 02:45:52 +0000 (UTC)
From: Xingyou Chen <rockrush@rockwork.org>
Subject: Re: [RFC PATCH 0/9] cgroup support for GPU devices
To: Brian Welty <brian.welty@intel.com>, cgroups@vger.kernel.org,
 Tejun Heo <tj@kernel.org>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Kenny Ho <Kenny.Ho@amd.com>, amd-gfx@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Eero Tamminen <eero.t.tamminen@intel.com>
References: <20210126214626.16260-1-brian.welty@intel.com>
Message-ID: <293ecfcc-50f7-1c43-bc1b-f96dc04d976a@rockwork.org>
Date: Fri, 29 Jan 2021 10:45:49 +0800
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

Ck9uIDIwMjEvMS8yNyDkuIrljYg1OjQ2LCBCcmlhbiBXZWx0eSB3cm90ZToKPiBXZSdkIGxpa2Ug
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
dmUgYW4gdW5pdmVyc2FsIGNvbnRyb2wgZ3JvdXAgZm9yCgphbnkgYWNjZWxlcmF0b3IsIEdQR1BV
IGRldmljZSBldGMsIHRoYXQgaG9sZCBzaGFyYWJsZSByZXNvdXJjZXMgbGlrZSBkZXZpY2UgbWVt
b3J5LCBjb21wdXRlIHV0aWxpdHksCgpiYW5kd2lkdGgsIHdpdGggZXh0cmEgY29udHJvbCBmaWxl
IHRvIHNlbGVjdCBiZXR3ZWVuIGRldmljZXMob3IgdmVuZG9ycyk/CgplLmcuIC9jZ25hbWUuZGV2
aWNlIHRoYXQgc3RvcmVzIFBDSSBCREbvvIwgb3IgZW51bShpbnRlbCwgYW1kZ3B1LCBudmlkaWEs
IC4uLiksIGRlZmF1bHRzIHRvIG5vbmUsCgptZWFucyBub3QgZW5hYmxlZC4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
