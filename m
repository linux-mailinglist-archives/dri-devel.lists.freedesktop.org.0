Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EC1BD6C68
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 01:47:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7EF210E50D;
	Mon, 13 Oct 2025 23:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oV30CA3W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD8810E50D
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 23:47:37 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHD74f005522
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 23:47:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Gyj5HJ4yv1S2RWrMVSLE2H6nL4C87pX8rwu1PhkAGNg=; b=oV30CA3WJhYzNz5+
 Ic8ZhjznW27W9kxGCbIviQM5TkqlXh/8UO0EDNz2IBlPB5QPtgtjkTBbncqVJdAo
 gVEsdcR+rTUIQ7xmZ5NqzNr6pysmSerFNbvtAntY1xu+Z6YgCRjLQ8IuUAE1JHLo
 f8LePcSbfrRxYCNY2j+gTEBhosH0G5lGnBC+Kep84tpm2MJNhHT8q6t9zKwLStTA
 HDEtsTCIPJIeZgtw38i/jch+nkhe6gHvVWXSsUQKazJArwSurW/sfHwUBAku/JxR
 +QzCCUKImU2X0l4olN+YD6hMeJ72a4z2ZFvsHFwcTkaSXl7g2aMzrk0xhrFGBKlg
 YGeQvA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa86j06-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 23:47:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2711a55da20so55702675ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 16:47:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760399255; x=1761004055;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gyj5HJ4yv1S2RWrMVSLE2H6nL4C87pX8rwu1PhkAGNg=;
 b=pECe9zFqX7BEkTLh/iBkTKUcWj319KbDDVzUSUu6OtcJGq8xIf2QypaIblerpkiM+D
 cBe8icC8Iiwd1auZ0mzaCPZV+rQwOkaKVCVqRrbd2WU7dXG3Ni/ymuIUhA6BG78YKPn9
 JeB073cGhDkkGjc0p6XSFkhE+WuM/8EsuyXGD8lTh2URuAb/gdZv8VBp/fIZZnA1oXLY
 spihY8ThWa9o/DnVNqC1sS9TbCakDNCxff0cqhTE+FI+YYt+7S1DnsAZrGlR4s79LMa9
 R9WA2BiVs404t3x6J9u3sS92fLVA7La3uYntnrcPkxLQPVB+tYaA1ae0TCuL5SV9WCxB
 s49w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXJZhwDDJLi9kQHl2RaOULhCHU7Trkgh1GWMTVNxYS9H2kfFMfKD2NEEl2+iPrjiSd+Ahpq4z7D/Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvKUBHB8/UwRb9bNg8PQ1LEKp6e7EbaKURGXczBjPi9gPjx51z
 vRPM8550uCkFH9q0IRcmds5t3meYtBUyOPDh3MT1LmFkG8GzGphyDAnmx9cIxNUKNC6l5CxXny2
 zjgmZFjeoBMt50sKB0ukMqwJni2lvcUiSKsVzH6cGBNstlTf1uA2Th33bJJtRzEwKF3JULxQ=
X-Gm-Gg: ASbGncvwu3PbZZrvX8b0AsfUv3+D/RUtwPNhArnnx+bYRiM78MgCM+H/X2adq3Eftyc
 r0HwAIzqEnDiMIJYRBcMe+Jn2IqjNihLF67m0eCmu/eh86gjJjDrCsQXEYW66F+d9zvjfiq+Px1
 utXCLr1QkPNMdc4csn4koeaoL4iKoUbAQcr+A3QMFb9X1z0LGURmfItDVd7JXhCQLit6e+Ytk4W
 yxQTG8A8077/ov4sOWDC6fAlnEsc8iUwtz2tpIjwsYi8/HRYJf3OsnG37cH+8bqGOGG5V2Dwj+7
 9+yKeyInSLWtA6sjaAtQa+x7IkAlMbPIq2m+GEI6Jjzg+BYGLGiGBWKHRT56nZwYAJz/fUVQjuF
 JQSAOl17j5kPTtrkjijDGHW3RWrc=
X-Received: by 2002:a17:903:8cd:b0:269:8d85:2249 with SMTP id
 d9443c01a7336-29027240d03mr246537885ad.22.1760399254893; 
 Mon, 13 Oct 2025 16:47:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLM60Ogs/QOdUTm5Uk60UE9sWW+1nnygkigf6kjrerhzq1IEU1HOiFeReszYLZ0VnwGmBIgQ==
X-Received: by 2002:a17:903:8cd:b0:269:8d85:2249 with SMTP id
 d9443c01a7336-29027240d03mr246537605ad.22.1760399254377; 
 Mon, 13 Oct 2025 16:47:34 -0700 (PDT)
Received: from [192.168.0.43] (ip68-107-70-201.sd.sd.cox.net. [68.107.70.201])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034e179cesm144182735ad.34.2025.10.13.16.47.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 16:47:34 -0700 (PDT)
Message-ID: <148df7bd-6410-4814-94ef-0880b596f363@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 16:47:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Add xbl_config image entry for AIC200
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 jeff.hugo@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007221528.561242-1-youssef.abdulrahman@oss.qualcomm.com>
 <c3339f06-aaca-490b-997c-8b6b145c93c8@oss.qualcomm.com>
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c3339f06-aaca-490b-997c-8b6b145c93c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _OqGxj-bcFyPKLNOkJvdtXezRB-EPvLb
X-Proofpoint-ORIG-GUID: _OqGxj-bcFyPKLNOkJvdtXezRB-EPvLb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfXzmkhfxeE8AJM
 cqOMchKDvbm6bS9X9kYdxO87y2aiFzUxJi/h2b0Eni6t98fKYfQMGRPzacmMIjRw4+92KklsmN5
 pWMM/aLnKh9D9VNmI4GOOcnG54Av3nIFLiEc1I0DVHCtGR+pI5gB2jAVURlEZLln8uWa677oERg
 tjAEA/mPVs5rxWidwOIQRUCmoEdXZfXKpOdtYQBW6HknuB/qgwV2/tIkBQbzl70PWvq+4bCiThM
 Fe/8Uf3bUOndASSLpQLLk6rBXdDJe+wLigZCZSyzsuLhJo9LXZnaK89DUXw/PU2OX8m+2ZmnTGX
 Q9JNdwSZEcHR08KyCn1h3dFwBxuR+gQyvMzpAdcIKUU866GbokLWkgQDjfZhc4JfgAK3wETmEXk
 vJCuhE75Yu8QZXA1UJ2E1ABLAbd6hg==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68ed8f98 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=5tLIbcgRqjftBxpLK6l6Jw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-fMRNY-8PQATv_ULIEAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_08,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017
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

On 10/8/2025 12:49 AM, Konrad Dybcio wrote:
> On 10/8/25 12:15 AM, Youssef Samir wrote:
>> From: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
>>
>> Update the Sahara image table for the AIC200 to add an entry for xbl_config image at id 38.
>>
>> Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
>> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
>> ---
>>  drivers/accel/qaic/sahara.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
>> index 3ebcc1f7ff58..04e8acb94c04 100644
>> --- a/drivers/accel/qaic/sahara.c
>> +++ b/drivers/accel/qaic/sahara.c
>> @@ -194,6 +194,7 @@ static const char * const aic200_image_table[] = {
>>  	[23] = "qcom/aic200/aop.mbn",
>>  	[32] = "qcom/aic200/tz.mbn",
>>  	[33] = "qcom/aic200/hypvm.mbn",
>> +	[38] = "qcom/aic200/xbl_config.elf",
> 
> This is the third oneliner extending this array you sent within 24h,
> please get the list of required files and update this list once and
> for good
> 
> Konrad

I wish it was that easy during bring-up.

These patches are being upstreamed from our internal branch and thus
reflect the different latencies across the sub-teams to that request.

Nevertheless, this is upstream and these changes should have been
squashed.

Once that happens...

Reviewed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
