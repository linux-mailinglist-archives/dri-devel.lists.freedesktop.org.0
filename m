Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E28DAA9063E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 16:25:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A736A10E947;
	Wed, 16 Apr 2025 14:25:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="BpubTfbn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A8D10E947
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 14:25:08 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250416142506euoutp01dd113087175c007547020e20dabe5631~20qPU01Mx1837218372euoutp01X
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 14:25:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250416142506euoutp01dd113087175c007547020e20dabe5631~20qPU01Mx1837218372euoutp01X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1744813506;
 bh=shUz1heMGc/0v/n7nVwvI1VZPkVH2FhMEMQCajNspuE=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=BpubTfbnQgjjSza7H4yjO/XIeP8cXOxKjl0xBMHGiUDLBUbzqldxyeSmsHvLIMiq2
 Zstd/bo4e6yO78TwiJ5P+KRPHgxU81vlaVylfS0g/1XaD4Fc1vIpekKmV9s2jXubY5
 R2bPCt4tkJHYCvgSjOoQH78oAb3MAAOxCqagHmTA=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250416142506eucas1p19fe6562f1fa472d4cdf730e6001208f4~20qOyJNCI0172801728eucas1p16;
 Wed, 16 Apr 2025 14:25:06 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id C1.88.20409.1CDBFF76; Wed, 16
 Apr 2025 15:25:06 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250416142505eucas1p2fffb9ed80d3741d3f8f0c32fa47d1b82~20qOTfI982575125751eucas1p2H;
 Wed, 16 Apr 2025 14:25:05 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250416142505eusmtrp1a1daf89c1b4ba691b759c376629cb1b0~20qOSm5Po0635206352eusmtrp1r;
 Wed, 16 Apr 2025 14:25:05 +0000 (GMT)
X-AuditID: cbfec7f4-c0df970000004fb9-e3-67ffbdc124c3
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id CD.B1.19654.1CDBFF76; Wed, 16
 Apr 2025 15:25:05 +0100 (BST)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250416142504eusmtip179c28fc737df25cb9be21b56335766a6~20qNAXxzq1603616036eusmtip1y;
 Wed, 16 Apr 2025 14:25:04 +0000 (GMT)
Message-ID: <60914de9-f507-4099-be53-ea1fc282c537@samsung.com>
Date: Wed, 16 Apr 2025 16:25:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/21] drm/imagination: Add reset controller support
 for GPU initialization
To: frank.binns@imgtec.com, matt.coster@imgtec.com
Cc: p.zabel@pengutronix.de, m.szyprowski@samsung.com,
 linux-clk@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 mripard@kernel.org, linux-kernel@vger.kernel.org, tzimmermann@suse.de,
 linux-riscv@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch,
 aou@eecs.berkeley.edu, dri-devel@lists.freedesktop.org,
 ulf.hansson@linaro.org, linux-pm@vger.kernel.org, jszhang@kernel.org,
 palmer@dabbelt.com, guoren@kernel.org, maarten.lankhorst@linux.intel.com,
 wefu@redhat.com, paul.walmsley@sifive.com, jassisinghbrar@gmail.com,
 drew@pdp7.com, robh@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
 krzk+dt@kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20250219140239.1378758-14-m.wilczynski@samsung.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUxTVxjHd+69vbd0K7sWNo5MR1K3ZRsTGWHxiMZh4rL7ZTr8AMZl2Gpv
 KpEW1sLGHAnMAiqUQXEKlg6Yc0IIHeN1wKiM2lHkpYrKi4QWiDVQxstqAccQGOXOjW+/83/+
 z/k/z8nh46JfyUB+nDKJVSml8WJSQDR2LNl2mk1r8tD7Ghx1Dl7FUMOynkJVJhuGSi02HnLc
 rcfQ/YU5Ev306A6FJk1fE2ig4jsKaTqqSeTSO0jk1jp46F6LgUSeXAtAjZ4MEhktdgp9724g
 0LWmFoCyLlznob6uD5Dd0Ukg1z0tjrL0L6K11iYKrQ7UEKh4to1C9dM6HrIaY1BG27dE5HZm
 biiTYqZdLoK5eX6eYkyLZQTTrLdTjLa5BzC1lRdIZmSglWRKbkUxozlWjKm7lsZkGDswJm8l
 lJm70U8y39RXAuauZpD6WHRMsE/Gxsd9zqp27ZcITuVop8hE4wspmjs/gnSgE2QDHz6kw6F1
 ScfzsoiuANDSfiQbCNZ5HsDf+h9TXMEDoLY86lnD5eUiHmcqXzedHQfcYQbAh08XMK9LSO+H
 cw7DBhP063BqwkZy+hZ464qT8PJLdBAcHS7aSPCjZXBwbRR42Z8OgznpGYT3UpzO5kFTS/VG
 AacD4LCzdONSct00Vl66Pgaf70MfgFdqYzlLENQ0FOPeXkj3CmDh9Zs8buyD8E+XBnDsB6es
 9RTH22D3RS3BcQIca3iMc5wKm7XWf3kvHLH9TXqzcPotWN2yi5MPwPTZPswrQ9oXDs1s4Ubw
 hQWNhTgnC+H5LBHnfgNe0ub+F2qraMTygVi/6VH0m3bUb1pG/39uGSAqQQCbrFbIWXWYkv0i
 RC1VqJOV8pCTCYpasP6/u1et802gfModYgYYH5gB5ONif6Ft96pcJJRJvzzDqhKOq5LjWbUZ
 vMInxAHCq22ZchEtlyaxp1k2kVU9q2J8n8B0LLJQKIt+P9gjyOIfeijBHvQk1Sk+2arbcbvb
 /fS1Avt8TVFY3YSfaWDnZxMpsZRlz+HQ3DbXV2eqfkbsSpDnyavFEl2MIF9RdvbNscXdCrt4
 bU/CDVnmovFJQ7T9r99jpiMkk+UDNQcvnavk/dI1XoWUXZOBNTNbH7zcviNvqUjtLH5HdzHC
 VlG3fTjV0Os5asxxrj5K7ZuMPLZymddaGJE1Hjx9Ynnwo5K05xbjJO7Skfay8NgTf5j3OmaP
 FCQesoQP5UTJbB/6LzkzJUc7e94zLEyc7Ld+6ru2+MO59pLT+Z2hjpZKezRIsVdvG+/1Sdt3
 2JB3O/J5hcifDQk+3tcfLibUp6Tvvo2r1NJ/AMaqa21OBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf1CTdRjvu71738Gx42WM4z2uRHdy3Vm+bIOx7zwk7drdm16X/lFdFtmE
 143cGO2HaXclNWbIKEQ9nBMZKJoQk6QxkRzImiCosFSGURteUroFLcLsZMYa23Xx3+eez6/n
 nnvYTO4YK4tdVq6nteVyFR9NRq4tDvnXDriiCsHlqWx4deIkA3ZHrBjscI0yoM0zyoKBmw4G
 vP1XGIXnfvFi8IHrEwT6zp7AoHGwE4VBawCFc7UBFrzV24jC+c89ADrnq1Bo9/gx2DLXjcDW
 nl4A9x84w4Lfj8igP3AVgcFbtUy435oKo5d6MLjoO4/A47/3Y9AxU8+CQ/Y3YFX/EWTDM1T4
 jgmjZoJBhPqu+iFGuR41I9RFqx+jai9eB1RX+wGU+sl3CaWahrdSU+YhBvVN6z6qyj7IoOr+
 EVDhvnGU+sLRDqibxglsC3cbWajVGPT0SqVGp1/Pf0sIRaRQCklRvpQU5kmK14nE/NyiwlJa
 Vbab1uYWvUsqzbUhtMKessfoPQ0qQX1yDUhiE3g+0RCxsGpAMpuLnwZEzY0QSBBPEz5zEEng
 dOKJrwZNiH4DxLDVHSc4eBERDjQyljCC5xCh+6NoYp5GDB+bjmsy8GxiatKCLeF0vJSYiE7F
 C3i4iDBXViFLoUy8hkVM986ARMMIIFofm+IqJp5JTE7b4g1ozHH3S1tsVzY7Cd9IHOt6Zwky
 8WeJziZuQp1NGLuPMw8CrnXZGtZlQdb/HdZljmaAtAMebdCpFWqdiNTJ1TpDuYIs0ai7QOyz
 nIOPHT2gLTRHugGDDdyAYDP5PM6oZFHB5ZTK935IazXbtQYVrXMDcewU9cysjBJN7DXL9duF
 BQKxML9AKhBLC/L4mRz09thOLq6Q6+ldNF1Ba//zMdhJWZUMBe/RhRu1Ty1+fXj2R62gEvS5
 nKslppSo4H2Kfv0DR15K6uTz69X3VXV/SNddf+9BGJmrJv9Ene49TEvftcD5wc41/W92HLqL
 oNTagVNve3wl3isPF7ZFGzc7J8dsfY0tfnuhbNVXv86zHRRd3XnH/Gqyvvijww2Zr/2wcOiM
 TGLyXvlsc1rGt+KBFQt9nLKNxgrZuaNP+G2Wv2eP0htcz6168VOTR5W9e4f1ZEPW+I6ijoOp
 FwwFL4w0paWckpxAc/faxiI5ZBGxRRk5+/J4pE6TuikHbl2Z3nvZ8jMv9NKmthWzO8eR1cWv
 fHykZVq4Sylr2Fd/L83v9jbfG5FIOWGSj+iUcuEaplYn/xdqyz204gMAAA==
X-CMS-MailID: 20250416142505eucas1p2fffb9ed80d3741d3f8f0c32fa47d1b82
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250219140306eucas1p19ba425ddb1e499ef1014b1665be9de8e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250219140306eucas1p19ba425ddb1e499ef1014b1665be9de8e
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <CGME20250219140306eucas1p19ba425ddb1e499ef1014b1665be9de8e@eucas1p1.samsung.com>
 <20250219140239.1378758-14-m.wilczynski@samsung.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/19/25 15:02, Michal Wilczynski wrote:
> All IMG Rogue GPUs include a reset line that participates in the
> power-up sequence. On some SoCs (e.g., T-Head TH1520 and Banana Pi
> BPI-F3), this reset line is exposed and must be driven explicitly to
> ensure proper initialization.  On others, such as the currently
> supported TI SoC, the reset logic is handled in hardware or firmware
> without exposing the line directly. In platforms where the reset line is
> externally accessible, if it is not driven correctly, the GPU may remain
> in an undefined state, leading to instability or performance issues.
> 
> This commit adds a dedicated reset controller to the drm/imagination
> driver.  By managing the reset line (where applicable) as part of normal
> GPU bring-up, the driver ensures reliable initialization across
> platforms regardless of whether the reset is controlled externally or
> handled internally.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  drivers/gpu/drm/imagination/pvr_device.c | 21 +++++++++++++++++++++
>  drivers/gpu/drm/imagination/pvr_device.h |  9 +++++++++
>  drivers/gpu/drm/imagination/pvr_power.c  | 22 +++++++++++++++++++++-
>  3 files changed, 51 insertions(+), 1 deletion(-)
> 

Hi Matt,

This commit, along with the corresponding change in the DT bindings,
doesn’t appear to conflict with the work you're doing for Rogue series
enablement.

Would you prefer if I re-send them as a mini-series so you can consider
picking them up for the next kernel release?

Regards,
Michał
