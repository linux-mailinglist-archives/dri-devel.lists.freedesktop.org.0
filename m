Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D87AC2CAB6A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 20:09:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED95F6E54C;
	Tue,  1 Dec 2020 19:09:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E753C6E54C
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 19:09:00 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id f23so6507275ejk.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Dec 2020 11:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=KuQsOmkU59TEcXFumC/22hf+IT52cwnCQmN8RQ9CnUA=;
 b=qIrPBDdB0UKB1JMI/cZ8HGCZJxfi1lVPN6M23klMw+uUxMgefP3gomgs7ZX4Sy92fL
 07Acq0P+ob+qQL/VQVsqLigHvG/es/xcj9Cl9sOtYWddT2H2eL+MjR0le00MvEcipTSy
 pySyXwjUnZ4mJGBUhpOEhZqOCAu/woVoBlFVElufKAfKzsM7RfC4gIh5W6ppevrBLq0r
 ffdMjaKC6pWx0COyT/sDd2TacYs0lZaqTF2+7jmuGAHCfhBHbJ1xixQPXf7pkwKr7u03
 pvBv3KREu6C7GZbscm4qLHd6vyL48hyBjyKTEgn2OUVdU1jcdt4GoWUoMDTUSGwFayBi
 hskw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=KuQsOmkU59TEcXFumC/22hf+IT52cwnCQmN8RQ9CnUA=;
 b=soRvr5etkTT8GE0rcz9sBTdUSoqq+WBv1JEjlV0rLxMg//H4rmIo+BSKCgeQ5PWj+2
 VCHdAlO/095pbXHXvpSkTPgQpZvflWnmbvcPXf8h+SYlLyuL7u0AHtuVWL5kb8Cp3nR/
 wcN1zcSLDVE3rANLQ3cnMektsV+MdqeMt0v9TeCcJpSTWCU/mxM9maf65B+Z0DkgsC3f
 LaZmszBUUh6+RxOxneHTHZsgVwZMnoVrJ4NCczoIORqzStjYxRLfSAeqOcpjox94tZ3F
 qqRPXC6ANYa8ZWUD53yeeJyyOIHMkYRBn0tdD5U1gSptf4i8ZI1Sbj9gCAsbK8x0W2U7
 c+aw==
X-Gm-Message-State: AOAM531MGZVLJ//RuVaEzILYDGKGXULteFcKwAN0071X2mf4nacus/RN
 HrpciLxsftQZo9I7mFjKn5QrycJ9se0=
X-Google-Smtp-Source: ABdhPJzbaAiLP//VACF4OaRhWzPiVTZ7Pu7yycQd22xfmHDdxivjRbtlwRtLuxcHYM2DgtzhrCnZ7g==
X-Received: by 2002:a17:906:4e83:: with SMTP id
 v3mr4512037eju.154.1606849739389; 
 Tue, 01 Dec 2020 11:08:59 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id bg4sm294246ejb.24.2020.12.01.11.08.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 11:08:58 -0800 (PST)
Subject: Re: [PATCH 4/7] drm/vmwgfx: switch to ttm_sg_tt_init
To: Zack Rusin <zackr@vmware.com>
References: <20201125125919.1372-1-christian.koenig@amd.com>
 <20201125125919.1372-4-christian.koenig@amd.com>
 <F507E112-DA9E-40EB-875E-C7B28751B2C8@vmware.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <46018280-5c9e-f6f3-adca-7d6f68728f52@gmail.com>
Date: Tue, 1 Dec 2020 20:08:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <F507E112-DA9E-40EB-875E-C7B28751B2C8@vmware.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMzAuMTEuMjAgdW0gMjE6NTYgc2NocmllYiBaYWNrIFJ1c2luOgo+Cj4+IE9uIE5vdiAyNSwg
MjAyMCwgYXQgMDc6NTksIENocmlzdGlhbiBLw7ZuaWcgPGNrb2VuaWcubGVpY2h0enVtZXJrZW5A
Z21haWwuY29tPiB3cm90ZToKPj4KPj4gQWNjb3JkaW5nIHRvIERhbmllbCBWTVdHRlggZG9lc24n
dCBzdXBwb3J0IERNQS1idWYgYW55d2F5Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4g
S8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+IC0tLQo+PiBkcml2ZXJzL2dwdS9k
cm0vdm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVyLmMgfCA0ICsrLS0KPj4gMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3R0bV9idWZmZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS92
bXdnZngvdm13Z2Z4X3R0bV9idWZmZXIuYwo+PiBpbmRleCA2YTA0MjYxY2U3NjAuLjFjNzVmNzM1
MzhjMCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2J1
ZmZlci5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3R0bV9idWZmZXIu
Ywo+PiBAQCAtNjExLDggKzYxMSw4IEBAIHN0YXRpYyBzdHJ1Y3QgdHRtX3R0ICp2bXdfdHRtX3R0
X2NyZWF0ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+PiAJdm13X2JlLT5tb2IgPSBO
VUxMOwo+Pgo+PiAJaWYgKHZtd19iZS0+ZGV2X3ByaXYtPm1hcF9tb2RlID09IHZtd19kbWFfYWxs
b2NfY29oZXJlbnQpCj4+IC0JCXJldCA9IHR0bV9kbWFfdHRfaW5pdCgmdm13X2JlLT5kbWFfdHRt
LCBibywgcGFnZV9mbGFncywKPj4gLQkJCQkgICAgICB0dG1fY2FjaGVkKTsKPj4gKwkJcmV0ID0g
dHRtX3NnX3R0X2luaXQoJnZtd19iZS0+ZG1hX3R0bSwgYm8sIHBhZ2VfZmxhZ3MsCj4+ICsJCQkJ
ICAgICB0dG1fY2FjaGVkKTsKPj4gCWVsc2UKPj4gCQlyZXQgPSB0dG1fdHRfaW5pdCgmdm13X2Jl
LT5kbWFfdHRtLCBibywgcGFnZV9mbGFncywKPj4gCQkJCSAgdHRtX2NhY2hlZCk7Cj4gQSBsaXR0
bGUgYml0IG1vcmUgaW5mbyB3b3VsZCBiZSBtdWNoIGFwcHJlY2lhdGVkLCBpdOKAmXMgaGFyZCB0
byB0ZWxsIGZyb20gdGhlIG1lc3NhZ2UgbG9nIHdoYXTigJlzIGdvaW5nIG9uLiBJcyB0aGUgYXNz
dW1wdGlvbiB0aGF0IHNpbmNlIHZtd2dmeCBkb2VzbuKAmXQgc3VwcG9ydCBkbWFidWYgaXQgd2ls
bCBuZXZlciB1c2UgdHRtX2JvX3R5cGVfc2cgb3IgVFRNX1BBR0VfRkxBR19TRyBhbmQgdHRtX3Nn
X3R0X2luaXQgd2lsbCBzdGlsbCBlbmR1cCBjYWxsaW5nIHR0bV9kbWFfdHRfYWxsb2NfcGFnZV9k
aXJlY3RvcnkgdG8gc2V0dXAgdGhlIHR0bV90dDo6cGFnZXM/CgpZZXMsIGV4YWN0bHkgdGhhdCdz
IHRoZSBpZGVhLgoKPiBJZiBzbzoKPiBSZXZpZXdlZC1ieTogWmFjayBSdXNpbiA8emFja3JAdm13
YXJlLmNvbT4KClRoYW5rcywKQ2hyaXN0aWFuLgoKPgo+IHoKPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
