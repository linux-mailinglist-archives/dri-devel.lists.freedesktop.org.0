Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F27EC363C69
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 09:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9796E1BE;
	Mon, 19 Apr 2021 07:24:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 576276E1BE
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 07:24:07 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 o9-20020a1c41090000b029012c8dac9d47so10525180wma.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 00:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=5/I7OjlPA23XMnl0fWhyfFcD+/MgnUHTP9oGcEYHgNI=;
 b=C3nDX1FO4/ry5WxQSYLVZoj6oePzIMjyWfTPtvVUYfPHryP+JrdktRBEhPb68Syvr8
 5TD3RfFRflAXjwqMdQ4dix0mGoTxYjoGIB5l/k24emlcBbT8o64h1rSXeJsOIBkLt/Wk
 pNs7GPV6sNRAmCoVMDmrfPfpN7NHar74zQQ/pkwllUy1LA0mmE8eG+9RRsAA7YvZTsJF
 sBQcBFj0HZq5YM53mt79eb4TT0SYn24ruOlJJrg+pv9b9/NpZYT7v0diNuRwRDJ4jq3R
 8diFjwmSXL0/jrefm52TyE99agVDX0IVlLC2UXYfw8EBZnXQw7RDUoEsLDAaUZRffitr
 vX8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=5/I7OjlPA23XMnl0fWhyfFcD+/MgnUHTP9oGcEYHgNI=;
 b=t9N8KazXPc5L2Ng4UYSxS4HHLt56F57OuAgBIlA1MyT4g6ZHXbAoWRMXMtj5aZwJ2s
 9bQYH4wzD59y2w/ql0gZd8LPt1HcMzeH6xgNYB+s8ZbmA7gfL/fPFkkplZ5yFwBUE6HO
 azgcG7vtpm9cpDZcTpEOM/6zdfZKUSU77rw98CQPLINqyuzt9cS37UJvRbHN/J625wcG
 DYSob2PrM1Y1gaTsUtI3JgPBlvsRmTJ+5ev8XyQH+aAbxTAt7TJBe3XUYLUsGqtHov9X
 WFlJ1wzMK6Gvdt5Si3ubj//EohL+dRUJ8FWAL9N2+HoAYekIJTbwUcz7ksnjQd0ijW6H
 /M9A==
X-Gm-Message-State: AOAM530LDgMbNJdeNlRfXDS8iFzNgFknTEhBLFdgT3AVxyTTYwFFPm4s
 /LMC7utYrfF7wN5k0TkJ1bUjmA==
X-Google-Smtp-Source: ABdhPJye4l/i7HK7FwHbnHzpTfHSCGPiuZeatN7ljMUy6e9Tge+FyCdpTNGKhcRomYfbQP9fYFSkkQ==
X-Received: by 2002:a1c:1d14:: with SMTP id d20mr20836963wmd.49.1618817046058; 
 Mon, 19 Apr 2021 00:24:06 -0700 (PDT)
Received: from dell ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id b16sm19428764wmb.39.2021.04.19.00.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 00:24:05 -0700 (PDT)
Date: Mon, 19 Apr 2021 08:24:03 +0100
From: Lee Jones <lee.jones@linaro.org>
To: ChiYuan Huang <u0084500@gmail.com>
Subject: Re: [PATCH v6 1/4] mfd: rt4831: Adds support for Richtek RT4831
Message-ID: <20210419072403.GC4869@dell>
References: <1616945059-8718-1-git-send-email-u0084500@gmail.com>
 <CADiBU3-d3_L8RTeYCirnfjJdG=ea6UVenAi8O8GO_LvOaB7OdA@mail.gmail.com>
 <20210419072229.GA4869@dell> <20210419072317.GB4869@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210419072317.GB4869@dell>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, b.zolnierkie@samsung.com,
 jingoohan1@gmail.com, lgirdwood@gmail.com, dri-devel@lists.freedesktop.org,
 lkml <linux-kernel@vger.kernel.org>, ChiYuan Huang <cy_huang@richtek.com>,
 Mark Brown <broonie@kernel.org>, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAxOSBBcHIgMjAyMSwgTGVlIEpvbmVzIHdyb3RlOgoKPiBPbiBNb24sIDE5IEFwciAy
MDIxLCBMZWUgSm9uZXMgd3JvdGU6Cj4gCj4gPiBPbiBNb24sIDE5IEFwciAyMDIxLCBDaGlZdWFu
IEh1YW5nIHdyb3RlOgo+ID4gCj4gPiA+IEhpLCBMaW51eCBtZmQgcmV2aWV3ZXJzOgo+ID4gPiAg
ICBJdCdzIGJlZW4gdGhyZWUgd2Vla3Mgbm90IHRvIGdldCBhbnkgcmVzcG9uc2UgZnJvbSB5b3Uu
Cj4gPiA+IElzIHRoZXJlIHNvbWV0aGluZyB3cm9uZyBhYm91dCB0aGlzIG1mZCBwYXRjaD8KPiA+
ID4gSWYgeWVzLCBwbGVhc2UgZmVlbCBmcmVlIHRvIGxldCBtZSBrbm93Lgo+ID4gCj4gPiBDb3Vw
bGUgb2YgdGhpbmdzOgo+ID4gCj4gPiBGaXJzdCwgaWYgeW91IHRoaW5rIGEgcGF0Y2ggaGFkIGZh
bGxlbiB0aHJvdWdoIHRoZSBnYXBzLCB3aGljaCBkb2VzCj4gPiBoYXBwZW4gc29tZXRpbWVzLCBp
dCBpcyBnZW5lcmFsbHkgY29uc2lkZXJlZCBhY2NlcHRhYmxlIHRvIHN1Ym1pdCBhCj4gPiBbUkVT
RU5EXSB+MiB3ZWVrcyBhZnRlciB0aGUgaW5pdGlhbCBzdWJtaXNzaW9uLiAgRllJOiBUaGlzIHdh
cyBzdWNoIGEKPiA+IHBhdGNoLiAgSXQgd2FzIG5vdCBvbiwgb3IgaGFkIGZhbGxlbiBvZmYgb2Yg
bXkgcmFkYXIgZm9yIHNvbWUgcmVhc29uLgo+ID4gCj4gPiBTZWNvbmRseSwgd2UgYXJlIHJlYWxs
eSBsYXRlIGluIHRoZSByZWxlYXNlIGN5Y2xlLiAgLXJjOCBoYXMganVzdCBiZWVuCj4gPiByZWxl
YXNlZC4gIFF1aXRlIGEgZmV3IG1haW50YWluZXJzIHNsb3cgZG93biBhdCB+LXJjNi4gIFBhcnRp
Y3VsYXJseQo+ID4gZm9yIG5ldyBkcml2ZXJzLgo+ID4gCj4gPiBObyBuZWVkIHRvIHJlc3VibWl0
IHRoaXMgZHJpdmVyIHRoaXMgdGltZS4gIEl0IGlzIG5vdyBvbiBteSB0by1yZXZpZXcKPiA+IGxp
c3QgYW5kIEkgd2lsbCB0ZW5kIHRvIGl0IHNob3J0bHkuCj4gPiAKPiA+IFRoYW5rcyBmb3IgeW91
ciBwYXRpZW5jZS4KPiAKPiBBbHNvIHlvdSBhcmUgbWlzc2luZyBhIERUIHJldmlldyBvbiBwYXRj
aCA0LgoKLi4uIGxvb2tzIGxpa2UgeW91IGZvcmdvdCB0byBDYyB0aGVtIQoKLS0gCkxlZSBKb25l
cyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMK
TGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBM
aW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
