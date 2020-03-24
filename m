Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76184190BEE
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 12:06:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B6488584;
	Tue, 24 Mar 2020 11:06:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D622895B9
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 11:06:22 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id d198so2703182wmd.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 04:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=85coQpfIuRs+sPyYMKP16shkvF4ULZs9j9T/GaUTXMA=;
 b=VT9q5/jF2VHIjb1DZzmV5uWK7Uk3Y+xVfuIZA7l+c4XrodjvqMvAkW8PC0kNkLrgYM
 3iana2G8gyGAfBnuD3tWiwwsYyndM+xe6dTnJx4myohK1jgaOQlQisQ7OTsUcVb4TiHA
 02CR0L4AmTwZ6TWYAuBgOaGihewpebEYX1AZBguETu6kswW6pM8vMDVrOiQXeCUsunFq
 kEXdn3pTTM5sKdZAVZryI6XQZDdohQZwEGPxqePgXmdn6YyIfmajV2Z0g6BrJMMfVDSZ
 3pxXnSFuuNvVcIbxrbVnimLoPa7kg7P2p0ab+jA5qME9NUdm6UCRGEBAySrUTOyPCHYo
 wC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=85coQpfIuRs+sPyYMKP16shkvF4ULZs9j9T/GaUTXMA=;
 b=tQ8qaRkaGfpO4Yl/j6hIOQAZfhGAQBJ8JjdaqqlsIDoFrU0N5BhIe6Gc8Ha575eNd6
 4r5uWKGfaVoY8399U9/oBnWCv6lIFh8dcA0y1mqUSlzU+rv8+ZNf3EfRqzNgRD1XKcCK
 SGsqfp/NVDCLxT4FKjAyLbU1A7PbMRUObSdKma6D90N+pdxRHbH4Ka5zT5vthhHwNFQT
 J/fLDo6kzGu+JqAQZN1Hcpiy2lFJDy3OXMw4Av0XJTv/Wlgul2Q4Xd4J3aStl5YvcwNn
 g/KQYPpIyAFC3y+tF5jpSrm65lM0ha7+Qh4UZcJaFL1Cy/nb67D7sKy2ORDBrYMhIh8w
 7gxQ==
X-Gm-Message-State: ANhLgQ2Hp6c44+UVKdlob/zdj53oPWBec8mQARUdW4K3ASuYJiNMEoJp
 RCw+Pv9DnL9ousvpexERBrxBjA==
X-Google-Smtp-Source: ADFU+vvewfCSPSJ/JtfjkuAPYyDeLB/atTsI2+R8ZuR0hHyIJno3qS1Oa/lOKqJLRVXNnbIQOwCyQA==
X-Received: by 2002:a05:600c:20d:: with SMTP id
 13mr4980605wmi.74.1585047981072; 
 Tue, 24 Mar 2020 04:06:21 -0700 (PDT)
Received: from dell ([2.27.35.213])
 by smtp.gmail.com with ESMTPSA id 98sm28341407wrk.52.2020.03.24.04.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 04:06:20 -0700 (PDT)
Date: Tue, 24 Mar 2020 11:07:10 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Guru Das Srinagesh <gurus@codeaurora.org>
Subject: Re: [PATCH v11 10/12] backlight: pwm_bl: Use 64-bit division function
Message-ID: <20200324110710.GL5477@dell>
References: <cover.1584667964.git.gurus@codeaurora.org>
 <17fc1dcf8b9b392d1e37dc7e3e67409e3c502840.1584667964.git.gurus@codeaurora.org>
 <20200320133123.GD5477@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200320133123.GD5477@dell>
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
Cc: linux-pwm@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-fbdev@vger.kernel.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMCBNYXIgMjAyMCwgTGVlIEpvbmVzIHdyb3RlOgoKPiBPbiBUaHUsIDE5IE1hciAy
MDIwLCBHdXJ1IERhcyBTcmluYWdlc2ggd3JvdGU6Cj4gCj4gPiBTaW5jZSB0aGUgUFdNIGZyYW1l
d29yayBpcyBzd2l0Y2hpbmcgc3RydWN0IHB3bV9zdGF0ZS5wZXJpb2QncyBkYXRhdHlwZQo+ID4g
dG8gdTY0LCBwcmVwYXJlIGZvciB0aGlzIHRyYW5zaXRpb24gYnkgdXNpbmcgZGl2X3U2NCB0byBo
YW5kbGUgYSA2NC1iaXQKPiA+IGRpdmlkZW5kIGluc3RlYWQgb2YgYSBzdHJhaWdodCBkaXZpc2lv
biBvcGVyYXRpb24uCj4gPiAKPiA+IENjOiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3Jn
Pgo+ID4gQ2M6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+Cj4g
PiBDYzogSmluZ29vIEhhbiA8amluZ29vaGFuMUBnbWFpbC5jb20+Cj4gPiBDYzogQmFydGxvbWll
aiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgo+ID4gQ2M6IGxpbnV4
LXB3bUB2Z2VyLmtlcm5lbC5vcmcKPiA+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gPiBDYzogbGludXgtZmJkZXZAdmdlci5rZXJuZWwub3JnCj4gPiAKPiA+IFNpZ25lZC1v
ZmYtYnk6IEd1cnUgRGFzIFNyaW5hZ2VzaCA8Z3VydXNAY29kZWF1cm9yYS5vcmc+Cj4gPiBSZXZp
ZXdlZC1ieTogRGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4KPiA+
IC0tLQo+ID4gIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jIHwgMyArKy0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gQ2FuIHRo
aXMgcGF0Y2ggYmUgdGFrZW4gb24gaXRzIG93bj8KCkhlbGxvb29vbyAuLi4KCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMgYi9kcml2ZXJzL3ZpZGVvL2Jh
Y2tsaWdodC9wd21fYmwuYwo+ID4gaW5kZXggZWZiNGVmYy4uM2U1ZGJjZiAxMDA2NDQKPiA+IC0t
LSBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jCj4gPiArKysgYi9kcml2ZXJzL3Zp
ZGVvL2JhY2tsaWdodC9wd21fYmwuYwo+ID4gQEAgLTYyNSw3ICs2MjUsOCBAQCBzdGF0aWMgaW50
IHB3bV9iYWNrbGlnaHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+ICAJ
CXBiLT5zY2FsZSA9IGRhdGEtPm1heF9icmlnaHRuZXNzOwo+ID4gIAl9Cj4gPiAgCj4gPiAtCXBi
LT5sdGhfYnJpZ2h0bmVzcyA9IGRhdGEtPmx0aF9icmlnaHRuZXNzICogKHN0YXRlLnBlcmlvZCAv
IHBiLT5zY2FsZSk7Cj4gPiArCXBiLT5sdGhfYnJpZ2h0bmVzcyA9IGRhdGEtPmx0aF9icmlnaHRu
ZXNzICogKGRpdl91NjQoc3RhdGUucGVyaW9kLAo+ID4gKwkJCQlwYi0+c2NhbGUpKTsKPiA+ICAK
PiA+ICAJcHJvcHMudHlwZSA9IEJBQ0tMSUdIVF9SQVc7Cj4gPiAgCXByb3BzLm1heF9icmlnaHRu
ZXNzID0gZGF0YS0+bWF4X2JyaWdodG5lc3M7Cj4gCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9d
CkxpbmFybyBTZXJ2aWNlcyBUZWNobmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJj
ZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVy
IHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
