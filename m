Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 615921B5ABD
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 13:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E17816E421;
	Thu, 23 Apr 2020 11:49:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021916E422
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 11:49:02 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 188so6098683wmc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 04:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=rjW01n/0F1pq48CTP/7RBCJnvBUm1n1+dBjCEKk7Sxw=;
 b=n7xAau4OmWbWFYC04m1DGCYkqE4+ujUlYrO2eH1c3xFU2xNGc6oi4RD3AT/B2d7nDI
 C7PfeS2nJcKJ0NZJTLJy8/cwnheWSV+FBjoR4v93WQ2T6GLFdRDtwRsMhm8fe9LnpULC
 T5j3iPgoGN34P5ek69NAINSZ6j55zKbOaBdxgXELn4dt+7EJs0aQjZzoETX8CHcQjw1U
 XIvnwLiDbVkIrhg+b7GaWD4apUHnhqs3qAFKb8pbj7cHCtIBMSzXFoxyCRVtlluE0Myu
 C0AWjtgPwJ+pYX0X6ULNNKyH9t9bvcpEAVUPEaKFtUGTgllC5gYjxXt4h+usEziVQSl1
 sjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=rjW01n/0F1pq48CTP/7RBCJnvBUm1n1+dBjCEKk7Sxw=;
 b=D4l72ZyAAGq1HCOP0Oa3EwLN+2QnB6Tnb7DPVIPuy33oYCmvCqcfnMSmgj0jHh5F2p
 jLh65n0lB6OQJNH8qka6HRsFmXiES3uFwdr1LEFV5DTTkCyQpN5LGzxeOXo5j7JedNgv
 snvGik4D/lTkxo62FxQdrLPMJhhGj4P5HvlzSBYdTPyGru32kd33MKbbEUDdAToM0xj2
 ig8mfjtYKLQLw/CuheMMCRXqS99Dt4owcsmTDEHN5i37Ru6NZI2yp7rMZC99xo6KY03Z
 uVMTkPgPSxvGdwYJtMPKitmrExfGbvJMtq4QoTjnkxnmwgTB1Zu279iMbfDcvqWUIt0t
 TvnQ==
X-Gm-Message-State: AGi0PuZyMo09OFGJQanVuD8UGnPSqHTih7u3o8IVVLmulWRi5v5O+VCC
 kQA5BZYEnCmQUzYmyoQKgaiRWQ==
X-Google-Smtp-Source: APiQypK03THh2gyZohviWOB0K129EVNWgmmVHL3IdV6si+my+1X2cVHVYsC7MiqDYucu03GXE0fP+w==
X-Received: by 2002:a7b:c459:: with SMTP id l25mr3693104wmi.52.1587642540579; 
 Thu, 23 Apr 2020 04:49:00 -0700 (PDT)
Received: from dell ([2.31.163.63])
 by smtp.gmail.com with ESMTPSA id 1sm3289831wmz.13.2020.04.23.04.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 04:48:59 -0700 (PDT)
Date: Thu, 23 Apr 2020 12:48:57 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Guru Das Srinagesh <gurus@codeaurora.org>
Subject: Re: [PATCH v13 00/11] Convert PWM period and duty cycle to u64
Message-ID: <20200423114857.GG3612@dell>
References: <cover.1587523702.git.gurus@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1587523702.git.gurus@codeaurora.org>
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>, linux-fbdev@vger.kernel.org,
 David Collins <collinsd@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 David Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>,
 Kamil Debski <kamil@wypas.org>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Atish Patra <atish.patra@wdc.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alexander Shiyan <shc_work@mail.ru>, Chen-Yu Tsai <wens@csie.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Guenter Roeck <linux@roeck-us.net>,
 linux-media@vger.kernel.org, linux-pwm@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 intel-gfx@lists.freedesktop.org, Mark Brown <broonie@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
 Thomas Gleixner <tglx@linutronix.de>, Fabrice Gasnier <fabrice.gasnier@st.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Allison Randal <allison@lohutok.net>, linux-hwmon@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Fontana <rfontana@redhat.com>, Stephen Boyd <sboyd@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 Yash Shah <yash.shah@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Joe Perches <joe@perches.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMSBBcHIgMjAyMCwgR3VydSBEYXMgU3JpbmFnZXNoIHdyb3RlOgoKPiBbUkVRVUVT
VF0KPiAKPiBXb3VsZCBpdCBiZSBwb3NzaWJsZSBmb3IgdGhlIHBhdGNoZXMgdGhhdCBoYXZlIGFs
cmVhZHkgcmVjZWl2ZWQgQWNrZWQtYnkncyBpbgo+IHRoaXMgc2VyaWVzIHRvIGJlIGFjY2VwdGVk
IGFuZCBhcHBsaWVkIHRvIHRoZSB0cmVlPyBJIGxvc3QgYW4gQWNrZWQtYnkgKGluCj4gaW50ZWwt
cGFuZWwuYykgYmVjYXVzZSBpdCBoYWQgYSBtZXJnZSBjb25mbGljdCB3aXRoIGEgbmV3IGNoYW5n
ZSB0aGF0IGNhbWUgaW4KPiBhZnRlciBJIHJlYmFzZWQgdG8gdGlwLiBJIHdhc24ndCBzdXJlIGVh
cmxpZXIgYWJvdXQgYWNjZXB0aW5nIHNpbmdsZSBwYXRjaGVzIGFzCj4gb3Bwb3NlZCB0byB0aGUg
ZW50aXJlIHNlcmllcyBlbiBtYXNzZSwgYnV0IHRoaXMgZXZlbnQgaGFzIGdvdCBtZSB0aGlua2lu
Zy4KPiAKPiBbQ09WRVIgTEVUVEVSXQo+IAo+IEJlY2F1c2UgcGVyaW9kIGFuZCBkdXR5IGN5Y2xl
IGFyZSBkZWZpbmVkIGluIHRoZSBQV00gZnJhbWV3b3JrIHN0cnVjdHMgYXMgaW50cwo+IHdpdGgg
dW5pdHMgb2YgbmFub3NlY29uZHMsIHRoZSBtYXhpbXVtIHRpbWUgZHVyYXRpb24gdGhhdCBjYW4g
YmUgc2V0IGlzIGxpbWl0ZWQKPiB0byB+Mi4xNDcgc2Vjb25kcy4gQ29uc2VxdWVudGx5LCBhcHBs
aWNhdGlvbnMgZGVzaXJpbmcgdG8gc2V0IGdyZWF0ZXIgdGltZQo+IHBlcmlvZHMgdmlhIHRoZSBQ
V00gZnJhbWV3b3JrIGFyZSBub3QgYmUgYWJsZSB0byBkbyBzbyAtIGxpa2UsIGZvciBpbnN0YW5j
ZSwKPiBjYXVzaW5nIGFuIExFRCB0byBibGluayBhdCBhbiBpbnRlcnZhbCBvZiA1IHNlY29uZHMu
Cj4gCj4gUmVkZWZpbmluZyB0aGUgcGVyaW9kIGFuZCBkdXR5IGN5Y2xlIHN0cnVjdCBtZW1iZXJz
IGluIHRoZSBjb3JlIFBXTSBmcmFtZXdvcmsKPiBzdHJ1Y3RzIGFzIHU2NCB2YWx1ZXMgd2lsbCBl
bmFibGUgbGFyZ2VyIHRpbWUgZHVyYXRpb25zIHRvIGJlIHNldCBhbmQgc29sdmUKPiB0aGlzIHBy
b2JsZW0uIFN1Y2ggYSBjaGFuZ2UgdG8gdGhlIGZyYW1ld29yayBtYW5kYXRlcyB0aGF0IGRyaXZl
cnMgdXNpbmcgdGhlc2UKPiBzdHJ1Y3QgbWVtYmVycyAoYW5kIGNvcnJlc3BvbmRpbmcgaGVscGVy
IGZ1bmN0aW9ucykgYWxzbyBiZSBtb2RpZmllZCBjb3JyZWN0bHkKPiBpbiBvcmRlciB0byBwcmV2
ZW50IGNvbXBpbGF0aW9uIGVycm9ycy4KPiAKPiBUaGlzIHBhdGNoIHNlcmllcyBpbnRyb2R1Y2Vz
IHRoZSBjaGFuZ2VzIHRvIGFsbCB0aGUgZHJpdmVycyBmaXJzdCwgZm9sbG93ZWQgYnkKPiB0aGUg
ZnJhbWV3b3JrIGNoYW5nZSBhdCB0aGUgdmVyeSBlbmQgc28gdGhhdCB3aGVuIHRoZSBsYXR0ZXIg
aXMgYXBwbGllZCwgYWxsCj4gdGhlIGRyaXZlcnMgYXJlIGluIGdvb2Qgc2hhcGUgYW5kIHRoZXJl
IGFyZSBubyBjb21waWxhdGlvbiBlcnJvcnMuCgpXaGF0J3MgdGhlIG1lcmdlIHBsYW4gZm9yIHRo
aXMgc2V0PwoKRllJLCBpdCdzIGJldHRlciB0byBzZW5kIGFsbCBwYXRjaGVzIHRvIGFsbCBwYXJ0
aWVzLiAgVGhhdCB3YXkKbWFpbnRhaW5lcnMgYW5kIGludGVyZXN0ZWQgcGVyc29ucyBjYW4gZm9s
bG93IHRoZSBkaXNjdXNzaW9uIGFuZApwcm9ncmVzcywgb3IgbGFjayB0aGVyZSBvZi4KCi0tIApM
ZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFy
by5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJv
OiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
