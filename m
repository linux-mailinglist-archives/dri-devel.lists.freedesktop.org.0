Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BA3D464E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 19:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 201266E06D;
	Fri, 11 Oct 2019 17:12:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5806E06D;
 Fri, 11 Oct 2019 17:12:51 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id q203so9567488qke.1;
 Fri, 11 Oct 2019 10:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=NuMSmBYvIUrurNU4suw+Rbb1VhTuXsZkS4OjxBP9q68=;
 b=Gi3IkahY6YniFDxd9exjhh1sPMZ9meP+zmCZorRX2USnrb03T2FKnWhv5BLTTV2SyF
 R1YSOHx0l6xzjFZKkoWLtjI76bySjjCoY6JvYGTgAw6yPUi50sGHIlCW9wz/zIlTZO5R
 SgpVQjTr/k4OlhmKbAdPrwtwqtVL874Z/TvsJhrnFz5TNVBDjk8T8PEcJVBr3YOZeFaF
 2PIKmOx0/Ht315u5V+jGtCv0cCVeAgjHkbcK2JdCtOeZCqoYo/XiQmcMV3LOhEeG9ymD
 20Haf8Oj9t2O+QtqEWEd71XT8IGwZKDUkffAM/55GQS4n2Hk9g5fAxrYvd2JyezA+Dih
 1bDw==
X-Gm-Message-State: APjAAAUzKG2dA7JrGwjCtVtPYw3xwGrrTTOsTcJOoUrRS55xbZbMhDxJ
 neS2Bl2ApvUBl6KLm7w6e5M=
X-Google-Smtp-Source: APXvYqw3aInVVpQ+UOpQlX/invdq43B1H1nhl6BPEPRXEZ/Jpdfbxpy3mSHsbispioWm387SJTIb2A==
X-Received: by 2002:a37:7603:: with SMTP id r3mr16289209qkc.116.1570813970112; 
 Fri, 11 Oct 2019 10:12:50 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::3741])
 by smtp.gmail.com with ESMTPSA id z72sm5103213qka.115.2019.10.11.10.12.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 11 Oct 2019 10:12:49 -0700 (PDT)
Date: Fri, 11 Oct 2019 10:12:47 -0700
From: "tj@kernel.org" <tj@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH RFC v4 14/16] drm, cgroup: Introduce lgpu as DRM cgroup
 resource
Message-ID: <20191011171247.GC18794@devbig004.ftw2.facebook.com>
References: <20190829060533.32315-1-Kenny.Ho@amd.com>
 <20190829060533.32315-15-Kenny.Ho@amd.com>
 <b3d2b3c1-8854-10ca-3e39-b3bef35bdfa9@amd.com>
 <20191009103153.GU16989@phenom.ffwll.local>
 <ee873e89-48fd-c4c9-1ce0-73965f4ad2ba@amd.com>
 <20191009153429.GI16989@phenom.ffwll.local>
 <c7812af4-7ec4-02bb-ff4c-21dd114cf38e@amd.com>
 <20191009160652.GO16989@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191009160652.GO16989@phenom.ffwll.local>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=NuMSmBYvIUrurNU4suw+Rbb1VhTuXsZkS4OjxBP9q68=;
 b=ifvZPXB31gLgdDyQ1v2wmXMiJAA0+/dNBlNr8lvPChRMn2r8frAWWSSuzlADbd0x9F
 PwtSNFLEyXqP7Hv7tQBqj8xjr2eW0UW9qRExAnBsyeNf/O40DVsSyXkqTgBp8unKGsmD
 WiEAb03SDqljViosFXOo3I4a917SFHJDrYwIHbZ1GVmBXnSTbpfvh+CiK2MpeYLPRm3T
 qdLfMVcqgTUZqvZM9e+Buwk1CmSFbGOrXFR8qnjA+8HkwiBSFMxguekxpbmipVYYASg0
 vY9kbiVsOkdR6UoXKvFew+HyfxKFw7BUr7GgV2JF5wxAyjGJ2KQK+gwDZUVDzR7TgAQw
 O+4w==
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
Cc: "Ho, Kenny" <Kenny.Ho@amd.com>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "jsparks@cray.com" <jsparks@cray.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "lkaplan@cray.com" <lkaplan@cray.com>, "y2kenny@gmail.com" <y2kenny@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Greathouse, Joseph" <Joseph.Greathouse@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sIERhbmllbC4KCk9uIFdlZCwgT2N0IDA5LCAyMDE5IGF0IDA2OjA2OjUyUE0gKzAyMDAs
IERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gVGhhdCdzIG5vdCB0aGUgcG9pbnQgSSB3YXMgbWFraW5n
LiBGb3IgY3B1IGNncm91cHMgdGhlcmUncyBhIHZlcnkgd2VsbAo+IGRlZmluZWQgY29ubmVjdGlv
biBiZXR3ZWVuIHRoZSBjcHUgYml0bWFza3MvbnVtYmVycyBpbiBjZ3JvdXBzIGFuZCB0aGUgY3B1
Cj4gYml0bWFza3MgeW91IHVzZSBpbiB2YXJpb3VzIHN5c3RlbSBjYWxscyAodGhleSBtYXRjaCku
IEFuZCB0aGF0IHN0dWZmCj4gd29ya3MgYWNyb3NzIHZlbmRvcnMuCgpQbGVhc2Ugbm90ZSB0aGF0
IHRoZXJlIGFyZSBhIGxvdCBvZiBsaW1pdGF0aW9ucyBldmVuIHRvIGNwdXNldC4KQWZmaW5pdHkg
aXMgZWFzeSB0byBpbXBsZW1lbnQgYW5kIHNlZW1zIGF0dHJhY3RpdmUgaW4gdGVybXMgb2YKYWJz
b2x1dGUgaXNvbGF0aW9uIGJ1dCBpdCdzIGluaGVyZW50bHkgY3VtYmVyc29tZSBhbmQgbGltaXRl
ZCBpbgpncmFudWxhcml0eSBhbmQgY2FuIGxlYWQgdG8gc3VycHJpc2luZyBmYWlsdXJlIG1vZGVz
IHdoZXJlIGNvbnRlbnRpb24Kb24gb25lIGNwdSBjYW4ndCBiZSByZXNvbHZlZCBieSB0aGUgbG9h
ZCBiYWxhbmNlciBhbmQgbGVhZHMgdG8gc3lzdGVtCndpZGUgc2xvd2Rvd25zIC8gc3RhbGxzIGNh
dXNlZCBieSB0aGUgZGVwZW5kZW5jeSBjaGFpbiBhbmNob3JlZCBhdCB0aGUKYWZmaW5pdHkgbGlt
aXRlZCB0YXNrcy4KCk1heWJlIHRoaXMgaXMgYSBsZXNzIG9mIGEgcHJvYmxlbSBmb3IgZ3B1IHdv
cmtsb2FkcyBidXQgaW4gZ2VuZXJhbCB0aGUKbW9yZSBjb25zdHJhaW50cyBhcmUgcHV0IG9uIHNj
aGVkdWxpbmcsIHRoZSBtb3JlIGxpa2VseSBpcyB0aGUgc3lzdGVtCnRvIGRldmVsb3AgdHdpc3Rl
ZCBkZXBlbmRlbmN5IGNoYWlucyB3aGlsZSBvdGhlciBwYXJ0cyBvZiB0aGUgc3lzdGVtCmFyZSBz
aXR0aW5nIGlkbGUuCgpIb3cgZG9lcyBzY2hlZHVsaW5nIGN1cnJlbnRseSB3b3JrIHdoZW4gdGhl
cmUgYXJlIGNvbXBldGluZyBncHUKd29ya2xvYWRzPyAgVGhlcmUgZ290dGEgYmUgc29tZSBmYWly
bmVzcyBwcm92aXNpb24gd2hldGhlciB0aGF0J3MgdW5pdAphbGxvY2F0aW9uIGJhc2VkIG9yIHRp
bWUgc2xpY2luZywgcmlnaHQ/ICBJZiB0aGF0J3MgdGhlIGNhc2UsIGl0IG1pZ2h0CmJlIGJlc3Qg
dG8gaW1wbGVtZW50IHByb3BvcnRpb25hbCBjb250cm9sIG9uIHRvcCBvZiB0aGF0LgpXb3JrLWNv
bnNlcnZpbmcgbWVjaGFuaXNtcyBhcmUgdGhlIG1vc3QgdmVyc2F0aWxlLCBlYXNpZXN0IHRvIHVz
ZSBhbmQKbGVhc3QgbGlrZWx5IHRvIGNhdXNlIHJlZ3Jlc3Npb25zLgoKVGhhbmtzLgoKLS0gCnRl
anVuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
