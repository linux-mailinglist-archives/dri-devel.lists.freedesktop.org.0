Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D301A208FA
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 16:03:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4529E89612;
	Thu, 16 May 2019 14:03:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84AA8895D7;
 Thu, 16 May 2019 14:03:23 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id c3so3533872otr.3;
 Thu, 16 May 2019 07:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=A0jIRjjrX5qk5QJs7UAl2yKQShbcxJfUChlkRjdVYcY=;
 b=r2Kv+ZgI8Uduh9w73ECkR3b6Qn5MGedNGiGVsDw3lsYlDxfLO6zXWuNgc+Do7fUuqY
 YcyK3ubUMx4YdLXa1GBHYsT1vox2qPO9kt/fsUgr21Hi/uUEh44J1QCh5Qa4v9wSELkp
 zbNs7S7ozGG52apbW4kpF+3rSqQePJCqmH+qWBT6zLSZVcBFElKgKxy07U5bFzFknATP
 Caio0RmjoHxzfmj1vLUolltlVkh9gNmfwrKFCX/BcRp82+N4a1Z6SlL5NhxrmOR2jCho
 NDy0OUs/9f5hIVNlLP45vd3Lr2XiwKcSynM1Yigmffov6Vb2o6WctJ7b+hGMAvKbb7ck
 CRDA==
X-Gm-Message-State: APjAAAVCq4W5T3NRo5l/WhV14RK406gHkrjhLI5ah6p22So0YPVY5Uub
 5jtdvF0w+zkgSj8K9WwgZU2zefHFr7SmSGeQutM=
X-Google-Smtp-Source: APXvYqxoiKtk36BcJTLdZmrGDGJjZ9eIwAOZ5N2t5FqGPQmjWY1EO8INR+yd7kDU1yYAfYEdg9BLaOAEgZ14ps/SxM0=
X-Received: by 2002:a9d:3c2:: with SMTP id f60mr27239946otf.74.1558015402560; 
 Thu, 16 May 2019 07:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <20181120185814.13362-1-Kenny.Ho@amd.com>
 <20190509210410.5471-1-Kenny.Ho@amd.com>
 <20190509210410.5471-5-Kenny.Ho@amd.com>
 <d81e8f55-9602-818e-0f9c-1d9d150133b1@intel.com>
 <CAOWid-ftUrVVWPu9KuS8xpWKNQT6_FtxB8gEyEAn9nLD6qxb5Q@mail.gmail.com>
 <7db2caae-7eab-7c6a-fe90-89cb9cae30b4@amd.com>
 <6e124f5e-f83f-5ca1-4616-92538f202653@gmail.com>
In-Reply-To: <6e124f5e-f83f-5ca1-4616-92538f202653@gmail.com>
From: Kenny Ho <y2kenny@gmail.com>
Date: Thu, 16 May 2019 10:03:10 -0400
Message-ID: <CAOWid-fQgah16ycz-V-ymsm7yKUnFTeTSBaW4MK=2mqUHhCcmw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/5] drm,
 cgroup: Add total GEM buffer allocation limit
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=A0jIRjjrX5qk5QJs7UAl2yKQShbcxJfUChlkRjdVYcY=;
 b=ErCWxkgR+nXomtoUR4fY/ddK8L5X7ssVnlmZCLlqLK4Wwt5LBHNQYTJuJz54lCMjJr
 Nd6h5e3hKxDWvATBUOTA2mmC+cBRpD+sDhYXShYq5UkxcemB0jFiZzndVj4d0YhDXCsA
 INKgWNMaPszz6fH9IjcZuxvxU36oHghpeipNiR7vMnmQmfyjhu/ZI+D1qkwd/34/eWqc
 VSFRWh4DeMZGwLXwr9YYlU7IoBYuPBr9sXTnfGQJQCQ8JMn0dWssVQE0VJ9mWD71zxeO
 xI8S+JFE0wbMkIS8zgqLk3nC8zOQVDCge0m1v3JkHhuoOC1g5Gnxcfur8CXmJZNvovjc
 3/rw==
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
Cc: "sunnanyong@huawei.com" <sunnanyong@huawei.com>, "Ho,
 Kenny" <Kenny.Ho@amd.com>, "Welty, Brian" <brian.welty@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Tejun Heo <tj@kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMzoyNSBBTSBDaHJpc3RpYW4gS8O2bmlnCjxja29lbmln
LmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4gQW0gMTYuMDUuMTkgdW0gMDk6MTYg
c2NocmllYiBLb2VuaWcsIENocmlzdGlhbjoKPiA+IEFtIDE2LjA1LjE5IHVtIDA0OjI5IHNjaHJp
ZWIgS2VubnkgSG86Cj4gPj4gT24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgNToyNiBQTSBXZWx0eSwg
QnJpYW4gPGJyaWFuLndlbHR5QGludGVsLmNvbT4gd3JvdGU6Cj4gPj4+IE9uIDUvOS8yMDE5IDI6
MDQgUE0sIEtlbm55IEhvIHdyb3RlOgo+ID4+Pj4gRWFjaCBmaWxlIGlzIG11bHRpLWxpbmVkIHdp
dGggb25lIGVudHJ5L2xpbmUgcGVyIGRybSBkZXZpY2UuCj4gPj4+IE11bHRpLWxpbmUgaXMgY29y
cmVjdCBmb3IgbXVsdGlwbGUgZGV2aWNlcywgYnV0IEkgYmVsaWV2ZSB5b3UgbmVlZAo+ID4+PiB0
byB1c2UgYSBLRVkgdG8gZGVub3RlIGRldmljZSBmb3IgYm90aCB5b3VyIHNldCBhbmQgZ2V0IHJv
dXRpbmVzLgo+ID4+PiBJIGRpZG4ndCBzZWUgeW91ciBzZXQgZnVuY3Rpb25zIHJlYWRpbmcgYSBr
ZXksIG9yIHRoZSBnZXQgZnVuY3Rpb25zCj4gPj4+IHByaW50aW5nIHRoZSBrZXkgaW4gb3V0cHV0
Lgo+ID4+PiBjZ3JvdXBzLXYyIGNvbnZlbnRpb25zIG1lbnRpb24gdXNpbmcgS0VZIG9mIG1ham9y
Om1pbm9yLCBidXQgSSB0aGluawo+ID4+PiB5b3UgY2FuIHVzZSBkcm1fbWlub3IgYXMga2V5Pwo+
ID4+IEdpdmVuIHRoaXMgY29udHJvbGxlciBpcyBzcGVjaWZpYyB0byB0aGUgZHJtIGtlcm5lbCBz
dWJzeXN0ZW0gd2hpY2gKPiA+PiB1c2VzIG1pbm9yIHRvIGlkZW50aWZ5IGRybSBkZXZpY2UsCj4g
PiBXYWl0IGEgc2Vjb25kLCB1c2luZyB0aGUgRFJNIG1pbm9yIGlzIGEgZ29vZCBpZGVhIGluIHRo
ZSBmaXJzdCBwbGFjZS4KPiBXZWxsIHRoYXQgc2hvdWxkIGhhdmUgcmVhZCAiaXMgbm90IGEgZ29v
ZCBpZGVhIi4uCj4KPiBJIGhhdmUgYSB0ZXN0IHN5c3RlbSB3aXRoIGEgVmVnYTEwIGFuZCBhIFZl
Z2EyMC4gV2hpY2ggZGV2aWNlIGdldHMgd2hpY2gKPiBtaW5vciBpcyBub3Qgc3RhYmxlLCBidXQg
cmF0aGVyIGRlZmluZWQgYnkgdGhlIHNjYW4gb3JkZXIgb2YgdGhlIFBDSWUgYnVzLgo+Cj4gTm9y
bWFsbHkgdGhlIHNjYW4gb3JkZXIgaXMgYWx3YXlzIHRoZSBzYW1lLCBidXQgYWRkaW5nIG9yIHJl
bW92aW5nCj4gZGV2aWNlcyBvciBkZWxheWluZyB0aGluZ3MganVzdCBhIGxpdHRsZSBiaXQgZHVy
aW5nIGluaXQgaXMgZW5vdWdoIHRvCj4gY2hhbmdlIHRoaXMuCj4KPiBXZSBuZWVkIHNvbWV0aGlu
ZyBsaWtlIHRoZSBMaW51eCBzeXNmcyBsb2NhdGlvbiBvciBzaW1pbGFyIHRvIGhhdmUgYQo+IHN0
YWJsZSBpbXBsZW1lbnRhdGlvbi4KCkkgZ2V0IHRoYXQsIHdoaWNoIGlzIHdoeSBJIGRvbid0IHVz
ZSBtaW5vciB0byBpZGVudGlmeSBjYXJkcyBpbiB1c2VyCnNwYWNlIGFwcHMgSSB3cm90ZToKaHR0
cHM6Ly9naXRodWIuY29tL1JhZGVvbk9wZW5Db21wdXRlL2s4cy1kZXZpY2UtcGx1Z2luL2Jsb2Iv
YzI2NTljOWQxZDA3MTNjYWQzNmZiNTI1NjY4MTEyNTEyMWU2ZTMyZi9pbnRlcm5hbC9wa2cvYW1k
Z3B1L2FtZGdwdS5nbyNMODUKCkJ1dCB3aXRoaW4gdGhlIGtlcm5lbCwgSSB0aGluayBteSB1c2Ug
b2YgbWlub3IgaXMgY29uc2lzdGVudCB3aXRoIHRoZQpyZXN0IG9mIHRoZSBkcm0gc3Vic3lzdGVt
LiAgSSBob3BlIEkgZG9uJ3QgbmVlZCB0byByZWZvcm0gdGhlIHdheSB0aGUKZHJtIHN1YnN5c3Rl
bSB1c2UgbWlub3IgaW4gb3JkZXIgdG8gaW50cm9kdWNlIGEgY2dyb3VwIGNvbnRyb2xsZXIuCgpS
ZWdhcmRzLApLZW5ueQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
