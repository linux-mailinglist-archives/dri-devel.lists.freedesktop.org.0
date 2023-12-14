Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A66B08125FA
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 04:39:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8DF310E8AF;
	Thu, 14 Dec 2023 03:39:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 091F110E8AF
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 03:39:28 +0000 (UTC)
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20231214033926epoutp012492ac9d2192d8a2525d4ad5d73cd0bb~glZ5VTElq0847408474epoutp01n
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 03:39:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20231214033926epoutp012492ac9d2192d8a2525d4ad5d73cd0bb~glZ5VTElq0847408474epoutp01n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1702525166;
 bh=oZGojsTaKV3z5XZlFVlJ4SAv73S6D4gkF2TIFY3/dm4=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=PHnDroDb8h565gTEHnXdqOUgTRYxhCmCgHh3Ac8S9IZchLVCiOk0UDo5SiF1uRknp
 yhvhbCe0X/7GpIxGjwLBSSJPrXYo+GfwQGyRZiZyZ/R6cFi5n/skbQwtK2OHqLKdE4
 agsT9RzGVBOd5tY0JqZoKagqozbLyeINMiUDbFS0=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20231214033925epcas5p4ac2a884d47713ee69fb621954b2c9aa9~glZ4Z34eo1412614126epcas5p4h;
 Thu, 14 Dec 2023 03:39:25 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.176]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4SrJ4W563Jz4x9Pr; Thu, 14 Dec
 2023 03:39:23 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 A6.F4.09672.BE87A756; Thu, 14 Dec 2023 12:39:23 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20231214033923epcas5p206f2e64ca52b37560a9fcc176cf4ac1e~glZ2P05qk2518125181epcas5p2Q;
 Thu, 14 Dec 2023 03:39:23 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20231214033923epsmtrp29892029d3ecd928c27d9f66e5c3657dc~glZ2O8UMT0036100361epsmtrp2c;
 Thu, 14 Dec 2023 03:39:23 +0000 (GMT)
X-AuditID: b6c32a4b-60bfd700000025c8-87-657a78eb02b3
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
 7B.6F.18939.AE87A756; Thu, 14 Dec 2023 12:39:22 +0900 (KST)
Received: from INBRO000447 (unknown [107.122.12.5]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20231214033920epsmtip1a230f85910395a4e85e58253695e3ac3~glZz9GOB81650516505epsmtip1T;
 Thu, 14 Dec 2023 03:39:20 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Rob Herring'" <robh@kernel.org>, "'Inki Dae'" <inki.dae@samsung.com>,
 "'Seung-Woo Kim'" <sw0312.kim@samsung.com>, "'Kyungmin Park'"
 <kyungmin.park@samsung.com>, "'Maarten Lankhorst'"
 <maarten.lankhorst@linux.intel.com>, "'Maxime Ripard'" <mripard@kernel.org>,
 "'Thomas Zimmermann'" <tzimmermann@suse.de>, "'David Airlie'"
 <airlied@gmail.com>, "'Daniel Vetter'" <daniel@ffwll.ch>, "'Krzysztof
 Kozlowski'" <krzysztof.kozlowski+dt@linaro.org>, "'Conor Dooley'"
 <conor+dt@kernel.org>
In-Reply-To: <20231213224201.2191358-1-robh@kernel.org>
Subject: RE: [PATCH] dt-bindings: display: samsung,exynos-mixer: Fix 'regs'
 typo
Date: Thu, 14 Dec 2023 09:09:19 +0530
Message-ID: <007301da2e3f$20c35320$6249f960$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQGvaXTBCeAb7VPGqzttC4JYofnLoQCQk5KBsPkmauA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02TfUxTVxjGd3pvb0uXusvXPJQESgOZ4IBWS7klwkiEeSP+gYNlbiHiHZxQ
 Rmm73jJAs80M7UAyZ3UxWBGRaTGEBVYZFIFJQIbMANMBi3FAQWAwUXFYZDLGWq46/vu973me
 vOc5H0LMZ5KQCHN1JmTUMVoZIcKbu8O3RN4vOojkruFQ6sZvNTyqvmOAR601WzDq/PUBPjXk
 ekRQJ8dP4NTgYKOAOj47gVH9X8wLKPu9ET7169VKgqoY/JFHXXj8A06Zy2x8aq3dIaAqTs0R
 VNO8hZ/oTXcsVeN0q3VUQNvrygj695F2gq7q20uPl/fy6CsXP6ePN9UB+srNQ/SiPShV9EHe
 Dg1ispFRinRZ+uxcXU68LCUtc2dmjEquiFSoqViZVMfko3hZ0p7UyLdzte44MuknjLbA3Upl
 WFYWnbDDqC8wIalGz5riZciQrTUoDVEsk88W6HKidMgUp5DLt8W4hQfyNJcu7jVUi4raS54Q
 h8G88BjwEkJSCW+fbiI87EO2AXi0jToGRG7+C8A/npwWvCzaZzuIF46x8rOAW2gF8JfVHoIr
 ZgGcblnie1QEGQkd35rXF/zIRQzO1NZingIjJwCs6FoFHpUXGQtLmy3rDl/yHVjfaF5nnAyD
 g+ZOzMNiUg1b68b4HHvDvjNTuIcxMhi2PKjEuD1J4d/TNj7X3wzneq4LPOxHxsEbdtd6CEiu
 CeFsyTM+Z0iCz1wdOMe+8M/eJgHHErj40BNU6GYa1vwj4doa+KC2AXD8FuwcqsQ9EowMhw1X
 o7mxm+BXK1M8zimGpWYfTh0GSx4OPx8UCC3l5c83QMM743b+CRBi3RDMuiGYdUMY6//DqgFe
 BwKQgc3PQWyMYbsOFb687yx9vh2sP/aIFAeYdC5EdQGeEHQBKMRkfuI+RyHyEWczxQeRUZ9p
 LNAitgvEuE/bgkn8s/Tu36IzZSqUarlSpVIp1dtVCtlm8f2j57J9yBzGhPIQMiDjCx9P6CU5
 zNu2Py7jTEHo0J5Tk2kfTzWWbP2sXpysCrUlL7GJ8yUfmc+XVcc1F6b6aqdHbmempi07q4vD
 2ys7zmbF7jOffH/U9kqSxJWcIr/rdHV3vTmwrLR+yfs3uNN5aG14pn5XTEvRq4EkUUlklIY8
 /X75sTmhwlGT0H9rbuu5moUyAl7LFU8UK34+slhKJKZ/HX9NNZfv1P/0IaN4d/dTtjXpvXuW
 BX4D2JdyZ6lfF+zVf2Fnr8ibeq3H1z896JvCm+mqok/FEY8G28rU4EhUgGY/khy4JQ2oer1b
 PDqb4RV06Q2UFwQ3hazixsTdlwPvrogaWkdsnWEDaifr/110z0zKStWYDGc1jCICM7LMf0VW
 Mcd1BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRmVeSWpSXmKPExsWy7bCSnO7riqpUg71OFieuL2KyWLP3HJPF
 /20TmS3mHznHanHl63s2i0n3J7BYnD+/gd2i78VDZouzTW/YLTY9vsZqcXnXHDaLGef3MVks
 /LiVxaKtcxmrxf89O9gtZkx+yWax5c1EVgdBj73fFrB47Jx1l91j06pONo871/awecw7Gehx
 v/s4k8fmJfUefVtWMXpsPl3t8XmTXABXFJdNSmpOZllqkb5dAlfG0iWBBQu4KvY0f2FrYHzD
 0cXIySEhYCJxr3s2YxcjF4eQwHZGidn9C5khEtIS1zdOYIewhSVW/nvODlH0jFFi1cXPYAk2
 AV2JHYvb2EASIgI/mSXW7r7FAuIwCzxllHj8cg/U3A5GiamzJ7KCtHAKmEt0bIOwhQUCJBb3
 /2IDsVkEVCXOtx0A280rYCmxc9U9VghbUOLkzCdAUzmApupJtG1kBAkzC8hLbH87B+pUBYmf
 T5exQsTFJV4ePQJ2nYiAlcSJTV/ZJzAKz0IyaRbCpFlIJs1C0r2AkWUVo2hqQXFuem5ygaFe
 cWJucWleul5yfu4mRnBUawXtYFy2/q/eIUYmDsZDjBIczEoivCd3lKcK8aYkVlalFuXHF5Xm
 pBYfYpTmYFES51XO6UwREkhPLEnNTk0tSC2CyTJxcEo1MK2Zeft9F1uciFjU7p3vToc6+83t
 u3Z1fVfeg7y3Hs8nzWMVYrE+c9Ll2vLFf3zVjs/1f3ec9Xpt5revxuJbWf5pzoyIbvbrEJw6
 89zaideDDtScvjBdefnZ5s09sieCMkrSKy5fjWQvyjr84eUWdjHXmyfjuu6b+rKtfNSStM13
 0stGTTfOjkLZ/ULe/crvXmw/fldppfedcxvYraJ3p6p83lZzvORMxBctMY6fprek9phLFUhu
 4pQLSI30/zA94snB3ccntz7L4LrcZVRe5j7JfRnLionvX34X3+ZymmnhqcT6gz+v7Cw7UPYj
 8bhcAHuH3ZnWCSumXHqyRCY988rWhf+TOt7kqZyZOu9/IW+eEktxRqKhFnNRcSIAzIsl8VkD
 AAA=
X-CMS-MailID: 20231214033923epcas5p206f2e64ca52b37560a9fcc176cf4ac1e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231213224223epcas5p31386d8403f97b986d39cd738af0ba781
References: <CGME20231213224223epcas5p31386d8403f97b986d39cd738af0ba781@epcas5p3.samsung.com>
 <20231213224201.2191358-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 'Krzysztof Kozlowski' <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Thursday, December 14, 2023 4:12 AM
> To: Inki Dae <inki.dae@samsung.com>; Seung-Woo Kim
> <sw0312.kim@samsung.com>; Kyungmin Park
> <kyungmin.park@samsung.com>; Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com>; Maxime Ripard
> <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>;
> David Airlie <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>;
Krzysztof
> Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley
> <conor+dt@kernel.org>; Alim Akhtar <alim.akhtar@samsung.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>;
dri-devel@lists.freedesktop.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [PATCH] dt-bindings: display: samsung,exynos-mixer: Fix 'regs'
typo
> 
> The correct property name is 'reg' not 'regs'.
> 
> Fixes: 68e89bb36d58 ("dt-bindings: display: samsung,exynos-mixer: convert
> to dtschema")
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
Thanks,

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

>  .../bindings/display/samsung/samsung,exynos-mixer.yaml      | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
[snip]
> 2.43.0


