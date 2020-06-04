Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7030E1EE0F7
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 11:16:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E1C6E053;
	Thu,  4 Jun 2020 09:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3146E053
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jun 2020 09:16:21 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id q11so5266061wrp.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jun 2020 02:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=p5lTW39g1QpsBvEecDQhlbtZ5rwo3DScDmYMeSxtiQM=;
 b=lxUzYKwvrK8PqEF65PB6zvN27pbju/ygVGds1WK/i3JHzCfvHE0m+o3sgfDUsW9sHa
 BWNbjWbF9OrRUTFdwQSkXeN1A7m8084gzpJOr8nTTPTiAYCZQmNbOOyjBmQwjBbUJkPk
 9Oj6x2rxhdGXSe/tOE2ARIZsTYYCRw7lwLUXkkYcJg0HTFXuN9Fajzy3uolv6rk3x17C
 IxQIhxb0kruQ0MHPyVAR6TMT7lu5JYB88taPpFQE/7THT+w1vuX/AiJ9d2WXGVytW1Ak
 I2PIPYpKGpqp3sj0UgeGIuEXwmP+gVqjh7o1exWHlFdztTZn4OwkGjV0AXS5Y3qXV9ZQ
 AbGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=p5lTW39g1QpsBvEecDQhlbtZ5rwo3DScDmYMeSxtiQM=;
 b=kscZma5QOgxEcN5BDDpjVabHb65zJK8OnQA/D73Lb3YxwCZihjz/1jE6z6uHuGMvVw
 NuOy8yoEbbDke2UYhkYiu6I9N343egJMj+la8tpTTjcrgtXH/l3HnvFTi9UOdxLyNWM1
 Pz3u/McNE8fPZL6CP5jQvHlrlAZlZhvVMQY+GGQSWQ9eFPimcTRhsuWJPNCQL1VDUL2r
 7dVgPWFI+eddZ8fh2Frc2IvMSBL8TK/cHqEVOZnSXgKO6zjyAqOY28LwHRDXgs3LpCEl
 JTBqd+s622fsmw2jc+wU5v2FnLXRPRkwq/96+/lfubNjR5n6WnPG6OWmEu2u+ELflKRl
 1Qig==
X-Gm-Message-State: AOAM531wpUPb7z6vNbSUS2rokp6J4RmnHeo6i6L5cPEttNUJb13PHEMV
 NpzZuYRk5VfHHtC3OsJJz8OWr5BvJbaOy6OUPdwWs+Ny4Nc=
X-Google-Smtp-Source: ABdhPJwG80016QsfRe0l9d6J68dreTITwTfOhCtWF1jLaFhFVWyLYzyJs8z4dBZ1mDKpW7Dx38Zl7G6/gvLYNY8Aevo=
X-Received: by 2002:a5d:4090:: with SMTP id o16mr3401011wrp.354.1591262179860; 
 Thu, 04 Jun 2020 02:16:19 -0700 (PDT)
MIME-Version: 1.0
References: <WOsdNGp0dhyp8Modsrt7DYpd0fVk7Yk264FISQ1Yls30bhlSXbxzgKTpmOCJ9H2WV1XHyUjCXu7nwBOWQ6n1NCbIcVl1-1IZ4rMMGN1dN-U=@emersion.fr>
 <CAAxE2A4NCo_KMkemUOHKbZ7P=GR4p-zwhpmP7Get18x4Ydb-Gg@mail.gmail.com>
 <bbZABMxDckHUj5JW5DW0pSewqQ-rAIW0gvNnTlI4np7o1A2bDrpPGIeyk5tXGMDr_cAI1l_R9qw6ykJ8OEhQlbKruJ8IG579jqADaPAnUbA=@emersion.fr>
 <CADnq5_MEFM_2k_uboU6E9d3_j18K+tz=Axtie-80PSSwJ2vkYw@mail.gmail.com>
 <CAPj87rMrJLNNbFJVvf081=eRqPqAe1H7=+PM21N22Jdsg7FzVQ@mail.gmail.com>
 <CADnq5_OX9o5_Gc4SjU5M4B=fthT9++J-FjX3UqTS7x_u6cJHOQ@mail.gmail.com>
 <CAPj87rP+Hxhohb4dEjRwtZzy34fYk+hAdgVfCkLF1u4JufJ=CQ@mail.gmail.com>
 <CADnq5_Pzj+AWQZWOcwvf8WQDVJrpc2DyG6Z1ZYqgfHA-8AXpMA@mail.gmail.com>
 <CAPj87rNO62i5JmRLdMhAg9XbiJUyrrRO7fj1ruXRCh-oxHnifQ@mail.gmail.com>
 <CADnq5_PVZ_DS65SCS=OFW0m7Dz10pMAZVZ33pWf86KBwg4oQKw@mail.gmail.com>
 <CAPj87rNrJtJeVd0ba768D2VMiEKvhXOCozAhkq6QV6mu3WsFVQ@mail.gmail.com>
 <CAAxE2A4wE0Q4NCQHmQhCa3nQn8VHWngtmuhg2DBtQYsCncTSFw@mail.gmail.com>
In-Reply-To: <CAAxE2A4wE0Q4NCQHmQhCa3nQn8VHWngtmuhg2DBtQYsCncTSFw@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 4 Jun 2020 10:14:24 +0100
Message-ID: <CAPj87rNw7w3itcWiA0A1GGWRW4jhuHBzCkWYPJoRxhU4xoTcXw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/fourcc: document modifier uniqueness requirements
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAzIEp1biAyMDIwIGF0IDE5OjUzLCBNYXJlayBPbMWhw6FrIDxtYXJhZW9AZ21haWwu
Y29tPiB3cm90ZToKPiBUTVogaXMgbW9yZSBjb21wbGljYXRlZC4gSWYgdGhlcmUgaXMgYSBUTVog
YnVmZmVyIHVzZWQgYnkgYSBjb21tYW5kIGJ1ZmZlciwgdGhlbiBhbGwgb3RoZXIgdXNlZCBidWZm
ZXJzIG11c3QgYWxzbyBiZSBUTVogb3IgcmVhZCBvbmx5LiBJZiBubyBUTVogYnVmZmVycyBhcmUg
dXNlZCBieSBhIGNvbW1hbmQgYnVmZmVyLCB0aGVuIFRNWiBpcyBkaXNhYmxlZC4gSWYgYSBjb250
ZXh0IGlzIG5vdCBzZWN1cmUsIFRNWiBpcyBhbHNvIGRpc2FibGVkLiBBIGNvbnRleHQgY2FuIHN3
aXRjaCBiZXR3ZWVuIHNlY3VyZSBhbmQgbm9uLXNlY3VyZSBiYXNlZCBvbiB0aGUgYnVmZmVycyBi
ZWluZyB1c2VkLgo+Cj4gU28gbWl4aW5nIHNlY3VyZSBhbmQgbm9uLXNlY3VyZSBtZW1vcnkgd3Jp
dGVzIGluIG9uZSBjb21tYW5kIGJ1ZmZlciB3b24ndCB3b3JrLiBUaGlzIGlzIG5vdCBmaXhhYmxl
IGluIHRoZSBkcml2ZXIgLSBhcHBzIG11c3QgYmUgYXdhcmUgb2YgdGhpcy4KClN1cmUsIHRoYXQg
bWFrZXMgc2Vuc2UuIEl0IHByb2JhYmx5IHBvaW50cyB0byBUTVogYmVpbmcgaXRzIG93bgpzcGVj
aWFsIHRoaW5nLCBpbmRlcGVuZGVudCBvZiBtb2RpZmllcnMsIHNpbmNlIGl0IHRvdWNoZXMgc28g
bXVjaApnbG9iYWwgc3RhdGUsIGFuZCBkb2Vzbid0IG1lc2ggY2xlYW5seSBhbnkgb2YgdGhlIG1v
ZGVscyB3ZSBoYXZlIGZvcgphZHZlcnRpc2luZyBhbmQgbmVnb3RpYXRpbmcgYnVmZmVyIGFsbG9j
YXRpb24gYW5kIGltcG9ydC4KCkNoZWVycywKRGFuaWVsCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
