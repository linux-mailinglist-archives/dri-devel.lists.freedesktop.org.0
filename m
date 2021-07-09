Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 575E53C2779
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 18:23:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 624236EA4B;
	Fri,  9 Jul 2021 16:23:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC9A6EA4B
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 16:23:42 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 169GDB0h013957; Fri, 9 Jul 2021 18:23:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=BFXPyLwnQX0IGYJbNBtii9OnEocPgIMUc+TRacUYf6Y=;
 b=sY+kY7kS7jxwIUSB7IUOTNT2gbLrFuem6XcDzTV59X0TctV+ZF8kkfLXGnoYYKxtGSV+
 3otyVwwlV1lXfP+m6hnvN+CNQjOj7reFoa+f5YByfTAgREmB4cqC8cWw2hzdn8Cc6eV1
 tg+N2A8s2sXMiaqnC1qMxwdVbty6S+lqsKAJL4AptMy8JErg/ioJzS84J9tGhohqhUXA
 EFuR+KDn4xmA7DkpnR9CiZIaipr5cX6t9kXbX5oi6Yyih9x848ujjIfwx7SJsgSd13by
 rmNGrfPdTMQ8McEANdqSec8C/Q26nYlip6LgfVHZwUjmruxWn715xWBSp2mfzyw1Agzd ww== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39pk0std2y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jul 2021 18:23:31 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 570D410002A;
 Fri,  9 Jul 2021 18:23:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 33E13248ED0;
 Fri,  9 Jul 2021 18:23:28 +0200 (CEST)
Received: from lmecxl0557.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 9 Jul
 2021 18:23:27 +0200
Subject: Re: [PATCH 1/2] drm: add crtc background color property
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20210707084557.22443-1-raphael.gallais-pou@foss.st.com>
 <20210707084557.22443-2-raphael.gallais-pou@foss.st.com>
 <20210709110459.79ca406a@eldfell>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Message-ID: <3c8331cf-fded-b6e6-3e25-666634f4b87a@foss.st.com>
Date: Fri, 9 Jul 2021 18:23:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709110459.79ca406a@eldfell>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-09_10:2021-07-09,
 2021-07-09 signatures=0
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 David Airlie <airlied@linux.ie>,
 Yannick FERTRE - foss <yannick.fertre@foss.st.com>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yannick FERTRE <yannick.fertre@st.com>,
 Philippe CORNU - foss <philippe.cornu@foss.st.com>,
 Philippe CORNU <philippe.cornu@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 7/9/21 10:04 AM, Pekka Paalanen wrote:
> On Wed, 7 Jul 2021 08:48:47 +0000
> Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com> wrote:
>
>> Some display controllers can be programmed to present non-black colors
>> for pixels not covered by any plane (or pixels covered by the
>> transparent regions of higher planes).  Compositors that want a UI with
>> a solid color background can potentially save memory bandwidth by
>> setting the CRTC background property and using smaller planes to display
>> the rest of the content.
>>
>> To avoid confusion between different ways of encoding RGB data, we
>> define a standard 64-bit format that should be used for this property's
>> value.  Helper functions and macros are provided to generate and dissect
>> values in this standard format with varying component precision values.
>>
>> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> ---
>>   drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
>>   drivers/gpu/drm/drm_atomic_uapi.c         |  4 +++
>>   drivers/gpu/drm/drm_blend.c               | 34 +++++++++++++++++++++--
>>   drivers/gpu/drm/drm_mode_config.c         |  6 ++++
>>   include/drm/drm_blend.h                   |  1 +
>>   include/drm/drm_crtc.h                    | 12 ++++++++
>>   include/drm/drm_mode_config.h             |  5 ++++
>>   include/uapi/drm/drm_mode.h               | 28 +++++++++++++++++++
>>   8 files changed, 89 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
>> index ddcf5c2c8e6a..1b95a4ecdb2b 100644
>> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
>> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
>> @@ -72,6 +72,7 @@ __drm_atomic_helper_crtc_state_reset(struct drm_crtc_state *crtc_state,
>>   				     struct drm_crtc *crtc)
>>   {
>>   	crtc_state->crtc = crtc;
>> +	crtc_state->bgcolor = drm_argb(16, 0xffff, 0, 0, 0);
>>   }
>>   EXPORT_SYMBOL(__drm_atomic_helper_crtc_state_reset);
>>   
>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
>> index 438e9585b225..fea68f8f17f8 100644
>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>> @@ -483,6 +483,8 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
>>   		set_out_fence_for_crtc(state->state, crtc, fence_ptr);
>>   	} else if (property == crtc->scaling_filter_property) {
>>   		state->scaling_filter = val;
>> +	} else if (property == config->bgcolor_property) {
>> +		state->bgcolor = val;
>>   	} else if (crtc->funcs->atomic_set_property) {
>>   		return crtc->funcs->atomic_set_property(crtc, state, property, val);
>>   	} else {
>> @@ -520,6 +522,8 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
>>   		*val = 0;
>>   	else if (property == crtc->scaling_filter_property)
>>   		*val = state->scaling_filter;
>> +	else if (property == config->bgcolor_property)
>> +		*val = state->bgcolor;
>>   	else if (crtc->funcs->atomic_get_property)
>>   		return crtc->funcs->atomic_get_property(crtc, state, property, val);
>>   	else
>> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
>> index ec37cbfabb50..6692d6a6db22 100644
>> --- a/drivers/gpu/drm/drm_blend.c
>> +++ b/drivers/gpu/drm/drm_blend.c
>> @@ -186,8 +186,7 @@
>>    *		 assumed to be 1.0
>>    *
>>    * Note that all the property extensions described here apply either to the
>> - * plane or the CRTC (e.g. for the background color, which currently is not
>> - * exposed and assumed to be black).
>> + * plane or the CRTC.
>>    *
>>    * SCALING_FILTER:
>>    *     Indicates scaling filter to be used for plane scaler
>> @@ -201,6 +200,21 @@
>>    *
>>    * Drivers can set up this property for a plane by calling
>>    * drm_plane_create_scaling_filter_property
>> + *
> Hi,


Hi Pekka,


Many thanks for your feedback, your comments are taken into account for 
a v2.


>
> I assume the below block is the UAPI documentation of this new property
> and that it would appear with the other UAPI docs.
>
>> + * BACKGROUND_COLOR:
>> + *	Defines the ARGB color of a full-screen layer that exists below all
>> + *	planes.  This color will be used for pixels not covered by any plane
>> + *	and may also be blended with plane contents as allowed by a plane's
>> + *	alpha values.  The background color defaults to black, and is assumed
>> + *	to be black for drivers that do not expose this property.
> All good up to here.
>
>>   Although
>> + *	background color isn't a plane, it is assumed that the color provided
>> + *	here undergoes the same pipe-level degamma/CSC/gamma transformations
>> + *	that planes undergo.
> This sounds to me like it refers to the per-plane degamma/csc/gamma
> which are new properties in development. I believe you do not mean
> that, but you mean the CRTC degamma/csc/gamma and everything else which
> apply *after* the blending of planes. So the wording here would need
> clarification.


Yes, I was not sure about this, but it is effectively the general CRTC 
color correction which is applicable to the background color.

>
>>   Note that the color value provided here includes
>> + *	an alpha channel...non-opaque background color values are allowed,
>> + *	but are generally only honored in special cases (e.g., when a memory
>> + *	writeback connector is in use).
> This could be read as: if you use a non-opaque color value, it will
> usually be completely ignored (and the background will be e.g. black
> instead). Is that your intention?
>
> I think a more useful definition would be that the alpha is used in
> blending as always, but because we do not yet have physically
> transparent monitors, the final alpha value may not reach the video
> sink or the video sink may ignore it.

In our case, the hardware does not support alpha channel (as you can see 
the DRM_ARGB_TO_LTDC_RGB24 macro in the second patch).

For chip vendors who does support this feature, the video sink would get 
this transparency parameter. In the case where it is not, alpha channel 
would be ignored.


>> + *
>> + *	This property is setup with drm_crtc_add_bgcolor_property().
> You forgot to document the value format of this property. The ARGB color
> format needs to be defined at least to the same detail as all pixel
> formats in drm_fourcc.h are. If there is a suitable DRM_FORMAT_*
> definition already, simply saying the color is in that format would be
> enough.


Will do ! :)

I was thinking about the FourCC AR4H format. Have you something else in 
mind ?

>
> Another thing to document is whether this color value is alpha
> pre-multiplied or not. Planes can have the property "pixel blend mode",
> but because the background color is not on a plane, that property
> cannot apply here.
>
> The difference it makes is that if background color is both non-opaque
> and pre-multiplied, then the question arises what pixel values will
> actually be transmitted to video sink for the background. Will the
> alpha pre-multiplication be undone?
>
> Btw. note that "pixel blend mode" property does not document the use of
> background alpha at all. So if the background color can have non-opaque
> alpha, then you need to document the behavior in "pixel blend mode". It
> also does not document what alpha value will result from blending, for
> blending the next plane.

Those are questions that did not crossed my mind at all.

What would you suggest ? Instinctively I would say that in the case 
where there is a non-opaque background color,

alpha pre-multiplication would not be taken into account, although it is 
maybe not the best solution.

As I am not quite sure, I will lookup for this.


>
> The question about full vs. limited range seems unnecessary to me, as
> the background color will be used as-is in the blending stage, so
> userspace can just program the correct value that fits the pipeline it
> is setting up.
>
> One more question is, as HDR exists, could we need background colors
> with component values greater than 1.0?

AR4H color format should cover that case, isn't it ?



Regards,

Raphaël

>
> Scanout of FP16 formats exists.
>
>>    */
>
> Thanks,
> pq
