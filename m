Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0782D0878D
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 11:15:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058A910E3BB;
	Fri,  9 Jan 2026 10:15:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CjQU2HeW";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rshj1DGQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6AEA10E885
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 10:15:08 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6099XeZH1048161
 for <dri-devel@lists.freedesktop.org>; Fri, 9 Jan 2026 10:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PrskKRW4Uelq9Mbdgi8O2eVhyYrlJ63nQrd4PplXr84=; b=CjQU2HeWo/Mh8/Sh
 vHHbRJ17dlZW3mjmMItl7GDcTtbsJAinojHKbUtxMXtjWN+l+i56IZo87ASh2p7x
 Zbuj72GIoeeKcnC6iREWCHgQYldsOQpJE/yns7pND7BwVRqxxB74YeAXhAwxhzvg
 OHti7K5mzCuyBaidbsljJVVs513X3WTK67RbbQAALg0tBpQ6Beqk5gA36Dgxy/+h
 CsDLlCghGzMxYrcV1OGy43Sn0xdA47gj1rt5llyfAF/GrKGSQOvrp+/9YZphclBL
 tcWcqCxcoJvEHAoc7d7q2n7l5EDnOwMRwFqMxzqv0PKBTL9eXi51ipX62KBgNvRP
 b60CNw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjy5b84d8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 10:15:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b2fdf3a190so79221585a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 02:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767953707; x=1768558507;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PrskKRW4Uelq9Mbdgi8O2eVhyYrlJ63nQrd4PplXr84=;
 b=Rshj1DGQ6mO4VmmlzlzJvG5OvaOkHzG6L0/ZWqcDpArHqFxX8eH7MMx8PWYzxubQS0
 GUd4RKEHCUHCiMdEPaN9JMCL5TFmTHUkFRTgbkzS3uneq+oEGciSFKTdSWc8Q3Q/sj6X
 1Ah1nOD5qSfyeiAb6sX+gtiEfnp5t3KdRjvLMgUXXLN+y/7AWpFU09Qe/jnU4magJ+tH
 9HH8zREyQCfERLUjdeN9DQ7bq869at+Vclnd4aS/8phYTTrGAv6Q+JgllzX/PJ+44GBc
 MqnLhtCRZW2EfLzw+6VO1ROPHRTo7XVMJ6TsygynQMWlY+6PxKEY8wtw/xZ6eZ70sVNb
 rbyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767953707; x=1768558507;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PrskKRW4Uelq9Mbdgi8O2eVhyYrlJ63nQrd4PplXr84=;
 b=nYZY8dCSUVz20vHP7owK0U7Xz5BJzNIxscn9s32DeqJNbwMtvXczBh/zfthzlxy6bZ
 SWzWfEpq4pKBSvojYDZhBhCEPIfHS3Y1xLbDi+rWdggKDCTNyrOGHYEoSgMjEbWp0lM+
 hs7GfpfmX1xEeemUd9zrDnYnV+sOMLQUwjvzfH6aOS5ox8qAK3adLmAl4rxakMq7Xdv6
 H4SvTEaNzHmyXolSkZSH8f/q7pTame1Pj9y1xQE36UzPca6uIqef3XO5kpUVu1PrQl99
 T/HsbwgY1v41ZO5hfy0U/VpQd+qwe3i+WGl19j2YGnP0S0rEamb8EywW1bJQ7chrGjyA
 c93A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+mBVKNUhnvenWB1K8Cr0WzVhQI2TI7W+m2f0ShzvqRDY9vFw3AZet/PC0hCcMj4BcP9vv14erBwM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQ4B5WDENkagyTwN3FhBRwu6LnzKV1OYczpNxhXCfHrLnry7cd
 +EI7eK4crb0qGkfxsGCAoOcx9BRdba6ryFF36uNru+USuhJjwtWA/7CMnRGnYMP/Lg0apsADvxf
 rkAIYcnp8+VbPULAm2EEpiPNd4wWZisgll1JCtxegGh5hest2CgJAP44m5sV5s0xx9dahnN4=
X-Gm-Gg: AY/fxX4DIY6nSGxQ8wFPDVhULXeXusLJYz4wbRPsFz5a49mndLg8LVuKgeGMN+/fMjb
 Gp/2odntnTrG/foxEan8msvWa7bSgk+qzb89VMLm0+ovVU3kyutW0yFOen5wIuLYLwWw8EHgcId
 7nPHSg3NU/lv9lpiGHz/JyTp/7k67BUKJU7ZO2rzpbct59pGpUrKjS1KmvTZvGrUEz0dazyk+vd
 PiVa+gsC+EHzPeTWtuwJIrgxzD7dlg6lmZ/EBlTMO+Ej7DfSZZe1eXPZWQLeO53UvKpSPdtMIbB
 sIs0v1KcqPAG9AYyypADQXNkINKfzWgD/we0PfNtHb0OwMtd6u/VDyMBhQgL5IMTmRv6b/tUsxX
 f2wrPu0kplO5V2IYF09u7w8RlDK3SHI6Q/6+z0/xaQdrFN1dFnYQy/vOTVq3J8cSIbgw=
X-Received: by 2002:a05:620a:254a:b0:8b2:ec2f:cb3d with SMTP id
 af79cd13be357-8c389458e23mr817189785a.10.1767953707059; 
 Fri, 09 Jan 2026 02:15:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9on5U3y21CcX9YejXMliDvFoINV1is4LvnnTNYcp38uzjMU928ZhdCqbIX4PU5m/DU5Itlg==
X-Received: by 2002:a05:620a:254a:b0:8b2:ec2f:cb3d with SMTP id
 af79cd13be357-8c389458e23mr817186685a.10.1767953706597; 
 Fri, 09 Jan 2026 02:15:06 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a511085sm1057781466b.46.2026.01.09.02.15.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 02:15:05 -0800 (PST)
Message-ID: <701000c2-11c1-4690-8d6e-0ac79572cea5@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 11:15:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Retrieve information about DDR from SMEM
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <6ef89318-5fa4-47f5-8027-04a91656d81e@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6ef89318-5fa4-47f5-8027-04a91656d81e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xufWynGC3iZFyT5ts1DZ4ciFss4XtUVj
X-Authority-Analysis: v=2.4 cv=JP42csKb c=1 sm=1 tr=0 ts=6960d52b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P3zdcL2LA7wxMbYDQFIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA3MyBTYWx0ZWRfX53toAyGGKnDk
 62wCVmQxjVTjgxxTLT0FI/ojDPWEv4a1+RziXb+Sh6kjybwbkoubIMsd67bGO8k2zr+hgTSXDC9
 bahRrGqhv3Kl8pPchLbltCPtFap0nPrfOmqiF25hXDqcLGBGreasPUskyj6fr2fBg/JuNxYMwbM
 SteqeU1V1MbIA+FSBG0KuCaFyYjDMnhxYm1oVjks6/ez++dFFmR8SanM5Fn6A1ECR10CZRQKIAX
 yIEZu2O2FUKklLsHm8U+Otq47WWiKhb5r0oW2M/o6Qy4KAmg99WRtN0929VAPuD9HooR+RrOniH
 Dcj8W90f4ycvdnJ49bGFbKwtVLd4hkLTQNKd3x7N+++N6JBE1sfv4yTYuA1Dv2IEytlifDJ91mx
 kuwSDXm5Whs++eg05KE0ZdGfqTeGxO4U3MPWvINFlLkhHyff6zw2+EFt37+tGyJLQrkPyrQpqj1
 jpVGFEVtW7glAHmpzQg==
X-Proofpoint-GUID: xufWynGC3iZFyT5ts1DZ4ciFss4XtUVj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090073
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

On 1/9/26 9:20 AM, Neil Armstrong wrote:
> Hi,
> 
> On 1/8/26 15:21, Konrad Dybcio wrote:
>> SMEM allows the OS to retrieve information about the DDR memory.
>> Among that information, is a semi-magic value called 'HBB', or Highest
>> Bank address Bit, which multimedia drivers (for hardware like Adreno
>> and MDSS) must retrieve in order to program the IP blocks correctly.
>>
>> This series introduces an API to retrieve that value, uses it in the
>> aforementioned programming sequences and exposes available DDR
>> frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
>> information can be exposed in the future, as needed.
>>
>> Patch 3 should really be merged after 1&2
> 
> 
> While trying it, I got the following warning:
> 
> In function ‘smem_dram_parse_v3_data’,
>     inlined from ‘smem_dram_parse’ at drivers/soc/qcom/smem_dramc.c:380:3:
> drivers/soc/qcom/smem_dramc.c:216:31: warning: iteration 13 invokes undefined behavior [-Waggressive-loop-optimizations]
>   216 |                 if (freq_entry->freq_khz && freq_entry->enabled)
>       |                     ~~~~~~~~~~^~~~~~~~~~
> drivers/soc/qcom/smem_dramc.c:213:27: note: within this loop
>   213 |         for (int i = 0; i < num_freq_entries; i++) {
>       |                         ~~^~~~~~~~~~~~~~~~~~

clang didn't seem to care..

A (really grumpy) solution would be to add:

diff --git a/drivers/soc/qcom/smem_dramc.c b/drivers/soc/qcom/smem_dramc.c
index 017bb894a91b..dc2cd7e13b88 100644
--- a/drivers/soc/qcom/smem_dramc.c
+++ b/drivers/soc/qcom/smem_dramc.c
@@ -78,7 +78,7 @@ struct ddr_freq_table {
 
 /* V3 */
 struct ddr_freq_plan_v3 {
-	struct ddr_freq_table ddr_freq[MAX_DDR_FREQ_NUM_V3]; /* NOTE: some have 14 like v5 */
+	struct ddr_freq_table ddr_freq[MAX_DDR_FREQ_NUM_V3];
 	u8 num_ddr_freqs;
 	phys_addr_t clk_period_address;
 };
@@ -91,6 +91,21 @@ struct ddr_details_v3 {
 	u8 num_channels;
 };
 
+/* Some V3 structs have an additional frequency level */
+struct ddr_freq_plan_v3_14freqs {
+	struct ddr_freq_table ddr_freq[MAX_DDR_FREQ_NUM_V3 + 1];
+	u8 num_ddr_freqs;
+	phys_addr_t clk_period_address;
+};
+
+struct ddr_details_v3_14freqs {
+	u8 manufacturer_id;
+	u8 device_type;
+	struct ddr_part_details ddr_params[MAX_CHAN_NUM];
+	struct ddr_freq_plan_v3_14freqs ddr_freq_tbl;
+	u8 num_channels;
+};
+
 /* V4 */
 struct ddr_details_v4 {
 	u8 manufacturer_id;
@@ -201,16 +216,11 @@ int qcom_smem_dram_get_hbb(void)
 }
 EXPORT_SYMBOL_GPL(qcom_smem_dram_get_hbb);
 
-static void smem_dram_parse_v3_data(struct smem_dram *dram, void *data, bool additional_freq_entry)
+static void smem_dram_parse_v3_data(struct smem_dram *dram, void *data)
 {
-	/* This may be 13 or 14 */
-	int num_freq_entries = MAX_DDR_FREQ_NUM_V3;
 	struct ddr_details_v3 *details = data;
 
-	if (additional_freq_entry)
-		num_freq_entries++;
-
-	for (int i = 0; i < num_freq_entries; i++) {
+	for (int i = 0; i < MAX_DDR_FREQ_NUM_V3; i++) {
 		struct ddr_freq_table *freq_entry = &details->ddr_freq_tbl.ddr_freq[i];
 
 		if (freq_entry->freq_khz && freq_entry->enabled)
@@ -218,6 +228,18 @@ static void smem_dram_parse_v3_data(struct smem_dram *dram, void *data, bool add
 	}
 }
 
+static void smem_dram_parse_v3_14freqs_data(struct smem_dram *dram, void *data)
+{
+	struct ddr_details_v3_14freqs *details = data;
+
+	for (int i = 0; i < MAX_DDR_FREQ_NUM_V3 + 1; i++) {
+		struct ddr_freq_table *freq_entry = &details->ddr_freq_tbl.ddr_freq[i];
+
+	if (freq_entry->freq_khz && freq_entry->enabled)
+		dram->frequencies[dram->num_frequencies++] = 1000 * freq_entry->freq_khz;
+	}
+}
+
 static void smem_dram_parse_v4_data(struct smem_dram *dram, void *data)
 {
 	struct ddr_details_v4 *details = data;
@@ -273,8 +295,7 @@ static int smem_dram_infer_struct_version(size_t size)
 	if (size == sizeof(struct ddr_details_v3))
 		return INFO_V3;
 
-	if (size == sizeof(struct ddr_details_v3)
-		 + sizeof(struct ddr_freq_table))
+	if (size == sizeof(struct ddr_details_v3_14freqs))
 		return INFO_V3_WITH_14_FREQS;
 
 	if (size == sizeof(struct ddr_details_v4))
@@ -374,10 +395,10 @@ struct dentry *smem_dram_parse(struct device *dev)
 
 	switch (ver) {
 	case INFO_V3:
-		smem_dram_parse_v3_data(dram, data, false);
+		smem_dram_parse_v3_data(dram, data);
 		break;
 	case INFO_V3_WITH_14_FREQS:
-		smem_dram_parse_v3_data(dram, data, true);
+		smem_dram_parse_v3_14freqs_data(dram, data);
 		break;
 	case INFO_V4:
 		smem_dram_parse_v4_data(dram, data);

A less grumpy one that I'm not sure would make the compiler happy would be:

diff --git a/drivers/soc/qcom/smem_dramc.c b/drivers/soc/qcom/smem_dramc.c
index 017bb894a91b..3653402fa70c 100644
--- a/drivers/soc/qcom/smem_dramc.c
+++ b/drivers/soc/qcom/smem_dramc.c
@@ -206,15 +206,16 @@ static void smem_dram_parse_v3_data(struct smem_dram *dram, void *data, bool add
 	/* This may be 13 or 14 */
 	int num_freq_entries = MAX_DDR_FREQ_NUM_V3;
 	struct ddr_details_v3 *details = data;
+	struct ddr_freq_table *freq_entry;
 
 	if (additional_freq_entry)
 		num_freq_entries++;
 
-	for (int i = 0; i < num_freq_entries; i++) {
-		struct ddr_freq_table *freq_entry = &details->ddr_freq_tbl.ddr_freq[i];
+	freq_entry = details->ddr_freq_tbl.ddr_freq;
 
+	for (int i = 0; i < num_freq_entries; i++) {
 		if (freq_entry->freq_khz && freq_entry->enabled)
-			dram->frequencies[dram->num_frequencies++] = 1000 * freq_entry->freq_khz;
+			dram->frequencies[dram->num_frequencies++] = 1000 * (freq_entry++)->freq_khz;
 	}
 }
 
WDYT?

Konrad
