Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F23B2469E
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 12:07:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 729AC10E1CA;
	Wed, 13 Aug 2025 10:07:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TPoeXl4I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB4110E6E0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 10:07:04 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mJ3l002454
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 10:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lo/uyCg8eI45CIAczel8wExuTSXtA1VT9FQTS1gDCiI=; b=TPoeXl4IjXVD2YQV
 7PgGj9r/3vk0QoRPKTnaIosHjf093O/ALUsVq61RqOpmDap4f+w999tmLJ9urEst
 Nl7bDUeKgmBth6OefCysUvALMPvErT66ikBQ3GRPjzM0c21pZfj6H7pUbnLkUlp2
 gzHM4yEy5pzomSygB2CLW5ggaKuY8TiOJmkAMhHp+jfz5z0el9m1cbsm+IaaDiWa
 Y1R8WWMZwz84bWml2GpnvdbBo3sb48jZU8MDTVBYu6AKnzDOtm5C48/hM/iXu/Oo
 sxNah/WcqjrvA5pbCeYWSOeMIYin4eFMs4IcVl3hkQQnrhkTGpE1/sHlh5WWjSMJ
 wFZHoQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjq6ec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 10:07:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b0c502e87bso4998881cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 03:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755079623; x=1755684423;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lo/uyCg8eI45CIAczel8wExuTSXtA1VT9FQTS1gDCiI=;
 b=nxX4diGdT3U13cZEvo1x3XCiHsHLY/R8XzgIemonj6IBi/a6de/rKlqcp6/Mr+dJ2F
 j1/vh7mYYupTXrqfZaG1EoVOQvHjQUhIvFrWkrKgKD+NYlme/ucXUUGapA8/qENLFXuH
 RnpCND7nVii2WXLDggVkbAyvBfXFOLzz2Hb38zX6powi7pDUbBs4J+UC2NjwNcp+IWp7
 Vs9KChGUimW8trzGBbcmztunt+EtWHxYLSC7If9dKxRK/AX9HY/Mb6yEdj/DeJns9YZS
 +XGVGrWhtYVB7tT2PeHoMi9nqYEpOkujV+pnO/FfY6OprQ9O3EPgeeOmPjLGc/9UFj+j
 hUMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOxz9+tlpokQmZWe/INGrbI9APa02JTdLM9mKsP+3zS4Q9wjDaZjo2bf9/N3qt8ZMqLmuIf84FSAs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHZBzQWelel+PVHJWprOuB8J3tlcKnXBmCh3dzrJze7fnWShHp
 pXcN3IgXdQzWtjCgptleSM7JBH2z9CzwzfD1+2xIEE0TdgLH3QNJbSUT1x7B9zrTBeNkC5tPKP0
 WlLgkhexPxOZOYuL5Nhq7V3zzZHp9K9C1JNSrgDUBzY5PJnExWg7DHBN05LAGwPBHhnXfU4o=
X-Gm-Gg: ASbGnct1rmp4xm9yy5nDamjFT/9vkuWg7SCBdN3yFzrZGfD4yFqw2A13pgwBZPDzp/O
 dwTBY9FgW1yQGshfSf/VNPraCe4Wg0hadhblIWKzCUP44i+Ae68vx1PuH2tngs9sCeafGz2f/Tc
 3Qayj3BWcNcjLyIYaF+CyzeWPdsO3v41e6+NV5FsXBeQuIaAK4ajAT8Aukc9znJ+aBYCYX55X1p
 6TfN28ib6uHut66BfBMkJQFJ6B9gN0URuced5yXUiu22gL1HmiWM7jNZrACLy50PQpBMJ6GH9KJ
 tnfp2xPARq2vUNLVq0PhFuOFe1uHkIRlILGoX2AW5lO3d0hReDCFl4R6vApWJujXqdQ3v2+YvGB
 NYbEv4OTHXJD2jmcSMQ==
X-Received: by 2002:ac8:5dce:0:b0:4ab:609f:d7d1 with SMTP id
 d75a77b69052e-4b0fc6cbd31mr13706691cf.4.1755079622728; 
 Wed, 13 Aug 2025 03:07:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbEx/52bIrz3cKGljrcyVxad9pOt/IN1rRcYfZiJuhcUb6gPtWuoMusDjEvu/er5MYTpmlKg==
X-Received: by 2002:ac8:5dce:0:b0:4ab:609f:d7d1 with SMTP id
 d75a77b69052e-4b0fc6cbd31mr13706491cf.4.1755079622218; 
 Wed, 13 Aug 2025 03:07:02 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a3b6csm2371260366b.48.2025.08.13.03.06.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Aug 2025 03:07:01 -0700 (PDT)
Message-ID: <f10f1602-972a-491f-9c11-95e5e7bd80f8@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 12:06:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/11] firmware: qcom: tzmem: export shm_bridge
 create/delete
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Sumit Garg <sumit.garg@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
 <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-7-ce7a1a774803@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-7-ce7a1a774803@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfXzwX0VdgTh5i9
 sg0R44IpAksIL8+lmF+mQq3p47cQFPNXkhOBc6bM85D9oE+YWLBo7brHd70zoHlWBjS5VcYRLWa
 apDzeZ5HrMjVBwVddxS13o72RvNm2J9O1aMLhvnVewMIHNizWFZrWitXh572z05NENzgkbXMDeL
 fpuGPUlWLxdDdYItMVb7SIY8bC3VoPsbLrR/rbeJq6iH+pzRFRTjpfgo2raz/H3EMQr7qR8S98v
 X9qQI1rtj/d+vExHHyHKbN3xMZPXMEGqzszjIFiHIN5kAFu0jI7F+jJCcK0EL6JwJSDPOQKgPBr
 CK52VAwlAsR+0ui5bGVYFyflyNRT913drmunZ562iY1BG4iG7mSpGlQdAwHF0YbR/zcg8CwfcTW
 gSDKtKIN
X-Proofpoint-GUID: 1BO2thunT5ogJ9OCvfiTI_GVRv9ZLngv
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689c63c7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=sWKEhP36mHoA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=clTIM29CJtwRRT_IFxsA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 1BO2thunT5ogJ9OCvfiTI_GVRv9ZLngv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074
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

On 8/13/25 2:35 AM, Amirreza Zarrabi wrote:
> Anyone with access to contiguous physical memory should be able to
> share memory with QTEE using shm_bridge.
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-by: Harshal Dev <quic_hdev@quicinc.com>
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---

Hm, I thought the idea for the tzmem allocator was to abstract
these operations to prevent users from shooting themselves in
the foot, and this seems to be circumventing that..

Konrad
