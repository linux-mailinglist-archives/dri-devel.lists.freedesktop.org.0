Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D4EB8EDB1
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 05:23:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF2910E39B;
	Mon, 22 Sep 2025 03:23:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="G/U6xiNz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99C610E39B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 03:23:50 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58LNQ8GN023579
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 03:23:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QNOuyexfI1zurDE81bZpL3amoeTGP01KN4jEw4M/iDE=; b=G/U6xiNzV2UvfuHY
 w9UYJxdZAPN0SctDzMP7+/Sd8DUwyT9kgq1KRYZnwWLhNELJQRR47/OlUsYWQR/n
 ihVWLh9PRHCmsn4hHg3GZ8wrVebIlGc6XS+ybPfwfiKgQyKvc6yaxk2jR1FDAZup
 J6uRA5DDCdtqnOjqrvHjuT++/mg/ohNwgBVDYqeEyxNaCv4o3beQO62JQRvO/Ni4
 2ZNyhu8jnRIc0E5ZCuZ8OqpibzOKhSlKoHUwjQPqY+AxYRgeyLS5VclAw+iuYt/f
 BY1OvTAJZxNWn28UruCdaz/cZV3TmIyAeHvJFrW4GYGOObmCMhoXxbJ/qqpDpXK2
 3i+w1g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kkhk91d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 03:23:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-26b7fc4b7e3so7757115ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Sep 2025 20:23:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758511428; x=1759116228;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QNOuyexfI1zurDE81bZpL3amoeTGP01KN4jEw4M/iDE=;
 b=psmD520LpTmtefrNn75kOrBFhfWqW4sUigEIpOCEzWX5BvAPNmqC4q1lyveV/5ue2n
 ZwVEzrbQZuAIqsZrdRjgTMUApNkINb/hquP4SZRS8Hnmeys/xc71lQayhOc/aAdJVeR0
 grnNezz9ZajVJjLbojNnROmB3nzLUHJ0fUsXVO/E1lVlv/rWCrAMdxBHMp9YWmVe9ysP
 XJOaPjVEmu5i5FmJA503awdgzH9pYvRT+4dbN0epqpT+v53pqDmEfIKkH/eYXOhVc53O
 AiCnTvG6575Ymym9wSbYy61SZi/IK4s+bfW5DmQMSVhOckj3ZAkNUqVJoU3E89HMPg+Z
 j1jA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4WiTidVC+9b0sMfbMfivqanhhy4HFdA0zjtotlaZSHkUHcGWCLdCeb0IXWeg7qy2BdzC5VGTbKFg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9TfOfn96CUzUskzPYeRj+HiGMDme73gBPxHQie6VvzCybEr7g
 WpHfCBQnLnzwOgU4cRvNdXGE6Ukw1z/SY0Bm7GeFk5suwZFnmHh8rX13F4Yn0Yx68JnV98PcfiU
 HXMhDVOG8EadB3OI0pFCp1cW7U6ka59kTtYqBCbDwL/TOE64QC06bTQ4CI6AIkwcJN02v//w=
X-Gm-Gg: ASbGnctuc5/hRFXtu8z1ETb4spB5JOBcIHT0xsJNf1SuvJeHDnCS3Terzb8sbmUDiRu
 MEJD6FZDKSlRWNtBycnV7kWs42yRCXJPFE2nQpAL33fHNT/tzmPwfx5Tsc2137EoYJVYqzh2CVp
 u5DnRkgJcty504gtwk1BFj9dAAolkIkqveoOW5pTAjsLPxSTtf/NxA63uqTtcUVpKkybjuu7Qbb
 rQpZgYunlhzOaUu+cRDYY3z19FOI9KdW/hoHhnkqpSVzfcjTR9FFmJ2TG8DDIzdQ3jnfxFzKaS0
 EhDJ8sLK8cViLb81Ww1UiKL0FO6HDTMG3Jh4H8EZS5K2lpoaj1heGGEXxsodiLRrcBJ1SYq1yDJ
 /T5LUadI2PzhiRuf5sYRSJGNlNYp+XZUuNg==
X-Received: by 2002:a17:903:22c8:b0:26b:992f:d872 with SMTP id
 d9443c01a7336-26b992fe5aamr70458385ad.3.1758511428470; 
 Sun, 21 Sep 2025 20:23:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZqyYB8DrXuJB2KI3l1495xieQN/jAycrK65rdpR541CtvuXZ3P/PsTk/gjpllb2oItS0VQg==
X-Received: by 2002:a17:903:22c8:b0:26b:992f:d872 with SMTP id
 d9443c01a7336-26b992fe5aamr70458015ad.3.1758511427930; 
 Sun, 21 Sep 2025 20:23:47 -0700 (PDT)
Received: from [10.133.33.87] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-269802df446sm117628455ad.68.2025.09.21.20.23.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Sep 2025 20:23:47 -0700 (PDT)
Message-ID: <b8d2c97b-2b23-4866-8d20-c20868e878e3@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 11:23:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/14] drm/msm/dp: Add support for lane mapping
 configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-14-eae6681f4002@oss.qualcomm.com>
 <j7ooyi5vih6ofnjigdgj6uk3ycutugunpm5pu5zf55pu5ua6r2@agg73zakjicn>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <j7ooyi5vih6ofnjigdgj6uk3ycutugunpm5pu5zf55pu5ua6r2@agg73zakjicn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: APs66YDNNoDzVr4dSsie6YdjQ5mFjaJO
X-Proofpoint-GUID: APs66YDNNoDzVr4dSsie6YdjQ5mFjaJO
X-Authority-Analysis: v=2.4 cv=JMo7s9Kb c=1 sm=1 tr=0 ts=68d0c145 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=z90s4CAT84tkWkAwxOgA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyMiBTYWx0ZWRfX+9cqLimr/99V
 HWXljj/BOQVNOD+L75KfE/3OspuTAgfk75wP1iizGHV1JwRbJNqPAxmaQwjKRc2PpqjqJBXRXDt
 GhqaLhcR6Qk/KJRh1fdn3Z7i6tfG5UDb1d4elSEXyTr/HA7d0zDXyf+wZcvm500nXUzctqCpm4m
 nhDcSGsSrIqQbPp2AXhRR56wZ0ig8NXcIlc0o0lI3w1alkWamEe92FJSAkj6k0XqNjq75Tz536G
 d1RYvMMQ7PU8oUWgSfOoY9skzcsDtpNmdtQKlb6aYs09OSpUGA0vJmOmXQ0WaErgTRsm5UDQNoe
 WJ1bB4LqWhSiVtBFa8vmkGjjbCo/ZiJn3ow2ha/4dA8HYbbHT6TLnGdWZxBjkFeb/Q/0S/S/BDt
 7XHRfoCA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-21_10,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200022
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


On 9/20/2025 2:35 AM, Dmitry Baryshkov wrote:
> On Fri, Sep 19, 2025 at 10:24:31PM +0800, Xiangxu Yin wrote:
>> QCS615 platform requires non-default logical-to-physical lane mapping due
>> to its unique hardware routing. Unlike the standard mapping sequence
>> <0 1 2 3>, QCS615 uses <3 2 0 1>, which necessitates explicit
>> configuration via the data-lanes property in the device tree. This ensures
>> correct signal routing between the DP controller and PHY.
>>
>> For partial definitions, fill remaining lanes with unused physical lanes
>> in ascending order.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 10 +++----
>>  drivers/gpu/drm/msm/dp/dp_link.c | 60 ++++++++++++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/msm/dp/dp_link.h |  1 +
>>  3 files changed, 66 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
>> index 2aeb3ecf76fab2ee6a9512b785ca5dceebfc3964..34a91e194a124ef5372f13352f7b3513aa88da2a 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_link.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
>> @@ -1236,6 +1236,61 @@ static u32 msm_dp_link_link_frequencies(struct device_node *of_node)
>>  	return frequency;
>>  }
>>  
>> +/*
>> + * Always populate msm_dp_link->lane_map with 4 lanes.
>> + * - Use DTS "data-lanes" if present; otherwise fall back to default mapping.
>> + * - For partial definitions, fill remaining entries with unused lanes in
>> + *   ascending order.
>> + */
>> +static int msm_dp_link_lane_map(struct device *dev, struct msm_dp_link *msm_dp_link)
>> +{
>> +	struct device_node *of_node = dev->of_node;
>> +	struct device_node *endpoint;
>> +	int cnt = msm_dp_link->max_dp_lanes;
>> +	u32 tmp[DP_MAX_NUM_DP_LANES];
>> +	u32 map[DP_MAX_NUM_DP_LANES] = {0, 1, 2, 3}; /* default 1:1 mapping */
>> +	bool used[DP_MAX_NUM_DP_LANES] = {false};
>> +	int i, j = 0, ret = -EINVAL;
>> +
>> +	endpoint = of_graph_get_endpoint_by_regs(of_node, 1, -1);
>> +	if (endpoint) {
>> +		ret = of_property_read_u32_array(endpoint, "data-lanes", tmp, cnt);
>> +		if (ret)
>> +			dev_dbg(dev, "endpoint data-lanes read failed (ret=%d)\n", ret);
>> +	}
>> +
>> +	if (ret) {
>> +		ret = of_property_read_u32_array(of_node, "data-lanes", tmp, cnt);
>> +		if (ret) {
>> +			dev_info(dev, "data-lanes not defined, set to default\n");
>> +			goto out;
>> +		}
>> +	}
>> +
>> +	for (i = 0; i < cnt; i++) {
>> +		if (tmp[i] >= DP_MAX_NUM_DP_LANES) {
>> +			dev_err(dev, "data-lanes[%d]=%u out of range\n", i, tmp[i]);
>> +			return -EINVAL;
>> +		}
>> +		used[tmp[i]] = true;
>> +		map[i] = tmp[i];
>> +	}
>> +
>> +	/* Fill the remaining entries with unused physical lanes (ascending) */
>> +	for (i = cnt; i < DP_MAX_NUM_DP_LANES && j < DP_MAX_NUM_DP_LANES; j++) {
> Nit: i = cnt, j = 0; Don't init loop variables at the top of the
> function.
>
> Other than that:
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>

Ack.


>> +		if (!used[j])
>> +			map[i++] = j;
>> +	}
>> +
>> +out:
>> +	if (endpoint)
>> +		of_node_put(endpoint);
>> +
>> +	dev_dbg(dev, "data-lanes count %d <%d %d %d %d>\n", cnt, map[0], map[1], map[2], map[3]);
>> +	memcpy(msm_dp_link->lane_map, map, sizeof(map));
>> +	return 0;
>> +}
>> +
>>  static int msm_dp_link_parse_dt(struct device *dev, struct msm_dp_link *msm_dp_link)
>>  {
>>  	struct device_node *of_node = dev->of_node;
