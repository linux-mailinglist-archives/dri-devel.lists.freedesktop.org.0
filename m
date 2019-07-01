Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6A15BBF5
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 14:43:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BA2989991;
	Mon,  1 Jul 2019 12:43:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 134468994D;
 Mon,  1 Jul 2019 12:43:03 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id j21so5005932uap.2;
 Mon, 01 Jul 2019 05:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y3jn62uRqDDtMfGSPLqczsPcfH+yK4fZYdwDPBUJ9p0=;
 b=KHFU732SDGJXf0XVMMesYWxj55i3TPbqFYc7nGL+AT0Z9ulM4t+mwVNAMsS2TmM0XM
 FiUBJ16jLeLBq8kPYthReCfkkzdYZ8H0rsjupa9rNyULosydIvaibFfTp+wfvM89DuzB
 OALPN3ntnKf3AeJeO0gMS6pevHKaBQxxg/LCyeGSGWTDyE3qG2X+jqyB7gyizHZk8ReN
 27xNlxp3tM9BThIrJm19Nr2i2kh0F84JoDbHdGE7sVdGIVVjYaVswJEwymoKvdjczIOn
 GO/bQj98UJzh5w++Tzh8icc0yH+YYev8bobbJ9aHfgXaccA8L9bQjUKJWgGNCs2t1sZO
 2mXQ==
X-Gm-Message-State: APjAAAWK4isAO7DdjQbL7PeQxoRN8c2KrG1NIjPm82MDEDq0hu7nm0m/
 pUa0YyOULpfh9notj0BS9j9t89Ugze5jUJfIbKA=
X-Google-Smtp-Source: APXvYqxywlnTdPSPmdCseZKudC27fw/bhXEBeJ9DnY8UG/svaAtgHnOvqEPjimSJtJ/B+M7qeQAoK9JlTIk32++9jUo=
X-Received: by 2002:ab0:2556:: with SMTP id l22mr8965354uan.46.1561984982144; 
 Mon, 01 Jul 2019 05:43:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190628024700.15141-1-huangfq.daxian@gmail.com>
In-Reply-To: <20190628024700.15141-1-huangfq.daxian@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 1 Jul 2019 13:43:16 +0100
Message-ID: <CACvgo52dW16DahT37aAxF8snZSJo_42ie3M0Le_edF19SBYL0Q@mail.gmail.com>
Subject: Re: [PATCH v2 07/27] gpu: drm: remove memset after zalloc
To: Fuqian Huang <huangfq.daxian@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=y3jn62uRqDDtMfGSPLqczsPcfH+yK4fZYdwDPBUJ9p0=;
 b=GbhLpV+AH96F+DztaPdUMOLia9bsRPFhOxnwM5nfLyLBUGwObVkdKGjNH7SkQD0ihj
 8IXr9UnczQV8dtTOevWQmMRTbPEgDWDyadWBrApGXxqfmaFD7h3geJEEi7Pgqvkz9A8G
 dkTlL+49nwq6ftLE1XbrSX5iEICSnJcN+goRsX2ofg5teUgDj2psMTlamkNgVqHuPxKK
 fdBtVbWRk49W1eyi0HLil9RaroAxwff1/c3D/Bufslwc07bSFN1fDU6DDTTW6DSghykj
 llMQIGnbGQsTSf3IzN3OJoz1a2M+pf2iYXb0twY5ZuRlUEWaZV4CnjUPTBiSz7XYajT4
 KI4Q==
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
Cc: Leo Li <sunpeng.li@amd.com>, David Francis <David.Francis@amd.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Huang Rui <ray.huang@amd.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>, Evan Quan <evan.quan@amd.com>,
 Rex Zhu <rex.zhu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRnVxaWFuLAoKT24gRnJpLCAyOCBKdW4gMjAxOSBhdCAwOTozMCwgRnVxaWFuIEh1YW5nIDxo
dWFuZ2ZxLmRheGlhbkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gemFsbG9jIGhhcyBhbHJlYWR5IHpl
cm9lZCB0aGUgbWVtb3J5Lgo+IHNvIG1lbXNldCBpcyB1bm5lZWRlZC4KPgo+IFNpZ25lZC1vZmYt
Ynk6IEZ1cWlhbiBIdWFuZyA8aHVhbmdmcS5kYXhpYW5AZ21haWwuY29tPgo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9pcnEuYyAgICAgICB8
IDIgLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvcHJvY2Vzc19wcHRh
Ymxlc192MV8wLmMgfCAyIC0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdW1n
ci9jaV9zbXVtZ3IuYyAgICAgICAgICAgIHwgMiAtLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9zbXVtZ3IvaWNlbGFuZF9zbXVtZ3IuYyAgICAgICB8IDIgLS0KPiAgZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL3RvbmdhX3NtdW1nci5jICAgICAgICAgfCAyIC0t
Cj4gIDUgZmlsZXMgY2hhbmdlZCwgMTAgZGVsZXRpb25zKC0pCj4KVGhhbmtzIGZvciBmaXhpbmcg
dGhlc2UuIE9uZSBuaXQgcGljazogdGhlIGNvbW1pdCBtZXNzYWdlIHNob3VsZCBzdGFydAp3aXRo
ICJkcm0vYW1kZ3B1OiIgYXMgeW91IGNhbiBzZWUgZnJvbSBnaXQgbG9nLgpXaXRoIHRoYXQ6CgpS
ZXZpZXdlZC1ieTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KCi1F
bWlsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
