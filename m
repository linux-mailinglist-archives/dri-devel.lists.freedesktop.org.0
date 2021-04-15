Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 471083610BE
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 19:07:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 172A46EA9C;
	Thu, 15 Apr 2021 17:07:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D066EA9C
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 17:07:08 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id f19so8238717qka.8
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 10:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iRy+OYJ16DRYVPi5NtVhvc+VKxU8/FxMK+tu3YiCpm4=;
 b=Odjta8nJTVNIHnlfK74pczGLUl9ecb8l/1lsiw22yiBk53kElc2qPRkwXUkDvlqCPy
 xBntIuNzleXXPJFzpXB7EXKuVDIhRxQCraIEa5/gFYPU8711V97ibZYUCaMrmqJeNv4Y
 Ctp559suI+Q9dm5xGmmKYMmuhr0XV/tU6rPTCpoI3H3O0n1ZbglUl4ubJ0fnTwQwitGP
 ecFwnarlciOLKi2K+saICxcTRQqnNDkZDyioLzJlhHIwMQgPPB/SSPZib5vBOtcheJvS
 qhEJX2n1oT6xXkNHTiyMvIa/FocMrvzk/q/SOFgBFCSD4jP34wjsfI9x9WnWPWeTqnp0
 UFPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iRy+OYJ16DRYVPi5NtVhvc+VKxU8/FxMK+tu3YiCpm4=;
 b=S2VvwnzkF8GPjYcEpm2XVj33LpLv9336nt4bzYAJ2NvAg/yTdp2gU52j7ecvtQc+l5
 wFnbv4mxRpMYyU3afVvNzyHqyHScdEKLi82N3N54ulq1mQdfvPw6ejmTVz0Ex2wvmbXH
 39PodFv997XHIJyFgsYH9eWrX8syMnZ0RA0H5LxRPGjhtAi/X+JkbKf1Dp0Mzhgbmkyn
 tcFTBRe+xGDQqdezSXOIm0OO1NBTILQ6MJc2wVi0p5kiS5Z6CV8z5t84HfSzXiWZlA+R
 ts/kAYKVhvMBh72shWJxITU0abXyxq7D771QF3+DiyP73uJM9IEljvAKvBKeWAjRjw0a
 nSsg==
X-Gm-Message-State: AOAM5323DonFNOCwE2VeEI9fyN9s0RO35ySHprQ4VEcJf4ip6+JngyAl
 pcJx4axzY63UHxdDCYTzHcFTHMgwGp0vbta10B0Y1tpV9ko=
X-Google-Smtp-Source: ABdhPJx3ZTwhmW1c+7yWGFj6LOouTNI17sWTQ5e15tCoKm8jbu4uVKbkCJIpc52BqR7G2MDFJmSSC4bvOMGDPu0Wv0s=
X-Received: by 2002:a05:620a:20ca:: with SMTP id
 f10mr4457144qka.426.1618506427750; 
 Thu, 15 Apr 2021 10:07:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210413135248.1266-1-christian.koenig@amd.com>
 <20210413135248.1266-7-christian.koenig@amd.com>
In-Reply-To: <20210413135248.1266-7-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 15 Apr 2021 18:06:41 +0100
Message-ID: <CAM0jSHOk2Lz+7pbXC3e9CgQAfDD8djDqb5BYbXO=Vd3q3Lxc5A@mail.gmail.com>
Subject: Re: [PATCH 7/7] drm/ttm: rename bo->mem and make it a pointer
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxMyBBcHIgMjAyMSBhdCAxNDo1MywgQ2hyaXN0aWFuIEvDtm5pZwo8Y2tvZW5pZy5s
ZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gV2hlbiB3ZSB3YW50IHRvIGRlY291
YmxlIHJlc291cmNlIG1hbmFnZW1lbnQgZnJvbSBidWZmZXIgbWFuYWdlbWVudCB3ZSBuZWVkIHRv
Cj4gYmUgYWJsZSB0byBoYW5kbGUgcmVzb3VyY2VzIHNlcGFyYXRlbHkuCj4KPiBBZGQgYSByZXNv
dXJjZSBwb2ludGVyIGFuZCByZW5hbWUgYm8tPm1lbSBzbyB0aGF0IGFsbCBjb2RlIG5lZWRzIHRv
Cj4gY2hhbmdlIHRvIGFjY2VzcyB0aGUgcG9pbnRlciBpbnN0ZWFkLgo+Cj4gTm8gZnVuY3Rpb25h
bCBjaGFuZ2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+ClJldmlld2VkLWJ5OiBNYXR0aGV3IEF1bGQgPG1hdHRoZXcuYXVsZEBp
bnRlbC5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
