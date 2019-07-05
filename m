Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AE460272
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 10:42:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F63C6E444;
	Fri,  5 Jul 2019 08:41:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 339 seconds by postgrey-1.36 at gabe;
 Fri, 05 Jul 2019 03:17:44 UTC
Received: from condef-02.nifty.com (condef-02.nifty.com [202.248.20.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B24596E3FB
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 03:17:44 +0000 (UTC)
Received: from conssluserg-05.nifty.com ([10.126.8.84])by condef-02.nifty.com
 with ESMTP id x653A6JC007783
 for <dri-devel@lists.freedesktop.org>; Fri, 5 Jul 2019 12:10:06 +0900
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id x6539laR015285
 for <dri-devel@lists.freedesktop.org>; Fri, 5 Jul 2019 12:09:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x6539laR015285
X-Nifty-SrcIP: [209.85.217.41]
Received: by mail-vs1-f41.google.com with SMTP id u124so2962970vsu.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2019 20:09:48 -0700 (PDT)
X-Gm-Message-State: APjAAAU4zUqRMtxxb9ANdIMtCu5CqN+qeCtcyJ7FkH4xXkPvP0ZJkU2v
 o9WqjolBHEyG0zQz0q1O9hiiCwJcpQyv8NQGBd4=
X-Google-Smtp-Source: APXvYqw5G5WuXtiZ+BxbjorgiCdXG7sWfLwHDfJHFK2DwoaScCECOi9EMClzttvllquxBbPayOf6C0yRlBt7hXWgkXI=
X-Received: by 2002:a67:f495:: with SMTP id o21mr774753vsn.54.1562296187154;
 Thu, 04 Jul 2019 20:09:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190704220152.1bF4q6uyw%akpm@linux-foundation.org>
 <80bf2204-558a-6d3f-c493-bf17b891fc8a@infradead.org>
 <CAK7LNAQc1xYoet1o8HJVGKuonUV40MZGpK7eHLyUmqet50djLw@mail.gmail.com>
In-Reply-To: <CAK7LNAQc1xYoet1o8HJVGKuonUV40MZGpK7eHLyUmqet50djLw@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 5 Jul 2019 12:09:11 +0900
X-Gmail-Original-Message-ID: <CAK7LNASLfyreDPvNuL1svvHPC0woKnXO_bsNku4DMK6UNn4oHw@mail.gmail.com>
Message-ID: <CAK7LNASLfyreDPvNuL1svvHPC0woKnXO_bsNku4DMK6UNn4oHw@mail.gmail.com>
Subject: Re: mmotm 2019-07-04-15-01 uploaded (gpu/drm/i915/oa/)
To: Randy Dunlap <rdunlap@infradead.org>
X-Mailman-Approved-At: Fri, 05 Jul 2019 08:41:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nifty.com; s=dec2015msa; t=1562296188;
 bh=wWYGFUb+P+k+0keFxKdK3YKZmXuC4tWs7ONW753LY34=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GExcANG0Z97hoM5QYgPCfde3YccjeMehq5mCWvt/5h4kJNxx+OjGc61n7hj8dd2hg
 q87bAV+yWBT6/zOxz2WaYYAd53hzVNTHHnDjnWJzq5ZWDM8cAOwp/8HA+bDpjTiY0r
 VDumQ8H5Npn76tylIUohWQ01JaAgemwrwhpCVFcDQc4tKi4BWUSYjoBI0l93jza4F3
 HkViyfsUL8AxqBFNPOGmcy03qX+vI005RHQke68u/LaZpclB3KHq7DJKiWqTXOmsnM
 p543YvXKEKzyfH9KSIbWGLE9UVppdiHdRIu35XrHbhBD9eTwAafhzmU1c5ufWtaqQy
 KD+AOv6OL4WwQ==
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, mm-commits@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, mhocko@suse.cz,
 linux-mm@kvack.org, Mark Brown <broonie@kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgNSwgMjAxOSBhdCAxMjowNSBQTSBNYXNhaGlybyBZYW1hZGEKPHlhbWFkYS5t
YXNhaGlyb0Bzb2Npb25leHQuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgSnVsIDUsIDIwMTkgYXQg
MTA6MDkgQU0gUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+IHdyb3RlOgo+ID4K
PiA+IE9uIDcvNC8xOSAzOjAxIFBNLCBha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnIHdyb3RlOgo+
ID4gPiBUaGUgbW0tb2YtdGhlLW1vbWVudCBzbmFwc2hvdCAyMDE5LTA3LTA0LTE1LTAxIGhhcyBi
ZWVuIHVwbG9hZGVkIHRvCj4gPiA+Cj4gPiA+ICAgIGh0dHA6Ly93d3cub3psYWJzLm9yZy9+YWtw
bS9tbW90bS8KPiA+ID4KPiA+ID4gbW1vdG0tcmVhZG1lLnR4dCBzYXlzCj4gPiA+Cj4gPiA+IFJF
QURNRSBmb3IgbW0tb2YtdGhlLW1vbWVudDoKPiA+ID4KPiA+ID4gaHR0cDovL3d3dy5vemxhYnMu
b3JnL35ha3BtL21tb3RtLwo+ID4KPiA+IEkgZ2V0IGEgbG90IG9mIHRoZXNlIGJ1dCBkb24ndCBz
ZWUva25vdyB3aGF0IGNhdXNlcyB0aGVtOgo+ID4KPiA+IC4uL3NjcmlwdHMvTWFrZWZpbGUuYnVp
bGQ6NDI6IC4uL2RyaXZlcnMvZ3B1L2RybS9pOTE1L29hL01ha2VmaWxlOiBObyBzdWNoIGZpbGUg
b3IgZGlyZWN0b3J5Cj4gPiBtYWtlWzZdOiAqKiogTm8gcnVsZSB0byBtYWtlIHRhcmdldCAnLi4v
ZHJpdmVycy9ncHUvZHJtL2k5MTUvb2EvTWFrZWZpbGUnLiAgU3RvcC4KPiA+IC4uL3NjcmlwdHMv
TWFrZWZpbGUuYnVpbGQ6NDk4OiByZWNpcGUgZm9yIHRhcmdldCAnZHJpdmVycy9ncHUvZHJtL2k5
MTUvb2EnIGZhaWxlZAo+ID4gbWFrZVs1XTogKioqIFtkcml2ZXJzL2dwdS9kcm0vaTkxNS9vYV0g
RXJyb3IgMgo+ID4gLi4vc2NyaXB0cy9NYWtlZmlsZS5idWlsZDo0OTg6IHJlY2lwZSBmb3IgdGFy
Z2V0ICdkcml2ZXJzL2dwdS9kcm0vaTkxNScgZmFpbGVkCj4gPgo+Cj4gSSBjaGVja2VkIG5leHQt
MjAxOTA3MDQgdGFnLgo+Cj4gSSBzZWUgdGhlIGVtcHR5IGZpbGUKPiBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9vYS9NYWtlZmlsZQo+Cj4gRGlkIHNvbWVvbmUgZGVsZXRlIGl0Pwo+CgoKSSB0aGluayAi
b2JqLXkgKz0gb2EvIgppbiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9NYWtlZmlsZQppcyByZWR1bmRh
bnQuCgoKCi0tIApCZXN0IFJlZ2FyZHMKTWFzYWhpcm8gWWFtYWRhCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
