Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 470B4B2465E
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 12:00:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26EB710E6CF;
	Wed, 13 Aug 2025 10:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="N9CaoIbL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5308610E6CF
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 10:00:53 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mLNW008752
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 10:00:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wiBWcdk24yow8RF3k9D1Z3F3r9BgHRGCWV7I+lbiN7E=; b=N9CaoIbLvjII5iGW
 91H0wJPvVuZVgOQHfDedopcJWkBiXmu0ICOQy8BWlNAMtuIFn76O9zsijrMcXWaR
 nGy1Lc3PT43fWeQIRxtPT/wUiLltdupUp3wNKpr4D6+EAXiXh4Y8inhd+D0CROS+
 QvyvLgiKqlvKBtRTXqbV1cO5t0dB9S9+v8yPwFXbTTPA6MgYB2fzMCuUCJvhmITS
 jVdz6J9Z8oSnKORIzJeeMhKraWxKcjqxlBdua9wfi2YinhduTNdaOnw1ZsZxFm7E
 EXQIckRprZ49SAJVNw7MUW0hmGfMqL2vtakcjWUxi7WJVzJI3YEFLDrBS1JssXgF
 zzOp1A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem4favf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 10:00:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b07b805068so14636641cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 03:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755079251; x=1755684051;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wiBWcdk24yow8RF3k9D1Z3F3r9BgHRGCWV7I+lbiN7E=;
 b=d5KL/flXGVPWHX3UeJ0eycE11wXEqfzJDoafSLQXpbKH1wLb3ZX4i4bFzd+HWunhqr
 yXGm+4qJG0kmR0vcVxbZjhRNWrX3NILofgReaPKZS9eVl3IkKErK2llHu0xjcSdHuRBu
 6jHYaBi7HnpWdWRnv1k9X5yLfY0fbrcz9HEXQpJtce912xEtp3VZC7sxzlNCJcKwXZyz
 9WGyfvNewXGqTFlXGmP8ChBLQXNFYmu2LCBcS18ux7AcYGphIXC4G64QNXVpAufECvaL
 p93pVv05UhtkSJKQC7X5FbkpDZ/lUZDl4lOspJOfM4HirtW4SGLaAOjw/srJkFK4Lppu
 Sejg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3DQN0u9pqsgBatDXvqX2vcOtypCrFhxM406sXkhzXUnTzRwzByGfgPI9pgD5Q7Oq/UzlIwQ7KsRQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxA7xzyRUGQW84eYG2dvFAoXxBxXcrJxNgyG6bAt5ZuTdKl1Qed
 6GaDCBBBT+Zrl45GGOAciZTcS1jZDzq9qVTXVlwewZlW4JTLC/IFdPqn6/BuC9Cd2+tMUJjlike
 d4nICdNP0/V/18OOF2Q1Pzg9Qva2avlTZWomRkXH8Jrk1tU+QB9fLllCgH2DHSOay/+9T8/o=
X-Gm-Gg: ASbGncv5oux6gOLHQR2eArSirp25olPRm4m1zbci3qikQyoqZFUlfdM8DPs0Um+SxiO
 +U9WH0VpU/RoFydncawp+vBRXpHc1qo2JolcR/Dw5/JaRHfB9FdyOW8tK4a30j+sz+zPyhzYOX1
 kNuHa9HMBdRq/iL84cXevH15koKfJxslhrQISNxQ9ULqesrHt0VX6o7i68EUps0vFHfv4CNOWFb
 0c1fEJVana/HkXHsVluBtRIKnOknmtwAiE8SEJYPwWcFPpjnLolZKGaxOa95ViEloDBCIUp/Y3D
 x2iMC/Iu8HyfG6VG4JQEjhASkC7ZVOIlF58H/AkEnwDHBsgEJ5+FACJoj8kBT15RauDhQxFgrwW
 2OKHCXuxCCdiK1MFp4Q==
X-Received: by 2002:ac8:7f06:0:b0:472:2122:5a37 with SMTP id
 d75a77b69052e-4b0fc6c46d3mr13966941cf.4.1755079251145; 
 Wed, 13 Aug 2025 03:00:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmTrD4ySjMqSbwhalzXJcsozDXyEzKvaYMIjrNiNP0RSpO0suJx9JL31ZtBXBXWoPTlWVUaw==
X-Received: by 2002:ac8:7f06:0:b0:472:2122:5a37 with SMTP id
 d75a77b69052e-4b0fc6c46d3mr13966501cf.4.1755079250541; 
 Wed, 13 Aug 2025 03:00:50 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a3375sm2366142566b.41.2025.08.13.03.00.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Aug 2025 03:00:50 -0700 (PDT)
Message-ID: <3ec0a8d0-7900-45bd-b0d3-90ee8ca7730c@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 12:00:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/11] qcomtee: enable TEE_IOC_SHM_ALLOC ioctl
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
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
 <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-10-ce7a1a774803@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-10-ce7a1a774803@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 24_hi9r328H8AUDPDUCbxnQ3LjrrJeQi
X-Proofpoint-ORIG-GUID: 24_hi9r328H8AUDPDUCbxnQ3LjrrJeQi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfX7ZJpLXjpV2s0
 FHS2MNn5TCEk3zRlbu8f+0vg8Vckasp/Aqu92QqBtBCHpc+DDn5uuiC4Cv5gMHcvItcvc+sqfMX
 T6yKGsjIoo0TO4nhThOOJNVLJklYCnLQwjZarz+zX7fQJGvczGReT0ryqgMwNrOFn5FM+YEkVs7
 7PQEjXwuloJP8RoQfr0l/+TtSDNunygiaFqIy3h5fo6iK54bHSuVObnVQlnu4Xb7vWGqfoGNfMI
 /gFO+uv3liK5AjpqPxq1WLa2441wLCPLMUlX0mfw7cyOxLbwrM3yndiMdhxfKhxKtjDkSof/gGq
 mpJpYv09dW3TZig+Sr9bXGQiycrMDkSTsTQ48O2Dl/QcXkzERTrlOHGbMLrC9xuPZHwgQuhV/ox
 /M8kjce+
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=689c6254 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=WNCivIMphfMWkbBb3CYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068
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
> Enable userspace to allocate shared memory with QTEE. Since
> QTEE handles shared memory as object, a wrapper is implemented
> to represent tee_shm as an object. The shared memory identifier,
> obtained through TEE_IOC_SHM_ALLOC, is transferred to the driver using
> TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT/OUTPUT.
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Tested-by: Harshal Dev <quic_hdev@quicinc.com>
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---

[...]

> +/* Mapping information format as expected by QTEE. */
> +struct qcomtee_mapping_info {
> +	u64 paddr;
> +	u64 len;
> +	u32 perms;
> +} __packed;

Please use types with explicit endianness, e.g. __le32. I'm assuming
TZ will always be little-endian, regardless of the host OS

Konrad
