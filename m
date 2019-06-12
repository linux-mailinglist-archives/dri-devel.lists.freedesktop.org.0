Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B59B4339E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:30:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E133894EA;
	Thu, 13 Jun 2019 07:28:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 571 seconds by postgrey-1.36 at gabe;
 Wed, 12 Jun 2019 13:36:34 UTC
Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FCF2892EE
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 13:36:34 +0000 (UTC)
Received: from ns.iliad.fr (localhost [127.0.0.1])
 by ns.iliad.fr (Postfix) with ESMTP id 311D5202EC;
 Wed, 12 Jun 2019 15:27:02 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
 by ns.iliad.fr (Postfix) with ESMTP id 1A9AC1FF7C;
 Wed, 12 Jun 2019 15:27:02 +0200 (CEST)
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: [PATCH v1] backlight: Don't build support by default
Message-ID: <70bd61f9-8fc5-75b1-9f32-7a5826ce6b48@free.fr>
Date: Wed, 12 Jun 2019 15:27:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ;
 Wed Jun 12 15:27:02 2019 +0200 (CEST)
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:24 +0000
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
Cc: fbdev <linux-fbdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

YjIwYzUyNDlhYTZhICgiYmFja2xpZ2h0OiBGaXggY29tcGlsZSBlcnJvciBpZiBDT05GSUdfRkIg
aXMgdW5zZXQiKQphZGRlZCAnZGVmYXVsdCBtJyBmb3IgQkFDS0xJR0hUX0NMQVNTX0RFVklDRSBh
bmQgTENEX0NMQVNTX0RFVklDRS4KCkxldCdzIGdvIGJhY2sgdG8gbm90IGJ1aWxkaW5nIHN1cHBv
cnQgYnkgZGVmYXVsdC4KClNpZ25lZC1vZmYtYnk6IE1hcmMgR29uemFsZXogPG1hcmMudy5nb256
YWxlekBmcmVlLmZyPgotLS0KIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L0tjb25maWcgfCAyIC0t
CiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3Zp
ZGVvL2JhY2tsaWdodC9LY29uZmlnIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvS2NvbmZpZwpp
bmRleCA4YjA4MWQ2MTc3M2UuLjQwNjc2YmUyZTQ2YSAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRl
by9iYWNrbGlnaHQvS2NvbmZpZworKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9LY29uZmln
CkBAIC0xMCw3ICsxMCw2IEBAIG1lbnUgIkJhY2tsaWdodCAmIExDRCBkZXZpY2Ugc3VwcG9ydCIK
ICMKIGNvbmZpZyBMQ0RfQ0xBU1NfREVWSUNFCiAgICAgICAgIHRyaXN0YXRlICJMb3dsZXZlbCBM
Q0QgY29udHJvbHMiCi0JZGVmYXVsdCBtCiAJaGVscAogCSAgVGhpcyBmcmFtZXdvcmsgYWRkcyBz
dXBwb3J0IGZvciBsb3ctbGV2ZWwgY29udHJvbCBvZiBMQ0QuCiAJICBTb21lIGZyYW1lYnVmZmVy
IGRldmljZXMgY29ubmVjdCB0byBwbGF0Zm9ybS1zcGVjaWZpYyBMQ0QgbW9kdWxlcwpAQCAtMTQz
LDcgKzE0Miw2IEBAIGVuZGlmICMgTENEX0NMQVNTX0RFVklDRQogIwogY29uZmlnIEJBQ0tMSUdI
VF9DTEFTU19ERVZJQ0UKICAgICAgICAgdHJpc3RhdGUgIkxvd2xldmVsIEJhY2tsaWdodCBjb250
cm9scyIKLQlkZWZhdWx0IG0KIAloZWxwCiAJICBUaGlzIGZyYW1ld29yayBhZGRzIHN1cHBvcnQg
Zm9yIGxvdy1sZXZlbCBjb250cm9sIG9mIHRoZSBMQ0QKICAgICAgICAgICBiYWNrbGlnaHQuIFRo
aXMgaW5jbHVkZXMgc3VwcG9ydCBmb3IgYnJpZ2h0bmVzcyBhbmQgcG93ZXIuCi0tIAoyLjE3LjEK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
