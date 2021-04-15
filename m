Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB35A36105B
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 18:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AB0B6EA98;
	Thu, 15 Apr 2021 16:45:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E27216EA98
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 16:45:26 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id z15so10582897qtj.7
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 09:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ymb443vHuPHe54y8A8ox12SPhH6Lmds08FT0LxawHHg=;
 b=gkX1hbnfa93m+Xk88XQ/v4N36CY1iVcew39PlaMziwRazl1aHZOzUuTEqjRgaeKBvC
 DQJ6Cw2XH1N6971wZilzCmns1vixacOhZAcJzG3ON1y35l//3XkepQB8s2wcmF5jbkhw
 t4yzxKMk9AyMZAqGag0viMf8x8e8wSrriy39U+CSARtTSwiBkx2NFUnxzrsVPW0i+YGH
 F6kMEVlVrOqF0rhfFJoET7KZV4z9dM5cz3vEycGwTfEKwqIlQjb7hZr/Phhf/IypLWAV
 vke82W3b7x86HTdWAe25FJJX1Mo2yHdkTtYlbiY4eYgk5/Bj3JJmBkZIKcNnMP9F3TMg
 JCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ymb443vHuPHe54y8A8ox12SPhH6Lmds08FT0LxawHHg=;
 b=JU7xAgKq9qQzTnjdySa+YBNuMpvRjj4p4oElanZla4l1uNLo8KnvpzS401sdK8oaEh
 UeVI4IR/FqUYdqkyNloVaPD2GAXHVcEm20bWSY/xsHjOkQTGPncVmUJqrikJYASsqaic
 0K5oIDl+M8NlJNxR9+OD9owQckC9N2IUIkW6/1JSYcf4IrQU+WNOato8t1HaPYpZcfLZ
 meyHtzE1jx/lsoBIh4raUz/5IgKqMKNZJjdCiZ9YGz5Of1qXKKX9ilXqvqi1J6NOAKNm
 ASfAhua5yjoaHTpxfLJsXPQN+BIpWS7bhAq04EHJD4YnR1NbRhgkMWPauXKpB054n+sP
 SRKg==
X-Gm-Message-State: AOAM530TITMH9+CiOZKxPudGYzY1288umggBNgkb+SsjWqqvhsuoK9Jl
 SxqfncwzOX6Tupi4Ob+ulQL0OxKABYU/FhqPNEY=
X-Google-Smtp-Source: ABdhPJw6+WZSUfmIg17Sfc3mDqM//FAq7Rst5x8k2dLMQxhQ3IkJ/c/1lzNXw6/pt7A5kv6jdAVpP3Y0Psu73Af6BX4=
X-Received: by 2002:ac8:5e4a:: with SMTP id i10mr3797084qtx.341.1618505126143; 
 Thu, 15 Apr 2021 09:45:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210413135248.1266-1-christian.koenig@amd.com>
 <20210413135248.1266-6-christian.koenig@amd.com>
In-Reply-To: <20210413135248.1266-6-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 15 Apr 2021 17:44:59 +0100
Message-ID: <CAM0jSHP9Sns050QsOLO+0XZ2i8T5-Cf6hz5yGkbaPCL6DX0a9g@mail.gmail.com>
Subject: Re: [PATCH 6/7] drm/ttm: always initialize the full ttm_resource
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
ZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSW5pdCBhbGwgZmllbGRzIGluIHR0
bV9yZXNvdXJjZV9hbGxvYygpIHdoZW4gd2UgY3JlYXRlIGEgbmV3IHJlc291cmNlLgo+Cj4gU2ln
bmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpS
ZXZpZXdlZC1ieTogTWF0dGhldyBBdWxkIDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
