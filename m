Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBF4D01CD9
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 10:22:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C7E10E6C4;
	Thu,  8 Jan 2026 09:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zr/0udCu";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GteBxSlp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9648510E6C3
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 09:22:38 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6084I0ux2593574
 for <dri-devel@lists.freedesktop.org>; Thu, 8 Jan 2026 09:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 raxQEHkAo5wpTxNFXj2x0R0HctM1cb4gUoaC2aMmpdo=; b=Zr/0udCuTdVjdeaN
 aqzIN+PgSWqcWrssxYyKhYJvB2EuS5UAlwenZHEQxPknppA+07BnnDLms1YbvGor
 +gKF4wRx1lFqRyIQNXJD1rzRWN9cs+UQHNKshFjiERedss0waCsRClHStbnN5uKR
 1QngrrNvX9yy3seieG5fQ8EBu/EARmQ6jkVenbm3vXygOlYGA0KCIkEnQ4tR7akF
 1w4a1+nQOwWtHGchdrGWLj/w/Ix+1+GIR/7dEx0riPYxjb0WrGFzmu7jl6mgTdk/
 JINBnDt4l9/4BEfFMoplvE/JIT5LwEZymbnPXrV+3bKoy1+HuqxWD6G1EhpwfcmT
 2N6RSg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn29448d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 09:22:37 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-88885bc90a2so7490986d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 01:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767864157; x=1768468957;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=raxQEHkAo5wpTxNFXj2x0R0HctM1cb4gUoaC2aMmpdo=;
 b=GteBxSlp1WxVDUcJ5QRTfc2x5CQ3G1EBnmn3fif1trlf1SyJjsjD1lz23MJgBJtFqb
 GXI1eYN9tBOp/loUXqSG8Le6Syn8CgcIhBPiL55m2Y7+GZx3G9qpR4xZeQDYnL1ZtB+h
 IQrrHhF1fbRHkF94VlmkNKtxbOpRP6W8/yZVK1yFiVwhIuUzxX7i6ZH0ONRpRX9Xbs9r
 CkeHmV+ouojBEmNr+QZUU70ZiE2w1ffCvJE/ALMXUWpiy2ofYvBU3QPd1sek4GZDX0er
 uRM+0OcCDkZldiDuh2bknO0SjbTnWufL8rIenTQG2QCycWolttxD7QVF1cjscn3pGoPc
 BBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767864157; x=1768468957;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=raxQEHkAo5wpTxNFXj2x0R0HctM1cb4gUoaC2aMmpdo=;
 b=p9f20SJ22pylc3TyOhiN1dwyqWnkEkU6qaTFH2ifKns7be5u7LCqx5E9QChFUrY5in
 nDcIqgzm/mDY17bvIHHjPRjASLB2O9RpLrGFEp0DF4C87/1sJZj57O9G6GuqqNn0Rlny
 BaQiebGkTDXvB6OMG6eHY961GKIZjwAaQHU75+eOZuj2JKu9CtG2OMavCKpuxBhglvt9
 NuHp0DjGJj0n5I0hwT3ZQOLMepUkWUTXQAQLJbglEL1XQKVoqr2yQQWbjbO8HjywBkDJ
 Q7RhpdkB6RAalS8f7FUONE5+8DsWLMvta6qOZafXu9Wb7svpXixoatvNWPv1x7/E0NoH
 BsQQ==
X-Gm-Message-State: AOJu0Ywdphhhk71IGjNEzcEhzmDkNxN2XLVI6SNutwJ148qTfVSkHso7
 bZaRD/utWLU11GCSwHBXnUn5OUQ5fiTW/sxTM/TRtBE9YHi984tR8up8b8s2116Eavbs248nRIx
 V7510Tat2LQ56FZk1+OKloYaPKJrwLP8VmDbNITqoiM5qKFio2H3ZyvkRukhmxVcx7JoMnVQ=
X-Gm-Gg: AY/fxX62Zk0+xcy7oImJnvlgFctfOA1dznLiVQL4oBESe6SbztqXQ0QLAiQxNEyhCe0
 DLkeOzJlbDToGP26Vu1tDNPeWamin8sed8iZCLu3FfRPUPWshSxHk7sSeAFR1041PJgVMMI24KO
 RZUiwo6lzGeaKuHn/ABglymic+ulyD2O5vskhR2cS4EyPI6CjlbUHkVlfn+e3y242ZC36HIXDsL
 Yyty+rqQsfzRbdoGx4e2Scoqz/zxwJgnJJGNiFqH3uY8QazCZ2lI4Qzj9WUAl4qrLWZNuDCBL+W
 BXKiusRlCoeY9aFWTLPQSkI5GuVMTIdbQ7mY63+AQFuZLlsouNoOLOu36zSSNyjmMnixzPF4vuC
 l+/0lOjEafNnjkXxCcRuA8KM4GvRDA4pFKOaCfoz3vXw+eYxjBV9fzlx0gSsxWHGPN+c=
X-Received: by 2002:ac8:5907:0:b0:4d0:3985:e425 with SMTP id
 d75a77b69052e-4ffb4a256bamr58410751cf.7.1767864156972; 
 Thu, 08 Jan 2026 01:22:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgk+SEzsp6wNWefdP+6JTGQNVInVd34cgE/aXxaCXZgCrNOJott53yL5pFKxHfuIwh/vLdMg==
X-Received: by 2002:ac8:5907:0:b0:4d0:3985:e425 with SMTP id
 d75a77b69052e-4ffb4a256bamr58410441cf.7.1767864156534; 
 Thu, 08 Jan 2026 01:22:36 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a4d3113sm751657566b.43.2026.01.08.01.22.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jan 2026 01:22:35 -0800 (PST)
Message-ID: <e8c37f1d-53d5-43e4-9c8e-be44753aa1e1@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 10:22:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] backlight: qcom-wled: Support ovp values for
 PMI8994
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>,
 Luca Weiss <luca@lucaweiss.eu>, Konrad Dybcio <konradybcio@kernel.org>,
 Eugene Lepshy <fekz115@gmail.com>, Gianluca Boiano <morf3089@gmail.com>,
 Alejandro Tafalla <atafalla@dnyon.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
 <20260108-pmi8950-wled-v2-2-8687f23147d7@mainlining.org>
 <736c8986-7adf-446e-9720-c4a71272825b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <736c8986-7adf-446e-9720-c4a71272825b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: C0xE9CTS4x-mMOs_DazPi1x6eVCAWAHH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA2MiBTYWx0ZWRfX8UnEyfkauNhC
 yyff4okuAXIGVACLzE+9CFHSjbAsa1JI1lmHndzZWeNZ81EUcK2MAxT/OP4At1K4Wv+A5fQdrVw
 qIyQI+c919OZTHZvEpJpPJGTO5Shj9XXN5Hkq+MfUd9+p5gq4djfYHPwEQRNR6UjhEpdRnTSRpJ
 RpmYi/wr07FKj7SQxg9hp8DBEuFcy9Z5uBoVgyWDWJ5DHnuWKHxz5NdPXs0C557Sz9N0ZCfACCH
 6FjUyO7/swMAr6K5Zxx0gVOhufxZmtQczfmC8RZ8Lqa6DBsQFVXCCJPCdKFclmoYZRdZelxwLBO
 6DFZERuhDlWVQTH+imkiTRJKdLPfWDMbUdSPrsHuyzgg0wGWSHg6tvioS7YIVB7v2sn3/IhZOPZ
 S460F8I4QeZJL5wgtw2Eew91YXiEiETg05pKj6F7+ovY+TLF3iyzw6QTshOT1kUyyfmzhnjIuvG
 vNeH1kgyiFQrru2HPyQ==
X-Authority-Analysis: v=2.4 cv=P7k3RyAu c=1 sm=1 tr=0 ts=695f775d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8
 a=H4St_WrzmzoQhtTZYGsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: C0xE9CTS4x-mMOs_DazPi1x6eVCAWAHH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080062
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

On 1/8/26 9:55 AM, Konrad Dybcio wrote:
> On 1/8/26 4:43 AM, Barnabás Czémán wrote:
>> WLED4 found in PMI8994 supports different ovp values.
>>
>> Fixes: 6fc632d3e3e0 ("video: backlight: qcom-wled: Add PMI8994 compatible")
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
> 
> Likewise, I reviewed a version that said PMI8950 instead.

We can keep it because PMI8994 seems to fall under the same category
indeed

Konrad
