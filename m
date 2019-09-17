Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 082ABB4DB2
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 14:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB146EC1F;
	Tue, 17 Sep 2019 12:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DFB46EC1F
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 12:21:45 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id v8so3147218eds.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 05:21:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=sBDZTvszyXwnAA8Fe4ydJoq8vUAh0ZWCho/0yWp4zVc=;
 b=UB8zjoW2xHuYXmuBKCnVeuET3c7AIRZKQ1QyEu9Qc4UlZdVfNtHqaT0rhg1ZNcGmT+
 3p3DHuCXiV5zrSKDvbpvFTN3ee/9D2Z/ShU3ZqfhtdLDBvcKfE6lBjLfzYbay7/xSwNR
 nTJ95tDt3Q0gMsbucsrHB7UAxIaeCVWYslp4Sz+JuRKz9QXGb+zXk0Jk0Ao5rxo7q31g
 1YeYZES53/yhiWqNYGOt41iOFKPXbjsmAy9O1iCZjr0vAeFL1G05OCpFFwyuDOCj4s/S
 0hUpp9hSoSx/eT+0fyNvg3/fCiAVPx2hbir+2Lq+PqtMlpm/37b/rsukaO/ur0gBYMg4
 BMpA==
X-Gm-Message-State: APjAAAVm2jxEQnz+85OOMEMAfFYY3v6iIE/GXeEMHB2bDZhs4CJ26lNc
 L2kJ39j0c34GS4ttYf1r+/IHRA==
X-Google-Smtp-Source: APXvYqyALq9alFYk3aUmDri7Xuh4HiWRG2D36qfRPvo9smm60aI17Il61AZaKCaKzUvG1ikyyl0qmg==
X-Received: by 2002:a50:a532:: with SMTP id y47mr4184686edb.273.1568722904179; 
 Tue, 17 Sep 2019 05:21:44 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id s21sm404166edi.85.2019.09.17.05.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 05:21:43 -0700 (PDT)
Date: Tue, 17 Sep 2019 14:21:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH RFC v4 00/16] new cgroup controller for gpu/drm subsystem
Message-ID: <20190917122140.GL3958@phenom.ffwll.local>
References: <20190829060533.32315-1-Kenny.Ho@amd.com>
 <20190831042857.GD2263813@devbig004.ftw2.facebook.com>
 <20190903075550.GJ2112@phenom.ffwll.local>
 <20190903185013.GI2263813@devbig004.ftw2.facebook.com>
 <CAKMK7uE5Bj-3cJH895iqnLpwUV+GBDM1Y=n4Z4A3xervMdJKXg@mail.gmail.com>
 <20190906152320.GM2263813@devbig004.ftw2.facebook.com>
 <CAKMK7uEXP7XLFB2aFU6+E0TH_DepFRkfCoKoHwkXtjZRDyhHig@mail.gmail.com>
 <20190906154539.GP2263813@devbig004.ftw2.facebook.com>
 <20190910115448.GT2063@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190910115448.GT2063@dhcp22.suse.cz>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=sBDZTvszyXwnAA8Fe4ydJoq8vUAh0ZWCho/0yWp4zVc=;
 b=LEmrrA6GkFueNQZUCd9cEaBPy+6Bh5n8Q2Baiv/E6gR23Dmg3+nvff6jzqH3UbGytS
 itTZJ9HNvQ7qlF6o6iTtoQNlRUjuD7bKn82rUFgw2lXQvVK3bQ2KjVe3A7vorURWJRwK
 VXI70tbnaghNzNFji7ZSIqaGgK3RURO9HZ+yI=
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
 jsparks@cray.com, dri-devel <dri-devel@lists.freedesktop.org>,
 lkaplan@cray.com, Alex Deucher <alexander.deucher@amd.com>,
 Kenny Ho <y2kenny@gmail.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMTAsIDIwMTkgYXQgMDE6NTQ6NDhQTSArMDIwMCwgTWljaGFsIEhvY2tvIHdy
b3RlOgo+IE9uIEZyaSAwNi0wOS0xOSAwODo0NTozOSwgVGVqdW4gSGVvIHdyb3RlOgo+ID4gSGVs
bG8sIERhbmllbC4KPiA+IAo+ID4gT24gRnJpLCBTZXAgMDYsIDIwMTkgYXQgMDU6MzQ6MTZQTSAr
MDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+ID4gPiBIbW0uLi4gd2hhdCdkIGJlIHRoZSBm
dW5kYW1lbnRhbCBkaWZmZXJlbmNlIGZyb20gc2xhYiBvciBzb2NrZXQgbWVtb3J5Cj4gPiA+ID4g
d2hpY2ggYXJlIGhhbmRsZWQgdGhyb3VnaCBtZW1jZz8gIElzIHN5c3RlbSBtZW1vcnkgdXNlZCBi
eSBHUFVzIGhhdmUKPiA+ID4gPiBmdXJ0aGVyIGdsb2JhbCByZXN0cmljdGlvbnMgaW4gYWRkaXRp
b24gdG8gdGhlIGFtb3VudCBvZiBwaHlzaWNhbAo+ID4gPiA+IG1lbW9yeSB1c2VkPwo+ID4gPiAK
PiA+ID4gU29tZXRpbWVzLCBidXQgdGhhdCB3b3VsZCBiZSBzcGVjaWZpYyByZXNvdXJjZXMgKGtp
bmRhIGxpa2UgdnJhbSksCj4gPiA+IGUuZy4gQ01BIHJlZ2lvbnMgdXNlZCBieSBhIGdwdS4gQnV0
IHByb2JhYmx5IG5vdCBzb21ldGhpbmcgeW91J2xsIHJ1bgo+ID4gPiBpbiBhIGRhdGFjZW50ZXIg
YW5kIHdhbnQgY2dyb3VwcyBmb3IgLi4uCj4gPiA+IAo+ID4gPiBJIGd1ZXNzIHdlIGNvdWxkIHRy
eSB0byBpbnRlZ3JhdGUgd2l0aCB0aGUgbWVtY2cgZ3JvdXAgY29udHJvbGxlci4gT25lCj4gPiA+
IHRyb3VibGUgaXMgdGhhdCBhc2lkZSBmcm9tIGk5MTUgbW9zdCBncHUgZHJpdmVycyBkbyBub3Qg
cmVhbGx5IGhhdmUgYQo+ID4gPiBmdWxsIHNocmlua2VyLCBzbyBub3Qgc3VyZSBob3cgdGhhdCB3
b3VsZCBhbGwgaW50ZWdyYXRlLgo+ID4gCj4gPiBTbywgd2hpbGUgaXQnZCBncmVhdCB0byBoYXZl
IHNocmlua2VycyBpbiB0aGUgbG9uZ2VyIHRlcm0sIGl0J3Mgbm90IGEKPiA+IHN0cmljdCByZXF1
aXJlbWVudCB0byBiZSBhY2NvdW50ZWQgaW4gbWVtY2cuICBJdCBhbHJlYWR5IGFjY291bnRzIGEK
PiA+IGxvdCBvZiBtZW1vcnkgd2hpY2ggaXNuJ3QgcmVjbGFpbWFibGUgKGEgbG90IG9mIHNsYWJz
IGFuZCBzb2NrZXQKPiA+IGJ1ZmZlcikuCj4gCj4gWWVhaCwgaGF2aW5nIGEgc2hyaW5rZXIgaXMg
cHJlZmVycmVkIGJ1dCB0aGUgbWVtb3J5IHNob3VsZCBiZXR0ZXIgYmUKPiByZWNsYWltYWJsZSBp
biBzb21lIGZvcm0uIElmIG5vdCBieSBhbnkgb3RoZXIgbWVhbnMgdGhlbiBhdCBsZWFzdCBib3Vu
ZAo+IHRvIGEgdXNlciBwcm9jZXNzIGNvbnRleHQgc28gdGhhdCBpdCBnb2VzIGF3YXkgd2l0aCBh
IHRhc2sgYmVpbmcga2lsbGVkCj4gYnkgdGhlIE9PTSBraWxsZXIuIElmIHRoYXQgaXMgbm90IHRo
ZSBjYXNlIHRoZW4gd2UgY2Fubm90IHJlYWxseSBjaGFyZ2UKPiBpdCBiZWNhdXNlIHRoZW4gdGhl
IG1lbWNnIGNvbnRyb2xsZXIgaXMgb2Ygbm8gdXNlLiBXZSBjYW4gdG9sZXJhdGUgaXQgdG8KPiBz
b21lIGRlZ3JlZSBpZiB0aGUgYW1vdW50IG9mIG1lbW9yeSBjaGFyZ2VkIGxpa2UgdGhhdCBpcyBu
ZWdsaWdpYmxlIHRvCj4gdGhlIG92ZXJhbGwgc2l6ZS4gQnV0IGZyb20gdGhlIGRpc2N1c3Npb24g
aXQgc2VlbXMgdGhhdCB0aGVzZSBidWZmZXJzCj4gYXJlIHJlYWxseSBsYXJnZS4KCkkgdGhpbmsg
d2UgY2FuIGp1c3QgbWFrZSAibXVzdCBoYXZlIGEgc2hyaW5rZXIiIGFzIGEgcmVxdWlyZW1lbnQg
Zm9yCnN5c3RlbSBtZW1vcnkgY2dyb3VwIHRoaW5nIGZvciBncHUgYnVmZmVycy4gVGhlcmUncyBt
aWxkIGxvY2tpbmcgaW52ZXJzaW9uCmZ1biB0byBiZSBoYWQgd2hlbiB0eXBpbmcgb25lLCBidXQg
SSB0aGluayB0aGUgcHJvYmxlbSBpcyB3ZWxsLXVuZGVyc3Rvb2QKZW5vdWdoIHRoYXQgdGhpcyBp
c24ndCBhIGh1Z2UgaHVyZGxlIHRvIGNsaW1iIG92ZXIuIEFuZCBzaG91bGQgZ2l2ZSBhZG1pbnMK
YW4gZWFzaWVyIHRvIG1hbmdlIHN5c3RlbSwgc2luY2UgaXQgd29ya3MgbW9yZSBsaWtlIHdoYXQg
dGhleSBrbm93CmFscmVhZHkuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5n
aW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
