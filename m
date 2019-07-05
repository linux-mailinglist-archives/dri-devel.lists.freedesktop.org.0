Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FC860078
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 07:09:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB2C6E409;
	Fri,  5 Jul 2019 05:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC71A6E408;
 Fri,  5 Jul 2019 05:09:32 +0000 (UTC)
Received: from localhost.localdomain (c-73-223-200-170.hsd1.ca.comcast.net
 [73.223.200.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D6E60216FD;
 Fri,  5 Jul 2019 05:09:31 +0000 (UTC)
Date: Thu, 4 Jul 2019 22:09:31 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: mmotm 2019-07-04-15-01 uploaded (gpu/drm/i915/oa/)
Message-Id: <20190704220931.f1bd2462907901f9e7aca686@linux-foundation.org>
In-Reply-To: <20190705131435.58c2be19@canb.auug.org.au>
References: <20190704220152.1bF4q6uyw%akpm@linux-foundation.org>
 <80bf2204-558a-6d3f-c493-bf17b891fc8a@infradead.org>
 <CAK7LNAQc1xYoet1o8HJVGKuonUV40MZGpK7eHLyUmqet50djLw@mail.gmail.com>
 <20190705131435.58c2be19@canb.auug.org.au>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1562303372;
 bh=wR0nIi/UwUMSGPluFPib5tDAspOm5XZsVqmm1CXmVbI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=P4OKl98fb+ZjukTs3Ul4LHLQpf19ItTNbpCiXVHaBroJKo7juozWa9+rwg+QRVQ5r
 KHDL6G4XIRLw/7Hcr62hm8VB026oIHTxuCDJEdVV9wXflap1la8mnA35HpNM/jD+sM
 eVmCLoL5d4v2SVi4yQcZ9e0avu4YcRam0u8fWNb0=
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
Cc: mm-commits@vger.kernel.org, DRI <dri-devel@lists.freedesktop.org>,
 linux-mm@kvack.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
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

T24gRnJpLCA1IEp1bCAyMDE5IDEzOjE0OjM1ICsxMDAwIFN0ZXBoZW4gUm90aHdlbGwgPHNmckBj
YW5iLmF1dWcub3JnLmF1PiB3cm90ZToKCj4gPiBJIGNoZWNrZWQgbmV4dC0yMDE5MDcwNCB0YWcu
Cj4gPiAKPiA+IEkgc2VlIHRoZSBlbXB0eSBmaWxlCj4gPiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9v
YS9NYWtlZmlsZQo+ID4gCj4gPiBEaWQgc29tZW9uZSBkZWxldGUgaXQ/Cj4gCj4gQ29tbWl0Cj4g
Cj4gICA1ZWQ3YTBjZjMzOTQgKCJkcm0vaTkxNTogTW92ZSBPQSBmaWxlcyB0byBzZXBhcmF0ZSBm
b2xkZXIiKQo+IAo+IGZyb20gdGhlIGRybS1pbnRlbCB0cmVlIHNlZW1zIHRvIGhhdmUgY3JlYXRl
ZCBpdCBhcyBhbiBlbXB0eSBmaWxlLgoKaHJtLgoKZGlmZigxKSBkb2Vzbid0IHNlZW0gdG8ga25v
dyBob3cgdG8gaGFuZGxlIGEgemVyby1sZW5ndGggZmlsZS4KCnk6L2hvbWUvYWtwbT4gbWtkaXIg
Zm9vCnk6L2hvbWUvYWtwbT4gY2QgZm9vCnk6L2hvbWUvYWtwbS9mb28+IHRvdWNoIHgKeTovaG9t
ZS9ha3BtL2Zvbz4gZGlmZiAtdU4geCB5Cnk6L2hvbWUvYWtwbS9mb28+IGRhdGUgPiB4Cnk6L2hv
bWUvYWtwbS9mb28+IGRpZmYgLXVOIHggeQotLS0geCAgIDIwMTktMDctMDQgMjE6NTg6MzcuODE1
MDI4MjExIC0wNzAwCisrKyB5ICAgMTk2OS0xMi0zMSAxNjowMDowMC4wMDAwMDAwMDAgLTA4MDAK
QEAgLTEgKzAsMCBAQAotVGh1IEp1bCAgNCAyMTo1ODozNyBQRFQgMjAxOQoKU28gd2hlbiBjb21w
YXJpbmcgYSB6ZXJvLWxlbmd0aCBmaWxlIHdpdGggYSBub24tZXhpc3RlbnQgZmlsZSwgZGlmZgpw
cm9kdWNlcyBubyBvdXRwdXQuCgoKVGhpcydsbCBtYWtlIHRoaW5ncyBoYXBweS4gIEFuZCBJIGd1
ZXNzIGl0IHNob3VsZCBiZSBkb25lIHRvIHByb3RlY3QKYWxsIHRoZSB2YWx1YWJsZSBpbnRlbGxl
Y3R1YWwgcHJvcGVydHkgaW4gdGhhdCBmaWxlLgoKLS0tIC9kZXYvbnVsbAorKysgYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9vYS9NYWtlZmlsZQpAQCAtMCwwICsxIEBACisjIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wCl8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
