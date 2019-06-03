Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3ABF339D8
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 22:57:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E22A1892DB;
	Mon,  3 Jun 2019 20:57:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
 [209.85.217.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B09892DB
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 20:57:55 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id z11so12141645vsq.9
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2019 13:57:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E5dUrVeauD0jO1m03qjYkvONXTPkFFhPzaqlGL9RRaM=;
 b=HOPh5fvy2TM64iE8Pnzq1387ECDWhz/o0GF9Nk85C+umeB20P6bAfrXAlNL0zeBTD4
 xX6FHlkSS9cVPv19iP+/ISit/i+GcakmNf02al2pUdwAXz6eKx8beNPzd3hxEdUDdnyx
 qpSzsfHV0/T1JXh6X7yGLQn0EESvMSawpNJJ1na4yohSNmKZPYXHCXEzPoQ/fFoeYFji
 qWV7ddnHWN51+RVw1Uf/DCh2h3f1oPuxxwiTVOe9dw7cP8LahpS9RfCPCkVtIhHtPHYG
 gfiZ43vD9/wZkkKl80A0n/g2Iswl2gaY0R5rbGMBBCKGxGScuO2Q1uTr8/stZcFM7PBl
 sQ3w==
X-Gm-Message-State: APjAAAVIbvY3t/2e92qVSV2/eo97uwF+5KzxjQTYF3nmQKjHQEbRR/Vi
 anqDjTprVBRQsBHMBnTizEhDKtv/oVhiFsKo7b+o3g==
X-Google-Smtp-Source: APXvYqxTY+Q/2ZLDN3xifcAaSkL63y2G9oYjBm47zhOl3PQ/qjqtWpqHtDKpM0KwD4+iMf13mxeke9q8Bb8Zo+9Oadw=
X-Received: by 2002:a67:8bc5:: with SMTP id n188mr2291211vsd.18.1559595474705; 
 Mon, 03 Jun 2019 13:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190603004017.7114-1-imirkin@alum.mit.edu>
In-Reply-To: <20190603004017.7114-1-imirkin@alum.mit.edu>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Mon, 3 Jun 2019 16:57:43 -0400
Message-ID: <CAKb7Uvi3dOhF7C=te5=yMqoohM6fqXWyJJgPRyCXOQ8psRx5vg@mail.gmail.com>
Subject: Re: [PATCH libdrm 00/10] Add C8, 30bpp and FP16 support to modetest
To: dri-devel <dri-devel@lists.freedesktop.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdW4gMiwgMjAxOSBhdCA4OjQwIFBNIElsaWEgTWlya2luIDxpbWlya2luQGFsdW0u
bWl0LmVkdT4gd3JvdGU6Cj4KPiBUaGlzIHNlcmllcyBpbXByb3ZlcyB0aGUgcGF0dGVybiBnZW5l
cmF0aW9uIGxvZ2ljIHRvIHN1cHBvcnQgYWRkaXRpb25hbAo+IGZvcm1hdHMsIGFzIHdlbGwgYXMg
YSBuZXcgImdyYWRpZW50IiBwYXR0ZXJuIChzZWUgcGF0Y2ggY29tbWVudHMgb24gd2h5Cj4gSSBm
b3VuZCBpdCB1c2VmdWwpLgo+Cj4gRnVydGhlcm1vcmUsIHRoZXNlIGZvcm1hdHMgYXJlIHBpcGVk
IHRocm91Z2ggdG8gbW9kZXRlc3QsIGluY2x1ZGluZyB0aGUKPiBhYmlsaXR5IHRvIHNldCBhIGdh
bW1hIHRhYmxlLCB3aGljaCBpcyBuZWNlc3NhcnkgZm9yIHRoZSBDOCBpbmRleGVkCj4gZm9ybWF0
Lgo+Cj4gVGhpcyB3YXMgdGVzdGVkIG9uIG5vdXZlYXUsIGFuZCB1c2VkIGZvciBicmluZy11cCBv
ZiB0aGUgQzgsIFhCMzAsIGFuZAo+IEZQMTYgZm9ybWF0cyBvbiB0aGUgTlZJRElBIGhhcmR3YXJl
IHRoYXQgc3VwcG9ydHMgdGhlc2UuCgpKdXN0IHRvIGZvbGxvdyB1cCwgSSd2ZSBzdWNjZXNzZnVs
bHkgdGVzdGVkIG9uIGFuIEludGVsIFNLTCB3aXRoIEM4CmFuZCBYQjMwL1hSMzAgYXMgd2VsbCAo
YW5kIGNvbmZpcm1lZCB0aGF0IHRoZSBHQU1NQV9MVVQgZ2V0cyB1bnNldCBpbgphIHNlcXVlbmNl
IG9mIEM4IGZvbGxvd2VkIGJ5IFhCMzApLiBGUDE2IHdhcyBub3QgYXZhaWxhYmxlIG9uIHRoZQpr
ZXJuZWwgSSBhbSBjdXJyZW50bHkgdXNpbmcgKGFuZCBwZXJoYXBzIG5vdCB0aGUgSFc/KQoKICAt
aWxpYQoKPgo+IElsaWEgTWlya2luICgxMCk6Cj4gICB1dGlsOiBhZGQgQzggZm9ybWF0LCBzdXBw
b3J0IGl0IHdpdGggU01QVEUgcGF0dGVybgo+ICAgdXRpbDogZml4IE1BS0VfUkdCQSBtYWNybyBm
b3IgMTBicHAgbW9kZXMKPiAgIHV0aWw6IGFkZCBncmFkaWVudCBwYXR0ZXJuCj4gICB1dGlsOiBh
ZGQgZnAxNiBmb3JtYXQgc3VwcG9ydAo+ICAgdXRpbDogYWRkIGNhaXJvIGRyYXdpbmcgZm9yIDMw
YnBwIGZvcm1hdHMgd2hlbiBhdmFpbGFibGUKPiAgIG1vZGV0ZXN0OiBkb24ndCBwcmV0ZW5kIHRo
YXQgYXRvbWljIG1vZGUgaW5jbHVkZXMgYSBmb3JtYXQKPiAgIG1vZGV0ZXN0OiBhZGQgYW4gYWRk
X3Byb3BlcnR5X29wdGlvbmFsIHZhcmlhbnQgdGhhdCBkb2VzIG5vdCBwcmludAo+ICAgICBlcnJv
cnMKPiAgIG1vZGV0ZXN0OiBhZGQgQzggc3VwcG9ydCB0byBnZW5lcmF0ZSBTTVBURSBwYXR0ZXJu
Cj4gICBtb2RldGVzdDogYWRkIHRoZSBhYmlsaXR5IHRvIHNwZWNpZnkgZmlsbCBwYXR0ZXJucyBv
biB0aGUgY29tbWFuZGxpbmUKPiAgIG1vZGV0ZXN0OiBhZGQgRlAxNiBmb3JtYXQgc3VwcG9ydAo+
Cj4gIHRlc3RzL21vZGV0ZXN0L2J1ZmZlcnMuYyAgfCAgMTMgKysKPiAgdGVzdHMvbW9kZXRlc3Qv
bW9kZXRlc3QuYyB8IDEwOSArKysrKysrKy0tCj4gIHRlc3RzL3V0aWwvZm9ybWF0LmMgICAgICAg
fCAgIDcgKwo+ICB0ZXN0cy91dGlsL3BhdHRlcm4uYyAgICAgIHwgNDMyICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKystCj4gIHRlc3RzL3V0aWwvcGF0dGVybi5oICAgICAgfCAg
IDcgKwo+ICA1IGZpbGVzIGNoYW5nZWQsIDU0MyBpbnNlcnRpb25zKCspLCAyNSBkZWxldGlvbnMo
LSkKPgo+IC0tCj4gMi4yMS4wCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
