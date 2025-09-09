Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA66DB4A590
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 10:39:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0977810E65D;
	Tue,  9 Sep 2025 08:39:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SamWdDe4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB38810E65C
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 08:39:39 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5896SYWk027328
 for <dri-devel@lists.freedesktop.org>; Tue, 9 Sep 2025 08:39:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TDpymrykwq2D9vEJfSPg+EEbvFuEeU+GWf9UCfxacp4=; b=SamWdDe4fTtbgA9R
 SvvGuYQtNjyLflZYkoug3yceJxrIesUeSQEEtWJrQJpvjQfSWzSIBlPsD5h6IQXx
 0IrbpslAYVraUSdlu828cic2BkGX0/LrZpbvFAFQ1tcaVYm1F4x9fGNo1xxcCOZy
 BCc5vCmrgUgOCn0uVBtO4YWExFS9Zist3V6gRtOnX8paRmBWFV1ToqtlAM3opInu
 eO4xORvJRD+ZsGS0bDSiWfSbwTzRI5zlNamN17RzZyD0D7CHI1tSq+UARJ7qVmqV
 M7L6upjLJifW3ToswczWfx+DxFTyrCZSaCzUozoELgOFR6xrKT+K/I5P5GNxCyQV
 IS2jfg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqfyd15-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 08:39:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-329be00e966so1441362a91.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 01:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757407178; x=1758011978;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TDpymrykwq2D9vEJfSPg+EEbvFuEeU+GWf9UCfxacp4=;
 b=LY+96BaoubV3UShUw33TYnApcokQHqw13oEFbNk7tGObnDpMD0aqB9UTFuFa+YVxLQ
 +XtIZCRyyUbbuCPvaOFRNQptyhuITT8P7eXDx55fm2DS2XpUbnGQEZRHbDz5LW5RftBU
 mej/0HWEdPhSrhcmLD2SCtcHV5aJQX4l1DCYTcGUxaFDVqFg2BXpuP1HE/tDnT2lkg9K
 TjKvEOj6Qw1aKjf5pTKVYmQjdv3e9u8ph21AICvF7uAvQPPqZhZcUnFhxoDkrMkVkONM
 OBWGZZezQ0whIL86l8rGN2o0lOeoViv01qvprl5IFUPMhKSxYeIxbRgzWjI9eTfYd0Gz
 1ReQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyGXlhyrYopkQJZ/kzx9g0fS3zFDzM0Zs94W45dQQnlykpmlGf4XNyf1ZocUfwF7UXqCHTnyTjbOk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzF3SlMdq0ZWnZDM+oOCAKvJHL//Op3h3MKdQoftC1fMUi8R49a
 4iMmxYCpYpG4zCVJX6W7Di7m42sF9iFToMrT3c8Zm8xL6uTgGiQLvRXykGWY9TZZx4vzpiyE5th
 lat3kD5qe+lXmoELhzyKq8I7VKuicXEv5iFqEcXQD0Uw54LNJpLQ9K93N+idWKS9OR534f04=
X-Gm-Gg: ASbGncs1tYmGVWCKZS7nWpupcH/6HpWx5hoR5DuVxzNzla101zUbUTkDMFjfkLnkbwe
 oSQxOX3geb1XSns9rC78JZLqM+EV027ElrwMeP1/+9v6ip0e86kdATMqig3bOWPHibfayglKb5A
 icXVFlQLfcrqqK3rcejZYWpcnFFRzQy0t/1vGhauMyHIz5uUl8Y/MAuLQBfXZoSPpWupMnwD2Un
 S/eybS9up6Rm5IzaAs8DpTdLGGBVj+Tr3Nah/XcQ+vv9mrUWJrtyLeXWxoqViozenW84ImFBsTA
 XQFj5F+g5WOYLksmfVP/XZJpyr1wU7f+H3lj9Av1KpvdcY8ENgi/7L2RSdZynItNNdJOGcbwX3q
 A1SVJk/IxcNsgFE7M1YZqx2wLmNsBQg==
X-Received: by 2002:a17:90b:4a92:b0:32b:87ef:5faa with SMTP id
 98e67ed59e1d1-32d43f91aadmr7805311a91.4.1757407178399; 
 Tue, 09 Sep 2025 01:39:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7QbVcmVO7aZqm/k5QXoWRXC9zn0nVpx+dXw+04HHeABOWQ0WWeFhtm+A8ZDuAd6zzUqgtWw==
X-Received: by 2002:a17:90b:4a92:b0:32b:87ef:5faa with SMTP id
 98e67ed59e1d1-32d43f91aadmr7805263a91.4.1757407177787; 
 Tue, 09 Sep 2025 01:39:37 -0700 (PDT)
Received: from [10.133.33.137] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3276f57b227sm39403466a91.6.2025.09.09.01.39.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Sep 2025 01:39:37 -0700 (PDT)
Message-ID: <c4eeb8a8-2819-4ac5-8dc1-cce209d7cbc4@oss.qualcomm.com>
Date: Tue, 9 Sep 2025 16:39:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/14] dt-bindings: display/msm: dp-controller: Add
 sm6150
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-1-a43bd25ec39c@oss.qualcomm.com>
 <xurpc3mk5kksx7lfpsdqgasov5gc4dpsmz6iv2hjhsp5tewbue@dvrupbjzgxle>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <xurpc3mk5kksx7lfpsdqgasov5gc4dpsmz6iv2hjhsp5tewbue@dvrupbjzgxle>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: EfjSd5CDVG4LGfk-RAPQLCx3k8DHPBS5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX+06+CFjh57Q0
 jFNVQdEIPEk2MdptGswa2DkGL+VA4e2eudGRc8hpdOQACIS8P0T217DBtpZCMFERCBmbDRpXKnj
 GZkrzxxDqhV4sqBtj9vSqyvJpvWHrbR9I8bHIleF1VK2AgUimc40oTsJV+BrsRo2/NZn/DUbrR4
 tn5ZVR1pacR+jr4pks0X3M95QVdQsQD2WbwaUj/1YaXNw/0k8fbo6hFSbPXMvi5VFK1vYQUaaL6
 zDe9lAZmKUgvnL2DsApkjePzlXo65GpF296sNQUuyhQeM9KOurG8C2VehExa04qgovW6LBg0Ygi
 /c56aZj/8d7dvoIcJ26DvvbDMIRREZmEqlCKN3cbug1zNqn2diOs4ldFo6KG8cNhleMCkfz5qWA
 k2ZLcGdj
X-Proofpoint-GUID: EfjSd5CDVG4LGfk-RAPQLCx3k8DHPBS5
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68bfe7cb cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=tCOpKogST-nIjDDcSvwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/4/2025 8:34 AM, Dmitry Baryshkov wrote:
> On Wed, Aug 20, 2025 at 05:34:43PM +0800, Xiangxu Yin wrote:
>> Add DisplayPort controller for Qualcomm SM6150 SoC.
>> While SM6150 currently shares the same configuration as SC7180,
>> its hardware capabilities differ. Explicitly listing it ensures clarity
>> and avoids potential issues if SC7180 support evolves in the future.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> index 9923b065323bbab99de5079b674a0317f3074373..996d0132e084d401db85014a1a4e445d00d62ed8 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> @@ -27,6 +27,7 @@ properties:
>>            - qcom,sc8280xp-dp
>>            - qcom,sc8280xp-edp
>>            - qcom,sdm845-dp
>> +          - qcom,sm6150-dp
> The DP MST bindings were A-b'ed and R-b'ed by Rob, so I picked them up
> into msm-next-lumag. Please rebase your patchset on top of it and
> resend. At this point I'm interested in DP bindings and DP driver
> patches, the PHY part can come up separately.
>
> As for the compatibilities, I think DP on SM6150 should be compatible
> with either DP on SDM845 or DP on SM8350. Please choose one which suits
> better.


Sure, I’ll split out the DP binding and controller compatible parts into a 
separate patch series.

SDM845 seems not support wide_bus, while SM8350 looks closer to SM6150.
But I noticed SM8350 is still configured as SC7180 under dp_display in
msm-next-lumag’s top, so this change will mainly about the binding, right?


>>            - qcom,sm8350-dp
>>            - qcom,sm8650-dp
>>        - items:
>>
>> -- 
>> 2.34.1
>>
