Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E82D6EFAB6
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 21:12:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A1410E812;
	Wed, 26 Apr 2023 19:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B8210E812;
 Wed, 26 Apr 2023 19:11:55 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33QJ1PLK008939; Wed, 26 Apr 2023 19:11:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=b/gXqjuu5LyNmxNzwRjuUgoq5mvcvVvZuKuxcmucfhM=;
 b=j0mvfXwajc3fqlFSWtTlSIt8VEZeSW/CWc4cwz667NLST+oGQ8Wcz+mvn4/Oxspneu4P
 5xDefS8fxpLeS19hlPHvr+1/jxf2Qc/HvyVtEA/X0iRKqZwJMGR0r4B8tBL5CCwAXdIe
 xrD1T5W2K746UJm80tD19iS2wprBLpMx4LkHchpsANfZ2/HNNzVQ1cqztcu6son8uzlj
 l5uKcNpjeoJwTs8vwnWHFPME2e5PNyZUH/+KKn3QLURsPEcs2DsbYMFtnKeJRK03R4EX
 IlaJlI0heN/rLnaukpYAcyNoGUENERM5D5YEdt43O5xDHozJhQDF7JDqsQLClwlZcpf3 oQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q6uuvj23m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 19:11:47 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33QJBgV6000323
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 19:11:42 GMT
Received: from [10.110.124.105] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 26 Apr
 2023 12:11:40 -0700
Message-ID: <e0a64c2b-6178-6513-d7ba-d6a79831f21d@quicinc.com>
Date: Wed, 26 Apr 2023 12:11:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 06/21] drm/msm/dpu: Use V2 DITHER PINGPONG sub-block in
 SM8[34]50/SC8280XP
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230411-dpu-intf-te-v3-0-693b17fe6500@somainline.org>
 <20230411-dpu-intf-te-v3-6-693b17fe6500@somainline.org>
 <d44022e0-bc09-122e-5a48-1994cb025ba8@quicinc.com>
 <vwejuayy7ulq3frpqpqetkyhyefgrmgo6222how4hp4bissepx@uauvwlhsekgn>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <vwejuayy7ulq3frpqpqetkyhyefgrmgo6222how4hp4bissepx@uauvwlhsekgn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 2Ieh1RGqGlQPVEXtNzmNGfr6tOocGOrh
X-Proofpoint-GUID: 2Ieh1RGqGlQPVEXtNzmNGfr6tOocGOrh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-26_10,2023-04-26_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=798 spamscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304260171
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
Cc: dri-devel@lists.freedesktop.org, Jordan Crouse <jordan@cosmicpenguin.net>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Robert Foss <rfoss@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Adam Skladowski <a39.skl@gmail.com>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/26/2023 12:08 PM, Marijn Suijten wrote:
> On 2023-04-26 09:24:19, Abhinav Kumar wrote:
>>
>>
>> On 4/25/2023 4:05 PM, Marijn Suijten wrote:
>>> According to downstream sources this DITHER sub-block sits at an offset
>>> of 0xe0 with version 0x20000.  The PP_BLK_DITHER macro is _not_ used as
>>> downstream still says the size of the PINGPONG block is 0xd4 and not 0.
>>>
>>
>> the PINGPONG block size is 0x0 on sm8350, sm8450 and sc8280xp.
>>
>> and length of dither is 0x20 and they all start at 0xe0.
>>
>> So now does anything prevent us from using PP_BLK_DITHER macro for these?
> 
> Nothing prevents it from being used (if you are referring to our
> previous conversations) besides this information not being available in
> public DTS (I simply did not know) and the fact that all these many
> fixes - however necessary they are - distract from the main topic of
> this series: bringing INTF TE support to DPU1.
> 

Yeah, you could have sent these as a separate series if you wanted to 
stick to this one being only intf te.

> I'll fit in that patch though, as I have to send v4 anyway.

Thanks.

> 
> - Marijn
