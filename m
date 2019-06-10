Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C23403C088
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 02:29:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D9989153;
	Tue, 11 Jun 2019 00:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-it1-x144.google.com (mail-it1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F27D89155
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 15:12:50 +0000 (UTC)
Received: by mail-it1-x144.google.com with SMTP id k134so159196ith.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 08:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iDSWhJFvFSpMRIQjv3sV2z7AOFrUltYdK5kocBGrXwg=;
 b=BmkgCcPtj6HSRHst3+fj8x4HzGs/iVI9Ep6EVsaOc9Jo2Hhz9P+JEQ4/9190WrDkLv
 p4kBbyK2BwB3m6N1k8lauw8RWV6F1kcPAjQkVIHVWIOIxmQ7sqJMT/neVuFCrXcDdaN/
 dXiRTNsYpEp/4b+1T82AUq8gk1OCZsXgfF/JwicTgkSa7v4ZjQAEBgE6mt+zr1+P9cnv
 hyQjvp9CK0n7HDNMHp8r4KCq84rRCXSZy8CXDHdRjEx9Xh1nFlpalNqCaQE32XN+Md8N
 BA2jN+iq87VQeWZu5ifjmIxH583iyEwOBayIgVWNBKnWHAagLY486ctEWSSobJ5SmIna
 2h/g==
X-Gm-Message-State: APjAAAXSrZMmlO6Sd89EJz9KPjbXhFwMFLmcckhnAjfjDKV7PDO/ctGW
 FPIvTdceLqC7JaWzKk2C5AsRJIUkVaDiDP4NRoLnIg==
X-Google-Smtp-Source: APXvYqzBLvoymnSF+owavozveFKM8hqJFa6AZ7Uaq97rs/+7MNKLbvwxRoxDS/z5WedMnK5dJwe1jjMY2MUJc2N9kKU=
X-Received: by 2002:a05:660c:44a:: with SMTP id
 d10mr13126351itl.153.1560179569891; 
 Mon, 10 Jun 2019 08:12:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190529154635.2659-1-hdegoede@redhat.com>
In-Reply-To: <20190529154635.2659-1-hdegoede@redhat.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Mon, 10 Jun 2019 17:12:37 +0200
Message-ID: <CAKv+Gu8bLcDROFNFfqHaN1Z+EK5bnXMNDSJbBK-pCmq5XP_kBw@mail.gmail.com>
Subject: Re: [PATCH] efifb: BGRT: Add check for new BGRT status field rotation
 bits
To: Hans de Goede <hdegoede@redhat.com>
X-Mailman-Approved-At: Tue, 11 Jun 2019 00:29:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=iDSWhJFvFSpMRIQjv3sV2z7AOFrUltYdK5kocBGrXwg=;
 b=GU+MWaZ2efR/e1wZuprMJhPrNYhcWneIGNvL/NAlNQYqm7aMnuF36yZdQD1EQgRIyq
 T7KcjBuaeAZZRzqmZ/2tuSIDUCyCTR+66KLvrlOc+ItZKgdSiEmk6Zp1yWVPbmfthTZY
 XIh0MQzWdBvSFEIKVt6ItUdd/cWwKfmW9xIsBgpvwbbW6p6Wp6CvrXY2w6qGOJBtXNYf
 Eihg/XT98weEi0TtsWCZ3Hz7sPewcPSN2DfMUcCHeeFK7qy8Yx9x0yIYZFj1HT1U0MN6
 diKIXV3oem+g7psOOI6nv5iKKGPKZPzWtVpZWZq8wQx+7LstwWpJOHXr4LQNCeqDr9sQ
 O5Iw==
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
Cc: linux-efi <linux-efi@vger.kernel.org>,
 "open list:EFIFB FRAMEBUFFER DRIVER" <linux-fbdev@vger.kernel.org>,
 Peter Jones <pjones@redhat.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyOSBNYXkgMjAxOSBhdCAxNzo0NiwgSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiBTdGFydGluZyB3aXRoIEFDUEkgNi4yIGJpdHMgMSBhbmQgMiBv
ZiB0aGUgQkdSVCBzdGF0dXMgZmllbGQgYXJlIG5vIGxvbmdlcgo+IHJlc2VydmVkLiBUaGVzZSBi
aXRzIGFyZSBub3cgdXNlZCB0byBpbmRpY2F0ZSBpZiB0aGUgaW1hZ2UgbmVlZHMgdG8gYmUKPiBy
b3RhdGVkIGJlZm9yZSBiZWluZyBkaXNwbGF5ZWQuCj4KPiBUaGUgZWZpZmIgY29kZSBkb2VzIG5v
dCBzdXBwb3J0IHJvdGF0aW5nIHRoZSBpbWFnZSBiZWZvcmUgY29weWluZyBpdCB0bwo+IHRoZSBz
Y3JlZW4uCj4KPiBUaGlzIGNvbW1pdCBhZGRzIGEgY2hlY2sgZm9yIHRoZXNlIG5ldyBiaXRzIGFu
ZCBpZiB0aGV5IGFyZSBzZXQgbGVhdmVzIHRoZQo+IGZiIGNvbnRlbnRzIGFzIGlzIGluc3RlYWQg
b2YgdHJ5aW5nIHRvIHVzZSB0aGUgdW4tcm90YXRlZCBCR1JUIGltYWdlLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4KCkFja2VkLWJ5OiBBcmQg
Qmllc2hldXZlbCA8YXJkLmJpZXNoZXV2ZWxAbGluYXJvLm9yZz4KCj4gLS0tCj4gIGRyaXZlcnMv
dmlkZW8vZmJkZXYvZWZpZmIuYyB8IDUgKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvZWZpZmIuYyBiL2Ry
aXZlcnMvdmlkZW8vZmJkZXYvZWZpZmIuYwo+IGluZGV4IDlmMzlmMGMzNjBlMC4uZGZhOGRkNDdk
MTlkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvZWZpZmIuYwo+ICsrKyBiL2Ry
aXZlcnMvdmlkZW8vZmJkZXYvZWZpZmIuYwo+IEBAIC0xNjksNiArMTY5LDExIEBAIHN0YXRpYyB2
b2lkIGVmaWZiX3Nob3dfYm9vdF9ncmFwaGljcyhzdHJ1Y3QgZmJfaW5mbyAqaW5mbykKPiAgICAg
ICAgICAgICAgICAgcmV0dXJuOwo+ICAgICAgICAgfQo+Cj4gKyAgICAgICBpZiAoYmdydF90YWIu
c3RhdHVzICYgMHgwNikgewo+ICsgICAgICAgICAgICAgICBwcl9pbmZvKCJlZmlmYjogQkdSVCBy
b3RhdGlvbiBiaXRzIHNldCwgbm90IHNob3dpbmcgYm9vdCBncmFwaGljc1xuIik7Cj4gKyAgICAg
ICAgICAgICAgIHJldHVybjsKPiArICAgICAgIH0KPiArCj4gICAgICAgICAvKiBBdm9pZCBmbGFz
aGluZyB0aGUgbG9nbyBpZiB3ZSdyZSBnb2luZyB0byBwcmludCBzdGQgcHJvYmUgbWVzc2FnZXMg
Ki8KPiAgICAgICAgIGlmIChjb25zb2xlX2xvZ2xldmVsID4gQ09OU09MRV9MT0dMRVZFTF9RVUlF
VCkKPiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+IC0tCj4gMi4yMS4wCj4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
