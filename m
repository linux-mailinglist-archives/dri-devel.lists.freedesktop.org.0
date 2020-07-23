Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A95822A93F
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 09:03:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AADCA897F9;
	Thu, 23 Jul 2020 07:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 316 seconds by postgrey-1.36 at gabe;
 Thu, 23 Jul 2020 05:24:51 UTC
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ECEB6E0A6;
 Thu, 23 Jul 2020 05:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1595481889;
 bh=ClTsD8Rcw32+nJqII3CCW0/k3+s5opd4aoG3zPy1pqk=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=XyB8uRqMHJ2u8R9lyOWS6bTOzmNI7oHrvAbpTy/a+9gPY9WwlK2pDurbZPSg4HEyi
 YJbUj+/y6PaAtxHPD5jyoBrCJFbRG9oclBR7aGOb+huNkJRl5gNMfLQuwBY0wyniRe
 DI5JFFli/NunJXSlbrCjRbvjkdT36fqirBpzN/Ic=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.133.132.31]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M0Qkb-1ko5eg3sT7-00uXZu; Thu, 23
 Jul 2020 07:19:16 +0200
To: Hanjun Guo <guohanjun@huawei.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/amdkfd: Put ACPI table after using it
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <00444eb2-4bf4-bbe2-1727-d2f9eff110e2@web.de>
Date: Thu, 23 Jul 2020 07:19:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:I4XbwMvpiFRlf2ACj9dnzR8XtpooalMyKDMpRO3kfVl+Rv6BPZQ
 u5GA+7t/h0yvSuc8VQC8DRyCUE3jAKs+YXZjxW8fzvbNvWEUVLcH5eIUrpETcDAyxqD6ghE
 H/+g5ryp9kQeh+NhgAX3d6TfZDnqOk74tCe6hyxlhEO6pJVvVweDEzCXlR/K+y0+UemRfDt
 5TxbKXJsWi4PUYpui3rTQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LGbRMqnYVyc=:CjkFlH51hYNlhBfhfN5rwq
 hafJ1mY+1BO3NVPAyZbJlxNueu+I7fT4MtyczF/XdCfFHsBHlJJKea4GznxTHzJuTMbDERvii
 dem4KIwPdUE5G5t985SX244vKasMR74sUS2KIPONkentqDrOozC52X0cgkc4uibGokvZwjNnR
 OyfGF77SUhQcWgTqXvdI+m0jyp9pagk96p4FoLxPKTQXEgmfGDj/RZJbhACRYe0jnBUk4LYLI
 qRaKX1R5yeUinDGaDOvb/Jj3cH/BQnGJklbe5wDdAZllfUSgKCLp69hYLQzNgXyAXAKDieUcU
 ROsDLLI1t3blYkNd3NDjxn1Kpam3Vk44NnrJ0Q0sefHrGFvwPHCFWBk4TUGTgYphJuAIKRikC
 Ziof1EIDG4Fautqelx4TjYV3Lwx9p9pV+9xDRGg5Uq3fDyDA5nF0BuS9zDypAs8CX8Ojps5da
 DXmHgAmyB0A3XGpvu6jtWHD/B2G15fUB3j0VkjNrvbWszIp6omUFi4LVzCgqLM58NsV43aGb3
 0iuWo74FDNoQxghwVBB/+dDtR2S23ygv06G0AMemg32MKWQzOvZ0JUkQqyIXx4DvS+keAd7kT
 /zUtqOH5CW9KPMLoOFzoIVaotT8XTPTg/XOzbmC3A761/bydGaD/JCi1QahWhPpjG1SSZBT+M
 QuYalk8218zAN5jRQ1co+K9oDjU7I91YqoQiNSOLMsqiAOTEecV9x8nZK85liEsOVDO1eZoLA
 8+EbRkImtNy0j8ha4f5yzwd4LsC1sxttdRnAQVs7qW6bxY2Ob6cLmgi8Unsj7IoBGPFPboOWv
 YAsSygYAEwt3J80M6DRxjuOUeZFVQY6Dcm1PdB7AADiGRzz/HCYFK5wxP5PZnrocwP7JhbGng
 kTVebQl0aYjSK9EgjuI9c0eBdk/bmBszJHMOv+EFCk97PJ+cVywF2V+821YW8QLblOMo8TQpO
 VbE40Ee6K2GcboauH/kc8En0TWuD9Ud2CsdeYNV2sjHF0ZNLGZmUTLimVGQocOPQ+kfZzZ1yx
 uWwbvBD8oJKk8icI4dY6PXqJIkmEkV4Ynxq7UjuChh/98fW9+IYmikSVv62YvUl62oJswAegj
 2rtNEhYed40V/rMLzej+/Lm2e+5GXw4x97/AtkOtD6GiXjg3qUyFsmb8/fvMhH+a+u/xSkeAS
 PdZW0TYKYnTvhQT+3j2iY+lf9kmckGeXAe6WOIbUKqyfw5NaGn0sOHl23Tb+xYVoyqe+i3SLP
 ItQQ8wtuA4n4sdZDQv6hJ9peXp64y8uESsk0iZA==
X-Mailman-Approved-At: Thu, 23 Jul 2020 07:03:15 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Felix_K=c3=bchling?= <Felix.Kuehling@amd.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

4oCmCj4gYW5kIGluIGtmZF9jcmVhdGVfdmNyYXRfaW1hZ2VfY3B1KCksIHRoZSBhY3BpX3RhYmxl
IGlzIG9ubHkgdXNlZCB0bwo+IGdldCB0aGUgT0VNIGluZm8sIHNvIHRob3NlIHRhYmxlIG1hcHBp
bmdzIG5lZWQgdG8gYmUgcmVsZWFzZSBhZnRlcgrigKYKCjEuIFBsZWFzZSBhdm9pZCBhIHR5cG8g
Zm9yIHRoaXMgY2hhbmdlIGRlc2NyaXB0aW9uLgoKMi4gQW4gaW1wZXJhdGl2ZSB3b3JkaW5nIGNh
biBiZSBwcmVmZXJyZWQgaGVyZSwgY2FuJ3QgaXQ/CgozLiBXaWxsIHRoZSB0YWcg4oCcRml4ZXPi
gJ0gYmVjb21lIGhlbHBmdWwgZm9yIHRoZSBjb21taXQgbWVzc2FnZT8KClJlZ2FyZHMsCk1hcmt1
cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
