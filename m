Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A9FD69DD
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 21:06:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4737C891C0;
	Mon, 14 Oct 2019 19:06:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B8ED891C0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 19:06:09 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CA24D21835
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 19:06:08 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id 201so16836334qkd.13
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 12:06:08 -0700 (PDT)
X-Gm-Message-State: APjAAAWlC9rFMaXoRSLWvJxhYYoMrw3zH4k7LDNiziReIxsDH2NrNG94
 MR4+kav7cHh963SCG8cJKGgfgEyiA8c6NqDQoQ==
X-Google-Smtp-Source: APXvYqxtt56ct5CSujEjO+VWcC3CyHrQK6hvv1inNbBfhWj56N00Mfeotm8P/o2BF7zwHgnpKhBrYpD4dvfThQMyIgE=
X-Received: by 2002:a37:2f81:: with SMTP id
 v123mr32072393qkh.254.1571079967909; 
 Mon, 14 Oct 2019 12:06:07 -0700 (PDT)
MIME-Version: 1.0
References: <20191014151515.13839-1-steven.price@arm.com>
In-Reply-To: <20191014151515.13839-1-steven.price@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 14 Oct 2019 14:05:56 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLG0csuGqg50xmAGdiEqHBkbU5+im2mhTWtxXKpPBGpkg@mail.gmail.com>
Message-ID: <CAL_JsqLG0csuGqg50xmAGdiEqHBkbU5+im2mhTWtxXKpPBGpkg@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Add missing GPU feature registers
To: Steven Price <steven.price@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1571079968;
 bh=cugcVS6BwVMErWDImtXeHcuGvGtmF4IDDsE8pSs+D38=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=yfAwrlnOJlhGWfDrZYYsQxOSSvxIsO2fMDjg5l9ecX3X1157aY/5VXpe7atrM9R7f
 hpE79GqClgjgRmq0UZFqgQN7nJ/o8fICyeAaz/I6I1EExlRXQOkx/JZSAykCokkpbs
 R83vEFxegTrSpw7v0N8r+72zYh7Z7Z0bPUqk3OHE=
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgMTA6MTUgQU0gU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJp
Y2VAYXJtLmNvbT4gd3JvdGU6Cj4KPiBUaHJlZSBmZWF0dXJlIHJlZ2lzdGVycyB3ZXJlIGRlY2xh
cmVkIGJ1dCBuZXZlciBhY3R1YWxseSByZWFkIGZyb20gdGhlCj4gR1BVLiBBZGQgVEhSRUFEX01B
WF9USFJFQURTLCBUSFJFQURfTUFYX1dPUktHUk9VUF9TSVpFIGFuZAo+IFRIUkVBRF9NQVhfQkFS
UklFUl9TSVpFIHNvIHRoYXQgdGhlIGNvbXBsZXRlIHNldCBhcmUgYXZhaWxhYmxlLgo+Cj4gRml4
ZXM6IDRiY2VkOGJlYTA5NCAoImRybS9wYW5mcm9zdDogRXhwb3J0IGFsbCBHUFUgZmVhdHVyZSBy
ZWdpc3RlcnMiKQo+IFNpZ25lZC1vZmYtYnk6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFy
bS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9ncHUuYyB8
IDMgKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCkFwcGxpZWQgdG8gZHJt
LW1pc2MtZml4ZXMuCgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
