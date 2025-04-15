Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F30ACA89895
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 11:49:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0BDC10E6B6;
	Tue, 15 Apr 2025 09:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HR2rNzqq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A5E10E0D8
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:49:45 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tHL6013140
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:49:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KOIM5yPpo9MViTBKkLNoXdzuS8SDS+QNfkUos1BVNLM=; b=HR2rNzqqCQRNtosu
 jEyA4Dwg+NNBmGGuCP+gFkw6Sr3hJ7PnCrYM15v3TrbbxWlWj2G+WYbGAcbRFd42
 kapFPavs0vYmmIcTTg69pEtU9PzAapxIIsqm6A2GTa5Qt8IQCqN69eMogWNqoRby
 Rqa8IGGo0sz52m3mMvnBsonowiawCWbZynuGm68L/Ku0+HaiLdcwvMXdVlyXNJxq
 P/Jnh2niB/eBa1v4GseskiAOZsVQDwVDnssPhA3Se7nCxGTOHVYJS+1EYoMTNKWl
 M1h7HIMsbL+w54teqwkwUXKGRIWwUkNxzCCcGhNojgUsAPKqumjKdjNrvLo+E1du
 44q52g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6fj1k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:49:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5c82c6d72so967342285a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 02:49:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744710584; x=1745315384;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KOIM5yPpo9MViTBKkLNoXdzuS8SDS+QNfkUos1BVNLM=;
 b=Oxw0aaExmopCRSrpMKA5UY88mFqAT3EGw0zO2mj/aW+7+HWPDiInmLGesSZW70JF5L
 aAHUCLWcsQqV5Ly3ZObQJP91+bQZSqBctFb13k16WBkEbGArxZg29FdcPgoTZdhotQvn
 jegkr/L66Xs8TSaFbOdmvbRtnxRNe1zxFOHKY+4Y423R+UMCVtBp0tXFANUR+gtSCOPR
 5tiCQXO2PIreQIJ7dHF+4I12yNogTDdFGbxjJazZrnXi9Z3jD/5TV1NCr0HohJGnBcEn
 s5ijm63Y10pqpYg2N6SfTcIdpjcWcZpHgin6wEpyHKkDcfpNB4YqaUU/MJc9zQMfxQEj
 Iw9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoFVPtIGoz8zKp4xNaNxWrqM6qsFT6XY7rvLBJ8Kq2onIzITsUL42OhDSxaR+baMlFqXH3cfZcKUw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxo1o+chH6Yf3qcXCazH+wq6hUr5sg2kBDyXQ/k1PwuhHW3lFW1
 X9+qFAHvS+mbftz587ReLp+Hhk20Eil8zmduLGCve/Y/6Dn791kwr8+BM7roQLHnWjpT5tH9NW9
 9XbRNAqe3NH3/sWeA2PKze1z24UkPu2YdbdS5PCwEgYKgO+tEENQc57ObX8SzejwM4b8=
X-Gm-Gg: ASbGncsg7Asv0mOX9PjXnfVS+fzNsQQa9AreX9kySp3yUn5gaXowbOzIgWUEHJTlPEm
 VtBFWLNNqNQvUcNMGOYiJ0+jL9IX1bhnvnF42+02QNnenO3huqvBY6DsSv51xry0zuLMmJoSECE
 3jZF1pWctzbTFXnAB2dfwZjhOmqUvVstUn6Wb0pmY0Ogkvj7la0lrMKkOvlYKQCTOOIqKqepxmr
 UbtyA7aI4I69vhL5GiOl5BZ6PLY8oydGdb6lB2Xt/X1V9XppgWJI0NEGnClo0RvdAcnHDJVzvTL
 w3hmA/ZkwnJdvUQU0j9JmTB9bg21GZ1iHit80dF5gLtrtWtSQsakncthY7hIeoLigXeBQxw+/W3
 6hQr60nsjSrV0iiliKmynw1W3S8U34eOdyI6n3YewKrEqowJJ2WqHmuvWlbtm
X-Received: by 2002:a05:620a:424c:b0:7c5:5909:18d8 with SMTP id
 af79cd13be357-7c7af0d3d1emr1773054785a.14.1744710583707; 
 Tue, 15 Apr 2025 02:49:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoHRiOt8l67E2P0R7QBa24QR77cwJMkGHiQzo6vMvNgAnJNTeO3hOBWB7ssd17odFt1mGM6Q==
X-Received: by 2002:a05:620a:424c:b0:7c5:5909:18d8 with SMTP id
 af79cd13be357-7c7af0d3d1emr1773051985a.14.1744710583367; 
 Tue, 15 Apr 2025 02:49:43 -0700 (PDT)
Received: from ?IPV6:2001:14bb:aa:77bc:64e0:30e4:f6ff:5bd?
 (2001-14bb-aa-77bc-64e0-30e4-f6ff-5bd.rev.dnainternet.fi.
 [2001:14bb:aa:77bc:64e0:30e4:f6ff:5bd])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f46623c2bsm20611601fa.111.2025.04.15.02.49.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 02:49:42 -0700 (PDT)
Message-ID: <10e8c3dc-fbeb-42e1-b810-d80e768ecf6b@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:49:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/10] arm64: dts: qcom: sar2130p: add display nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20250415-sar2130p-display-v3-0-62314b1c9023@oss.qualcomm.com>
 <20250415-sar2130p-display-v3-10-62314b1c9023@oss.qualcomm.com>
 <96e38ebb-5847-485a-8bf6-50e7b10ce572@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <96e38ebb-5847-485a-8bf6-50e7b10ce572@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jMcrmHlZXdgOn5_1iReTlZk_bw_jD3XT
X-Proofpoint-GUID: jMcrmHlZXdgOn5_1iReTlZk_bw_jD3XT
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67fe2bb9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=01dcSNK4EstfxtfeDswA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150068
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

On 15/04/2025 12:44, Konrad Dybcio wrote:
> On 4/15/25 11:39 AM, Dmitry Baryshkov wrote:
>> From: Dmitry Baryshkov <lumag@kernel.org>
>>
>> Add display controller, two DSI hosts, two DSI PHYs and a single DP
>> controller. Link DP to the QMP Combo PHY.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ACTIVE_ONLY
>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
>> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>> +					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
>> +			interconnect-names = "mdp0-mem", "cpu-cfg";
> 
> The first path should be always on, so that if CPUSS collapses,
> the display may stay on

Ack, I'll fix that and send the next iteration tonight.

> 
> other than that
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad


-- 
With best wishes
Dmitry
