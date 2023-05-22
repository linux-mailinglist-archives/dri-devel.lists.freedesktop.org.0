Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7260170CE0B
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 00:36:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD7F10E3AD;
	Mon, 22 May 2023 22:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA57910E2BF;
 Mon, 22 May 2023 22:36:00 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34MKMYxj007942; Mon, 22 May 2023 22:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=GyF9u10zK3b8Ehcl3xHrJgwZsQ7joD1Bo6aJOLb2Avg=;
 b=f/maWul0KL1bUSXz7ZsyW0A/HZQaOEVM2oWh451aOCCUfK/EILdfYCn5zQBiA6KugsrF
 mbxdjFI98jXLBb5c8tC/BY6ebuGVdo9pdq1MBqEBld2MZ/fokt51L+nkw/mMCb99TaB1
 MRhZMXwZK95Rtl0v2YXN1xOMth490sQCWlFnzfwHHSaM1MM3F7J2aKYg+eNxOUbPQwnA
 nRiryafevhuz1HQbZR0yzpyw5k16dICOwxB7iQtqmZ0wohpMz2MyHznWeLxKImbjDMJ2
 RDmOkXR3dLRUkq1NoaNPyii0LWJSdNVCyvvIfb4dKg69K3HYUmmM40594KzqXhq++Hc9 rA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qre8p09pb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 May 2023 22:35:56 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34MMZMvr001817
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 May 2023 22:35:22 GMT
Received: from [10.71.110.189] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 22 May
 2023 15:35:21 -0700
Message-ID: <9804c558-124d-aca4-c534-158c0457b7bf@quicinc.com>
Date: Mon, 22 May 2023 15:35:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3] drm/msm/dp: enable HDP plugin/unplugged interrupts at
 hpd_enable/disable
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <andersson@kernel.org>
References: <1684791092-1822-1-git-send-email-quic_khsieh@quicinc.com>
 <20230522220555.7ood44kavjzzg3lv@ripper>
 <c4d6e019-1582-c94f-d56d-271c420d72ea@linaro.org>
Content-Language: en-US
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <c4d6e019-1582-c94f-d56d-271c420d72ea@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: SR81ldgiOMVt5touDXY22-UAFxnm8qrh
X-Proofpoint-GUID: SR81ldgiOMVt5touDXY22-UAFxnm8qrh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_16,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 adultscore=0 mlxlogscore=979 mlxscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305220191
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, quic_jesszhan@quicinc.com, marijn.suijten@somainline.org,
 swboyd@chromium.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



>>>   -static void dp_display_config_hpd(struct dp_display_private *dp)
>>> -{
>>> -
>>> -    dp_display_host_init(dp);
>>> -    dp_catalog_ctrl_hpd_config(dp->catalog);
>>> -
>>> -    /* Enable plug and unplug interrupts only if requested */
>>> -    if (dp->dp_display.internal_hpd)
>>> -        dp_catalog_hpd_config_intr(dp->catalog,
>>> -                DP_DP_HPD_PLUG_INT_MASK |
>>> -                DP_DP_HPD_UNPLUG_INT_MASK,
>>> -                true);
>>> -
>>> -    /* Enable interrupt first time
>>> -     * we are leaving dp clocks on during disconnect
>>> -     * and never disable interrupt
>>> -     */
>>> -    enable_irq(dp->irq);
>>
>> ...we need dp->irq enabled for handling the other interrupts, otherwise
>> e.g. AUX transfers will time out.
>>
>> I added enable_irq(dp_priv->irq) to the EV_HPD_INIT_SETUP case below,
>> just for testing, and with that the patch seems to be working fine.
>>
>>
>> Is there any reason why we need to delay its enablement to after we
>> unmask the HPD interrupts?

my though is aux transaction should happen after plugin interrupt detected.

can you please let me know what did you do to trigger aux timeout?

It does not happen on me at my test.

>
> As I wrote, I'd probably prefer to see enable_irq() and disable_irq() 
> calls gone.

ok, i will move enable_irq() out of here.


>>
>> Regards,
>> Bjorn
>>
>
