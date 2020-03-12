Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B470182D37
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 11:14:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A236E109;
	Thu, 12 Mar 2020 10:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 965F76E106;
 Thu, 12 Mar 2020 10:14:25 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id n15so6603792wrw.13;
 Thu, 12 Mar 2020 03:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=99zCoGvBDUcvfpO9a9LFfTGeDECAtBMxFB8De2EMWp0=;
 b=DMpTpwApva9r8u9lx0Op6r/whtC4At15bKd8fkbJdGqjQmio4yaGOYfzdcgindAbK5
 a7IJacyFiFVDhWiooi8BZ1gmXDW51k7Cu4OwA92puB3ehtgeShNeQm/yORTN/rMIZsjP
 x0tnmnRUeruhgJD/DksHtunDqv65HV+HpSFPKh0Ag5N2owWZVZjBtZ8Fi2gskr1OTNEa
 k1KAwLcYReLu0/Qda9qtjPmaxH1fDxytxmTHE5Jbwl32hEe/AM4Fshde1kNpgW97hYwD
 iOh3Hmoez2s6Q7A52Ek10fpT00nYOdsHcoamPgYGt59j9pogB7fbSq3yLAAu1i7xfBRK
 0AJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=99zCoGvBDUcvfpO9a9LFfTGeDECAtBMxFB8De2EMWp0=;
 b=q7qcq4IxboR40MlhNTQ/axgto0OaVwa1tbHC1NwBndmdhQOnWnTCrUW5vv2r74WC16
 oWLtGUJnNiAzITwZmYfCwGThhti8XfdTTfdwekR0kOp2Co71NFQmky6LKAJkGU93tUoA
 eYjAS03r+USayTC+tCUepmT4jy5Yvyo5ZaSanZUuYEWDMbXLmdgCRboovrxnvQuo/jtr
 TvjmPD//e6JDh7ujlzOele5yXPnhjt6wLg+anW3XzCKjXNOy9q0XW/WqIZ0LqWgjWVXV
 Nc6p2x+8OrY7jG3+OHAUxIVWD+wP8/GqxhR4o3G1HJiAalAwSHYWN/eQYNpsFKknGtO0
 nzDw==
X-Gm-Message-State: ANhLgQ18zpH6aJsLSMyKzdXnQ48vDYh+Aa42UbaxQ49LIKbz9NF19HPe
 teKsrMRNXxca4Zjy6D8p7hxVGam9
X-Google-Smtp-Source: ADFU+vt9s8OYMtKOql4lFTOfhZHcw/9Pzcas2QNpKDhr/rEHArSKwzODj38Q68fYVw1jBI8UvymV/Q==
X-Received: by 2002:adf:db84:: with SMTP id u4mr10434358wri.317.1584008064004; 
 Thu, 12 Mar 2020 03:14:24 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id a9sm27966191wrv.59.2020.03.12.03.14.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Mar 2020 03:14:23 -0700 (PDT)
Subject: Re: [PATCH 1/6] lib/scatterlist: add sg_set_dma_addr() function
To: Christoph Hellwig <hch@infradead.org>
References: <20200311135158.3310-1-christian.koenig@amd.com>
 <20200311135158.3310-2-christian.koenig@amd.com>
 <20200311152838.GA24280@infradead.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <f2b46f49-a8d0-9d43-3120-e1ed36fc3a80@gmail.com>
Date: Thu, 12 Mar 2020 11:14:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200311152838.GA24280@infradead.org>
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
Reply-To: christian.koenig@amd.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, jgg@ziepe.ca, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTEuMDMuMjAgdW0gMTY6Mjggc2NocmllYiBDaHJpc3RvcGggSGVsbHdpZzoKPiBPbiBXZWQs
IE1hciAxMSwgMjAyMCBhdCAwMjo1MTo1M1BNICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Ogo+PiBUaGlzIGNhbiBiZSB1c2VkIGJ5IGRyaXZlcnMgdG8gc2V0dXAgUDJQIERNQSBiZXR3ZWVu
IGRldmljZQo+PiBtZW1vcnkgd2hpY2ggaXMgbm90IGJhY2tlZCBieSBzdHJ1Y3QgcGFnZXMuCj4+
Cj4+IFRoZSBkcml2ZXJzIG9mIHRoZSBpbnZvbHZlZCBkZXZpY2VzIGFyZSByZXNwb25zaWJsZSBm
b3IKPj4gc2V0dGluZyB1cCBhbmQgdGVhcmluZyBkb3duIERNQSBhZGRyZXNzZXMgYXMgbmVjZXNz
YXJ5Cj4+IHVzaW5nIGRtYV9tYXBfcmVzb3VyY2UoKS4KPj4KPj4gVGhlIHBhZ2UgcG9pbnRlciBp
cyBzZXQgdG8gTlVMTCBhbmQgb25seSB0aGUgRE1BIGFkZHJlc3MsCj4+IGxlbmd0aCBhbmQgb2Zm
c2V0IHZhbHVlcyBhcmUgdmFsaWQuCj4gTkFLLiAgVGhlIG9ubHkgdmFsaWQgd2F5IHRvIGZpbGwg
RE1BIGFkZHJlc3MgaW4gc2NhdHRlcmxpc3RzIGlzCj4gZG1hX21hcF9zZyAvIGRtYV9tYXBfc2df
YXR0ci4KCkhvdyBjYW4gd2UgdGhlbiBtYXAgUENJZSBCQVJzIGludG8gYW4gc2NhdHRlcmxpc3Qg
d2hpY2ggYXJlIG5vdCBiYWNrZWQgCmJ5IHN0cnVjdCBwYWdlcz8KClJlZ2FyZHMsCkNocmlzdGlh
bi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
