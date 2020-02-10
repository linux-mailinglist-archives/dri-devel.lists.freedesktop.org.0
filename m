Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 704FC15716D
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 10:07:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 549FA6EB90;
	Mon, 10 Feb 2020 09:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB836EB90
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 09:07:47 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id s10so8963599wmh.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 01:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i+jBleNxT3Z/mEcQPlXPin8zCkk5+yknam9NYQL7j8Q=;
 b=t4KxC4YYwUFQoIFFpfH79bb/RBILVTQtqOHeRaaNHU/2YVTFJFVxIphkSKSD2FEO34
 heYrQBUfVzgE2/5YksNErdgBGORA9pkOAR6rSIz53n/7Blkapk/EECf71RbcR2ypW68T
 izGw6SGifxYKfJqHL9lYaFcpUFEhuSmsP2iKoFYmcftWzRjsPSPV/8C4HBDkbr2vA9ty
 APqQFYLZHEI+BX16YFALWVudl9q2M7QwzxnRPKLb+RyiPOcsn1+VdXEJRsIx6qbXo6a9
 E6CXLv941dRd5FnY8etK9U9VrddGYbujSJet9enNLr7aL+6ODMlN1QmYkMzjj3u0btBI
 dE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=i+jBleNxT3Z/mEcQPlXPin8zCkk5+yknam9NYQL7j8Q=;
 b=teCOlgv+lO2gZmWu4dhvXqP5+twI2haZw20Rv3eK6ujZ9doXgpVyeJhqBqdhebhF17
 LNf7lYLShUxNH5RPWN9M4+rj+FeQZpaXZBuwctfMCxL/hMgQWp/O561LEFE44QOl3zB4
 Xqyn3SAzPgdz6+ZO59BocUCtNWQmLcaOqnYtGR5Np/jF33FoOS1VP/3vUOnV3eeY32uR
 x9tPy2bCyHP5czLrkbUhhzNN5PeGJEw2t/EGBT1BaOYKQ4uzyw2j8hUkOKgva1haME12
 Hln5a+mEmbWDErH/5LjCcXlzFeTflteWT2sgWHA2nt5i+pLmxIvtGIUIuMZVuKZsUE9m
 uBrQ==
X-Gm-Message-State: APjAAAWxbtHUfZNKoiFtKOjiheMCUTs/sTKaN2Oj4ltNOhE2L4V0zFGd
 6YOCRpWXJR4E18PPZi0FfQd8ng==
X-Google-Smtp-Source: APXvYqyvfQwN+L44HDiesln+TiGXxYLv45rVOHl8vb6ZaQOxC/1rAtmHjlaKfaGkCQxQ8Kgx/XcAYQ==
X-Received: by 2002:a1c:bc08:: with SMTP id m8mr15042611wmf.189.1581325665842; 
 Mon, 10 Feb 2020 01:07:45 -0800 (PST)
Received: from [10.1.2.12] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a9sm10547615wrn.3.2020.02.10.01.07.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2020 01:07:45 -0800 (PST)
Subject: Re: [PATCH v2] drm/bridge: tfp410: add pclk limits
To: Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Andrzej Hajda <a.hajda@samsung.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200113134528.9851-1-tomi.valkeinen@ti.com>
 <20200121094655.9092-1-tomi.valkeinen@ti.com>
 <CGME20200210082202eucas1p25526395f284a3518d6486faefd9361cc@eucas1p2.samsung.com>
 <123befc8-8c57-4718-c23d-1bec9cf55ef4@ti.com>
 <58e2b0d6-0e18-d2e0-d139-835d22b3a364@samsung.com>
 <1868bed7-b493-303a-084e-1f52520e7a04@ti.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <523722d4-7cff-174e-5a28-1c35e21f1dfa@baylibre.com>
Date: Mon, 10 Feb 2020 10:07:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1868bed7-b493-303a-084e-1f52520e7a04@ti.com>
Content-Language: en-US
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

SGksCgpPbiAxMC8wMi8yMDIwIDEwOjA1LCBUb21pIFZhbGtlaW5lbiB3cm90ZToKPiBPbiAxMC8w
Mi8yMDIwIDEwOjQ5LCBBbmRyemVqIEhhamRhIHdyb3RlOgo+IAo+Pj4gSXMgdGhpcyBvayB0byBt
ZXJnZT8KPj4KPj4KPj4gWWVzLCBJZiBJIHJlbWVtYmVyIHlvdSBoYXZlIG1lcmdlIHJpZ2h0cy4g
SWYgbm90LCBsZXQgbWUga25vdy4KPiAKPiBZZXMsIEkgaGF2ZS4KPiAKPiBHZW5lcmFsbHkgc3Bl
YWtpbmcsIGhvdyBkbyB5b3UgbWFuYWdlIGJyaWRnZSBwYXRjaGVzPyBJZiB5b3UgZ2l2ZSByZXZp
ZXdlZC1ieS9hY2tlZC1ieSwgZG9lcyBpdCBtZWFuIGl0J3MgZ29vZCBmb3IgdGhlIHNlbmRlciB0
byBwdXNoIHRvIGRybS1taXNjLW5leHQ/IE9yIGRvIHlvdSB1c3VhbGx5IG1lcmdlIGJyaWRnZSBw
YXRjaGVzIHlvdXJzZWxmPwoKSWYgeW91IGhhdmUgdGhlIG1lcmdlIHJpZ2h0cyBhbmQgb25lIG9m
IG91ciByLWIvYS1iLCB5b3UgY2FuIHB1c2ggaXQgeW91cnNlbGYuIE90aGVyd2lzZSB3ZSBjYW4g
cHVzaCB0aGVtIGlmIHlvdSBjYW4ndCBvciB1bnN1cmUuCgpOZWlsCgo+IAo+IMKgVG9taQo+IAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
