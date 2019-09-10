Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11673AE991
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 13:54:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80C3B89428;
	Tue, 10 Sep 2019 11:54:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2800A893D0;
 Tue, 10 Sep 2019 11:54:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 96058ABCE;
 Tue, 10 Sep 2019 11:54:49 +0000 (UTC)
Date: Tue, 10 Sep 2019 13:54:48 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH RFC v4 00/16] new cgroup controller for gpu/drm subsystem
Message-ID: <20190910115448.GT2063@dhcp22.suse.cz>
References: <20190829060533.32315-1-Kenny.Ho@amd.com>
 <20190831042857.GD2263813@devbig004.ftw2.facebook.com>
 <20190903075550.GJ2112@phenom.ffwll.local>
 <20190903185013.GI2263813@devbig004.ftw2.facebook.com>
 <CAKMK7uE5Bj-3cJH895iqnLpwUV+GBDM1Y=n4Z4A3xervMdJKXg@mail.gmail.com>
 <20190906152320.GM2263813@devbig004.ftw2.facebook.com>
 <CAKMK7uEXP7XLFB2aFU6+E0TH_DepFRkfCoKoHwkXtjZRDyhHig@mail.gmail.com>
 <20190906154539.GP2263813@devbig004.ftw2.facebook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190906154539.GP2263813@devbig004.ftw2.facebook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "Greathouse, Joseph" <joseph.greathouse@amd.com>,
 Kenny Ho <Kenny.Ho@amd.com>, "Kuehling, Felix" <felix.kuehling@amd.com>,
 jsparks@cray.com, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 lkaplan@cray.com, Kenny Ho <y2kenny@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, cgroups@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpIDA2LTA5LTE5IDA4OjQ1OjM5LCBUZWp1biBIZW8gd3JvdGU6Cj4gSGVsbG8sIERhbmll
bC4KPiAKPiBPbiBGcmksIFNlcCAwNiwgMjAxOSBhdCAwNTozNDoxNlBNICswMjAwLCBEYW5pZWwg
VmV0dGVyIHdyb3RlOgo+ID4gPiBIbW0uLi4gd2hhdCdkIGJlIHRoZSBmdW5kYW1lbnRhbCBkaWZm
ZXJlbmNlIGZyb20gc2xhYiBvciBzb2NrZXQgbWVtb3J5Cj4gPiA+IHdoaWNoIGFyZSBoYW5kbGVk
IHRocm91Z2ggbWVtY2c/ICBJcyBzeXN0ZW0gbWVtb3J5IHVzZWQgYnkgR1BVcyBoYXZlCj4gPiA+
IGZ1cnRoZXIgZ2xvYmFsIHJlc3RyaWN0aW9ucyBpbiBhZGRpdGlvbiB0byB0aGUgYW1vdW50IG9m
IHBoeXNpY2FsCj4gPiA+IG1lbW9yeSB1c2VkPwo+ID4gCj4gPiBTb21ldGltZXMsIGJ1dCB0aGF0
IHdvdWxkIGJlIHNwZWNpZmljIHJlc291cmNlcyAoa2luZGEgbGlrZSB2cmFtKSwKPiA+IGUuZy4g
Q01BIHJlZ2lvbnMgdXNlZCBieSBhIGdwdS4gQnV0IHByb2JhYmx5IG5vdCBzb21ldGhpbmcgeW91
J2xsIHJ1bgo+ID4gaW4gYSBkYXRhY2VudGVyIGFuZCB3YW50IGNncm91cHMgZm9yIC4uLgo+ID4g
Cj4gPiBJIGd1ZXNzIHdlIGNvdWxkIHRyeSB0byBpbnRlZ3JhdGUgd2l0aCB0aGUgbWVtY2cgZ3Jv
dXAgY29udHJvbGxlci4gT25lCj4gPiB0cm91YmxlIGlzIHRoYXQgYXNpZGUgZnJvbSBpOTE1IG1v
c3QgZ3B1IGRyaXZlcnMgZG8gbm90IHJlYWxseSBoYXZlIGEKPiA+IGZ1bGwgc2hyaW5rZXIsIHNv
IG5vdCBzdXJlIGhvdyB0aGF0IHdvdWxkIGFsbCBpbnRlZ3JhdGUuCj4gCj4gU28sIHdoaWxlIGl0
J2QgZ3JlYXQgdG8gaGF2ZSBzaHJpbmtlcnMgaW4gdGhlIGxvbmdlciB0ZXJtLCBpdCdzIG5vdCBh
Cj4gc3RyaWN0IHJlcXVpcmVtZW50IHRvIGJlIGFjY291bnRlZCBpbiBtZW1jZy4gIEl0IGFscmVh
ZHkgYWNjb3VudHMgYQo+IGxvdCBvZiBtZW1vcnkgd2hpY2ggaXNuJ3QgcmVjbGFpbWFibGUgKGEg
bG90IG9mIHNsYWJzIGFuZCBzb2NrZXQKPiBidWZmZXIpLgoKWWVhaCwgaGF2aW5nIGEgc2hyaW5r
ZXIgaXMgcHJlZmVycmVkIGJ1dCB0aGUgbWVtb3J5IHNob3VsZCBiZXR0ZXIgYmUKcmVjbGFpbWFi
bGUgaW4gc29tZSBmb3JtLiBJZiBub3QgYnkgYW55IG90aGVyIG1lYW5zIHRoZW4gYXQgbGVhc3Qg
Ym91bmQKdG8gYSB1c2VyIHByb2Nlc3MgY29udGV4dCBzbyB0aGF0IGl0IGdvZXMgYXdheSB3aXRo
IGEgdGFzayBiZWluZyBraWxsZWQKYnkgdGhlIE9PTSBraWxsZXIuIElmIHRoYXQgaXMgbm90IHRo
ZSBjYXNlIHRoZW4gd2UgY2Fubm90IHJlYWxseSBjaGFyZ2UKaXQgYmVjYXVzZSB0aGVuIHRoZSBt
ZW1jZyBjb250cm9sbGVyIGlzIG9mIG5vIHVzZS4gV2UgY2FuIHRvbGVyYXRlIGl0IHRvCnNvbWUg
ZGVncmVlIGlmIHRoZSBhbW91bnQgb2YgbWVtb3J5IGNoYXJnZWQgbGlrZSB0aGF0IGlzIG5lZ2xp
Z2libGUgdG8KdGhlIG92ZXJhbGwgc2l6ZS4gQnV0IGZyb20gdGhlIGRpc2N1c3Npb24gaXQgc2Vl
bXMgdGhhdCB0aGVzZSBidWZmZXJzCmFyZSByZWFsbHkgbGFyZ2UuCi0tIApNaWNoYWwgSG9ja28K
U1VTRSBMYWJzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
