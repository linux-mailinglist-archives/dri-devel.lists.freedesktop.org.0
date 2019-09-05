Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2F4AB2E2
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 09:01:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B066E17C;
	Fri,  6 Sep 2019 07:01:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B5889613;
 Thu,  5 Sep 2019 08:29:21 +0000 (UTC)
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.131.221]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LkPjj-1ihspW14Ml-00cUf6; Thu, 05
 Sep 2019 10:23:45 +0200
Subject: Re: [v2] drm/amdgpu: Remove two redundant null pointer checks
To: zhong jiang <zhongjiang@huawei.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Chunming Zhou <David1.Zhou@amd.com>, Dan Carpenter
 <dan.carpenter@oracle.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Jack Xiao <Jack.Xiao@amd.com>, Kevin Wang <Kevin1.Wang@amd.com>,
 Tom St Denis <tom.stdenis@amd.com>, Wang Xiayang <xywang.sjtu@sjtu.edu.cn>
References: <1567662552-3583-1-git-send-email-zhongjiang@huawei.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <d1aee32e-c9ad-2953-84c0-267037a82288@web.de>
Date: Thu, 5 Sep 2019 10:23:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <1567662552-3583-1-git-send-email-zhongjiang@huawei.com>
Content-Language: en-US
X-Provags-ID: V03:K1:4B+B2FVevoEQTq0XZal697OL/zT8EA2jaMLOWgzRW8A8hai8MEw
 b8zziPXg4Mo1WelfJGb4FWR7E22gJ+B5EFbz0bvE4KruoaKWDnyn5RfHBt4GgtOqMHse6+X
 88+CN7L/44MI9YugDJRzqRc/WMQDVa3FvBniBBKKnZ5qB/J4BH4XYlA2QjKLCvujkIUAO1r
 sFpRRofF/Eg0d4ciRqVfg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3NXzriC+D3g=:VlBO+7cF7lr1RwaUncYJAy
 C3Ekrz1Q25Pvh5e1qnJJzVGnMrczpOzw/jZi0UoJ2iOyHxD1aIb0wHNjCxvlFx42eam247Th8
 CQN31VBE8FIhfgonZdc74wbNSWzEq8YVGYvQC6Z71CJ4B8mfedP6vDZ6KtcQK5lBKRdGKpG6g
 VyVJQlN/XsliXC4mqEswqQ0Rzt0RHlpSqxdgfTJsW1cRj1p+i0AIAtz7KoXlvGXG9DMX0Z8BJ
 TjuImAwLBaotPHboi/8y/synnA+fZp+Cke0SblsHHCxc0caQEXJ07D2JdoLbdxCdR8wT5cf54
 WG4tDoD9GbAOTj4DmTxFyj4FCR8bcGU20L91t9a7XGRFUOq5JgmdQ59EsKWfzzN9Tx++dcrbf
 D9kuN7ctGEoue+5W2Pi+EzW831W4y2kWNmiqzgXi85Z076O0v8JZenTmIP7x4Wrk0iwfCZtV1
 PBJfLMidevfqx/ruEPiNswIoMacO4peR1YGL7CCD0LfMO8HqclWPU4rTy2j/ztj7Xim/OyW6p
 17BMZR+95Zjn7AhfZPDHq03cErR6iTGy8uEtbztKbDDU86P3mH1o7RvXc5iSQS7rFNeobVUqa
 EyciWXtgU3RjABIczxBCnC/tIwUlLC+unobmr/b5igM+MkGtkI9O3501dMhYrHcTspmSUvn+k
 MWsGeHDeJam1ye4Tg1I9m8D5rI942CPx+saxcuGiwzmzR1Z5hQWKTB85cCa9GvQSnjJ7Y4Zm5
 PlgjXXQZ3RQt4JA+r/kz7qWpNdnclViIz9rEaQ0M65SMxsfR/4dRUEoKMYUvPlGZOagNhcfe8
 l5Fz3EluWRy9OeZHfXZAz9czTp5bpvdZUVOSeJYD5z0Ndx2nTnpROG4fUleAqpd59o7iyHZ7L
 YHb9KXGzHD8ILxlIt8oZ5fr5tnZXGhjUvD3yiMYZ3figMQ78k+VTYa3VUqZyUerzMVL0aavCr
 vTrFB79VgJtJPsRXUQPyu53/SbKzReBLrzrT9CQcvySS4bXAP64KZEwq3x627puLspMcU3kwJ
 Uwmydh2eMGCOi+7CFj55xSWiZikkTSou8VfuuP4WxbuFjPlIKsMkQQlngO8/MyszVAbkkY8t+
 q4ZM3k3AHIHFZrOsXRuCETwyabNtBagyUIWOO+/Oeu4XFy5UOnJ6llUNcnGpZtc8AFgOsnHnk
 Ld+xWlTVheqI112PS4MXsBYvk8FePrR33yYbYXjK84GJikHAY4mHfsP2+6ND3qWgtoGB1VSF4
 eC2jbMtjLHpct/KEs
X-Mailman-Approved-At: Fri, 06 Sep 2019 07:01:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=web.de; s=dbaedf251592; t=1567671825;
 bh=npYgpfnoh8nm62nIx4BVDPSEsogHvhCXGvC0CMvch1E=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=X+YjGd+dRZqfKAmb+4vBg2xTbWLg8wjmhsd2/TsV4CCzJS3Jr9Nr+oO4rsv7wPZKO
 QfxdD/L1hiPsBfz0HdDgxEHN4j4rguz1lwhTb1QGIlhuZWz0Wtzm8wVom7OYcCAhDW
 u2xQo7FP3HkJGaG0TUwedTPBuw6lkdIjzjYV1IVQ=
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBUaGUgZnVuY3Rpb25zICJkZWJ1Z2ZzX3JlbW92ZSIgYW5kICJrZnJlZSIgdG9sZXJhdGUgdGhl
IHBhc3NpbmcKPiBvZiBudWxsIHBvaW50ZXJzLiBIZW5jZSBpdCBpcyB1bm5lY2Vzc2FyeSB0byBj
aGVjayBzdWNoIGFyZ3VtZW50cwo+IGFyb3VuZCB0aGUgY2FsbHMuIFRodXMgcmVtb3ZlIHRoZSBl
eHRyYSBjb25kaXRpb24gY2hlY2sgYXQgdHdvIHBsYWNlcy4KCldpbGwgYSB0YWcgbGlrZSDigJxH
ZW5lcmF0ZWQtYnk6IHNjcmlwdHMvY29jY2luZWxsZS9mcmVlL2lmbnVsbGZyZWUuY29jY2nigJ0g
YmUgcmVsZXZhbnQgaGVyZT8KCkhvdyBkbyB5b3UgdGhpbmsgYWJvdXQgdG8gY29tcGFyZSB0aGlz
IGNoYW5nZSBhcHByb2FjaCB3aXRoIGFub3RoZXIgcGF0Y2ggdmFyaWFudD8KCmRybS9hbWRncHU6
IERlbGV0ZSBhbiB1bm5lY2Vzc2FyeSBjaGVjayBiZWZvcmUgdHdvIGZ1bmN0aW9uIGNhbGxzCmh0
dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5LzkvNC80MDEKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
cGF0Y2h3b3JrL3BhdGNoLzExMjM2ODkvCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvYTM3Mzkx
MjUtNWZhOC1jYWRiLWQyYjgtOGE5ZjEyZTliYWNkQHdlYi5kZS8KClJlZ2FyZHMsCk1hcmt1cwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
