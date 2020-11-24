Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E1B2C2C4B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 17:07:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63FA6E483;
	Tue, 24 Nov 2020 16:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151EA6E47E;
 Tue, 24 Nov 2020 16:07:52 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a3so3403012wmb.5;
 Tue, 24 Nov 2020 08:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8rWhHtCJs5MGkWI+i55QfEjGeto3X3YjovT1RZF7HCw=;
 b=i9DOX/pMZJJPDsx86lswNkEyyUpgYz4ORc7uLGiD3jB08V2nwpgokmb06iSMr5Fb9P
 t6NitYSpQR2pxV5iPEuhe96kXvv+lQ44nKDVOw7IA1nj4sr9bTHs5YNMrlqb4MKpH9uI
 /5WWkmXfFnzON/rJSoZ9vtMrqcNHjNLEwBsQVEHR+1UPDz3UR31XzpmQLRsorX6pMYF8
 sCvpvqwmg5DerfWx3hSS2Roh6ceTU1CAvFFIhlhelybtn9MtqzRXYb5PraplGQihnYuG
 9dTasMIrHKWnTuzKGhWLZpzEFtdigCpjjDT3at9ahxg1Jk5Z7+8OuULIHfOpNvbQrV8N
 J9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8rWhHtCJs5MGkWI+i55QfEjGeto3X3YjovT1RZF7HCw=;
 b=rz6+giZFdmfVKnUsG3xsagAlY+Y84FWwo9CUtOBoc0hsy51pICWexAhw0lE+qqVHt2
 bMvPai2yEYqsOWc2ugsqbSCfllz8aEkP3h42hvXwiaonGoLo1yN1kTL2iKHhefEHk9Ef
 s0aw1jqDolICbnkqTI6J6LT69MOm+ZL9RPjSoV2hrQxyKDm/5VAViYonDmykfZW0PCDK
 XeEwAy58zgDKrdX7miSM1+5epTA0p4oQnm7otpes56Q9e8ttpRS6i60EfLZkqwMzwCJQ
 0GgEjxdXIss/kaM2XeQifR/As0znbIM0AtqnxIgF4zBuAAvvKqSxkKv1rezl7+8WJbFC
 O3Fg==
X-Gm-Message-State: AOAM5328iC2uDHX3wBlRGLSYZkWqi2cIDF57nO05C8u/Gtw2RloFecrM
 S+UAtdjr1Zi9KCPsnzHOB8Z7dITpJMJbNRmH18c=
X-Google-Smtp-Source: ABdhPJzXrVXCAGS9GPO8l0bGLYugwN6LO3dlONC84XDqaWPFkiid8/EFr/E//N2QyuTgCb+8AQHlbPdbDjKigCUs+JU=
X-Received: by 2002:a1c:1c3:: with SMTP id 186mr5075062wmb.39.1606234070787;
 Tue, 24 Nov 2020 08:07:50 -0800 (PST)
MIME-Version: 1.0
References: <20201123111919.233376-1-lee.jones@linaro.org>
 <20201123111919.233376-18-lee.jones@linaro.org>
In-Reply-To: <20201123111919.233376-18-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 Nov 2020 11:07:39 -0500
Message-ID: <CADnq5_MeeQ0tU1AGUSLf8kifm-AAhUER1eMcrkpWQi6dLPmDgg@mail.gmail.com>
Subject: Re: [PATCH 17/40] drm/amd/amdgpu/gfx_v6_0: Supply description for
 'gfx_v6_0_ring_test_ib()'s 'timeout' param
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
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMjMsIDIwMjAgYXQgNjoxOSBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92Nl8wLmM6MTkw
Mzogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAndGltZW91dCcgbm90IGRl
c2NyaWJlZCBpbiAnZ2Z4X3Y2XzBfcmluZ190ZXN0X2liJwo+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8
YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5p
ZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBTdW1pdCBTZW13
YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGxpbnV4
LW1lZGlhQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5v
cmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBw
bGllZC4gIFRoYW5rcyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dmeF92Nl8wLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y2XzAuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92Nl8wLmMKPiBpbmRleCA2NzFjNDZlYmVjZWQ5Li5j
YTc0NjM4ZGVjOWI3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dm
eF92Nl8wLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjZfMC5jCj4g
QEAgLTE4OTQsNiArMTg5NCw3IEBAIHN0YXRpYyB2b2lkIGdmeF92Nl8wX3JpbmdfZW1pdF9pYihz
dHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsCj4gICAqIGdmeF92Nl8wX3JpbmdfdGVzdF9pYiAtIGJh
c2ljIHJpbmcgSUIgdGVzdAo+ICAgKgo+ICAgKiBAcmluZzogYW1kZ3B1X3Jpbmcgc3RydWN0dXJl
IGhvbGRpbmcgcmluZyBpbmZvcm1hdGlvbgo+ICsgKiBAdGltZW91dDogdGltZW91dCB2YWx1ZSBp
biBqaWZmaWVzLCBvciBNQVhfU0NIRURVTEVfVElNRU9VVAo+ICAgKgo+ICAgKiBBbGxvY2F0ZSBh
biBJQiBhbmQgZXhlY3V0ZSBpdCBvbiB0aGUgZ2Z4IHJpbmcgKFNJKS4KPiAgICogUHJvdmlkZXMg
YSBiYXNpYyBnZnggcmluZyB0ZXN0IHRvIHZlcmlmeSB0aGF0IElCcyBhcmUgd29ya2luZy4KPiAt
LQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
