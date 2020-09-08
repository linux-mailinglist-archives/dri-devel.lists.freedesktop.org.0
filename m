Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A042610C0
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 13:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0673A6E077;
	Tue,  8 Sep 2020 11:36:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8B96E077
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 11:36:33 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200908113629euoutp0191776155863a4aaf9669a8a442bb5d41~yy_H2NCQP0538805388euoutp01W
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 11:36:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200908113629euoutp0191776155863a4aaf9669a8a442bb5d41~yy_H2NCQP0538805388euoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599564989;
 bh=Kc8g4q3Ac3+Qa8UrmMqh9k43eCe1IeEgdvXjJ8eQKzI=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=QfLo8oK0Eiw6dryoCaITZsiBFK78fBZKfa8m/TUNhQQ0dhPpAsMuNaRKnbjH/fPVv
 x4F1OUP9ev4okKrPRd1RF+X27mX7cNYhUjwcymMHVEj9kVnuPUImQS50H6Vo65zjSq
 AmAzCdft74f/WMOIIkfNvNiZwRm+DpxaUwxxDyo4=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200908113628eucas1p2451921fed6f803aa85b3b60c1d21b43a~yy_HlA8Xi1825218252eucas1p28;
 Tue,  8 Sep 2020 11:36:28 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 1F.25.05997.CBC675F5; Tue,  8
 Sep 2020 12:36:28 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200908113628eucas1p1de81379c154f7ac7411f7a09366e5ca4~yy_HPkb_Y0533705337eucas1p1L;
 Tue,  8 Sep 2020 11:36:28 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200908113628eusmtrp180fbe1591f70cf7e8eba5417a8960dfa~yy_HO2qB91948319483eusmtrp1Y;
 Tue,  8 Sep 2020 11:36:28 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-13-5f576cbc27d2
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 5C.A1.06314.CBC675F5; Tue,  8
 Sep 2020 12:36:28 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200908113628eusmtip2a2755ce1a1136c54be87ec7a727908ee~yy_G78Jcz1336713367eusmtip2f;
 Tue,  8 Sep 2020 11:36:28 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 1/1] fbmem: add margin check to fb_check_caps()
To: Dan Carpenter <dan.carpenter@oracle.com>, George Kennedy
 <george.kennedy@oracle.com>
Message-ID: <782b4c4d-b428-aa09-2757-d6243a4b174a@samsung.com>
Date: Tue, 8 Sep 2020 13:36:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200707194714.GA2571@kadam>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOKsWRmVeSWpSXmKPExsWy7djPc7p7csLjDdZO0LJ4/W86i8Wn1XuY
 La58fc9m8fnPWnaLE30fWB1YPe53H2fy+Pj0FovH501yAcxRXDYpqTmZZalF+nYJXBlHPjxl
 K3jFXjFlynG2BsbNbF2MHBwSAiYSF+4rdzFycQgJrGCUuLCugR3C+cIo8f/gQWYI5zOjRM/n
 s4xdjJxgHV37d7NCJJYzSuycch2q5S2jxL+bJ1lAqtgErCQmtq8C6xAWcJaY3bubGcQWEYiS
 6F10CsxmFoiWuLF5E5jNK2An8fleC1gvi4CKxM5n/1lBbFGBCIlPDw6zQtQISpyc+QSshlNA
 S6Ll6wR2iDniEreezGeCsOUltr+dA3a2hMB0domWJT/ZIc52kTh0axGULSzx6vgWKFtG4vTk
 HhaIhnWMEn87XkB1b2eUWD75HxtElbXEnXO/wEHGLKApsX6XPkTYUWL7x3Z2SEjySdx4Kwhx
 BJ/EpG3TmSHCvBIdbUIQ1WoSG5ZtYINZ27VzJfMERqVZSF6bheSdWUjemYWwdwEjyypG8dTS
 4tz01GKjvNRyveLE3OLSvHS95PzcTYzA5HL63/EvOxh3/Uk6xCjAwajEw/vBKyxeiDWxrLgy
 9xCjBAezkgiv09nTcUK8KYmVValF+fFFpTmpxYcYpTlYlMR5jRe9jBUSSE8sSc1OTS1ILYLJ
 MnFwSjUw2v43LlgStdzq/3PPvAN8TDEpNtdNzh/02rH75YdPUo2pP5zOuE6fE9GsO3nesu8T
 xA2+iF9697DjY8q6qulrGAPvHa2tm22yuj5QTyGI+cOMLSv2Gi7YKVr2Kvw/q+Px9a7bm9ql
 X9g2uwZXX0+d877BK5x9bfg3oeLPDwJYY9KnFOUF73PPUWIpzkg01GIuKk4EAA9wESYqAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRmVeSWpSXmKPExsVy+t/xe7p7csLjDRbNFrJ4/W86i8Wn1XuY
 La58fc9m8fnPWnaLE30fWB1YPe53H2fy+Pj0FovH501yAcxRejZF+aUlqQoZ+cUltkrRhhZG
 eoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehlHPjxlK3jFXjFlynG2BsbNbF2MnBwS
 AiYSXft3s3YxcnEICSxllPh/tZG5i5EDKCEjcXx9GUSNsMSfa11sEDWvGSWWLXsN1swmYCUx
 sX0VI4gtLOAsMbt3N1iviECUxL7WCJAws0C0xIa5c8HKhQT2MkpcfCIIYvMK2El8vtfCAmKz
 CKhI7Hz2nxXEFhWIkDi8YxYjRI2gxMmZT8BqOAW0JFq+TmCHmKku8WfeJWYIW1zi1pP5TBC2
 vMT2t3OYJzAKzULSPgtJyywkLbOQtCxgZFnFKJJaWpybnltsqFecmFtcmpeul5yfu4kRGEnb
 jv3cvIPx0sbgQ4wCHIxKPLwfvMLihVgTy4orcw8xSnAwK4nwOp09HSfEm5JYWZValB9fVJqT
 WnyI0RTouYnMUqLJ+cAozyuJNzQ1NLewNDQ3Njc2s1AS5+0QOBgjJJCeWJKanZpakFoE08fE
 wSnVwOg7u8u4/tCFJxXbtAoOmchNZQvKXj1JRGfR++Vq297JesT/TPX4nd/b73R9UvifgMBz
 Ezm/R0+4FBUde5T/DkO7yn1xq7hKpiK2pWutYu3YhS9IXTsZeUPsS2PX9IrzDx74r7u2S3Pd
 p0Vdy6SZHE6whddu0VtfnywrNaGLq0Bnzdb5hX++ByixFGckGmoxFxUnAgD98ImsugIAAA==
X-CMS-MailID: 20200908113628eucas1p1de81379c154f7ac7411f7a09366e5ca4
X-Msg-Generator: CA
X-RootMTR: 20200707194728eucas1p1d1f4239143f36967f86c4593604fb47f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200707194728eucas1p1d1f4239143f36967f86c4593604fb47f
References: <1594149963-13801-1-git-send-email-george.kennedy@oracle.com>
 <CGME20200707194728eucas1p1d1f4239143f36967f86c4593604fb47f@eucas1p1.samsung.com>
 <20200707194714.GA2571@kadam>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dhaval.giani@oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


[ added dri-devel ML to Cc: ]

On 7/7/20 9:47 PM, Dan Carpenter wrote:
> On Tue, Jul 07, 2020 at 03:26:03PM -0400, George Kennedy wrote:
>> A fb_ioctl() FBIOPUT_VSCREENINFO call with invalid xres setting
>> or yres setting in struct fb_var_screeninfo will result in a
>> KASAN: vmalloc-out-of-bounds failure in bitfill_aligned() as
>> the margins are being cleared. The margins are cleared in
>> chunks and if the xres setting or yres setting is a value of
>> zero upto the chunk size, the failure will occur.
>>
>> Add a margin check to validate xres and yres settings.
>>
>> Signed-off-by: George Kennedy <george.kennedy@oracle.com>
>> Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Suggested-by is perhaps a bit strong.  Let's change that to:
> 
> Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to drm-misc-next tree, thanks and sorry for the delay.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
