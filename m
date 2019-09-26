Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0659BFAF6
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 23:36:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A4B6EE0E;
	Thu, 26 Sep 2019 21:36:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A92E6EE0E
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 21:36:47 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id w12so406898wro.5
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 14:36:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lbOjI3QEo1UkS5Gm752mqz5KqkL+oFqcUVJsgpwWPIs=;
 b=piyyuDRIHhO+q49psX3SH4TdsF4y1OKzuXLOhR66Lkcluh13Q4SH2Yza3qztHH7Iy+
 rfSWb1bBufrDIUw8gwd6c576oNpO2hzm9WCV650QjOluw2trcrPwje3NtzzMdIqBKCGD
 9EYhB/fDc7ACIVXYzBbfvnJim262BpxPQNZnWMHha4Tb7YlKhJ59LB22eeFC4D5rcQFu
 75laMQkMs0/sM8WlzMgdZdC4LR3EJ2xHDLG+1TY9HBPdKMG0CXk5FENRIn6kp+ewRj3e
 5pFe7CsfiyEjA/5Iy0f91BNVzDV+NV6f6k1KijnTMnLskT3c3IUQYxSwaqfGuW+I0Ptj
 iW2A==
X-Gm-Message-State: APjAAAUuyqXjd7GpmEp/rZKy2sNlCjgqFiIn7S8wQ126+AaD9lmnijbt
 EeG3ty6n4EqXhllJLRzVS1bim5i33wre8Cj+TLDrSw==
X-Google-Smtp-Source: APXvYqx+S0S8FK4WODmrazo7hHoctrPBtnbKLzmCRlB57lCTYzMeWByT+FaEYCdKafIkx9fZA+jFS9rqhCNyWHEriLk=
X-Received: by 2002:adf:d08b:: with SMTP id y11mr422072wrh.50.1569533805890;
 Thu, 26 Sep 2019 14:36:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190906184712.91980-1-john.stultz@linaro.org>
 <20190906184712.91980-6-john.stultz@linaro.org>
 <20190923221150.lolc72yvuyazqhr6@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20190923221150.lolc72yvuyazqhr6@DESKTOP-E1NTVVP.localdomain>
From: John Stultz <john.stultz@linaro.org>
Date: Thu, 26 Sep 2019 14:36:33 -0700
Message-ID: <CALAqxLWyNiaf_Fxa76t9nA9Ea++O1Tcisq_XpH9e1yZJP1YujA@mail.gmail.com>
Subject: Re: [RESEND][PATCH v8 5/5] kselftests: Add dma-heap test
To: Brian Starkey <Brian.Starkey@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=lbOjI3QEo1UkS5Gm752mqz5KqkL+oFqcUVJsgpwWPIs=;
 b=EdYMGU10Cfw2SuLaKt7IIod5noFPJTb9tXuH4/RPCTrjrVfRZ0MuYUMTY3SgBBqZFF
 uNAvxmQiq40XOWa2ajevHqFnBWo0jbDn/q26VzbvE21lzoeXCzKqGcRHZzplsrMZtBMg
 FICE4igHLeT8zpMOrYlaYVX51vd5jjO520vDz8kaOayPAOlY+q6MS6c1B/9UdCmeBaK1
 Lzk+u4GOgddrXF+KBjcZ0EHUp9FJV2DjsvDWlIPQYvR0lwkIcZ0zQdOy4GAOEbULPRsX
 R2cK+iUXDY777YvgwHkyPp1PrvrNZ9okQTt0Cs2cUjbWAUJXAoRY6BTFzcdTSK8GQBe4
 0LFQ==
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
Cc: nd <nd@arm.com>, Alistair Strachan <astrachan@google.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F . Davis" <afd@ti.com>, Christoph Hellwig <hch@infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMzoxMiBQTSBCcmlhbiBTdGFya2V5IDxCcmlhbi5TdGFy
a2V5QGFybS5jb20+IHdyb3RlOgo+Cj4gSSBkaWRuJ3Qgc2VlIGFueSByZXNwb25zZSBhYm91dCB1
c2luZyB0aGUgdGVzdCBoYXJuZXNzLiBEaWQgeW91IGRlY2lkZQo+IGFnYWluc3QgaXQ/CgpIZXkh
IFNwZW50IGEgbGl0dGxlIHRpbWUgbG9va2luZyBhdCB0aGlzIGJpdCBhbmQganVzdCB3YW50ZWQg
dG8gcmVwbHkKdG8gdGhpcyBwb2ludC4gIFNvIGZpcnN0LCBhcG9sb2dpZXMsIEkgdGhpbmsgSSBt
aXNzZWQgdGhlIHN1Z2dlc3Rpb24KZWFybGllci4gVGhhdCBzYWlkLCBub3cgdGhhdCBJJ3ZlIGxv
b2tlZCBhIGxpdHRsZSBiaXQgYXQgdGhlIHRlc3QKaGFybmVzcywgYW5kIGF0IGxlYXN0IGF0IHRo
aXMgcG9pbnQgaXQgZmVlbHMgbGlrZSBpdCBtYWtlcyBpdCBoYXJkZXIKdG8gcmVhc29uIHdpdGgg
dGhhbiBzdGFuZGFyZCBjIGNvZGUuICBNYXliZSBJIG5lZWQgdG8gc3BlbmQgYSBiaXQgbW9yZQp0
aW1lIG9uIGl0LCBidXQgSSdtIGEgbGl0dGxlIGhlc2l0YW50IHRvIHN3YXAgb3ZlciBqdXN0IHll
dC4KCkknbSBub3QgcGFydGljdWxhcmx5IHBhc3Npb25hdGUgb24gdGhpcyBwb2ludCwgYnV0IGFy
ZSB5b3U/ICBPciB3YXMKdGhpcyBqdXN0IGEgcmVjb21tZW5kYXRpb24gdG8gY2hlY2sgaXQgb3V0
IGFuZCBjb25zaWRlciBpdD8KCnRoYW5rcwotam9obgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
