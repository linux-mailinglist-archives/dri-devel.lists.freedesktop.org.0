Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D4821B6A3
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 15:38:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 421D36E095;
	Fri, 10 Jul 2020 13:38:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1160C6E095
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 13:38:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EAE72AC9F;
 Fri, 10 Jul 2020 13:38:51 +0000 (UTC)
Subject: Re: [PATCH] efi: avoid error message when booting under Xen
To: Ard Biesheuvel <ardb@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <20200610141052.13258-1-jgross@suse.com>
 <094be567-2c82-7d5b-e432-288286c6c3fb@suse.com>
 <CGME20200709091750eucas1p18003b0c8127600369485c62c1e587c22@eucas1p1.samsung.com>
 <ec21b883-dc5c-f3fe-e989-7fa13875a4c4@suse.com>
 <170e01b1-220d-5cb7-03b2-c70ed3ae58e4@samsung.com>
 <CAMj1kXGE52Y6QQhGLU6r_9x6TVftZqfS7zyLCiDusZhV4tbhjg@mail.gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <b4e60a2f-e761-d9ad-88ad-fe041109c063@suse.com>
Date: Fri, 10 Jul 2020 15:38:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAMj1kXGE52Y6QQhGLU6r_9x6TVftZqfS7zyLCiDusZhV4tbhjg@mail.gmail.com>
Content-Language: en-US
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: linux-fbdev@vger.kernel.org, linux-efi <linux-efi@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Peter Jones <pjones@redhat.com>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAuMDcuMjAgMTU6MjcsIEFyZCBCaWVzaGV1dmVsIHdyb3RlOgo+IE9uIEZyaSwgMTAgSnVs
IDIwMjAgYXQgMTM6MTcsIEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3oKPiA8Yi56b2xuaWVya2ll
QHNhbXN1bmcuY29tPiB3cm90ZToKPj4KPj4KPj4gWyBhZGRlZCBFRkkgTWFpbnRhaW5lciAmIE1M
IHRvIENjOiBdCj4+Cj4+IEhpLAo+Pgo+PiBPbiA3LzkvMjAgMTE6MTcgQU0sIErDvHJnZW4gR3Jv
w58gd3JvdGU6Cj4+PiBPbiAyOC4wNi4yMCAxMDo1MCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4+
PiBQaW5nPwo+Pj4+Cj4+Pj4gT24gMTAuMDYuMjAgMTY6MTAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6
Cj4+Pj4+IGVmaWZiX3Byb2JlKCkgd2lsbCBpc3N1ZSBhbiBlcnJvciBtZXNzYWdlIGluIGNhc2Ug
dGhlIGtlcm5lbCBpcyBib290ZWQKPj4+Pj4gYXMgWGVuIGRvbTAgZnJvbSBVRUZJIGFzIEVGSV9N
RU1NQVAgd29uJ3QgYmUgc2V0IGluIHRoaXMgY2FzZS4gQXZvaWQKPj4+Pj4gdGhhdCBtZXNzYWdl
IGJ5IGNhbGxpbmcgZWZpX21lbV9kZXNjX2xvb2t1cCgpIG9ubHkgaWYgRUZJX1BBUkFWSVJUCj4+
Pj4+IGlzbid0IHNldC4KPj4+Pj4KPiAKPiBXaHkgbm90IHRlc3QgZm9yIEVGSV9NRU1NQVAgaW5z
dGVhZCBvZiBFRklfQk9PVD8KCkhvbmVzdGx5IEknbSBub3Qgc3VyZSBFRklfQk9PVCBpcyBhbHdh
eXMgc2V0IGluIHRoYXQgY2FzZS4gSWYgeW91IHRlbGwKbWUgaXQgaXMgZmluZSB0byBqdXN0IHJl
cGxhY2UgdGhlIHRlc3QgdG8gY2hlY2sgZm9yIEVGSV9NRU1NQVAgSSdtIGZpbmUKdG8gbW9kaWZ5
IG15IHBhdGNoLgoKCkp1ZXJnZW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
