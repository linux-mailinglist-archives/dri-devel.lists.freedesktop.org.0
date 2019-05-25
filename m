Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A12152B419
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECBE489B9E;
	Mon, 27 May 2019 12:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 576 seconds by postgrey-1.36 at gabe;
 Sat, 25 May 2019 02:14:12 UTC
Received: from mail3-164.sinamail.sina.com.cn (mail3-164.sinamail.sina.com.cn
 [202.108.3.164])
 by gabe.freedesktop.org (Postfix) with SMTP id 7F2766E0E9
 for <dri-devel@lists.freedesktop.org>; Sat, 25 May 2019 02:14:12 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([114.253.229.186])
 by sina.com with ESMTP
 id 5CE8A16E00005108; Sat, 25 May 2019 09:59:11 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 736708394874
From: Hillf Danton <hdanton@sina.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 03/12] dma-buf: lock the reservation object during
 (un)map_dma_buf v3
Date: Sat, 25 May 2019 09:59:01 +0800
Message-Id: <20190416183841.1577-4-christian.koenig@amd.com>
In-Reply-To: <20190416183841.1577-1-christian.koenig@amd.com>
References: <20190416183841.1577-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
Archived-At: <https://lore.kernel.org/lkml/20190416183841.1577-4-christian.koenig@amd.com/>
X-Mailman-Approved-At: Mon, 27 May 2019 12:03:54 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIFR1ZSwgMTYgQXByIDIwMTkgMjA6Mzg6MzIgKzAyMDAgQ2hyaXN0aWFuIEvDtm5pZyB3cm90
ZToKPiBAQCAtNjg4LDkgKzY4OSw5IEBAIHN0cnVjdCBzZ190YWJsZSAqZG1hX2J1Zl9tYXBfYXR0
YWNobWVudChzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICphdHRhY2gsCj4gIAlpZiAoYXR0YWNo
LT5zZ3QpCj4gIAkJcmV0dXJuIGF0dGFjaC0+c2d0Owo+ICAKPiAtCXNnX3RhYmxlID0gYXR0YWNo
LT5kbWFidWYtPm9wcy0+bWFwX2RtYV9idWYoYXR0YWNoLCBkaXJlY3Rpb24pOwo+IC0JaWYgKCFz
Z190YWJsZSkKPiAtCQlzZ190YWJsZSA9IEVSUl9QVFIoLUVOT01FTSk7Cj4gKwlyZXNlcnZhdGlv
bl9vYmplY3RfbG9jayhhdHRhY2gtPmRtYWJ1Zi0+cmVzdiwgTlVMTCk7Cj4gKwlzZ190YWJsZSA9
IGRtYV9idWZfbWFwX2F0dGFjaG1lbnRfbG9ja2VkKGF0dGFjaCwgZGlyZWN0aW9uKTsKPiArCXJl
c2VydmF0aW9uX29iamVjdF91bmxvY2soYXR0YWNoLT5kbWFidWYtPnJlc3YpOwo+ICAKTG9va3Mg
YmV0dGVyIGlmIHNnX3RhYmxlIGlzIGNoZWNrZWQgYWZ0ZXIgbWFwcGluZywgYW5kIGZlZWQgZXJy
b3IgaW5mbwpiYWNrIGluIGNhc2UgdGhlcmUgaXMgYW55dGhpbmcgdW51c3VhbC4KCj4gIAlyZXR1
cm4gc2dfdGFibGU7Cj4gIH0KCkJlc3QgUmVnYXJkcwpIaWxsZgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
