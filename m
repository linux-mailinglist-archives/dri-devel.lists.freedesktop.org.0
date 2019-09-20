Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E956B988D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 22:40:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE656FDD1;
	Fri, 20 Sep 2019 20:39:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD0A56EEA4
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 10:36:53 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id m7so6606751lji.2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 03:36:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WxAeg0E408eZYRG3jaSU6/idFxhNoNTLxowg0akgOcw=;
 b=S2qJnXFbz+0rpcT2PrdPd/hMkFlFvVj7wEmy6UEg/y07Z9sTnRb+5yRk1QRYjHIRCq
 iEYyUP1anyhL7N41zRqVxb1ZWbmfFStgssNN4wjrErDSKFRVgpJTRgTeuiBIApzFcyr1
 nw3wqDygWsgU7ctee7jE5TupDDf6qGzFMIcc2ZGAWXGMHhDyRZ2n8U4DzEwGkQ4qqlpV
 FerHYdwrVChkK6HMN52J0kBC4R73oAOVhkeXGdK/raacNO0q/kKXLdRF+zz2AtZiNgqR
 y0xJoaOqMNTW64Vf7ujr4mqeLXMGb3Oip+ZhcwFYUc/fx0ZEYIzFwqCyj1nzU3dnImTT
 nR+A==
X-Gm-Message-State: APjAAAUa7sxurTBPsTiJp2FhvaQBG6HiRtBA7t/DRxjw43oeXX+karZv
 DLHnuRnnh+Z8Lr0U+z5RHaWUlw==
X-Google-Smtp-Source: APXvYqxKkShwoINlCHvbgRna0mCpBj60DPtHn9mUmlUHjnbq1INmrrmDP4/wXchRCyQvKEe49i4U8Q==
X-Received: by 2002:a2e:934f:: with SMTP id m15mr8826326ljh.101.1568975811966; 
 Fri, 20 Sep 2019 03:36:51 -0700 (PDT)
Received: from [172.16.11.28] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id y22sm400931lfb.75.2019.09.20.03.36.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 20 Sep 2019 03:36:51 -0700 (PDT)
Subject: Re: [PATCH 1/5] backlight: pwm_bl: fix cie1913 comments and constant
To: Daniel Thompson <daniel.thompson@linaro.org>
References: <20190919140620.32407-1-linux@rasmusvillemoes.dk>
 <20190920101405.yuu4bymublj45kd4@holly.lan>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <fe846ffb-857e-fda2-1277-3ca49ffc0d7a@rasmusvillemoes.dk>
Date: Fri, 20 Sep 2019 12:36:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190920101405.yuu4bymublj45kd4@holly.lan>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 20 Sep 2019 20:39:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WxAeg0E408eZYRG3jaSU6/idFxhNoNTLxowg0akgOcw=;
 b=jToWQaO4D6xEhMK9/TNQMuFGKbY+7smm/ghe2egGrXdgjp9a7IGN72Xca35sidyhok
 kpaz5ralL1igV0259f/lzjwYwXol6ELi4hsyuVxNEYVOpGaHccZb94sqyxfKUys9yHdc
 D8Z0qlL7ecKdViFW2QPE7WhExVxQVCD6UVTCI=
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAvMDkvMjAxOSAxMi4xNCwgRGFuaWVsIFRob21wc29uIHdyb3RlOgo+IEhpIFJhc211cwo+
IAo+IEhhcyBzb21ldGhpbmcgZ29uZSB3cm9uZyB3aXRoIHRoZSBtYWlsIG91dCBmb3IgdGhpcyBw
YXRjaCBzZXQuIEkgZGlkbid0Cj4gZ2V0IGEgY292ZXJpbmcgbGV0dGVyIG9yIHBhdGNoIDUvNT8K
ClNvcnJ5IGFib3V0IHRoYXQuIEkgc2hvdWxkIGhhdmUgaW5jbHVkZWQgYSBjb3ZlciBsZXR0ZXIg
c28geW91J2Qga25vdwp0aGF0IHBhdGNoIDUgd2Fzbid0IGRpcmVjdGx5IHJlbGF0ZWQgdG8gdGhl
IG90aGVyIHBhdGNoZXMuCgpodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMTkwOTE5MTQw
NjIwLjMyNDA3LTUtbGludXhAcmFzbXVzdmlsbGVtb2VzLmRrLwoKSSB3YXMgcmVtb3ZpbmcgdGhl
IG5vdyB1bnVzZWQgaW50X3BvdygpIGZ1bmN0aW9uLCBidXQgQW5keSBoYXMgdG9sZCBtZQp0aGVy
ZSBhcmUgbmV3IHVzZXJzIGluIC1uZXh0LCBzbyBpdCdzIG1vb3QuIE9ubHkgdGhlIGZpcnN0IGZv
dXIgcGF0Y2hlcwphcmUgcmVsZXZhbnQuCgpUaGFua3MsClJhc211cwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
