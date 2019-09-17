Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D80DB48E5
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 10:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34CFF6EB40;
	Tue, 17 Sep 2019 08:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E90B6EB3F;
 Tue, 17 Sep 2019 08:12:30 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id t3so1960043wmj.1;
 Tue, 17 Sep 2019 01:12:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=N5bGwqXiwHtnmN9RhIn3xfbQgv8YIud9LysWlkDLpsI=;
 b=AWnCKLlxtTzVB0eEO6jjt5YVT9uV20+RtA2gnoWAxINNsQL4pWgCxoHXI7AkdOxL9W
 i/Sv892/GkNibNu3WYaoLiackzN0+vgnZ9KJx4NILXT6TD8ClVpo6o83EKIdZIxJcoWp
 XKwb9efniSrhqz+KD0kdlUQ47Vjj0OwcQs+Ztzlv5Ke2b1f06BwyyDRpnhRU0YtdZD+p
 6POSA+QlS5FDFs8Tm0suO2zBL2rXoBCJE+yqFnG8T2Ww5WvDcOGj8TxaAwQ0KpBxLes1
 bg1X9mSS+pPYunwHOiyAKjXiIuZ5akPljdVEscOO9HL1f/ypM5mj3PLZDxM7rUIL1X0i
 GOkQ==
X-Gm-Message-State: APjAAAVStzJJZZnXMQP4avGQKuyKahBl/2Imkut3mONbYcpGVjQc/tt2
 IEtjGpHGqPeDXqSATX8Ay10T32Sa
X-Google-Smtp-Source: APXvYqwxAoO3Z+UvZO2e57VSMuOQm2TBXGRTunkOa+u4ke6Rai37OeyIPbNy3V68PRywOZCW19Onfw==
X-Received: by 2002:a1c:984b:: with SMTP id a72mr2342698wme.149.1568707948787; 
 Tue, 17 Sep 2019 01:12:28 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id n8sm2078403wma.7.2019.09.17.01.12.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Sep 2019 01:12:28 -0700 (PDT)
Subject: Re: [PATCH] drm: add drm device name
To: Jani Nikula <jani.nikula@linux.intel.com>, =?UTF-8?B?TWFyZWsgT2zFocOh?=
 =?UTF-8?Q?k?= <maraeo@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20190903214040.2386-1-sonny.jiang@amd.com>
 <CAAxE2A45N4gMYrcETDpznGKyxLztuwenFasL19a81QQmBkYiww@mail.gmail.com>
 <CAF6AEGvvUUOGujJC9P3t72N93AJuxiiVt0OAk8zf226Q8WmHvg@mail.gmail.com>
 <CAKMK7uHFNhdNY4Y9ZFMNuci7gssPWCT5f5y=e4npg8s5r_jBdQ@mail.gmail.com>
 <CAAxE2A6sESsKAi3K1etAZeCwAPgexn099G6g0aJQnavTkiH+mA@mail.gmail.com>
 <87woe7eanv.fsf@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <03d31464-3968-6923-5323-f63060d70f1f@gmail.com>
Date: Tue, 17 Sep 2019 10:12:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87woe7eanv.fsf@intel.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=N5bGwqXiwHtnmN9RhIn3xfbQgv8YIud9LysWlkDLpsI=;
 b=DNk9Z4OXdKaAtoIFaWR97VGH3Z3Y44bchZIJyopAKrd75joqo9U5pPOw64LbYCWGUe
 phabb6wUMc12ToKwtLlgpcH8dIc1DXSw5pxk8Aww1UqYhhxnphJqHv2DDnaQUA0NdYfJ
 S4sIrTmAlvNjDCDDLJFgyKS68W3ma+ti9k3KA9hnSds3LoyseL/iZqLLvZoAJIcyNrKV
 nAHIE6BySxv8HsAxR3CSMvwiyq0UGYYHhedxLgyj6wsIQ5Iv05v/wOCZXEZysGYQ2y/H
 tUZNypUkg+wFOwuKtdTDVLZhqcvsadzRgpj58dCh3hH9URAVj0jjgtPQjpXeYdvJIno0
 feGQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Reply-To: christian.koenig@amd.com
Cc: "Jiang, Sonny" <Sonny.Jiang@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTcuMDkuMTkgdW0gMDc6NDcgc2NocmllYiBKYW5pIE5pa3VsYToKPiBPbiBNb24sIDE2IFNl
cCAyMDE5LCBNYXJlayBPbMWhw6FrIDxtYXJhZW9AZ21haWwuY29tPiB3cm90ZToKPj4gVGhlIHB1
cnBvc2UgaXMgdG8gZ2V0IHJpZCBvZiBhbGwgUENJIElEIHRhYmxlcyBmb3IgYWxsIGRyaXZlcnMg
aW4KPj4gdXNlcnNwYWNlLiAob3IgYXQgbGVhc3Qgc3RvcCB1cGRhdGluZyB0aGVtKQo+Pgo+PiBN
ZXNhIGNvbW1vbiBjb2RlIGFuZCBtb2Rlc2V0dGluZyB3aWxsIHVzZSB0aGlzLgo+IEknZCB0aGlu
ayB0aGlzIHdvdWxkIHdhcnJhbnQgYSBoaWdoIGxldmVsIGRlc2NyaXB0aW9uIG9mIHdoYXQgeW91
IHdhbnQKPiB0byBhY2hpZXZlIGluIHRoZSBjb21taXQgbWVzc2FnZS4KCkFuZCBtYXliZSBleHBs
aWNpdGx5IGNhbGwgaXQgdWFwaV9uYW1lIG9yIGV2ZW4gdWFwaV9kcml2ZXJfbmFtZS4KClJlZ2Fy
ZHMsCkNocmlzdGlhbi4KCj4KPiBCUiwKPiBKYW5pLgo+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
