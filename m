Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D352175E6D
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 16:42:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 814506E4A6;
	Mon,  2 Mar 2020 15:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A73BB6E4A6
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 15:42:05 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200302154204euoutp01eca4cfac8d7b20b92b126de133ed0208~4hwTl8HNe1219112191euoutp01Y
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 15:42:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200302154204euoutp01eca4cfac8d7b20b92b126de133ed0208~4hwTl8HNe1219112191euoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1583163724;
 bh=62n5L9v5rQRWqOZCS7tfMOpnlq+4xpKfACnaEmdnNkA=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=Lghe5qc8YFmh9PhN0Ym5ibm9SrvNGWkuuMv7iqPrsWYu+ZFxh0/VNIJM4ksB10PDL
 60PC7vNrRe3gC3rQx+MiYbIW/PO6hbxYP6UpbyF4Flh9IViZSFL/gnFMnyFp4rxB9s
 8J8GQ+ED9ybAX7cLNMGzgs6rSd1mRwhQ0UvqtWKo=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200302154204eucas1p2e746248965c2b856f64b5d96205b2b2a~4hwTg9fVu0750207502eucas1p2v;
 Mon,  2 Mar 2020 15:42:04 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id C9.B3.60698.B492D5E5; Mon,  2
 Mar 2020 15:42:04 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200302154203eucas1p1cd37854122864015dae457e565e839dd~4hwTPve4Z1688116881eucas1p1B;
 Mon,  2 Mar 2020 15:42:03 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200302154203eusmtrp183f1fd03af76dc7167feec3f123d0412~4hwTPI_YI2862728627eusmtrp14;
 Mon,  2 Mar 2020 15:42:03 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-2e-5e5d294b5a01
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id B2.10.08375.B492D5E5; Mon,  2
 Mar 2020 15:42:03 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200302154203eusmtip2a59d5e86c8e6d9e8eb71d6f3581db255~4hwS3__Tn2189221892eusmtip2H;
 Mon,  2 Mar 2020 15:42:03 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 1/2] video: fbdev: wm8505fb: fix sparse warnings about
 using incorrect types
To: Sam Ravnborg <sam@ravnborg.org>
Message-ID: <10a975e2-cd2a-24c1-b28d-12ea0808a0dd@samsung.com>
Date: Mon, 2 Mar 2020 16:42:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200117185851.GA24722@ravnborg.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBKsWRmVeSWpSXmKPExsWy7djPc7o+mrFxBlvzLa58fc9msenxNVaL
 E30fWC0u75rDZrHi51ZGB1aP+93HmTw2L6n3WDLtKpvH501yASxRXDYpqTmZZalF+nYJXBkz
 n55iL1jDUnHj/zWmBsbzzF2MnBwSAiYS0+5/YQGxhQRWMEq8u8bUxcgFZH9hlHjz6hQrROIz
 o8T/XzIwDX9vHmeFKFrOKPG5pYkdwnnLKNF9/ijYWDYBK4mJ7asYQWxhgSSJg2emsoPYIgLK
 EsfPXwPrZhZoY5SY/WU9G0iCV8BO4uKOBWB3sAioSHQuWg/WLCoQIfHpwWFWiBpBiZMzn4DV
 cAoYSWw+cwxsKLOAuMStJ/OZIGx5ie1v50D9tohdYsdtRgjbRWLl4YNsELawxKvjW9ghbBmJ
 05N7WEAOkhBYxyjxt+MFM4SznVFi+eR/UB3WEnfO/QKyOYA2aEqs36UPYkoIOErMuh4EYfJJ
 3HgrCHECn8SkbdOZIcK8Eh1tQhAz1CQ2LNvABrO1a+dK5gmMSrOQPDYLyTOzkDwzC2HtAkaW
 VYziqaXFuempxcZ5qeV6xYm5xaV56XrJ+bmbGIHp5fS/4193MO77k3SIUYCDUYmHN4A5Nk6I
 NbGsuDL3EKMEB7OSCK8vZ3ScEG9KYmVValF+fFFpTmrxIUZpDhYlcV7jRS9jhQTSE0tSs1NT
 C1KLYLJMHJxSDYxsrD+C196Lfii/am7g5Q/3yvROlS89asUVKd3pJKH9t6q6ZFrO329pJQt/
 vnXPb7p1/V1r+OmW9sK70rsq10Q3vDmmmuz1iGlfzsR1yipbq6w5GVY1vg58xLPyhe7mHVK/
 shpjfHUj2ZwVNk+UXNHF+0+gUuh770Guvpttc0RnfShec5d9X4kSS3FGoqEWc1FxIgC5RRpu
 KwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRmVeSWpSXmKPExsVy+t/xe7remrFxBvue6Fhc+fqezWLT42us
 Fif6PrBaXN41h81ixc+tjA6sHve7jzN5bF5S77Fk2lU2j8+b5AJYovRsivJLS1IVMvKLS2yV
 og0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQyZj49xV6whqXixv9rTA2M55m7
 GDk5JARMJP7ePM7axcjFISSwlFHi76bbjF2MHEAJGYnj68sgaoQl/lzrYoOoec0o8e3MUxaQ
 BJuAlcTE9lWMILawQJLEwTNT2UFsEQFliePnr4ENZRZoY5SYe+wQM0T3LkaJfQc2gFXxCthJ
 XNyxAGwSi4CKROei9WCTRAUiJA7vmMUIUSMocXLmE7AaTgEjic1njoH1MguoS/yZd4kZwhaX
 uPVkPhOELS+x/e0c5gmMQrOQtM9C0jILScssJC0LGFlWMYqklhbnpucWG+oVJ+YWl+al6yXn
 525iBMbVtmM/N+9gvLQx+BCjAAejEg9vAHNsnBBrYllxZe4hRgkOZiURXl/O6Dgh3pTEyqrU
 ovz4otKc1OJDjKZAz01klhJNzgfGfF5JvKGpobmFpaG5sbmxmYWSOG+HwMEYIYH0xJLU7NTU
 gtQimD4mDk6pBsbKkpxWeSll9e/qu24UPG3cdXXl/WtrNSc+lnhjsPjBpJZHHxgTXaWOnlVW
 vfpDxt7ykdLHaX+XGjX+bGTqsziuJdnq8OLbqsDv/9feufri07v723fO7qgTvKTwV7juCMuy
 TS/U10o8U55+bfWqzPULf512XZ59Ya35tuMP9Kv91t9o3N4SfMmiXYmlOCPRUIu5qDgRAOn9
 ONnBAgAA
X-CMS-MailID: 20200302154203eucas1p1cd37854122864015dae457e565e839dd
X-Msg-Generator: CA
X-RootMTR: 20200116145653eucas1p2222fb48dd6fe1023a4152e687ec577d5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200116145653eucas1p2222fb48dd6fe1023a4152e687ec577d5
References: <CGME20200116145653eucas1p2222fb48dd6fe1023a4152e687ec577d5@eucas1p2.samsung.com>
 <567cba81-5fec-4d91-f711-c0bdbfe5b513@samsung.com>
 <20200117185851.GA24722@ravnborg.org>
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
Cc: linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/17/20 7:58 PM, Sam Ravnborg wrote:
> On Thu, Jan 16, 2020 at 03:56:50PM +0100, Bartlomiej Zolnierkiewicz wrote:
>> Use ->screen_buffer instead of ->screen_base to fix sparse warnings.
>>
>> [ Please see commit 17a7b0b4d974 ("fb.h: Provide alternate screen_base
>>   pointer") for details. ]
>>
>> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Thanks, patch queued for v5.7.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
