Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F16925552C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 09:29:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBAA96E409;
	Fri, 28 Aug 2020 07:29:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 219B76EB57
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 17:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1598547805;
 bh=0GbW4gwJKwsjIO6hx8k0dSKhtHY6cBuN3kVM003NDGw=;
 h=X-UI-Sender-Class:Cc:Subject:From:To:Date;
 b=NWGurMfvyIA6I9JmjQ/MjWCZyFsQcP+gdcRTWXL8ksc77BzaqRdoS65aPWNaP1Ash
 AbqY4+OCaXFvs3MTOgBraLDhBIUUVKFiO6Mbd0HPGs9hWUZzhxMVdawLwWQhK61LOO
 M8Fb2WtTMRru2aCgyFvmB913HTbzLWCoKRTWmt1k=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.99.195]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MALeD-1kLUKE0VuV-00BZkD; Thu, 27
 Aug 2020 19:03:25 +0200
Subject: Re: [PATCH] coccinelle: api: fix kobj_to_dev.cocci warnings
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
To: Julia Lawall <julia.lawall@inria.fr>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Bernie Thompson <bernie@plugable.com>, Denis Efremov <efremov@linux.com>,
 kernel test robot <lkp@intel.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-ID: <13cd8bf4-06f9-04d7-e923-c397c506e8cc@web.de>
Date: Thu, 27 Aug 2020 19:03:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:BdztK5+Hq431EApYWykmA/Z/elGGkl1+abOC0dGARajHejxVZk4
 PBJm5sZTu7qd0j7N1sorQYvpmQBglbImoUgtLrxLzvod4uCL6LH0o78XpbYtiZRgjnkIXqp
 en1u0A8oMXbWNyJCjy3sKz5MdtgOWIlu2f5dWyCFT18JEFsia5ekWaO6rM9bBkdbTXYI2LS
 6ptQeHl76bQpAqZwPRL2w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BgziP/2SQHU=:e/C8jOFSj8pus7IUqUIs73
 j1KPdkCg9oiq/uCdrI33Hx7nebW8VGmliYKGs9IlRcLpqyxkfHwKQeK7oudVNfhPlirSTb+0J
 e010u7hgKZX+BpkVlQc0qLy3NQwlsb5okdWQ/qca7Jg3Sgb1LuSu1EaPdxh2aC34Iul7QylCB
 bjkVNTYbPBz/cqFGMN8k5xBI85Glv91mTSJhXd81KGm1qnYY3ykntpCcScRnhBzLs+9DxGHfC
 75GlHDxY/mAcDZr+oyQidAjuf+qhV1ffPy14mKHG4mV/v9AJcWfG0yPo0D/TTuhAwLztjuaxn
 /GK4zn74PHf+OD+scnpEj+V/FU3j2qlWwCOralK1F87TBVmDybnq7+UHshJcS4bICH3jZHsck
 TXfpi/qeK1T/CGD7q+rPhEGqi+9nfAXM7m+hUjn+QvsEJLPXQqXTlxZkCWwLkyp002GWNxjIl
 8ZL+PdWlm3/x4x/CdgH1QVaVf16gKevVFqN6KMecvIn25fJ/nXXgByqJQa2SYtjo9wtgyJZir
 3+sBxL49wxbWrXO0JzAJ0j+WJESDUAThgOt7ce83pJbxBQbgcUS0u/ThPgAEcBxMHSmvzjKSt
 jyzUSkpIr/T+6f/QwOgMV/gcXvAS4vkhh3AuQSYCW9g98IGDaiE0hcHOF+Ej+HP4NF87bJWdO
 LDu/VyGtRn5Wd9afK3K149YkwpQubiBhK4B0yt3D39qj2pyxH4Oa6d7vfRbUjajwnkKVlA2dh
 uH858WGPjphhEFEO0gRxcDsxsIMUnoZDBSzkcqdQNfk0ID8omNeJ9wsrhLQ1GIwpxUeAZTRxn
 3q2qGQgQyXo4xdVZIdtgmsphCGEFzxaDozMpyTtGnF1QuC7opFTj7w+ZYu6bj+pUL9NT94/x2
 oG4GH7AqlL3w9pLtmMX/nn8zeeshKKOz/wsw0nEx2WxnnDvr//ouR/8J0AIqpK6sDyCddn3Xf
 Z6ZimgWpfiz0yrCVdUOizaYGahl0jKZL3/ZQ91AbXayMwA8cMmgOHvcv5fPTFWYJxm21dT3vp
 /vNPo8v9KGKOv7u/4I3BE7GUOEDGtOzVNN0c9cIan59rXlztcojqjV5glzsFMnMdiLcasVi1B
 iN0x+mYcP4MpXGA4oYgVYE48m4TI2RoR68M1AdBU3bIFt/qQloZ+da5hI5P8sE1bGsnBspLnl
 R1sMpo0maR/KjgNjJYVBwZPC2RE6G5CvPDB1Ml7wF3jLk0fqaP6aoFCLaPRmE7IYLvjhPQ4K8
 8VZtFoxGiHyfUlsleybu37LZFx68DQQMuuco1Tw==
X-Mailman-Approved-At: Fri, 28 Aug 2020 07:29:10 +0000
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
Cc: kernel-janitors@vger.kernel.org, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBHZW5lcmF0ZWQgYnk6IHNjcmlwdHMvY29jY2luZWxsZS9hcGkva29ial90b19kZXYuY29jY2kK
Pgo+IEZpeGVzOiBhMmZjMzcxOGJjMjIgKCJjb2NjaW5lbGxlOiBhcGk6IGFkZCBrb2JqX3RvX2Rl
di5jb2NjaSBzY3JpcHQiKQoKSSB3b25kZXIgYWJvdXQgc3VjaCBhIGNvbWJpbmF0aW9uIG9mIGlu
Zm9ybWF0aW9uLgoKSSBmaW5kIGl0IHJlYXNvbmFibGUgdGhhdCB0d28gZnVuY3Rpb24gaW1wbGVt
ZW50YXRpb25zIHNob3VsZCBiZSBhZGp1c3RlZAphY2NvcmRpbmcgdG8gYSBnZW5lcmF0ZWQgcGF0
Y2guClRodXMgSSBpbWFnaW5lIHRoYXQgbm90IHRoZSBtZW50aW9uZWQgU21QTCBzY3JpcHQgaXMg
4oCcZml4ZWTigJ0KYnV0IHRoZSBhZmZlY3RlZCBzb3VyY2UgZmlsZSDigJxkcml2ZXJzL3ZpZGVv
L2ZiZGV2L3VkbGZiLmPigJ0gbWF5IGJlIGltcHJvdmVkLgpXaWxsIHRoZSBzdWJqZWN0IOKAnFtQ
QVRDSF0gdmlkZW86IHVkbGZiOiBGaXgga29ial90b19kZXYuY29jY2kgd2FybmluZ3PigJ0KKG9y
IOKAnFtQQVRDSF0gdmlkZW86IHVkbGZiOiBVc2Uga29ial90b19kZXYoKSBpbnN0ZWFkIG9mIGNv
bnRhaW5lcl9vZigp4oCdKQpiZSBtb3JlIGFwcHJvcHJpYXRlIGZvciB0aGUgcHJvcG9zZWQgY29t
bWl0IG1lc3NhZ2U/CgpSZWdhcmRzLApNYXJrdXMKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
