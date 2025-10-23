Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B864CBFF32B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 06:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8460710E86F;
	Thu, 23 Oct 2025 04:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iQ+U1uLq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94AED10E86D
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 04:59:18 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MKM7K9020536
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 04:59:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XQsBupsL/ZgYfSlapLK2m++RVhSfbnhRHhab9RRBi8E=; b=iQ+U1uLqYOp4Bu3s
 lJccRpzeSSbEFGG6YjQMr+6EpMj1ndegmHpI0LwFtUrfekBMj67QnC2Cxrx6Sf5P
 Zwcdh3t9u0VSQOtJ4m2X3uaRSJNTnUdITfFio2yrsFmgwpuIIxHzpaAED/sb33+V
 ehSlkH/g5RYfprMSNWkz9ay2vH4j5TjY52+2AISQgpZMeYrl1hP8HBgXcwNVKTuc
 yycoCkoYUJrYy78SBFaif0NsAfEJlcDE4XiqXugLxcigqX9iuD74uGbZauoW6GfY
 zVzQ3hDCWx7Pm1RFQxS+PfycskCOtZViHPHI/b915dJVrWtY9mJ9FyR/sIFtIZ/a
 Ry5Qbg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y67qh17u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 04:59:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-290950e7b1bso834845ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 21:59:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761195557; x=1761800357;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=XQsBupsL/ZgYfSlapLK2m++RVhSfbnhRHhab9RRBi8E=;
 b=URs63HDEaBtlRwsop5EjxZGIjZa20NtWmhhc4i8q5kjYDNxn/dSPUg2hls04g5Zk6P
 IU32FHd9ZhdP0ydo3r6AhHDlJD6/KSOuNCCiXcIDpQ8YZc53feaYzU7/V/MHYAsWTm3T
 0HeR1BOgdWBKaRRe9Kyf0I8BB8RjposkkA+mGf6xyeO+LQhRrPZZim3wxltSYQtD8KUm
 dKL1vMRgnMlw/GvFlqWPouf6rimeZTlopm9HhNgKhoPXZEWMLBPpIrzGQZ/zzh28XxyF
 YUwg1/MKUN4Qmm7LEtwXA86gjsoIjYUDoD3wCxPOfP8opU2PRqpRsDZpfecDNbkGdWKZ
 jyYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXE/iNTZ/NPQwcYVaK9k4zArZ1Os4Gji4RRXM0U019uKM50byfk5ai6bhEUnNMnojMPFwdhCH9KVIc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtzYdakvROYYnXe/Tk3neRdUTuejvOBo/9YGV4kBXAgcrPLzAJ
 /O7T4sCa3ikbb28w5nltOvL+YW857WOrZ+dYMLg/zPcKMVb1RzuLjtchwvAroLpDu4asUzfrn0D
 0cB7OOnlFu9CIVRxJcl8pAQn/ZTNVsqpeUWgoOd9T/TPz08ZJ/Ib2V5OGhPZnOHkSnxQf5MM86C
 0Bp70mhQ==
X-Gm-Gg: ASbGncuOsDsA6cbyKWbRvGVQA1OEjh8PlZatUrFQdFCbQz+RzPqYZFL66dgjiM7DAg9
 TtSnle2roaX/t/mFPk/rEYj3r5y3KXYaifsjVrQFqFfZAEggUrs1CXegw1TXL1/HmjNKe0ZLPaV
 JzYMQQIPS5Ayd7SFXvNQyvDGho35pHKh8exrLaUa9By7bzdulecvtfdgvD/n95vF7t7+JmF1Onm
 CdnTEpBNsBPjPAZADKJbxqGtOfQR9RoycYsTryHML/A6VtEvFSiqjgu080ra77aSXEeTbSUzz3U
 nrfmFRH6L2KWwZBL5CLmbTGhKzALJTp/rBLw6BTiWD9h7llpt2ZJN9CusIAJnCut/MaltbsjlM6
 iE/RQp+nYm8YyWQePw+bUtfQhYxMRgXyEFVHz8YneGBCZcLta1hFV4CPAp43CKlKxL++mEQ==
X-Received: by 2002:a17:903:907:b0:26c:3c15:f780 with SMTP id
 d9443c01a7336-292d3fcc93amr66496715ad.8.1761195556922; 
 Wed, 22 Oct 2025 21:59:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUEUehRXXgzmp6ooEZeaoA5HTI7QxvGAGO0q2zfheB5V5ozk+j8iZVJGdKIenvQrC3QbtL8w==
X-Received: by 2002:a17:903:907:b0:26c:3c15:f780 with SMTP id
 d9443c01a7336-292d3fcc93amr66496355ad.8.1761195556486; 
 Wed, 22 Oct 2025 21:59:16 -0700 (PDT)
Received: from [10.133.33.163] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2946e0f4283sm9389085ad.85.2025.10.22.21.59.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 21:59:16 -0700 (PDT)
Message-ID: <3050390c-3407-457f-b62c-7adee759a61f@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 12:59:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: Add DisplayPort and QMP USB3DP
 PHY for SM6150
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251021-add-displayport-support-to-qcs615-devicetree-v5-0-92f0f3bf469f@oss.qualcomm.com>
 <20251021-add-displayport-support-to-qcs615-devicetree-v5-2-92f0f3bf469f@oss.qualcomm.com>
 <59592a3d-447a-4c99-8654-d3cb9b9f9a58@oss.qualcomm.com>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <59592a3d-447a-4c99-8654-d3cb9b9f9a58@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2OCBTYWx0ZWRfXzLrigFCH7yZc
 ZQ8U74BgsoaCzYlo0zaDXX5ToAL+EIgCDZMg1pmla4DjMRr+f/7320686oTTEwwn1BnbM9b76GM
 11pyTdZZVoSEkb1Pp1+3bYY3Ofj82dVRLhk8JrrWoNf5RTP0OD8npXia+XD6kMkH6bTaJf15gXv
 YcIHKzXYR8F4zEJ1+pIdTP9MBkY8Mhxf4o4LeDd0n1Faci0yxlosNl7u/E5IGc0Ue9dCpcib3eH
 iF8t2whj243qgaczMNFIKyVknjgnAj68hFB5tI8g+z7vaTxfz74mpwAq2mEFM7mhMCToAw/X3rM
 a1vjIGr4NHjPJaqSh4qrZH+6t1phor7xPsO8K9jLd2nVwew1Ls8yIQQow1BSARPl0uZRorL7VOB
 lHvaQ/DY8DrYoDx20QMQydS4q47MFw==
X-Authority-Analysis: v=2.4 cv=LMRrgZW9 c=1 sm=1 tr=0 ts=68f9b626 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Y0hPKdM277UiO7HlCU4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: xyeFZSJtTxlj15FHws8ntlfff6P52UWa
X-Proofpoint-ORIG-GUID: xyeFZSJtTxlj15FHws8ntlfff6P52UWa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220168
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


On 10/22/2025 10:53 PM, Konrad Dybcio wrote:
> On 10/21/25 5:18 AM, Xiangxu Yin via B4 Relay wrote:
>> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>
>> Introduce DisplayPort controller node and associated QMP USB3-DP PHY
>> for SM6150 SoC. Add data-lanes property to the DP endpoint and update
>> clock assignments for proper DP integration.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
> [...]
>
>> +				ports {
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +
>> +					port@0 {
>> +						reg = <0>;
>> +						mdss_dp0_in: endpoint {
>> +							remote-endpoint = <&dpu_intf0_out>;
>> +						};
>> +					};
>> +
>> +					port@1 {
>> +						reg = <1>;
>> +						mdss_dp0_out: endpoint {
> Ideally there should be a \n between the last property and
> the following subnode


Ok, will update.


> other than that
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad
