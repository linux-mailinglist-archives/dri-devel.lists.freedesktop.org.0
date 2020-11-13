Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E88B2B21F9
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 18:20:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496B66E506;
	Fri, 13 Nov 2020 17:20:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 323696E506;
 Fri, 13 Nov 2020 17:20:42 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c17so10702822wrc.11;
 Fri, 13 Nov 2020 09:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NEaARK+POApdAw5J8PNHmNemCEDBmRf/3tg6J4pJI0M=;
 b=R6rtmTSZnNl731YRGDLFG8hdCdRPWHKjhA5UWZjwI/PfJwUVBbSL27+peGAr4V+8iD
 iWYOBX+e9pfgg2gKPbaBOOprNQy08NDVePDaiWsgSlMREsV0Sz76OaWCE53Qxr75P7WP
 207JKI2lKpeNFEuyweyLq7RdqXj99TONcWbmZvIQhuuoFhVlrm1y8SATNKAQwABE2cuc
 DpeqZROMHnwcL9QjSsIUdTX66nmAPJMsCcX2uDbT1KccODGZJ07Pp3u8p9JVk40+fpew
 bIj4RNYMe1KKB9kWdQgDafM61W8MeurXYsLX4joBLQG9uHK+OC8162NWnbxjjQa/AXDv
 jxIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NEaARK+POApdAw5J8PNHmNemCEDBmRf/3tg6J4pJI0M=;
 b=ilQ5BHqEvmFGyJI8kq1rtCXl0V51ogmVxt8M1PJGArSSedmdXv+meMQcdztLy1jPXR
 OGYj2ltt1lrQDmhLSYQaUsh4R25c5DgL6xatrbzxb+qdvLHkQp7XrW8HoqhvBtSLRupG
 KYezrYF535f/UzQ09i0td11+vKRWYtz1GqNXxw/qP+EfEk+xVQC+WaQA/XzcOqgO6/a+
 tLoGmpEFPFRvEMjJGKAZpqPYOdqWQdfB+068h3UBATVAXxQ2VkQS4ELddCIk996PSoEv
 N26vqwK/1jZNBG08s0Qiu1JvZbQGcnmUM0lkH+8dSF6/Z69ixZoKLa5jMlYM/8EkVADB
 tJIQ==
X-Gm-Message-State: AOAM531By+poHDC0rojlzWzf37c+6DWVHWeOLOcuhivnL/e/cKWg7duW
 kqoqE5vZCR+bSVo82E8OA1+J6entv0Vl39QGm2k=
X-Google-Smtp-Source: ABdhPJy7Om5K1FFzu6cmA2r6Ya+DBvWq+aqxYz57w5FYoi0nJHblqOjzwI/+I4lO7oFHhLpR1lOPoURC+78Bii+3aVc=
X-Received: by 2002:adf:e9c9:: with SMTP id l9mr5020076wrn.124.1605288036035; 
 Fri, 13 Nov 2020 09:20:36 -0800 (PST)
MIME-Version: 1.0
References: <20201113134938.4004947-1-lee.jones@linaro.org>
 <20201113134938.4004947-20-lee.jones@linaro.org>
In-Reply-To: <20201113134938.4004947-20-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 13 Nov 2020 12:20:24 -0500
Message-ID: <CADnq5_PCYT6aCJEwkrS6949zU=trK5D-75w4FEWFkhaGGXtE1Q@mail.gmail.com>
Subject: Re: [PATCH 19/40] drm/amd/amdgpu/amdgpu_vram_mgr: Add missing
 descriptions for 'dev' and 'dir'
To: Lee Jones <lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMTMsIDIwMjAgYXQgODo1MCBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21n
ci5jOjY0ODogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnZGV2JyBub3Qg
ZGVzY3JpYmVkIGluICdhbWRncHVfdnJhbV9tZ3JfZnJlZV9zZ3QnCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jOjY0ODogd2FybmluZzogRnVuY3Rpb24gcGFy
YW1ldGVyIG9yIG1lbWJlciAnZGlyJyBub3QgZGVzY3JpYmVkIGluICdhbWRncHVfdnJhbV9tZ3Jf
ZnJlZV9zZ3QnCj4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29t
Pgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBD
YzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9u
ZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jIHwgMiArKwo+
ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYwo+IGluZGV4IGM5OWMyMTgwNzg1ZmUuLmQyZGUy
YTcyMGEzZDggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3ZyYW1fbWdyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJh
bV9tZ3IuYwo+IEBAIC02MzcsNiArNjM3LDggQEAgaW50IGFtZGdwdV92cmFtX21ncl9hbGxvY19z
Z3Qoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4gICAqIGFtZGdwdV92cmFtX21ncl9mcmVl
X3NndCAtIGFsbG9jYXRlIGFuZCBmaWxsIGEgc2cgdGFibGUKPiAgICoKPiAgICogQGFkZXY6IGFt
ZGdwdSBkZXZpY2UgcG9pbnRlcgo+ICsgKiBAZGV2OiBkZXZpY2UgcG9pbnRlcgo+ICsgKiBAZGly
OiBkYXRhIGRpcmVjdGlvbiBvZiByZXNvdXJjZSB0byB1bm1hcAo+ICAgKiBAc2d0OiBzZyB0YWJs
ZSB0byBmcmVlCj4gICAqCj4gICAqIEZyZWUgYSBwcmV2aW91c2x5IGFsbG9jYXRlIHNnIHRhYmxl
Lgo+IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
