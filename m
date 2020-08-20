Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E4924B05D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:49:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C8A56E90B;
	Thu, 20 Aug 2020 07:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7596E90B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 07:49:23 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id a5so1057251wrm.6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 00:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=XgD7oAraMYDOqNsfZffx0IqUVAmFZfcgzGRKvwI8mIc=;
 b=XlaONjDnEdsYg/6xqFFyWyTH0yWrgNaxkmvE+JWcDVZbLe+f/V7HKdjYROy7dyRpgD
 0dP7O6uThUl2ocYIR33bisbTsV7PY13WDhwdzpoG+1juP2BKSoKiEUd4Vt3PTFRroRgA
 CKWIaTIqQLz/3rnEaEMJlfnH2LOTDEFgtejdx0YcZnIibXmUIW8mrTOAvdg1MlPqsu01
 n4D3DHqkiUh/PUQcvUhn/MDFi/qLIJr1VljuscrpP3WooR3pcPufopgFHfsC1aJqsMPG
 YS204VOVM7RsVE5k9miArRNcssfkXrf1ORtWY/QTAhKAThyjJpNspv/DCPSgCLSS8wMB
 aMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=XgD7oAraMYDOqNsfZffx0IqUVAmFZfcgzGRKvwI8mIc=;
 b=ARANXqgl0U7MFqtV1IJgt2+mstHVGbdHp+PpxCcrqJAYKEfVNXWfqPmLvnMnGQ1Hel
 R/mqAWrrUYiQ/30/XlWKSpoqDCeilb1pDVwYcZDgvXLTBiyE+UCRSAQnllJztlyvis2x
 br9FI44OcDzfbfO5IiSZ7ZN8cuEPShcM685JFej0b9xDOvtyum53y7gaOR+L250raY5a
 2CmQukHJUhRaMdugMDIuiDd652tFsFG3iH0BxvEEMGMAX4ByMT5Hl+4RE86R8FJOlbDt
 XX1hNKCzkgzAbPOyjK4goquPhBTSL3nOuxMAEv02OmYWA1brzqT0AnwGKVd13ks2KQys
 s7uA==
X-Gm-Message-State: AOAM530zUoSd1k+tHgGkUpUz2Cbiy+a+Iv1ga2iP6U9igHQYWORbL4RS
 +EzXh+64VvCbDKTCPga7qh7Dww==
X-Google-Smtp-Source: ABdhPJyboEGZAaF6RXm5GpaE/mKR6TYvk3Fye/goK+ikDC5z1N0gxsGJDDrfdepMKqxed6kq885b0w==
X-Received: by 2002:a5d:60cb:: with SMTP id x11mr1737733wrt.281.1597909761789; 
 Thu, 20 Aug 2020 00:49:21 -0700 (PDT)
Received: from dell ([95.149.164.62])
 by smtp.gmail.com with ESMTPSA id s2sm2438068wrr.55.2020.08.20.00.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 00:49:21 -0700 (PDT)
Date: Thu, 20 Aug 2020 08:49:16 +0100
From: Lee Jones <lee.jones@linaro.org>
To: dinghao.liu@zju.edu.cn
Subject: Re: Re: Re: [PATCH] video: backlight: sky81452-backlight: Fix
 reference count imbalance on error
Message-ID: <20200820074916.GE3248864@dell>
References: <321fb03d-2307-7f60-f437-cfb99184dfd6@web.de>
 <20200819165702.GC3248864@dell>
 <217e3c0c.b58c.17409fd7496.Coremail.dinghao.liu@zju.edu.cn>
 <20200820062301.GD3248864@dell>
 <3f9fbdb1.bc96.1740a9560d5.Coremail.dinghao.liu@zju.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3f9fbdb1.bc96.1740a9560d5.Coremail.dinghao.liu@zju.edu.cn>
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Gyungoh Yoo <jack.yoo@skyworksinc.com>, Bryan Wu <cooloney@gmail.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Markus Elfring <Markus.Elfring@web.de>,
 Jingoo Han <jingoohan1@gmail.com>, Kangjie Lu <kjlu@umn.edu>,
 Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMCBBdWcgMjAyMCwgZGluZ2hhby5saXVAemp1LmVkdS5jbiB3cm90ZToKCj4gPiBP
biBUaHUsIDIwIEF1ZyAyMDIwLCBkaW5naGFvLmxpdUB6anUuZWR1LmNuIHdyb3RlOgo+ID4gCj4g
PiA+ID4gT24gV2VkLCAxOSBBdWcgMjAyMCwgTWFya3VzIEVsZnJpbmcgd3JvdGU6Cj4gPiA+ID4g
Cj4gPiA+ID4gPiA+IFdoZW4gb2ZfcHJvcGVydHlfcmVhZF91MzJfYXJyYXkoKSByZXR1cm5zIGFu
IGVycm9yIGNvZGUsCj4gPiA+ID4gPiA+IGEgcGFpcmluZyByZWZjb3VudCBkZWNyZW1lbnQgaXMg
bmVlZGVkIHRvIGtlZXAgbnAncyByZWZjb3VudCBiYWxhbmNlZC4KPiA+ID4gPiA+IAo+ID4gPiA+
ID4gQ2FuIGFub3RoZXIgaW1wZXJhdGl2ZSB3b3JkaW5nIGJlIGhlbHBmdWwgZm9yIHRoZSBjaGFu
Z2UgZGVzY3JpcHRpb24/Cj4gPiA+ID4gPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9Eb2N1bWVudGF0aW9uL3By
b2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdD9pZD0xODQ0NWJmNDA1Y2IzMzExMTdiYzk4NDI3
YjFiYTZmMTI0MThhZDE3I24xNTEKPiA+ID4gPiA+IAo+ID4gPiA+ID4gV291bGQgYW4gb3RoZXIg
Y29tbWl0IG1lc3NhZ2UgYmUgYSBiaXQgbmljZXI/Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IAo+ID4g
PiA+ID4g4oCmCj4gPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3NreTgx
NDUyLWJhY2tsaWdodC5jCj4gPiA+ID4gPiA+IEBAIC0yMTcsNiArMjE3LDcgQEAgc3RhdGljIHN0
cnVjdCBza3k4MTQ1Ml9ibF9wbGF0Zm9ybV9kYXRhICpza3k4MTQ1Ml9ibF9wYXJzZV9kdCgKPiA+
ID4gPiA+ID4gIAkJCQkJbnVtX2VudHJ5KTsKPiA+ID4gPiA+ID4gIAkJaWYgKHJldCA8IDApIHsK
PiA+ID4gPiA+ID4gIAkJCWRldl9lcnIoZGV2LCAibGVkLXNvdXJjZXMgbm9kZSBpcyBpbnZhbGlk
LlxuIik7Cj4gPiA+ID4gPiA+ICsJCQlvZl9ub2RlX3B1dChucCk7Cj4gPiA+ID4gPiA+ICAJCQly
ZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsKPiA+ID4gPiA+ID4gIAkJfQo+ID4gPiA+ID4gCj4gPiA+
ID4gPiBJIHByb3Bvc2UgdG8gYWRkIHRoZSBqdW1wIHRhcmdldCDigJxwdXRfbm9kZeKAnSBzbyB0
aGF0IGEgYml0IG9mIGNvbW1vbiBleGNlcHRpb24KPiA+ID4gPiA+IGhhbmRsaW5nIGNvZGUgY2Fu
IGJlIGJldHRlciByZXVzZWQgYXQgdGhlIGVuZCBvZiB0aGlzIGZ1bmN0aW9uIGltcGxlbWVudGF0
aW9uLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBSZWdhcmRzLAo+ID4gPiA+ID4gTWFya3VzCj4gPiA+
ID4gCj4gPiA+ID4gWW91IGNhbiBzYWZlbHkgaWdub3JlIGFueSByZXZpZXcgY29tbWVudHMgZnJv
bSBNYXJrdXMhCj4gPiA+ID4gCj4gPiA+ID4gSG93ZXZlciwgdGhpcyBwYXRjaCBkb2Vzbid0IGFw
cGVhciB0byBiZSBpbiBteSBpbmJveC4KPiA+ID4gPiAKPiA+ID4gPiBBbnkgaWRlYXMgYXMgdG8g
d2h5Pwo+ID4gPiA+IAo+ID4gPiAKPiA+ID4gVGhhbmsgeW91IGZvciB5b3VyIGFkdmljZS4gTXkg
b3V0Ym94IHNob3dzIHRoYXQgdGhpcyBwYXRjaAo+ID4gPiBoYXMgcmVhY2hlZCB5b3VyIGVtYWls
IHNlcnZlciBzdWNjZXNzZnVsbHkuIE1heWJlIHRoaXMKPiA+ID4gZW5kZWQgdXAgaW4geW91ciBq
dW5rIG1haWwgZmlsZT8KPiA+IAo+ID4gVGhpcyBoYXMgaGFwcGVuZWQgcmVjZW50bHksIHNvIEkg
d2FzIHN1cmUgdG8gY2hlY2suCj4gPiAKPiA+IE5vdCB0aGVyZSBlaXRoZXIgdW5mb3J0dW5hdGVs
eS4KPiA+IAo+ID4gV291bGQgeW91IGJlIGtpbmQgZW5vdWdoIHRvIGJvdW5jZS9yZXNlbmQgcGxl
YXNlPwo+IAo+IFN1cmUuCgpMb29rcyBsaWtlIHlvdSBzZW50IGl0ICpvbmx5KiB0byBtZS4gIFBs
ZWFzZSBrZWVwIGV2ZXJ5b25lIGVsc2UgaW4gQ2MKd2hlbiBkb2luZyB0aGF0LCBvciBJIGNhbid0
IHJlc3BvbmQgdG8gZXZlcnlvbmUuCgpBbnl3YXksIGJlc2lkZXMgdGhlIHN1YmplY3QgbGluZSAo
d2hpY2ggSSBjYW4gZml4IGVhc2lseSksIHRoZSBwYXRjaApsb29rcyBnb29kIHRvIG1lLCBidXQg
RGFuaWVsIFQgbXVzdCByZXZpZXcuCgpSZXZpZXdlZC1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNA
bGluYXJvLm9yZz4KCi0tCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExl
YWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdh
cmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
