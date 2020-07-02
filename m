Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D89442135E9
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 10:12:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB036EABC;
	Fri,  3 Jul 2020 08:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1556E037
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 14:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1593698649;
 bh=DCK/WFqgBdaHR38QF2ta4hvKwO2tQSln1KlsJxiIhkM=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=EQIm1+Id5YKsEHlinZjakj9hsaYatJc/rsEQaAyEgnhwgCxWZR/f95F4CGkhGDR/k
 +hknJzmw/9n0Jq14TaO/+JWA/OT50eO3cra+u0YYBGgEsI4uUqdB7ycfxfuvJjz1UQ
 j4GBPNiXWmqiFLxHUv6ecVm3lp5tO7hCeOI8+APk=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.138.52]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MB06e-1jh4Cj1p1Y-009vV6; Thu, 02
 Jul 2020 16:04:09 +0200
To: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: fix wrong return value in dpu_encoder_init()
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <1c338c4c-c185-0b37-eabb-1072a6502ec0@web.de>
Date: Thu, 2 Jul 2020 16:04:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:zKBOW2W3vG0rFaq44rAhwc2i9qkzNX4TObOfBu6CAgIJ5qITTc0
 aKZkXK7c8EVplKQR0qcEMP43n0dEdkNyATjogxppBVgMVMkt7qSaeIuapze8jFWiEz/tyTn
 Y4APgs6Y7tdhZZSb62D+zKNWa6O+bJB7X3FFOcH6w7YGlUmMCyhkNQlDGaL8kk0N6nWHlTI
 Bh3bfkcFlmeK0sekM1Pyg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:J9+4GruiX8c=:QlwklHr6cTfjX5bYLE+JgK
 Iz6e+EfRYSec6k8MyhmGARc0COOn/sPrTJcBLILxmWUJ7gLADX5HMyYW+giWGrks4SpYpiZAZ
 2EMn5zixBug0UReTJYy7N8QBoJXQ8X8N8n0q4Z17lGEKFCMcMhb4btx16qC62HJYBgI96sQgF
 qzL2qyQ5/2W2xn8BboeKI4laFxVtknLjTSq86vKxYDCRs9OIo1R3NRtDYx2UouQ9wXIFt76Oq
 joe/oI4hwMFzvGQdAWjQEseIyWQ2YyRsiDoq/hdZ3bsS20OQ7P0YUdLe8/fF/NHIRoH2i0k0W
 ezrRkKaBQoTKBYgSxtvxrDnKeQxX3hgJEQD/ARXM5HcWa3I9Ed9j3jeD92i2XxkRwWvFn6R6m
 KC3z5+bYJyWGa6qlSh/kIOMma+ViCZQJG/fE3C7mvf9gYWmE5xkshX50qKEqs6vN3iNZh8JUm
 asnMx1PmgIRAOxShGpqt/bh27E19PiOpn7XP/6WGWarLUEo91iNZziCth7d1Wktof7anHm9gp
 hAkwJu0aGVaA2oKUbf/iQQF+gwKl0WiJIQClo08eZf2ziAxdiFDbLtvl6e6sWaRY/tITUg3Df
 TkXWwpfG2a+H1K7VK6WvmPIyFknj/mnK2hF6G1VYXA5E6JSgQz3D1ZuFfzQ8dAIee0UNlpxKd
 MmcuV7e9i55WGmEYn+4It7tqKklD6MdMCixAgMGU5Fr0ge4W62FxZN7rfmyF2C0JXcNheJfZQ
 ACO28wAVvW07JdUHBbGE/YMn6yag81aoyueIVvgNgoiXD6YeR0yXkx0GFgNYniTStYrkep6X/
 Ii6jVhm++4h5eeo+l2ENiqkPqh62QAfk7yHGrWkvcFdIJ0LQ7THoGLCnGpJSL2liTt12lpDNj
 Lgw9FdddpbLmQx/1xxhIKRYyhm7si22MGJdXnKLL80pr1PbOmRpaSnINPHlrCHqarQBs7KBk1
 NvJNaV+Dw/ffsnLVzsrGwBkD0ctog/Ndl6K1STzSpX312SsgbjOVRaIGX5AacWqvjn8nf2+Yj
 MPG1vKI1IoOwvWGWos5mY8IaPIBHpJWYHH8eakHMSG1hkBxjwvlZJiwGMTYnN5hOU2Vn6fMLn
 x1Vi4LEu97KPDp5yjJW0wWkLK6UC0bSvl+yU6Qa1Xz4GiUCjw1fpX6hPAkdrvRuGx87x0fbYH
 aXb03is05ARmOszbKEbmwrm6FcOZEh/TprOtS8dgiQWdXjdVcqhhXLAYLPF174lS8VjYAOwmP
 Ioxx8WgBgbx6TDhzq
X-Mailman-Approved-At: Fri, 03 Jul 2020 08:12:01 +0000
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, zhengbin <zhengbin13@huawei.com>,
 Chen Tao <chentao107@huawei.com>, Kalyan Thota <kalyan_t@codeaurora.org>,
 Drew Davenport <ddavenport@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBBIHBvc2l0aXZlIHZhbHVlIEVOT01FTSBpcyByZXR1cm5lZCBoZXJlLiBJIHRoaW5yIHRoaXMg
aXMgYSB0eXBvIGVycm9yLgo+IEl0IGlzIG5lY2Vzc2FyeSB0byByZXR1cm4gYSBuZWdhdGl2ZSBl
cnJvciB2YWx1ZS4KCkkgaW1hZ2luZSB0aGF0IGEgc21hbGwgYWRqdXN0bWVudCBjb3VsZCBiZSBu
aWNlIGZvciB0aGlzIGNoYW5nZSBkZXNjcmlwdGlvbi4KCkhvdyBkbyB5b3UgdGhpbmsgYWJvdXQg
dG8gZm9sbG93IHByb2dyZXNzIGZvciB0aGUgaW50ZWdyYXRpb24gb2YKYSBwcmV2aW91cyBwYXRj
aCBsaWtlIOKAnFtSRVNFTkRdIGRybS9tc20vZHB1OiBmaXggZXJyb3IgcmV0dXJuIGNvZGUgaW4g
ZHB1X2VuY29kZXJfaW5pdOKAnT8KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvZHJpLWRldmVsLzIw
MjAwNjE4MDYyODAzLjE1MjA5Ny0xLWNoZW50YW8xMDdAaHVhd2VpLmNvbS8KaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3BhdGNoLzEyNTc5NTcvCmh0dHBzOi8vbGttbC5vcmcvbGtt
bC8yMDIwLzYvMTgvNDYKClJlZ2FyZHMsCk1hcmt1cwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
