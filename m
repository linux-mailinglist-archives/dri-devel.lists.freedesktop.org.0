Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B85D1BF9F6
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 21:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01536EDF1;
	Thu, 26 Sep 2019 19:19:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFAF56EDF1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 19:19:34 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id l21so73635lje.4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 12:19:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GiZ5XkiSe0GQ+VPxuAaFzoJ9mvYMh1MShnjH8fQ9hAI=;
 b=G7+mrRWb+kN9nlXxDjLdHA9APTMxUbeR1QHTv3tVksEeC2vJLG2Nf8hAzmfi3zK69H
 6arDY24SEVK7l0DQgMnjwvR9TXQXU8xBuvHwxOBNnpp8Z7JwqN/1O7mh17iqIitQVmHQ
 4CP99K0B/fl0HWrFJWA9AmZS+Fsvi6490zTK3C9GCCHWKoqcX/DLCAs91ZhVRHOPQ9tz
 20fAPmMxX2vc2sVbujwtkOaM34a+/dEsQm04RREKS7csLXunw1/WHYy9WVlC8uHff00C
 4hJq504W/gnNRvydRivigzFf59Rm/evupnZXOcOTWu0yQpiM6DN/GF1F7FdR2UfJ2caa
 A4Vg==
X-Gm-Message-State: APjAAAXxqmHiJqO2D/euwuBEiajwyuzGVp21WOMzQdReYPlpvRj4UClF
 YglEuIjmo6+tVDzl7p56zNaOb5erkmo=
X-Google-Smtp-Source: APXvYqyA3DHdMmjO654CmmQGGSOqTSf9IuiIEYhOQAp7R1ZG+DYbD5ey/l3Rxij5CtE2agtWGNfWXg==
X-Received: by 2002:a2e:9f12:: with SMTP id u18mr171930ljk.23.1569525572349;
 Thu, 26 Sep 2019 12:19:32 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
 [209.85.167.46])
 by smtp.gmail.com with ESMTPSA id h2sm16253ljb.11.2019.09.26.12.19.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Sep 2019 12:19:31 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id r2so37777lfn.8
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 12:19:31 -0700 (PDT)
X-Received: by 2002:ac2:5c11:: with SMTP id r17mr90953lfp.61.1569525570797;
 Thu, 26 Sep 2019 12:19:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190926115548.44000-1-thomas_os@shipmail.org>
 <20190926115548.44000-2-thomas_os@shipmail.org>
 <85e31bcf-d3c8-2fcf-e659-2c9f82ebedc7@shipmail.org>
In-Reply-To: <85e31bcf-d3c8-2fcf-e659-2c9f82ebedc7@shipmail.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 26 Sep 2019 12:19:14 -0700
X-Gmail-Original-Message-ID: <CAHk-=wifjLeeMEtMPytiMAKiWkqPorjf1P4PbB3dj17Y3Jcqag@mail.gmail.com>
Message-ID: <CAHk-=wifjLeeMEtMPytiMAKiWkqPorjf1P4PbB3dj17Y3Jcqag@mail.gmail.com>
Subject: Re: Ack to merge through DRM? WAS Re: [PATCH v2 1/5] mm: Add
 write-protect and clean utilities for address space ranges
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28VMware=29?= <thomas_os@shipmail.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GiZ5XkiSe0GQ+VPxuAaFzoJ9mvYMh1MShnjH8fQ9hAI=;
 b=c9mTnqktidPTMYUOmMWXZMF1goG76CXiNifuKVesxB5dObJ0alKuAuZtRHPM7MTsE3
 PfSbj8B+f1Tckr50tkYnebK6E1998jFhRJ+aDRYwluwmX3Z6mrcbu3NYDRsUsD6t5cuy
 HEUQ+3kqxJ3QeSCrC5XOLkh1HS3nztUHhL2AQ=
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
Cc: Linux-MM <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgNTowMyBBTSBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJl
KQo8dGhvbWFzX29zQHNoaXBtYWlsLm9yZz4gd3JvdGU6Cj4KPiBJIHdvbmRlciBpZiBJIGNhbiBn
ZXQgYW4gYWNrIGZyb20gYW4gbW0gbWFpbnRhaW5lciB0byBtZXJnZSB0aGlzIHRocm91Z2gKPiBE
Uk0gYWxvbmcgd2l0aCB0aGUgdm13Z2Z4IHBhdGNoZXM/IEFuZHJldz8gTWF0dGhldz8KCkl0IHdv
dWxkIGhhdmUgaGVscGVkIHRvIGFjdHVhbGx5IHBvaW50IHRvIHRoZSBwYXRjaCBpdHNlbGYsIGlu
c3RlYWQgb2YKanVzdCBxdW90aW5nIHRoZSBjb21taXQgbWVzc2FnZS4KCkxvb2tzIGxpa2UgdGhp
czoKCiAgICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDE5MDkyNjExNTU0OC40NDAw
MC0yLXRob21hc19vc0BzaGlwbWFpbC5vcmcvCgpidXQgd2h5IGlzIHRoZSBjb2RlIGluIHF1ZXN0
aW9uIG5vdCBqdXN0IHVzaW5nIHRoZSByZWd1bGFyIHBhZ2UKd2Fsa2Vycy4gVGhlIGNvbW1pdCBs
b2cgc2hvd3Mgbm8gZXhwbGFuYXRpb24gb2Ygd2hhdCdzIHNvIHNwZWNpYWwKYWJvdXQgdGhpcz8K
CklzIHRoZSBvbmx5IHJlYXNvbiB0aGUgbG9ja2luZyBtYWdpYz8gQmVjYXVzZSBpZiB0aGF0J3Mg
dGhlIHJlYXNvbiwKdGhlbiBhZmFpayB3ZSBhbHJlYWR5IGhhdmUgYSBmdW5jdGlvbiBmb3IgdGhh
dDogaXQncwpfX3dhbGtfcGFnZV9yYW5nZSgpLgoKWWVzLCBpdCdzIHN0YXRpYyByaWdodCBub3cs
IGJ1dCB0aGF0J3MgaW1obyBub3QgYSByZWFzb24gdG8gZHVwbGljYXRlCmFsbCB0aGUgd2Fsa2lu
ZyAoYmFkbHkpLgoKSXMgdGhlcmUgc29tZSBvdGhlciBtYWdpYyByZWFzb24gdGhhdCBpc24ndCBk
b2N1bWVudGVkPwoKICAgICAgICAgICAgICBMaW51cwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
