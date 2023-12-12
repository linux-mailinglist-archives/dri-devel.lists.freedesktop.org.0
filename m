Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2190380ED3D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 14:18:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7619210E592;
	Tue, 12 Dec 2023 13:18:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1260110E592
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 13:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1702387083; x=1702991883; i=deller@gmx.de;
 bh=wkHWbQi8l1Uix6JDbIqPjm1cE193FYxG7+kIXrzU73s=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=X17BEak1jDR4wO5pTqJJ9jFEu20pvpVQ45NhvOlLyw218PixI7fF1UjMhUoSXl6R
 nZAxP79eM5iBEt6bqnkJMFow8iyXYoXV49NXYICqVFF6+F2ho8ELDsljQUklC7k2J
 Rlks09/lXRb4RAcnj8GR3qsj+RjnT6pi8E2FbMLd9XJqwKEy+jwqb/PBpMO15RxUy
 a3t2ASa1USn5UlNLotQLMtUsLKYfskY/pEGOnreGjMyfFtSB5/oaqq3fedX+5GHZT
 h1rPRvVWytjHAAA2J7FB+aEmLHBVWtrv916F/OLkuDrzZLR8kJQnFxMGoka0drpkz
 TugT8UrLB17sQSIIBA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.0.6] ([78.94.87.245]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MZCfJ-1qiSz40mNV-00VCaq; Tue, 12
 Dec 2023 14:18:03 +0100
Message-ID: <92c8d77e-a912-45bc-aad8-65500cb3c0ce@gmx.de>
Date: Tue, 12 Dec 2023 14:18:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: hgafb: fix kernel-doc comments
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org
References: <20231205231408.1234-1-rdunlap@infradead.org>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20231205231408.1234-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:q/JsTjGH6Obu65iWDI67EITFS4iLRM4Gab1twphGjh3NZQ9wzTz
 /n0Zq5gcFWLlt0BFeGzVzd5uBYHU6AONUjUuAZzAASORwC0DbyQuVo9QzMIWh//PTZirxUz
 G/CneXCiOm9ZjKeFMIO5QZftEAqcrzT5lGvRP/c79iFAihHxJHxl3XaOPxxigyfnGUu3sRr
 sS9kELRLhZvXYxQ7TtmgQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sR7+tCVqDxc=;+nl0m7Lzl+hf1l/4Fu2D50P1B0X
 y+WjpcDrnOOZpEJ506a491thss8NQ1XKCQ3j3EcHbA0A6GND31p+986s2DH4FY9OxK/S3cj6e
 QOuZWpzufueO0aOu6H6F5ASfydGr+WrefhQG7fAP4PteWpYZxwFJFlD/OEv+HR+ILGpQpeCi9
 yD9GBFG1imWelNyml0RE9v1Bpy41SquE4SsNx0gjqlAvHkzv37Xkf5MD74t7bjf1W7KA6g2QW
 Nx7kFRo7x52CFUXeKOVbnApZjAwHxpgJSiTCdA+CUlYS86yEfQ/xexGpvsl0MzUNAWRbgrtkm
 RfOlZbnlIWmUh+hpBWOgUo/5qIrMcSf/AiFpJeDRUZ/2qsE1vz+NY750ZVr/8HYTepK1P7boK
 dSo67iCFawN3aejHjSUqtBlrxFloyhHLyKHBPMtHW148jWTH+4XIoDm0t1f5YYzCfZSMlZyIP
 sJqk8L5nFyemduAPiCO9ahY0rVP9bdTUcedOQHWZUmMOK2+m/ZZAEOkcNePTciahuTZtZDHfP
 mCIxx5YQxrysH69/gvDBnAsOZLtu4R+slez+FZ783A7lFGPJ0/i5gc6YTT6vPygkVXZOuVbrb
 lf9UQfkHXVBQedP6hvsi+9TZv8TkCOkaqYnVsdsXeFniHhJycU9Xb+jQt2vux/yM/7q3sdDTa
 eAh4NAkm8FDJManX/O2VrLZiV79VLhEo6dmkpbn96NK1TsVbI9gAG48G8J2BUamxZSKFjagv3
 1WOm0FU9WkyVDUYxGixs4+tvPsgZJuVwZ6KsBoEavYE3Ai4AK0YazA7U+04krPETANdVD9vGJ
 01SgPmPw+Tme893KOxXruxRfpEhD4E8qcoSZIy3evI2MZbNh0WnVjNil7S9BgA5jrTDJa8V36
 3IiFJLffxucuE62+XPzTBVIy6mVvnr7GIDpwhs8uk5CDmVLAPZqKJv/y5LGhusvrJrXEcocLn
 MSl4gw==
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
Cc: linux-nvidia@lists.surfsouth.com, linux-fbdev@vger.kernel.org,
 Ferenc Bakonyi <fero@drama.obuda.kando.hu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/6/23 00:14, Randy Dunlap wrote:
> Fix kernel-doc warnings found when using "W=3D1".
>
> hgafb.c:370: warning: No description found for return value of 'hgafb_op=
en'
> hgafb.c:384: warning: No description found for return value of 'hgafb_re=
lease'
> hgafb.c:406: warning: No description found for return value of 'hgafb_se=
tcolreg'
> hgafb.c:425: warning: No description found for return value of 'hgafb_pa=
n_display'
> hgafb.c:425: warning: expecting prototype for hga_pan_display(). Prototy=
pe was for hgafb_pan_display() instead
> hgafb.c:455: warning: No description found for return value of 'hgafb_bl=
ank'
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Ferenc Bakonyi <fero@drama.obuda.kando.hu>
> Cc: Helge Deller <deller@gmx.de>
> Cc: linux-nvidia@lists.surfsouth.com
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> ---
>   drivers/video/fbdev/hgafb.c |   13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)

applied.

Thanks!
Helge

