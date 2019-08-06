Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7726683A34
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 22:21:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651986E552;
	Tue,  6 Aug 2019 20:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A306E552
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 20:21:50 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DB3FC2173B
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 20:21:49 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id g18so63988815qkl.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2019 13:21:49 -0700 (PDT)
X-Gm-Message-State: APjAAAWDmbJyKn6GiMmmnJu6aL+wGsa1HlQk48gl9mIIJfJayuZJ9Rpe
 vgUK9prQW9/xEfL6fjECY2BqhBzyR9T50IBzVQ==
X-Google-Smtp-Source: APXvYqwYYb4EW0VZlkrbTmjQRlKieD1HtbIV/6YMycWN3AxQE1OxcRS5LYI3X2un8gMwM85QX+zgwOdIwBWyCtef1mI=
X-Received: by 2002:a37:a48e:: with SMTP id n136mr5192238qke.223.1565122909036; 
 Tue, 06 Aug 2019 13:21:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190806195259.3531-1-alyssa.rosenzweig@collabora.com>
 <CAL_Jsq+B1jv-TzQe8oQPLS8+JPH80spe=z_SK8umtpw5AXG3Qw@mail.gmail.com>
 <20190806201129.GA4119@kevin>
In-Reply-To: <20190806201129.GA4119@kevin>
From: Rob Herring <robh@kernel.org>
Date: Tue, 6 Aug 2019 14:21:37 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLfiYScsBGe4C=n=WVTP+bNwig7HruO7FvrSsHqD5mEkg@mail.gmail.com>
Message-ID: <CAL_JsqLfiYScsBGe4C=n=WVTP+bNwig7HruO7FvrSsHqD5mEkg@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Add "compute shader only" hint
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565122910;
 bh=f5AtsT3MXuKXRIEZFSR9UYWi35+MkqCz161aPqm42QM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WXZZP+JSf+zYuUskjaeBdwIGsEXIIOwDDHTAzl2UBr4qIoFFHvgYecJUxIpV/jb3S
 LQsRf2m0TahhzQJ9gASwMJsczjDn9gDCb7U1bIH9Uw/CBZzNHVAJHxwhXtuT0atMRl
 9nx8Lk+WThwZMb/DLkAME6bG/LPmbYzH1gfOYMg8=
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgNiwgMjAxOSBhdCAyOjExIFBNIEFseXNzYSBSb3Nlbnp3ZWlnCjxhbHlzc2Eu
cm9zZW56d2VpZ0Bjb2xsYWJvcmEuY29tPiB3cm90ZToKPgo+ID4gV2h5IGRvbid0IHdlIGp1c3Qg
Z28gYWhlYWQgYW5kIGVuYWJsZSBKUzI/Cj4KPiBJdCdzIG5vdCBvYnZpb3VzIHRvIG1lIHdoZW4g
aXQgYWN0dWFsbHkgbmVlZHMgdG8gYmUgZW5hYmxlZC4gQmVzaWRlcyB0aGUKPiBlcnJhdGEsIGl0
J3Mgb25seSB3aGVuLi4uIGRldmljZV9ucj0xIGZvciBhIGNvbXB1dGUtb25seSBqb2IgaW4ga2Jh
c2U/Cj4KPiBJJ20gYWZyYWlkIEkgZG9uJ3Qga25vdyBuZWFybHkgZW5vdWdoIGFib3V0IGhvdyBr
YmFzZSBwbHVtYnMgQ0wgdG8gZ3Jvawo+IHRoZSBzaWduaWZpYW5jZS4uLgoKRmlndXJpbmcgb3V0
IHRoZSBucl9jb3JlX2dyb3VwcyB3YXMgdGhlIGNvbXBsaWNhdGVkIHBhcnQgb2YgdGhpcyBhcyBJ
CnJlY2FsbC4gU2VlbXMgbGlrZSB3ZSBzaG91bGQgYXQgbGVhc3QgZmlndXJlIG91dCBpZiB3ZSAo
b3Igd2lsbCBuZWVkKQpQQU5GUk9TVF9KRF9SRVFfQ09SRV9HUlBfTUFTSyBhZGRlZCB0byB0aGUg
VUFQSSBhcyB3ZWxsLgoKUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
