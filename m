Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B8318E80
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 18:52:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6DEA893CD;
	Thu,  9 May 2019 16:52:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1502C893CD;
 Thu,  9 May 2019 16:52:36 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id f24so3258321qtk.11;
 Thu, 09 May 2019 09:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=jUsBtZeNw5FNZWL8p+EHmLQcD3RYdpay6K7eQaM/McY=;
 b=jL9FZLFUmDF8hMitS6hKxbOI3IrTis4gIS8LqMRFsFwPTgatJnAalmE+SFm+A8FIlt
 UHQ7Lz0IKOV50tIuOd8BtaFgiqZVdPYQh5dB5poE/P4hu7T61QnkZLiIKGEgNDaebXI8
 kzzZrUr9e4Z8Ww/nG01gofbNfWQNGve1wUX/oruq8QhcuO3OzHuqeJmps8h4K+gceO8q
 T8rWY3eqSnb/FwHW1adKM8v6qUooVnEmt17o5SWKApCcfy7Ly8YfiBehBN6ytrpPUq0q
 Xffg8NaRm5cmaIa2Ggw9SlXDsZOcB+Q3RHJeoqWGOu6xN7uFTUu/F0PlRn/3NYX5JMmu
 jtgg==
X-Gm-Message-State: APjAAAVc1n6Iw6cDYUdO/arVlvQihme6QDk6h5n5if95kaJgVTAeWQRv
 p9+5363+R8OBInhUX6MWOwk=
X-Google-Smtp-Source: APXvYqx1t5kT+XXZFiBv+VqPqn8kVEYcdTa7Y4TE5pWMD/WmWnopKPh7/3rEKvsPEmRwg0IA9htZcQ==
X-Received: by 2002:ac8:19f5:: with SMTP id s50mr4695898qtk.281.1557420754955; 
 Thu, 09 May 2019 09:52:34 -0700 (PDT)
Received: from localhost ([2620:10d:c091:500::1:c346])
 by smtp.gmail.com with ESMTPSA id x47sm1527214qth.68.2019.05.09.09.52.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 09:52:34 -0700 (PDT)
Date: Thu, 9 May 2019 09:52:32 -0700
From: Tejun Heo <tj@kernel.org>
To: "Welty, Brian" <brian.welty@intel.com>
Subject: Re: [RFC PATCH 0/5] cgroup support for GPU devices
Message-ID: <20190509165232.GW374014@devbig004.ftw2.facebook.com>
References: <20190501140438.9506-1-brian.welty@intel.com>
 <20190506152643.GL374014@devbig004.ftw2.facebook.com>
 <cf58b047-d678-ad89-c9b6-96fc6b01c1d7@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cf58b047-d678-ad89-c9b6-96fc6b01c1d7@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jUsBtZeNw5FNZWL8p+EHmLQcD3RYdpay6K7eQaM/McY=;
 b=lZ76QuoWP/RlQ75YXkOJcraYtkNTORpFzzVYzxh33URZ1VMjG3Xx5DjtZ3CHin9xa5
 fS/xGH7+lJxkoHr7QwVmyDAjbeF7nvOmxv9beDILF+sB+8CiqCfnpouLazaG1HGm4wWr
 sSEbhOG5/jozTrc/fsmtxtN959XvvWOXy5liSIq+k6J+n2dlsbSH6ap+adywXTDR7kLx
 KiqF0AAJVljqXt6esw6EBUoQy090O3TR79BAiDBzt0e3J3KThFw2L3AVAsylb2+p2P5b
 a2N9dHCQk3vpX1jSLasmI3wCY61bPxdTWmHGDEdgCCrPI+I3gdezXTWfZ9jvSdaQw7fz
 mByg==
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
Cc: Leon Romanovsky <leon@kernel.org>, David Airlie <airlied@linux.ie>,
 kenny.ho@amd.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Li Zefan <lizefan@huawei.com>, Vladimir Davydov <vdavydov.dev@gmail.com>,
 Johannes Weiner <hannes@cmpxchg.org>, cgroups@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 RDMA mailing list <linux-rdma@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpPbiBUdWUsIE1heSAwNywgMjAxOSBhdCAxMjo1MDo1MFBNIC0wNzAwLCBXZWx0eSwg
QnJpYW4gd3JvdGU6Cj4gVGhlcmUgbWlnaHQgc3RpbGwgYmUgbWVyaXQgaW4gaGF2aW5nIGEgJ2Rl
dmljZSBtZW0nIGNncm91cCBjb250cm9sbGVyLgo+IFRoZSByZXNvdXJjZSBtb2RlbCBhdCBsZWFz
dCBpcyB0aGVuIG5vIGxvbmdlciBtaXhlZCB1cCB3aXRoIGhvc3QgbWVtb3J5Lgo+IFJETUEgY29t
bXVuaXR5IHNlZW1lZCB0byBoYXZlIHNvbWUgaW50ZXJlc3QgaW4gYSBjb21tb24gY29udHJvbGxl
ciBhdAo+IGxlYXN0IGZvciBkZXZpY2UgbWVtb3J5IGFzcGVjdHMuCj4gVGhvdWdodHMgb24gdGhp
cz8gICBJIGJlbGlldmUgY291bGQgc3RpbGwgcmV1c2UgdGhlICdzdHJ1Y3QgbWVtX2Nncm91cCcg
ZGF0YQo+IHN0cnVjdHVyZS4gIFRoZXJlIHNob3VsZCBiZSBzb21lIG9wcG9ydHVuaXR5IHRvIHJl
dXNlIGNoYXJnaW5nIEFQSXMgYW5kCj4gaGF2ZSBzb21lIG5pY2UgaW50ZWdyYXRpb24gd2l0aCBI
TU0gZm9yIGNoYXJnaW5nIHRvIGRldmljZSBtZW1vcnksIGRlcGVuZGluZwo+IG9uIGJhY2tpbmcg
c3RvcmUuCgpMaWJyYXJ5LWlzaCBzaGFyaW5nIGlzIGZpbmUgYnV0IGluIHRlcm1zIG9mIGludGVy
ZmFjZSwgSSB0aGluayBpdCdkIGJlCmJldHRlciB0byBrZWVwIHRoZW0gc2VwYXJhdGUgYXQgbGVh
c3QgZm9yIG5vdy4gIERvd24gdGhlIGxpbmUgbWF5YmUKdGhlc2UgcmVzb3VyY2VzIHdpbGwgaW50
ZXJhY3Qgd2l0aCBlYWNoIG90aGVyIGluIGEgbW9yZSBpbnRlZ3JhdGVkIHdheQpidXQgSSBkb24n
dCB0aGluayBpdCdzIGEgZ29vZCBpZGVhIHRvIHRyeSB0byBkZXNpZ24gYW5kIGltcGxlbWVudApy
ZXNvdXJjZSBtb2RlbHMgZm9yIHNvbWV0aGluZyBsaWtlIHRoYXQgcHJlZW1wdGl2ZWx5LgoKVGhh
bmtzLgoKLS0gCnRlanVuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
