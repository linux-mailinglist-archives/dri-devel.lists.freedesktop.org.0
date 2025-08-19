Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CB7B2BD1C
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 11:22:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0766910E579;
	Tue, 19 Aug 2025 09:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ICYEgLv3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27F010E57A
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 09:22:29 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90dUF030484
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 09:22:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KczFnqDzEs+8Gb7pivRJCslUzgY2ZS98+cXZUjdh5lA=; b=ICYEgLv3ITBdFBKr
 uvXfh7N/Y4K6UR7I6z0l/LLT8+qtcjGj56uYEbq8KzkijCu/+lZLh5HLBPmJ9YPY
 qgY4FP9o4zHREFtktO1RLFdhWX7WBfdm0VIbngG+uL5HgJx3HzP5LK+ewwd78dRF
 L/31KnStgx/WI18gKdrrPIUoM4KvgRzsmlzbs7Tmnbd1yRR7Re/1opsiIw9SOeLV
 euufvIQBHHwalR1X2pwXX4232jC5kqVJNcYcRaHeJCfWsSRbuuObelSWplReXcYT
 Jt3UPSB/VELqWlYzONXnCJ0zGub0iQCAAOeR7EBXfiZKXAczIgL9ZCg/dkWm1zXU
 70c/YA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48kyunv6nc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 09:22:28 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-76e2e8afd68so4448721b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 02:22:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755595347; x=1756200147;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KczFnqDzEs+8Gb7pivRJCslUzgY2ZS98+cXZUjdh5lA=;
 b=AkJodYV6ZOQaPl5m1q8cMnkYxKlxwV+oVDCn7bimFe/omVNxeLjOY/QnzFqMbqHVwo
 ZRlD+t5aqv00NEketbRga625A/cxm1OUCmBNmQsxarftA73jcF2hoQEiwthRO4Zmp5YQ
 tpAuxXQZnNI5q5NNevefug19UqDtZShpT3BSy0Tn/bTvFL21hn2kuUe6E2IgqwvwUbl5
 iVRDJE0Ei4NDZ8/p1Ene/jSkQzVee6RZ4njIDmXHz88VKPIbNEBB+2E/YoF/5xHjkRR7
 5bCkdeZ4j1+3xJiG8r6N1acuk/WO9Cto005CyR61k8BLuSXg4SxeCjhL+RhS+4ajv6Lx
 XXJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnOjq317ZuHhsFYIQc8EVJGIU+SE/RkUcAaO8cbio4LIy6Sb9DL3Z0EKRDpVzrJUXixgjTwkrqrUc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/qDiRFhg745Bn4rg3K3jAluCKB3Xl0VnyP93DA8hCQ6tzXbGo
 fmC3rXGXoB09zr/Ku+6npxgAcJ8KopGXOvIMe6+Qodu7+QvOgzegn+pNWQ+nGbfEFE6j3E4kgDz
 61Jqs/foNvIThmPQT5hthFKf+eE/evos0x0QQtMgA9MFkQUwIhONDAcuSKzVuWPixkcpx76o=
X-Gm-Gg: ASbGncsE134TZir3yHXuhc5fgo6e4uHyX/O+cRzpIwF6g/6tZx+hTWDiHRVWKesK6mr
 aMsNXk2TYFLyG+MDUf9K8zA6cU8ybY31/u6TMj3Rvi0+Y4QxkiN+dqW5CIRTOYEw3XRCs/HBU0C
 ksBPJpccEg9TGHsH9xcNiVBjnSpvRQBrgJlIwMyWBAjd9EBuS1NJu9nSwN6DujtujdzTOhceykN
 BKbdxMY984jB01MPVO9l7TKi2TubjUMou3qm8WTOyB2ZStRAth0LtSGSEH8qT9hEFLRG1mT8iJq
 a/CVNNqwvfWtm//9ayNdw97vKtSYn3AZk8RyfxNXqzBC1UWFpVSZNWAuKD5h46LayMrbIW6QIMm
 jjddOnOZjcyM6eyp6A/zCD3EFL1kILQ==
X-Received: by 2002:a05:6a00:3e16:b0:76b:cae6:ee8a with SMTP id
 d2e1a72fcca58-76e81102294mr2238157b3a.12.1755595347403; 
 Tue, 19 Aug 2025 02:22:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFphi7ddJrn4OsHLiNEW55tJtpl5xzFPqO7FIxkJjqz5ACjMc6dZTHp/btM76pdxRLSv7Tocw==
X-Received: by 2002:a05:6a00:3e16:b0:76b:cae6:ee8a with SMTP id
 d2e1a72fcca58-76e81102294mr2238112b3a.12.1755595346893; 
 Tue, 19 Aug 2025 02:22:26 -0700 (PDT)
Received: from [10.133.33.87] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e7d524c95sm1906515b3a.81.2025.08.19.02.22.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 02:22:26 -0700 (PDT)
Message-ID: <20e7790e-6a30-4301-aa50-db180ceeb7a8@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 17:22:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/6] drm/msm/dp: Add DisplayPort controller for QCS8300
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
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250819-qcs8300_mdss-v7-0-49775ef134f4@oss.qualcomm.com>
 <20250819-qcs8300_mdss-v7-6-49775ef134f4@oss.qualcomm.com>
 <brculyyu3dgc5nkj2cuzv3jkjzcouljy5o4jwr6mw33r6i7gt7@j6ur7yvwmky5>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <brculyyu3dgc5nkj2cuzv3jkjzcouljy5o4jwr6mw33r6i7gt7@j6ur7yvwmky5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SL3-MiET0U-Qaavx5QXmavXU8RSQdpbC
X-Authority-Analysis: v=2.4 cv=N6UpF39B c=1 sm=1 tr=0 ts=68a44254 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=ZXt-rHCGnEisyK7TIFQA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDA3MSBTYWx0ZWRfX2t81Sx7dlasA
 kyu5MSLsEFBSGEbXHaN5bYC0WOVfwb9CNiqyOFbO4ckIa8XDwhHDVpUAddAyywQkKKqtmTQ09RD
 PPYqrvNgJkZBkOujgHMRVusodlBsV9kyiNTpdHhNaIBiL6YZdUtT/wU0eYEX4h7sfDcBtFEnFkz
 rftgmY6TyJNtocxy4q23pLl+Xt4Ag3YwwKcHCETBHnqWmwhxBB7V67qaL0VK+ltoDM+KD0+ZRSh
 eluIEYKCnYPbTxCdl1xBQ7Z71SMmN3lYLFIJ1RrBOaKG9qVvyBQYoBJE9fZHsqlQWvvT2oozDAS
 s6ST5jc7Dj/HahRKNy7pixMRHwOXKWdrLWPo+eXwnOqJHtjRX3KoWhNg8poeEQrTvd2607v88Sq
 6cOLsr7K
X-Proofpoint-ORIG-GUID: SL3-MiET0U-Qaavx5QXmavXU8RSQdpbC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180071
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



On 2025/8/19 15:59, Dmitry Baryshkov wrote:
> On Tue, Aug 19, 2025 at 11:33:33AM +0800, Yongxing Mou wrote:
>> The Qualcomm QCS8300 platform comes with one DisplayPort controller
>> with same base offset as SM8650. But it requires new compatible string
>> because QCS8300 controller supports 4 MST streams. 4 MST streams will
>> be enabled as part of MST feature support. Currently, using SM8650 as
>> fallback to enable SST on QCS8300.
> 
> Hmm, no, you are not using SM8650 as a fallback. You are using the data
> structure for SM8650 for QCS8300. That's a different thing. It would
> have been using SM8650 as fallback, if you had declared device with two
> compatibles, qcom,qcs8300-dp and qcom,sm8650-dp, and then relied on the
> second entry (only) to provide a match and data.
> 
> Exactly the same comment applies to the UBWC patch.
> 
Got it, thanks, will correct it in next version soon..
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index d87d47cc7ec3eb757ac192c411000bc50b824c59..bb4660585849d1a67921a28e7e12422e0c327ab2 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -187,6 +187,7 @@ static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
>>   };
>>   
>>   static const struct of_device_id msm_dp_dt_match[] = {
>> +	{ .compatible = "qcom,qcs8300-dp", .data = &msm_dp_desc_sm8650 },
>>   	{ .compatible = "qcom,sa8775p-dp", .data = &msm_dp_desc_sa8775p },
>>   	{ .compatible = "qcom,sc7180-dp", .data = &msm_dp_desc_sc7180 },
>>   	{ .compatible = "qcom,sc7280-dp", .data = &msm_dp_desc_sc7280 },
>>
>> -- 
>> 2.34.1
>>
> 

