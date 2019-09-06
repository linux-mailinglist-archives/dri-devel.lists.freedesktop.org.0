Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CD2ABC37
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 17:23:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A1FF6E2E6;
	Fri,  6 Sep 2019 15:23:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D49F6E2E1;
 Fri,  6 Sep 2019 15:23:24 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id d26so6023664qkk.2;
 Fri, 06 Sep 2019 08:23:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=OJ2aInTH+ll02m34eiKB5anEI6az0ahAcVsZsWlgcJc=;
 b=ZrCRLo3W/d485lLF9JoEh0K8uPFFGZaJPooKVbNfijv39rKX2j3HNHVD9QvyN+8ARy
 oymnGc6JgOWuq/7R/KmZue73I8/k7fv/SHpq+9mBJYY4xDUJFegAKKsWuh3TIboGJOwe
 +rvvi9D6BejnbGcEl4MS+tIkrleYuj70L5X6LyaHbQ3vGmgpDjZKf+pSgxDmNFQQJxAT
 Zj01ihHvQztwXmdxDjMCbVf1VH2uzfYMyD2J3/4fMtX29kPaQKZ/6XIyeMPsQ7dblsT6
 MCUYfiV52iX75kR/qmtsfxRT6xm1XcMcPE2qUbbox6EhDMzomcgIzi+jFHjcxCLp1fqX
 Q28Q==
X-Gm-Message-State: APjAAAXqf9Hb2iRnxJZrRmU/HhGufBv6TCKyd6mNCUnaRc6/P0HEAGj3
 QXPp3uq/AEf45VMdBfgxYbs=
X-Google-Smtp-Source: APXvYqxWCuFp0bfkKuq41IsDLncbaoUCMpj4GmWjBh9gcJ7tAJ2yOJo7NrzKNUpTK0fRYBeUv0Y4jw==
X-Received: by 2002:a37:4f4c:: with SMTP id d73mr9375226qkb.171.1567783403281; 
 Fri, 06 Sep 2019 08:23:23 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::e7cb])
 by smtp.gmail.com with ESMTPSA id i66sm3293712qkb.105.2019.09.06.08.23.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Sep 2019 08:23:22 -0700 (PDT)
Date: Fri, 6 Sep 2019 08:23:20 -0700
From: Tejun Heo <tj@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH RFC v4 00/16] new cgroup controller for gpu/drm subsystem
Message-ID: <20190906152320.GM2263813@devbig004.ftw2.facebook.com>
References: <20190829060533.32315-1-Kenny.Ho@amd.com>
 <20190831042857.GD2263813@devbig004.ftw2.facebook.com>
 <20190903075550.GJ2112@phenom.ffwll.local>
 <20190903185013.GI2263813@devbig004.ftw2.facebook.com>
 <CAKMK7uE5Bj-3cJH895iqnLpwUV+GBDM1Y=n4Z4A3xervMdJKXg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uE5Bj-3cJH895iqnLpwUV+GBDM1Y=n4Z4A3xervMdJKXg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=OJ2aInTH+ll02m34eiKB5anEI6az0ahAcVsZsWlgcJc=;
 b=UO76zrFl49LKNJTSDdriZCNJ7IyuMqcUrBY7wZJo92eM2VFOtWq3obIUqVB3OV5wK5
 g0aMdU/P5Bie5xF38jeVaHiOGa5A07Is5Dr2yKz5YkKCN/DY0AkBLJ5iMMHlwt1SNN+A
 NTp7mU6lP1/o/J1Oxwuy42XCnYbKcO9t8gU3Sm+U3Jlh7DLdOiNEoYfmJATFcpZBuwgy
 2Gb3wV+35UmTZdwRdpVcsh0qaMPs1C8JpZ3OjMGAYNS3TWBM5lSvQo/DIuERiPUhWrjF
 hVBue2c+XioJnHHcwEDd/febjuSCcKx5MclkFqjwnDCneZcrrTN6k2VhBfD1Mi4lybAS
 LIhw==
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
Cc: Kenny Ho <Kenny.Ho@amd.com>, "Kuehling, Felix" <felix.kuehling@amd.com>,
 jsparks@cray.com, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 lkaplan@cray.com, Kenny Ho <y2kenny@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, joseph.greathouse@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, cgroups@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sIERhbmllbC4KCk9uIFR1ZSwgU2VwIDAzLCAyMDE5IGF0IDA5OjQ4OjIyUE0gKzAyMDAs
IERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gSSB0aGluayBzeXN0ZW0gbWVtb3J5IHNlcGFyYXRlIGZy
b20gdnJhbSBtYWtlcyBzZW5zZS4gRm9yIG9uZSwgdnJhbSBpcwo+IGxpa2UgMTB4KyBmYXN0ZXIg
dGhhbiBzeXN0ZW0gbWVtb3J5LCBzbyB3ZSBkZWZpbml0ZWx5IHdhbnQgdG8gaGF2ZQo+IGdvb2Qg
Y29udHJvbCBvbiB0aGF0LiBCdXQgbWF5YmUgd2Ugb25seSB3YW50IG9uZSB2cmFtIGJ1Y2tldCBv
dmVyYWxsCj4gZm9yIHRoZSBlbnRpcmUgc3lzdGVtPwo+IAo+IFRoZSB0cm91YmxlIHdpdGggc3lz
dGVtIG1lbW9yeSBpcyB0aGF0IGdwdSB0YXNrcyBwaW4gdGhhdCBtZW1vcnkgdG8KPiBwcmVwIGV4
ZWN1dGlvbi4gVGhlcmUncyB0d28gc29sdXRpb25zOgo+IC0gaTkxNSBoYXMgYSBzaHJpbmtlci4g
TG90cyAoYW5kIEkgcmVhbGx5IG1lYW4gbG90cykgb2YgcGFpbiB3aXRoCj4gZGlyZWN0IHJlY2xh
aW0gcmVjdXJzaW9uLCB3aGljaCBvZnRlbiBtZWFucyB3ZSBjYW4ndCBmcmVlIG1lbW9yeSwgYW5k
Cj4gd2UncmUgYW5nZXJpbmcgdGhlIG9vbSBraWxsZXIgYSBsb3QuIFBsdXMgaXQgaW50cm9kdWNl
cyByZWFsIGJhZAo+IGxhdGVuY3kgc3Bpa2VzIGV2ZXJ5d2hlcmUgKGdwdSB3b3JrbG9hZHMgYXJl
IG9jY2FzaW9uYWxseSByZWFsbHkgc2xvdywKPiB0aGluayAid29yc2UgdGhhbiBwYWdlb3V0IHRv
IHNwaW5uaW5nIHJ1c3QiIHRvIGdldCBtZW1vcnkgZnJlZWQpLgo+IC0gdHRtIGp1c3QgaGFzIGEg
Z2xvYmFsIGxpbWl0LCBzZXQgdG8gNTAlIG9mIHN5c3RlbSBtZW1vcnkuCj4gCj4gSSBkbyB0aGlu
ayBhIGdsb2JhbCBzeXN0ZW0gbWVtb3J5IGxpbWl0IHRvIHRhbWUgdGhlIHNocmlua2VyLCB3aXRo
b3V0Cj4gdGhlIHR0bSBhcHByb2FjaCBvZiBwb3NzaWJsZSBqdXN0IHdhc3RpbmcgaGFsZiB5b3Vy
IG1lbW9yeSwgY291bGQgYmUKPiB1c2VmdWwuCgpIbW0uLi4gd2hhdCdkIGJlIHRoZSBmdW5kYW1l
bnRhbCBkaWZmZXJlbmNlIGZyb20gc2xhYiBvciBzb2NrZXQgbWVtb3J5CndoaWNoIGFyZSBoYW5k
bGVkIHRocm91Z2ggbWVtY2c/ICBJcyBzeXN0ZW0gbWVtb3J5IHVzZWQgYnkgR1BVcyBoYXZlCmZ1
cnRoZXIgZ2xvYmFsIHJlc3RyaWN0aW9ucyBpbiBhZGRpdGlvbiB0byB0aGUgYW1vdW50IG9mIHBo
eXNpY2FsCm1lbW9yeSB1c2VkPwoKPiBJJ20gYWxzbyBub3Qgc3VyZSBvZiB0aGUgYncgbGltaXRz
LCBnaXZlbiBhbGwgdGhlIGZ1biB3ZSBoYXZlIG9uIHRoZQo+IGJsb2NrIGlvIGNncm91cHMgc2lk
ZS4gQXNpZGUgZnJvbSB0aGF0IHRoZSBjdXJyZW50IGJ3IGxpbWl0IG9ubHkKPiBjb250cm9scyB0
aGUgYncgdGhlIGtlcm5lbCB1c2VzLCB1c2Vyc3BhY2UgY2FuIHN1Ym1pdCB1bmxpbWl0ZWQKPiBh
bW91bnRzIG9mIGNvcHlpbmcgY29tbWFuZHMgdGhhdCB1c2UgdGhlIHNhbWUgcGNpZSBsaW5rcyBk
aXJlY3RseSB0bwo+IHRoZSBncHUsIGJ5cGFzc2luZyB0aGlzIGNnIGtub2IuIEFsc28sIGNvbnRy
b2xsaW5nIGV4ZWN1dGlvbiB0aW1lIGZvcgo+IGdwdXMgaXMgdmVyeSB0cmlja3ksIHNpbmNlIHRo
ZXkgd29yayBhIGxvdCBtb3JlIGxpa2UgYSBibG9jayBpbyBkZXZpY2UKPiBvciBtYXliZSBhIG5l
dHdvcmsgY29udHJvbGxlciB3aXRoIHBhY2tldCBzY2hlZHVsaW5nLCB0aGFuIGEgY3B1LgoKQXQg
dGhlIHN5c3RlbSBsZXZlbCwgaXQganVzdCBnZXRzIGZvbGRlZCBpbnRvIGNwdSB0aW1lLCB3aGlj
aCBpc24ndApwZXJmZWN0IGJ1dCBpcyB1c3VhbGx5IGEgZ29vZCBlbm91Z2ggYXBwcm94aW1hdGlv
biBvZiBjb21wdXRlIHJlbGF0ZWQKZHluYW1pYyByZXNvdXJjZXMuICBDYW4gZ3B1IGRvIHNvbWV0
aW5nIHNpbWlsYXIgb3IgYXQgbGVhc3Qgc3RhcnQgd2l0aAp0aGF0PwoKVGhhbmtzLgoKLS0gCnRl
anVuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
