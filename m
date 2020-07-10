Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E31321B861
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 16:23:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B4666EC60;
	Fri, 10 Jul 2020 14:23:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD4BC6E0AB
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 14:23:44 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200710142343euoutp016514d31a720beef775c9973b03a11aa7~gajBCH0uU3141431414euoutp017
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 14:23:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200710142343euoutp016514d31a720beef775c9973b03a11aa7~gajBCH0uU3141431414euoutp017
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1594391023;
 bh=3xG9rjzHeWNpxeWivMGuQq4+cn1TwJm1jS/mZvYWZ9U=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=Tb+0OfE0R3mGdhpcgBdlIEVzYwiu8GkgiHwCeOF6NB2fwSGSgFGn+himmph9ZBbPR
 XjB7LwvKnBEiAtpL+xHSczxXerj+OeI+uScmj1BuKApFgr7HVhMwM3PxuFV1xmMi23
 uKM0TGmVdgrszRSMkA1aQhY7eiLRVrPKYo2VJFUU=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200710142343eucas1p25c061af80953b7fce74301d41917e0e7~gajA6WyaR2910529105eucas1p2I;
 Fri, 10 Jul 2020 14:23:43 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 0A.66.05997.FE9780F5; Fri, 10
 Jul 2020 15:23:43 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200710142343eucas1p137bb7b222cb9452174a0ee920bc2af09~gajAfsrcc3123331233eucas1p1v;
 Fri, 10 Jul 2020 14:23:43 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200710142343eusmtrp15a40ad92739a93a4450efa39b1ac78ce~gajAfHACj1135411354eusmtrp1G;
 Fri, 10 Jul 2020 14:23:43 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-5f-5f0879efb7a5
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 57.D1.06314.EE9780F5; Fri, 10
 Jul 2020 15:23:42 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200710142342eusmtip2a8bd7808498ef5f359279601655cc3c4~gajAFnqme1068510685eusmtip2r;
 Fri, 10 Jul 2020 14:23:42 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH][next] fbdev/fb.h: Use struct_size() helper in kzalloc()
To: Sam Ravnborg <sam@ravnborg.org>
Message-ID: <034da22f-cb7e-3af6-eb35-49a4fba82433@samsung.com>
Date: Fri, 10 Jul 2020 16:23:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200620112719.GC16901@ravnborg.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH+e3uXu+kjes0PFgU3VBKSs2kRguxEBoR9PrHBLNbXnzkVHZ9
 ZCBIf5iPyMfExzAULR9L3Ri62VQqzWaJSbNEZ6mVWAprkpopKbndSf73Od9zvpzzhUNi0kbc
 j0xMSWdVKUwyTXgKja/XRo46ssnYkPl7IPuw4iBknT3+svX3Fbhs8OEiLhs11xCy5rVOFEEo
 2l/6KwzaAkIxXWQRKB5XfCQUS4Z9l/Boz9NxbHJiJqsKDr/hmTBgakJpi153ls02QS5akBQi
 EQlUGOSvtQoKkScppZoRPLWue/DFMoKqyVKML5YQFJdOEdsW46qW4BtNCF7odYgv7AiKXplx
 5xRBnYLS+1rkZG/qAlhHZly6D3UQLCNjuNOAUf0IHPUFroaYCgdrUa+Hk4WUP3x7lOcy76ai
 4NdMv3vGC95UzwqdLKJCYbin1cUY5Qu22VoBz/vBZK9x3Q2UwQN+OuoQf3cklLZP4Dx7w4Kl
 w4PnvTCkfiDkDe0INvJ/uN0mBE3qTXdqOXx6t77F5NaKw6AzB/PyGaj8WoU5ZaAkMG734o+Q
 QJmx0i2LIT9Pyk8HgL5RT2yvLXzWgpUgWrMjmmZHHM2OOJr/e+uQUIt82QxOGc9yoSlsVhDH
 KLmMlPigW6lKA9r6nqFNy3IXMv+92YcoEtG7xHUMGSvFmUwuW9mHgMRoH/HZ4aHrUnEck32X
 VaXGqjKSWa4P7SGFtK/4eP18jJSKZ9LZ2yybxqq2uwJS5JeLntimDTpsQK0+EXi5OrzXeqSq
 5LMoZvMqqR6fs6deDIgeLD4/udzQFUF3DEQytam0Ak+UV2pnyyTyA5LR57oNm0MfklXse618
 bDXJaGzpbas1hSWdnLA05NnboljznxxxhGOqy3vuN/3Fhz2Xcwgn16wbo6qV791vu+VXymkh
 l8AcC8RUHPMP4Ll80DkDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOIsWRmVeSWpSXmKPExsVy+t/xe7rvKjniDVovmFlc+fqezWLrHlWL
 XxensVqc6PvAanF51xw2ixU/tzI6sHmsO6jqsWlVJ5vH/e7jTB5Lpl1l8/i8SS6ANUrPpii/
 tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEv4+j25YwFHwQr
 vuy6xdTA+Iqvi5GTQ0LARGLb91VsXYxcHEICSxkljhxuYepi5ABKyEgcX18GUSMs8edaF1TN
 a0aJX+8WMoEk2ASsJCa2r2IEsYUFfCQunX/ACmKLCChLHD9/jRWkgVngMKPE+2vHWSG6VzNK
 /O24xQZSxStgJ3Gpey87iM0ioCrxeG4b2CRRgQiJwztmMULUCEqcnPmEBcTmFDCSOLtnDZjN
 LKAu8WfeJWYIW1zi1pP5TBC2vMT2t3OYJzAKzULSPgtJyywkLbOQtCxgZFnFKJJaWpybnlts
 qFecmFtcmpeul5yfu4kRGGnbjv3cvIPx0sbgQ4wCHIxKPLwLEjnihVgTy4orcw8xSnAwK4nw
 Op09HSfEm5JYWZValB9fVJqTWnyI0RTouYnMUqLJ+cAkkFcSb2hqaG5haWhubG5sZqEkztsh
 cDBGSCA9sSQ1OzW1ILUIpo+Jg1OqgdH26VU328evRXL2/v2TJOLSsnuZ78mUQz/eRv0Naty9
 Y9+ayw1rznk8bbz1NvvXsoaNAukz/7yczB58bdr75WX+Gwq3bN41o34P34Ed3AGRwfMf/eeb
 c2HSlFlH1/H0OadmzVo15/xuoeXvxbiffFdyOMJtdejajaVPRBZKPbqksFog+KHo6Yav55VY
 ijMSDbWYi4oTAfIRKH/KAgAA
X-CMS-MailID: 20200710142343eucas1p137bb7b222cb9452174a0ee920bc2af09
X-Msg-Generator: CA
X-RootMTR: 20200620112727eucas1p12a623b3bba4c55cad9115287d57b55a6
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200620112727eucas1p12a623b3bba4c55cad9115287d57b55a6
References: <20200617175647.GA26370@embeddedor>
 <CGME20200620112727eucas1p12a623b3bba4c55cad9115287d57b55a6@eucas1p1.samsung.com>
 <20200620112719.GC16901@ravnborg.org>
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
Cc: linux-fbdev@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/20/20 1:27 PM, Sam Ravnborg wrote:
> Hi Gustavo.
> 
> On Wed, Jun 17, 2020 at 12:56:47PM -0500, Gustavo A. R. Silva wrote:
>> Make use of the struct_size() helper instead of an open-coded version
>> in order to avoid any potential type mistakes.
>>
>> This code was detected with the help of Coccinelle and, audited and
>> fixed manually.
>>
>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> 
> struct_size is defined in overflow.h - which is not included by fs.h.
> So we rely on overflow.h being pulled in by some other header - maybe
> slab.h in this case.
> Seems fragile, should this patch add an include of overflow.h?

$ git grep struct_size drivers/|wc -l
697

$ git grep overflow\\.h drivers/|wc -l
8

$ git grep overflow\\.h include/linux/
include/linux/device.h:#include <linux/overflow.h>
include/linux/mm.h:#include <linux/overflow.h>
include/linux/slab.h:#include <linux/overflow.h>
include/linux/vmalloc.h:#include <linux/overflow.h>

so I've applied the patch as it is (hoping that the issue is so
widespread that no-one tries to remove overflow.h from slab.h
without fixing drivers at the same time)..

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> 	Sam
> 
>> ---
>>  include/linux/fb.h | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/linux/fb.h b/include/linux/fb.h
>> index 3b4b2f0c6994..2b530e6d86e4 100644
>> --- a/include/linux/fb.h
>> +++ b/include/linux/fb.h
>> @@ -506,8 +506,9 @@ struct fb_info {
>>  };
>>  
>>  static inline struct apertures_struct *alloc_apertures(unsigned int max_num) {
>> -	struct apertures_struct *a = kzalloc(sizeof(struct apertures_struct)
>> -			+ max_num * sizeof(struct aperture), GFP_KERNEL);
>> +	struct apertures_struct *a;
>> +
>> +	a = kzalloc(struct_size(a, ranges, max_num), GFP_KERNEL);
>>  	if (!a)
>>  		return NULL;
>>  	a->count = max_num;
>> -- 
>> 2.27.0
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://protect2.fireeye.com/url?k=7bae4d09-26604cda-7bafc646-000babff317b-7eab3a2caa4b8b73&q=1&u=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
