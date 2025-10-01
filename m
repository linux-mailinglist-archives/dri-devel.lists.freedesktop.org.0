Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D39BB0004
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 12:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7079710E30C;
	Wed,  1 Oct 2025 10:26:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dFYnG04l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC9310E30C
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 10:26:38 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5917puTr027982
 for <dri-devel@lists.freedesktop.org>; Wed, 1 Oct 2025 10:26:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DoYbUoPn5h4PTq/YMlb34TeBwVEHQG0ctNULUvqXlU4=; b=dFYnG04lUAn1n3pJ
 kr8Lw2MzF2HEuD3idQKToqoMGycgOC0qh/5s8xl8OtIEISCDnkGm5VF++zLZ9hCq
 TmOTmb9jZOg2qg9DVoxZG+CDxF9EnH/ZET9FKO3TMFUP6xYq7a/3TarviUNU+oaw
 DnPWz432ZOZ4haFZnglikO17pBSZIuGh3x7UHckGZ5jLjbJUc95au523eiaRJZFM
 /zelny9foSERCefZ98ZWPJjLqiLuS1j6Zv43G4QfA8uFZSmefmn5K7aD1Gsz+f8p
 KhgTiIEnvKCQD2D1BHyHEgPeDb+3ErQqinndDsPyAgFw0+n0FGzk3iag+k4HYXYE
 DVPc6w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851m64f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 10:26:38 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-780f914b5a4so6651050b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 03:26:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759314397; x=1759919197;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DoYbUoPn5h4PTq/YMlb34TeBwVEHQG0ctNULUvqXlU4=;
 b=l0AVTGuY5to+tjChpx3J+kQW3SK2WbqxpC/IISwPcQjfWLWIrmz7ouEi9SsjfWvZsa
 IXcGxEywd4WjhsEVrfmFcyV1gc0qkvz4ejuyl5HE/836kzDcH4abzoEJBtMPagiIghkp
 avWfCC+ANUqk3+cDdvGgemhFn5hOn1wUQxUlm3fHKUyCSeDAtenRziMzhgNcNHXZghbp
 W5AaV9k13gGW1Kbn8Uzhx5++4riX+i50bZT0imXcjjHXpF0NEUqUfKsd53j/DWhyvoMt
 O71k9ls3dMnNu5Nep8T8Sbf1molZ4qGP2OMrk6IFR8eRe85XyRE2fl3+48B+8pmmkNAP
 Tpuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgUO38Bj5WqN3iWfL5GBLTWmyd3H1Xe6XXAbxa4R0ZoHLUuSrzl3B+iYaqizJFVo7Z/U8NkGDwXR4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTXmHLygGinhAkv7xmyWw59FD9e1lUmu7+i9nvY7WfBDDZTKbl
 xy2WGrzLr7zxWIFXnWSdUsHTAT2omWRaTX+npgDCwFm0RFPPtr+bz7EG44pEifbTomChx9PC3+u
 3DSRyZHvb42NsWWopM99OesH3fAeJdaS51J9PR7SE4+XGqfAuuOonCASrnVJ+BxmZKUosaa4=
X-Gm-Gg: ASbGncuU4BW2o1fgpNxGkMJid4xn6snQCCN2X/Ao8+5jc0tNHHujqWFbV773UyG4cdq
 j7foRL5A0UG/6q6xuoqTO28ByypjalCFF6wNV1IvZo3a8QwLaD5oAu2J69VjbY8DzP+8Rx0ANVW
 uV7y11QOWznV5lg5fKEm/RfxXJmeXapD6J13XZb6srZ3Depj4jNsREToKs3HITTcGknFcOAO+Ok
 AxIj5nKJYXotGutYiEqhquB4B1Nnj/8UfKMarzPIsKU242gBfnzTN0lGI92Q4AnmNGDxxgyxO3O
 bznhF06J/m/OiCiSIhFpgLh0K9bTBKXz2vVocw0Y/gQCyxQaY0xC1FwEc6s5EUOz84kpk3UL/wU
 lE7tY
X-Received: by 2002:a05:6a20:3946:b0:319:fc6f:8afd with SMTP id
 adf61e73a8af0-321d8b06ce0mr4302614637.6.1759314397527; 
 Wed, 01 Oct 2025 03:26:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2JF9jYAQs7P21pVRc4kQw9xYk9dAr+RziIcU6cRwEF5tEhV4BHPHR4FxDdHvAHzFGnPlBNQ==
X-Received: by 2002:a05:6a20:3946:b0:319:fc6f:8afd with SMTP id
 adf61e73a8af0-321d8b06ce0mr4302582637.6.1759314397056; 
 Wed, 01 Oct 2025 03:26:37 -0700 (PDT)
Received: from [10.217.219.207] ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78102c057ecsm15876881b3a.80.2025.10.01.03.26.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Oct 2025 03:26:36 -0700 (PDT)
Message-ID: <671c517f-c04c-4f07-aa65-a93e1e1dbce3@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 15:56:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] i2c: i2c-qcom-geni: Add Block event interrupt
 support
To: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, Viken Dadhaniya <quic_vdadhani@quicinc.com>,
 Andi Shyti <andi.shyti@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, quic_vtanuku@quicinc.com
References: <20250925120035.2844283-1-jyothi.seerapu@oss.qualcomm.com>
 <20250925120035.2844283-3-jyothi.seerapu@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20250925120035.2844283-3-jyothi.seerapu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68dd01de cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=fvgdV2PV7z-sFcuOFeoA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfX/4aDSugATBfo
 tnMh9zQw6cGtwUXe127Ugkp2YPqrOhAl6EcjOeNjlicWkoVELy5558Imo1v88XYZpHlLQorP8/9
 aYFOdG/jLsUDASsJk7Qx0hbv8T42kuhJxp+nADmz/HqWoUPbcjoxwFkBfKrkFEtPZjuvYehzjXi
 xItCqmCudJlksT8XNQMTD+IkMtxCLsqPIOX6fPd6WHjBRb/pUob43ljZqZXaNPr5J2tzEk1dhxa
 whn/S36YRl5dnptjCGaa5b/G4z4O1kogE1jP/1wPyLzoNkyRLIciRAzd56gWzZaZ8Ofkm92YuIV
 mGZBBlH/C04CFowDNfdQMg0IRuf60O9krP10+VhIJAGyxsPqYBXg/5F9oeNMfi9p65TJ0o4UlZ0
 jzDB8wzePPgXDrFNMbt1WW/ke5lafg==
X-Proofpoint-ORIG-GUID: 7RE_w_fWyrGV59eBARA98qzS_u8MtEk4
X-Proofpoint-GUID: 7RE_w_fWyrGV59eBARA98qzS_u8MtEk4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_03,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032
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


On 9/25/2025 5:30 PM, Jyothi Kumar Seerapu wrote:
> From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> 
> The I2C driver gets an interrupt upon transfer completion.
> When handling multiple messages in a single transfer, this
> results in N interrupts for N messages, leading to significant
> software interrupt latency.
> 
> To mitigate this latency, utilize Block Event Interrupt (BEI)
> mechanism. Enabling BEI instructs the hardware to prevent interrupt
> generation and BEI is disabled when an interrupt is necessary.
> 
> Large I2C transfer can be divided into chunks of messages internally.
> Interrupts are not expected for the messages for which BEI bit set,
> only the last message triggers an interrupt, indicating the completion of
> N messages. This BEI mechanism enhances overall transfer efficiency.
> 
> BEI optimizations are currently implemented for I2C write transfers only,
> as there is no use case for multiple I2C read messages in a single transfer
> at this time.
> 
> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> ---
> 
Reviewed-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>

