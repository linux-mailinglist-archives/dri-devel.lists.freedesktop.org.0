Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBF8886C2
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2019 01:03:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA2BE6EF1F;
	Fri,  9 Aug 2019 23:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD6706EF1C
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 23:03:00 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6E4DB208C4
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 23:03:00 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id j15so3830486qtl.13
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Aug 2019 16:03:00 -0700 (PDT)
X-Gm-Message-State: APjAAAXEq0QH30mQK8qfBC/fqDZ//1h2Gkxf6ZVMgY16cnsw/VtElL7U
 mSHI3UMxUFEIlAw1C8VZF+dwT9KU0GsQOuBTQA==
X-Google-Smtp-Source: APXvYqxN08rndVgKxXE4Nk1vXSNXaGNuJw7j361sr3BOUOEho3CsIyBFP6mpUr45IkbFfqP0mAgxqNIq7BzbolLt/uk=
X-Received: by 2002:ac8:23b3:: with SMTP id q48mr10271424qtq.110.1565391779597; 
 Fri, 09 Aug 2019 16:02:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190809210910.15432-1-alyssa.rosenzweig@collabora.com>
In-Reply-To: <20190809210910.15432-1-alyssa.rosenzweig@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 9 Aug 2019 17:02:48 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+3udb_aDS7Px0wh7x2XkJghx8tne5Ba+qENNdrJkv7jw@mail.gmail.com>
Message-ID: <CAL_Jsq+3udb_aDS7Px0wh7x2XkJghx8tne5Ba+qENNdrJkv7jw@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Add errata descriptions from kbase
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565391780;
 bh=GZDuKczhijPAPZuM4+dY87zCAzsgzjJlLBGUliik4tU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PSokVn4ipUVp3PnTkw9WVLXyNvC6tWTycWy/076PPXxWNjCTZ39k5kCc94rvmUjF3
 4f4KRP0Q+jjdAYv6VPBc9vMG8Oo6aedLqg1VD1VKAWrVnECVfziXJ24IXWf0w0i/SI
 pqOcRvgATLB79H4eUDuxklioXYjMv2LT0isF1pEM=
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

T24gRnJpLCBBdWcgOSwgMjAxOSBhdCAzOjA5IFBNIEFseXNzYSBSb3Nlbnp3ZWlnCjxhbHlzc2Eu
cm9zZW56d2VpZ0Bjb2xsYWJvcmEuY29tPiB3cm90ZToKPgo+IFdoaWxlIG5ld2VyIGtiYXNlIGlu
Y2x1ZGUgb25seSB0aGUgbnVtYmVycyBvZiBlcnJhdGEsIG9sZGVyIGtiYXNlCj4gcmVsZWFzZXMg
aW5jbHVkZWQgb25lLWxpbmUgZGVzY3JpcHRpb25zIGZvciBlYWNoIGVycmF0YSwgd2hpY2ggaXMg
dXNlZnVsCj4gZm9yIHRob3NlIHdvcmtpbmcgb24gdGhlIGRyaXZlci4gSW1wb3J0IHRoZXNlIGRl
c2NyaXB0aW9ucy4gTW9zdCBhcmUKPiBmcm9tIGtiYXNlIHZlcmJhdGltOyBhIGZldyBJIGVkaXRl
ZCBmb3IgY2xhcml0eS4KPgo+IHYyOiBXcm90ZSBhIGRlc2NyaXB0aW9uIGZvciB0aGUgd29ya2Fy
b3VuZCBvZiBhbiBpc3N1ZSB3aG9zZSBjYXVzZSBpcwo+IHN0aWxsIHVua25vd24gKFN0ZXBoZW4p
LiBFcnJhdGEgd2hpY2ggcGVydGFpbiB0byBuZXdlciBtb2RlbHMKPiB1bnN1cHBvcnRlZCBieSB0
aGUgbWFpbmxpbmUgZHJpdmVyLCBmb3Igd2hpY2ggQXJtIGhhcyBub3QgeWV0IHJlbGVhc2VkCj4g
ZXJyYXRhIGluZm9ybWF0aW9uLCBoYXZlIGJlZW4gcmVtb3ZlZCBmcm9tIHRoZSBpc3N1ZSBsaXN0
IGFzIHRoZSBrZXJuZWwKPiBuZWVkIG5vdCBjb25jZXJuIGl0c2VsZiB3aXRoIHRoZXNlLgoKSSBo
YWQgc2NydWJiZWQgdGhlIGlzc3VlIGxpc3QgdG8ga2VlcCBqdXN0IHRoZSBlcnJhdGEgd2l0aAp3
b3JrLWFyb3VuZHMgaW4ga2Jhc2UuIEknZCByYXRoZXIgbm90IGhhdmUgdG8gc2VhcmNoIHRoaXMg
aW5mb3JtYXRpb24KYWdhaW4gYmVjYXVzZSBpbiBrYmFzZSB3ZSBoYXZlIHRvIGZpbHRlciBvdXQg
YWxsIHRoZSBpc3N1ZXMgd2hpY2gKZG9uJ3QgYWZmZWN0IHRoZSBrZXJuZWwgc2lkZS4KClJvYgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
