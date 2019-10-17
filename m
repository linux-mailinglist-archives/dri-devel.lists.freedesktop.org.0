Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E777ADAE30
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 15:23:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A414E6EA8B;
	Thu, 17 Oct 2019 13:23:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69DDC6EA8B
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 13:23:28 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id i16so2557804wmd.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 06:23:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=w6ztz66F+XUhul9dF9IbLT3GjbciXy1TD14N9xxwUhc=;
 b=g4DCGW79YzbeszI7hpIzevvvmnPcE7346H5Kj+s6/KKQUqykBMescA/BZOKWIjNitF
 5eC+DafzwwubILtHL49MrKHXHhmfCR8NDfwPwsqv2WrBdRULaQ63/lAb/krOhUtWzGBp
 DxInOyoIeT2TkU/4FPCN/yp+/HO7eCvojXriPjhjsF6QyDl8SMvkUEM1ud/ugcZquFLh
 +VR8BvjSgWMALJauc/0N2ZleoKd2dP865zwlfB9qTTKdF1G3u43FI5TnD48bpumsFEVk
 nNKo+zvxuh2E9kQtwwwTJstR8EDSgzhwfajAAVLoQ8ZWz2JzIHLTXDv9r9O33JjsSMwB
 3JcA==
X-Gm-Message-State: APjAAAXzHvtPgZtSSEex0Bq278KKenYPDO1XENmATXvcJGuW5J1F7zao
 LBcwyIc4n+SiiS9WAD7U9rsfkB2w9yQ=
X-Google-Smtp-Source: APXvYqwLUwrX7DMEERuphZrAscX4CgBPVWC13LFneIeTdrAl+0BB4RRBD8tasC+m2a4yQj8hK+OrtQ==
X-Received: by 2002:a1c:1ad6:: with SMTP id a205mr2748694wma.110.1571318606936; 
 Thu, 17 Oct 2019 06:23:26 -0700 (PDT)
Received: from dell ([95.149.164.47])
 by smtp.gmail.com with ESMTPSA id q14sm2703400wre.27.2019.10.17.06.23.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Oct 2019 06:23:26 -0700 (PDT)
Date: Thu, 17 Oct 2019 14:23:24 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH 29/34] backlight/jornada720: Use CONFIG_PREEMPTION
Message-ID: <20191017132324.GP4365@dell>
References: <20191015191821.11479-1-bigeasy@linutronix.de>
 <20191015191821.11479-30-bigeasy@linutronix.de>
 <20191017113707.lsjwlhi6b4ittcpe@holly.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191017113707.lsjwlhi6b4ittcpe@holly.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=w6ztz66F+XUhul9dF9IbLT3GjbciXy1TD14N9xxwUhc=;
 b=rgiTnz8TbEsBCg1prLfdv0eg5SkZU1fwa2hpfuDtD1TuNuH56nwGXcWjVe2rDdSsgL
 My2TSbqBqTP+SxFwAQLulcSksIdQb1hTv9Ths5+IufIjuYBOBslMoy9vUCRjlQZH1NHN
 vY+gEtpTNqLG8aYs7eLaJ40/Bh7fiNh35pXrJQYBnd43/wsMXkfjQRyyEpW6hBdd7l7I
 KZTbEJRTZFPZ2o9c1ced83Z91QmSCbwDBChTjt8pCZ6Ry+va7Izul+/iEh7glpwWJA7j
 TUkVfotpb9T4QIJA5w10qaXrTrxVOdYe9Wn799NoWJgQ1BzzUTWzjPsZfF95wp9SJmoF
 8iRg==
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxNyBPY3QgMjAxOSwgRGFuaWVsIFRob21wc29uIHdyb3RlOgoKPiBPbiBUdWUsIE9j
dCAxNSwgMjAxOSBhdCAwOToxODoxNlBNICswMjAwLCBTZWJhc3RpYW4gQW5kcnplaiBTaWV3aW9y
IHdyb3RlOgo+ID4gRnJvbTogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+Cj4g
PiAKPiA+IENPTkZJR19QUkVFTVBUSU9OIGlzIHNlbGVjdGVkIGJ5IENPTkZJR19QUkVFTVBUIGFu
ZCBieSBDT05GSUdfUFJFRU1QVF9SVC4KPiA+IEJvdGggUFJFRU1QVCBhbmQgUFJFRU1QVF9SVCBy
ZXF1aXJlIHRoZSBzYW1lIGZ1bmN0aW9uYWxpdHkgd2hpY2ggdG9kYXkKPiA+IGRlcGVuZHMgb24g
Q09ORklHX1BSRUVNUFQuCj4gPiAKPiA+IFN3aXRjaCB0aGUgS2NvbmZpZyBkZXBlbmRlbmN5IHRv
IENPTkZJR19QUkVFTVBUSU9OLgo+ID4gCj4gPiBDYzogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4KPiA+IENjOiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8u
b3JnPgo+ID4gQ2M6IEppbmdvbyBIYW4gPGppbmdvb2hhbjFAZ21haWwuY29tPgo+ID4gQ2M6IEJh
cnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KPiA+IENj
OiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBDYzogbGludXgtZmJkZXZAdmdl
ci5rZXJuZWwub3JnCj4gPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGlu
dXRyb25peC5kZT4KPiA+IFtiaWdlYXN5OiArTENEX0hQNzAwXQo+ID4gU2lnbmVkLW9mZi1ieTog
U2ViYXN0aWFuIEFuZHJ6ZWogU2lld2lvciA8YmlnZWFzeUBsaW51dHJvbml4LmRlPgo+IAo+IFJl
dmlld2VkLWJ5OiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgo+
IAo+IChJIGtub3cuLi4gdGhlIHJldmlldyBmb3IgdGhpcyBwYXJ0aWN1bGFyIHBhdGNoIGlzIHRy
aXZpYWwgYnV0IGFuCj4gQWNrZWQtYnkgZnJvbSBhIG1haW50YWluZXIgbWVhbnMgc29tZXRoaW5n
IHNwZWNpZmljIGFuZCBpdCBpcyBMZWUKPiBKb25lcyB3aG8gY29vcmRpbmF0ZXMgbGFuZGluZyBj
cm9zcyBzdWItc3lzdGVtIHBhdGNoIHNldHMgZm9yCj4gYmFja2xpZ2h0KS4KClJpZ2h0LiAgVGhh
bmtzIERhbi4KClNvIHdoYXQgYXJlIHRoZSBPUCdzIGV4cGVjdGF0aW9ucyBpbiB0aGF0IHJlZ2Fy
ZD8gIEkgc2VlIHRoaXMgaXMgYQpsYXJnZSBzZXQgYW5kIEkgYW0gb25seSBwcml2eSB0byB0aGlz
IHBhdGNoLCB0aHVzIGxhY2sgd2lkZXIKdmlzaWJpbGl0eS4gIERvZXMgdGhpcyBwYXRjaCBkZXBl
bmQgb24gb3RoZXJzLCBvciBpcyBpdCBpbmRlcGVuZGVudD8KSSdtIGhhcHB5IHRvIHRha2UgaXQs
IGJ1dCB3aXNoIHRvIGF2b2lkIGJpc2VjdGFiaWxpdHkgaXNzdWVzIGluIHRoZQpuZXh0IHJlbGVh
c2Uga2VybmVsLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVj
aG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBT
b0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
