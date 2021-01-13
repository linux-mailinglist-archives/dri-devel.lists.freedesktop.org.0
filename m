Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 473D42F4F05
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 16:45:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 590E5897F5;
	Wed, 13 Jan 2021 15:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F1E897F5
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 15:45:06 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id d13so2586387wrc.13
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 07:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=jilZrI+RmYVgG4Z+y9i7C0wTauSiN6ryBINcA136TDY=;
 b=pHbMHZsbRZqCJZNHIj5Q4eo3iNWwbm8uio2Df/L7M2KkVfbI9hxA0dQ7Wqj91kaUvj
 NGR65+VNC001MYb7eUoVV1U7w6/pIV1+DXzNE3aTqyjXYyDn+9roJ1sOtYWBQuXlbFZn
 6EGT9CT0+OnFPtxxTXTq7Dzu7ltn9FtRJOr0n2+CW7EkVB3fnFQBrCnxjvmF02MxXNXc
 qlb35Xo7TMuqFIR/kKgTON2Nmoiz4SJRVwDuVYy83YVASKZLeYAA3eUMp0fa6AObRRJW
 5HKgxBHw9tgv2Y33Bxcj5ernIaUEQahlymZ4m3AGRt0dRDf7855cNxMbDEK1vulxQb5s
 6Liw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jilZrI+RmYVgG4Z+y9i7C0wTauSiN6ryBINcA136TDY=;
 b=lC15XO/PBNx3igAtW722SjTqKTEt1DshaBvEIDTqdA3TzqqravrqvrJYE1RZknor0L
 2EmpaPNdtnk7KwqAJ/2wwP0ZF7OZpHazFMTls++Cbp6Q85OR86vWWkI+EKmPssQTMbyQ
 I4EGNbRII0GCkXsnu4eiYzOMs2fsKHaJtkkC1y9kphfU2U/YmY0mvi3+jLkoGw6qHUzD
 DIiuXrySiNkY/ry+81zTfng2gDQ9dUgCJgjEX9CKD1R/Nf/dZl7bgPXLfgwhyi+w+QLj
 Ba8aYZolm0kbNh4AyzIs4qFstLg/b4Qj44gWXO/L+eq3UyBLPhVjMPMftncCkerpVqz2
 vPmg==
X-Gm-Message-State: AOAM530G+PEmRWdpeDgf4Igp7a1P6JnGAyvGsJs0+jI4EzQDSTBOI9lW
 aMs+T2uIiqz++EMQ4Y6YgZ5sVseda2rkYJ7P
X-Google-Smtp-Source: ABdhPJzqrERn/dDttB73B0YdhAneozcMUw1VFgp6txkY+IVWPvM27AcW7s9nl/hMjf+ddsQJc1qKww==
X-Received: by 2002:adf:ef01:: with SMTP id e1mr3227461wro.59.1610552705461;
 Wed, 13 Jan 2021 07:45:05 -0800 (PST)
Received: from dell ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id 14sm3397949wmk.37.2021.01.13.07.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 07:45:04 -0800 (PST)
Date: Wed, 13 Jan 2021 15:45:03 +0000
From: Lee Jones <lee.jones@linaro.org>
To: =?iso-8859-1?Q?Dani=EBl?= Mantione <daniel.mantione@freepascal.org>
Subject: Re: [PATCH 14/31] video: fbdev: aty: mach64_ct: Remove some set but
 unused variables
Message-ID: <20210113154503.GD3975472@dell>
References: <20210113145009.1272040-1-lee.jones@linaro.org>
 <20210113145009.1272040-15-lee.jones@linaro.org>
 <alpine.DEB.2.21.2101131618160.8079@idefix.freepascal.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2101131618160.8079@idefix.freepascal.org>
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxMyBKYW4gMjAyMSwgRGFuacOrbCBNYW50aW9uZSB3cm90ZToKCj4gSGksCj4gCj4g
SWYgSSByZW1lbWJlciB3ZWxsLCB0aGUgcmVtb3ZlZCBsaW5lcyBoYXZlIHRvIGRvIHdpdGggdGhl
IFZHQS9hY2NlbGVyYXRvcgo+IG1vZGUgb2YgdGhlIGNoaXAuIFRoZSBjdXJyZW50IGRyaXZlciBh
bHdheXMgcnVucyB0aGUgY2hpcCBpbiBhY2NlbGVyYXRvcgo+IG1vZGUuIFN1cHBvc2UgeW91IHdv
dWxkIHdhbnQgdG8gc3VwcG9ydCBoaWdoIHJlc29sdXRpb24gaGFyZHdhcmUgdGV4dCBtb2Rlcwo+
IHdpdGggdGhlIGRyaXZlciAoZmJkZXYgYnBwPTApLCB0aGVuIHlvdSB3b3VsZCBuZWVkIHRvIHN3
aXRjaCB0aGUgY2hpcCBpbnRvCj4gVkdBIG1vZGUgbW9kZSBhbmQgdGhlbiB0aGUgcmVtb3ZlZCBs
aW5lcyBiZWNvbWUgcmVsZXZhbnQuCj4gCj4gSSBkaWQgc29tZSBleHBlcmltZW50cyB3aXRoIHRo
aXMgd2hlbiBJIHdhcyB3b3JraW5nIG9uIHRoZSBkcml2ZXIsIGJ1dAo+IGJlY2F1c2UgdGhlIGRv
Y3VtZW50YXRpb24gd2FzIHNpbGVudCBhYm91dCB0aGUgYmVoYXZpb3VyIG9mIGV4dGVuZGVkIENS
VEMKPiByZWdpc3RlcnMgaW4gVkdBIG1vZGUsIEkgZmFpbGVkIHRvIG1ha2UgaGFyZHdhcmUgdGV4
dCBtb2RlcyB0byB3b3JrCj4gcHJvcGVybHkuCj4gCj4gVGhlICNpZiAwIHdhcyB0aGVyZSBzbyBj
b2RlIHdhcyBhbHJlYWR5IHRoZXJlIGluIGNhc2UgbWUgb3Igc29tZW9uZSBlbHNlCj4gd291bGQg
cGljayBpdCB1cCBhZ2Fpbi4KClRoaXMgY29kZSBoYXMgYmVlbiBjb21tZW50ZWQgb3V0IGZvciAq
YXQgbGVhc3QqIDE2IHllYXJzLgoKUHJvYmFibHkgdGltZSB0byBsZXQgaXQgZ28uIDopCgo+IEJl
c3QgcmVnYXJkcywKPiAKPiBEYW5pw6tsIE1hbnRpb25lCj4gCj4gT3AgV2VkLCAxMyBKYW4gMjAy
MSwgc2NocmVlZiBMZWUgSm9uZXM6Cj4gCj4gPiBGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBrZXJu
ZWwgYnVpbGQgd2FybmluZyhzKToKPiA+IAo+ID4gZHJpdmVycy92aWRlby9mYmRldi9hdHkvbWFj
aDY0X2N0LmM6IEluIGZ1bmN0aW9uIOKAmGF0eV9pbml0X3BsbF9jdOKAmToKPiA+IGRyaXZlcnMv
dmlkZW8vZmJkZXYvYXR5L21hY2g2NF9jdC5jOjQwNTo0Njogd2FybmluZzogdmFyaWFibGUg4oCY
dmdhX2RzcF9vbl9vZmbigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJp
YWJsZV0KPiA+IGRyaXZlcnMvdmlkZW8vZmJkZXYvYXR5L21hY2g2NF9jdC5jOjQwNTozMDogd2Fy
bmluZzogdmFyaWFibGUg4oCYdmdhX2RzcF9jb25maWfigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1
bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPiA+IGRyaXZlcnMvdmlkZW8vZmJkZXYvYXR5L21hY2g2
NF9jdC5jOjQwNToxODogd2FybmluZzogdmFyaWFibGUg4oCYZHNwX29uX29mZuKAmSBzZXQgYnV0
IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQo+ID4gCj4gPiBDYzogZGFuaWVs
Lm1hbnRpb25lQGZyZWVwYXNjYWwub3JnCj4gPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+ID4gQ2M6IGxpbnV4LWZiZGV2QHZnZXIua2VybmVsLm9yZwo+ID4gU2lnbmVkLW9m
Zi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KPiA+IC0tLQo+ID4gZHJpdmVy
cy92aWRlby9mYmRldi9hdHkvbWFjaDY0X2N0LmMgfCAxOSArKy0tLS0tLS0tLS0tLS0tLS0tCj4g
PiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKPiA+IAo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvYXR5L21hY2g2NF9jdC5jIGIvZHJp
dmVycy92aWRlby9mYmRldi9hdHkvbWFjaDY0X2N0LmMKPiA+IGluZGV4IGY4N2NjODFmNGZhMmIu
LjIzZWVjZWNhMWU5ZDcgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2F0eS9t
YWNoNjRfY3QuYwo+ID4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9hdHkvbWFjaDY0X2N0LmMK
PiA+IEBAIC00MDIsNyArNDAyLDcgQEAgc3RhdGljIGludCBhdHlfaW5pdF9wbGxfY3QoY29uc3Qg
c3RydWN0IGZiX2luZm8gKmluZm8sIHVuaW9uIGF0eV9wbGwgKnBsbCkKPiA+IAlzdHJ1Y3QgYXR5
ZmJfcGFyICpwYXIgPSAoc3RydWN0IGF0eWZiX3BhciAqKSBpbmZvLT5wYXI7Cj4gPiAJdTggbXBv
c3RfZGl2LCB4cG9zdF9kaXYsIHNjbGtfcG9zdF9kaXZfcmVhbDsKPiA+IAl1MzIgcSwgbWVtY250
bCwgdHJwOwo+ID4gLQl1MzIgZHNwX2NvbmZpZywgZHNwX29uX29mZiwgdmdhX2RzcF9jb25maWcs
IHZnYV9kc3Bfb25fb2ZmOwo+ID4gKwl1MzIgZHNwX2NvbmZpZzsKPiA+ICNpZmRlZiBERUJVRwo+
ID4gCWludCBwbGxtY2xrLCBwbGxzY2xrOwo+ID4gI2VuZGlmCj4gPiBAQCAtNDg4LDI1ICs0ODgs
MTAgQEAgc3RhdGljIGludCBhdHlfaW5pdF9wbGxfY3QoY29uc3Qgc3RydWN0IGZiX2luZm8gKmlu
Zm8sIHVuaW9uIGF0eV9wbGwgKnBsbCkKPiA+IAo+ID4gCS8qIEFsbG93IEJJT1MgdG8gb3ZlcnJp
ZGUgKi8KPiA+IAlkc3BfY29uZmlnID0gYXR5X2xkX2xlMzIoRFNQX0NPTkZJRywgcGFyKTsKPiA+
IC0JZHNwX29uX29mZiA9IGF0eV9sZF9sZTMyKERTUF9PTl9PRkYsIHBhcik7Cj4gPiAtCXZnYV9k
c3BfY29uZmlnID0gYXR5X2xkX2xlMzIoVkdBX0RTUF9DT05GSUcsIHBhcik7Cj4gPiAtCXZnYV9k
c3Bfb25fb2ZmID0gYXR5X2xkX2xlMzIoVkdBX0RTUF9PTl9PRkYsIHBhcik7Cj4gPiAKPiA+IAlp
ZiAoZHNwX2NvbmZpZykKPiA+IAkJcGxsLT5jdC5kc3BfbG9vcF9sYXRlbmN5ID0gKGRzcF9jb25m
aWcgJiBEU1BfTE9PUF9MQVRFTkNZKSA+PiAxNjsKPiA+IC0jaWYgMAo+ID4gLQlGSVhNRTogaXMg
aXQgcmVsZXZhbnQgZm9yIHVzPwo+ID4gLQlpZiAoKCFkc3Bfb25fb2ZmICYmICFNNjRfSEFTKFJF
U0VUXzNEKSkgfHwKPiA+IC0JCSgoZHNwX29uX29mZiA9PSB2Z2FfZHNwX29uX29mZikgJiYKPiA+
IC0JCSghZHNwX2NvbmZpZyB8fCAhKChkc3BfY29uZmlnIF4gdmdhX2RzcF9jb25maWcpICYgRFNQ
X1hDTEtTX1BFUl9RVykpKSkgewo+ID4gLQkJdmdhX2RzcF9vbl9vZmYgJj0gVkdBX0RTUF9PRkY7
Cj4gPiAtCQl2Z2FfZHNwX2NvbmZpZyAmPSBWR0FfRFNQX1hDTEtTX1BFUl9RVzsKPiA+IC0JCWlm
IChBVElEaXZpZGUodmdhX2RzcF9vbl9vZmYsIHZnYV9kc3BfY29uZmlnLCA1LCAxKSA+IDI0KQo+
ID4gLQkJCXBsbC0+Y3QuZmlmb19zaXplID0gMzI7Cj4gPiAtCQllbHNlCj4gPiAtCQkJcGxsLT5j
dC5maWZvX3NpemUgPSAyNDsKPiA+IC0JfQo+ID4gLSNlbmRpZgo+ID4gKwo+ID4gCS8qIEV4aXQg
aWYgdGhlIHVzZXIgZG9lcyBub3Qgd2FudCB1cyB0byB0YW1wZXIgd2l0aCB0aGUgY2xvY2sKPiA+
IAlyYXRlcyBvZiBoZXIgY2hpcC4gKi8KPiA+IAlpZiAocGFyLT5tY2xrX3BlciA9PSAwKSB7CgoK
LS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9w
ZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBT
b0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
