Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A14F71EA4E6
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 15:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8AF26E02F;
	Mon,  1 Jun 2020 13:25:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D026B6E02F
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 13:25:20 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200601132519euoutp0211f36d20f50eb9fbda292dd19eb594c9~Ubl40Tb-V1973419734euoutp02Y
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 13:25:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200601132519euoutp0211f36d20f50eb9fbda292dd19eb594c9~Ubl40Tb-V1973419734euoutp02Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1591017919;
 bh=b6PizGUrN2vwV0+zYxApQ090eDAZeWVpfmcwO7qUlbw=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=FS6hgidwz7R7HYd4fbCYjlwmMnJl284zryABZMu4XyqfIN9DI/J60b7b81OvFwfmQ
 FpZHsUaRddnut23JTcNdI7l3baw+LOrYk3WVuytMvsQe7uUcl/XxVuorFHnSIqmnrD
 bcIrU9Wd7fMUBIQVnq8syv1AYK2rIhaZ3Ebdoe78=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200601132519eucas1p258f4e1b33276abd20b48c1009001aa3d~Ubl4oyA242302023020eucas1p2f;
 Mon,  1 Jun 2020 13:25:19 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id BE.A6.60698.EB105DE5; Mon,  1
 Jun 2020 14:25:18 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200601132518eucas1p2c0a9153ab4f1ce93604ebaa73b16a74a~Ubl4LXDHO2515325153eucas1p2j;
 Mon,  1 Jun 2020 13:25:18 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200601132518eusmtrp12d11f07519c739f596f9b0b5b07621cd~Ubl4KvQig2270722707eusmtrp1c;
 Mon,  1 Jun 2020 13:25:18 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-00-5ed501bea4a6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 5E.DB.08375.EB105DE5; Mon,  1
 Jun 2020 14:25:18 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200601132518eusmtip2c8670c4f489920546352ea97e17b2221~Ubl3rMcVi1577715777eusmtip2X;
 Mon,  1 Jun 2020 13:25:17 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] drivers/video: cleanup coding style in video a bit
To: Bernard Zhao <bernard@vivo.com>
Message-ID: <dacf902f-12c1-44ff-b214-b05446f07829@samsung.com>
Date: Mon, 1 Jun 2020 15:25:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200427080530.3234-1-bernard@vivo.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SaUhUYRTlm/fmzZuxkedoeLEwGiVQSAuLHpaaETgFhf4Tcxv1uZCONs8d
 S8UlM7XMH6JpbpFmmGY1lqmkuTaa4IIpLi0aKblvaKPkzBvJf+eeew7nHrgkJungm5EhikhG
 qZCHSgkRrurc6j/Zgoa9T82n2tMl7ZMYXfZ9AqOH1hcJ+l7uUwHdnbPEpwcbiwg6fzuLT6dM
 5/Dpvt5OnN7cLeNdFMmaN0px2eOMAr6sommWJ3vS4yabut/Fk63Wm8vqVjIwV4GH6EIAExoS
 zShtHX1FwckLAygizSC2ZmYCJaE0YSYSkkCdgey3tUQmEpESqgrByGAKnxvWEAz/aNUPqwh+
 Nhfj+5ac5F7ELSoRtKvX9ap5BJszuTytiqDsIfduNdJiY8oFyj6kYlpsQlnAyPKQzoBRGzxo
 3CnRicSUIyQvqXQYpyyhYvKFznCYcoeVb5/4nMYIegqmdWcIqbMw2z6sC8MoUxibLtHjY9Aw
 X4RpA4AaE4CqqFXA3X0Zlj9n6jsYw1zXGz1/FNR5WThneIlgJ+O33t2AoDJvl+BU52H8y/Ye
 JvcirKC20ZajnaFzbQfX0kAZwtd5I+4IQ3ikysc4WgwZ6RJOfQLqntUR+7GZ759jD5G08EC1
 wgN1Cg/UKfyfW4rwamTKRLFhQQxrp2BibFh5GBulCLLxDw+rR3vPpd7tWn+HWjR+bYgikfSQ
 uG5qyFvCl0ezcWFtCEhMaiK+1Kf2logD5HHxjDLcRxkVyrBt6AiJS03FduWzXhIqSB7J3GSY
 CEa5v+WRQrMkZPsHt7DuGIqvHE9QMIEuKquBWvMlV8td4gaR0lUb62C+4OHY4dfg6V9tKn49
 7Z7tq/GvWbyy4BVzO7FcM7jlP+vVfVUh/FW1mNDRLxsdvO6sMRoddQqkmgRTasEtvCz2XJaP
 cfmrdM1HIwO3uKREB9bJ8861BzbHPWv+thcL5qQ4Gyw/bY0pWfk/l+tyqFgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRmVeSWpSXmKPExsVy+t/xe7r7GK/GGcx8JW8x/8g9ZouFD+8y
 W1z5+p7NonPiEnaLE30fWC0u75rDZjH9Vw+rRfOTPlaLs2eOsVh8/7eQyYHLY++3BSwesztm
 snos3vOSyWPeyUCP+93HmTw+b5Lz2PCpgzmAPUrPpii/tCRVISO/uMRWKdrQwkjP0NJCz8jE
 Us/Q2DzWyshUSd/OJiU1J7MstUjfLkEvo/HdJcaCVu6KtU/vMjYwtnJ2MXJySAiYSPQ1nmHs
 YuTiEBJYyiix/9Bhli5GDqCEjMTx9WUQNcISf651sUHUvGaUWHLnPjNIgk3ASmJi+ypGEFtY
 wF1i4e4WsLiIgLLE9Y9XWEEamAV+MEmcejQHakMHo8TrnzOZQKp4BewkGj9sA+tmEVCRWHxv
 NVi3qECExOEdsxghagQlTs58wgJicwqYSrw8chWsl1lAXeLPvEvMELa4xK0n86Hi8hLb385h
 nsAoNAtJ+ywkLbOQtMxC0rKAkWUVo0hqaXFuem6xoV5xYm5xaV66XnJ+7iZGYJxuO/Zz8w7G
 SxuDDzEKcDAq8fBuuH8lTog1say4MvcQowQHs5IIr9PZ03FCvCmJlVWpRfnxRaU5qcWHGE2B
 npvILCWanA9MIXkl8YamhuYWlobmxubGZhZK4rwdAgdjhATSE0tSs1NTC1KLYPqYODilGhi5
 JOIY/Q6tjw1v9Bdmjt3NfL6k5cfXvTNe9rG43HxhXvmzwjokrjxvWuLi3nMVlxVuPFrj+GrC
 iTlTtSauXvuiZtejjw8CfGLz/3t8E7mf/0X36Fe+fxvfsh5onKQXtNWp/8qNbw8+SkjwfWee
 MuP+JcXqWr/tNaGdX6I1512dzOCva9cWa/BAiaU4I9FQi7moOBEAzmoWtOkCAAA=
X-CMS-MailID: 20200601132518eucas1p2c0a9153ab4f1ce93604ebaa73b16a74a
X-Msg-Generator: CA
X-RootMTR: 20200427080542eucas1p172bdcfd22affc288ec1ceaadf0dad2b0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200427080542eucas1p172bdcfd22affc288ec1ceaadf0dad2b0
References: <CGME20200427080542eucas1p172bdcfd22affc288ec1ceaadf0dad2b0@eucas1p1.samsung.com>
 <20200427080530.3234-1-bernard@vivo.com>
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
Cc: opensource.kernel@vivo.com, linux-fbdev@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Uma Shankar <uma.shankar@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Shashank Sharma <shashank.sharma@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/27/20 10:05 AM, Bernard Zhao wrote:
> Eliminate the magic numbers, add vender infoframe size macro
> like other hdmi modules.
> 
> Signed-off-by: Bernard Zhao <bernard@vivo.com>

Applied to drm-misc-next tree (patch should show up in v5.9), thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/video/hdmi.c | 2 +-
>  include/linux/hdmi.h | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
> index 856a8c4e84a2..f693076f2e5f 100644
> --- a/drivers/video/hdmi.c
> +++ b/drivers/video/hdmi.c
> @@ -495,7 +495,7 @@ int hdmi_vendor_infoframe_init(struct hdmi_vendor_infoframe *frame)
>  	 * value
>  	 */
>  	frame->s3d_struct = HDMI_3D_STRUCTURE_INVALID;
> -	frame->length = 4;
> +	frame->length = HDMI_VENDOR_INFOFRAME_SIZE;
>  
>  	return 0;
>  }
> diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
> index 9613d796cfb1..ff25aeb95ee4 100644
> --- a/include/linux/hdmi.h
> +++ b/include/linux/hdmi.h
> @@ -57,6 +57,7 @@ enum hdmi_infoframe_type {
>  #define HDMI_SPD_INFOFRAME_SIZE    25
>  #define HDMI_AUDIO_INFOFRAME_SIZE  10
>  #define HDMI_DRM_INFOFRAME_SIZE    26
> +#define HDMI_VENDOR_INFOFRAME_SIZE  4
>  
>  #define HDMI_INFOFRAME_SIZE(type)	\
>  	(HDMI_INFOFRAME_HEADER_SIZE + HDMI_ ## type ## _INFOFRAME_SIZE)
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
