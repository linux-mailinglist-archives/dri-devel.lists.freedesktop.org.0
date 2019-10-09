Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB13D17AA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 20:40:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE316EA39;
	Wed,  9 Oct 2019 18:40:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3906EA37
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 18:40:41 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C21142190F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 18:40:40 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id 3so4914804qta.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2019 11:40:40 -0700 (PDT)
X-Gm-Message-State: APjAAAX5wQsy68OzcnN7YEulcijc3e8LSrwvUXl5lHi4XnCkJsfN2/Id
 lhio8aLInKnoPgXSnAV0ohfW7ikfvuqQfqF5Sw==
X-Google-Smtp-Source: APXvYqzG9tT6XNZvDA6vm+Sp9mNK5+JebOo9CJE9L9ORPqscv/GJAMrijcnXEq/tSUucm3w4QRxozt53Lls3zhtrUvI=
X-Received: by 2002:ad4:5044:: with SMTP id m4mr5384425qvq.85.1570646439943;
 Wed, 09 Oct 2019 11:40:39 -0700 (PDT)
MIME-Version: 1.0
References: <20191004144413.42586-1-steven.price@arm.com>
In-Reply-To: <20191004144413.42586-1-steven.price@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 9 Oct 2019 13:40:28 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+WveA27wtuHgW+AbAG69x3gEL4LNLtiqS48tCDyJuWJQ@mail.gmail.com>
Message-ID: <CAL_Jsq+WveA27wtuHgW+AbAG69x3gEL4LNLtiqS48tCDyJuWJQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Remove NULL check for regulator
To: Steven Price <steven.price@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570646440;
 bh=zszbWCsT4olebZC5fAmGt3V+UZkT0u8TZGE92g8jp80=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kA9F4odN2BKvjEfj+poT7re9ekv0Biizf5prdfyxa1t5opD1RqY7D61tXOJ0oGJFq
 uPzp7AtfhOPsfKvT632lrOmxzidwye8wqKMkPbBjzF7IOv5aKIXLtx4y0VczWdE7c9
 t73cPRFqpMq3IhqLu70XwZp2cGvhIGS4BA/t0AVU=
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

T24gRnJpLCBPY3QgNCwgMjAxOSBhdCA5OjQ0IEFNIFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNl
QGFybS5jb20+IHdyb3RlOgo+Cj4gZGV2bV9yZWd1bGF0b3JfZ2V0KCkgaXMgdXNlZCB0byBwb3B1
bGF0ZSBwZmRldi0+cmVndWxhdG9yIHdoaWNoIGVuc3VyZXMKPiB0aGF0IHRoaXMgY2Fubm90IGJl
IE5VTEwgKGEgZHVtbXkgcmVndWxhdG9yIHdpbGwgYmUgcmV0dXJuZWQgaWYKPiBuZWNlc3Nhcnkp
LiBTbyByZW1vdmUgdGhlIGNoZWNrIGluIHBhbmZyb3N0X2RldmZyZXFfdGFyZ2V0KCkuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgo+IC0tLQo+
IFRoaXMgbG9va3MgbGlrZSBpdCB3YXMgYWNjaWRlbnRhbGx5IHJlaW50cm9kdWNlZCBieSB0aGUg
bWVyZ2UgZnJvbQo+IGRybS1uZXh0IGludG8gZHJtLW1pc2MtbmV4dCBkdWUgdG8gdGhlIGR1cGxp
Y2F0aW9uIG9mICJkcm0vcGFuZnJvc3Q6IEFkZAo+IG1pc3NpbmcgY2hlY2sgZm9yIHBmZGV2LXJl
Z3VsYXRvciIgKGNvbW1pdHMgYzkwZjMwODEyYTc5IGFuZAo+IDUyMjgyMTYzZGZhNikuCj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMgfCA2ICsrLS0t
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKQXBw
bGllZCwgdGhhbmtzLgoKUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
