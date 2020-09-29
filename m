Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A27D27BB7D
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 05:24:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A10C89E35;
	Tue, 29 Sep 2020 03:24:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 394FA89E35
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 03:23:59 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id ay8so4698762edb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 20:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=u0EMbbTADWnRLrIoJnPFmlJr/sVquALTY1Xux029DAk=;
 b=e2ClqUTg8kP4Pghgfzso/16L53ecUf0/WTNk5XiW5IRm6gqpxFykVHu7n6pclWdWe/
 YnY6LKTtBRSBKi7rQ0EY8ULR9De4drkCFqoANx3kVdMZXR/JdjMRwilVxmUbMdfur6YB
 lNgtUicoXi1zaoVjkU4g1TFsNKSt9/eOSvYTn4Bsbkj5gSKAVf5MD0AEQXAUSWxwe4t8
 a2OtQkCeoxcqViJIUIBX/47rrQsWO3iXuPZPCKgMiD4HJpGQM4gHzzewb0eCMoTO4Y7t
 CyoZOCbOpJhIMxoRbL5lSrDORr48ilh4MrQ4wFniCtyb9i2uPYHVZ5z+PA8D59maRSPX
 eJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=u0EMbbTADWnRLrIoJnPFmlJr/sVquALTY1Xux029DAk=;
 b=FTUGbcmvmrxyZpqeyjxBA7oCKnVkIM6Ukm+uqh5Nm0GNZLwF1sh3+0QKgVGCP5egsH
 6K++M8YAzhJ3uPI0Jiw6qvXkhVC/hOsXKPMAybkGF7jYAEfNUqyvSExb8aBkJ1O16CSZ
 6QOCp29S4Pw1Wqi8+Taba/UlP1JWCLWo4JRaKDuNG6JDCe9DAjBjOdEmceig6rSam47V
 GFd9drVbPFZyojpi3lnBhu5vMEYO+v/PgIEwN9ffK8mcDKDbUQ/79mfbbZEEHSSrSg9I
 ahl+D6Jo/AmryEEhncPELSnhG45UGmQaxkVvdHwJHr3Ml5iA3vqzVBj3sDn+J7HY15C1
 fIlw==
X-Gm-Message-State: AOAM531Dgw9Cv9gUJKta3kW6zCHs4s34b53GxQPBeQjaCCWfTLwC6wsm
 w6OOG+Yjp+JNvZU1tPWfey44USo+QUykaBAaDQ0hTpcW
X-Google-Smtp-Source: ABdhPJyKFPbk7oQDWDziTxrVXFgHpjMc0My2Um6KnXoICkShmkbCJykz5EDRINHEUW4X2uk39bal4XZ8NNjQ1BH2P28=
X-Received: by 2002:a05:6402:1a48:: with SMTP id
 bf8mr1057999edb.298.1601349837662; 
 Mon, 28 Sep 2020 20:23:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200924051845.397177-1-airlied@gmail.com>
 <20200924051845.397177-31-airlied@gmail.com>
 <2608ea3c-5838-8fdb-59b6-d984d18f17d9@amd.com>
In-Reply-To: <2608ea3c-5838-8fdb-59b6-d984d18f17d9@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 29 Sep 2020 13:23:45 +1000
Message-ID: <CAPM=9tw=o8oFyZ-RWtB+ZqGd+b2fo_zxQ8Nj2Z-iXahxb2TUsQ@mail.gmail.com>
Subject: Re: [PATCH 30/45] drm/ttm: add a new invalidate notify callback.
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyNCBTZXAgMjAyMCBhdCAyMjoyNSwgQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEFtIDI0LjA5LjIwIHVtIDA3OjE4IHNjaHJpZWIg
RGF2ZSBBaXJsaWU6Cj4gPiBGcm9tOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+Cj4K
PiBOQUssIGNvbXBsZXRlbHkgdW5uZWNlc3NhcnkuCj4KPiBXZSBzaG91bGQgcmF0aGVyIGRvIHRo
ZSByZW1haW5pbmcgYWNjb3VudGluZyBpbiB0aGUgYWxyZWFkeSBleGlzdGluZwo+IHJlbGVhc2Vf
bm90aWZ5KCkgY2FsbGJhY2suCj4KPiBUaGF0IG1ha2VzIG11Y2ggbW9yZSBzZW5zZSBhbmQgaWYg
SSdtIG5vdCBjb21wbGV0ZWx5IG1pc3Rha2VuIGNvdWxkCj4gYWN0dWFsbHkgZml4IGEgYnVnIGlu
IGFtZGdwdS4KCnJlbGVhc2Vfbm90aWZ5IGlzIGNhbGxlZCBmcm9tIG9uZSBwYXRoLCBidXQgdGhl
cmUgaXMgYSBwYXRoIGluCmV2aWN0aW9uIHdoZXJlIGlmIGl0IGdldHMgcGFzcyAwIHBsYWNlbWVu
dHMKaXQgdGVhcnMgZG93biB0aGUgbWVtb3J5LCBhbmQgYWxsb2NhdGVzIGEgdHQuCgpJJ20gY29u
c2lkZXJpbmcgd2hldGhlciBpdCBzaG91bGQgYmUgYWNjZXB0YWJsZSB0byBjYWxsIGV2aWN0IHdp
dGggbm8KcGxhY2VtZW50cyAodGhvdWdoIG1heWJlIHRoYXQganVzdCBtZWFucyBldmljdCB0byBz
eXN0ZW0pLgoKRGF2ZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
