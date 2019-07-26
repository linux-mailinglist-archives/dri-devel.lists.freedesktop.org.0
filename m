Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C519D76743
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 15:23:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A042A6ED54;
	Fri, 26 Jul 2019 13:23:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1836ED54
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 13:23:23 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6880722ADA;
 Fri, 26 Jul 2019 13:23:22 +0000 (UTC)
Subject: Patch "dma-buf: balance refcount inbalance" has been added to the
 4.14-stable tree
To: 20181206161840.6578-1-jglisse@redhat.com, christian.koenig@amd.com,
 daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jglisse@redhat.com, linaro-mm-sig@lists.linaro.org,
 marcheu@chromium.org, sumit.semwal@linaro.org
From: <gregkh@linuxfoundation.org>
Date: Fri, 26 Jul 2019 15:23:19 +0200
Message-ID: <156414739941229@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564147402;
 bh=lTl18kl+eQUcCEZ1yMdN8VLKuBbu4R1sks3ecLq3PHg=;
 h=Subject:To:Cc:From:Date:From;
 b=ath8YGm4/Kvdckwfd8WmRZhe9af02VmpZRbNQ6kwOxRhbYQeeh4pmWuxGgW5SsaYJ
 gHUnaH71Hu7B6a5eUDnoqL5MUdsr3GMgfzQkCKru3hng92XDSqHkp3abULm23tPbCe
 Lfa8REKF6w7aLeMKCiuF81dbBZs7e9j5Q37TntWI=
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
Cc: stable-commits@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ClRoaXMgaXMgYSBub3RlIHRvIGxldCB5b3Uga25vdyB0aGF0IEkndmUganVzdCBhZGRlZCB0aGUg
cGF0Y2ggdGl0bGVkCgogICAgZG1hLWJ1ZjogYmFsYW5jZSByZWZjb3VudCBpbmJhbGFuY2UKCnRv
IHRoZSA0LjE0LXN0YWJsZSB0cmVlIHdoaWNoIGNhbiBiZSBmb3VuZCBhdDoKICAgIGh0dHA6Ly93
d3cua2VybmVsLm9yZy9naXQvP3A9bGludXgva2VybmVsL2dpdC9zdGFibGUvc3RhYmxlLXF1ZXVl
LmdpdDthPXN1bW1hcnkKClRoZSBmaWxlbmFtZSBvZiB0aGUgcGF0Y2ggaXM6CiAgICAgZG1hLWJ1
Zi1iYWxhbmNlLXJlZmNvdW50LWluYmFsYW5jZS5wYXRjaAphbmQgaXQgY2FuIGJlIGZvdW5kIGlu
IHRoZSBxdWV1ZS00LjE0IHN1YmRpcmVjdG9yeS4KCklmIHlvdSwgb3IgYW55b25lIGVsc2UsIGZl
ZWxzIGl0IHNob3VsZCBub3QgYmUgYWRkZWQgdG8gdGhlIHN0YWJsZSB0cmVlLApwbGVhc2UgbGV0
IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiBrbm93IGFib3V0IGl0LgoKCkZyb20gNWUzODNhOTc5
ODk5MGM2OWZjNzU5YTQ5MzBkZTIyNGJiNDk3ZTYyYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
RnJvbTogPT9VVEYtOD9xP0o9QzM9QTlyPUMzPUI0bWU9MjBHbGlzc2U/PSA8amdsaXNzZUByZWRo
YXQuY29tPgpEYXRlOiBUaHUsIDYgRGVjIDIwMTggMTE6MTg6NDAgLTA1MDAKU3ViamVjdDogZG1h
LWJ1ZjogYmFsYW5jZSByZWZjb3VudCBpbmJhbGFuY2UKTUlNRS1WZXJzaW9uOiAxLjAKQ29udGVu
dC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CkNvbnRlbnQtVHJhbnNmZXItRW5jb2Rp
bmc6IDhiaXQKCkZyb206IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgoKY29t
bWl0IDVlMzgzYTk3OTg5OTBjNjlmYzc1OWE0OTMwZGUyMjRiYjQ5N2U2MmMgdXBzdHJlYW0uCgpU
aGUgZGVidWdmcyB0YWtlIHJlZmVyZW5jZSBvbiBmZW5jZSB3aXRob3V0IGRyb3BwaW5nIHRoZW0u
CgpTaWduZWQtb2ZmLWJ5OiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KQ2M6
IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+CkNjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNl
bXdhbEBsaW5hcm8ub3JnPgpDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCkNjOiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBsaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFy
by5vcmcKQ2M6IFN0w6lwaGFuZSBNYXJjaGVzaW4gPG1hcmNoZXVAY2hyb21pdW0ub3JnPgpDYzog
c3RhYmxlQHZnZXIua2VybmVsLm9yZwpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBTdW1pdCBTZW13YWwgPHN1bWl0
LnNlbXdhbEBsaW5hcm8ub3JnPgpMaW5rOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5v
cmcvcGF0Y2gvbXNnaWQvMjAxODEyMDYxNjE4NDAuNjU3OC0xLWpnbGlzc2VAcmVkaGF0LmNvbQpT
aWduZWQtb2ZmLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24u
b3JnPgoKLS0tCiBkcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jIHwgICAgMSArCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKykKCi0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMKKysr
IGIvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYwpAQCAtMTExNSw2ICsxMTE1LDcgQEAgc3RhdGlj
IGludCBkbWFfYnVmX2RlYnVnX3Nob3coc3RydWN0IHNlcQogCQkJCSAgIGZlbmNlLT5vcHMtPmdl
dF9kcml2ZXJfbmFtZShmZW5jZSksCiAJCQkJICAgZmVuY2UtPm9wcy0+Z2V0X3RpbWVsaW5lX25h
bWUoZmVuY2UpLAogCQkJCSAgIGRtYV9mZW5jZV9pc19zaWduYWxlZChmZW5jZSkgPyAiIiA6ICJ1
biIpOworCQkJZG1hX2ZlbmNlX3B1dChmZW5jZSk7CiAJCX0KIAkJcmN1X3JlYWRfdW5sb2NrKCk7
CiAKCgpQYXRjaGVzIGN1cnJlbnRseSBpbiBzdGFibGUtcXVldWUgd2hpY2ggbWlnaHQgYmUgZnJv
bSBqZ2xpc3NlQHJlZGhhdC5jb20gYXJlCgpxdWV1ZS00LjE0L2RtYS1idWYtYmFsYW5jZS1yZWZj
b3VudC1pbmJhbGFuY2UucGF0Y2gKcXVldWUtNC4xNC9saWJudmRpbW0tcGZuLWZpeC1mc2RheC1t
b2RlLW5hbWVzcGFjZS1pbmZvLWJsb2NrLXplcm8tZmllbGRzLnBhdGNoCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
