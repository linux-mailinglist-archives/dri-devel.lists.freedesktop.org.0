Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E4121085E
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 11:40:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D28EB6E876;
	Wed,  1 Jul 2020 09:39:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB6C6E876
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 09:39:56 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r12so23027100wrj.13
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 02:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=iYYkYeehSbI3R/dD8xTMJzHhDAGQyS9uwTCueyDiIZA=;
 b=WjV/JpygNxrb7Pl2iBZeJh1YjaY7StNET/e2NaAGe1BjReLYV8z+DcVZAQLtOsq1AF
 2RmgBZVR2aXpFZPwgwTnqecqP4L1Fbb4RC+g1KUQcYqfzXnntM3qDKTKU0gSkcl3CiVi
 nBXZfmkwQFEyx7Elf5KBhMJIH5WXgIS/12JhilO73fcV19NVDwoasSKUyw0bh8w2d0GV
 mc/nM7ygrB74zeH0XfFwGWRx7ph5ObYKJQqXsyLRZyRllYEEVZvPwhcBrGOrjn6YGa2E
 tK/kozADf0+BKaGjksjL5sQ1O8Zp2AOTZI68aWRjgqFfNwBn4poqh1Ev6kQWEEuustxX
 iEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=iYYkYeehSbI3R/dD8xTMJzHhDAGQyS9uwTCueyDiIZA=;
 b=HFaMpwQvYk50VTsM4V7ualgrYFoDjctnA64s+Nq4L/bPLZewgADd4XgT5ummAqR+ao
 j19IZV1fN4Iext8b4EMtqpSsZRG8h8ao4wQWVE7berNjVv1SFo/IPbS1ZI6LOkUP1Bdy
 hWLFW7Kuo6Ws3Jf215jXtWDy97Uc6tTLEoESKdaoS40TjiU9io1FfF9al2JLnzjfwrDj
 JF8CbnqbiZn84flDfUeCnbvAfLr5Bnc0Vg0O53dLwT+56JJdxNUo29/96QtEO1V6Uerh
 5rQz2QTdznNognviFiMr3Km/8PAtb94BqfwTbltcy+l2FDF9BpGzd3JQg4Rcj/vcO+gH
 axqw==
X-Gm-Message-State: AOAM531gyFhrxdabl3Mte1wOxPkgzq0kjrMLJWiVzXR1Z7qj+WL9+8N/
 8I9Y0IQO3AMARKzgmOvUL42rPA==
X-Google-Smtp-Source: ABdhPJx5lvx2PCywxBzE4VK+D2VfYEFEomMyK8/QiFwPO8YhHuwOViFBNa0vWzB4828aHrsjZGfWrg==
X-Received: by 2002:a5d:4845:: with SMTP id n5mr25230790wrs.353.1593596394685; 
 Wed, 01 Jul 2020 02:39:54 -0700 (PDT)
Received: from dell ([2.27.35.144])
 by smtp.gmail.com with ESMTPSA id 1sm6338078wmf.21.2020.07.01.02.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 02:39:52 -0700 (PDT)
Date: Wed, 1 Jul 2020 10:39:50 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] backlight: sky81452: Convert to GPIO descriptors
Message-ID: <20200701093950.GZ1179328@dell>
References: <20200626203742.336780-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200626203742.336780-1-linus.walleij@linaro.org>
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Gyungoh Yoo <jack.yoo@skyworksinc.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyNiBKdW4gMjAyMCwgTGludXMgV2FsbGVpaiB3cm90ZToKCj4gVGhlIFNLWTgxNDUy
IGJhY2tsaWdodCBkcml2ZXIganVzdCBvYnRhaW5zIGEgR1BJTyAobmFtZWQgImdwaW9zIgo+IGlu
IHRoZSBkZXZpY2UgdHJlZSkgZHJpdmVzIGl0IGhpZ2ggYW5kIGxlYXZlcyBpdCBoaWdoIHVudGls
IHRoZQo+IGRyaXZlciBpcyByZW1vdmVkLgo+IAo+IFN3aXRjaCB0byB1c2UgR1BJTyBkZXNjcmlw
dG9ycyBmb3IgdGhpcywgc2ltcGxlIGFuZAo+IHN0cmFpZ2h0LWZvcndhcmQuCj4gCj4gQ2M6IEd5
dW5nb2ggWW9vIDxqYWNrLnlvb0Bza3l3b3Jrc2luYy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTGlu
dXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL3Zp
ZGVvL2JhY2tsaWdodC9za3k4MTQ1Mi1iYWNrbGlnaHQuYyAgIHwgMTggKysrKy0tLS0tLS0tLS0t
LS0tCj4gIC4uLi9saW51eC9wbGF0Zm9ybV9kYXRhL3NreTgxNDUyLWJhY2tsaWdodC5oICAgfCAg
NiArKysrLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9u
cygtKQoKQXBwbGllZCwgdGhhbmtzLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5pb3Ig
VGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBz
b3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdp
dHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
