Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 250CE2F5ED8
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 11:34:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC716E1A8;
	Thu, 14 Jan 2021 10:33:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C149E6E1B7
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 10:33:54 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id k10so4070807wmi.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 02:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=yaIv+nhOILu/3I9bOPLxY99wOuAF6NciDB+QzXelzGY=;
 b=x8ApzkDMlTt2JG1XTWJhNr1UKtQ6IFke3c3xr3SNGi+9jXp61r4rSclfE/x1ZsbC6E
 kc3JWmQopOjyxq44LwowQmbznGUqSL8wNXevUO002EUou0BIqTw8RYLVCiGE12+CxOX/
 fxzIAzI7B2R4ewJDEktxUkcQ9SXPjACGgvZ9SFyT7k+98Hh+k6Ffwn0+1CFwBNjXgJeC
 HZ9wtKBjT9978oC3ER0xABCm+aUUHni1g67qqK7MQvH1V6NJJE0oBi422TUbvcXF/XDo
 OhKFaCHNP4yp/yeXwV/H58LDpQdqoatqp/ojdlHvfoNnH0n1NERfvwFqNzaDrli1Oe+I
 VJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=yaIv+nhOILu/3I9bOPLxY99wOuAF6NciDB+QzXelzGY=;
 b=gk596gRjmQ8xIwSsCCeJvkdYY6XDHz5+0F7ePTxnVgaF85/4azu1QrRdLvz5XyssLp
 IYuIVgBws70lT+iD0I/BX7HpSksi0vKhV61nSssGUAFHQncmzH9cCvyYTbucZJpCV/tJ
 j57ZeCUdM3RexfgUj2QK/lGgREFfUXFlWSYQTvKhI7PZCf8hJR9hg2JwU22/GjeVqXQH
 PD+JNVzr4yyNaNWvC9iNdO0ZMYqaGLb6McVVHUuN+rp2HzsEYuMVJSvG14H2i+GM/ByC
 tuK3YqV53pe0zF442YDYB1PUbz0W+xdgKeTjGSX1D8uq71JHaDyPLD1ulKcjj9VCCu1D
 +HQw==
X-Gm-Message-State: AOAM530PGmcYa6yld7M7B52t/jxLkGJuVjqlkYxt3yu7FHBm3otIYqXy
 5pzEp4+4AcNrwcgr75qwszE08Q==
X-Google-Smtp-Source: ABdhPJxOYTenjJAea68Lbo43i7Qv6whisJfp5qKHWu1LHfCUfeuuNEisJHD+dQOSAgNSMN4zAvV+tQ==
X-Received: by 2002:a7b:c306:: with SMTP id k6mr3262314wmj.52.1610620433288;
 Thu, 14 Jan 2021 02:33:53 -0800 (PST)
Received: from dell ([91.110.221.178])
 by smtp.gmail.com with ESMTPSA id m17sm9413232wrn.0.2021.01.14.02.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 02:33:52 -0800 (PST)
Date: Thu, 14 Jan 2021 10:33:50 +0000
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx@lists.freedesktop.org, Anthony Koo <Anthony.Koo@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Jeremy Kolb <jkolb@brandeis.edu>, Leo Li <sunpeng.li@amd.com>,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 Lyude Paul <lyude@redhat.com>, Mauro Rossi <issor.oruam@gmail.com>,
 Noah Abradjian <noah.abradjian@amd.com>, nouveau@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [PATCH 00/30] [Set 13] Finally rid W=1 warnings from GPU
Message-ID: <20210114103350.GT3975472@dell>
References: <20210113080752.1003793-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210113080752.1003793-1-lee.jones@linaro.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxMyBKYW4gMjAyMSwgTGVlIEpvbmVzIHdyb3RlOgoKPiBUaGlzIHNldCBpcyBwYXJ0
IG9mIGEgbGFyZ2VyIGVmZm9ydCBhdHRlbXB0aW5nIHRvIGNsZWFuLXVwIFc9MQo+IGtlcm5lbCBi
dWlsZHMsIHdoaWNoIGFyZSBjdXJyZW50bHkgb3ZlcndoZWxtaW5nbHkgcmlkZGxlZCB3aXRoCj4g
bmlnZ2x5IGxpdHRsZSB3YXJuaW5ncy4KPiAKPiAwIG91dCBvZiA1MDAwIGxlZnQhCj4gCj4gTEFT
VCBTRVQhICBZb3UncmUgYWxsIGNsZWFuLiAgQ2FuIHlvdSBiZWxpZXZlIGl0IT8KCkFoLCBmYWly
IHdhcm5pbmcgZm9yIHlvdTogd2UncmUgbm90IHlldCBkb25lLgoKQXJtIGlzIGNsZWFuLiAgVGhl
cmUgYXJlIHN0aWxsIGZpeC11cHMgcmVxdWlyZWQgZm9yIHg4NiBhbmQgUFBDLgoKSSdsbCBnZXQg
cmlnaHQgb24gaXQuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwg
TGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0
d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxv
ZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
