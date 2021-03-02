Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0754432AC85
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 23:53:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2034A6E29D;
	Tue,  2 Mar 2021 22:53:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545846E28A;
 Tue,  2 Mar 2021 22:53:25 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id mm21so38158426ejb.12;
 Tue, 02 Mar 2021 14:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SBf1AJb9EdpD1tLxm/hr0d4X6asZC8lvXwuuUxwzI0k=;
 b=SFCvXSfDnXKmDiBntDQ3HhhjDv1BUT1f49sz3EtWcxdmAJWqUHza3f+nojyfSdReAE
 1OWF13UIkReZvm6D2LggNEX0y1Adg2s7Jw0Soc88PKJTxM76hUxudjmWkDUw91WaEjrJ
 t1efgzZOmkFIAMybduHqTzRRdCT0DJy0GyKhPdACsoaXah3MBkXQhh+RRGYoHCkMlYbF
 Y5LJL9oX+gfTXrMgWih1Lx4DR9zu9f7UwsqqK1wh+0UVOaKohtO+nDfUXjRlUs5m/Pgs
 vB811RNQw1RtjzYBnIN0AbFdqGFC2g+l3K/lxzSwHWpXz6BubsSDC1lzniVH6829ohcR
 +cKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SBf1AJb9EdpD1tLxm/hr0d4X6asZC8lvXwuuUxwzI0k=;
 b=LCVQLDQJl0BsHThuLgLTIWLUpNSw6ZZpzC0bfNXh+VgtVjOLrYpW/ZGVXZ8Vb/NN3D
 5Fo+AzRY7XRmjeGZCQ/grST+24F0RVzWSLJs3oByoMlaEUX8RIu8a8+DRZNDFzCQxF9N
 z0m/TT1o4QqipHXU3VOJNmRmqUlEGC6PQWz64vPv3j0/c8XM9S02MHJzeaOUQxzqkvPT
 Qk+ZzW85gnIgQeHx4C7Z9deav9IHuw3l3r80DyUziQ9VkyjuoQFCDDZLWb8shrqO25Y+
 Jr/9I3lueNCx2MK/1MsbqkUG+30+6VjHc3osOhaAPcHoeQ1kPP0pG4QmeXxeM0+B/nSI
 Hnjg==
X-Gm-Message-State: AOAM533E72/qpk2Kb4/HQjRI6fP8JVk6HDsGb2UTIuA2dMMx0pFywIeA
 lFzGjNEPYpFrvp0wZMOBLIpLQghZwymJntCqmXE=
X-Google-Smtp-Source: ABdhPJx+ooDsadMSwgD7IHVdZfg8CXVNw8i+etr8HqoS2H2q4MN9Mj5b5LLD8WE/oq+rVom/2mDkSYlaOlQS/VqLGKs=
X-Received: by 2002:a17:906:ad96:: with SMTP id
 la22mr23902401ejb.237.1614725603988; 
 Tue, 02 Mar 2021 14:53:23 -0800 (PST)
MIME-Version: 1.0
References: <1614638628-10508-1-git-send-email-Oak.Zeng@amd.com>
 <202103021104.NudsKKei-lkp@intel.com>
 <34b706ca-d15f-223f-e1a3-2ec071d578a2@gmail.com>
 <DM6PR12MB4732C8CF2FE2642A44B32C9C80999@DM6PR12MB4732.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB4732C8CF2FE2642A44B32C9C80999@DM6PR12MB4732.namprd12.prod.outlook.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 3 Mar 2021 08:53:12 +1000
Message-ID: <CAPM=9txN_i922jP1CB1tQepBoK7qNfLq-q-nRzV6yMYP9r6xSg@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: ioremap buffer according to TTM mem caching
 setting
To: "Zeng, Oak" <Oak.Zeng@amd.com>
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
Cc: "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28Intel=29?= <thomas_os@shipmail.org>,
 "Kasiviswanathan, Harish" <Harish.Kasiviswanathan@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Huang,
 JinHuiEric" <JinHuiEric.Huang@amd.com>, Dave Airlie <airlied@redhat.com>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAzIE1hciAyMDIxIGF0IDA4OjQ1LCBaZW5nLCBPYWsgPE9hay5aZW5nQGFtZC5jb20+
IHdyb3RlOgo+Cj4gW0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEludGVybmFsIERpc3RyaWJ1dGlv
biBPbmx5XQo+Cj4KPiBIaSBEYW5pZWwsIFRob21hcywgRGFuLAo+Cj4KPgo+IERvZXMgYmVsb3cg
bWVzc2FnZSBtZWFuIHRoZSBjYWxsaW5nIGlvcmVtYXBfY2FjaGUgZmFpbGVkIGludGVs4oCZcyBk
cml2ZXIgYnVpbGQ/IEkgY2FuIHNlZSBib3RoIGlvcmVtYXBfY2FjaGUgYW5kIGlvcmVtYXBfd2Mg
YXJlIGRlZmluZWQgaW4gYXJjaC94ODYvbW0vaW9yZW1hcC5jIOKAkyB3aHkgaW9yZW1hcF93YyBk
b2VzbuKAmXQgYnJlYWsgaW50ZWwgZHJpdmVy4oCZcyBidWlsZD8KCkp1c3QgdG8gY2xlYXIgdXAg
Y29uZnVzaW9uIGhlcmUsIHRoZSBsaW51eCBrZXJuZWwgcm9ib3QgaXMgaG9zdGVkIGJ5CkludGVs
IGl0IGRvZXMgbm90IHRlc3QgaW50ZWwgZHJpdmVyIGJ1aWxkcyBleGNsdXNpdmVseSwgaXQgdGVz
dHMgYSBsb3QKb2YgZGlmZmVyZW50IGJ1aWxkcyBhY3Jvc3MgbG90cyBvZiBkaWZmZXJlbnQgYXJj
aGl0ZWN0dXJlcywuCgpJZiB0aGUgcm9ib3QgY29tcGxhaW5zIGl0J3MgYmVjYXVzZSB5b3VyIHBh
dGNoIGJyZWFrcyBpbiB0aGUKY29uZmlndXJhdGlvbiBpdCBkZXNjcmliZXMsIHRha2UgdGhlIHRp
bWUgdG8gcmVhZCB0aGF0IGNvbmZpZ3VyYXRpb24KaW5mbyBhbmQgcmVhbGlzZSBpdCdzIG5vdGhp
bmcgdG8gZG8gd2l0aCBJbnRlbCBhdCBhbGwuCgpEYXZlLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
