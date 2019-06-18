Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0A24A563
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 17:30:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E51176E174;
	Tue, 18 Jun 2019 15:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF6D96E174
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 15:30:12 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9856C2166E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 15:30:12 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id x47so15781212qtk.11
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 08:30:12 -0700 (PDT)
X-Gm-Message-State: APjAAAW4THIbv0KnwHWsLtUYcKXl+EOe+qmF42RnmRkx/9KPelMRSQ63
 T6LwaAEygIKXQErlVVA/LwNcQlIQKM2eCVsHvA==
X-Google-Smtp-Source: APXvYqzKCqC44kYMJ8ibP0oK/TpwHRjvnl69jcIU5P5CPFraoIM/fkgfrkxIVpd6ymcE9eemMMu2UUtpeUH0Q4eahOI=
X-Received: by 2002:ac8:3908:: with SMTP id s8mr99483017qtb.224.1560871811851; 
 Tue, 18 Jun 2019 08:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190618081648.17297-1-boris.brezillon@collabora.com>
In-Reply-To: <20190618081648.17297-1-boris.brezillon@collabora.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 18 Jun 2019 09:30:00 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKbfCZ=7KQSHjdQ9kPKd8v_4VPexmbMes5=JtzgoSAd6A@mail.gmail.com>
Message-ID: <CAL_JsqKbfCZ=7KQSHjdQ9kPKd8v_4VPexmbMes5=JtzgoSAd6A@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] drm/panfrost: Expose perf counters to userspace
To: Boris Brezillon <boris.brezillon@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560871812;
 bh=+alyxEJXrKDsQOE5m5X0YEOvzZ68xs/dx54O4Q03ICI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HQzP7ZR8NwYf7B1Qxx+UCRi+FNa3J7A94l6AeF1yFKm9QSdYnW7kYv7A2SqCnzXVu
 mveFVDMkZMrFpkwSLFW9nOPjgwwQvmBjAfR9TW2YgjeCjdbDNyygzHZVQQNm+yskBo
 Q0LCymVRn6GrqkO4N58I/yNDO0kFnf93q7bb3l44=
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, kernel@collabora.com,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMjoxNiBBTSBCb3JpcyBCcmV6aWxsb24KPGJvcmlzLmJy
ZXppbGxvbkBjb2xsYWJvcmEuY29tPiB3cm90ZToKPgo+IEhlbGxvLAo+Cj4gVGhpcyBhIG5ldyB2
ZXJzaW9uIG9mIHRoZSBwYW5mcm9zdCBwZXJmY250IHNlcmllcywgdGhpcyB0aW1lIGV4cG9zaW5n
Cj4gdGhpcyBmdW5jdGlvbmFsaXR5IHRocm91Z2ggMiBpb2N0bHMgaW5zdGVhZCBvZiB0aGUgZGVi
dWdmcyBhcHByb2FjaAo+IHVzZWQgaW4gdjIuCj4KPiBJIGFsc28gd2VudCBmb3IgRW1pbCdzIHN1
Z2dlc3Rpb24gdG8gZXhwb3NlIHRob3NlIGlvY3RscyBvbmx5IHdoZW4KPiB0aGUgdW5zdGFibGVf
aW9jdHMgdW5zYWZlIHBhcmFtIGlzIHNldCB0byB0cnVlLiBUaGlzIHdheSwgSSBob3BlIHdlJ2xs
Cj4gYmUgYWJsZSB0byBkZXByZWNhdGUgdGhvc2UgaW9jdGxzIHdoZW4gdGhlIGdlbmVyaWMgc29s
dXRpb24gdG8gZXhwb3NlCj4gZ2xvYmFsIHBlcmYgY291bnRlcnMgaXMgb3V0Lgo+Cj4gQWxzbyBh
ZGRyZXNzZWQgdGhlIHByb2JsZW1zIHJlcG9ydGVkIGJ5IFJvYiBhbmQgU3RldmVuLgo+Cj4gUmVn
YXJkcywKPgo+IEJvcmlzCj4KPiBDaGFuZ2VzIGluIHY0Ogo+ICogRml4IGEgd2FybmluZyByZXBv
cnRlZCBieSBrYnVpbGQgYm90cwo+ICogQWRkIFItYi9BLWIKPiAqIFVzZSBkcm1fZ2VtX3NobWVt
X3ZbdW5dbWFwKCkgaW5zdGVhZCBvZiBkcm1fZ2VtX3ZbdW5dbWFwKCkKPgo+IENoYW5nZXMgaW4g
djM6Cj4gKiBFeHBvc2UgdGhpbmdzIHRocm91Z2ggaW9jdGxzIGluc3RlYWQgb2YgZGVidWdmcyAo
bmVlZGVkIGZvcgo+ICAgcGVyLUZEIGFkZHJlc3Mgc3BhY2UgdGhhdCBpcyBiZWluZyB3b3JrZWQg
b24gYnkgUm9iKQo+Cj4gQ2hhbmdlcyBpbiB2MjoKPiAqIENvbXBsZXRlIHJld3JpdGUgdG8gZXhw
b3NlIHRoaW5ncyB0aHJvdWdoIGRlYnVnZnMKPgo+IEJvcmlzIEJyZXppbGxvbiAoNCk6Cj4gICBk
cm0vcGFuZnJvc3Q6IE1vdmUgZ3B1X3t3cml0ZSxyZWFkfSgpIG1hY3JvcyB0byBwYW5mcm9zdF9y
ZWdzLmgKPiAgIGRybS9wYW5mcm9zdDogQWRkIGEgbW9kdWxlIHBhcmFtZXRlciB0byBleHBvc2Ug
dW5zdGFibGUgaW9jdGxzCj4gICBkcm0vcGFuZnJvc3Q6IEFkZCBhbiBoZWxwZXIgdG8gY2hlY2sg
dGhlIEdQVSBnZW5lcmF0aW9uCj4gICBkcm0vcGFuZnJvc3Q6IEV4cG9zZSBwZXJmb3JtYW5jZSBj
b3VudGVycyB0aHJvdWdoIHVuc3RhYmxlIGlvY3RscwoKU2VyaWVzIGFwcGxpZWQuCgpSb2IKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
