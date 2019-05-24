Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F401729AD7
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 17:18:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1962B6E113;
	Fri, 24 May 2019 15:18:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 918D76E112
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 15:18:55 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id x132so7469417lfd.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 08:18:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QzcM5WKlqjtTdXvmPOW95KVE54MK4zK3MayIFic6yMw=;
 b=i4Z6S97txV587GTfsBt4UqeJR7MCi/BgFYmfoTN2vLQ0qe25gxwe4+UXkzpExwIek7
 9HcWsBdsPi4jrY06rToF5cSgwcqQJrtLRmsk0uZbqv0tkXdVY0uC/s/frWp9Foom0let
 FJUhnfEDLXqPDH+01kF+RL+vBGjk0GdqyIhbAmdQg471vOVYATMNaWQs/CNOdfvsCa7+
 VkXkjA9hLanqZIPOA9R45pGpNnZb+VHp9pt6Rgt354/YvYnUlAhjOA7I5NJcYY9Dvw+S
 LcimwXMscsOJdNet7HcGSdzaO2tRUQ6BuBjTN8pVamSwg5N/RH2CWHx4OEROnaryDBMP
 jPlg==
X-Gm-Message-State: APjAAAVrvf3UTsjrbtHpaoG66pXofdQlBn7n1LtnYZDNoPgBUclvjQSo
 fNTFQZ5ANwPXJxQX3hb23OW58R0UYBoI95HUIqpAfw==
X-Google-Smtp-Source: APXvYqzsgeeE7oVylupuDBnFXAvj0zNcJPX/tK2hORH9uLCiVa+rckBLz/gWebaW/dyxxER9AEdRbNM9J9KVFn90dcg=
X-Received: by 2002:ac2:48ad:: with SMTP id u13mr22186667lfg.60.1558711133026; 
 Fri, 24 May 2019 08:18:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190523134413.4210-1-noralf@tronnes.org>
 <20190523165320.GA7770@ravnborg.org>
In-Reply-To: <20190523165320.GA7770@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 24 May 2019 17:18:40 +0200
Message-ID: <CACRpkda+RJxkHbwsMdF+NQ159WKp3_w8TDEDnNRrcPxwkr=QbA@mail.gmail.com>
Subject: Re: [PATCH v6 0/8] drm/fb-helper: Move modesetting code to drm_client
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=QzcM5WKlqjtTdXvmPOW95KVE54MK4zK3MayIFic6yMw=;
 b=Gzaxc8Ul+rnu2jU/F3pxfL9MhVwoNKQhu03qWYYrv3LDVXC0lV08cf47W8LPPO/K6z
 fV4vAzXNzXMFLkyefDhM430KsFcAPp6yb0R+SIu4IyGywtO6RUxOzDhI16mBQwhphYyL
 MuQ6Sh08JGoIcr8HbNiglgRWRWuXvejbSxZFOgefqKLJPdcOq5zLbTf21VjJy78AhK/H
 JoSz5OINpkJuEgLBHKvtVmlqclzEsR7qdHcjh6OvmO+wkDvft9KtrVkzOT6+8Qm13gVM
 fQDpNu01FBenoDH4cVJ+Whi10X8DBZjDaznCyP1BCze/4e/pnuW3McUpS19hBX8yZNMW
 4p4Q==
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgNjo1MyBQTSBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+IHdyb3RlOgoKPiBDb3VsZCBvbmUgb2YgeW91IHRha2UgYSBsb29rIGF0IHRoaXMgc2Vy
aWVzLgo+IERhbmllbCBhbHJlYWR5IGFjaydlZCB0aGUgc2VyaWVzIG9uIGlyYywgYnV0IGFuIGV4
dHJhIHBhaXIgb2YgZXllcwo+IGlzIG5ldmVyIGJhZC4KCkkgd291bGQgaWYgSSBoYWQgYSBjaGFu
Y2Ugb2YgdW5kZXJzdGFuZGluZyB0aGVtLiBJIGFtIHN0aWxsIHByZXR0eQpub3ZpY2Ugd2l0aCBE
Uk0gc28gd2hhdCBJIGRvIGlzIHRyYWNlIGRvd24gdG8gdGhlIGNhbGxzIEkKbmVlZCBhbmQgdW5k
ZXJzdGFuZCB0aGUgc21hbGwgcGllY2VzIEkgdXNlLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
