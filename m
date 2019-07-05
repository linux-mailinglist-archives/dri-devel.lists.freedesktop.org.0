Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EAC6009B
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 07:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7898F6E40D;
	Fri,  5 Jul 2019 05:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 170306E40C;
 Fri,  5 Jul 2019 05:29:07 +0000 (UTC)
Received: from localhost.localdomain (c-73-223-200-170.hsd1.ca.comcast.net
 [73.223.200.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 111B621850;
 Fri,  5 Jul 2019 05:29:07 +0000 (UTC)
Date: Thu, 4 Jul 2019 22:29:06 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Joe Perches <joe@perches.com>
Subject: Re: mmotm 2019-07-04-15-01 uploaded (gpu/drm/i915/oa/)
Message-Id: <20190704222906.f817d02cb248561edd84a669@linux-foundation.org>
In-Reply-To: <5f4680cce78573ecfbbdc0dfca489710581b966f.camel@perches.com>
References: <20190704220152.1bF4q6uyw%akpm@linux-foundation.org>
 <80bf2204-558a-6d3f-c493-bf17b891fc8a@infradead.org>
 <CAK7LNAQc1xYoet1o8HJVGKuonUV40MZGpK7eHLyUmqet50djLw@mail.gmail.com>
 <20190705131435.58c2be19@canb.auug.org.au>
 <20190704220931.f1bd2462907901f9e7aca686@linux-foundation.org>
 <5f4680cce78573ecfbbdc0dfca489710581b966f.camel@perches.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1562304547;
 bh=ku9aEp+wapV1jAtHr82zZH6REpuJWRVS+GCf+tHXR7Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gpwsyMS6DRC1CwjjTw4nWYbfs5wE2bJ85FBSXW84XxfeYBs6quUOEtr8MLEJ6QcMZ
 03jv6nY0lDeUSDRQOggVvU24ZcWC8z5wMyc53vkGgU4qbFnuhBeU8cBq+krJtoDFTV
 5BAl2jqKEoiqIRjP7Qf7cwvYh0pBZRG2A96dQtGc=
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
 DRI <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, mhocko@suse.cz,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-fsdevel@vger.kernel.org,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAwNCBKdWwgMjAxOSAyMjoyMjo0MSAtMDcwMCBKb2UgUGVyY2hlcyA8am9lQHBlcmNo
ZXMuY29tPiB3cm90ZToKCj4gPiBTbyB3aGVuIGNvbXBhcmluZyBhIHplcm8tbGVuZ3RoIGZpbGUg
d2l0aCBhIG5vbi1leGlzdGVudCBmaWxlLCBkaWZmCj4gPiBwcm9kdWNlcyBubyBvdXRwdXQuCj4g
Cj4gV2h5IHVzZSB0aGUgLU4gb3B0aW9uID8KPiAKPiAkIGRpZmYgLS1oZWxwCj4gWy4uLl0KPiAg
IC1OLCAtLW5ldy1maWxlICAgICAgICAgICAgICAgICAgdHJlYXQgYWJzZW50IGZpbGVzIGFzIGVt
cHR5Cj4gCj4gb3RoZXJ3aXNlCj4gCj4gJCBjZCAkKG1rdGVtcCAtZCAtcCAuKQo+ICQgdG91Y2gg
eAo+ICQgZGlmZiAtdSB4IHkKPiBkaWZmOiB5OiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5CgpX
aXRob3V0IC1OIGRpZmYgZmFpbHMgYW5kIGV4aXRzIHdpdGggYW4gZXJyb3IuICAtTiBkb2VzIHdo
YXQncyBkZXNpcmVkCmFzIGxvbmcgYXMgdGhlIG5vbi1taXNzaW5nIGZpbGUgaXNuJ3QgZW1wdHku
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
