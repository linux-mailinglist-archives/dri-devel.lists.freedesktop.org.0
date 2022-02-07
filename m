Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 424874AB802
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 11:00:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64AE810E6E4;
	Mon,  7 Feb 2022 10:00:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D110B10E6E4
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 10:00:48 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2179CZSj016591;
 Mon, 7 Feb 2022 11:00:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=veZo0P/JfQdRJDIli6sGt4ZGDkxpZF8WrXm4WgcbFDs=;
 b=LyOM7OE32aQxV9zw7duuPrfrJldOPTSzvtdbO7khQHp6VH6nsQS/1nDO1hXbZLmJq3nw
 7PsdcbDW2DruY7hmskH5TenmUVY9yx7uJ5i1DaUsAgLg+HOCJUkGv7VGwAMsVAtu4F96
 sCJ/nB5vp27U2qF3aQGMcKiyNcnqc+aDARpliHA9q4KtKmWvBpM2371vS0moSutXQlXv
 JD7nJX3nfnuqtwSrLyWpVfNb7yZ7m865ES71jT5FzTN6K3vYc11iMh0Vob87hfDscjJB
 3OMPkL/dsoItJkdZBEb9HLlQ9rzsqz2u0jZF322OtUadHKol830UF6t/NX5nkfrXyXfN /w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3e30kg08hy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 11:00:37 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5343C10002A;
 Mon,  7 Feb 2022 11:00:35 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3EFD9212FC5;
 Mon,  7 Feb 2022 11:00:35 +0100 (CET)
Received: from [10.129.7.146] (10.75.127.49) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 7 Feb
 2022 11:00:34 +0100
Message-ID: <7bd0a0a9-4015-b54c-f745-f813496be61b@foss.st.com>
Date: Mon, 7 Feb 2022 11:00:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 5/5] drm/stm: ltdc: add support of ycbcr pixel formats
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>
References: <20211215214843.20703-1-yannick.fertre@foss.st.com>
 <Yfq3XwozrxYaFhgD@dev-arch.archlinux-ax161>
From: yannick Fertre <yannick.fertre@foss.st.com>
In-Reply-To: <Yfq3XwozrxYaFhgD@dev-arch.archlinux-ax161>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_03,2022-02-07_01,2021-12-02_01
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
Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 David Airlie <airlied@linux.ie>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nathan,

On 2/2/22 17:54, Nathan Chancellor wrote:
> Hi Yannick,
> 
> On Wed, Dec 15, 2021 at 10:48:43PM +0100, Yannick Fertre wrote:
>> This patch adds the following YCbCr input pixel formats on the latest
>> LTDC hardware version:
>>
>> 1 plane  (co-planar)  : YUYV, YVYU, UYVY, VYUY
>> 2 planes (semi-planar): NV12, NV21
>> 3 planes (full-planar): YU12=I420=DRM YUV420, YV12=DRM YVU420
>>
>> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> 
> <snip>
> 
>> +static inline void ltdc_set_ycbcr_config(struct drm_plane *plane, u32 drm_pix_fmt)
>> +{
>> +	struct ltdc_device *ldev = plane_to_ltdc(plane);
>> +	struct drm_plane_state *state = plane->state;
>> +	u32 lofs = plane->index * LAY_OFS;
>> +	u32 val;
>> +
>> +	switch (drm_pix_fmt) {
>> +	case DRM_FORMAT_YUYV:
>> +		val = (YCM_I << 4) | LxPCR_YF | LxPCR_CBF;
>> +		break;
>> +	case DRM_FORMAT_YVYU:
>> +		val = (YCM_I << 4) | LxPCR_YF;
>> +		break;
>> +	case DRM_FORMAT_UYVY:
>> +		val = (YCM_I << 4) | LxPCR_CBF;
>> +		break;
>> +	case DRM_FORMAT_VYUY:
>> +		val = (YCM_I << 4);
>> +		break;
>> +	case DRM_FORMAT_NV12:
>> +		val = (YCM_SP << 4) | LxPCR_CBF;
>> +		break;
>> +	case DRM_FORMAT_NV21:
>> +		val = (YCM_SP << 4);
>> +		break;
>> +	case DRM_FORMAT_YUV420:
>> +	case DRM_FORMAT_YVU420:
>> +		val = (YCM_FP << 4);
>> +		break;
>> +	default:
>> +		/* RGB or not a YCbCr supported format */
>> +		break;
>> +	}
>> +
>> +	/* Enable limited range */
>> +	if (state->color_range == DRM_COLOR_YCBCR_LIMITED_RANGE)
>> +		val |= LxPCR_YREN;
>> +
>> +	/* enable ycbcr conversion */
>> +	val |= LxPCR_YCEN;
>> +
>> +	regmap_write(ldev->regmap, LTDC_L1PCR + lofs, val);
>> +}
> 
> This patch as commit 484e72d3146b ("drm/stm: ltdc: add support of ycbcr
> pixel formats") in -next introduced the following clang warning:
> 
> drivers/gpu/drm/stm/ltdc.c:625:2: warning: variable 'val' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
>          default:
>          ^~~~~~~
> drivers/gpu/drm/stm/ltdc.c:635:2: note: uninitialized use occurs here
>          val |= LxPCR_YCEN;
>          ^~~
> drivers/gpu/drm/stm/ltdc.c:600:9: note: initialize the variable 'val' to silence this warning
>          u32 val;
>                 ^
>                  = 0
> 1 warning generated.
> 
> Would it be okay to just return in the default case (maybe with a
> message about an unsupported format?) or should there be another fix?
> 
> Cheers,


Thanks for your help.
It'okay for a message for unsupported format with a return in the 
default case.
Do you want create & push the patch?

Best regards
