Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E2615021
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 17:26:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F99989A60;
	Mon,  6 May 2019 15:26:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDBFA89A60;
 Mon,  6 May 2019 15:26:47 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id d13so15161920qth.5;
 Mon, 06 May 2019 08:26:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=uVcv5gxrx40HJxyOUvgx5wp3GUe3viewKvbzXFxWMGA=;
 b=mHroJX7eG1TXv6j4IP/+W3OsnrrCWbyFmJx8rQLz2LdtuDE2oqG7JluJsPR1Wjo8Me
 2fhuRamCSbgy+WS41UA4o+P3FRUVISzKBZsm7fqYXzfED5ymblTWxihSwlRzgwlUbRh3
 BoDUMcd5lxgpX2NLiuXhHQrIreGXkK0OGJRKgA3eAXsLrerxBGrhS8aWN78cViVfuLwW
 z/rCDJ1bKZxRK9G2HghGhoEqxCnjyuEYK7oGufSTf00l/1FMm0hjCJsQD9FglYB3Jw8z
 SqgU3OrFfOC8biYP1elurpIRnZvfHvmc47rfb12kLcIIFTLVuZr4CHJI+PLKIAh4xRUP
 VfKg==
X-Gm-Message-State: APjAAAUIlH22pv/2JnMTmH/9MTUhr+hmYjsBIG/Z+JbfhbcWjszY8m43
 z7LoMoDLQvClPqJ7a+myWkQ=
X-Google-Smtp-Source: APXvYqzk+AOzpTMV+J/CSy5XKE9ZdY35ptnyEbfzsCREY2hn/LTfzkX9Rc7uiofd+Noq2KoA0jpolQ==
X-Received: by 2002:a0c:c3d0:: with SMTP id p16mr21166391qvi.229.1557156406665; 
 Mon, 06 May 2019 08:26:46 -0700 (PDT)
Received: from localhost ([2620:10d:c091:500::3:34f3])
 by smtp.gmail.com with ESMTPSA id u2sm6350591qkb.37.2019.05.06.08.26.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 08:26:45 -0700 (PDT)
Date: Mon, 6 May 2019 08:26:43 -0700
From: Tejun Heo <tj@kernel.org>
To: Brian Welty <brian.welty@intel.com>
Subject: Re: [RFC PATCH 0/5] cgroup support for GPU devices
Message-ID: <20190506152643.GL374014@devbig004.ftw2.facebook.com>
References: <20190501140438.9506-1-brian.welty@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190501140438.9506-1-brian.welty@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=uVcv5gxrx40HJxyOUvgx5wp3GUe3viewKvbzXFxWMGA=;
 b=kNAXGCHsJPJnSk1S+4Hg/yKLjuRyBetqYMtBT4XmcSvlaOngptLrBWAWSQgoiqt+qq
 SlmbaADYeoYs2HfxS6UfWLFGyn8M5xuWu3n6EixHYBJ7Gbt5FyiiTq1EeX3gA8bm+vak
 jGFJgpYrd9GmbR569UqwHwe6z7q0mSq57UIqZIu1f8aKEdr+dnd2zPk9D2fuR4/HHY/M
 hdOcV1rZ8Mincs1oNYqCdEsT9K3Fx5V2Oapm7YyfGJbMXdGnDdHgrPBrWz8DZQVWxEom
 aWp1VeBzaYII8ABKROan48kPGryi+mfYPaTQxA8d9J0qvZZKV73Y2vluuRgVTcnEq0i4
 ldKQ==
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Li Zefan <lizefan@huawei.com>, Vladimir Davydov <vdavydov.dev@gmail.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Alex Deucher <alexander.deucher@amd.com>,
 cgroups@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpPbiBXZWQsIE1heSAwMSwgMjAxOSBhdCAxMDowNDozM0FNIC0wNDAwLCBCcmlhbiBX
ZWx0eSB3cm90ZToKPiBUaGUgcGF0Y2ggc2VyaWVzIGVuYWJsZXMgZGV2aWNlIGRyaXZlcnMgdG8g
dXNlIGNncm91cHMgdG8gY29udHJvbCB0aGUKPiBmb2xsb3dpbmcgcmVzb3VyY2VzIHdpdGhpbiBh
IEdQVSAob3Igb3RoZXIgYWNjZWxlcmF0b3IgZGV2aWNlKToKPiAqICBjb250cm9sIGFsbG9jYXRp
b24gb2YgZGV2aWNlIG1lbW9yeSAocmV1c2Ugb2YgbWVtY2cpCj4gYW5kIHdpdGggZnV0dXJlIHdv
cmssIHdlIGNvdWxkIGV4dGVuZCB0bzoKPiAqICB0cmFjayBhbmQgY29udHJvbCBzaGFyZSBvZiBH
UFUgdGltZSAocmV1c2Ugb2YgY3B1L2NwdWFjY3QpCj4gKiAgYXBwbHkgbWFzayBvZiBhbGxvd2Vk
IGV4ZWN1dGlvbiBlbmdpbmVzIChyZXVzZSBvZiBjcHVzZXRzKQo+IAo+IEluc3RlYWQgb2YgaW50
cm9kdWNpbmcgYSBuZXcgY2dyb3VwIHN1YnN5c3RlbSBmb3IgR1BVIGRldmljZXMsIGEgbmV3Cj4g
ZnJhbWV3b3JrIGlzIHByb3Bvc2VkIHRvIGFsbG93IGRldmljZXMgdG8gcmVnaXN0ZXIgd2l0aCBl
eGlzdGluZyBjZ3JvdXAKPiBjb250cm9sbGVycywgd2hpY2ggY3JlYXRlcyBwZXItZGV2aWNlIGNn
cm91cF9zdWJzeXNfc3RhdGUgd2l0aGluIHRoZQo+IGNncm91cC4gIFRoaXMgZ2l2ZXMgZGV2aWNl
IGRyaXZlcnMgdGhlaXIgb3duIHByaXZhdGUgY2dyb3VwIGNvbnRyb2xzCj4gKHN1Y2ggYXMgbWVt
b3J5IGxpbWl0cyBvciBvdGhlciBwYXJhbWV0ZXJzKSB0byBiZSBhcHBsaWVkIHRvIGRldmljZQo+
IHJlc291cmNlcyBpbnN0ZWFkIG9mIGhvc3Qgc3lzdGVtIHJlc291cmNlcy4KPiBEZXZpY2UgZHJp
dmVycyAoR1BVIG9yIG90aGVyKSBhcmUgdGhlbiBhYmxlIHRvIHJldXNlIHRoZSBleGlzdGluZyBj
Z3JvdXAKPiBjb250cm9scywgaW5zdGVhZCBvZiBpbnZlbnRpbmcgc2ltaWxhciBvbmVzLgoKSSdt
IHJlYWxseSBza2VwdGljYWwgYWJvdXQgdGhpcyBhcHByb2FjaC4gIFdoZW4gY3JlYXRpbmcgcmVz
b3VyY2UKY29udHJvbGxlcnMsIEkgdGhpbmsgd2hhdCdzIHRoZSBtb3N0IGltcG9ydGFudCBhbmQg
Y2hhbGxlbmdpbmcgaXMKZXN0YWJsaXNoaW5nIHJlc291cmNlIG1vZGVsIC0gd2hhdCByZXNvdXJj
ZXMgYXJlIGFuZCBob3cgdGhleSBjYW4gYmUKZGlzdHJpYnV0ZWQuICBUaGlzIHBhdGNoc2V0IGlz
IGdvaW5nIHRoZSBvdGhlciB3YXkgYXJvdW5kIC0gYnVpbGRpbmcKb3V0IGNvcmUgaW5mcmFzdHJ1
Y3R1cmUgZm9yIGJvbGllcnBsYXRlcyBhdCBhIHNpZ25pZmljYW50IHJpc2sgb2YKbWl4aW5nIHVw
IHJlc291cmNlIG1vZGVscyBhY3Jvc3MgZGlmZmVyZW50IHR5cGVzIG9mIHJlc291cmNlcy4KCklP
IGNvbnRyb2xsZXJzIGFscmVhZHkgaW1wbGVtZW50IHBlci1kZXZpY2UgY29udHJvbHMuICBJJ2Qg
c3VnZ2VzdApmb2xsb3dpbmcgdGhlIHNhbWUgaW50ZXJmYWNlIGNvbnZlbnRpb25zIGFuZCBpbXBs
ZW1lbnRpbmcgYSBkZWRpY2F0ZWQKY29udHJvbGxlciBmb3IgdGhlIHN1YnN5c3RlbS4KClRoYW5r
cy4KCi0tIAp0ZWp1bgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
