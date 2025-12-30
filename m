Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0889CE9C9A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 14:28:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC6CB10E3AE;
	Tue, 30 Dec 2025 13:28:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="X5kob5xb";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vl3pTqzc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 337BE10E3AE
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 13:28:51 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BU9umoX1751668
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 13:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SbPCrSTHdAIMNZfqnVN4Vn/bScRCYxDUiISVKD+AQEI=; b=X5kob5xb94UNZrZp
 SCqw6yb08ARzaMl3g4Yznm/uhr+bDna117Rh6Sg5kqHc8m+/+LXEo2/PIBAXQKj2
 NZkKO7EnRIDFGPDvfJiqojA8hEvWdLA5d3SpfX2Y2ufJKQVYcbgBfQDCGupZRVXg
 jwUW7xqmlRzWMX+8FZazdNxw2XICaZLH5K8TIuOt48FokmN3AIcgWHdhlXGF1pED
 2F3P6loAlKEdRUlvLOpy5Q/strGjTGMpuZGT8SxJZa9cuzd7DOftpLbN9F1Q9Exf
 FpAtg2qsub+b3gah2zquzpsvJh7/ZWT9KTSUqPdyehNyB/jugMGBeN2Safdoxhpb
 ebe8yw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0sgsy4e-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 13:28:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4f357ab5757so45062731cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 05:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767101330; x=1767706130;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SbPCrSTHdAIMNZfqnVN4Vn/bScRCYxDUiISVKD+AQEI=;
 b=Vl3pTqzcURGW9AHDLpxZ9fMt4WUiIYeCgiReN3bnFScn4PpF14tmrTeaAcUtyItO7Z
 tkjn5ZprB3j4R7am8Rpz3rhzBatYGvx+ANWgiTe40+xRb30PyqcNPaKvx++qr+NJyXJU
 +e8Qd696go7YQ2JViAFd+nGZ/IFr9TjkibZGoUXXgCiXydXsvd+NaV6al5lFsBKIGKgm
 87y+RfqeclWyhOv0c8L5dEfPvj8bQ0mLajkJRE+mX0EBcbL5txTJzCf9SyekzIrcXiR5
 0x4wi+diHlPaRL+NuhSokOaXvR/6JcuQMPl+QP8LIUCFOaXjkhCnclcc7tS14nCmZJd/
 H7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767101330; x=1767706130;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SbPCrSTHdAIMNZfqnVN4Vn/bScRCYxDUiISVKD+AQEI=;
 b=IHiNiVluNS3takml4A36buehBrdIm9x4FABTphWuIMiR/Vq105C6RjsNCxdwZNcCaq
 CiexBP5i7Z3CspHzSWH0mBUfPVXprhwArsuGEE9g4srA5gV+Tf2xBfq3TNG3s2xg/2Xu
 CgrYN8YE2uYZZs5ceOeciu7MfiXERraAG5PwM++BllbpKx3Cko0wskLUlePBsMAPyCSx
 yWkh4daF00qzZwy8rh4mjgoT/FgxsfvYl77FstUcd+p0OcusXlSmvl+dIZEVNqhmilVO
 RTtSe5wRpDQoj5fq2exfdEOVWIe8j7KogRLsSMATZURHdZoq1N2mqa+XGFmfaZ3fy4uE
 kxAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTf4jVqGDYeyPr3SHOTVrL/5PaClzHzf+tBg5sGw4yANV35EJUbTcrxjcfaPl/jRlr4Y1QVlnLUU0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8bTeDb81PE/CT9oGP+gNO5ZPJ5kMvP/BWBaWG0sFjaMcWdVk5
 wQZLr++dts11o/kABAnLDu7xJfTcYkc3AY0DJq+5uT5Y3fIbVOOvOPpfIUNmDjKFao7pL4auzKW
 roM+WNLwMIpksJ6KQSqpS3MM3hmMvdSo11K/gRO+LaileS5TLV1cfQUqwAwxAOUCq2tOD7Bo=
X-Gm-Gg: AY/fxX6lj9AA9BTqKI36vklSIaoP5veRxm+GZn5PVG0KZ1yKbA7xLq9EhjJuB5bft7E
 Rkne/xZgeOUBQfIGUBgegL30mGcyit029DxX4ndZ2NtO6dsjF6RkESId120sGOMeMzslc1mauWE
 GBBUHl9YkmZ0IKaK8TvwUIPfDukErS2ecmsM5SMJ9ZGrb3GmF1bk9n+JG9LznadLtyCSixc1+YT
 T0JjlKhCi8vJX2u0T8k4rEbPdIqb49y4CefRt/HDZhAmQ09LT491rJJNPD9VI70AJqYp1TWC+tb
 F+bkGty6Wp/jnCAiVNDD7yjUAcOwlZupMSUc6bu7B4nSLAvLaWkJy4s7WlSD9CDUEfYiYWjrtQ/
 clYwjaM3uxSRhmAYe1Pwkv6NWQszt70V3Y7c93Jha/yRTp0h40fPTUAvSqbzP3yNFmg==
X-Received: by 2002:a05:622a:241:b0:4f3:6170:26f4 with SMTP id
 d75a77b69052e-4f4abbc06ddmr358865231cf.0.1767101329758; 
 Tue, 30 Dec 2025 05:28:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGDF3yEn4U8C4OQp+pO5mkvPfTN8DijTooC3QyATKwQ9+kddc49uVi89CloOxfApcHCZh7uHQ==
X-Received: by 2002:a05:622a:241:b0:4f3:6170:26f4 with SMTP id
 d75a77b69052e-4f4abbc06ddmr358864901cf.0.1767101329256; 
 Tue, 30 Dec 2025 05:28:49 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f512e3sm3630116366b.67.2025.12.30.05.28.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Dec 2025 05:28:48 -0800 (PST)
Message-ID: <027c3ba9-70bc-4c03-ac7c-07c7a8a865e7@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 14:28:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] misc: fastrpc: Replace hardcoded ctxid mask with
 GENMASK
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, srini@kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com
References: <20251230062831.1195116-1-ekansh.gupta@oss.qualcomm.com>
 <20251230062831.1195116-3-ekansh.gupta@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251230062831.1195116-3-ekansh.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEyMSBTYWx0ZWRfXxUFtBzFYaqxb
 8Iy8Kv7LIsVQhAvPigbFCX8czmGWGzpKlrin5uHz7hCbVLGIzmDyi0K1Iidkr+xrzqo3SefE1Ig
 116CqOw2T1oNIkQ5WQJ00Xl4r6Id4eTHBcM9uDxv6nw/9ReC29varZKczXfur2P5PIv66i/3Bhx
 yHN9g7ycvIKaARLA7gZYhEJUdbhPIfcBeeU+ia7GLziIsw48bp/TiO5GPUoZGitgGkAqQGy0aFk
 2BwZXZldJrwU8V41EFrUu+QW0UwdgIcHEYBrjhEKmnX7gRS74KBE6DmkyAG37DVzcyKg64w0Oo/
 gRpfA1xY0yXreac6ytshc1IrcQtDvblSfsjgY6Brt5rWONOK9XgQbk4GYKlJVXNaJK4uPGDhNy6
 ewuRwwtjFyR//r4JshsV93ej5x7+QmbataT83sAhqF2IqArTEjkEhUKseRtQYyoNihQSUiz1KDa
 P63M92Qk9WjaLBa88ow==
X-Proofpoint-GUID: ZfYxdriI7EBEVTw4mCuARh-peVoXxHMQ
X-Proofpoint-ORIG-GUID: ZfYxdriI7EBEVTw4mCuARh-peVoXxHMQ
X-Authority-Analysis: v=2.4 cv=foHRpV4f c=1 sm=1 tr=0 ts=6953d392 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=WZKhdRBjRjmf9s70GbYA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300121
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

On 12/30/25 7:28 AM, Ekansh Gupta wrote:
> Replace the hardcoded context ID mask (0xFF0) with GENMASK(11, 4) to
> improve readability and follow kernel bitfield conventions. Use
> FIELD_PREP and FIELD_GET instead of manual shifts for setting and
> extracting ctxid values.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 679cd8997a00..f7fb44a8e9c0 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -22,6 +22,7 @@
>  #include <linux/firmware/qcom/qcom_scm.h>
>  #include <uapi/misc/fastrpc.h>
>  #include <linux/of_reserved_mem.h>
> +#include <linux/bitfield.h>

nit: these are best when sorted

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
