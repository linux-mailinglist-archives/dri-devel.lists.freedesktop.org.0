Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8591CF5EE
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 15:36:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B3456E920;
	Tue, 12 May 2020 13:36:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C60EB6E91F;
 Tue, 12 May 2020 13:36:20 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g12so23315203wmh.3;
 Tue, 12 May 2020 06:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=J5DvAP2lbWJkb/EMfFCFsd6m2UTqVb9Yed+J4s6J69c=;
 b=BexnVYuO2JIJys/fjqP16ygW1WHdR254wX2vPbKq485jRBXVDF8Z5Qa/VwYbw0M5NF
 NfXiglYsDyvStf8yYAJGMWGLIqf1nO8igXNruoiDdviHKysGnzOFuCAFLmsW6Q8fVNaP
 ODuYlpQNMB5BmHjOPdd8dSylqgF3zrvPBUx+OH0YzCjt7YKqXa5GB8WTBNraixyF6att
 Ey+p8wm6EzKM7hsbS656It7F+3Q5dw3BnhXbI2pcAZgF+WBLOYp8eLyVMfK1NuLAmbVW
 ZQEKF0Pc8CKawHYVEvEBKHhhuRWgmymIFNDZQkIOGsLP4aZOpZ/bfw4ARBfiAF9bIA7r
 Ruuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=J5DvAP2lbWJkb/EMfFCFsd6m2UTqVb9Yed+J4s6J69c=;
 b=l0WS7skwlS2JZVNVpIQIWWKBvWNq20qDtNMyuHhlSScqlc+kgFh9pdZy6ZhpIVZ67P
 2bLZidqkUkBEKdYAdM5zkxWObwkACQwjuTj0vh5Oo11EJ5tXHY2kxxs8jSEaGYuNU9l7
 Umf5KpCLAsPU5Zg+rkQdQa+v6efEAiuUh42Tu5rZ5y3PI9kFE7Gd+61SbJ+aLNYgh/v2
 /shFT7846FhyK0JBrnxYBMrQ8jmhZ6cSpLEZ5PGs05DmaL15xIDsKj+HTn1+lVHx54pX
 8IRqvUTh/wk3OasYuLeDjLMA+yCjxbxNO7BO74NH+aUIeEuHsasKSRBf5A2b02mxvdaj
 CqQA==
X-Gm-Message-State: AGi0PuYqxM21Htw7FW3Xaomls6b8MKQ0UNbm4FrU4R9XBhgatUdZRrM5
 V+fcG0V/7zlIz0xNHaUnuAAiVA7gOq8/n1nifa4=
X-Google-Smtp-Source: APiQypJplcEZq9H+aUu96RDn+Ayr6CmA/24K7Ox51OuSX5Qe7tjYBXYD3zU5hEINM2qiTtOs3DbDAz16HrwMPu/XpMI=
X-Received: by 2002:a7b:cc0e:: with SMTP id f14mr37549322wmh.39.1589290579452; 
 Tue, 12 May 2020 06:36:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200511171722.96576-1-christian.koenig@amd.com>
 <20200511171722.96576-2-christian.koenig@amd.com>
 <CADnq5_MyO_L+1w69qDLzhg34W6Qer-uSRR2tb7-2uXLC_6PXSg@mail.gmail.com>
 <ba0b1ab7-3078-a6f2-41cd-326ca21ee99f@daenzer.net>
In-Reply-To: <ba0b1ab7-3078-a6f2-41cd-326ca21ee99f@daenzer.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 May 2020 09:36:08 -0400
Message-ID: <CADnq5_MdbJUXs7wbG=HCOKj4Vp_NmLkcJng=EXynSXPe9gsyOQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/radeon: remove AGP support
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMTIsIDIwMjAgYXQgNDoxNiBBTSBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRh
ZW56ZXIubmV0PiB3cm90ZToKPgo+IE9uIDIwMjAtMDUtMTEgMTA6MTIgcC5tLiwgQWxleCBEZXVj
aGVyIHdyb3RlOgo+ID4gT24gTW9uLCBNYXkgMTEsIDIwMjAgYXQgMToxNyBQTSBDaHJpc3RpYW4g
S8O2bmlnCj4gPiA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+ID4+
Cj4gPj4gQUdQIGlzIGRlcHJlY2F0ZWQgZm9yIDEwKyB5ZWFycyBub3cgYW5kIG5vdCB1c2VkIGFu
eSBtb3JlIG9uIG1vZGVybiBoYXJkd2FyZS4KPiA+Pgo+ID4+IE9sZCBoYXJkd2FyZSBzaG91bGQg
Y29udGludWUgdG8gd29yayBpbiBQQ0kgbW9kZS4KPiA+Cj4gPiBNaWdodCB3YW50IHRvIGNsYXJp
ZnkgdGhhdCB0aGVyZSBpcyBubyBsb3NzIG9mIGZ1bmN0aW9uYWxpdHkgaGVyZS4KPiA+IFNvbWV0
aGluZyBsaWtlOgo+ID4KPiA+ICJUaGVyZSBpcyBubyBsb3NzIG9mIGZ1bmN0aW9uYWxpdHkgaGVy
ZS4gIEdQVXMgd2lsbCBjb250aW51ZSB0bwo+ID4gZnVuY3Rpb24uICBUaGlzIGp1c3QgZHJvcHMg
dGhlIHVzZSBvZiB0aGUgQUdQIE1NVSBpbiB0aGUgY2hpcHNldCBpbgo+ID4gZmF2b3Igb2YgdGhl
IE1NVSBvbiB0aGUgZGV2aWNlIHdoaWNoIGhhcyBwcm92ZW4gdG8gYmUgbXVjaCBtb3JlCj4gPiBy
ZWxpYWJsZS4gIER1ZSB0byBpdHMgdW5yZWxpYWJpbGl0eSwgQUdQIHN1cHBvcnQgaGFzIGJlZW4g
ZGlzYWJsZWQgb24KPiA+IFBvd2VyUEMgZm9yIHllYXJzIGFscmVhZHkgc28gdGhlcmUgaXMgbm8g
Y2hhbmdlIG9uIFBvd2VyUEMuIgo+Cj4gVGhlcmUncyBhIGRpZmZlcmVuY2UgYmV0d2VlbiBzb21l
dGhpbmcgYmVpbmcgZGlzYWJsZWQgYnkgZGVmYXVsdCBvciBub3QKPiBiZWluZyBhdmFpbGFibGUg
YXQgYWxsLiBXZSBtYXkgZGVjaWRlIGl0J3Mgd29ydGggaXQgYW55d2F5LCBidXQgbGV0J3MgZG8K
PiBpdCBiYXNlZCBvbiBmYWN0cy4KPgoKSSBkaWRuJ3QgbWVhbiB0byBpbXBseSB0aGF0IEFHUCBH
QVJUIHN1cHBvcnQgd2FzIGFscmVhZHkgcmVtb3ZlZC4gIEJ1dApmb3IgdGhlIHZhc3QgbWFqb3Jp
dHkgb2YgdXNlcnMgdGhlIGVuZCByZXN1bHQgaXMgdGhlIHNhbWUuICBJZiB5b3UKa25ldyBlbm91
Z2ggcmUtZW5hYmxlIEFHUCBHQVJULCB5b3UgcHJvYmFibHkgd291bGRuJ3QgaGF2ZSBiZWVuIGFz
CmNvbmZ1c2VkIGFib3V0IHdoYXQgdGhpcyBwYXRjaCBzZXQgZG9lcyBlaXRoZXIuICBUbyByZWl0
ZXJhdGUsIHRoaXMKcGF0Y2ggc2V0IGRvZXMgbm90IHJlbW92ZSBzdXBwb3J0IGZvciBBR1AgY2Fy
ZHMsIGl0IG9ubHkgcmVtb3ZlcyB0aGUKc3VwcG9ydCBmb3IgQUdQIEdBUlQuICBUaGUgY2FyZHMg
d2lsbCBzdGlsbCBiZSBmdW5jdGlvbmFsIHVzaW5nIHRoZQpkZXZpY2UgR0FSVC4gIFRoZXJlIG1h
eSBiZSBwZXJmb3JtYW5jZSB0cmFkZW9mZnMgdGhlcmUgaW4gc29tZSBjYXNlcy4KCkFsZXgKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
