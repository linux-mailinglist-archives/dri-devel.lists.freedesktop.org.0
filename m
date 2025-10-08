Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD509BC4FA3
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 14:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C18810E398;
	Wed,  8 Oct 2025 12:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FYpw7sr5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975FB10E397
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 12:50:53 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890U3f026718
 for <dri-devel@lists.freedesktop.org>; Wed, 8 Oct 2025 12:50:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HjXA54200/MazhziXIpKEeI9K5n9Bf0pQfwu9EvIxC4=; b=FYpw7sr5rxcDfAem
 UzAZ/lwkxo2ODXO5AvoIyUUBbP5OAwJFOM1WVVHFO6hIXDd2cJaZp2Z7x+hbOXTF
 aBF+Cj6OWwrP+fC73ZljkOYMxTwmzXa1nxTonQK4N4nxl8IQ+U6kuJOISiPAAhCP
 sVYY2rheAg30xW39mxiHfR/b+SZBLU2pEX1Ji/pnVXKL8RpAbzFcQzb+De4U4AL7
 As3sKNXCezKByJ8MaovHjo8mRCRMqDK8aRnyI77oo9t85gwrJnjimzpanMf3K+wK
 NO+dPXdbUahdeXC4ngpTg5OUpWD+OuruBY5X/xSXSGcTx0587E0ioz0hUb7UEwCP
 gZ70kQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49n89hj9x0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 12:50:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4e231785cc3so30504111cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 05:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759927852; x=1760532652;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HjXA54200/MazhziXIpKEeI9K5n9Bf0pQfwu9EvIxC4=;
 b=fKcVsgCLDTSYxzTAElt7J9OCFgvI9wEZiundsE/cZjUjWWC3fir7MZkms/olxX52ov
 yt/dBzlIDdKJWqllE4nciGtzvj80epH6hvW7vKMVoEM80AJuDf+OJkNkYkQ+8806JETO
 5wxZzlMLxgwvvNSoFq6/JJdLcRTCKusS1tV6DM2yRphM0G/tiBoaOZzDthFYXhbaNlXy
 SSfLjLlYf26KF6ZHjp5/a1t54q6QAhfm0yArqveo8vXv4lRdlUmwICcJZMaKbZ5MAOAg
 2AmuCtMMydOWH8aCkootbnwgcX0ZCxffiTWILXVvtYsgMFGjFBQtqfuWaP+wtV7Iir+J
 kQxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUR65hlDh5hHGsVlooC5TcWQu12ZgX5BCqapTuZ7je5WhTcBVBbP9rlm9IB23JAYlxEeZK5gAoOP38=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwR0d2bX69iZ00+8Qye/Af8ZnBcWKMpjSU+bsF9lM/GpqQxxxUO
 AslN0/f+wJeLmJm9Sg+71LiqzM3lfvOHYm61dA7RQJKiACAS7MXInWp3hHzZN9Zl7HGBjWU/1xZ
 tTVKel+Go0cVpfw7TKfdS6ZhrZjX9BSBznz7BkCoy1qsEqSFcXrtkSqpSLwe7BF4+J7JzK4g=
X-Gm-Gg: ASbGncsv5Vpm8cB6Rx96fZzmwfsQQDasVBH8emOH5jIvAorTY6BaDONrZmqCbhxvjcZ
 uhHG+FVulEnN8zqHusc38C/QrtX3vcg/F7g//5n7/XXylmUvY5xQDdSv1gIcagkkQxElhrIcowx
 kBUy4MxyceFnV/xH9P+FuLe4XGT5yRP/kVK3WdaReqeX0/AyWsqGRUejCLidJZfsdLwJOL3zsds
 AJPYh+oiL4/IWLwio35m76tnntKhA9p3uyQC45YL4Zi56fCdlZ3H0aHxWWANPrAdmxtKr/doM+X
 eVfXSdLJIx4jdZyWqjdcP6djK8K9ydgvyTeSq/FrebJcjsQ4IGr52ufbZcB8O6Fn0ta1eqKn8fm
 oTDIsG2uzfZxuHvcIY4PLzszuJzs=
X-Received: by 2002:a05:622a:60c:b0:4d9:ac87:1bdc with SMTP id
 d75a77b69052e-4e6ead0aba7mr29848801cf.6.1759927851723; 
 Wed, 08 Oct 2025 05:50:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGd3wvG1Ynm7djM218qT3jkj11ov7+KlyDnSw0DDL6cJyrMjJ5qDwiZKjNKdh5U87l7RnzuDg==
X-Received: by 2002:a05:622a:60c:b0:4d9:ac87:1bdc with SMTP id
 d75a77b69052e-4e6ead0aba7mr29848301cf.6.1759927851051; 
 Wed, 08 Oct 2025 05:50:51 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4869b4e49esm1648890166b.72.2025.10.08.05.50.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 05:50:50 -0700 (PDT)
Message-ID: <b14ca601-56d8-4ecc-8813-b9b642646a0c@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 14:50:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: lemans: add mdss1 displayPort
 device nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
 marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
 abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
 abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
 simona@ffwll.ch, alex.vinarskis@gmail.com,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_riteshk@quicnic.com, quic_amitsi@quicnic.com
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-3-quic_mkuntuma@quicinc.com>
 <e3400ab5-c4ea-455a-b8ea-d4fba2ece85d@oss.qualcomm.com>
 <6uo2w4lscjlx5mtio2xw3xgyyu6kem6kavtdxtu7cbyix6kews@h2ou2awbppzy>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6uo2w4lscjlx5mtio2xw3xgyyu6kem6kavtdxtu7cbyix6kews@h2ou2awbppzy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDE0NiBTYWx0ZWRfX7VCv9b/BDWQ8
 v0KEnrWk9W00u21FT2cCG4pqAvFFEOtnkIkawElDiV7CyFrcWhQBIW/z4ZviAqbbQwm/zFcSwqY
 qSuLqyrlk8JLzYihI6EP8jkXPjtOUZYTkkH+sWJqvDE1yFSq8qtKgbDyl0z5WY9ZwMZQEWy/UHx
 yjHJXb36+XVR0ZURpFTT6WX77PMKtXGkSUMtbgW3GYtincmtW/Z5LpO2wthGwO+8yTjBdN3yH+h
 qP3VCzx1XBvlw31AbxLGaK/M6yhCvnJQOn66MrlcyT4lLaNJTltYydgyJaKi5/WJuPCJXEpHheg
 lh+gT+Ip0Qa+obuJ1WljMRk7y+Qqp5nYB0GP/ssOAmWtzOC6uAe/Sha3he+Hj10wYNHNe0znEyU
 qabGAjvbpfwr/k7A2ckK44Y7Yfa8RA==
X-Proofpoint-ORIG-GUID: 9NVEJkEe8OoKNc78nh1TtA6ZUlsQnToJ
X-Proofpoint-GUID: 9NVEJkEe8OoKNc78nh1TtA6ZUlsQnToJ
X-Authority-Analysis: v=2.4 cv=cKbtc1eN c=1 sm=1 tr=0 ts=68e65e2d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=Nc9AMxU9nlP_Mo_kQ7EA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510070146
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

On 10/8/25 2:49 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 08, 2025 at 02:40:35PM +0200, Konrad Dybcio wrote:
>> On 9/26/25 10:59 AM, Mani Chandana Ballary Kuntumalla wrote:
>>> Add device tree nodes for the mdss1 DPTX0 and DPTX1 controllers
>>> with their corresponding PHYs.
>>>
>>> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
>>> ---
>>
>> [...]
>>
>>> +			mdss1_dp0: displayport-controller@22154000 {
>>> +				compatible = "qcom,sa8775p-dp";
>>> +
>>> +				reg = <0x0 0x22154000 0x0 0x104>,
>>
>> sz = 0x200
> 
> Hmm, why? I think the memory map specifies these sizes.

Yeah and I went in line with the allocated region size (not last register)

[...]

>>>  		dispcc1: clock-controller@22100000 {
>>> @@ -6872,6 +7115,8 @@ dispcc1: clock-controller@22100000 {
>>>  				 <&rpmhcc RPMH_CXO_CLK>,
>>>  				 <&rpmhcc RPMH_CXO_CLK_A>,
>>>  				 <&sleep_clk>,
>>> +				 <&mdss1_dp0_phy 0>, <&mdss1_dp0_phy 1>,
>>> +				 <&mdss1_dp1_phy 0>, <&mdss1_dp1_phy 1>,
>>>  				 <0>, <0>, <0>, <0>,
>>
>> You need to remove the same amount of zeroes that you added
> 
> Nice catch. Which means that somebody was sending untested patches.

It would work.. until someone tried to add DSI to the second row of zeroes
instead of the first one

Konrad> Nice.
> 
