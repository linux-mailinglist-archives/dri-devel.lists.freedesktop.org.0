Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D06D1ADEFD
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 16:07:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 697976EC0F;
	Fri, 17 Apr 2020 14:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E68D6EC0F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 14:07:53 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200417140752euoutp0126c2f1bb0cc27489dd0a98305ae69e1f~GoJMZZwWA1980919809euoutp01Z
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 14:07:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200417140752euoutp0126c2f1bb0cc27489dd0a98305ae69e1f~GoJMZZwWA1980919809euoutp01Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1587132472;
 bh=iiimkQrvo8zHxw86wYlMTn5Kz0B5TReAIBXD+tpMUEs=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=SRGtyzt/I1oW5cOJ2WKBg3Qvu0lpXbLrnAB5EBaDiDt0/0BmCHyi3+r1MhQbX66SQ
 Q3C1oSde0JUWJ97ByVO5DZrdDpNrQ+RBHRXdwY4cPYxMsCMy7OsWyU3Hy6zVHZ+Ai8
 VUODsS9s4qmTxQr4/VXIrl2kj5S00wKy7rrrui58=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200417140752eucas1p1bacf1124b1fdd08905eb1031e445247d~GoJMLPLge1439514395eucas1p1Q;
 Fri, 17 Apr 2020 14:07:52 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id E7.CA.60698.738B99E5; Fri, 17
 Apr 2020 15:07:52 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200417140751eucas1p1f7425c9e366e1c9ce6616e0a18fb984f~GoJL2-Ynt1445014450eucas1p1Q;
 Fri, 17 Apr 2020 14:07:51 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200417140751eusmtrp16e0d168651b5320a903b51b81c554cd8~GoJL2ZkTV2228222282eusmtrp1V;
 Fri, 17 Apr 2020 14:07:51 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-a3-5e99b837b70b
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 2F.D0.07950.738B99E5; Fri, 17
 Apr 2020 15:07:51 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200417140751eusmtip2ca493dd9b132d077194a706719baa3e5~GoJLezrD22960229602eusmtip2J;
 Fri, 17 Apr 2020 14:07:51 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v2 1/6] video: fbdev: controlfb: fix sparse warning
 about using incorrect type
To: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <5b6b4169-b861-9c8e-77af-9bb44acde573@samsung.com>
Date: Fri, 17 Apr 2020 16:07:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200324204521.GL2363188@phenom.ffwll.local>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGKsWRmVeSWpSXmKPExsWy7djP87oWO2bGGbyey2hxa905Vov/2yYy
 W1z5+p7N4kTfB1aLy7vmsFms+LmV0YHNY++3BSwe97uPM3ksmXaVzaNvyypGj8+b5AJYo7hs
 UlJzMstSi/TtErgyHj3fwljQJ1jR/3MDSwPjBr4uRk4OCQETiRM/zzF3MXJxCAmsYJSYfq+V
 HcL5wiixd+E2VpAqIYHPjBLH1tbBdJxcsZkJomg5o8S+52dZIJy3jBJb5y1gBKliE7CSmNi+
 CswWFkiR+HHuAtgkEQFlif7Nc8BsZpB9tx9WgNi8AnYSbV97mUFsFgFViVkn57GA2KICERKf
 HhxmhagRlDg58wlYnBNo/r1jL5kh5ohL3HoynwnClpfY/nYO2D8SAuvYJXr7fjNDnO0iMe3Q
 XXYIW1ji1fEtULaMxOnJPSxQDYwSfzteQHVvZ5RYPvkfG0SVtcSdc7+AbA6gFZoS63fpQ4Qd
 JY5NAvmGA8jmk7jxVhDiCD6JSdumM0OEeSU62oQgqtUkNizbwAaztmvnSuYJjEqzkLw2C8k7
 s5C8Mwth7wJGllWM4qmlxbnpqcXGeanlesWJucWleel6yfm5mxiBqef0v+NfdzDu+5N0iFGA
 g1GJh9egZ2acEGtiWXFl7iFGCQ5mJRHeg25AId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rzGi17G
 CgmkJ5akZqemFqQWwWSZODilGhhvXVOVzHlwZ1lT4KdSEcUqP7VNvya+yjL63XpE9vJC46wd
 zeJC84r+2yU9Ekk46vbNKDA4Q4Npbuiv/66vpq98tHdNYLv+luMZp29le7H/yTu54EOs6mxt
 9xX2jz/HfP0ZrrurtfJo4IKqJ9zzdu500jOK9flXF3m4ROz/IREHJg6p3O4bhzWVWIozEg21
 mIuKEwG69iH3OQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRmVeSWpSXmKPExsVy+t/xe7rmO2bGGVzt17K4te4cq8X/bROZ
 La58fc9mcaLvA6vF5V1z2CxW/NzK6MDmsffbAhaP+93HmTyWTLvK5tG3ZRWjx+dNcgGsUXo2
 RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZj55vYSzo
 E6zo/7mBpYFxA18XIyeHhICJxMkVm5m6GLk4hASWMkp827aYsYuRAyghI3F8fRlEjbDEn2td
 bBA1rxklFr1+xQaSYBOwkpjYvooRxBYWSJHYOrGJCcQWEVCW6N88hxWkgVlgBaPEsbet7BDd
 Xxkl1u/tZQGp4hWwk2j72ssMYrMIqErMOjkPLC4qECFxeMcsRogaQYmTM5+AxTmBtt079hKs
 nllAXeLPvEtQtrjErSfzmSBseYntb+cwT2AUmoWkfRaSlllIWmYhaVnAyLKKUSS1tDg3PbfY
 SK84Mbe4NC9dLzk/dxMjMNq2Hfu5ZQdj17vgQ4wCHIxKPLwGPTPjhFgTy4orcw8xSnAwK4nw
 HnQDCvGmJFZWpRblxxeV5qQWH2I0BXpuIrOUaHI+MBHklcQbmhqaW1gamhubG5tZKInzdggc
 jBESSE8sSc1OTS1ILYLpY+LglGpgdJB7y3Eg49kXvozNPMLezxxS9vw48f/H3N09LusLjJX9
 e24JGyydVqpbfigmXkZNi2Nln/kp7twXvMlW7iEd55yuMJXrb/KQfSTOsO7coQXmt02KPOR+
 7GpWu3UmIDBsy//YTTe2ZXNGZVmw/+FhafTafPdkzITN8p33bjRa3ONY6xdf5a2jxFKckWio
 xVxUnAgAF+5HHMwCAAA=
X-CMS-MailID: 20200417140751eucas1p1f7425c9e366e1c9ce6616e0a18fb984f
X-Msg-Generator: CA
X-RootMTR: 20200324134518eucas1p16e1a39c14dfd101f5a6d86218a9e19af
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200324134518eucas1p16e1a39c14dfd101f5a6d86218a9e19af
References: <20200324134508.25120-1-b.zolnierkie@samsung.com>
 <CGME20200324134518eucas1p16e1a39c14dfd101f5a6d86218a9e19af@eucas1p1.samsung.com>
 <20200324134508.25120-2-b.zolnierkie@samsung.com>
 <20200324204521.GL2363188@phenom.ffwll.local>
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
Cc: Andrzej Hajda <a.hajda@samsung.com>, linux-fbdev@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/24/20 9:45 PM, Daniel Vetter wrote:
> On Tue, Mar 24, 2020 at 02:45:03PM +0100, Bartlomiej Zolnierkiewicz wrote:
>> Use in_le32() instead of le32_to_cpup() to fix sparse warning about
>> improper type of the argument.
>>
>> Also add missing inline keyword to control_par_to_var() definition
>> (to match function prototype).
>>
>> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
>> ---
>>  drivers/video/fbdev/controlfb.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/video/fbdev/controlfb.c b/drivers/video/fbdev/controlfb.c
>> index 38b61cdb5ca4..9625792f4413 100644
>> --- a/drivers/video/fbdev/controlfb.c
>> +++ b/drivers/video/fbdev/controlfb.c
>> @@ -313,7 +313,7 @@ static int controlfb_blank(int blank_mode, struct fb_info *info)
>>  		container_of(info, struct fb_info_control, info);
>>  	unsigned ctrl;
>>  
>> -	ctrl = le32_to_cpup(CNTRL_REG(p,ctrl));
>> +	ctrl = in_le32(CNTRL_REG(p, ctrl));
>>  	if (blank_mode > 0)
>>  		switch (blank_mode) {
>>  		case FB_BLANK_VSYNC_SUSPEND:
>> @@ -952,7 +952,8 @@ static int control_var_to_par(struct fb_var_screeninfo *var,
>>   * Convert hardware data in par to an fb_var_screeninfo
>>   */
>>  
>> -static void control_par_to_var(struct fb_par_control *par, struct fb_var_screeninfo *var)
>> +static inline void control_par_to_var(struct fb_par_control *par,
> 
> Just quick drive-by bikeshed, feel free to ignore: static inline within a
> .c file imo doesn't make sense anymore, compilers are smart enough
> nowadays. I'd just drop this.
> -Daniel

I fixed this while applying patch series, thanks!

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

>> +	struct fb_var_screeninfo *var)
>>  {
>>  	struct control_regints *rv;
>>  	
>> -- 
>> 2.24.1
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://protect2.fireeye.com/url?k=e81baef1-b5d19b46-e81a25be-0cc47a3003e8-c88ec3abd71f4ad4&u=https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
