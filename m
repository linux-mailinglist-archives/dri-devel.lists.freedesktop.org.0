Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3F812F7DB
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2020 12:55:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E2E6E2D1;
	Fri,  3 Jan 2020 11:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 324B96E2D1
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 11:55:48 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200103115546euoutp02504e040aae9390c49634286c95c2624f~mXm43B5bC0920209202euoutp02s
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 11:55:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200103115546euoutp02504e040aae9390c49634286c95c2624f~mXm43B5bC0920209202euoutp02s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1578052546;
 bh=lEKW45zmvnRN0vF53EoEcDpmZafzTqHkiGrjf7zgl9w=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=Giu3T394sjigPtJ3JeYEPiBUj/RUSyW664lpR6YKbFR9uL9Nd2dVi3v3vTWL1Kutd
 yoatDRK3CnrlIEp0p5WOwuapiDm/Ft7fKGPUhXnMKO//EX0GlNtfAHmbBGYxfAAHre
 wCqu6aK7mJSAMUy+EZo3vDX583KRGx3btxNkm8U4=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200103115546eucas1p20ee271b3660224259fd7bec0bbbb1ff8~mXm4fQDb20639906399eucas1p2D;
 Fri,  3 Jan 2020 11:55:46 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 57.18.61286.2CB2F0E5; Fri,  3
 Jan 2020 11:55:46 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200103115545eucas1p168a060a62814c15b9601828d73c198e0~mXm3_CWoN2845928459eucas1p19;
 Fri,  3 Jan 2020 11:55:45 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200103115545eusmtrp29cb448521fdc6bb7c6e4a46b70d267cc~mXm39aYjb1423314233eusmtrp2E;
 Fri,  3 Jan 2020 11:55:45 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-3f-5e0f2bc24421
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id D9.82.08375.1CB2F0E5; Fri,  3
 Jan 2020 11:55:45 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200103115545eusmtip14000199567ee48d8f534f8bb71e8e436~mXm3QkXCw2310523105eusmtip1L;
 Fri,  3 Jan 2020 11:55:45 +0000 (GMT)
Subject: Re: [PATCH v3 3/3] fbdev: fbmem: avoid exporting fb_center_logo
To: Peter Rosin <peda@axentia.se>, Geert Uytterhoeven <geert@linux-m68k.org>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <f248b742-37c8-356f-3128-628b578e896e@samsung.com>
Date: Fri, 3 Jan 2020 12:55:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6cb5ec1b-ae60-5ca4-f0d9-1414f52fed73@axentia.se>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKKsWRmVeSWpSXmKPExsWy7djP87qHtPnjDB7MFbd4cqCd0eLK1/ds
 Fs9u7WWyWNi2hMXiRN8HVovLu+awWew9NJ/R4vePOWwOHB7TDsxm99i8Qsvj0OEORo/73ceZ
 PBb3TWb1+LxJLoAtissmJTUnsyy1SN8ugSuj6ewiloJ+7opvs9cwNjA2cXYxcnJICJhI9C2f
 yd7FyMUhJLCCUWLCi3NQzhdGif7tXYwQzmdGiaYvR4EcDrCWX1OcIOLLGSWur7jJAuG8ZZTY
 MH0FM8hcYQEPif/nZrCC2CICPhIPnv1gAyliFjjDJNF48ioTSIJNwEpiYvsqRhCbV8BO4vCh
 NnYQm0VARWLKsT9gtqhAhMSnB4dZIWoEJU7OfMICYnMC1R9bvgFsGbOAuMStJ/OZIGx5ie1v
 5zCDLJMQOMQucWTSJjaIT10kZvybD2ULS7w6voUdwpaR+L8TpBmkYR2jxN+OF1Dd2xkllk/+
 B9VhLXHn3C82UAAwC2hKrN+lDxF2lJjZ94YZEi58EjfeCkIcwScxadt0qDCvREebEES1msSG
 ZRvYYNZ27VzJPIFRaRaS12YheWcWkndmIexdwMiyilE8tbQ4Nz212DAvtVyvODG3uDQvXS85
 P3cTIzAxnf53/NMOxq+Xkg4xCnAwKvHwJijzxwmxJpYVV+YeYpTgYFYS4S0P5I0T4k1JrKxK
 LcqPLyrNSS0+xCjNwaIkzmu86GWskEB6YklqdmpqQWoRTJaJg1OqgdH23a+jPV8XuZX5fUhK
 nW64wW1L56HumUmbG6zr3vVZzXT8P7NI0DRE8ohZ3Db+aY7PZ50qYqnsXDAzuJNjylndeZuS
 RNdE3f/+9clB7h8zD757qaJ67LXQnWa1A7P/r1YNnPbJw2VTVjtTqVr4w1mMx0ouV01uNrcU
 fNk08fqtr78WamzZcrpWiaU4I9FQi7moOBEAkVVKBkgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRmVeSWpSXmKPExsVy+t/xu7oHtfnjDLY+Mrd4cqCd0eLK1/ds
 Fs9u7WWyWNi2hMXiRN8HVovLu+awWew9NJ/R4vePOWwOHB7TDsxm99i8Qsvj0OEORo/73ceZ
 PBb3TWb1+LxJLoAtSs+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUn
 syy1SN8uQS+j6ewiloJ+7opvs9cwNjA2cXYxcnBICJhI/Jri1MXIySEksJRR4vbsIIiwjMTx
 9WUgYQkBYYk/17rYuhi5gEpeM0r8O9nPDJIQFvCQ+H9uBiuILSLgI/Hg2Q+wImaBc0wSe0+0
 QXWsY5I4uWoBO0gVm4CVxMT2VYwgNq+AncThQ21gcRYBFYkpx/6A2aICERKHd8yCqhGUODnz
 CQuIzQlUf2z5BrDNzALqEn/mXYKyxSVuPZnPBGHLS2x/O4d5AqPQLCTts5C0zELSMgtJywJG
 llWMIqmlxbnpucWGesWJucWleel6yfm5mxiBUbjt2M/NOxgvbQw+xCjAwajEw5ugzB8nxJpY
 VlyZe4hRgoNZSYS3PJA3Tog3JbGyKrUoP76oNCe1+BCjKdBzE5mlRJPzgQkiryTe0NTQ3MLS
 0NzY3NjMQkmct0PgYIyQQHpiSWp2ampBahFMHxMHp1QDo6T6h6B1HcesIjzmfJF32nb0ca/n
 o45p7qzPIow3sV9exVmWd9A2eePNjnu9PzUFjRariHx/WrQzbYNYyeE+7b2MfIsd9oXsO9I0
 fdMzkbxjDz/FHzrUpt5RsfuKiI6D5L4XrM9mzFTz7fx298qizJXXrj1/lqPylLVQX9K+6dST
 pJa/nMv3+iixFGckGmoxFxUnAgBcKJ5A2AIAAA==
X-CMS-MailID: 20200103115545eucas1p168a060a62814c15b9601828d73c198e0
X-Msg-Generator: CA
X-RootMTR: 20190829070834epcas1p2dbdbae4159daba3c62057effa46bb4ab
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190829070834epcas1p2dbdbae4159daba3c62057effa46bb4ab
References: <20190827110854.12574-1-peda@axentia.se>
 <20190827110854.12574-4-peda@axentia.se>
 <CAMuHMdVkqX7x_D5nf01s-kE=o+y5OLM-5fd3q=2RDKGTcpCfHg@mail.gmail.com>
 <CGME20190829070834epcas1p2dbdbae4159daba3c62057effa46bb4ab@epcas1p2.samsung.com>
 <6cb5ec1b-ae60-5ca4-f0d9-1414f52fed73@axentia.se>
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/29/19 9:08 AM, Peter Rosin wrote:
> On 2019-08-27 13:35, Geert Uytterhoeven wrote:
>> Hi Peter,
>>
>> On Tue, Aug 27, 2019 at 1:09 PM Peter Rosin <peda@axentia.se> wrote:
>>> The variable is only ever used from fbcon.c which is linked into the
>>> same module. Therefore, the export is not needed.
>>>
>>> Signed-off-by: Peter Rosin <peda@axentia.se>
>>
>> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Thanks, patch queued for v5.6 (also sorry for the delay).

>> But note that the same is true for fb_class, so perhaps it can be added
>> (or better, removed ;-)?
> 
> Right. Someone please let me know if 3/3 needs to be extended. I'm also
> happy to just drop it...

Please send incremental patch for fb_class. 

>> Once drivers/staging/olpc_dcon/olpc_dcon.c stops abusing registered_fb[]
>> and num_registered_fb, those can go, too.
>>
>> Does anyone remembe why au1200fb calls fb_prepare_logo() and fb_show_logo()
>> itself?
> 
> Maybe there should be a small drivers/video/fbdev/core/fbmem.h file (or
> something) with these "internal" declarations, to hide some clutter currently
> in include/linux/fb.h?

Sounds like a good idea.

> Feels like that could be done later, after these other cleanups you mention,
> so that the new file has a few more things to declare.
Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
