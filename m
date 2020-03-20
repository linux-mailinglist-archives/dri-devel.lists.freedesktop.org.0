Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BA118CEDE
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 14:30:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6812F6EB31;
	Fri, 20 Mar 2020 13:30:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 676A36EB31
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 13:30:40 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 26so3040324wmk.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 06:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=s6NlNBz5JabYM7cmGqE8XzWKbyl9fJfmEfdQ5l/oU3Q=;
 b=s09Wp38Yl9D/BXm38cmJgGPi0UqMy1rBmBFtHIfPgWs3qOVc4KyCW68gFgC6sqGOlB
 jz/2CgAIG4Z86LceTEe+1zjlO/Fo1IECFE5A+avANLmx8T9hSj8HpV1PNp0HJ4nkbvr9
 w/6J0RX5hWBJZHJkXMqtDVmhO7Oi3GPGv8l+Mw9OcKAQNTXnBhNgE65/RtWoz2KBhGCo
 T6SZZwu/9P54Us9BE+P3EeQ4kpcOe+/TxL5F+jeppKCmwyECfpUfo9D+5HwthNn+XOZQ
 2/+ahfHQtav6UCiN/qtcm9rOmsdcm1rRpK/30JxrAvC2jNt6WBWPBDuSuypXAshrAOCU
 j4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=s6NlNBz5JabYM7cmGqE8XzWKbyl9fJfmEfdQ5l/oU3Q=;
 b=nUTVVYHDam5bvavaan9whN3ZyQe50ChFimwde1fN9UZGcx7w8OtgQOYfpA8Ybx1kEP
 7AihBLwQeZJkTaWBdSVQgKyFcQoqfq5BePiRcAIX8kAiaoKpsp7SNgoFYsjhNKX+4VY8
 z5SM/BOmu86IHVfzIcqW76ku9sq1sW6obkpAbwqZFRIUEbR73FMW3I7oUoyYgFfkfLrl
 LzXEsJ5gdcEGOizju7WjBlOPRUJNhAfVTS2b9GyFzDMPNR4CFeCG20sCWu2TE2urlAAA
 8X0MzU3iVruUeeOsNV9TqbA5M0VmfWXbc5WQS9NIO3VfWOY1p7Yk1KvGJvvZfukmEYQ2
 5vxw==
X-Gm-Message-State: ANhLgQ3JDaiGhHY2hNR96FCVzamwZ3uh8F8jBoBhKBJuwXn7zWSypG91
 20dEaunehFaskyVF1/6OQeCVvA==
X-Google-Smtp-Source: ADFU+vvlGfEGMnbI0JopCMtHtW1bL0mgS+eqdDxppBiwUxn2gHI7t8tKpw60msVbIuQpZZ91pK0jiA==
X-Received: by 2002:a7b:cf03:: with SMTP id l3mr10440117wmg.139.1584711038190; 
 Fri, 20 Mar 2020 06:30:38 -0700 (PDT)
Received: from dell ([2.27.35.213])
 by smtp.gmail.com with ESMTPSA id i4sm8758565wrm.32.2020.03.20.06.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 06:30:37 -0700 (PDT)
Date: Fri, 20 Mar 2020 13:31:23 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Guru Das Srinagesh <gurus@codeaurora.org>
Subject: Re: [PATCH v11 10/12] backlight: pwm_bl: Use 64-bit division function
Message-ID: <20200320133123.GD5477@dell>
References: <cover.1584667964.git.gurus@codeaurora.org>
 <17fc1dcf8b9b392d1e37dc7e3e67409e3c502840.1584667964.git.gurus@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <17fc1dcf8b9b392d1e37dc7e3e67409e3c502840.1584667964.git.gurus@codeaurora.org>
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

T24gVGh1LCAxOSBNYXIgMjAyMCwgR3VydSBEYXMgU3JpbmFnZXNoIHdyb3RlOgoKPiBTaW5jZSB0
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
bCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMv
dmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKQ2FuIHRoaXMgcGF0Y2ggYmUgdGFrZW4gb24gaXRz
IG93bj8KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jIGIv
ZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMKPiBpbmRleCBlZmI0ZWZjLi4zZTVkYmNm
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jCj4gKysrIGIv
ZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMKPiBAQCAtNjI1LDcgKzYyNSw4IEBAIHN0
YXRpYyBpbnQgcHdtX2JhY2tsaWdodF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQo+ICAJCXBiLT5zY2FsZSA9IGRhdGEtPm1heF9icmlnaHRuZXNzOwo+ICAJfQo+ICAKPiAtCXBi
LT5sdGhfYnJpZ2h0bmVzcyA9IGRhdGEtPmx0aF9icmlnaHRuZXNzICogKHN0YXRlLnBlcmlvZCAv
IHBiLT5zY2FsZSk7Cj4gKwlwYi0+bHRoX2JyaWdodG5lc3MgPSBkYXRhLT5sdGhfYnJpZ2h0bmVz
cyAqIChkaXZfdTY0KHN0YXRlLnBlcmlvZCwKPiArCQkJCXBiLT5zY2FsZSkpOwo+ICAKPiAgCXBy
b3BzLnR5cGUgPSBCQUNLTElHSFRfUkFXOwo+ICAJcHJvcHMubWF4X2JyaWdodG5lc3MgPSBkYXRh
LT5tYXhfYnJpZ2h0bmVzczsKCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJvIFNlcnZp
Y2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZv
ciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
