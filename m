Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 616A6C4835
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 09:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AACF46E8B8;
	Wed,  2 Oct 2019 07:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 591FF89A59;
 Tue,  1 Oct 2019 11:25:09 +0000 (UTC)
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.133.188.160]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MXHXF-1ic65t25tV-00WHiF; Tue, 01
 Oct 2019 13:24:48 +0200
References: <20190930212644.9372-1-navid.emamdoost@gmail.com>
Subject: Re: [PATCH v3] drm/amdgpu: fix multiple memory leaks in acp_hw_init
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
To: Navid Emamdoost <navid.emamdoost@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-ID: <3e685bb8-8a76-cda7-2118-a317516b2bf5@web.de>
Date: Tue, 1 Oct 2019 13:24:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20190930212644.9372-1-navid.emamdoost@gmail.com>
Content-Language: en-US
X-Provags-ID: V03:K1:nDKa2aBWHa/JDhkyZVmoAYERGoUwT+vOHMzM4Yi9Nxz78vbfLBB
 4enWxqdzKM4OTVmohMrbBHhsq/yVVCBmsr2jCnESeQTb8dSRR4N0+2Q9m1xFXR8eWiOwWiX
 s/tIOwRaNdbMKTLseb6xucIVC7irjR4FE5LWWyevEMklooli4r4B6t6u1qEZ0ESG/qaeRpO
 HhhQF5Kyr5OdXR8QcgFyA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:d1C6LyOQOdM=:vcVVLLm8mtWtHDDNwc6wPW
 sR8jTAl+4aj+ZgfacjYf5sHADj8Y7DaAMRs9w79E0vru1eZ+DGk/Qqb5jnxaA35uBf/6sUETI
 w6a/BfdHB44inu1a6h5aD7DfSTiioTMvRs00+PtMcNBDlH+xHchyfApp9uxhnozLsxmccGYk9
 00DrmUTLUaxI2FY3RQF+7beA+gEFceJmSXadzqE2BCGTFgiz/cZB0PO9PCv5mdQ2bMyf2vqlv
 bzD9iA1Nl/tza7+PKg/HVR+9Y0HePgNKUKbCxyaNzfNgRjZdKIXZdztQk7mUYGvSokJgqTOnr
 QJW/rIIYxhmIw7TXdE/iLQ1/vzDjoKt5y0uNbkrrw/o/QUoPOvIJKmP+8IT8cQS/IyAo5lMcD
 5jPrnILOtaGZiVAZG+QqZZej+QV63VYusnHIzKbZGX8ammGjGt5y4eTQIeexsxF4BOKZ+wb22
 bhSTH/l32t1lvVvskcB1tIrePGyQQIxIogT80vyCxydByvrQob3MdSS8YY2+0ipdZMmkgcGlE
 5/6/Q4rbPSIa+LjRf//zufA2Sqyvs7jC4ZnMwLei827/vGN3lac0XvlCYFPWxakpBT5+E6ABY
 SqSvX8ltDArx9DKxVimB8uzufNZHSWvUU847/rN6I0rpzxa4VbJgd5+T+opWui2P0yDcq3wpc
 P4h2akJV4jMAx4K83t+hq4tOy4Zho49Ak3yhEbuSaS/BefRBr0tQChNHM4H4TGWswaj8coKi5
 WcJkOFQBAyv1jU5jiYRVrUcv3FvoGkrAS1d9Ick6FWGqFW3o+82q8GuwplX3hTyYq9HG+JG/v
 mlqBAI4xrskzbrjn6HmLQC+hTXBb+NFdhSp/RAz5BpF3jn4PK7UiUf3zSbT3BeMgvIc3kJ9Rv
 NQ8Bd8u/clQH1WA8rgaCfMV+JrkQ/o0304BKpKknmyMA0SfnT79Wcn60u6pMqPfJ4JLsMZRmB
 4/T9E5kr3RE9z3oCedJJPf/0y3EdP7qVMk8IMEkWE5IioRAto2yOQ3oRzUMqHsE6SuqJfm1KQ
 YP/kbaGuRVDvJvxPfNMbiZGbfBQOJMldH0Z7a1mVUjq8m9Ih/+BBaZLSGlerRMuc61TVLjW3N
 gf/59q0XTdkGcOxvZzonXVEN9H/rKW8748cl4B30UbUdh7dm01NWi/Ha6TtiB5czAJiwxnZ2J
 Nu+zcST8EPjp11RCOY8cm27tNGkIFgf2+iQ270ajgaxEFlg8f+ZZsk/1ps0Mbyk2vhdGgXSlx
 yq6BXVZ7dXHzUde4PmqEjQFca4vWlu88lm8h0lvF0FlYVf5225nrUSfiEy4Q=
X-Mailman-Approved-At: Wed, 02 Oct 2019 07:18:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=web.de; s=dbaedf251592; t=1569929088;
 bh=WHCiN3/k0lptYhrp3wmxSaf0Lr67BrUF9mZbouGCaJM=;
 h=X-UI-Sender-Class:Cc:References:Subject:From:To:Date:In-Reply-To;
 b=WxILY88i2Z5rfk+fNQ8EtzGCpCLhK9M9ea5mfc/MgcQJTXVLAuoFd3LNgwC7fmUqq
 LvQUtSucDeIkkKtkIGjoxXmoD/1Xhby/a601gDMDKpV4kZR6FawCWJRWBaLCs1mLuZ
 13ngiWQoNDMNrnY8G2FR2e488jJ0rc71OE1y5l/U=
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
Cc: Sven Van Asbroeck <thesven73@gmail.com>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, Kangjie Lu <kjlu@umn.edu>,
 LKML <linux-kernel@vger.kernel.org>, Navid Emamdoost <emamd001@umn.edu>,
 Stephen McCamant <smccaman@umn.edu>, Alex Deucher <alexander.deucher@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYWNwLmMKPiBAQCAtMTg0
LDEyICsxODQsMTIgQEAgc3RhdGljIHN0cnVjdCBkZXZpY2UgKmdldF9tZmRfY2VsbF9kZXYoY29u
c3QgY2hhciAqZGV2aWNlX25hbWUsIGludCByKQrigKYKPiArCXN0cnVjdCBpMnNfcGxhdGZvcm1f
ZGF0YSAqaTJzX3BkYXRhID0gTlVMTDsK4oCmCgpJIHByb3Bvc2UgdG8gcmVjb25zaWRlciB0aGlz
IHVwZGF0ZSBzdWdnZXN0aW9uLgoKCj4gQEAgLTIzMSwyMCArMjMxLDIxIEBAIHN0YXRpYyBpbnQg
YWNwX2h3X2luaXQodm9pZCAqaGFuZGxlKQo+ICAJYWRldi0+YWNwLmFjcF9jZWxsID0ga2NhbGxv
YyhBQ1BfREVWUywgc2l6ZW9mKHN0cnVjdCBtZmRfY2VsbCksCj4gIAkJCQkJCQlHRlBfS0VSTkVM
KTsKPgo+IC0JaWYgKGFkZXYtPmFjcC5hY3BfY2VsbCA9PSBOVUxMKQo+IC0JCXJldHVybiAtRU5P
TUVNOwrigKYKCkkgc3VnZ2VzdCB0byBrZWVwIHRoaXMgc291cmNlIGNvZGUgcGxhY2UgdW5jaGFu
Z2VkIChhdCB0aGUgbW9tZW50KS4KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvRG9jdW1lbnRhdGlvbi9wcm9jZXNz
L2NvZGluZy1zdHlsZS5yc3Q/aWQ9NTRlY2I4ZjcwMjhjNWViM2Q3NDBiYjgyYjBmMWQ5MGYyZGY2
M2M1YyNuNDU2CgoKPiBAQCAtMzkzLDYgKzM5OSwxMyBAQCBzdGF0aWMgaW50IGFjcF9od19pbml0
KHZvaWQgKmhhbmRsZSkKPiAgCXZhbCAmPSB+QUNQX1NPRlRfUkVTRVRfX1NvZnRSZXNldEF1ZF9N
QVNLOwo+ICAJY2dzX3dyaXRlX3JlZ2lzdGVyKGFkZXYtPmFjcC5jZ3NfZGV2aWNlLCBtbUFDUF9T
T0ZUX1JFU0VULCB2YWwpOwo+ICAJcmV0dXJuIDA7Cj4gKwo+ICtmYWlsdXJlOgo+ICsJa2ZyZWUo
aTJzX3BkYXRhKTsKPiArCWtmcmVlKGFkZXYtPmFjcC5hY3BfcmVzKTsKPiArCWtmcmVlKGFkZXYt
PmFjcC5hY3BfY2VsbCk7Cj4gKwlrZnJlZShhZGV2LT5hY3AuYWNwX2dlbnBkKTsKPiArCXJldHVy
biByZXQ7Cj4gIH0KPgo+ICAvKioKCkkgd291bGQgcHJlZmVyIHNlcGFyYXRlIGp1bXAgdGFyZ2V0
cyBmb3IgZWZmaWNpZW50IGV4Y2VwdGlvbiBoYW5kbGluZy4KUGxlYXNlIGNob29zZSBtb3JlIGFw
cHJvcHJpYXRlIGxhYmVscyBmb3IgdGhpcyBmdW5jdGlvbiBpbXBsZW1lbnRhdGlvbi4KCgo+IC0t
LQoKSSBzdWdnZXN0IHRvIHJlcGxhY2UgdGhpcyBzZWNvbmQgZGVsaW1pdGVyIGJ5IGEgYmxhbmsg
bGluZS4KClJlZ2FyZHMsCk1hcmt1cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
