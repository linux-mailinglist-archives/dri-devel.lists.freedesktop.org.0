Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9222AB2CB
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 09:52:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E068967A;
	Mon,  9 Nov 2020 08:52:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEFAB893D5
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 05:10:17 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id q10so7013386pfn.0
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Nov 2020 21:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=XgmwVftW1h6VXvLFHyQ3D2f7dAvQEabg59R1W+Mex10=;
 b=HyJFeNy9dRofz/VIB02kKnHQ0GZ5T+96JVvhYzk10jI5ctp9i7zGwjha0J9RvT7KoS
 2pc97Wdrzsn3PyolfwPehIR6O2LtT+VwOUIxiVaNxCqFhlkx612Ci8AYFO6PcqbGvQrV
 N6KFFNtsuGn9CFEnzWrff+eXgA4jRD0J1w1EFt+NwY3ZWJBjfZw9+PHLeLfm2io1Nn/V
 Kh/3YaDQmTGBwyacSRhSPhXy6GHls0BoTJcsdaXKvYkli5kqPDght02p1aMejDD0uQXp
 CmTemGtBgOzJfqUVfFZlkKFA7ogWF1ZmjSAhv8iADJbcpOm7EQ1TTBPscIh1rHcB20RM
 nMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=XgmwVftW1h6VXvLFHyQ3D2f7dAvQEabg59R1W+Mex10=;
 b=qwZkgAaTqy+oVYNYNmIOLZFCX/ByPj4aos4VqDm5ak2SGRhahzVHiPphdEguvsnr4W
 0UkwWHHHHsCBZdf5a93K2+OneAZV2NYBNphh22yOnD8Zz26TgooRr9df1/ezj938Rq7x
 aUkFzF4yNvyaDL+FPPbzV5EmWNQMZEPsV3TL4wydNK7Q5gQu3gaTn1byGDsn9Sray22g
 t4I9yYi8y0kTS25GdDatO67wLAeHwwSS1jl+QofdFPqMnlNGthZXdH5iiwRVbXApP8js
 2LbDMBLjHL8roI590mNCyPL11k2YX9HHOEKfSG8zMrkqcT8fZtIt5BepO6OyycAiR4xn
 kv1g==
X-Gm-Message-State: AOAM5318KQNU7CdHHJhQQ3nBnzd7+NKhu2tuA/c3rGGs7OFSS30sT+fO
 7fd5pFRubItB942e6D9E4apVYQ==
X-Google-Smtp-Source: ABdhPJwnxG147TJFSih2GdY+A04gFXZv8tlsN8MpSlH/99hporLJc8G2uIV3/sv7vMfOI3DyYFWFvg==
X-Received: by 2002:a63:380b:: with SMTP id f11mr11374932pga.198.1604898617255; 
 Sun, 08 Nov 2020 21:10:17 -0800 (PST)
Received: from localhost ([122.172.12.172])
 by smtp.gmail.com with ESMTPSA id s23sm8781212pgl.47.2020.11.08.21.10.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 08 Nov 2020 21:10:16 -0800 (PST)
Date: Mon, 9 Nov 2020 10:40:14 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 17/30] mmc: sdhci-tegra: Support OPP and core voltage
 scaling
Message-ID: <20201109051014.oa6bt4g3ctm2hnuy@vireshk-i7>
References: <20201104234427.26477-1-digetx@gmail.com>
 <20201104234427.26477-18-digetx@gmail.com>
 <CAOh2x==sy1w7_oEV8=toC6uQnSN44wyOixbP_X0BrMsnm1AUFg@mail.gmail.com>
 <6fa54ce6-d5ae-d04f-7c77-b62c148d92b7@gmail.com>
 <20201106061513.uyys7njcqcdlah67@vireshk-i7>
 <a6926456-8bce-a438-bfaa-be334208f004@gmail.com>
 <CAEExFWsp0DWw1yO84e3vzr_YZkqkd+pyPfQQR3J2W6n3wTX4Jw@mail.gmail.com>
 <20201109050010.g47zojh6wafvwqva@vireshk-i7>
 <c584b301-e052-7f01-335d-8f9160865198@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c584b301-e052-7f01-335d-8f9160865198@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Mon, 09 Nov 2020 08:52:30 +0000
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
Cc: Peter Chen <Peter.Chen@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-pwm@vger.kernel.org, Frank Lee <tiny.windzz@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 driver-dev <devel@driverdev.osuosl.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Alan Stern <stern@rowland.harvard.edu>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-media@vger.kernel.org, DTML <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 "open list:SECURE DIGITAL HO..." <linux-mmc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDktMTEtMjAsIDA4OjA4LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMDkuMTEuMjAyMCAw
ODowMCwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gPiBPbiAwNi0xMS0yMCwgMjE6NDEsIEZy
YW5rIExlZSB3cm90ZToKPiA+PiBPbiBGcmksIE5vdiA2LCAyMDIwIGF0IDk6MTggUE0gRG1pdHJ5
IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPiB3cm90ZToKPiA+Pj4KPiA+Pj4gMDYuMTEuMjAy
MCAwOToxNSwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gPj4+PiBTZXR0aW5nIHJlZ3VsYXRv
cnMgZm9yIGNvdW50IGFzIDAgZG9lc24ndCBzb3VuZCBnb29kIHRvIG1lLgo+ID4+Pj4KPiA+Pj4+
IEJ1dCwgSSB1bmRlcnN0YW5kIHRoYXQgeW91IGRvbid0IHdhbnQgdG8gaGF2ZSB0aGF0IGlmICho
YXZlX3JlZ3VsYXRvcikKPiA+Pj4+IGNoZWNrLCBhbmQgaXQgaXMgYSBmYWlyIHJlcXVlc3QuIFdo
YXQgSSB3aWxsIGluc3RlYWQgZG8gaXMsIGFsbG93IGFsbAo+ID4+Pj4gZGV2X3BtX29wcF9wdXQq
KCkgQVBJIHRvIHN0YXJ0IGFjY2VwdGluZyBhIE5VTEwgcG9pbnRlciBmb3IgdGhlIE9QUAo+ID4+
Pj4gdGFibGUgYW5kIGZhaWwgc2lsZW50bHkuIEFuZCBzbyB5b3Ugd29uJ3QgYmUgcmVxdWlyZWQg
dG8gaGF2ZSB0aGlzCj4gPj4+PiB1bndhbnRlZCBjaGVjay4gQnV0IHlvdSB3aWxsIGJlIHJlcXVp
cmVkIHRvIHNhdmUgdGhlIHBvaW50ZXIgcmV0dXJuZWQKPiA+Pj4+IGJhY2sgYnkgZGV2X3BtX29w
cF9zZXRfcmVndWxhdG9ycygpLCB3aGljaCBpcyB0aGUgcmlnaHQgdGhpbmcgdG8gZG8KPiA+Pj4+
IGFueXdheXMuCj4gPj4+Cj4gPj4+IFBlcmhhcHMgZXZlbiBhIGJldHRlciB2YXJpYW50IGNvdWxk
IGJlIHRvIGFkZCBhIGRldm0gdmVyc2lvbnMgb2YgdGhlIE9QUAo+ID4+PiBBUEkgZnVuY3Rpb25z
LCB0aGVuIGRyaXZlcnMgd29uJ3QgbmVlZCB0byBjYXJlIGFib3V0IHN0b3JpbmcgdGhlCj4gPj4+
IG9wcF90YWJsZSBwb2ludGVyIGlmIGl0J3MgdW51c2VkIGJ5IGRyaXZlcnMuCj4gPj4KPiA+PiBJ
IHRoaW5rIHNvLiBUaGUgY29uc3VtZXIgbWF5IG5vdCBiZSBzbyBjb25jZXJuZWQgYWJvdXQgdGhl
IHN0YXR1cyBvZgo+ID4+IHRoZXNlIE9QUCB0YWJsZXMuCj4gPj4gSWYgdGhlIGRyaXZlciBuZWVk
cyB0byBtYW5hZ2UgdGhlIHJlbGVhc2UsIGl0IG5lZWRzIHRvIGFkZCBhIHBvaW50ZXIKPiA+PiB0
byB0aGVpciBkcml2ZXIgZ2xvYmFsIHN0cnVjdHVyZS4KPiA+Pgo+ID4+IE1heWJlIGl0J3Mgd29y
dGggaGF2aW5nIHRoZXNlIGRldm0gaW50ZXJmYWNlcyBmb3Igb3BwLgo+ID4gCj4gPiBTdXJlIGlm
IHRoZXJlIGFyZSBlbm91Z2ggdXNlcnMgb2YgdGhpcywgSSBhbSBhbGwgZm9yIGl0LiBJIHdhcyBm
aW5lCj4gPiB3aXRoIHRoZSBwYXRjaGVzIHlvdSBzZW50LCBqdXN0IHRoYXQgdGhlcmUgd2VyZSBu
b3QgYSBsb3Qgb2YgdXNlcnMgb2YKPiA+IGl0IGFuZCBzbyBJIHB1c2hlZCB0aGVtIGJhY2suIElm
IHdlIGZpbmQgdGhhdCB3ZSBoYXZlIG1vcmUgdXNlcnMgb2YgaXQKPiA+IG5vdywgd2UgY2FuIHN1
cmVseSBnZXQgdGhhdCBiYWNrLgo+ID4gCj4gCj4gVGhlcmUgd2FzIGFscmVhZHkgYXR0ZW1wdCB0
byBhZGQgdGhlIGRldm0/IENvdWxkIHlvdSBwbGVhc2UgZ2l2ZSBtZSBhCj4gbGluayB0byB0aGUg
cGF0Y2hlcz8KPiAKPiBJIGFscmVhZHkgcHJlcGFyZWQgYSBwYXRjaCB3aGljaCBhZGRzIHRoZSBk
ZXZtIGhlbHBlcnMuIEl0IGhlbHBzIHRvIGtlZXAKPiBjb2RlIGNsZWFuZXIgYW5kIHJlYWRhYmxl
LgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIwMTAxMjEzNTUxNy4xOTQ2OC0xLWZy
YW5rQGFsbHdpbm5lcnRlY2guY29tLwoKLS0gCnZpcmVzaApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
