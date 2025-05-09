Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC61AB1356
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 14:29:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F09E910E2BD;
	Fri,  9 May 2025 12:29:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="d4YXDI9J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E987C10E971
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 12:29:00 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549BPSH9011293
 for <dri-devel@lists.freedesktop.org>; Fri, 9 May 2025 12:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dzrex/88nnhuYbD7YROGz0GqdTFZd6rHcQ09znuzbo8=; b=d4YXDI9JVT/RdlR1
 GdJC0wS2u069Epw93BWciJUdMIKF3UNJ7Xwwp+e0iyfQJacs+XFNJpL7CH9rJO2j
 oFvLXzNuPJq2ov5je25KP4h2Y/GJS0ZLpSd7jcSq+zh1nOFpSX8113NNCllxYy37
 2Ry3ETq+cJxlP9igVJeqN355DpMucEY0C4iOGvfCKBPS9wmoiLHvPULecANXfHxa
 Om+VQYlM/ZtEyade92RrwGBOqCpgHhwwH4se8hgL8oFQT8VhYhfLQtWkH3nB6zAY
 7BPdecxDiL/ZuFaVNV9b0iyr5HipcNjTqOogpel2QAg/USc/Y3lO4FtjZxZdyLpO
 O9DJeg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp7cq87-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 12:29:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-48f812db91aso5209951cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 05:29:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746793739; x=1747398539;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dzrex/88nnhuYbD7YROGz0GqdTFZd6rHcQ09znuzbo8=;
 b=VlI7EsmsOyIGQXLQ5OjTixXYX/aduoz8CcyeySHDaiji5w7V/baAjKf1fdOiJcYSa6
 /sYSGy5DCEjsjGUip1Yzcu0ue2Jprv8dL5ulXjq+TcApjHILk+zfmtTOk0iSqzOgAb1g
 Ea9w9gaKLofMyhaNgxRoOH+eFti1cUnDmNTSJ0+YN6MiSZR342TFwwnMYR7rEaOmoTPp
 zNAPbPt5dK502IYsEdCu24wUpp+vfDwKdwayytlUQ4Sb5HuV/D6Jwk1ZcduO56i49ohj
 oEoqqJmjQym6LtO2YIESdo6hW6FnIzwxnPM8Uc8X96I5xmnZ7T8JkLZlr7i84M1i0PLZ
 Joow==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuIR2q3OpBX6egoH7yxrIUzlgei5jHe5k88nbyMifCCbBui1nZgzmRwD7oKLDp0W7+Aq+FDYx2SO8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8W9rdlbBaYwMklZ62R0JoI4nf9TLHqttCVViYzwf+Efw95m97
 4jEqvIO0r9+/97a7FnTxyjnorKa6TsPeipnpcewbucjYsgQ8BQckTzCVrIT6oO9FvUysXV7FllS
 vVvE1FR75jRM3u8YxnmIXN73s3hQIr2Xw73bx59HYdNdVCszAcJbojR1wMkqvmsldPJE=
X-Gm-Gg: ASbGncso8OPZoSTPG4Qsr3O/ko3oD9qOt4H3+YeMlblQoPaCP6zlFKAyaCjczdkXcnx
 2JyU6cBcibZ3n1doDucNXNhRv55n0h5YlEA5IpbM5E0E1jTb0mSicfTq5R+80PfTiP7R2nnj9XC
 1J5OraIObDVSorvke69w9gnJV7CYTFt/cL75BpTd8RV/5haST/vVdX521fJTmX+ZoheBftpq8Sg
 GUlukOyK60pnZk0imaxvyAKqPF6wXUUpIIuR4Htg6kF7RXQWoMWNm8HbEwdcNpiqm5JHS4XDPpC
 DYG6FJnOI+dSZnqamOxwC889SUTXeDF9+S8lzS7NoeEVKwp6Ul0RlMXKInYck0BWi+U=
X-Received: by 2002:a05:622a:406:b0:476:63e5:eb93 with SMTP id
 d75a77b69052e-494527627acmr19924231cf.7.1746793738942; 
 Fri, 09 May 2025 05:28:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHh76kBlsHwWwCEVlS+S1ABlxGBvnfq9t4dYT6eIbKcDYDcf8Gdr8WUiN8ExkgtpWuH7XTO8w==
X-Received: by 2002:a05:622a:406:b0:476:63e5:eb93 with SMTP id
 d75a77b69052e-494527627acmr19923881cf.7.1746793738374; 
 Fri, 09 May 2025 05:28:58 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad21947a442sm142986366b.82.2025.05.09.05.28.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 05:28:57 -0700 (PDT)
Message-ID: <17431c94-7215-4e50-acc9-7df97558af16@oss.qualcomm.com>
Date: Fri, 9 May 2025 14:28:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 01/14] soc: qcom: Add UBWC config provider
To: Connor Abbott <cwabbott0@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-1-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7H6FGm0npQnG+M3Jzn9RSL9CYkkDg3rtH+=on4_caPTZQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7H6FGm0npQnG+M3Jzn9RSL9CYkkDg3rtH+=on4_caPTZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEyMSBTYWx0ZWRfXzkWyW3nQv/ne
 B5DlgJIeTMcMiqXI7KbpHioXTrqiyhRd1E2+JN7cvbpEcmPjSnPu7IOdVcpYULu7wSQ+4sN9iaT
 izMRRifLObY5bATJky7Ec+lAwM6xzEZ7JIBLb1S4tiSbUBC6lwC/djCMBfLi8WNL8jWd0TXPJZ/
 fTpn+nuPGmW9kOFu+V8+7JMr04boGxxzyH0fUoNwf0tMMmOGIYm4TdLW/MSZFYgVtrni+Q3HoHK
 M9npbLg/w9+oaRz4DU1Lv4NHIKHabwQC2Ft+cocc4F771V6S37TvE3QECK+akjc4sKF0tti2BW4
 oBWDuRWuMOTXxoOmE0NXx+A7/OMwa54CawQ4bo8JYt3qph0h813s+xSOESyxQI33p5XgR66EezM
 jAzQ6UtMuWcZoiCe2DpjR9Pe3MBf9GuPGMZ3jgdCbZLJsijcXe2a70NeKGPCNZMp/Gtiu7WY
X-Proofpoint-GUID: uEf-BFk4_ItJ-Ub7Cr7ZlCw0zxj9WdWN
X-Authority-Analysis: v=2.4 cv=B/G50PtM c=1 sm=1 tr=0 ts=681df50c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=qJKz7-gl4_nKpslyRI8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: uEf-BFk4_ItJ-Ub7Cr7ZlCw0zxj9WdWN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090121
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

On 5/8/25 10:12 PM, Connor Abbott wrote:
> On Thu, May 8, 2025 at 2:13 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Add a file that will serve as a single source of truth for UBWC
>> configuration data for various multimedia blocks.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---

[...]

>> +struct qcom_ubwc_cfg_data {
>> +       u32 ubwc_enc_version;
>> +       /* Can be read from MDSS_BASE + 0x58 */
>> +       u32 ubwc_dec_version;
>> +       u32 ubwc_swizzle;
>> +       int highest_bank_bit;
>> +       bool ubwc_bank_spread;
>> +       bool macrotile_mode;
>> +       u32 mdss_reg_bus_bw;
> 
> This doesn't really seem relevant to UBWC?

I'll admit I just took it with the rest of properties for a simpler transition.

Generally, we could ma-a-a-aybe just make up a common value and pray it doesn't
break anything, as we're taking numbers that translate to ANYTHING_ABOVE_OFF or
ANYTHING_ABOVE_OFF_PLUS_1 in most cases wrt a cpu-ipblock path.

> 
>> +};
> 
> The comments should be copied over from the Adreno struct. That was
> the main way the meaning of most of these was documented and you're
> deleting it here.

I'll do that.

Konrad
