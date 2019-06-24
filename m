Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB76951D1B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 23:29:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D1B89E01;
	Mon, 24 Jun 2019 21:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD90589E01
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 21:29:07 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id n4so15384368wrw.13
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 14:29:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UshnmruX/GvjwwpUb3HWyw8lOWXF2mnBtcpXLClsOZg=;
 b=XCKOtDDDEV54IdX9P8uTD4mWap39yXbiXwh0Mk8WYyTANszgWgmS8v8GAmjbdK7/nf
 mWxmpF5RKxFImhHDz2ud9xwRHERwhsBGBLQZ4k71V/rQ2V0EWT3nriKxHwUc/YCY5Mwj
 pZmuDmZ9t0c1aOKlUEARknmAEeVjPjavYy6BrLQw6BkzScsDeIzNGd4OpTT5wiQHh0St
 pyJVCn5FkKsAhGGDlqad/I1HOmX8B5twZru16zQyaAOMN6WxKL9MvrLNsNJ08k1P1NJE
 H/GrUMH5bBDv4sqaVXC+vBp9aU1pC3Rxj5LZch7h7FW7AqNzRT+WbGKkEvJdlvHR4Y1J
 xYvg==
X-Gm-Message-State: APjAAAU/skLfW9pm8kC4dcy7AqmnX5AQsAOBzUEwRIQ/BfS7kErD/Xlk
 +mZXIFWi+tzahKlDvPiKhWArPsdLEPkRuLqm4k9vhQ==
X-Google-Smtp-Source: APXvYqw/vxP516FTft+ZJC1ur821zQNhnaNdVvePfXReAB113aASTqmArJXDsKoOeyqSNq492jmm6uWXcjnuPvWoj04=
X-Received: by 2002:a05:6000:c9:: with SMTP id
 q9mr5524702wrx.208.1561411746306; 
 Mon, 24 Jun 2019 14:29:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190624202735.125139-1-john.stultz@linaro.org>
 <CAKb7Uvg2OSsTBCWTRKFrr0VQ4L_d+p55Qh6+QiRv-DKtJvzCdw@mail.gmail.com>
In-Reply-To: <CAKb7Uvg2OSsTBCWTRKFrr0VQ4L_d+p55Qh6+QiRv-DKtJvzCdw@mail.gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 24 Jun 2019 14:28:54 -0700
Message-ID: <CALAqxLX1H69NCqRoQ2A6ZWJ=nB=bMEPXjLCUNvzdRBEzP7Stvw@mail.gmail.com>
Subject: Re: [PATCH v2] libdrm: modetest: Allow selecting modes by index
To: Ilia Mirkin <imirkin@alum.mit.edu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=UshnmruX/GvjwwpUb3HWyw8lOWXF2mnBtcpXLClsOZg=;
 b=aYNEqrQSP+darFaSFL8khI+d3rVN14LpkkCaFsH2+l9DmSke+rE+RsrWNTxS4UnOjf
 SDMjFngYakP/3Ys8r6GWnyGdtlv2VvnOGuzJ9Jf3XJz68rJTngpVo9Q4g6iMbcPbgSEi
 mZ3kfYUuDHkMiHC2zeA9wq40+sg51fKbhxojnD6Bp1IwUKJ/GAU3S1r2YfUYx9lxz0fq
 Ja60HX+fpcXJTMQ/CoV8PRT0YmQsK6/m9MzHFaNS1ot3Ooytz5GtaUMAhtWj27nC+VkO
 exPT/wBfdaSImGAhF2xQZmth2/VjDfuqG+lzuav7WZWxh/JV5cim6SFNN7kN+upI0fTb
 MudQ==
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
Cc: Rob Clark <robdclark@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMTozMiBQTSBJbGlhIE1pcmtpbiA8aW1pcmtpbkBhbHVt
Lm1pdC5lZHU+IHdyb3RlOgo+Cj4gUmV2aWV3ZWQtYnk6IElsaWEgTWlya2luIDxpbWlya2luQGFs
dW0ubWl0LmVkdT4KPgo+IE9uZSBtaW5vciBjb21tZW50IGJlbG93IHRob3VnaDoKPgo+IChNYXli
ZSBsZXQgaXQgc2l0IG9uIHRoZSBsaXN0IGZvciBhIGRheSBpbiBjYXNlIGFueW9uZSBmZWVscyBs
aWtlCj4gb2JqZWN0aW5nIHN0cmVudW91c2x5LikKClRoYW5rcyBzbyBtdWNoIGZvciB0aGUgcmV2
aWV3IQoKPiA+IEBAIC04MjksNiArODMwLDE2IEBAIGNvbm5lY3Rvcl9maW5kX21vZGUoc3RydWN0
IGRldmljZSAqZGV2LCB1aW50MzJfdCBjb25faWQsIGNvbnN0IGNoYXIgKm1vZGVfc3RyLAo+ID4g
ICAgICAgICBpZiAoIWNvbm5lY3RvciB8fCAhY29ubmVjdG9yLT5jb3VudF9tb2RlcykKPiA+ICAg
ICAgICAgICAgICAgICByZXR1cm4gTlVMTDsKPiA+Cj4gPiArICAgICAgIC8qIFBpY2sgYnkgSW5k
ZXggKi8KPiA+ICsgICAgICAgaWYgKG1vZGVfc3RyWzBdID09ICcjJykgewo+ID4gKyAgICAgICAg
ICAgICAgIGludCBpbmRleCA9IGF0b2kobW9kZV9zdHIgKyAxKTsKPiA+ICsKPiA+ICsgICAgICAg
ICAgICAgICBpZiAoaW5kZXggPj0gY29ubmVjdG9yLT5jb3VudF9tb2RlcykKPgo+IHx8IGluZGV4
IDwgMAoKT2ssIGFkZGVkIHRoaXMgYml0IGluIG15IHRyZWUuIEknbGwgcmVzdWJtaXQgaW4gYSBm
ZXcgZGF5cyB0byBsZXQKb3RoZXJzIGhhdmUgYSBjaGFuY2UgdG8gcmV2aWV3IGFzIHdlbGwuCgp0
aGFua3MKLWpvaG4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
