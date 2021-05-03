Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E99371F47
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 20:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC216E10A;
	Mon,  3 May 2021 18:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [IPv6:2a01:4f8:231:de0::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB8C6E0EE;
 Mon,  3 May 2021 18:08:30 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 3E51CC800D0;
 Mon,  3 May 2021 20:08:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id lYnKtLw43Eeq; Mon,  3 May 2021 20:08:29 +0200 (CEST)
Received: from wsembach-tuxedo.fritz.box
 (p200300e37F3986001a8b79e0b24Cb29D.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f39:8600:1a8b:79e0:b24c:b29d])
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPA id C8427C800CE;
 Mon,  3 May 2021 20:08:28 +0200 (CEST)
From: Werner Sembach <wse@tuxedocomputers.com>
To: wse@tuxedocomputers.com, ville.syrjala@linux.intel.com, airlied@linux.ie,
 daniel@ffwll.ch, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] drm/i915/display Try YCbCr420 color when RGB fails
Date: Mon,  3 May 2021 20:08:07 +0200
Message-Id: <20210503180810.851302-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBlbmNvZGVyIHZhbGlkYXRpb24gb2YgYSBkaXNwbGF5IG1vZGUgZmFpbHMsIHJldHJ5IHdp
dGggbGVzcyBiYW5kd2lkdGgKaGVhdnkgWUNiQ3I0MjAgY29sb3IgbW9kZSwgaWYgYXZhaWxhYmxl
LiBUaGlzIGVuYWJsZXMgc29tZSBIRE1JIDEuNCBzZXR1cHMKdG8gc3VwcG9ydCA0azYwSHogb3V0
cHV0LCB3aGljaCBwcmV2aW91c2x5IGZhaWxlZCBzaWxlbnRseS4KCkFNREdQVSBoYWQgbmVhcmx5
IHRoZSBleGFjdCBzYW1lIGlzc3VlLiBUaGlzIHByb2JsZW0gZGVzY3JpcHRpb24gaXMKdGhlcmVm
b3JlIGNvcGllZCBmcm9tIG15IGNvbW1pdCBtZXNzYWdlIG9mIHRoZSBBTURHUFUgcGF0Y2guCgpP
biBzb21lIHNldHVwcywgd2hpbGUgdGhlIG1vbml0b3IgYW5kIHRoZSBncHUgc3VwcG9ydCBkaXNw
bGF5IG1vZGVzIHdpdGgKcGl4ZWwgY2xvY2tzIG9mIHVwIHRvIDYwME1IeiwgdGhlIGxpbmsgZW5j
b2RlciBtaWdodCBub3QuIFRoaXMgcHJldmVudHMKWUNiQ3I0NDQgYW5kIFJHQiBlbmNvZGluZyBm
b3IgNGs2MEh6LCBidXQgWUNiQ3I0MjAgZW5jb2RpbmcgbWlnaHQgc3RpbGwgYmUKcG9zc2libGUu
IEhvd2V2ZXIsIHdoaWNoIGNvbG9yIG1vZGUgaXMgdXNlZCBpcyBkZWNpZGVkIGJlZm9yZSB0aGUg
bGluawplbmNvZGVyIGNhcGFiaWxpdGllcyBhcmUgY2hlY2tlZC4gVGhpcyBwYXRjaCBmaXhlcyB0
aGUgcHJvYmxlbSBieSByZXRyeWluZwp0byBmaW5kIGEgZGlzcGxheSBtb2RlIHdpdGggWUNiQ3I0
MjAgZW5mb3JjZWQgYW5kIHVzaW5nIGl0LCBpZiBpdCBpcwp2YWxpZC4KClRoaXMgcGF0Y2hzZXQg
aXMgcmV2aXNpb24gMiwgbm93IHNwbGl0IHVwIGluIG11bHRpcGxlIHBhcnRzIHdpdGggc29tZQpt
aW5vciByZXN0cnVjdHVyaW5nIGFkZGVkIGbDvHIgYSBjbGVhbmVyIGltcGxlbWVudGF0aW9uLgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
