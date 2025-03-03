Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 007A6A4B98C
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 09:39:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D4010E397;
	Mon,  3 Mar 2025 08:39:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="IwtzZyET";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2425D10E072
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 08:38:58 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250303083852euoutp02f5e4f789aaf9b3e8235f5cc154d7fd53~pPjX3GVqi0832508325euoutp02D
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 08:38:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250303083852euoutp02f5e4f789aaf9b3e8235f5cc154d7fd53~pPjX3GVqi0832508325euoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1740991132;
 bh=9d2xtceGlzz2l6obFD6JjP2Tn3LQZNmuBGvk5P8FyW4=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=IwtzZyETtTKMgOfIMbIuIZmOvgzUKf1RV6oX886ux8NexvtR7nDpGhEqoIOpC+duB
 w4/RYmu6uZxoHTiVBgX29Rug5dmEvFXT9ovDrD3sWQcrbeiZDnP+RmsDoy+KBJw4o5
 DH919GR1gRZC+ds3xAPk5l1AdEzNnBjVC77U5v+4=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250303083852eucas1p1f3250a4c27d32330c50cda3d51477492~pPjXi4mjh2913229132eucas1p1P;
 Mon,  3 Mar 2025 08:38:52 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 0C.F7.20409.B9A65C76; Mon,  3
 Mar 2025 08:38:51 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250303083851eucas1p214cdd6ace6341a00a3db3012065843e7~pPjW1o4Ib1194011940eucas1p2d;
 Mon,  3 Mar 2025 08:38:51 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250303083851eusmtrp2de127490ec65dd43e7799366dcb80f33~pPjW0nbcV0443604436eusmtrp2T;
 Mon,  3 Mar 2025 08:38:51 +0000 (GMT)
X-AuditID: cbfec7f4-c39fa70000004fb9-e9-67c56a9be489
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 6A.30.19920.B9A65C76; Mon,  3
 Mar 2025 08:38:51 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250303083849eusmtip2237adb2f5e3a1e502ca5bc8c7c07482d~pPjVXQtNR3254732547eusmtip2I;
 Mon,  3 Mar 2025 08:38:49 +0000 (GMT)
Message-ID: <90d0d409-f374-4e06-bc69-b9bf0622959d@samsung.com>
Date: Mon, 3 Mar 2025 09:38:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/21] Enable drm/imagination BXM-4-64 Support for
 LicheePi 4A
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org,
 wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com,
 matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 ulf.hansson@linaro.org, jszhang@kernel.org, p.zabel@pengutronix.de,
 m.szyprowski@samsung.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20250221-eminent-squirrel-of-honor-dee80d@krzk-bin>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa1BUZRjuO3v2nGUTPKwYn5ShizYhCQiNfhMOSZadyUpqLJpywp04s5AL
 2B4Qa1KRW8IuoXGT5SZgwqAgl90dQJC4rgguJLcdBxZlgAClnY3bqFyCPVj8e97nfd7nfZ9v
 PgFP1Eg4CIJCwhh5iEQmJoS4tvWpfnfm9y1S94GMd9Cd/nwMaZ6rSHSjTo+h3GY9HxnvqzHU
 M2siUOloF4nG687jqK8om0TRrTcJNKEyEqizs4xEZqWRj7prsgg0ndgMkHY6hkAlzYMkyjNr
 cHS1qgaguPhrfPTn3Q/QoPEOjia6lTwUp9qIlmurSLTUV46jzL/rSaR+comPdCV+KKY+BT/w
 Om0yxJL0k4kJnG66MEPSdXNXcLpaNUjSyuoOQFcUxxP0QF8tQee0fUYPKXQYXXn1HB1T0orR
 SYvutOl2L0H/qi4G9P3oftJX9LVwfwAjCzrFyN28jwsDlbe6iJMtwtP5WWGRQCdIAFYCSL0N
 yxYb8AQgFIioIgAViXMEV8wA+FiRslZMA2ioMpMvRpqS2kmuUQigeeHe2vwUgDHFj/irKmvK
 Gz5KSMZXMU7tgFHjCwTH28K2jBELv5lyhEMPLltcN1F+8A/jL9gqtqOcYf/iPH/VlEfV8mFa
 SpnFlEfZwwcjuRYRQXnAh4W5Ft6K8oEVN1IwTuMIozWZvNVhSPUKYXR7BZ+7+304n1m+lmET
 nNSp1/BrcLmaM4VUKHyo+YfH4Z9htVK3hr3ggP7ZSgLBygJneLPGjaN9YE9SqoWGlA00TNly
 J9jA37TpPI62hhfiRJz6DZiqTPxvqb5Ii10EYtW6V1GtC6laF0b1/94rAC8G9kw4GyxlWI8Q
 JsKVlQSz4SFS1+9CgyvAyjdvX9LNVIHCSbNrI8AEoBFAAU9sZ/3D581SkXWA5MefGHmovzxc
 xrCN4FUBLra3zq+PlYooqSSMOcEwJxn5iy4msHKIxGzHythXJszDhZozbuVK9vKIT7LOiXBB
 X04d+qssJ0cWn9Zm67JHIXbZxkiN3x7V9G05Hey5Yf+JlzpEEe4YKWt7a6F8rml0y1n149SP
 Yk1Rs3ZL2p2m7KhlDT2mDrw7a/hq6xfKp+eyzi7mBdwr+eSI4yWb7Ye1Wxv8xw6wnc+h4che
 8fDQhvTu8JYzPdqL1z7el/7y5DGH8SDdYuW7GZtrnBSnZrMP+o0UmG73fFi5sXSf16dip6mj
 nvqhhmMR2Q4737yVpixIzvtm3OO8p6Fm+w6vrNLdvTNde03+vvOjBQvHfTVF2ZFNlR3X3xtm
 D29L+P1Zy1Sz93ikMd951/XlQ7KlXjHOBkr27OLJWcm/h1A4JVUEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMKsWRmVeSWpSXmKPExsVy+t/xe7qzs46mG0zs4LU4cX0Rk8XW37PY
 LdbsPcdkMf/IOVaLe5e2MFlc+fqezWLd0wvsFi/2NrJYXFsxl92i+dh6NouXs+6xWZw/v4Hd
 4mPPPVaLy7vmsFl87j3CaLHtcwubxdojd9ktFn7cymKxZMcuRou2zmWsFhdPuVrcvXeCxeLl
 5R5mi7ZZ/Bb/9+xgt/h3bSOLxex3+9kttryZyGpxfG24Rcv+KSwOch7vb7Sye7x5+ZLF43DH
 F3aPvd8WsHjsnHWX3aNn5xlGj02rOtk87lzbw+Yx72Sgx/3u40wem5fUe7SsPcbk0f/XwOP9
 vqtsHn1bVjF6XGq+zh4gFKVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9n
 k5Kak1mWWqRvl6CX0bP7AlvBUa6KRXNKGhiPc3QxcnJICJhIHO4/zd7FyMUhJLCUUWJP4zt2
 iISMxLXulywQtrDEn2tdbBBFrxkl3ixfwAqS4BWwk3jYNRmsiEVARaLpxR82iLigxMmZT8Di
 ogLyEvdvzQAbKiwQLnHgXjsTiC0ioClx/e93VpChzAJ7WCUOb/4M1iwkcIpR4uzpDBCbWUBc
 4taT+WANbAJGEg+WzwdbzCngKLFpzRSgOAdQjbrE+nlCEOXyEs1bZzNPYBSaheSMWUgmzULo
 mIWkYwEjyypGkdTS4tz03GJDveLE3OLSvHS95PzcTYzA1LXt2M/NOxjnvfqod4iRiYPxEKME
 B7OSCG9h0JF0Id6UxMqq1KL8+KLSnNTiQ4ymwKCYyCwlmpwPTJ55JfGGZgamhiZmlgamlmbG
 SuK8bpfPpwkJpCeWpGanphakFsH0MXFwSjUwxb+9fft9m0GJ0JUj5c01/rmucwMKXpssMcps
 O7NIccdTYeEb28NOhtskbXto256nceZT16KjzCd55k38NHdLlvJdsz37DQ7FOWd8WiKzfH1i
 9B2B+UcrGutip6pUvmF2OK8pcevbI5Yrf74ufWzwfvG17rYvkjVGE0JLYhfdVxA+G3ts29Oe
 ZxM8Tk3xPTM/d92SwNQZL9XfTjii3vlPeKL2qSf3n8lorNxx7dwT3sjv7/4U2VZy7OP8dOOV
 7zUbsVD3A54R04rF0xmfubtNXNN6IvjfH7OuOYlzrpZp/FqfmrTx28ZJk/+fdzTVjnsb43l2
 leGnCWlLjwQ0HY/aoOS25fgpRYePs6ffDtpbZVqjxFKckWioxVxUnAgAqtL6T+YDAAA=
X-CMS-MailID: 20250303083851eucas1p214cdd6ace6341a00a3db3012065843e7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250219140249eucas1p1291eb86c932373c847a3314ae54789d5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250219140249eucas1p1291eb86c932373c847a3314ae54789d5
References: <CGME20250219140249eucas1p1291eb86c932373c847a3314ae54789d5@eucas1p1.samsung.com>
 <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <20250221-eminent-squirrel-of-honor-dee80d@krzk-bin>
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



On 2/21/25 10:12, Krzysztof Kozlowski wrote:
> On Wed, Feb 19, 2025 at 03:02:18PM +0100, Michal Wilczynski wrote:
>> The LicheePi 4A board, featuring the T-HEAD TH1520 SoC, includes an Imagination
>> Technologies BXM-4-64 GPU. Initial support for this GPU was provided through a
>> downstream driver [1]. Recently, efforts have been made to upstream support for
>> the Rogue family GPUs, which the BXM-4-64 is part of [2].
>>
>> While the initial upstream driver focused on the AXE-1-16 GPU, newer patches
>> have introduced support for the BXS-4-64 GPU [3]. The modern upstream
>> drm/imagination driver is expected to support the BXM-4-64 as well [4][5]. As
>> this support is being developed, it's crucial to upstream the necessary glue
>> code including clock and power-domain drivers so they're ready for integration
>> with the drm/imagination driver.
>>
> 
> This is v5 of big patchset which became huge. I understand you did like
> that for v1 which was RFC. But it stopped being RFC.
> 
> Split your patchset, keeping versioning and changelog, per subsystem.

Sorry for the late reply—I didn't have access to email. I agree with
your suggestion and will send the clock changes, firmware/power domain,
reset, and drm/imagination updates as separate patchsets for merging.

> 
> Best regards,
> Krzysztof
> 
> 
