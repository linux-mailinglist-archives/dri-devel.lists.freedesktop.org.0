Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C49C32C7C41
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 02:03:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB8866E400;
	Mon, 30 Nov 2020 01:03:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 496CE6EEA3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 18:45:57 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id i2so6559903wrs.4
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 10:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dSpeTF5dkf6JO4oSmSVL/Gz5HzjVWXT8QGTspkUmOkI=;
 b=G7EdtkLfVBJcJuQcWz2HUWQ1trPaUW05ND72IDep0c/khHO76cq2cZUJaIZf2mVRNh
 qOeB8DcZmpVj2v8zvvXE70NunVIaBf5nUdbWwJDBUVT4pM0Zw4GlMJfQZdJkPQ6if3iB
 GFYyaAaSqXCCmRbVSyh8Vm/bdCDPJB1tXihqK7Y5i+a9dy08P4zMJ9hNVTNFHo0n+4sy
 7jUOI3bfn8Mv4ScPXHv3pD9enWq4rOSbo2Lz8Vn4iJmenxQt+AvD0FG5+z6Tv4BbeEQN
 rMgeO0vWw/CKspUlb9TkZVcz5Yp39VjY4TvKNVqHaDfEKHkrBI9kSOWB2RV/ejAekJvH
 k55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dSpeTF5dkf6JO4oSmSVL/Gz5HzjVWXT8QGTspkUmOkI=;
 b=EH8I18kysRE+riR/mg6P9pqJ06+M+N2RIPz5jHTmae1QM3fTS2pxXHjsOC70z9Mr2G
 m+oFdtWUwvN2sEsioOvnge4M3O3pjZe1LMwvMA7OOpw0evZg6vDpNu8f0T5+Ku6McZh4
 lr3KgDejugJ6DqeVnWKrtyOaaUgO7m/OGb8cQLWHR3kBkyTUJogoDsfo1XzQSmKZdU1Y
 +xyjItE6SxKxO0y3x+lfjVpJ54r7XnedvJJCAHAm2PBs7oA907O85Z2/EOberyDN5DaQ
 xLx9JRjNXvnNJG1Nt+p7Ip6bgNEy1PD+JeEHSK2zU8HplH9UoUhr8/cNTSr4JL+LG8Lj
 jPxw==
X-Gm-Message-State: AOAM530tqNcBFT40G+OrNrmFVNSh6nr+LLSk59zEB+MnGEmHk9X20HZb
 3kJiyx7ZYX30LYLk35dQ5AbmbyEvTIA=
X-Google-Smtp-Source: ABdhPJyq0mMI3OCxgBoGVIvjn05MIOGizDE9GVA0/EOIksuKZa3NDm/cWIJWHeHw4h/3/1DdCMX+GA==
X-Received: by 2002:adf:f8d2:: with SMTP id f18mr12091230wrq.379.1606502756008; 
 Fri, 27 Nov 2020 10:45:56 -0800 (PST)
Received: from [192.168.1.10] ([46.249.74.23])
 by smtp.googlemail.com with ESMTPSA id i5sm16384915wrw.45.2020.11.27.10.45.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Nov 2020 10:45:55 -0800 (PST)
Subject: Re: [REGRESSION] omapdrm/N900 display broken
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
References: <20200728181412.GA49617@darkstar.musicnaut.iki.fi>
 <660b2fe1-343d-b83e-11d2-5a5eb530b83f@ti.com>
 <448c1441-2cac-44ef-95ef-bb28b512297b@ti.com>
 <20200823162625.GC4313@darkstar.musicnaut.iki.fi>
 <ac42f7f9-2ac2-246e-69c1-3d56cea7e59b@ti.com>
 <5072a25d-e885-cdd2-978d-70942406c272@gmail.com>
 <09044fd2-2926-c7b3-826b-52b742e84ff5@ti.com>
 <79ad8816-815c-14d3-ebe1-3c5007c81dd1@gmail.com>
 <1fe9fed7-f619-eb6a-6e31-b9eadbf09bad@ti.com>
 <8010e452-745a-ac12-bc02-5537305c70ed@gmail.com>
 <4948a40d-c887-5617-f5bc-1e0aff824ad7@gmail.com>
 <a86e0ef4-0b90-5aec-9632-e78fa4ca6d58@ti.com>
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Message-ID: <23e27b7a-d2b9-a0c0-7518-bb5105306a97@gmail.com>
Date: Fri, 27 Nov 2020 20:44:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a86e0ef4-0b90-5aec-9632-e78fa4ca6d58@ti.com>
Content-Language: en-GB
X-Mailman-Approved-At: Mon, 30 Nov 2020 01:02:59 +0000
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
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>,
 linux-kernel@vger.kernel.org, ML dri-devel <dri-devel@lists.freedesktop.org>,
 Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAyNy4xMS4yMCDQsy4gMTk6MzAg0YcuLCBUb21pIFZhbGtlaW5lbiB3cm90ZToKPiBP
biAyNy8xMS8yMDIwIDE3OjM3LCBJdmF5bG8gRGltaXRyb3Ygd3JvdGU6Cj4gCj4+IFdpdGggNS45
LjExIGFuZCB0aGUgcGF0Y2ggb24gdG9wLCBuOTAwIGJvb3RzIGZpbmUsIGFsYmVpdCBkaXNwbGF5
IHJlbWFpbnMgYmxhbmssIGNvdWxkIGJlIHJlbGF0ZWQgdG8KPj4gYnJpZ2h0bmVzcywgd2UncmUg
c3RpbGwgaW52ZXN0aWdhdGluZy4KPiAKPiBPay4gQSBEU1MgcmVnZHVtcCBmb3IgYSB3b3JraW5n
IHZlcnNpb24gYW5kIHRoZSBsYXRlc3Qgb25lIHdvdWxkIGJlIGdvb2QgdG9vLiBUaGVyZSdzIGEg
b21hcGRzcwo+IGRlYnVnZnMgZGlyLCB3aXRoIGRzcywgZGlzcGMgYW5kIGNsayBmaWxlcyB3aGlj
aCBhcmUgb2YgaW50ZXJlc3QgaGVyZS4KPiAKCkl0IHR1cm5lZCBvdXQgdG8gYmUgYSBsb25nIHN0
YW5kaW5nIGJ1ZyBpbiB0aGUgcGFuZWwgZHJpdmVyLCB3aXRoIHRoZSAKYmVsbG93IGZpeCBpdCB3
b3JrcyBmaW5lOgoKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc29u
eS1hY3g1NjVha20uYyAKYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc29ueS1hY3g1NjVh
a20uYwppbmRleCBmYzZhN2U0NTFhYmUuLjMwNDI2N2Y3ODQ5YQotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vcGFuZWwvcGFuZWwtc29ueS1hY3g1NjVha20uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFu
ZWwvcGFuZWwtc29ueS1hY3g1NjVha20uYwpAQCAtNjI5LDcgKzYyOSw3IEBAIHN0YXRpYyBpbnQg
YWN4NTY1YWttX3Byb2JlKHN0cnVjdCBzcGlfZGV2aWNlICpzcGkpCiAgICAgICAgIGxjZC0+c3Bp
ID0gc3BpOwogICAgICAgICBtdXRleF9pbml0KCZsY2QtPm11dGV4KTsKCi0gICAgICAgbGNkLT5y
ZXNldF9ncGlvID0gZGV2bV9ncGlvZF9nZXQoJnNwaS0+ZGV2LCAicmVzZXQiLCBHUElPRF9PVVRf
TE9XKTsKKyAgICAgICBsY2QtPnJlc2V0X2dwaW8gPSBkZXZtX2dwaW9kX2dldCgmc3BpLT5kZXYs
ICJyZXNldCIsIApHUElPRF9PVVRfSElHSCk7CiAgICAgICAgIGlmIChJU19FUlIobGNkLT5yZXNl
dF9ncGlvKSkgewogICAgICAgICAgICAgICAgIGRldl9lcnIoJnNwaS0+ZGV2LCAiZmFpbGVkIHRv
IGdldCByZXNldCBHUElPXG4iKTsKICAgICAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihsY2Qt
PnJlc2V0X2dwaW8pOwoKUHJvcGVyIHBhdGNoIHdpbGwgZm9sbG93LgoKVGhhbmtzLApJdm8KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
