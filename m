Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 498D3BD8FE5
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 13:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 548DB10E217;
	Tue, 14 Oct 2025 11:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="f6qqLXBl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2443110E216
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 11:25:55 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87Tse016917
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 11:25:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lB6sFQ3LeiBx00eAv9moG4oCFwLs4x2w8B2DPiD6Hkg=; b=f6qqLXBl9CpFDkBF
 RhNN9adguwXk6DD/nBJfQGSnXfPCr9mfRDJwKmkOhwBzumRbrjFW/5RE2K7PyivO
 dCCidrcSqjxY3vqARhVOCnUz6gX0E/O1L0NECosMXb7rcItIy3dBCoqzVZnsTY1x
 oDMNmidK7J2AsHzNUcwO7Dpx7hA8vRQM8LZ/NgmZKZeJ+xva3z5ZXOAFkeGxlXYg
 5aKCJcyu60uoIOxpkxW7wbWO3f/M53rdEcnNpqQU1HWiprzTtNXPoQ/vuwIwoih7
 h5dPeRLu3xC+u3ZUcO+7XsvFw49cRwhg4p/opOOzrl57jtWWn06MMe+3iBes2Fhr
 RAVNZg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd90abc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 11:25:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-33b52a16294so2861734a91.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 04:25:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760441154; x=1761045954;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lB6sFQ3LeiBx00eAv9moG4oCFwLs4x2w8B2DPiD6Hkg=;
 b=DwRHEnwmDIE/hVryjC+AmuaaakVZOElBTLGEc/oWlmvCyGa/aQiVfmbGkfFdyMd0OY
 UrlfM90ChPcizKUIoz22mDZ5m+g3+b2X36H13c30XS7PF1NHV8qFEURW4uDUrzFHIk9E
 Z7K5yRBanWod8KXvIgrEkGnb7NKZGcTxi+IhPlEty6O8JOEYu+IK1SpiHSfXTQGfhpV5
 4BBBR0ela2JTVkd3G188FhrSdc+/I4ArfMU/FGQ+OgnrHE44dK47xzNCCcnWra3hd5jt
 PIT2emVzBAP86DGRSmhtnLc5F5QWJfXuzSHRc3QO5rFtKirO9XnkudND8l8Rh/2SEJhK
 o8Ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYtxQNTVoKsS87BN6v/wscY9HTgJk9Ac6kaE7i6zWLbVUedP2fSW3YJfzJVTD7aVEMqN4dDb+1Hm0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/O5NGqDDxOsNypkXnoDJz3HaY/7IVvSEdiXj47ZYYsyi9aSPZ
 eq18eCcBjRvVcNDT12YONrTmgG1G+xAoxGlBofA7PPXJ51lieFXYa2rxIgI+/Wp7zcfDmavWsdR
 QOGC2b3WsrupTPfY4X34Oecy9CAU+IQ7856tJ0Yr/hO77F+XVGzi+2JQnMCw+J2NVy5pJFOc=
X-Gm-Gg: ASbGncs/8u8d42HYVDGNnGxsYnMloNIHxfUGluyXB9+V1a2cUYJvdRQIX4bRZTLOOef
 Yq73s50NKfqzHBgZcV5k7p2q+DzF2v8LHvgWDoIjHDyD6AKc/FpQ5fA6MdLU9jG3TvMOcYYbEz5
 IsIQVjqZgSEY9YEyCAKsUtAR3wdPXTtRGFvgLol1hOogd/IRT7HgwAcT8z/399DXJeQ8ghI0EI0
 fSBu4jCtX+qu44A8eDajmpEf/cS/SEIi+LZ6novPWyD5VVNS/qdQPbn+N+VQiiGnj8u2ojtWlta
 WHtE/5U2W/HNBRyQWrPquzp16NsbwyK8FPayF8m9A76qbi+dqIWarorAuXQQa50NqinTlswVLjs
 PwIktUqghvcBTMKuRDcq1Rf3x6vr5dw9/0XY=
X-Received: by 2002:a17:90b:388a:b0:332:3ffe:4be5 with SMTP id
 98e67ed59e1d1-33b513ae791mr16920105a91.7.1760441153628; 
 Tue, 14 Oct 2025 04:25:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlyXxDUchBxkJ8hKzcSdS8zUzwWZdwgzzM7euiuaBwsEcgugKDNWgcZSO4YiCAcVeXe1f/pg==
X-Received: by 2002:a17:90b:388a:b0:332:3ffe:4be5 with SMTP id
 98e67ed59e1d1-33b513ae791mr16920082a91.7.1760441153080; 
 Tue, 14 Oct 2025 04:25:53 -0700 (PDT)
Received: from [10.133.33.159] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b61b11ca9sm15658229a91.24.2025.10.14.04.25.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 04:25:52 -0700 (PDT)
Message-ID: <7277bc17-112b-4fc9-9099-243d216893d8@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 19:25:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Enable DisplayPort on QCS615
 Ride platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
References: <20251014-add-displayport-support-to-qcs615-devicetree-v2-0-1209df74d410@oss.qualcomm.com>
 <20251014-add-displayport-support-to-qcs615-devicetree-v2-3-1209df74d410@oss.qualcomm.com>
 <kxwavurs7ebp5f22gxutvw4thwm24twqpahszhyxsodsikunja@7hl3y65ppqmo>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <kxwavurs7ebp5f22gxutvw4thwm24twqpahszhyxsodsikunja@7hl3y65ppqmo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4-Iqv1FtBwq9SPHThRBZKWSXfr4I2L9M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX6qohafcP3KWN
 ZB/0D+z11OM0Yw4Lj7nzJh6VFMeIyu8wyX7z7bcRI5n5eAyipJeij08b/KXezakyBKiZQ1fKonj
 XWrGZWVucYCk4g03SWt/k8yzf5WM64xdna4n9OTDpJJedwdIeqmCIyZmLOiSZUZQQyXck7La9+c
 lZggsXndLwX9Dn50n19KvO6vifbYjKP6LpZwHcv5ghTxLt+krUiWG2CW7HyLQxmTHFzTx2IzBU8
 mv04CAxJaLwSVptoZXMXWOUHfK6StLBI+jxJNUNxgvA66zrtwbrRHP1T4nXj6mUUkDmUhgl1FO7
 6IoPJ+i0CyDPmokdTpHWEWKt/Ihb8InxWR76w70Vb3UZY/iLCKsunkxg3P3mSdhXRKvZxzjxksg
 lfYPq1cSZEc4SAEiHCEbgANKclMRXQ==
X-Proofpoint-GUID: 4-Iqv1FtBwq9SPHThRBZKWSXfr4I2L9M
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68ee3342 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=lUa4T_ycwPSD0wKDvOsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
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


On 10/14/2025 6:21 PM, Dmitry Baryshkov wrote:
> On Tue, Oct 14, 2025 at 05:42:12PM +0800, Xiangxu Yin via B4 Relay wrote:
>> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>
>> Add DP connector node and configure MDSS DisplayPort controller for
>> QCS615 Ride platform. Include lane mapping and PHY supply settings
>> to support DP output.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 31 +++++++++++++++++++++++++++++++
>>  1 file changed, 31 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> index 9ac1dd3483b56f9d1652f8a38f62d759efa92b6a..0b8bcabdd90a0820b1f9c85e43b78e40eb8a9a38 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> @@ -39,6 +39,20 @@ xo_board_clk: xo-board-clk {
>>  		};
>>  	};
>>  
>> +	dp0-connector {
>> +		compatible = "dp-connector";
>> +		label = "DP0";
>> +		type = "mini";
>> +
>> +		hpd-gpios = <&io_expander 8 GPIO_ACTIVE_HIGH>;
> Not the gpio102/ 103 / 104? Interesting.


Yes, on this platform the DP HPD signal is controlled by the pin controller
on the video-out sub-board, not by the TLMM on the SoC.


>> +
>> +		port {
>> +			dp0_connector_in: endpoint {
>> +				remote-endpoint = <&mdss_dp0_out>;
>> +			};
>> +		};
>> +	};
>> +
>>  	dp-dsi0-connector {
>>  		compatible = "dp-connector";
>>  		label = "DSI0";
>> @@ -423,6 +437,16 @@ &mdss {
>>  	status = "okay";
>>  };
>>  
>> +&mdss_dp0 {
>> +	status = "okay";
>> +};
>> +
>> +&mdss_dp0_out {
>> +	data-lanes = <3 2 0 1>;
> It's not a board peculiarity. All QCS615 / SM6150 devices are affected
> by this twist. Please move this to the SoC DT file.


Ok.


>> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
>> +	remote-endpoint = <&dp0_connector_in>;
>> +};
>> +
>>  &mdss_dsi0 {
>>  	vdda-supply = <&vreg_l11a>;
>>  	status = "okay";
>> @@ -623,6 +647,13 @@ &usb_qmpphy {
>>  	status = "okay";
>>  };
>>  
>> +&usb_qmpphy_2 {
>> +	vdda-phy-supply = <&vreg_l5a>;
>> +	vdda-pll-supply = <&vreg_l12a>;
>> +
>> +	status = "okay";
>> +};
>> +
>>  &usb_1 {
>>  	status = "okay";
>>  };
>>
>> -- 
>> 2.34.1
>>
>>
