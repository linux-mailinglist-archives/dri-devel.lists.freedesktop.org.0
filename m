Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF781BF2DD
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 10:32:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67CA56EB7C;
	Thu, 30 Apr 2020 08:32:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87FC16EB7C
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 08:32:23 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id x4so861794wmj.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 01:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=K+vWPrptIKkKITr7qASmWRPYsOz+1iNkbfft/VKjXmE=;
 b=EZ/UoognWxfkpZBPdsHbAlI2p9tnzlAGH7GmFNmJTh5AsVVrZD7cCh9eEmkbqNh75J
 /EeQbJ43MZpAZENeKqZhWpcYHPltg60TbKNTDPAqPjn2HY+YwuYyFIyasTlWA5KDtG2g
 3mJpjbNYCixXU4VrfrRm8SEsuliLkuQ6T3LYl73ZaiyN28cLKlpI9kJ4hOzB2s3tqglH
 axm4K3wI6ftl4Aaq7y66LWyFEd0jbiQmFi8AH1sU4fR2DIlFy1Zhs01DiwbQwR2ebG0s
 6TmXzde6CcnTxhcwVaTkPJ50uWEggKqcbsRd9ej8TmUoY68oBwJXaNHd1aVCskvaaS4w
 hXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=K+vWPrptIKkKITr7qASmWRPYsOz+1iNkbfft/VKjXmE=;
 b=V1ZqUCNTKqz3SBNpt/NxbuqxmzWMdOPTYFr6QDNtGpm0YlhQ/G3psoWwyUVxZ+4vfQ
 UObm4vmDep2MtOPnLAL4qfV2sQGLcfsqrlv2hPbOAFmBjXjLsaG23fjHXVVcVE35Yzrx
 9GMYRBUIxRIrH3Ep839r4KhAyifIxgh425HGrtJ7Ji1ZNyS38lko0CCiHdAbTJQo8iZ3
 p5o37IWGGGKCoaOa7ySpiHlKCC1kLfzLWTI4JrClbu3Z6NBqIwB7y0uqmxd0ABgjTrIU
 tZ+5ff2VpPglkmuDdYeLXpgfIERX1a730Wwc6hl8WjPMFPEm0XTeIOpDJr04OfgHIvOy
 kbZw==
X-Gm-Message-State: AGi0PuabJsIS5eCnLHPrblE0EOjOhpVZ9TJf4FBhmBy4+evhHdFV91Rz
 l7EGM1U6cKtiRNORKzBp+47X0A==
X-Google-Smtp-Source: APiQypLUpRZshEEcu1i2D211JBCtZvOfsCfE03zoLPm/UNh+5L2j4DCkoFUToTY0doJ7L5YnRmYMUQ==
X-Received: by 2002:a1c:4346:: with SMTP id q67mr1678873wma.162.1588235542117; 
 Thu, 30 Apr 2020 01:32:22 -0700 (PDT)
Received: from dell ([2.31.163.63])
 by smtp.gmail.com with ESMTPSA id n131sm12061037wmf.35.2020.04.30.01.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 01:32:21 -0700 (PDT)
Date: Thu, 30 Apr 2020 09:32:19 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH 01/10] backlight: Add backlight_device_get_by_name()
Message-ID: <20200430083219.GC3118@dell>
References: <20200429124830.27475-1-noralf@tronnes.org>
 <20200429124830.27475-2-noralf@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429124830.27475-2-noralf@tronnes.org>
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
 Daniel Thompson <daniel.thompson@linaro.org>, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyOSBBcHIgMjAyMCwgTm9yYWxmIFRyw7hubmVzIHdyb3RlOgoKPiBBZGQgYSB3YXkg
dG8gbG9va3VwIGEgYmFja2xpZ2h0IGRldmljZSBiYXNlZCBvbiBpdHMgbmFtZS4KPiBXaWxsIGJl
IHVzZWQgYnkgYSBVU0IgZGlzcGxheSBnYWRnZXQgZ2V0dGluZyB0aGUgbmFtZSBmcm9tIGNvbmZp
Z2ZzLgo+IAo+IENjOiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+IENjOiBEYW5p
ZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgo+IENjOiBKaW5nb28gSGFu
IDxqaW5nb29oYW4xQGdtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBOb3JhbGYgVHLDuG5uZXMg
PG5vcmFsZkB0cm9ubmVzLm9yZz4KPiAtLS0KPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvYmFj
a2xpZ2h0LmMgfCAyMSArKysrKysrKysrKysrKysrKysrKysKPiAgaW5jbHVkZS9saW51eC9iYWNr
bGlnaHQuaCAgICAgICAgICAgfCAgMSArCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9u
cygrKQoKT25jZSByZXZpZXdlZCwgY2FuIHRoaXMgcGF0Y2ggYmUgYXBwbGllZCBvbiBpdHMgb3du
PwoKTXkgZ3Vlc3MgaXMgdGhhdCBpdCBjYW4ndCwgYXMgdGhlIG90aGVyIHBhdGNoZXMgaW4gdGhp
cyBzZXQgZGVwZW5kIG9uCml0LCByaWdodD8gIElmIHRoaXMgYXNzdW1wdGlvbiBpcyB0cnVlLCB5
b3UgbmVlZCB0byBzZW5kIG1lIHRoZSByZXN0Cm9mIHRoZSBzZXQuCgpGWUk6IEl0J3Mgbm9ybWFs
bHkgYmV0dGVyIHRvIHNlbmQgdGhlIHdob2xlIHNldCB0byBldmVyeW9uZSwgYXMgaXQKcHJvdmlk
ZXMgdmlzaWJpbGl0eSBvbiBjdXJyZW50IHJldmlldyAob3IgbGFjayB0aGVyZSBvZikgc3RhdHVz
IG9mIHRoZQpvdGhlciBwYXRjaGVzIGFuZCBhbGxvd3MgZWFjaCBvZiB0aGUgbWFpbnRhaW5lcnMg
dG8gZGlzY3VzcyBwb3NzaWJsZQptZXJnZSBzdHJhdGVnaWVzLgoKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy92aWRlby9iYWNrbGlnaHQvYmFja2xpZ2h0LmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdo
dC9iYWNrbGlnaHQuYwo+IGluZGV4IGNhYzNlMzVkNzYzMC4uOTJkODBhYTBjMGVmIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2JhY2tsaWdodC5jCj4gKysrIGIvZHJpdmVy
cy92aWRlby9iYWNrbGlnaHQvYmFja2xpZ2h0LmMKPiBAQCAtNDMyLDYgKzQzMiwyNyBAQCBzdHJ1
Y3QgYmFja2xpZ2h0X2RldmljZSAqYmFja2xpZ2h0X2RldmljZV9nZXRfYnlfdHlwZShlbnVtIGJh
Y2tsaWdodF90eXBlIHR5cGUpCj4gIH0KPiAgRVhQT1JUX1NZTUJPTChiYWNrbGlnaHRfZGV2aWNl
X2dldF9ieV90eXBlKTsKPiAgCj4gKy8qKgo+ICsgKiBiYWNrbGlnaHRfZGV2aWNlX2dldF9ieV9u
YW1lIC0gR2V0IGJhY2tsaWdodCBkZXZpY2UgYnkgbmFtZQo+ICsgKiBAbmFtZTogRGV2aWNlIG5h
bWUKPiArICoKPiArICogVGhpcyBmdW5jdGlvbiBsb29rcyB1cCBhIGJhY2tsaWdodCBkZXZpY2Ug
YnkgaXRzIG5hbWUuIEl0IG9idGFpbnMgYSByZWZlcmVuY2UKPiArICogb24gdGhlIGJhY2tsaWdo
dCBkZXZpY2UgYW5kIGl0IGlzIHRoZSBjYWxsZXIncyByZXNwb25zaWJpbGl0eSB0byBkcm9wIHRo
ZQo+ICsgKiByZWZlcmVuY2UgYnkgY2FsbGluZyBiYWNrbGlnaHRfcHV0KCkuCj4gKyAqCj4gKyAq
IFJldHVybnM6Cj4gKyAqIEEgcG9pbnRlciB0byB0aGUgYmFja2xpZ2h0IGRldmljZSBpZiBmb3Vu
ZCwgb3RoZXJ3aXNlIE5VTEwuCj4gKyAqLwo+ICtzdHJ1Y3QgYmFja2xpZ2h0X2RldmljZSAqYmFj
a2xpZ2h0X2RldmljZV9nZXRfYnlfbmFtZShjb25zdCBjaGFyICpuYW1lKQo+ICt7Cj4gKwlzdHJ1
Y3QgZGV2aWNlICpkZXY7Cj4gKwo+ICsJZGV2ID0gY2xhc3NfZmluZF9kZXZpY2VfYnlfbmFtZShi
YWNrbGlnaHRfY2xhc3MsIG5hbWUpOwo+ICsKPiArCXJldHVybiBkZXYgPyB0b19iYWNrbGlnaHRf
ZGV2aWNlKGRldikgOiBOVUxMOwo+ICt9Cj4gK0VYUE9SVF9TWU1CT0woYmFja2xpZ2h0X2Rldmlj
ZV9nZXRfYnlfbmFtZSk7Cj4gKwo+ICAvKioKPiAgICogYmFja2xpZ2h0X2RldmljZV91bnJlZ2lz
dGVyIC0gdW5yZWdpc3RlcnMgYSBiYWNrbGlnaHQgZGV2aWNlIG9iamVjdC4KPiAgICogQGJkOiB0
aGUgYmFja2xpZ2h0IGRldmljZSBvYmplY3QgdG8gYmUgdW5yZWdpc3RlcmVkIGFuZCBmcmVlZC4K
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9iYWNrbGlnaHQuaCBiL2luY2x1ZGUvbGludXgv
YmFja2xpZ2h0LmgKPiBpbmRleCBjN2Q2YjJlOGMzYjUuLjU2ZTQ1ODBkNGY1NSAxMDA2NDQKPiAt
LS0gYS9pbmNsdWRlL2xpbnV4L2JhY2tsaWdodC5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9iYWNr
bGlnaHQuaAo+IEBAIC0xOTAsNiArMTkwLDcgQEAgZXh0ZXJuIHZvaWQgYmFja2xpZ2h0X2ZvcmNl
X3VwZGF0ZShzdHJ1Y3QgYmFja2xpZ2h0X2RldmljZSAqYmQsCj4gIGV4dGVybiBpbnQgYmFja2xp
Z2h0X3JlZ2lzdGVyX25vdGlmaWVyKHN0cnVjdCBub3RpZmllcl9ibG9jayAqbmIpOwo+ICBleHRl
cm4gaW50IGJhY2tsaWdodF91bnJlZ2lzdGVyX25vdGlmaWVyKHN0cnVjdCBub3RpZmllcl9ibG9j
ayAqbmIpOwo+ICBleHRlcm4gc3RydWN0IGJhY2tsaWdodF9kZXZpY2UgKmJhY2tsaWdodF9kZXZp
Y2VfZ2V0X2J5X3R5cGUoZW51bSBiYWNrbGlnaHRfdHlwZSB0eXBlKTsKPiArc3RydWN0IGJhY2ts
aWdodF9kZXZpY2UgKmJhY2tsaWdodF9kZXZpY2VfZ2V0X2J5X25hbWUoY29uc3QgY2hhciAqbmFt
ZSk7Cj4gIGV4dGVybiBpbnQgYmFja2xpZ2h0X2RldmljZV9zZXRfYnJpZ2h0bmVzcyhzdHJ1Y3Qg
YmFja2xpZ2h0X2RldmljZSAqYmQsIHVuc2lnbmVkIGxvbmcgYnJpZ2h0bmVzcyk7Cj4gIAo+ICAj
ZGVmaW5lIHRvX2JhY2tsaWdodF9kZXZpY2Uob2JqKSBjb250YWluZXJfb2Yob2JqLCBzdHJ1Y3Qg
YmFja2xpZ2h0X2RldmljZSwgZGV2KQoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8g
U2VydmljZXMgVGVjaG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdh
cmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
