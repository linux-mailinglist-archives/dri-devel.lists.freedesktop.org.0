Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 073A01A3036
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 09:34:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0686EB86;
	Thu,  9 Apr 2020 07:33:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A010A6E99B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 12:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1586348431;
 bh=VNnQ6Zmj3bQlqQMA5yxB7qWSZuLfYMiaZZL53XywQbU=;
 h=X-UI-Sender-Class:To:From:Subject:Cc:Date;
 b=M6vaN3YcLlLdoMMhsHrF3vt0FqDIgaFoeMf4Jbo+wBlGg1VjFmmWJndwtz1N8zc8M
 K+dtUrTSLn6E13NNOvnAjVyG/1fsjhwMJj40kBZhi0lX/+5WwUTUM7hvnUD6DFZDHo
 ERQJXfphGZx0eMr9wfB1LmPYImYOrr6cDa2MMMeo=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([78.48.170.28]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MV4hR-1jnNEA0ytx-00YTk8; Wed, 08
 Apr 2020 14:20:31 +0200
To: dri-devel@lists.freedesktop.org, Linus Walleij <linus.walleij@linaro.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: drm/mcde: Checking for a failed platform_get_irq() call in
 mcde_probe()
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <abd9674c-adf7-b040-814c-076e32a5a48e@web.de>
Date: Wed, 8 Apr 2020 14:20:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:fJsj9EGtQRoIZSX4yIB+H9dYKQ11JanGW+a7+d0e0OVkqcsSRwR
 Q9SoK5nsw3jZOcPNpbB9t5YTqiHZvygGn9+Zbtlh7djw7YWLbY3Rgpnz0AbHgNBXoAcSxZC
 qyxRcihT9oSisP4I4/xQ9iXPU7mcBbMMwwfhCOK1fCT7gobUt3ftBy41dvYEuRGPgRgO8O4
 wwn3bherDf8Wq1qlZnqtQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YitY0hQW7l4=:70MIBtTbWPQO+81QXSQuAH
 ZbqvU1rGIu1KvNxfSJst9uYiGsUWPGrvvE6I3UriCT/s4+pHK2Qmzb5ncFK7BfoaSyWfylLYU
 3eUieZ7+yBB8aX86E8JrtBoSTYiRgme7HvCaTYMUYeWNjwrhCUJqNxtlhF8jKjDnXL4CY+aEm
 nFhEqnUgv1vXukuvclaSijQJ5sV1WbVxGXJJ2+ZLi8QCVTs8O5P9EtKDPd9QIWWqOZUIdjfeb
 G7IsIjJ54s5MtUNvSIE7FFNNvP/CVs94XBsEck3h5I0mZp1DRX8sUlGegznwwdAmsHwkumDse
 PGGNK6Kp15PDVM1fEpyQpPik8MCv5XBp04MyOXv00saJgk/2y38rXoHzrKp/fSgo6fBL/vVeb
 cgKbp0u8UK/FMha/MJ/Bqe/P+s5ZnOh7KucmJO3fUxrmWAhGrybAU0UI9pHU2plZj1DC8jC3O
 P6C4VWITadD39+1b/5sBD48NnQyFrCv2euWJdnRTCKMcpDopVMxVBYB9M6ULAP/TVdYOPT3M5
 ziLTLSCILwTHD/aXUgGDHnwD2RvjNwTVoT4SgWqQbSwZ1bxOLoo2itep2nJ/qVGSB+XbY/Z+t
 V5z4RwdebSDuiB80suraTjqPJAk+UiBUAxS2JZfRsq5Gue8NMVCTYFa0eHbXwJEt103pZTzJe
 hcL0uGv/J+4LdVdW6SkRGyIUSdrqSHSdaXcRfPnbP06dHh6Z/j4d2G9xOYYA89raxniGrjLwD
 kvdQT8WHc5JnCLXV3klFBXOIzkTtjJf9CssG9uPuxZ3FU+kYlngp1dREpxYZ0YJX+3SF90Dfo
 HJze7RGYHpQAHH7Sw/onXBIcftUfAKHsrnAmm0NViQwDs3f+DgeGUNwB7B6A+jShgkkb4lbw5
 Yab3c0XhKmOZzbjjmLU66+uD3h1nfTXe2q+qpCJHng3jQSU3TrXHibDEKIzQWH31grQgFMJ+K
 uvMpyZNiXLdQHvGIJNk2wEQ1qySl9Pqa7YPY3IukKMG5vgmC42PVs/07LsHyAwk1exrJkzI1P
 Yurdfs0glqpoG57uIAz2Dc8YnsRNuwH9aqrI6T2fF5ep1aH3B2FjL2FGltNsVWQv8c4eusVXV
 Dmzy5NnnZ53jXc1o9M/8+9lqPpq6Otb90BchvN+IFPTFO3aagBJrUNEpRzfzurbfv7SyV2mIj
 CKfjtEsRlMjpdUfHbzQoM8soaNkQnsQCCJqovo2BNankCMxrU7X3pOIAglBWSwEMFp/pXEtBr
 eJt7ZP31rNBTwJ5yL
X-Mailman-Approved-At: Thu, 09 Apr 2020 07:33:24 +0000
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Tang Bin <tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpJIGhhdmUgdGFrZW4gYW5vdGhlciBsb29rIGF0IHRoZSBpbXBsZW1lbnRhdGlvbiBv
ZiB0aGUgZnVuY3Rpb24g4oCcbWNkZV9wcm9iZeKAnS4KQSBzb2Z0d2FyZSBhbmFseXNpcyBhcHBy
b2FjaCBwb2ludHMgdGhlIGZvbGxvd2luZyBzb3VyY2UgY29kZSBvdXQgZm9yCmZ1cnRoZXIgZGV2
ZWxvcG1lbnQgY29uc2lkZXJhdGlvbnMuCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4
L3Y1LjYuMi9zb3VyY2UvZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9kcnYuYyNMNDAxCmh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4
LmdpdC90cmVlL2RyaXZlcnMvZ3B1L2RybS9tY2RlL21jZGVfZHJ2LmM/aWQ9ZjVlOTRkMTBlNGM0
NjgzNTcwMTllNWMyOGQ0ODQ5OWY2NzdiMjg0ZiNuNDAyCgogCWlycSA9IHBsYXRmb3JtX2dldF9p
cnEocGRldiwgMCk7CiAJaWYgKCFpcnEpIHsKIAkJcmV0ID0gLUVJTlZBTDsKIAkJZ290byBjbGtf
ZGlzYWJsZTsKIAl9CgoKVGhlIHNvZnR3YXJlIGRvY3VtZW50YXRpb24gaXMgcHJvdmlkaW5nIHRo
ZSBmb2xsb3dpbmcgaW5mb3JtYXRpb24KZm9yIHRoZSB1c2VkIHByb2dyYW1taW5nIGludGVyZmFj
ZS4KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFs
ZHMvbGludXguZ2l0L3RyZWUvZHJpdmVycy9iYXNlL3BsYXRmb3JtLmM/aWQ9ZjVlOTRkMTBlNGM0
NjgzNTcwMTllNWMyOGQ0ODQ5OWY2NzdiMjg0ZiNuMjIxCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4u
Y29tL2xpbnV4L3Y1LjYuMi9zb3VyY2UvZHJpdmVycy9iYXNlL3BsYXRmb3JtLmMjTDIwMgoK4oCc
4oCmCiAqIFJldHVybjogSVJRIG51bWJlciBvbiBzdWNjZXNzLCBuZWdhdGl2ZSBlcnJvciBudW1i
ZXIgb24gZmFpbHVyZS4K4oCm4oCdCgpXb3VsZCB5b3UgbGlrZSB0byByZWNvbnNpZGVyIHRoZSBz
aG93biBjb25kaXRpb24gY2hlY2s/CgpSZWdhcmRzLApNYXJrdXMKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
