Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E104B54C39
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 14:03:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB3B10E1B7;
	Fri, 12 Sep 2025 12:03:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AlvPbLkw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62BA510E1B7
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 12:03:39 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fDrN018539
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 12:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OC306+JLRzCtQu+HZoUMCL3Oa/U1/T4cictyJ1c0fJU=; b=AlvPbLkwvvsKmqNm
 f6Y2S2TTjOVpZGfIGtO8m6/ajO2w8M79nskwbh+1y6U1BmaWpYPIhsEplNPCUy/m
 Y+qYCkgf/yRC0tNSp4uFEinRpX4c7Mna3R0cYelOJx16RnTOAUZV9++6zpfviV0H
 12NNz+qZqZJGrNUzKpdgttXqJIp1TOrxaPCINyMRcNZrLXLTogG2WYJNt1W1i93P
 iRQHAh25vUwksHjRX8E6DR42yQ+eROeGx9kNbYTua3AmD1S/pDcWJvSE7zxCaCSV
 ekNLDJ5cxAfNgmw4fCn9hGw9yVu60KbDODPCM/1VTOcTW5SkiKFs0qUoRDDzJRsJ
 +9D/5w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8akjct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 12:03:38 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b54b25578f8so74747a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 05:03:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757678618; x=1758283418;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OC306+JLRzCtQu+HZoUMCL3Oa/U1/T4cictyJ1c0fJU=;
 b=Czh1tN75FVHKYPsE7sA/dg0uAtMFxHFhFf4tWkN0hi2+WNrlxcoQ6X3UdBkaJ80u1Y
 O1ycmnMQLqY4KWwwuotOGXuoNLkQchqgUnK8KP72XtgFPuEw9UYXNkmWfJRgRjkXcDsT
 8g7/qLzkIgfN0iJK/WvSjV2WRjx4oo/WMJSrOrYF8F2pdC9CI0Ju4/vsoA2yyFpqIkiW
 lCM9u5fmLKmoyteEU3uCKvXd+BbgTVL5GWZKuQbkmg2s7JcOW2HJG/cjAqBA7+gpF6hW
 tHAQPtHmt4n7430XRCLVw4p8ECpD8R9DMDcGYG+Ap7qy6ShiOnnfgrXn7aNNMhG2ucsO
 ihVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvhRFIdwSESbSI7tWhXq0PBo2tZ/xPJ/smc0TfPEoYR8IkXRm30fUaoserisIVa9Qra5J+0B+o6Ww=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+9x05oc3nZxzkD9cb0h1SvgGVdBvrQeJnZ51pJBjV/tGnJX0A
 FKYpphYCvFR1jk6qXa4bT9Q8POAjm52OBVqW2kwNCccO83g/V1jaXwjFQXW4AN9+vOcxZasO/aV
 hhpA0nzBvWB16PMFWuiNqqTqoQN7RduDE06fQYReBNxOS9AJJUQVXa5daX1ZFlL/vCL0ak1g=
X-Gm-Gg: ASbGnctcJ5EROnrNz8T+VGxAK/FrRxoNqWKdegXJ5CkoOnl81kL2NkNuhyxUt2CbeHa
 1VZP2u87ToMubUMJogaJ7kek38FlLsB6OjtTGod4/QgfqbV0hD4rH/jx4lZz4DHP4CRVRIEK7Ce
 m8o2//Ygd0L4aethgC9ymRQ398Si4V8+c7OvNh5LZ9pTEAe2iVi9EBDlhFzZcSIo8t53UgSiY30
 my7oTL9V3FwpDsuhIhhRdPHApqo7WlvMQEjXBI6m3UsQfCfCN7wSVPe79Z5KlXVv5hrzO9FjcYc
 KGSjTkMnxAmV3MPoEyNoqJzXzUpwsi1NbYKFw/zkyEzn1lf9L6PgZy/fKap2yWHYRJdjyEAIknV
 ywRCJN3RXzgCJ14B2ahbIAYuumuBf6w==
X-Received: by 2002:a17:903:1245:b0:248:dd61:46e8 with SMTP id
 d9443c01a7336-25d25a7294bmr16547775ad.5.1757678617841; 
 Fri, 12 Sep 2025 05:03:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0bcpdWZ5JtOcYfmEEQBTJNc9tzJlPspC8jR11YZhBs8DDVX3VE8+HBzzj6SRFPVGJrjwKeg==
X-Received: by 2002:a17:903:1245:b0:248:dd61:46e8 with SMTP id
 d9443c01a7336-25d25a7294bmr16547335ad.5.1757678617295; 
 Fri, 12 Sep 2025 05:03:37 -0700 (PDT)
Received: from [10.133.33.174] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25c3a84957bsm47241905ad.80.2025.09.12.05.03.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Sep 2025 05:03:36 -0700 (PDT)
Message-ID: <70e9d5a3-53b7-4e2a-9a2f-19e3be1e197d@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 20:03:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/13] drm/msm/dp: move link-specific parsing from
 dp_panel to dp_link
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-12-2702bdda14ed@oss.qualcomm.com>
 <4kajb4imv4mvpf4bdzoqfw7f4qoqxsu3ca4pbgsunhxnortfig@kmsqgsj547hi>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <4kajb4imv4mvpf4bdzoqfw7f4qoqxsu3ca4pbgsunhxnortfig@kmsqgsj547hi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c40c1a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=3J_imRUleR0CZ10obY8A:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: djR2zKEbmlB5sNbgWow7SSIOQRH4Fgox
X-Proofpoint-ORIG-GUID: djR2zKEbmlB5sNbgWow7SSIOQRH4Fgox
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX1QYY7oz6YbZT
 cE1HROnQnfkEr89ChywVhJ21M+nC9BHf65AjdchSI+k3+Jf/MUvK5OZp1anESrZn0vDdpB2IkYL
 Ju3BtPknvpsf6xrUVg0mhNy3qKZRGUK8JJO58daAUrRF08zCa3+XFH1banu2ifXC0Twa5iSefN5
 JV62w/x6Y418DT7JAf96P8zpiMMrvpN6qhtW+K3NELHieGsHIsNU18i8VATfDFowXqVorK5h1/T
 NcPCb6FBT57LIKr4KP3asfyiCSwsnULkoeMvcPLkxXAhBM6XV4x6lzv0awvSD9xTb8VXu1m5OTi
 jq+f7DUi+A9X1m5jwy9s687r0AXayz2JLBFV7tiQdUE63xun0K7JS7AGml/8mNUigR95fKZUhWp
 45dTmJgd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039
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


On 9/12/2025 6:39 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 11, 2025 at 10:55:09PM +0800, Xiangxu Yin wrote:
>> Since max_dp_lanes and max_dp_link_rate are link-specific parameters, move
>> their parsing from dp_panel to dp_link for better separation of concerns.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> I thought that you've split all DP patches...
>
>> ---
>>  drivers/gpu/drm/msm/dp/dp_link.c  | 63 +++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/msm/dp/dp_link.h  |  4 ++
>>  drivers/gpu/drm/msm/dp/dp_panel.c | 78 +++++----------------------------------
>>  drivers/gpu/drm/msm/dp/dp_panel.h |  3 --
>>  4 files changed, 76 insertions(+), 72 deletions(-)
>>
>> @@ -1225,9 +1283,14 @@ struct msm_dp_link *msm_dp_link_get(struct device *dev, struct drm_dp_aux *aux)
>>  		return ERR_PTR(-ENOMEM);
>>  
>>  	link->aux   = aux;
>> +	link->dev   = dev;
> It is only used during parsing of DT data. There is no need to store it
> inside the struct.
>
> With that fixed:
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>

Ack.


>>  
>>  	mutex_init(&link->psm_mutex);
>>  	msm_dp_link = &link->msm_dp_link;
>>  
>> +	ret = msm_dp_link_parse_dt(msm_dp_link);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>>  	return msm_dp_link;
>>  }
