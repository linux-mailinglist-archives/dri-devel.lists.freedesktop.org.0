Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B139C2A6849
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 16:54:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C56B6E056;
	Wed,  4 Nov 2020 15:54:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41156E056
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 15:54:16 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id p1so3423622wrf.12
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 07:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=cpjrvx5xa5Fub2SmSs5NxCIt1AtREI63BVQTX9fsjLc=;
 b=kmf1Z0yeNpYCwPXqysU9kiSujnzjdXKIk8+vE0x44SjNDiibKhNKdvM5DYwJvPv9BP
 uyTmaIN6g08I7LE1TSotYiRlsqez5OlMd8VdA7Wvqt1o94N7yywzGxi18DlbPu2frcbU
 UPX4K6ffl5hpw/wWewB4vegS9SjGz/YB1Sag9vLtCsmWpxdvdjJLW4LZUj09EXiUZd15
 BCZWtGxHuAJBWzgOusXVeUzhNClzoyi4/4FJDp8BdlfPbeMW9yVwD21iRSg8e0O6iycV
 QKF+XTr/zgsxmxz8jW9vwtA3usnrYac8tlSTIij782QzZwWQGrv1xkhb0om5/c81EElx
 ZmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=cpjrvx5xa5Fub2SmSs5NxCIt1AtREI63BVQTX9fsjLc=;
 b=mxeSNqBJmXSHwwwsQCxFA0BM4sBoV+dNIZqR+BLQJDgWEsjWBuOqoKpspj/g0TgV0H
 3BL3CPwPtXhw/BiZSSPg93+dejMHQ6GmWqxA4XwyZN/c3UvTiVdFEiSKhAoTOpq7lsak
 Tl3JotciwkTBuG4Ho1LpRup1lTw8rLt4EFEquRJe8iIoIpnUOn+jTq84rV3MHDP1ZBxX
 vnUiZOG242uOktP6FxKncfmZV+88qcPvkF+D6IROsGXWuj+zvWJIaJalBqbH8Yp5bgxC
 8Y+Jaha3yqIkBmTex4niCFFcuCdbCsObsnPVZYzrfm3Gl5YiL2GdxMTPonWny8U6Jj7R
 7jfg==
X-Gm-Message-State: AOAM532L8zado3pEpb1pRrRDIB/wiZv8rP3EeCalQ8vnpTkRg/X5eJP/
 30bTo1GzJfGliR3Xoxajnm+Fiw==
X-Google-Smtp-Source: ABdhPJwrgUZlnu1TW1h3xBXhxKSzhI+viPcm0Js1YrAFKDpqC8wX2kbdVSVE5rj9s6G+jL0loLWHTA==
X-Received: by 2002:adf:dd90:: with SMTP id x16mr19148018wrl.47.1604505255361; 
 Wed, 04 Nov 2020 07:54:15 -0800 (PST)
Received: from dell ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id w11sm3022885wmg.36.2020.11.04.07.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 07:54:14 -0800 (PST)
Date: Wed, 4 Nov 2020 15:54:12 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Alexandru Stan <amstan@chromium.org>
Subject: Re: [PATCH v3 3/3] backlight: pwm_bl: Fix interpolation
Message-ID: <20201104155412.GR4488@dell>
References: <20201022050445.930403-1-amstan@chromium.org>
 <20201021220404.v3.3.I4dcea1c90e9da3902d466033aa73351e19e49c49@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201021220404.v3.3.I4dcea1c90e9da3902d466033aa73351e19e49c49@changeid>
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
 Jingoo Han <jingoohan1@gmail.com>, Douglas Anderson <dianders@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andy Gross <agross@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Matthias Kaehlcke <mka@chromium.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMSBPY3QgMjAyMCwgQWxleGFuZHJ1IFN0YW4gd3JvdGU6Cgo+IFRoZSBwcmV2aW91
cyBiZWhhdmlvciB3YXMgYSBsaXR0bGUgdW5leHBlY3RlZCwgaXRzIHByb3BlcnRpZXMvcHJvYmxl
bXM6Cj4gMS4gSXQgd2FzIGRlc2lnbmVkIHRvIGdlbmVyYXRlIHN0cmljdGx5IGluY3JlYXNpbmcg
dmFsdWVzIChubyByZXBlYXRzKQo+IDIuIEl0IGhhZCBxdWFudGl6YXRpb24gZXJyb3JzIHdoZW4g
Y2FsY3VsYXRpbmcgc3RlcCBzaXplLiBSZXN1bHRpbmcgaW4KPiB1bmV4cGVjdGVkIGp1bXBzIG5l
YXIgdGhlIGVuZCBvZiBzb21lIHNlZ21lbnRzLgo+IAo+IEV4YW1wbGUgc2V0dGluZ3M6Cj4gCWJy
aWdodG5lc3MtbGV2ZWxzID0gPDAgMSAyIDQgOCAxNiAzMiA2NCAxMjggMjU2PjsKPiAJbnVtLWlu
dGVycG9sYXRlZC1zdGVwcyA9IDwxNj47Cj4gCj4gV2hlbmV2ZXIgbnVtLWludGVycG9sYXRlZC1z
dGVwcyB3YXMgbGFyZ2VyIHRoYW4gdGhlIGRpc3RhbmNlCj4gYmV0d2VlbiAyIGNvbnNlY3V0aXZl
IGJyaWdodG5lc3MgbGV2ZWxzIHRoZSB0YWJsZSB3b3VsZCBnZXQgcmVhbGx5Cj4gZGlzY29udGlu
dW91cy4gVGhlIHNsb3BlIG9mIHRoZSBpbnRlcnBvbGF0aW9uIHdvdWxkIHN0aWNrIHdpdGgKPiBp
bnRlZ2VycyBvbmx5IGFuZCBpZiBpdCB3YXMgMCB0aGUgd2hvbGUgbGluZSBzZWdtZW50IHdvdWxk
IGdldCBza2lwcGVkLgo+IAo+IFRoZSBkaXN0YW5jZXMgYmV0d2VlbiAxIDIgNCBhbmQgOCB3b3Vs
ZCBiZSAxIChwcm9wZXJ0eSAjMSBmaWdodGluZyB1cyksCj4gYW5kIG9ubHkgc3RhcnRpbmcgd2l0
aCAxNiBpdCB3b3VsZCBzdGFydCB0byBpbnRlcnBvbGF0ZSBwcm9wZXJseS4KPiAKPiBQcm9wZXJ0
eSAjMSBpcyBub3QgZW5vdWdoLiBUaGUgZ29hbCBoZXJlIGlzIG1vcmUgdGhhbiBqdXN0IG1vbm90
b25pY2FsbHkKPiBpbmNyZWFzaW5nLiBXZSBzaG91bGQgc3RpbGwgY2FyZSBhYm91dCB0aGUgc2hh
cGUgb2YgdGhlIGN1cnZlLiBSZXBlYXRlZAo+IHBvaW50cyBtaWdodCBiZSBkZXNpcmVkIGlmIHdl
J3JlIGluIHRoZSBwYXJ0IG9mIHRoZSBjdXJ2ZSB3aGVyZSB3ZSB3YW50Cj4gdG8gZ28gc2xvdyAo
YWthIHNsb3BlIG5lYXIgMCkuCj4gCj4gUHJvYmxlbSAjMiBpcyBwbGFpbmx5IGEgYnVnLiBJbWFn
aW5lIGlmIHRoZSA2NCBlbnRyeSB3YXMgNjMgaW5zdGVhZCwKPiB0aGUgY2FsY3VsYXRlZCBzbG9w
ZSBvbiB0aGUgMzItNjMgc2VnbWVudCB3aWxsIGJlIGFsbW9zdCBoYWxmIGFzIGl0Cj4gc2hvdWxk
IGJlLgo+IAo+IFRoZSBtb3N0IGV4cGVjdGVkIGFuZCBzaW1wbGVzdCBhbGdvcml0aG0gZm9yIGlu
dGVycG9sYXRpb24gaXMgbGluZWFyCj4gaW50ZXJwb2xhdGlvbiwgd2hpY2ggd291bGQgaGFuZGxl
IGJvdGggcHJvYmxlbXMuCj4gTGV0J3MganVzdCBpbXBsZW1lbnQgdGhhdCEKPiAKPiBUYWtlIHBh
aXJzIG9mIHBvaW50cyBmcm9tIHRoZSBicmlnaHRuZXNzLWxldmVscyBhcnJheSBhbmQgbGluZWFy
bHkKPiBpbnRlcnBvbGF0ZSBiZXR3ZWVuIHRoZW0uIE9uIHRoZSBYIGF4aXMgKHdoYXQgdXNlcnNw
YWNlIHNlZXMpIHdlJ2xsCj4gbm93IGhhdmUgZXF1YWxseSBzaXplZCBpbnRlcnZhbHMgKG51bS1p
bnRlcnBvbGF0ZWQtc3RlcHMgc2l6ZWQsCj4gYXMgb3Bwb3NlZCB0byBiZWZvcmUgd2hlcmUgd2Ug
d2VyZSBhdCB0aGUgbWVyY3kgb2YgcXVhbnRpemF0aW9uKS4KPiAKPiBFTkQKCkkgcmVtb3ZlZCB0
aGlzLgoKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcnUgU3RhbiA8YW1zdGFuQGNocm9taXVtLm9y
Zz4KPiAtLS0KPiAKPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMgfCA3MCArKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMzEgaW5zZXJ0
aW9ucygrKSwgMzkgZGVsZXRpb25zKC0pCgpBcHBsaWVkLCB0aGFua3MuCgotLSAKTGVlIEpvbmVz
IFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpM
aW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExp
bmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
