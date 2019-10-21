Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37280DF7ED
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 00:21:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D59796E2A0;
	Mon, 21 Oct 2019 22:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 502B66E258
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 20:45:58 +0000 (UTC)
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.135.106.164]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MBTQo-1iCELG1Ryw-00ASVf; Mon, 21
 Oct 2019 22:40:24 +0200
References: <20191021185250.26130-1-navid.emamdoost@gmail.com>
Subject: Re: [PATCH] drm/v3d: Fix memory leak in v3d_submit_cl_ioctl
To: Navid Emamdoost <navid.emamdoost@gmail.com>,
 dri-devel@lists.freedesktop.org
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <a28f12a8-49c4-30f0-cc86-6a41ded96ab2@web.de>
Date: Mon, 21 Oct 2019 22:40:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191021185250.26130-1-navid.emamdoost@gmail.com>
Content-Language: en-US
X-Provags-ID: V03:K1:+01gd9ynx1gymH7NQlk0h/6XtXzBSBIMVyyMhiE2Ri6cRR1Xt/e
 uwBuSJHolbxSClFmj8eZiMNLk8TSIL/gEwMqUwovaelj26YFLcPqGwLvkCkY4u4SpnPFSAY
 NLWGwkv6ZJGlPawUhKIq0T3uHdXOUgLc0sPbmnQAk4G2G8acvVi0eDK4+96yEJSqMnVrRsP
 J/O7NOgGfGRgtLtrTJGWA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1fhbxjENph8=:x4v2LY4SXNHLte0XyR9m7G
 OMZcuzQ+gLWiYXfZPfffh9ACbaCIAjf9eZ8iTWQo8DmxaP7BhF3cgi/9BEr/VQJfeykWcU6vc
 lSSHw03IIXjpog23fS0Hkxn/cNd82JevMvEKyQJzgHvBRdBNK4K8luCMXtHe1lbOUXgIAc7MZ
 KxresqTYk1gYwnfR1A3wKmYuxAFfjmtLN4oSTMJet68Op8GcuC/gHk2PxMw5ACx9tRGsUFg6X
 2xpevKTEQ6A9CsqKb8FQkeRTKAFXMyYtIR7PrLDiXB7RaHgevQkM0OQfdH8gJ2T+cirbNospo
 irDaCMREgYoI9Bq+OLxyq31m0APnRIeCnoEXn/K+JILCFGXUmPlbsWEDeqFJX85iIwEO5F1cb
 KF9+HDp94TibA2ddV3jvfQbyDYen2z5bUJ7l9nhNirLhwhgQypgH9ItSELv1ibYqLIi9js5+c
 q1HlHB+XUEzoCjVy++rcxhwnWPPYHyPDvUZi2lLuAKs0N88fS2++tZXbbKp5fJZdm3EfXmRxV
 lk02gifs/mwqvDxR8R+p4mnHr4RnRRBw3/f8XZOixxIb56ALRY5wFgELsRkA6r5MNv2ovdJUx
 IAlIVsYp7mwJNlKwpWCVT0sRd7v/69ffdpueXYBW+Tulq0CO2i5UOPJUK14oQ3IuJDDxwHXcv
 Z75UI3J/WbB3vzU9pIJ6w5s+5+Z9/Wtm45ykCPj5V3mxnXc0xxC2FTIP08wZIxWvaQ4542WUW
 9r9LDkhdJETjdMb+xsyuZITCZJ6+RpU1W8pHVktWNdNGIxJbobq24glHxC5etUEd82KEUBTMF
 JLW+qY+YAQqtZASuod0JcjizfEBmn3ey0IxFNUTa54mC+ymwOuWDlCiLDaqS86KEVjgo76D+9
 p60G7UlF+JQrDFd2fGeyBKzL6v2cQCSszlAkDJUG3DaXP8QwQZwjt6uaQ+71l/68IFX41lHmU
 hpGski6Z87xM/SRiw5yzBisQcMw/YLkc+13FFQAf7LpHk1M44q+shChkib27GuKu1xRFs7h7a
 UCU3FJAyMdiLhZg+oBHZkWVt7lMl/pOnv701fYfBXALsBA4NL/SKF5Ow3pz23S9HQ+3CuOc4V
 8DBeqBfFyF2fbbEb1E9Zlkxg4y9UQkG5ur5YdnZyiAaXtgBsqwLXim/zvyCjfJYqsHTdI8GVh
 O62/TfM77qnGPQ6YIn3V1Hbo7bMNgDDshgBnOHBOLTnxXxxLcQezOxQFBDWTdHSPzmQvgvSl9
 wgFb0vDNGe0TV1KDzXfupdtT2f6/3dXicCfUFaDg+BJlXROkbBHod32GBDXM=
X-Mailman-Approved-At: Mon, 21 Oct 2019 22:21:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=web.de; s=dbaedf251592; t=1571690751;
 bh=4ObFiW5TE60yeh3kt8csqTOAxv9kGWcoXP4STgxDALc=;
 h=X-UI-Sender-Class:Cc:References:Subject:To:From:Date:In-Reply-To;
 b=mZqZ2jZOHhz9tUhT15LJ0vLm9upDWHhmhPxf2cfuKWZLUJKX3TCbrTAjEzSazUsE6
 tp6DUWvDoUquUaZZPJDUxBuUTAFrQ8wE7u+L/ugfbyItj4SUcZpnE0VmpP67jnJxg9
 TBRwg1aM+8enMuZjQSp/AiMF7RFPavk1IOl1YwU8=
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 Kangjie Lu <kjlu@umn.edu>, linux-kernel@vger.kernel.org,
 Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBJbiB0aGUgaW1wZWxlbWVudGF0aW9uIG9mIHYzZF9zdWJtaXRfY2xfaW9jdGwoKSB0aGVyZSBh
cmUgdHdvIG1lbW9yeSBsZWFrcy4KClBsZWFzZSBhdm9pZCBhbm90aGVyIHR5cG8gYWxzbyBpbiB0
aGlzIGNoYW5nZSBkZXNjcmlwdGlvbi4KCgo+IOKApiBJZiBrY2FsbG9jIGZhaWxzIHRvIGFsbG9j
YXRlIG1lbW9yeSBmb3IgYmluIHRoZW4KPiByZW5kZXItPmJhc2Ugc2hvdWxkIGJlIHB1dC4gQWxz
bywgaWYgdjNkX2pvYl9pbml0KCkgZmFpbHMgdG8gaW5pdGlhbGl6ZQo+IGJpbi0+YmFzZSB0aGVu
IGFsbG9jYXRlZCBtZW1vcnkgZm9yIGJpbiBzaG91bGQgYmUgcmVsZWFzZWQuCgpXaWxsIGFuIOKA
nGltcGVyYXRpdmUgbW9vZOKAnSBiZSBtb3JlIGFwcHJvcHJpYXRlIGZvciBzdWNoIHdvcmRpbmdz
PwpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxk
cy9saW51eC5naXQvdHJlZS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVz
LnJzdD9pZD03ZDE5NGMyMTAwYWQyYTZkZGVkNTQ1ODg3ZDAyNzU0OTQ4Y2E1MjQxI24xNTEKCgri
gKYKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9nZW0uYwo+IEBAIC01NTcsMTMgKzU1
NywxNiBAQCB2M2Rfc3VibWl0X2NsX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQg
KmRhdGEsCuKApgo+ICAJCWlmIChyZXQpIHsKPiAgCQkJdjNkX2pvYl9wdXQoJnJlbmRlci0+YmFz
ZSk7Cj4gKwkJCWtmcmVlKGJpbik7CuKApgoKQ2FuIGl0IGJlIGhlbHBmdWwgdG8gbW92ZSB0aGUg
YWRkZWQgZnVuY3Rpb24gY2FsbCBiZWZvcmUgdGhlIG90aGVyCmluIHRoaXMgaWYgYnJhbmNoIChp
ZiB5b3UgcHJlZmVyIHRvIGF2b2lkIHRoZSBhZGRpdGlvbiBvZiBhIGp1bXAgdGFyZ2V0IGhlcmUp
PwoKUmVnYXJkcywKTWFya3VzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
