Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 367FA57E489
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 18:38:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF533903A2;
	Fri, 22 Jul 2022 16:38:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6775890809;
 Fri, 22 Jul 2022 16:38:04 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26MG8FJp015304;
 Fri, 22 Jul 2022 16:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=wPnjrGgNVhbBSH8gF2RGxnPdRwwa5gYEtG3aPqkrRNk=;
 b=MqDDjFOedVQR7TYyFZwLPHvjAS0ApjMZCdnMnRQN64RLHxlvHcJmPSzx+UkeCbPloxIr
 PBSdiUwLDBLcGrJHiDWPQaPlkG8HYOzote2GcEceVL5x1ycTEP/dQUmfDJCd9s1j4fY3
 isSOQx6yqC28KGMDdJNuni4pn8F1xmFOTsRQ/LOqw6Paccgnxf8CWWQ3i0zoBK5+NVhb
 rzOfQaE9jsjOtW/zKkOYEjHSN56KmT8l606cepLGhMrdxJRagrTiVbcKNMYG6jHeViqE
 MARntvF5IW38Fe+6jeC+ZsZiGfY4eaC0nFWdxw/YKVFQBXVckP336z7Vs/Z4hP+ee4YB Rw== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3hftv78w19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jul 2022 16:37:52 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.47.97.222])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 26MGbpBu008535
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jul 2022 16:37:51 GMT
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 22 Jul 2022 09:37:51 -0700
Received: from [10.38.243.149] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 22 Jul
 2022 09:37:48 -0700
Message-ID: <269f2610-425b-f296-dcfc-89bdc2e1d587@quicinc.com>
Date: Fri, 22 Jul 2022 09:37:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PATCH] drm/edid: Make 144 Hz not preferred on Sharp
 LQ140M1JW46
Content-Language: en-US
To: Douglas Anderson <dianders@chromium.org>, <dri-devel@lists.freedesktop.org>
References: <20220721152314.RFC.1.Ie333b3e4aff6e4a5b58c4aa805e030e561be8773@changeid>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220721152314.RFC.1.Ie333b3e4aff6e4a5b58c4aa805e030e561be8773@changeid>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: OdVUAT7OcjVy9m3db0NZ8-DlwwxG64rn
X-Proofpoint-GUID: OdVUAT7OcjVy9m3db0NZ8-DlwwxG64rn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-22_06,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011
 suspectscore=0 impostorscore=0 adultscore=0 mlxlogscore=999 spamscore=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207220070
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ sankeerth

Hi Doug

On 7/21/2022 3:23 PM, Douglas Anderson wrote:
> The Sharp LQ140M1JW46 panel is on the Qualcomm sc7280 CRD reference
> board. This panel supports 144 Hz and 60 Hz. In the EDID, the 144 Hz
> mode is listed first and thus is marked preferred. The EDID decode I
> ran says:
> 
>    First detailed timing includes the native pixel format and preferred
>    refresh rate.
> 
>    ...
> 
>    Detailed Timing Descriptors:
>      DTD 1:  1920x1080  143.981 Hz  16:9   166.587 kHz  346.500 MHz
>                   Hfront   48 Hsync  32 Hback  80 Hpol N
>                   Vfront    3 Vsync   5 Vback  69 Vpol N
>      DTD 2:  1920x1080   59.990 Hz  16:9    69.409 kHz  144.370 MHz
>                   Hfront   48 Hsync  32 Hback  80 Hpol N
>                   Vfront    3 Vsync   5 Vback  69 Vpol N
> 
> I'm proposing here that the above is actually a bug and that the 60 Hz
> mode really should be considered preferred by Linux.
> 
> The argument here is that this is a laptop panel and on a laptop we
> know power will always be a concern. Presumably even if someone using
> this panel wanted to use 144 Hz for some use cases they would only do
> so dynamically and would still want the default to be 60 Hz.
> 
> Let's change the default to 60 Hz using a standard quirk.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Yes, we were aware that 144Hz was getting picked. We found that while 
debugging the screen corruption issue.

Well, yes power would be less with 60Hz but so will be the performance.

The test teams have been validating with 144Hz so far so we are checking 
internally with the team whether its OKAY to goto 60Hz now since that 
kind of invalidates the testing they have been doing.

Will update this thread once we finalize.


> ---
> 
>   drivers/gpu/drm/drm_edid.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index bbc25e3b7220..06ff8ba216af 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -160,6 +160,9 @@ static const struct edid_quirk {
>   	EDID_QUIRK('S', 'A', 'M', 596, EDID_QUIRK_PREFER_LARGE_60),
>   	EDID_QUIRK('S', 'A', 'M', 638, EDID_QUIRK_PREFER_LARGE_60),
>   
> +	/* 144 Hz should only be used when needed; it wastes power */
> +	EDID_QUIRK('S', 'H', 'P', 0x1523, EDID_QUIRK_PREFER_LARGE_60),
> +
>   	/* Sony PVM-2541A does up to 12 bpc, but only reports max 8 bpc */
>   	EDID_QUIRK('S', 'N', 'Y', 0x2541, EDID_QUIRK_FORCE_12BPC),
>   
