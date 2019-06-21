Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D47BE4FD96
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2019 20:32:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE378991D;
	Sun, 23 Jun 2019 18:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B92FC6E905
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 17:32:03 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id e3so3235656ioc.12
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 10:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:cc;
 bh=x0w0cICqmKMHbqMi3TqTJo/d6Opn22c9DRuCkjr5CKM=;
 b=tvfMPHctuyFe+tmLQUyWaWQDOA4Kh+bBo5C2NVGnuCJO41Z1OXy9xjXb0OpKfOm97A
 GYIh6n5HAH9qxxx1yVc9ZM/ePsot4LDB7TQP2m1zSo0rHTqM3Q1c99qjsX3mAjNuLguA
 JVBtiOg55gXwZM5e4cNkyr8lByLsp0Ml9fFSIKDlZKhiVUB8VnvODJaUhOwnvuARZzN2
 PB7ubLRTPQ2drh5M+tQvexYLWQOYiPEGxYsC20LpOk1UO17Y1KWmi8lLVEk6KppX52IU
 N/0rX4/E3bB6PK6m4j5ooGbMDKX5Xyldh8dBVQ6IygaNGRld7B9WnBV7AV8rHkjBqyaB
 4rRw==
X-Gm-Message-State: APjAAAXNCFTbTdlT69wAmtxcSBUut86qiUoDZ9rnM+pPgUFf2OHDwfjV
 YLLgng2fRgZ7hDPz0zpn7VylMA12EBBZ7eKa85g=
X-Received: by 2002:a02:b10b:: with SMTP id r11mt884596jah.140.1561138323173; 
 Fri, 21 Jun 2019 10:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190614185547.34518-1-jeffrey.l.hugo@gmail.com>
In-Reply-To: <20190614185547.34518-1-jeffrey.l.hugo@gmail.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Fri, 21 Jun 2019 11:31:50 -0600
Message-ID: <CAOCk7NoaP=DkNLgdiUw5M0JYRGEGGCFQkn1sCO9dqtexMPC9dQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] MSM8998 MTP Display
X-Mailman-Approved-At: Sun, 23 Jun 2019 18:32:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
 bh=x0w0cICqmKMHbqMi3TqTJo/d6Opn22c9DRuCkjr5CKM=;
 b=l8HMkD1dRulhfDkq5w4c4pNGnTo2f0drZAn2TA7/ulWSn4SEEVCjvhfjE9a7s0Q8mG
 XVoeWrkG8EwD94uhco+flGFOYkoAU+M8dU8wSqv4+EuwT9LfetuuhKL1dAoGUecN+3fL
 jUwadaN55cnpbP8X8g9D/RSzSMel66BWTgc9DfQHImMzMiE6hnm2x3G+PBwU2vN4kS8V
 COSml29XhDuV5Qqh/PAC9T+Eup5CnbND93l3iOjASRwlaW9Pfgm42Cb8TKd32l3bkAXO
 QZaOTeFXicL4Ml4zygN8ndvJToZAGXvAzIYvTKB7La/y/JmVwov9ySUMFcPOwjIvEVcN
 XTtg==
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Dave Airlie <airlied@linux.ie>, lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 thierry.reding@gmail.com, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMTI6NTUgUE0gSmVmZnJleSBIdWdvIDxqZWZmcmV5Lmwu
aHVnb0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gU2luY2Ugd2UgYXJlIHRyeWluZyB0byBnZXQgdGhl
IEdQVSBhbmQgZGlzcGxheSBoYXJkd2FyZSBpbiB0aGUgU29DCj4gc3VwcG9ydGVkLCBpdCB3b3Vs
ZCBiZSBuaWNlIHRvIGJlIGFibGUgdG8gcHV0IHRoZSBvdXRwdXQgb24gdGhlCj4gaW50ZWdyYXRl
ZCBwYW5lbCBmb3IgdGhlIHJlZmVyZW5jZSBwbGF0Zm9ybS4gIFRvIGRvIHNvLCB3ZSBuZWVkIHN1
cHBvcnQKPiBpbiB0aGUgVHJ1bHkgZHJpdmVyIHRvIHN1cHBvcnQgdGhlIHNwZWNpZmljIHBhbmVs
IHZhcmlhbnQgZm9yIHRoZQo+IE1TTTg5OTggTVRQLiAgVGhpcyBzZXJpZXMgYWRkcyB0YWh0IHN1
cHBvcnQuCj4KPiBKZWZmcmV5IEh1Z28gKDIpOgo+ICAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IHRy
dWx5OiBBZGQgTVNNODk5OCBNVFAgcGFuZWwKPiAgIGRybS9wYW5lbDogdHJ1bHk6IEFkZCBNU004
OTk4IE1UUCBzdXBwb3J0CgpMZXRzIGFjdHVhbGx5IGhvbGQgb2ZmIG9uIHRoaXMgc2VyaWVzLiAg
SSB0aG91Z2h0IEkgY291bGQgc29sdmUgYW4KaXNzdWUgaW4gdGhlIERTSSBkcml2ZXIsIGJ1dCB0
aGF0cyBub3Qgd29ya2luZyBvdXQgbGlrZSBob3cgSSdkIGhvcGVkLgpJIG1heSBuZWVkIHRvIHJl
d29yayB0aGlzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
