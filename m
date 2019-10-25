Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D738CE5467
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 21:33:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 442696EB6C;
	Fri, 25 Oct 2019 19:33:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB9B86EB6C;
 Fri, 25 Oct 2019 19:33:02 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id s1so3648603wro.0;
 Fri, 25 Oct 2019 12:33:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uj3oNCbFUUZSg5SH9RcrKbOYwaJ+AMwyoVWq4ZKhw90=;
 b=LL59S3jvU6b/M4wlEdBwpF0f937/axSGqo6EG1CBGtVcz8tGbKg2lLMzp7t2GH2jBi
 2uTDsfDy6chG7Ad4l3hvkftMiXIe7KLm0e/tVxb3apxeWsnBXRAo+doSjwBMe+gn9mr4
 Ztp6t8QNDYLVAfLritr3Wc0iUpV29Qnc/x1FfETNEc92norQskrtjCCUX0z8dSPMilmt
 ZMAn0M1qRk+PfYuAn0iWiGMF+jwKFCQGkJf7sxtMkGkvW0ZvPt6HTX5Ps0GsGmcgw4kK
 8FZeSbEr0am4a08UfxV+EM4pk8Z7s34vjlRjSOIlGeVrFGXHUGsrGL+/OMmebjE8eoLU
 G+DQ==
X-Gm-Message-State: APjAAAW7zeB8teAysZFM3MKZeTpBy9pqR2rGUjMC9ecyZQ20+K8bnMPc
 KGuZAvcHtiTtAVQYoEci42PPB/GSOl0y9Be2cIM=
X-Google-Smtp-Source: APXvYqyUNFhWEMvoMA8/aBmDOC8snwwEw3OnSJeXlmzAFKk6Aos8tJHIcV249WkqXX7cImJTsrdmhR2RpqHP0fc68gs=
X-Received: by 2002:adf:ed02:: with SMTP id a2mr4395705wro.11.1572031981013;
 Fri, 25 Oct 2019 12:33:01 -0700 (PDT)
MIME-Version: 1.0
References: <1571819543-15676-1-git-send-email-zhong.shiqi@zte.com.cn>
 <fa46cad1-8845-78b7-eb6a-45942813020b@amd.com>
In-Reply-To: <fa46cad1-8845-78b7-eb6a-45942813020b@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 25 Oct 2019 15:32:48 -0400
Message-ID: <CADnq5_Nv9j5vDX5-Jkhy3TTiej7FcKBBOC8QQk59NQ=SsO-3pg@mail.gmail.com>
Subject: Re: [PATCH] dc.c:use kzalloc without test
To: Harry Wentland <hwentlan@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=uj3oNCbFUUZSg5SH9RcrKbOYwaJ+AMwyoVWq4ZKhw90=;
 b=K5H+fdyPluzKTE2fCyVVhR5WeN36L/uxO6n26MyMEw4EOTRng/4EWSJIsg0msXuwT9
 mnnz5ptJvlXfKj96Gb4XbDUBuAnq1gZNbU2cVsl24SmNuhZA9NEkkIK8yPWFcH9vILpV
 8shfJNID/vovLSsRmuNK03xRjZFmh/Rcs47OOlVQphRQCVXwv72SxyN2j4HbLD5kLzSo
 KtRcYoMbf5kZvNXLLJ0LpyMI4P3OhslEbCEdkpetTizJ3qDUeDoT++4V3q5BS7s73chq
 qkkskcT3cpcy5yTB/gqPFMToWX+FDW6EEQuqPLKZiaVHvJFw1Wy3zrUryemOEULbC8AU
 P2cQ==
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Lei,
 Jun" <Jun.Lei@amd.com>, "Koo, Anthony" <Anthony.Koo@amd.com>,
 "David.Francis@amd.com" <David.Francis@amd.com>, "Liu,
 Wenjing" <Wenjing.Liu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "cheng.shengyu@zte.com.cn" <cheng.shengyu@zte.com.cn>,
 zhongshiqi <zhong.shiqi@zte.com.cn>,
 "wang.yi59@zte.com.cn" <wang.yi59@zte.com.cn>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 "Aidan.Wood@amd.com" <Aidan.Wood@amd.com>,
 "xue.zhihong@zte.com.cn" <xue.zhihong@zte.com.cn>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "Park, Chris" <Chris.Park@amd.com>,
 "Yang, Eric" <Eric.Yang2@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>, "Laktyushkin,
 Dmytro" <Dmytro.Laktyushkin@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIHRoYW5rcyEKCkFsZXgKCk9uIFdlZCwgT2N0IDIzLCAyMDE5IGF0IDk6MzUgQU0g
SGFycnkgV2VudGxhbmQgPGh3ZW50bGFuQGFtZC5jb20+IHdyb3RlOgo+Cj4gT24gMjAxOS0xMC0y
MyA0OjMyIGEubS4sIHpob25nc2hpcWkgd3JvdGU6Cj4gPiBkYy5jOjU4MzpudWxsIGNoZWNrIGlz
IG5lZWRlZCBhZnRlciB1c2luZyBremFsbG9jIGZ1bmN0aW9uCj4gPgo+ID4gU2lnbmVkLW9mZi1i
eTogemhvbmdzaGlxaSA8emhvbmcuc2hpcWlAenRlLmNvbS5jbj4KPgo+IFJldmlld2VkLWJ5OiBI
YXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KPgo+IEhhcnJ5Cj4KPiA+IC0t
LQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgfCA0ICsrKysK
PiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jCj4gPiBpbmRleCA1ZDFhZGVkLi40Yjg4MTljIDEw
MDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYwo+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYwo+ID4gQEAg
LTU4MCw2ICs1ODAsMTAgQEAgc3RhdGljIGJvb2wgY29uc3RydWN0KHN0cnVjdCBkYyAqZGMsCj4g
PiAgI2lmZGVmIENPTkZJR19EUk1fQU1EX0RDX0RDTjJfMAo+ID4gICAgICAgLy8gQWxsb2NhdGUg
bWVtb3J5IGZvciB0aGUgdm1faGVscGVyCj4gPiAgICAgICBkYy0+dm1faGVscGVyID0ga3phbGxv
YyhzaXplb2Yoc3RydWN0IHZtX2hlbHBlciksIEdGUF9LRVJORUwpOwo+ID4gKyAgICAgaWYgKCFk
Yy0+dm1faGVscGVyKSB7Cj4gPiArICAgICAgICAgICAgIGRtX2Vycm9yKCIlczogZmFpbGVkIHRv
IGNyZWF0ZSBkYy0+dm1faGVscGVyXG4iLCBfX2Z1bmNfXyk7Cj4gPiArICAgICAgICAgICAgIGdv
dG8gZmFpbDsKPiA+ICsgICAgIH0KPiA+Cj4gPiAgI2VuZGlmCj4gPiAgICAgICBtZW1jcHkoJmRj
LT5iYl9vdmVycmlkZXMsICZpbml0X3BhcmFtcy0+YmJfb3ZlcnJpZGVzLCBzaXplb2YoZGMtPmJi
X292ZXJyaWRlcykpOwo+ID4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
