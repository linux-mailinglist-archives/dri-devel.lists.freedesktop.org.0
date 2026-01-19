Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 420FFD3A905
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 13:36:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A05B310E42E;
	Mon, 19 Jan 2026 12:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XHpOwIqJ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iPoz86pn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B0DE10E42E
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:36:06 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60JAJjDf1531255
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=VhQ9FwvnxIg0wpGZTU5qCD1v
 PmdBF3EPcDNMD3vgPxE=; b=XHpOwIqJheGqAm8NOKeKY8j4xkPE1BM5IXdioLf0
 MSKjqINKvpnr6LpJdFp7tZiuKUxEql3d74kreqYj5+KnaguYTjaVjf5v+5sFD39W
 anKH707SQ36fs28Lfozac6BrA8gNbPdqOA/pcuJ9mtTa4Ss+pCq+NFquBUl6rO15
 1jEMIa/u1FMZFw95VgTSSG+1kxTHL+y64qSfOAZjve1x0o8W2m/lGlSP41hMZ7RV
 N0XYi2UjmwEUIZlCahSxBOPc+7E3NEC5ADCcWC+abcsyeNVyAV2c+wu1pjpZ2B3P
 03+DDKKSQlgp53fV9a7L01tn5qqg5HjTiLYnWDIuBqRn1w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjrxrc80-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:36:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8ba026720eeso1294649985a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 04:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768826165; x=1769430965;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VhQ9FwvnxIg0wpGZTU5qCD1vPmdBF3EPcDNMD3vgPxE=;
 b=iPoz86pn+4dUC7ep3Ukid9auG/PMhXmFtjYgGY9+SGZuEMY3t8RD1+bwGWIYAI3ema
 SnZvqq13TgISqSJQwr/OGEkF4MM3bgzRLNKKwrBGWfxYlbt+JX5kZQY06EKVrAJr6bRi
 zlQMCIPlNsHqCi9a9H9/EdZMOcpRlcwbMf6pDUMqbL3bQfYI+eb9tShF2iLlEotSdjWy
 mMIz59bl3vAa3HFNIm3N3hxiK0zy9QThGdJSYPQ1Nk2qLt8zXdkxQQxCSYiRNy5k2a06
 uWw4+nl83MRA8aeNdm9Wb/oTRFFhoBG5Oa4oK0LNZCMOBER2p3j0jW4js3rqFr8gXVbA
 4Y8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768826165; x=1769430965;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VhQ9FwvnxIg0wpGZTU5qCD1vPmdBF3EPcDNMD3vgPxE=;
 b=CJb16nYPvZ1dHPXQ60X24DS2qnIu7QlEqgt4hJvJNlyZ554WgD9URLrifgrjlwpfMN
 YeRPgrn6WZt19Ch7juz34uRLp4R1mvg95WQ5QkJIULmFAKA0WzXNGct7RQKq5ajqWr+C
 p7XeUj90uOc3gf7/+Q71YjGcvk0Rv4rJqtvQ+/BXg1kB9rmIDe8/7QS4/dvuwZKMU/jn
 HTBkWTiBLiwz78+/V6x8mavkG9wKGKxB6R0005EbmEgFtc88rRY0+A2DGtOapDxpa/jV
 cKbtZVxysu44huVYqqXHw7462EcyUraplDkYhLYjMgZQtiRZTsB4trZwNiF4DVrkkCKO
 HTGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDFm4u2ecBcXi6kLELuULiI7g4ZyG2o8MpIZnBsDSRfKlOChF3OWDahmtH8z2xmCB4klTo6Of6phE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziZj3NO40DeNyl91dbAOkKqNgHRUEm9tAuJk+a0iROy3rR3cYp
 wGj9aq09J5XF9RRut7elG6iLmjQVemYp5RcX04Qi83wIOuHClEEjY1DBBMQzvqT2wjKR3qvuch5
 9mBXMWJqDobSk6MTDl9RZcalG1B05s1rCz7jel+7tVJj4uRVWOt/Vn+YVmDxYhWc7lT8Brc8=
X-Gm-Gg: AY/fxX4Icux9fk9BzgYCz3IINEwIfZAzjiX/heemySn/vgDhN+xHo6/5Hqe3T44yJqO
 J0/NmfKdBPCCR2NM9W8yRgynTRf/VOMZD53AwsI4xsgnqCc45YAr/vst80Svm9AGQVliFZyDf6I
 mjPDaKUUkzH34pcJH1JxfqAVPpFXjMDlwa3Un0e7ygWYW0s0ztB1hN9Hu/ic8nF3p+bHjz//JtG
 dveE2XJI1eXTdfuJ3ykHIgUiK8ERhV5E2cdxK0R4+qtauscIAs9rtyEBwsyznDW9naR+76so+Vh
 wY5+ln8x6PoEONeZXnnuSaJHGL5omToxZ+GvmcN0nHQh4nJ5HtqPojDpi65jek9QIBRW4BDcX+h
 48VKh7GEOQUodIQ4ZaawloUo8bKK0pb2EmNpNR+PzCbYDhiwV0AUZVLLVN0WyIJmklqcMehRlQH
 pfhJLE5DmHPbyn9DXh0EEhXHI=
X-Received: by 2002:a05:620a:1a94:b0:8b2:e1d7:ca6a with SMTP id
 af79cd13be357-8c6a6783edfmr1413786785a.75.1768826164968; 
 Mon, 19 Jan 2026 04:36:04 -0800 (PST)
X-Received: by 2002:a05:620a:1a94:b0:8b2:e1d7:ca6a with SMTP id
 af79cd13be357-8c6a6783edfmr1413782085a.75.1768826164356; 
 Mon, 19 Jan 2026 04:36:04 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf1fdc3bsm3281058e87.0.2026.01.19.04.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 04:36:03 -0800 (PST)
Date: Mon, 19 Jan 2026 14:36:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH v6 00/12] drm/msm: Add support for Kaanapali
Message-ID: <433cwpqtfzo54ls3ivcahu4fntizgqrdqqi4xgjtbtv3lskpib@dwn7kyshvels>
References: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEwNCBTYWx0ZWRfX6l5wjgdt/scf
 ezO8OXDcxd73GCr5v68DVqbWp8/GaMdagaULdwy0Gz+5egPvDgvuAzIWrIXUEov+/GZZ62n6gc/
 i1znVcd5+8AVToOF5sSQBbgVbHOnPddjLJIGxRPGDgT6nBNgfwPWLDTHhudz1GPjiEKTprtFkCO
 Fn0XKISukgMj+xSijyhHpHtPe2GHRf3nGNxbaD8s1JKlsXtBM3jIPaMBqZxR/F9teA2jkhPXS6q
 1aiceEAkXmZMYhv2WP4/v2EeRMCeXeEDDZGsWUEcRZzgOY1l2F9I7XG9hOpqyHV3EU2f92vD/f8
 Sz2Ukv369Rtb2pCbvqW69a1QYb2kOVKeUZHEPmk87piRkj/iHl1J0EwMRTGFuHWD7Fqbr4ud/lY
 1Q8Zfh54JJjrn38zR6usie1Owcsoj7C+FWNyxyjxqshS9CjIwYqGE7EGDLw+I544YXZY7+Wa8iK
 9SQ9vs4Wotj3YOYxG3g==
X-Proofpoint-GUID: SQujWTWIEYh3OLhabDcO9CHZbTc9jAsb
X-Authority-Analysis: v=2.4 cv=PPUCOPqC c=1 sm=1 tr=0 ts=696e2536 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1Zs5HNVOiqO5ZMFY7eAA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: SQujWTWIEYh3OLhabDcO9CHZbTc9jAsb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 impostorscore=0
 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190104
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

On Thu, Jan 15, 2026 at 05:27:37PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> The Kaanapali MDSS has some differences compared to the SM8750 MDSS:
> - DSI PHY/DSI base address have some changes.
> - DPU 13.0:
>   - SSPP layout has a great change.
>   - interrupt INTF layout has some changes.
> 
> This patchset contains DSI PHY, DSI Controller, DPU & MDSS bindings
> in addition to the driver changes.
> 
> We have already tested the display functionality using the Kaanapali-mtp
> device on the Kaanapali branch of kernel-qcom repository.
> Test command: "modetest -r -v"
> kernel-qcom repository: https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/kaanapali
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Please rebase on top of https://lore.kernel.org/dri-devel/20260119-msm-ubwc-fixes-v4-0-0987acc0427f@oss.qualcomm.com/

-- 
With best wishes
Dmitry
