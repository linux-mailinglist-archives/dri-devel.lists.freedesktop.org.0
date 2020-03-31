Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4697199398
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 12:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26BB96E5D5;
	Tue, 31 Mar 2020 10:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21ABC6E5D5
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 10:39:02 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id t28so21507523ott.5
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 03:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HfR4QvzXvR5AaW8cLn3hxZgpu7lv/ZUqYmdGPURFGFk=;
 b=HGp72kbaqXP0NqNncWYWbLLQwBeapFgY9MSrQ7AKftvnTmUBAbP13iEKeFyBbGNRBp
 uhJEKy82HUH/NkuNK1qdsnLMlu0ga4/2e5DwAxm5Z5WHCJtrOldXTsRKBIe3/sWEeJcE
 MKJWU1EpeaUqtT12NGlilgoTIbmFJ3A6SPY/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HfR4QvzXvR5AaW8cLn3hxZgpu7lv/ZUqYmdGPURFGFk=;
 b=sdeIima/mS3fjYtY5T9e/dwLcj4pHPT8bonh28jynN7fUW34rT+lzHob4FyLu14psH
 f2d/vsNlBlKYVvHIPA4UnahhbHkwL63NzO2/BZ4C8yE/oKbRsyKI4TKt7pbnabW4B6It
 7i0DHm0KwG2lk7U23NCoYAqHD+Yz+FcDK7fJVQbPDolB77J+S9dGGOY0lT58GI5RrP3q
 2VH/mnx02FmiByQeioCZrUNhKM9wY9Pja2zw9Ir/kur8b/KL5jaQ4jT6cY9hizyeZDY6
 JHskUKE0EqiyGG4IAb2gXkhSbxQq9xMfilzI54cPCJ9qRBHhGE4/voB6OBaYGdwl2DD3
 jeIg==
X-Gm-Message-State: ANhLgQ2AePSqoys9+0ZoIfI9LMBlCdWYS8y+EQpEK7V8zWyJ9UR+qDdk
 MdwJElrdvOKzaxYVNvj/ass0tMyNoHRWLeoENsPPIQ==
X-Google-Smtp-Source: ADFU+vva1tNE3NAJgM7fhwrwvF0S1Eb8sSXMIG1PaHo1H1LLWyZzo8NJBfv5AN0ibHdHsLRLc6ByBPeq8V/V8ZBnUJo=
X-Received: by 2002:a4a:4190:: with SMTP id x138mr12722981ooa.35.1585651141429; 
 Tue, 31 Mar 2020 03:39:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200330123425.3944-1-christian.koenig@amd.com>
 <c124b5d1-efc6-e826-2387-9f9ad06d1df0@gmail.com>
 <20200331091618.GM2363188@phenom.ffwll.local>
 <158564641293.18289.1145145659054294433@build.alporthouse.com>
In-Reply-To: <158564641293.18289.1145145659054294433@build.alporthouse.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 31 Mar 2020 12:38:50 +0200
Message-ID: <CAKMK7uGNxhZB9Fd3i7rGK42pAgoJACRoR_NrrXF6rfCFkrg4GQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mm: revert "Break long searches in fragmented address
 spaces"
To: Chris Wilson <chris@chris-wilson.co.uk>
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
Cc: Andi Shyti <andi.shyti@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Kempczynski,
 Zbigniew" <zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXIgMzEsIDIwMjAgYXQgMTE6MjAgQU0gQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJp
cy13aWxzb24uY28udWs+IHdyb3RlOgo+IFF1b3RpbmcgRGFuaWVsIFZldHRlciAoMjAyMC0wMy0z
MSAxMDoxNjoxOCkKPiA+IE9uIFR1ZSwgTWFyIDMxLCAyMDIwIGF0IDEwOjU5OjQ1QU0gKzAyMDAs
IENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gPiA+IEEgbm90IHNvIGdlbnRsZSBwaW5nLCBzaW5j
ZSB0aGlzIHByZXR0eSBtdWNoIGJyb2tlIGFsbCBUVE0gYmFzZWQgZHJpdmVycy4KPiA+ID4KPiA+
ID4gQ291bGQgd2UgcmV2ZXJ0IHRoaXMgZm9yIG5vdz8KPiA+Cj4gPiBBbHdheXMgYWNrIGZvciBy
ZXZlcnQuCj4gPgo+ID4gQWNrZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3
bGwuY2g+Cj4KPiBTbyB5b3UgZGlkbid0IGNoZWNrIHRoZSBlYXJsaWVyIHBhdGNoIGVpdGhlcj8K
CkkgZGlkLCBidXQgd2Fzbid0IHN1cGVyIHNvbGQgb24gdGhlIGlkZWEgb2YgbW9yZSBmbGFncyB0
byBzbWFjayBhbiByLWIKb250byBpdCwgc28gZmlndXJlZCBJJ2xsIHRocm93IHRoZSBkZWZhdWx0
IGFjay1mb3ItcmV2ZXJ0IG9uIHRoaXMKbWVhbndoaWxlLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0
dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1
NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
