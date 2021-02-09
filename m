Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 139C2315563
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 18:51:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063CE6EB89;
	Tue,  9 Feb 2021 17:51:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC7666EB89
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 17:51:43 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id j19so9386643lfr.12
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Feb 2021 09:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lPHiyshAYwDQMHuL6XjRLdFg31CtAL5tyF9gpmIlpuY=;
 b=HJ5GboupBRdvDYdE3+c+BbR5L/+b2RNlFkvzE9cvoL6wUi5kai3keCUCA7nryHiCd9
 KZ3EkSj8HtcF5NHOacJ2DKgRbJq7+2M2OkSkGrKJZ1QfDuumWkiM3g/4k2dCJKJwKSa5
 6wTjChskPuNHFsigYkPnA1oqTgJysg4meINj2mKinshoP6WLM8uhnsSlEReEmV/goHKq
 +PA2MVXgPDi77Br/AHMo2t9XdIQaZ/R4zYEYcjcjrTWHaJakWPlCa0sRm5a9pKAkO8rE
 g+xankyDbezGdQby6sGXMuEhWWxnBLn6k0/eCMRPS1k2QJ3Lfp+whhovYPf58UBCPywU
 YZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lPHiyshAYwDQMHuL6XjRLdFg31CtAL5tyF9gpmIlpuY=;
 b=nebT1eC5IIrGegVyj8uUUPLytmC+NEkNWjqhdjQe/NHvXIZhQxUlqKAPkDGuHCd0An
 7JAKVLhyG0kUO8uFh7wAZUxkDXMZDgaEy5koHCPaMX1abl9rrF1xa0MvxYcuaBdsZmRy
 Qo5lgxajGnSZsgYLwCpck/a14MCQCItXKJWZ+Ib1pJ8VB/btRQtcvfcON1TWLyV7SPJP
 uTgv5aP7UBA/dDUgvGj0+3C5HidG1rNMFH+BU0s9lJOU+bjumsEMgKbzVkJIrHmAAEu4
 r/7Da5+9Ke9mE6ObbpZqNjHZdNLVWE6dtGAHUYxzFuLdKUFw/wPuTc5jxauO334K80Z8
 WEYw==
X-Gm-Message-State: AOAM530udbK1rK9AkOHeAvyScMUzl3Y+nsSLggOx3tWUiKUrZ6UjCfCk
 v96C9xGqZcyuvnfvZaNE7CjoWYhOAmmGV5P71z1RRA==
X-Google-Smtp-Source: ABdhPJyNwqJrbPEm56X5Fd4wgWqY/yJveLKo+1aKW+tRmsIXUbv7TTBoyddE0ravmqPusmp1ermnDhlEtsPwsnQQS8w=
X-Received: by 2002:ac2:5590:: with SMTP id v16mr13571451lfg.626.1612893094231; 
 Tue, 09 Feb 2021 09:51:34 -0800 (PST)
MIME-Version: 1.0
References: <20210205080621.3102035-1-john.stultz@linaro.org>
 <20210205080621.3102035-2-john.stultz@linaro.org>
 <4471b3b0-603e-6dbb-8064-ff4a95afbba9@amd.com>
 <CALAqxLWZkUFvJX5r2OU2erW4tU3j=+u==VTyzYkt+95LwwVCUA@mail.gmail.com>
 <48225879-2fe1-22ac-daae-c61d52465aea@amd.com>
In-Reply-To: <48225879-2fe1-22ac-daae-c61d52465aea@amd.com>
From: John Stultz <john.stultz@linaro.org>
Date: Tue, 9 Feb 2021 09:51:19 -0800
Message-ID: <CALAqxLVDY6HkTZpXtJ1+V9E-shgtxXn4A5MB5nAaCbwr8AQV6g@mail.gmail.com>
Subject: Re: [RFC][PATCH v6 1/7] drm: Add a sharable drm page-pool
 implementation
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Sandeep Patil <sspatil@google.com>, Ezequiel Garcia <ezequiel@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, James Jones <jajones@nvidia.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Laura Abbott <labbott@kernel.org>, Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
 linux-media <linux-media@vger.kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBGZWIgOSwgMjAyMSBhdCA0OjExIEFNIENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4KPgo+Cj4gQW0gMDUuMDIuMjEgdW0gMjE6NDYgc2No
cmllYiBKb2huIFN0dWx0ejoKPiA+IE9uIEZyaSwgRmViIDUsIDIwMjEgYXQgMTI6NDcgQU0gQ2hy
aXN0aWFuIEvDtm5pZwo+ID4gPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4gPj4g
QW0gMDUuMDIuMjEgdW0gMDk6MDYgc2NocmllYiBKb2huIFN0dWx0ejoKPiA+Pj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9wYWdlX3Bvb2wuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYWdlX3Bv
b2wuYwo+ID4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4+PiBpbmRleCAwMDAwMDAwMDAwMDAu
LjIxMzlmODZlNmNhNwo+ID4+PiAtLS0gL2Rldi9udWxsCj4gPj4+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9wYWdlX3Bvb2wuYwo+ID4+PiBAQCAtMCwwICsxLDIyMCBAQAo+ID4+PiArLy8gU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiA+PiBQbGVhc2UgdXNlIGEgQlNEL01JVCBjb21w
YXRpYmxlIGxpY2Vuc2UgaWYgeW91IHdhbnQgdG8gY29weSB0aGlzIGZyb20KPiA+PiB0aGUgVFRN
IGNvZGUuCj4gPiBIcm0uIFRoaXMgbWF5IGJlIHByb2JsZW1hdGljLCBhcyBpdCdzIG5vdCBqdXN0
IFRUTSBjb2RlLCBidXQgc29tZSBvZgo+ID4gdGhlIFRUTSBsb2dpYyBpbnRlZ3JhdGVkIGludG8g
YSBwYWdlLXBvb2wgaW1wbGVtZW50YXRpb24gSSB3cm90ZSBiYXNlZAo+ID4gb24gbG9naWMgZnJv
bSB0aGUgSU9OIGNvZGUgKHdoaWNoIHdhcyBHUEwtMi4wIGJlZm9yZSBpdCB3YXMgZHJvcHBlZCku
Cj4gPiBTbyBJIGRvbid0IHRoaW5rIEkgY2FuIGp1c3QgbWFrZSBpdCBNSVQuICBBbnkgZXh0cmEg
Y29udGV4dCBvbiB0aGUKPiA+IG5lZWQgZm9yIE1JVCwgb3Igc3VnZ2VzdGlvbnMgb24gaG93IHRv
IGJlc3QgcmVzb2x2ZSB0aGlzPwo+Cj4gTW9zdCBvZiB0aGUgRFJNL1RUTSBjb2RlIGlzIGFsc28g
bGljZW5zZSBhYmxlIHVuZGVyIHRoZSBCU0QvTUlUIHN0eWxlCj4gbGljZW5zZSBzaW5jZSB3ZSB3
YW50IHRvIGVuYWJsZSB0aGUgQlNEIGd1eXMgdG8gcG9ydCBpdCBvdmVyIGFzIHdlbGwuCj4KPiBX
aGF0IHN0dWZmIGRvIHlvdSBuZWVkIGZyb20gdGhlIElPTiBjb2RlIHRoYXQgeW91IGNhbid0IGp1
c3QgY29kZQo+IHlvdXJzZWxmPyBBcyBmYXIgYXMgSSBoYXZlIHNlZW4gdGhpcyBpcyBsaWtlIDk5
JSBjb2RlIGZyb20gdGhlIFRUTSBwb29sLgoKWWVhLCBpdCBldm9sdmVkIGludG8gYmVpbmcgbW9z
dGx5IGxvZ2ljIGZyb20gdGhlIFRUTSBwb29sIChvciBjb2RlCnRoYXQgd2FzIHZlcnkgc2ltaWxh
ciB0byBiZWdpbiB3aXRoKSwgYnV0IGl0J3Mgbm90IHdoZXJlIGl0IHN0YXJ0ZWQuCk15IG9sZCBk
YXlzIGF0IElCTSBtYWtlcyBtZSB3YXJ5IG9mIGNsYWltaW5nIGl0J3Mgbm8gbG9uZ2VyIHRoZSBT
aGlwCm9mIFRoZXNldXMuCgpTbyBpbnN0ZWFkIEkgdGhpbmsgSSdsbCBoYXZlIHRvIGp1c3QgdGhy
b3cgb3V0IG15IHBhdGNoIGFuZCByZXdyaXRlIGl0CmluIGZ1bGwgKHNvIGFwb2xvZ2llcyBpbiBh
ZHZhbmNlIGZvciBhbnkgcmV2aWV3IGlzc3VlcyBJCmludHJvZHVjZS9yZWludHJvZHVjZSkuCgp0
aGFua3MKLWpvaG4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
