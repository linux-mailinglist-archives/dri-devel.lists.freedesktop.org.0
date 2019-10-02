Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 943DFC8E08
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 18:14:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 361E589BF5;
	Wed,  2 Oct 2019 16:14:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E302C89B96
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 16:14:55 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a6so7820756wma.5
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2019 09:14:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AF6ICp5pMJTO5IIGLISprcfM72Z5T4FMqcpypJNCaW8=;
 b=Jh+VMHKfz2DSlhwO2g9EPmdb/oCNDHlnV7utrNcvHvbgKEnQA3HxHEYynLOPzs81eY
 oTuSquNid/iAohdpzMlKtFjNNkynOYAladeohI/nL9kQGEq7r7F2OmzOhsAi0j/fzA5F
 I7Gsq1ImW5LWc2BMftovK8JT+ubUzPg2Gg0A1AFfHUOYHPsLawXPB4taXIz5oAlte5Ws
 euQiz5z64h4Cr+9axhpfh8iq+SxEk9plm9Y/JEA3pLjEO99qF4aO4+Jq+eUSJxWFAWhe
 SsY+qoz1kJ5G4hHsrjM9dIhIEPnKRlexryNzFjjT4k6VwRaDMqjvPQTicEqoeqK+VVq0
 odtg==
X-Gm-Message-State: APjAAAUIBF6eu3a5pjs5UZGkdzEdYUm1NPeDNbYAmmNB807Cgvtmz+yK
 +9rnLVfOKncbGCjZb+58hRNH6zxwnNXPIZ7ZSOo0iA==
X-Google-Smtp-Source: APXvYqxj14UP2YosV0Wb9Qqfsm6keLBgOUgzLZ1CEYsSBNjwnQ4/nWKR4BKVux6nywu0axAH/0eaNnBX6u+8JOsm8n4=
X-Received: by 2002:a1c:c189:: with SMTP id r131mr3614749wmf.153.1570032894414; 
 Wed, 02 Oct 2019 09:14:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190906184712.91980-1-john.stultz@linaro.org>
 <20190930032651.8264-1-hdanton@sina.com>
In-Reply-To: <20190930032651.8264-1-hdanton@sina.com>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 2 Oct 2019 09:14:42 -0700
Message-ID: <CALAqxLUXKYibt6e4ji=kpP4ROFkU_4YQZoAE-ciq2bnFJxM_PA@mail.gmail.com>
Subject: Re: [RESEND][PATCH v8 1/5] dma-buf: Add dma-buf heaps framework
To: Hillf Danton <hdanton@sina.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=AF6ICp5pMJTO5IIGLISprcfM72Z5T4FMqcpypJNCaW8=;
 b=Pj82qvCr7yhwECurupIzOoiaPefmUaVaC77k5jM4n7NCxzRScPppT9N1NBsdU/0Bdc
 STDIX+l5ImCzPn+UzMQW61dxl2ckrirh0K/Fws6uPFz0F6d35CCynDjpwknaa3Wtvbgv
 PufiV13RcwmUCc97d76tTngXyMP0qoZyBT9Odk5R77qCB97i7IgJcm2Lk0BGbCumFZYJ
 0ThNeAlzrPoMASS7xtr4Q5ifJUprzKxzvFuXD2I6TB1p0c20DKAlYQnpKoa95pwlfuKW
 gEq7T75KwQ1dh/Nicx5ICfGYEykJvJlRQZZeV8agAbJpBZIpbA0sLa8GUWp9QdJ1URfn
 qxrg==
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
Cc: Sudipto Paul <Sudipto.Paul@arm.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F . Davis" <afd@ti.com>, Christoph Hellwig <hch@infradead.org>,
 Alistair Strachan <astrachan@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBTZXAgMjksIDIwMTkgYXQgODoyNyBQTSBIaWxsZiBEYW50b24gPGhkYW50b25Ac2lu
YS5jb20+IHdyb3RlOgo+IE9uIEZyaSwgIDYgU2VwIDIwMTkgMTg6NDc6MDggKzAwMDAgSm9obiBT
dHVsdHogd3JvdGU6Cj4gPiArLyoqCj4gPiArICogZG1hX2hlYXBfZ2V0X2RhdGEoKSAtIGdldCBw
ZXItaGVhcCBkcml2ZXIgZGF0YQo+ID4gKyAqIEBoZWFwOiBETUEtSGVhcCB0byByZXRyaWV2ZSBw
cml2YXRlIGRhdGEgZm9yCj4gPiArICoKPiA+ICsgKiBSZXR1cm5zOgo+ID4gKyAqIFRoZSBwZXIt
aGVhcCBkYXRhIGZvciB0aGUgaGVhcC4KPiA+ICsgKi8KPiA+ICt2b2lkICpkbWFfaGVhcF9nZXRf
ZGF0YShzdHJ1Y3QgZG1hX2hlYXAgKmhlYXApOwo+ID4gKwo+Cj4gSXQgd2lsbCBoZWxwIHJlYWRl
cnMgbW9yZSB0aGFuIHRob3VnaHQgdW5kZXJzdGFuZCB0aGlzIGZyYW1ld29yawo+IGlmIHMvZ2V0
X2RhdGEvZ2V0X2RydmRhdGEvCgpTb3VuZHMgZ29vZCEKClRoYW5rcyBmb3IgdGhlIHJldmlldyBh
bmQgc3VnZ2VzdGlvbiEKLWpvaG4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
