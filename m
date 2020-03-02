Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0206A175E6C
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 16:42:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 294FA6E4A5;
	Mon,  2 Mar 2020 15:42:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D69D26E4A5
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 15:42:00 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200302154159euoutp0282be2de4fb75b2d10e3a27c051a977ea~4hwPafZ0e1345813458euoutp02H
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 15:41:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200302154159euoutp0282be2de4fb75b2d10e3a27c051a977ea~4hwPafZ0e1345813458euoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1583163719;
 bh=9iwDuNks6TWsXPgWeaK7Fe2TdtajOJI4hQcS6THLJxU=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=UCgv4M8T7uL6/i5RRGSZjxuwLhPtE2/dg1lo6lCjTletcigEzGts6GY/7+28CV3xu
 56R3ZNbrDwc8UXcXlWglTeQQtkptFCAwKVSDdZEs2vL/EA2g2omtsmim3HsK2iZ/7k
 v8CrYz35fgKvp5MjQkeqHSFVpFIjIa6p4xhxMbq4=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200302154159eucas1p2d9570bf48851e5602c57e7661dc7999e~4hwPOiKLJ1937719377eucas1p2D;
 Mon,  2 Mar 2020 15:41:59 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 55.B3.60698.7492D5E5; Mon,  2
 Mar 2020 15:41:59 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200302154158eucas1p2980ec38ee99c29f0f958dbd454af7a22~4hwOfh4j31937719377eucas1p2C;
 Mon,  2 Mar 2020 15:41:58 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200302154158eusmtrp1b830c3bc924f8410a3566c61b115cc70~4hwOfBwOt2862728627eusmtrp1r;
 Mon,  2 Mar 2020 15:41:58 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-1d-5e5d29473f97
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id DE.00.08375.6492D5E5; Mon,  2
 Mar 2020 15:41:58 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200302154158eusmtip25cfcdab877519a9dabeade0ed85dcd90~4hwOQeJlv2155721557eusmtip2i;
 Mon,  2 Mar 2020 15:41:58 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 2/2] video: fbdev: w100fb: add COMPILE_TEST support
To: Sam Ravnborg <sam@ravnborg.org>
Message-ID: <cb3cf021-30a9-7255-5e33-1d4cf0265a1d@samsung.com>
Date: Mon, 2 Mar 2020 16:41:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200117185755.GC24508@ravnborg.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIKsWRmVeSWpSXmKPExsWy7djPc7rumrFxBkdmiFtc+fqezeJE3wdW
 i8u75rBZrPi5ldGBxeN+93EmjyXTrrJ5fN4kF8AcxWWTkpqTWZZapG+XwJVxaddD9oJTzBVv
 X6s2MDYwdzFyckgImEgc/vebpYuRi0NIYAWjxIol59khnC+MEh8vbGKGcD4zSrS0fmSDaXm+
 4RgTRGI5o0TfkU9QzltGiW/bj7KDVLEJWElMbF/FCGILC7hLdC1dyQJiiwgoSxw/f40VxGYW
 SJD4cvMz2CG8AnYSs868AKtnEVCRONAxBWybqECExKcHh1khagQlTs58AjaHU8BIoql1CQvE
 HHGJW0/mM0HY8hLb386Beq6fXeLtqjgI20Wid84DJghbWOLV8S3sELaMxOnJPeAAkBBYxyjx
 t+MFM4SznVFi+eR/UD9bS9w59wvI5gDaoCmxfpc+RNhRYtfWvewgYQkBPokbbwUhbuCTmLRt
 OjNEmFeio00IolpNYsOyDWwwa7t2rmSewKg0C8lns5B8MwvJN7MQ9i5gZFnFKJ5aWpybnlps
 nJdarlecmFtcmpeul5yfu4kRmFBO/zv+dQfjvj9JhxgFOBiVeHgDmGPjhFgTy4orcw8xSnAw
 K4nw+nJGxwnxpiRWVqUW5ccXleakFh9ilOZgURLnNV70MlZIID2xJDU7NbUgtQgmy8TBKdXA
 uO/2dLnNWck2pVa3PzSbPc5r/rv+vvSryzE9s4p3CpjsCZ8lbyOtLapTyOx67tISW2cVhxqL
 LTk7pgbMC+ZRyHzpqbzxw/oTATHdRpIZRut2FO4J3aCTU2Q/XzGitaktvbvSge+FGOv+mkaV
 r9cbc+rZsiO2/dm1ZqfljlzJlJmfV3W2enEpsRRnJBpqMRcVJwIAC0solyQDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRmVeSWpSXmKPExsVy+t/xe7pumrFxBvvOq1lc+fqezeJE3wdW
 i8u75rBZrPi5ldGBxeN+93EmjyXTrrJ5fN4kF8AcpWdTlF9akqqQkV9cYqsUbWhhpGdoaaFn
 ZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJdxaddD9oJTzBVvX6s2MDYwdzFyckgImEg833CM
 qYuRi0NIYCmjRMOBmaxdjBxACRmJ4+vLIGqEJf5c62KDqHnNKPHx1wpWkASbgJXExPZVjCC2
 sIC7RNfSlSwgtoiAssTx89fAapgFEiQ23Z8K1byLUaLr3z6wzbwCdhKzzrwAa2YRUJE40DGF
 DcQWFYiQOLxjFiNEjaDEyZlPwIZyChhJNLUuYYEYqi7xZ94lZghbXOLWk/lMELa8xPa3c5gn
 MArNQtI+C0nLLCQts5C0LGBkWcUoklpanJueW2yoV5yYW1yal66XnJ+7iREYQduO/dy8g/HS
 xuBDjAIcjEo8vAHMsXFCrIllxZW5hxglOJiVRHh9OaPjhHhTEiurUovy44tKc1KLDzGaAj03
 kVlKNDkfGN15JfGGpobmFpaG5sbmxmYWSuK8HQIHY4QE0hNLUrNTUwtSi2D6mDg4pRoYxbx+
 ihvUt/xe88yR7/Qh2/MzNz25v2WeQfkeqekn5bdVl5++Y+jrdiHn63KRJdEL/i7qsePhCNxc
 NPuRXCHTpNW2a/lW+CTOOnSMp9L7T15vjiX7Isev3XeSmCOmtc6ddID53g595yUb3BhCYnUu
 zTs2h3/j2Y0SZ3bV2qy59evvv5mPRI935iuxFGckGmoxFxUnAgDZbuJHtgIAAA==
X-CMS-MailID: 20200302154158eucas1p2980ec38ee99c29f0f958dbd454af7a22
X-Msg-Generator: CA
X-RootMTR: 20200116145359eucas1p1350bf2b827aa7ffa3e6767739e9ba7ad
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200116145359eucas1p1350bf2b827aa7ffa3e6767739e9ba7ad
References: <CGME20200116145359eucas1p1350bf2b827aa7ffa3e6767739e9ba7ad@eucas1p1.samsung.com>
 <a929db5e-d373-7b09-ae2b-efec227f7e85@samsung.com>
 <20200117185755.GC24508@ravnborg.org>
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/17/20 7:57 PM, Sam Ravnborg wrote:
> On Thu, Jan 16, 2020 at 03:53:58PM +0100, Bartlomiej Zolnierkiewicz wrote:
>> Add COMPILE_TEST support to w100fb driver for better compile
>> testing coverage.
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
