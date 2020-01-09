Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0F6135FCA
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 18:52:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C05306E956;
	Thu,  9 Jan 2020 17:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A521B6E450
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2020 16:18:58 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 009G7nSU029953; Thu, 9 Jan 2020 17:18:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=idKaq3yf7AW1Ooj8i11PIIlN4aaycLYtIV7dTwDVLvA=;
 b=lcE3DBPva4g9K59cg+eKniB2pli9JCUeDkQxApL2qyaRjEDnxeTWIrlzTil27CApak9V
 gUNoHGloW1qni/9eJwvIxeFNo3lLvdFv+x4cqYHyKzpktwZao7+QPb4r3l3eKpM7Liaf
 eQHb5XAbagfrKHWbQD/3Khsfm1IccniycqzDALVJ2GoUh7NxtG0D0QmBdG2Fn2CT29CY
 cKsMmDaIebawhqz3Y1sq2RG3NLL6fd88ZvIpIY8YqBS4EIJzmlVcL9CbwLjLIvEtvbcT
 beUw4f892SoxwYxvXJ/l6CuseA3pcFi/Sp5qUYocCNbntYQt09B9Ire3EeGZ+Qx/1hsm JA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xakur2n6n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jan 2020 17:18:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 989FF10002A;
 Thu,  9 Jan 2020 17:18:41 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3E1922C6A6E;
 Thu,  9 Jan 2020 17:18:41 +0100 (CET)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 9 Jan
 2020 17:18:40 +0100
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Thu, 9 Jan 2020 17:18:40 +0100
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "sean@poorly.run" <sean@poorly.run>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "yakui.zhao@intel.com" <yakui.zhao@intel.com>
Subject: Re: [PATCH] drm/modes: tag unused variables to avoid warnings
Thread-Topic: [PATCH] drm/modes: tag unused variables to avoid warnings
Thread-Index: AQHVr0QHe45uG+/0wEOCcI9XDhFsl6ffTFuAgANVQQA=
Date: Thu, 9 Jan 2020 16:18:40 +0000
Message-ID: <ab5d769f-60ff-e99d-6802-d93f94fd240d@st.com>
References: <20191210102437.19377-1-benjamin.gaignard@st.com>
 <ec3838df-6e8a-b0d9-4b00-2fcd07f97630@suse.de>
In-Reply-To: <ec3838df-6e8a-b0d9-4b00-2fcd07f97630@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <D968947B67812B498EA79ABC97EB4C37@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-09_03:2020-01-09,
 2020-01-09 signatures=0
X-Mailman-Approved-At: Thu, 09 Jan 2020 17:51:28 +0000
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/7/20 2:24 PM, Thomas Zimmermann wrote:
> Hi
>
> Am 10.12.19 um 11:24 schrieb Benjamin Gaignard:
>> Some variables are set but never used. To avoid warning when compiling
>> with W=1 and keep the algorithm like it is tag theses variables
>> with _maybe_unused macro.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Applied on drm-misc-next.

Thanks,

Benjamin

>
>> ---
>> changes in this version:
>> - do not modify the code to remove the unused variables
>>    just prefix them with __maybe_unused macro.
>>    
>>   drivers/gpu/drm/drm_modes.c | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
>> index 88232698d7a0..70aed4e2990d 100644
>> --- a/drivers/gpu/drm/drm_modes.c
>> +++ b/drivers/gpu/drm/drm_modes.c
>> @@ -233,7 +233,7 @@ struct drm_display_mode *drm_cvt_mode(struct drm_device *dev, int hdisplay,
>>   		/* 3) Nominal HSync width (% of line period) - default 8 */
>>   #define CVT_HSYNC_PERCENTAGE	8
>>   		unsigned int hblank_percentage;
>> -		int vsyncandback_porch, vback_porch, hblank;
>> +		int vsyncandback_porch, __maybe_unused vback_porch, hblank;
>>   
>>   		/* estimated the horizontal period */
>>   		tmp1 = HV_FACTOR * 1000000  -
>> @@ -386,9 +386,10 @@ drm_gtf_mode_complex(struct drm_device *dev, int hdisplay, int vdisplay,
>>   	int top_margin, bottom_margin;
>>   	int interlace;
>>   	unsigned int hfreq_est;
>> -	int vsync_plus_bp, vback_porch;
>> -	unsigned int vtotal_lines, vfieldrate_est, hperiod;
>> -	unsigned int vfield_rate, vframe_rate;
>> +	int vsync_plus_bp, __maybe_unused vback_porch;
>> +	unsigned int vtotal_lines, __maybe_unused vfieldrate_est;
>> +	unsigned int __maybe_unused hperiod;
>> +	unsigned int vfield_rate, __maybe_unused vframe_rate;
>>   	int left_margin, right_margin;
>>   	unsigned int total_active_pixels, ideal_duty_cycle;
>>   	unsigned int hblank, total_pixels, pixel_freq;
>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
