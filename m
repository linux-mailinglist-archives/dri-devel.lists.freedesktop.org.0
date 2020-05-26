Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CC21E1BAA
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 09:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC2189D40;
	Tue, 26 May 2020 07:00:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CAB89D40
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 07:00:47 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id r9so2089094wmh.2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 00:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=L8TiiDzdqmM1LGFjKPSxipAC4aAv2ZlXxCOvAA34JO4=;
 b=WNVjoKCn/BXMVwd6ksjhylPSLlzdBMSDeZqC3XO1UNGE6o1d+WJ/qAszePgebMrpDw
 H0tbDceixrx0YHSneKhw+c9J0OWOkX16dvjlrC6FOTJUQrSlh7v6jBDzY+ExHepeahwk
 vJSEC85PXUFpYl54FFDgtX9A5EXacawUsLdK4sJIKRZfTfNItosXhylloe4zq05Xa5Cc
 vyO9cpU+O+ZPSYbHeZW3ksaveqxljOV0jr3qjLSuu3x+PB5+S3HmOHqIQ2kJLWsicvFh
 kn0gCbeoDhDHodCvYDYJtxLkZgajDlQbr2nOXdBHbG+rf5XSQxq8yWZYUrcBTFodS2sB
 0vvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=L8TiiDzdqmM1LGFjKPSxipAC4aAv2ZlXxCOvAA34JO4=;
 b=V41WfnY/X30Y+tXoLJlmUKmibujgcneAsEJ0P2hp8kJ2GJHiruSgx0Vs8N8wAzVAHP
 Tv7zS78Uz5RwExCFm1yxhiV91wnd/zjzGPEuj5GHImabFo0IAvM+b6ZZ0BIPJtB52UWW
 4edwRQvx84ZLy3OOKjUsvXHulK1x7IYjn+w4j1cxTk/YBFVE9DwI64NGisXMKhF6nfMh
 PyRQo8HC40JvmVjNTip3oCY6FI39XWX99M4s84ulbIrzPcjxuFbEoJpZD7SADgxb6KSm
 WKKI5I9RtDqaxE5inc6dIuh7nISeVvjqDX4s+3nfm09a9QbNA82Q9UQWz7vLbH9mLuTl
 ntGA==
X-Gm-Message-State: AOAM531ziq8ndaZ48T2LnyobVnmWYd7GrZElbPBNrAStdFeb75IHRlCS
 OffdHhYBg9WpUIAElM0LBH+Z+A==
X-Google-Smtp-Source: ABdhPJzdpWRMgGjTIcUg1QCmJz9zkoVDiBzpCYl6ODlrd+6sOxBl3vFTH+nPkYAMXFbO2wsi95nKLg==
X-Received: by 2002:a7b:cf2c:: with SMTP id m12mr16587245wmg.70.1590476446197; 
 Tue, 26 May 2020 00:00:46 -0700 (PDT)
Received: from dell ([95.149.164.102])
 by smtp.gmail.com with ESMTPSA id a16sm5852484wrx.8.2020.05.26.00.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 00:00:45 -0700 (PDT)
Date: Tue, 26 May 2020 08:00:44 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Guru Das Srinagesh <gurus@codeaurora.org>
Subject: Re: [PATCH v13 09/11] backlight: pwm_bl: Use 64-bit division function
Message-ID: <20200526070044.GB3628@dell>
References: <cover.1587523702.git.gurus@codeaurora.org>
 <429c18e1e1461d7cd3ccb93f9093a6719744f6b0.1587523702.git.gurus@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <429c18e1e1461d7cd3ccb93f9093a6719744f6b0.1587523702.git.gurus@codeaurora.org>
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
 David Collins <collinsd@codeaurora.org>,
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

T24gVHVlLCAyMSBBcHIgMjAyMCwgR3VydSBEYXMgU3JpbmFnZXNoIHdyb3RlOgoKPiBTaW5jZSB0
aGUgUFdNIGZyYW1ld29yayBpcyBzd2l0Y2hpbmcgc3RydWN0IHB3bV9zdGF0ZS5wZXJpb2QncyBk
YXRhdHlwZQo+IHRvIHU2NCwgcHJlcGFyZSBmb3IgdGhpcyB0cmFuc2l0aW9uIGJ5IHVzaW5nIGRp
dl91NjQgdG8gaGFuZGxlIGEgNjQtYml0Cj4gZGl2aWRlbmQgaW5zdGVhZCBvZiBhIHN0cmFpZ2h0
IGRpdmlzaW9uIG9wZXJhdGlvbi4KPiAKPiBDYzogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJv
Lm9yZz4KPiBDYzogRGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4K
PiBDYzogSmluZ29vIEhhbiA8amluZ29vaGFuMUBnbWFpbC5jb20+Cj4gQ2M6IEJhcnRsb21pZWog
Wm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KPiBDYzogbGludXgtcHdt
QHZnZXIua2VybmVsLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
Q2M6IGxpbnV4LWZiZGV2QHZnZXIua2VybmVsLm9yZwo+IAo+IFNpZ25lZC1vZmYtYnk6IEd1cnUg
RGFzIFNyaW5hZ2VzaCA8Z3VydXNAY29kZWF1cm9yYS5vcmc+Cj4gUmV2aWV3ZWQtYnk6IERhbmll
bCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+CgpBY2tlZC1ieTogTGVlIEpv
bmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KTGlu
YXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNv
ZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBC
bG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
