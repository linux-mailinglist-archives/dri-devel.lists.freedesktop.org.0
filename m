Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D56691912E5
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 15:23:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E72AA8999C;
	Tue, 24 Mar 2020 14:23:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BEB68999C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 14:23:55 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id 31so15656121wrs.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 07:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=cKmeib+BmWwd47DgxcgoVOMPKvAp+uPr4gwXndY1O5I=;
 b=Ce3yOBCPqf7VZXVox52EqtYVXwJmCTDBc4rPpj21E1LEXlSyWAWPpoO3IXOyacoBvV
 OPgcpgxn5NjhVaIDt+zAvy5+UtjOV/cQnl0nXkQMvPO7aw7V7L0Nu9pbz1AnO05QY0n4
 BeT08PMENEfpbDVVhnyfCE4hEenLxGYJs78gdR/3IgD9pKkhJaXbj10IpQSdREvsRAhg
 oMO/smrg6JtZ4Shi97Wp1/RP26dRPQVbpY8F4EPEA72GrhFXToBKKdg2B+xQdgGJJ2vZ
 f2OdT6atGc6tDEHNZ3v5g2Os9ohn+lfi1UqtMOP30U5uAMJEClhlBGzyP7GZijgmL5k/
 0qwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=cKmeib+BmWwd47DgxcgoVOMPKvAp+uPr4gwXndY1O5I=;
 b=GqVXzggWIFtIb7tjrADfIuvkCdMhxlpok+WSR3SMm407YkYbnWlcVh9gGxt/h2ndtF
 c3pfwONXXmDhK+4OqtnVglQcVJTvRqGYtmqCydwwsBC4WScrvrxS7bbue8mf00W9tZly
 Q0YLDQMZENjGGi/38gjFgup7Na0k5oPJCn2LM09Vj1M1coS3CFo1II6pkNMELfAIapEF
 f/ttq9y2cYuLwZMruR/Ug6il2D4KaJW8iLjShjPMo6DojZ9Y9LcY0Z1pxh+y8MtEFR+C
 Z/4yVQfw8GgJxrDjF4Tf7C3uXJr5QrQhXAkhxLetFvTw/3qcpEgF1O5xSv4HqC7ZiYJT
 wNEw==
X-Gm-Message-State: ANhLgQ0L7M4pqCdiYk0C6ZqnDYNRFIYtndiQDeVFLmkGEyK8V1w8GoR2
 IRE4muv3aTZV78aC7iDyXlmwKQ==
X-Google-Smtp-Source: ADFU+vvHmRGGnvo0nzP7x/ozCt+1LNA6o+Q2xPy5/8uHRCz+FM1auNFVHF2NF74leUS+Zr/IBljAKw==
X-Received: by 2002:a5d:6044:: with SMTP id j4mr35092009wrt.232.1585059833617; 
 Tue, 24 Mar 2020 07:23:53 -0700 (PDT)
Received: from dell ([2.27.35.213])
 by smtp.gmail.com with ESMTPSA id n2sm30986951wro.25.2020.03.24.07.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 07:23:52 -0700 (PDT)
Date: Tue, 24 Mar 2020 14:24:41 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH v11 10/12] backlight: pwm_bl: Use 64-bit division function
Message-ID: <20200324142441.GD442973@dell>
References: <cover.1584667964.git.gurus@codeaurora.org>
 <17fc1dcf8b9b392d1e37dc7e3e67409e3c502840.1584667964.git.gurus@codeaurora.org>
 <20200320133123.GD5477@dell> <20200324110710.GL5477@dell>
 <20200324125735.2mjuvbxt5bpon2ft@pengutronix.de>
 <20200324130410.dwlg767ku6kwequv@holly.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200324130410.dwlg767ku6kwequv@holly.lan>
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
Cc: Guru Das Srinagesh <gurus@codeaurora.org>, linux-fbdev@vger.kernel.org,
 linux-pwm@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyNCBNYXIgMjAyMCwgRGFuaWVsIFRob21wc29uIHdyb3RlOgoKPiBPbiBUdWUsIE1h
ciAyNCwgMjAyMCBhdCAwMTo1NzozNVBNICswMTAwLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToK
PiA+IEhlbGxvIExlZSwKPiA+IAo+ID4gT24gVHVlLCBNYXIgMjQsIDIwMjAgYXQgMTE6MDc6MTBB
TSArMDAwMCwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gPiBPbiBGcmksIDIwIE1hciAyMDIwLCBMZWUg
Sm9uZXMgd3JvdGU6Cj4gPiA+IAo+ID4gPiA+IE9uIFRodSwgMTkgTWFyIDIwMjAsIEd1cnUgRGFz
IFNyaW5hZ2VzaCB3cm90ZToKPiA+ID4gPiAKPiA+ID4gPiA+IFNpbmNlIHRoZSBQV00gZnJhbWV3
b3JrIGlzIHN3aXRjaGluZyBzdHJ1Y3QgcHdtX3N0YXRlLnBlcmlvZCdzIGRhdGF0eXBlCj4gPiA+
ID4gPiB0byB1NjQsIHByZXBhcmUgZm9yIHRoaXMgdHJhbnNpdGlvbiBieSB1c2luZyBkaXZfdTY0
IHRvIGhhbmRsZSBhIDY0LWJpdAo+ID4gPiA+ID4gZGl2aWRlbmQgaW5zdGVhZCBvZiBhIHN0cmFp
Z2h0IGRpdmlzaW9uIG9wZXJhdGlvbi4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gQ2M6IExlZSBKb25l
cyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gPiA+ID4gPiBDYzogRGFuaWVsIFRob21wc29uIDxk
YW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4KPiA+ID4gPiA+IENjOiBKaW5nb28gSGFuIDxqaW5n
b29oYW4xQGdtYWlsLmNvbT4KPiA+ID4gPiA+IENjOiBCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6
IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+Cj4gPiA+ID4gPiBDYzogbGludXgtcHdtQHZnZXIu
a2VybmVsLm9yZwo+ID4gPiA+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
PiA+ID4gPiA+IENjOiBsaW51eC1mYmRldkB2Z2VyLmtlcm5lbC5vcmcKPiA+ID4gPiA+IAo+ID4g
PiA+ID4gU2lnbmVkLW9mZi1ieTogR3VydSBEYXMgU3JpbmFnZXNoIDxndXJ1c0Bjb2RlYXVyb3Jh
Lm9yZz4KPiA+ID4gPiA+IFJldmlld2VkLWJ5OiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9t
cHNvbkBsaW5hcm8ub3JnPgo+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiAgZHJpdmVycy92aWRlby9i
YWNrbGlnaHQvcHdtX2JsLmMgfCAzICsrLQo+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ID4gPiAKPiA+ID4gPiBDYW4gdGhpcyBwYXRj
aCBiZSB0YWtlbiBvbiBpdHMgb3duPwo+ID4gPiAKPiA+ID4gSGVsbG9vb29vIC4uLgo+ID4gCj4g
PiBDb25jZXB0dWFsbHkgaXQgY2FuLiBBcyB0aGUgbGFzdCBwYXRjaCBkZXBlbmRzIG9uIHRoaXMg
b25lIChhbmQgdGhlCj4gPiBvdGhlcnMpIHNvbWUgY29vcmRpbmF0aW9uIG1pZ2h0IGJlIGJlbmVm
aWNpYWwuIEJ1dCB0aGF0J3MgdXAgdG8gVGhpZXJyeQo+ID4gdG8gZGVjaWRlIGhvdyAoYW5kIGlm
KSBoZSB3YW50IHRoaXMgc2VyaWVzIHRvIGJlIGFwcGxpZWQuCj4gCj4gLi4uIGFuZCBvbiB0aGUg
YmFja2xpZ2h0IHNpZGUgd2UgZGVmaW5pdGVseSBuZWVkIHRvIGtub3cgYWJvdXQgdGhlICJpZiIK
PiBvdGhlcndpc2UgdGhlcmUncyBubyBwb2ludCBpbiB0YWtpbmcgaXQuCgpSaWdodC4KCkknbSBo
YXBweSB0byB3YWl0IGZvciBUaGllcnJ5LiAgQWx0aG91Z2ggdGhpcyBpc24ndCB0aGUgb25seSBz
ZXQgaGUncwpjdXJyZW50bHkgYmxvY2tpbmcuICBJcyBoZSBva2F5PyAgT24gaG9saWRheSBwZXJo
YXBzPwoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVjaG5pY2Fs
IExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZv
bGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
