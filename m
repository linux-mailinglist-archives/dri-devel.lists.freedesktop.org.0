Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E45733DA
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 18:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A4E6E5EE;
	Wed, 24 Jul 2019 16:27:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1106E5EE
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 16:27:15 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6CB6F2238C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 16:27:15 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id x22so41156426qtp.12
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 09:27:15 -0700 (PDT)
X-Gm-Message-State: APjAAAVZqRrWBSlOKi4DQneHbb7lBNrZWAomm/+Xd9KmjfuxGjPz/kNH
 8oqmHIut7PbGlL5P20fRlhiY6qvUn3j1CZtGdg==
X-Google-Smtp-Source: APXvYqwptXe/uTWee4NuZzm9CGkPpdvwocUmqOtUgHcd5yCy2ZnFI0mL/snhlDQY3I9nBEg8FUdR7pOActwPyf6Od68=
X-Received: by 2002:a0c:8a43:: with SMTP id 3mr61365918qvu.138.1563985634625; 
 Wed, 24 Jul 2019 09:27:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190724105626.53552-1-steven.price@arm.com>
In-Reply-To: <20190724105626.53552-1-steven.price@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 24 Jul 2019 10:27:03 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLkxKe=feVQDb3VXqOnA7fvDBEKWgLf2suOHhNLnR704Q@mail.gmail.com>
Message-ID: <CAL_JsqLkxKe=feVQDb3VXqOnA7fvDBEKWgLf2suOHhNLnR704Q@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Export all GPU feature registers
To: Steven Price <steven.price@arm.com>, 
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563985635;
 bh=tuE9J2EOne+NslRdzdQJ0TtHE1sB+k105tq6JIxLUdw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Zb8X/OpEv0xafmvlDz/057Tig2SM1IPeZsqvFMuvKLB4cEtdmqEqNvO5nbrYEVZzJ
 3gY1mfPUAFiKPkJ/XUpxrXDJQxFyzdDtgw3JseH4vuCcv+LnFoevL85+ZBHdbvQFEY
 aX+ejwSEfgue3WJ/NpLIzGCL00hcP/HrxuQpbKT0=
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
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkaW5nIEFseXNzYSdzIENvbGxhYm9yYSBlbWFpbC4KCk9uIFdlZCwgSnVsIDI0LCAyMDE5IGF0
IDQ6NTYgQU0gU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4gd3JvdGU6Cj4KPiBN
aWRnYXJkL0JpZnJvc3QgR1BVcyBoYXZlIGEgYnVuY2ggb2YgZmVhdHVyZSByZWdpc3RlcnMgcHJv
dmlkaW5nIGRldGFpbHMKPiBvZiB3aGF0IHRoZSBoYXJkd2FyZSBzdXBwb3J0cy4gUGFuZnJvc3Qg
YWxyZWFkeSByZWFkcyB0aGVzZSwgdGhpcyBwYXRjaAo+IGV4cG9ydHMgdGhlbSBhbGwgdG8gdXNl
ciBzcGFjZSBzbyB0aGF0IHRoZSBqb2JzIGNyZWF0ZWQgYnkgdGhlIHVzZXIgc3BhY2UKPiBkcml2
ZXIgY2FuIGJlIHR1bmVkIGZvciB0aGUgcGFydGljdWxhciBoYXJkd2FyZSBpbXBsZW1lbnRhdGlv
bi4KPgo+IFNpZ25lZC1vZmYtYnk6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+
Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuaCB8ICAx
ICsKPiAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jICAgIHwgMzggKysr
KysrKysrKysrKysrKysrKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9n
cHUuYyAgICB8ICAyICsrCj4gIGluY2x1ZGUvdWFwaS9kcm0vcGFuZnJvc3RfZHJtLmggICAgICAg
ICAgICB8IDM5ICsrKysrKysrKysrKysrKysrKysrKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCA3NyBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKTEdUTS4gSSdsbCBnaXZlIGl0IGEgYml0IG1v
cmUgdGltZSB0byBzZWUgaWYgdGhlcmUgYXJlIGFueSBjb21tZW50cwpiZWZvcmUgSSBhcHBseSBp
dC4KClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
