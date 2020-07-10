Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE51721B858
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 16:23:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACAFE6EC5E;
	Fri, 10 Jul 2020 14:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3DEE6EC60
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 14:23:17 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200710142315euoutp016c2ea50b856ef54e0da1bc9a86399373~gainMoa0v3221032210euoutp01D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 14:23:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200710142315euoutp016c2ea50b856ef54e0da1bc9a86399373~gainMoa0v3221032210euoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1594390995;
 bh=Ga4/uLKUWlfUPZ9BHNuUYUFmwSH9Mag8gjlNshjn2pQ=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=cBtgUf/6KdGqUoIif0XJqvv6Ieq7PMU2+L6mvye0ygC8N5qvUrqzRmXK/qMGOTlSI
 oBduxuoFXoeEyhHdIjW18ft13UdGLBAQ0QabArKAERBNAr6QlfQfacgd5x5gi2IceZ
 wQ7vbcUDRJqJOcEJ3pdQ4qnItxsh4cF+2WUYQ5RA=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200710142315eucas1p2f988e584e607cacf21eaa9b238d458c2~gainBqRiw2910529105eucas1p2t;
 Fri, 10 Jul 2020 14:23:15 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id D7.0D.06456.3D9780F5; Fri, 10
 Jul 2020 15:23:15 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200710142315eucas1p2025d734fcb9e2403c5e28da4aae9c75f~gaimw3dTI1525515255eucas1p29;
 Fri, 10 Jul 2020 14:23:15 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200710142315eusmtrp282f5e5e07714335d6393fbf10c7e3b17~gaimwOlyZ1201912019eusmtrp2f;
 Fri, 10 Jul 2020 14:23:15 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-1a-5f0879d34003
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 85.61.06017.3D9780F5; Fri, 10
 Jul 2020 15:23:15 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200710142314eusmtip27cf37c6510707c8c390465ba403b3ab3~gaimXGN341450814508eusmtip2N;
 Fri, 10 Jul 2020 14:23:14 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v3] video: fbdev: ssd1307fb: Added support to Column offset
To: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Message-ID: <64d46ff6-a16f-1cf6-4bb9-84524ce43207@samsung.com>
Date: Fri, 10 Jul 2020 16:23:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1589395691-8762-1-git-send-email-alencar.fmce@imbel.gov.br>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOKsWRmVeSWpSXmKPExsWy7djP87qXKzniDU4cVbP4ePcrs8XDOZeY
 LF5OOMxoMf/IOVaLK1/fs1mc6PvAanF51xw2B3aPnbPusnu8OvSLxeN+93Emj8+b5AJYorhs
 UlJzMstSi/TtErgyfh+YxljwWqziwIVu1gbGnUJdjBwcEgImEvO7VbsYuTiEBFYwSmy+sY0V
 wvnCKPHowBk2COczo8TEfw3MXYycYB1z2npZIBLLGSV2fD4D5bxllHhx8wUrSBWbgJXExPZV
 jCC2sECgRE9DDxuILSJgLNF+ayojSAOzwA1GiSvzWllAErwCdhKLbp5lArFZBFQlZj0/D2aL
 CkRIfHpwmBWiRlDi5MwnYPWcAp4S/7+tBRvKLCAucevJfCYIW15i+9s5zCALJAQ2sUvsmvaM
 FeJuF4lDl9vYIWxhiVfHt0DZMhL/d4I0gzSsY5T42/ECqns7o8Tyyf/YIKqsJe6c+8UGCjNm
 AU2J9bv0IcKOEufvnGGCBCWfxI23ghBH8ElM2jadGSLMK9HRJgRRrSaxYdkGNpi1XTtXMk9g
 VJqF5LVZSN6ZheSdWQh7FzCyrGIUTy0tzk1PLTbMSy3XK07MLS7NS9dLzs/dxAhMPqf/Hf+0
 g/HrpaRDjAIcjEo8vAsSOeKFWBPLiitzDzFKcDArifA6nT0dJ8SbklhZlVqUH19UmpNafIhR
 moNFSZzXeNHLWCGB9MSS1OzU1ILUIpgsEwenVAPjvODlpgpl8+ber/3Y/2WGyrRS8Q2RH5vM
 /I3XzlgSrqp5vyQj6MOO8qt33WqEolUkuBmfKK/xcNT5k12VES3HsGBz4LLafNaMwrWnVUJ8
 z63t/lP+wt1+6fNjGvN0m6N3uAU//qRxyHInY6l+kWRSGPe8CQcmf+96WNV5u1ps/9YC5ge/
 tjgpsRRnJBpqMRcVJwIAaDZnLzoDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRmVeSWpSXmKPExsVy+t/xe7qXKzniDXa/E7D4ePcrs8XDOZeY
 LF5OOMxoMf/IOVaLK1/fs1mc6PvAanF51xw2B3aPnbPusnu8OvSLxeN+93Emj8+b5AJYovRs
 ivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQyfh+Yxljw
 WqziwIVu1gbGnUJdjJwcEgImEnPaelm6GLk4hASWMkr8O3mHsYuRAyghI3F8fRlEjbDEn2td
 bBA1rxkluiZNZgZJsAlYSUxsX8UIYgsLBEr0NPSwgdgiAsYS7bemMoI0MAvcYJR4Me8+WIOQ
 wBxGia1tgSA2r4CdxKKbZ5lAbBYBVYlZz8+D2aICERKHd8xihKgRlDg58wkLiM0p4Cnx/9ta
 sAXMAuoSf+ZdYoawxSVuPZnPBGHLS2x/O4d5AqPQLCTts5C0zELSMgtJywJGllWMIqmlxbnp
 ucVGesWJucWleel6yfm5mxiBsbbt2M8tOxi73gUfYhTgYFTi4V2QyBEvxJpYVlyZe4hRgoNZ
 SYTX6ezpOCHelMTKqtSi/Pii0pzU4kOMpkDPTWSWEk3OB6aBvJJ4Q1NDcwtLQ3Njc2MzCyVx
 3g6BgzFCAumJJanZqakFqUUwfUwcnFINjKK9OodMBF+tU1JLKNa51ZYXeUzu9Ma5D/be22uf
 m+Sie7ko73a+kcXMgAUn2Vcqqbm5nZ1yTFt6m8B0X7F757e66Saprj1X27RrXaRyj8n98+nd
 ZteTq466r8mVsPqr9CDUaU7UsYqNcx8rmG86Z7VnftSk+SemLmX8dShpt1VwlULJ65zF75RY
 ijMSDbWYi4oTAanbaWjLAgAA
X-CMS-MailID: 20200710142315eucas1p2025d734fcb9e2403c5e28da4aae9c75f
X-Msg-Generator: CA
X-RootMTR: 20200513184838eucas1p1df4f9229dca2094694e4b16d82a95418
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200513184838eucas1p1df4f9229dca2094694e4b16d82a95418
References: <CGME20200513184838eucas1p1df4f9229dca2094694e4b16d82a95418@eucas1p1.samsung.com>
 <1589395691-8762-1-git-send-email-alencar.fmce@imbel.gov.br>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andy.shevchenko@gmail.com,
 Rodrigo Rolim Mendes de Alencar <alencar.fmce@imbel.gov.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


[ added dri-devel ML to Cc: ]

Hi,

Sorry for the delay.

On 5/13/20 8:48 PM, Rodrigo Alencar wrote:
> From: Rodrigo Rolim Mendes de Alencar <alencar.fmce@imbel.gov.br>
> 
> This patch provides support for displays like VGM128064B0W10,
> which requires a column offset of 2, i.e., its segments starts
> in SEG2 and ends in SEG129.
> 
> Signed-off-by: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>

Please resend with "From:" & "Signed-off-by:" tags fixed to match so
I can merge the patch.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  Documentation/devicetree/bindings/display/ssd1307fb.txt | 1 +
>  drivers/video/fbdev/ssd1307fb.c                         | 8 ++++++--
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/ssd1307fb.txt b/Documentation/devicetree/bindings/display/ssd1307fb.txt
> index 27333b9551b3..2dcb6d12d137 100644
> --- a/Documentation/devicetree/bindings/display/ssd1307fb.txt
> +++ b/Documentation/devicetree/bindings/display/ssd1307fb.txt
> @@ -19,6 +19,7 @@ Optional properties:
>    - vbat-supply: The supply for VBAT
>    - solomon,segment-no-remap: Display needs normal (non-inverted) data column
>                                to segment mapping
> +  - solomon,col-offset: Offset of columns (COL/SEG) that the screen is mapped to.
>    - solomon,com-seq: Display uses sequential COM pin configuration
>    - solomon,com-lrremap: Display uses left-right COM pin remap
>    - solomon,com-invdir: Display uses inverted COM pin scan direction
> diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
> index 8e06ba912d60..102f941104c0 100644
> --- a/drivers/video/fbdev/ssd1307fb.c
> +++ b/drivers/video/fbdev/ssd1307fb.c
> @@ -74,6 +74,7 @@ struct ssd1307fb_par {
>  	struct fb_info *info;
>  	u8 lookup_table[4];
>  	u32 page_offset;
> +	u32 col_offset;
>  	u32 prechargep1;
>  	u32 prechargep2;
>  	struct pwm_device *pwm;
> @@ -458,11 +459,11 @@ static int ssd1307fb_init(struct ssd1307fb_par *par)
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = ssd1307fb_write_cmd(par->client, 0x0);
> +	ret = ssd1307fb_write_cmd(par->client, par->col_offset);
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = ssd1307fb_write_cmd(par->client, par->width - 1);
> +	ret = ssd1307fb_write_cmd(par->client, par->col_offset + par->width - 1);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -626,6 +627,9 @@ static int ssd1307fb_probe(struct i2c_client *client)
>  	if (device_property_read_u32(dev, "solomon,page-offset", &par->page_offset))
>  		par->page_offset = 1;
>  
> +	if (device_property_read_u32(dev, "solomon,col-offset", &par->col_offset))
> +		par->col_offset = 0;
> +
>  	if (device_property_read_u32(dev, "solomon,com-offset", &par->com_offset))
>  		par->com_offset = 0;
>  
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
