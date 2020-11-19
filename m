Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AF32B9D32
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 22:55:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 183B26E81F;
	Thu, 19 Nov 2020 21:55:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B24996E81E;
 Thu, 19 Nov 2020 21:55:12 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id c9so8562338wml.5;
 Thu, 19 Nov 2020 13:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QPqvc1x5t7qLXCW8n18+RH8/nuMRFmIb+j6wkjvSoac=;
 b=Gwqz797TCkbOAVXSCqrZyYHhgCS7dzOjYtHH0GBsaR7yAMjfsqRYgOOflkXnGQoqak
 sQ9s5hKxA3pyQoNSOp12r4A+7s8b69QGMD3QIdbXngX7xoUK7N4c5E7NSiy6u8iaxP5H
 jIWTiAuptzNvlg/xBNvDmCANQYgytMNEnsMU1EDPZlYmBQ/9EDcOWj60bOZaKOIzZP/S
 ujjFP/4/RCnlt+H8abbC0kmLlmuagt9dLZFUklOFACs+21kZifVVdWqbNVyWng3YGFZH
 izvPt6qHxkhRnb6D0A8sL1LVc9B6G579wlb/QBQ8eTwx0Rk4frvNeRLCNqjV3jYNLSBF
 jw6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QPqvc1x5t7qLXCW8n18+RH8/nuMRFmIb+j6wkjvSoac=;
 b=SNwBVhlSmrAMWE8jOvHJN8mc1JTtBZA8ImtCU3FGCagJp4kCJmyiZH4I0P5Jl6/fRE
 rfOTMGelJfYMQZ8gqUBN6q1aOj0Vlti9Hzlzts7rkX4nCc1S/Ae/wxnFiZUK03XeHGK4
 ChvsEXcsbKDCebDn/ZxWs35xLeAtjdo4v6lt9zM4tkMyb7B47uGUId70gp1rEeuy20Ef
 NaI6Zz904S/Mk3YQsYqoLxJUK46hBsJqs1iybgfI5pxK2aIHBDABxAWIGKiNZo5ivNcN
 7KEu419tjCt6hgFdYX2222VFpjmX6sj7tpXM4hDGCBVgnXcya1C6gHkEqwbOwspOaTj+
 dFMA==
X-Gm-Message-State: AOAM531nZgOsmJ2OhgV5PxVppnCjkGcej4PldylGV6GMscQjXYPdQvfB
 LtsUyLQMUMvTn4JN2PaQItj1Aq0tfuSShk1RFCc=
X-Google-Smtp-Source: ABdhPJwrarEP3o+nZ/cPmHQ+jbwoZm614gVVX5gD94S1cshyD2zw2A1NRL4NTTbfz8YAMyeIztWkhAVqGhHgLec1fR0=
X-Received: by 2002:a1c:f017:: with SMTP id a23mr6746684wmb.56.1605822911406; 
 Thu, 19 Nov 2020 13:55:11 -0800 (PST)
MIME-Version: 1.0
References: <20201118024234.102485-1-bernard@vivo.com>
 <d61726de-c9a9-ee9c-cb8a-c34f0625a973@amd.com>
In-Reply-To: <d61726de-c9a9-ee9c-cb8a-c34f0625a973@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 19 Nov 2020 16:54:59 -0500
Message-ID: <CADnq5_M+seQ8Ui4p2uMKuGZ_9Y=jwmbSm1YiWxQV_=5PmEw9UA@mail.gmail.com>
Subject: Re: [PATCH] amdgpu/amdgpu_ids: fix kmalloc_array not uses number as
 first arg
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Fenghua Yu <fenghua.yu@intel.com>, Joerg Roedel <jroedel@suse.de>,
 opensource.kernel@vivo.com, David Airlie <airlied@linux.ie>,
 Bernard Zhao <bernard@vivo.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Borislav Petkov <bp@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIFdlZCwgTm92IDE4LCAyMDIwIGF0IDM6MTcgQU0g
Q2hyaXN0aWFuIEvDtm5pZwo8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEFt
IDE4LjExLjIwIHVtIDAzOjQyIHNjaHJpZWIgQmVybmFyZCBaaGFvOgo+ID4gRml4IGNoZWNrX3Bh
dGNoLnBsIHdhcm5pbmc6Cj4gPiBrbWFsbG9jX2FycmF5IHVzZXMgbnVtYmVyIGFzIGZpcnN0IGFy
Zywgc2l6ZW9mIGlzIGdlbmVyYWxseSB3cm9uZy4KPiA+ICtmZW5jZXMgPSBrbWFsbG9jX2FycmF5
KHNpemVvZih2b2lkICopLCBpZF9tZ3ItPm51bV9pZHMsCj4gPiBHRlBfS0VSTkVMKTsKPiA+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBCZXJuYXJkIFpoYW8gPGJlcm5hcmRAdml2by5jb20+Cj4KPiBSZXZp
ZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+Cj4g
PiAtLS0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2lkcy5jIHwgMiAr
LQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2lkcy5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2lkcy5jCj4gPiBpbmRleCA2ZTlh
OWU1ZGJlYTAuLmYyYmQ0YjBlMDZmNiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9pZHMuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2lkcy5jCj4gPiBAQCAtMjA4LDcgKzIwOCw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1
X3ZtaWRfZ3JhYl9pZGxlKHN0cnVjdCBhbWRncHVfdm0gKnZtLAo+ID4gICAgICAgaWYgKHJpbmct
PnZtaWRfd2FpdCAmJiAhZG1hX2ZlbmNlX2lzX3NpZ25hbGVkKHJpbmctPnZtaWRfd2FpdCkpCj4g
PiAgICAgICAgICAgICAgIHJldHVybiBhbWRncHVfc3luY19mZW5jZShzeW5jLCByaW5nLT52bWlk
X3dhaXQpOwo+ID4KPiA+IC0gICAgIGZlbmNlcyA9IGttYWxsb2NfYXJyYXkoc2l6ZW9mKHZvaWQg
KiksIGlkX21nci0+bnVtX2lkcywgR0ZQX0tFUk5FTCk7Cj4gPiArICAgICBmZW5jZXMgPSBrbWFs
bG9jX2FycmF5KGlkX21nci0+bnVtX2lkcywgc2l6ZW9mKHZvaWQgKiksIEdGUF9LRVJORUwpOwo+
ID4gICAgICAgaWYgKCFmZW5jZXMpCj4gPiAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+
ID4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
YW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
