Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAB130B35A
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 00:21:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 206346E8A9;
	Mon,  1 Feb 2021 23:21:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C1C6E8A9;
 Mon,  1 Feb 2021 23:21:40 +0000 (UTC)
IronPort-SDR: JJ+3MWpjMWBUJwy6DchnoCVTkeGzQjdQyLn9HUrbIdLFqGlXx5ee00o9U6hejH9Nhuvn/WkFeT
 er0sb0VvVXyg==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="242285542"
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; d="scan'208";a="242285542"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 15:21:37 -0800
IronPort-SDR: rkwNIz2b0CynlLQSBraKJF/Zx+NCJg2sKZ1YwCbqyPmXEy0SZF+z0NWvk+YdmCtiAxUf6qcXpi
 oS++1PY/AHdg==
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; d="scan'208";a="412942564"
Received: from brianwel-mobl1.amr.corp.intel.com (HELO [10.209.88.198])
 ([10.209.88.198])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 15:21:36 -0800
Subject: Re: [RFC PATCH 0/9] cgroup support for GPU devices
To: Xingyou Chen <rockrush@rockwork.org>, cgroups@vger.kernel.org,
 Tejun Heo <tj@kernel.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, Kenny Ho <Kenny.Ho@amd.com>,
 amd-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Eero Tamminen <eero.t.tamminen@intel.com>
References: <20210126214626.16260-1-brian.welty@intel.com>
 <84b79978-84c9-52aa-b761-3f4be929064e@rockwork.org>
From: Brian Welty <brian.welty@intel.com>
Message-ID: <5307d21b-7494-858c-30f0-cb5fe1d86004@intel.com>
Date: Mon, 1 Feb 2021 15:21:35 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <84b79978-84c9-52aa-b761-3f4be929064e@rockwork.org>
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

Ck9uIDEvMjgvMjAyMSA3OjAwIFBNLCBYaW5neW91IENoZW4gd3JvdGU6Cj4gT24gMjAyMS8xLzI3
IOS4iuWNiDU6NDYsIEJyaWFuIFdlbHR5IHdyb3RlOgo+IAo+PiBXZSdkIGxpa2UgdG8gcmV2aXNp
dCB0aGUgcHJvcG9zYWwgb2YgYSBHUFUgY2dyb3VwIGNvbnRyb2xsZXIgZm9yIG1hbmFnaW5nCj4+
IEdQVSBkZXZpY2VzIGJ1dCB3aXRoIGp1c3QgYSBiYXNpYyBzZXQgb2YgY29udHJvbHMuICBUaGlz
IHNlcmllcyBpcyBiYXNlZCBvbiAKPj4gdGhlIHByaW9yIHBhdGNoIHNlcmllcyBmcm9tIEtlbm55
IEhvIFsxXS4gIFdlIHRha2UgS2VubnkncyBiYXNlIHBhdGNoZXMKPj4gd2hpY2ggaW1wbGVtZW50
IHRoZSBiYXNpYyBmcmFtZXdvcmsgZm9yIHRoZSBjb250cm9sbGVyLCBidXQgd2UgcHJvcG9zZSBh
bgo+PiBhbHRlcm5hdGUgc2V0IG9mIGNvbnRyb2wgZmlsZXMuICBIZXJlIHdlJ3ZlIHRha2VuIGEg
c3Vic2V0IG9mIHRoZSBjb250cm9scwo+PiBwcm9wb3NlZCBpbiBlYXJsaWVyIGRpc2N1c3Npb24g
b24gTUwgaGVyZSBbMl0uIAo+Pgo+PiBUaGlzIHNlcmllcyBwcm9wb3NlcyBhIHNldCBvZiBkZXZp
Y2UgbWVtb3J5IGNvbnRyb2xzIChncHUubWVtb3J5LmN1cnJlbnQsCj4+IGdwdS5tZW1vcnkubWF4
LCBhbmQgZ3B1Lm1lbW9yeS50b3RhbCkgYW5kIGFjY291bnRpbmcgb2YgR1BVIHRpbWUgdXNhZ2UK
Pj4gKGdwdS5zY2hlZC5ydW50aW1lKS4gIEdQVSB0aW1lIHNoYXJpbmcgY29udHJvbHMgYXJlIGxl
ZnQgYXMgZnV0dXJlIHdvcmsuCj4+IFRoZXNlIGFyZSBpbXBsZW1lbnRlZCB3aXRoaW4gdGhlIEdQ
VSBjb250cm9sbGVyIGFsb25nIHdpdGggaW50ZWdyYXRpb24vdXNhZ2UKPj4gb2YgdGhlIGRldmlj
ZSBtZW1vcnkgY29udHJvbHMgYnkgdGhlIGk5MTUgZGV2aWNlIGRyaXZlci4KPj4KPj4gQXMgYW4g
YWNjZWxlcmF0b3Igb3IgR1BVIGRldmljZSBpcyBzaW1pbGFyIGluIG1hbnkgcmVzcGVjdHMgdG8g
YSBDUFUgd2l0aAo+PiAob3Igd2l0aG91dCkgYXR0YWNoZWQgc3lzdGVtIG1lbW9yeSwgdGhlIGJh
c2ljIHByaW5jaXBsZSBoZXJlIGlzIHRyeSB0bwo+PiBjb3B5IHRoZSBzZW1hbnRpY3Mgb2YgZXhp
c3RpbmcgY29udHJvbHMgZnJvbSBvdGhlciBjb250cm9sbGVycyB3aGVuIHBvc3NpYmxlCj4+IGFu
ZCB3aGVyZSB0aGVzZSBjb250cm9scyBzZXJ2ZSB0aGUgc2FtZSB1bmRlcmx5aW5nIHB1cnBvc2Uu
Cj4+IEZvciBleGFtcGxlLCB0aGUgbWVtb3J5Lm1heCBhbmQgbWVtb3J5LmN1cnJlbnQgY29udHJv
bHMgYXJlIGJhc2VkIG9uCj4+IHNhbWUgY29udHJvbHMgZnJvbSBNRU1DRyBjb250cm9sbGVyLgo+
IAo+IEl0IHNlZW1zIG5vdCB0byBiZSBEUk0gc3BlY2lmaWMsIG9yIGV2ZW4gR1BVIHNwZWNpZmlj
LiBXb3VsZCB3ZSBoYXZlIGFuIHVuaXZlcnNhbAo+IGNvbnRyb2wgZ3JvdXAgZm9yIGFueSBhY2Nl
bGVyYXRvciwgR1BHUFUgZGV2aWNlIGV0YywgdGhhdCBob2xkIHNoYXJhYmxlIHJlc291cmNlcwo+
IGxpa2UgZGV2aWNlIG1lbW9yeSwgY29tcHV0ZSB1dGlsaXR5LCBiYW5kd2lkdGgsIHdpdGggZXh0
cmEgY29udHJvbCBmaWxlIHRvIHNlbGVjdAo+IGJldHdlZW4gZGV2aWNlcyhvciB2ZW5kb3JzKT8K
PiAKPiBlLmcuIC9jZ25hbWUuZGV2aWNlIHRoYXQgc3RvcmVzIFBDSSBCREbvvIwgb3IgZW51bShp
bnRlbCwgYW1kZ3B1LCBudmlkaWEsIC4uLiksCj4gZGVmYXVsdHMgdG8gbm9uZSwgbWVhbnMgbm90
IGVuYWJsZWQuCj4gCgpIaSwgdGhhbmtzIGZvciB0aGUgZmVlZGJhY2suICBZZXMsIEkgdGVuZCB0
byBhZ3JlZS4gIEkndmUgYXNrZWQgYWJvdXQgdGhpcyBpbgplYXJsaWVyIHdvcms7IG15IHN1Z2dl
c3Rpb24gaXMgdG8gbmFtZSB0aGUgY29udHJvbGxlciBzb21ldGhpbmcgbGlrZSAnWFBVJyB0bwpi
ZSBjbGVhciB0aGF0IHRoZXNlIGNvbnRyb2xzIGNvdWxkIGFwcGx5IHRvIG1vcmUgdGhhbiBHUFUu
CgpCdXQgYXQgbGVhc3QgZm9yIG5vdywgYmFzZWQgb24gVGVqdW4ncyByZXBseSBbMV0sIHRoZSBm
ZWVkYmFjayBpcyB0byB0cnkgYW5kIGtlZXAKdGhpcyBjb250cm9sbGVyIGFzIHNtYWxsIGFuZCBm
b2N1c2VkIGFzIHBvc3NpYmxlIG9uIGp1c3QgR1BVLiAgQXQgbGVhc3QgdW50aWwKd2UgZ2V0IHNv
bWUgY29uc2Vuc3VzIG9uIHNldCBvZiBjb250cm9scyBmb3IgR1BVLi4uLi4gIGJ1dCBmb3IgdGhp
cyB3ZSBuZWVkIG1vcmUKYWN0aXZlIGlucHV0IGZyb20gY29tbXVuaXR5Li4uLi4uCgotQnJpYW4K
ClsxXSBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAx
OS1Ob3ZlbWJlci8yNDMxNjcuaHRtbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
