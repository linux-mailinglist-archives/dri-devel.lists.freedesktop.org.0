Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A9EC4144A
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 19:20:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A8B10EB5E;
	Fri,  7 Nov 2025 18:20:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="J9Brygu9";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OeA+gXYQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3471710EB5E
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 18:20:06 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A7Ft79j3345376
 for <dri-devel@lists.freedesktop.org>; Fri, 7 Nov 2025 18:20:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FBKKKOY6HcIvB5a6Juec3NHU+NJqetQMMf0kDMtKHp0=; b=J9Brygu9GaDcEEVA
 e41uy+R+ptYjJWj3FfXtAx3dGvpA+VBwNrtjYV7ydh9Gr5WMHHiiQEdbfJaMp8P/
 QMxKapKbY93SV6zqIJdgkXy6qVgdQOD//Qr3RV2U0Kdzsw0zIA3iq3VNarAyTK58
 8AeastUHFNV7BG0lAS3z/GHJ1JdVdU07JaU1rSzuZf+w0NXZCF7l7mehx9U2Bb5l
 ktol6EtjTJKuJXDw6bI8Hj6YPR+XyBtIIjfiC/Dx8nKZAWjC4eFiAVqu7ZJHiiTe
 aJyXyNkcMLqRxMdV0Iwr0VyvVgHgcuvfZObjKbXCqSrFCt1ssai7K+BV8JuZXxe6
 22ly8A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9ku60eh0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 18:20:05 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-7afd7789d4cso1524273b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 10:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762539605; x=1763144405;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FBKKKOY6HcIvB5a6Juec3NHU+NJqetQMMf0kDMtKHp0=;
 b=OeA+gXYQ6Hngeef9LoQWjUrLnW9O1HhskLWGiT3E98ACKjpjM9QL7fyxR2uDaZYzI1
 Ws2D91vRnTFbgTaz/g7b6vgWtp5QW7X97BwVjWQZh6haUCNdc2HWHkMAdr69d/ZQRS1b
 CzWqtWkqjHgKo30VfPzxJ4qMczf+WfCy/350036knyOP+AlwiN7ZTLPTAuG94+dD0lLF
 164cl4MeXB6P2Dcu2xtzpUXv+dCSwR6u+uR4jkE4JYDiIzyKqrhAMIt3bcs+W6fZ3J6S
 3n2vVUCGzYK+gV0ucYBYCa6iS1zz4wDwG3HpoP2kPZj0LYNcBox0FI2OVN4NgUqIzrdH
 NxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762539605; x=1763144405;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FBKKKOY6HcIvB5a6Juec3NHU+NJqetQMMf0kDMtKHp0=;
 b=YePR16CxUmldwQ8cFqtEKJCnnzZBsJ3tzeH+/z4+3nibcAGnGy6UIYJiarb3matTyT
 cJyJdT2VFTaeUE2WvIDiDUUujKYfs6P0uoNfjzmnbTxuG5BqBSaB21KD3+IEOFU1bIIi
 tkSSy3rPH4NVtI+/TIMnZ2HvQrU7ACuGKZh+40qzSf/1nm2Zk92Xq4qCXxfAJ+yIOF53
 haxyZxj7lzCT4qEhs8laxDMtPe0yLP8K7T24xcK7X9UMrIxaoO8It+Syu0jXtG46q9PS
 712u3zO6ts7UF0MB0EWwrixlR/A4MXarBPImw3THXtHLlyT5t6Ofv7wheoIKHRhLUHSN
 G2FA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDsMo1irdFiii6ulW497GR8f6JvQNoyD6AP4SbAX87Hf5R1dkD2TeOFAbubd0q3S/88z7PQYNlkWA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqZPm5IfQh9yAxLlapFyak2eDGh9om7pZLeuuag4orP8LRVBiX
 NXcFJyYJ9+lwguzUjnfdB+iREZBx+RwGAjIjgHVmuOW8ynYoQEF/XCnmBSHN4aEhlxfbTlofF8C
 NuM8RldkdK38DN3tP3/WFdGZnwtAYdm4xohjnSFIMtCJq7J3hwlmHBxpbiIYoqO3H/DrAIFU=
X-Gm-Gg: ASbGncvuHVGm8w95JFE+mvtPVG1EvDHsJ3pEjdj3X1c5SfSm2HbcWAj6r2nC+1KY02f
 m6gNz9T/2tWgqjAYNwqP/ixEF7WyQCkbluxFgAp4ja2ckJPYLzJ03NGS7BEgHlT9qxRSWfIXEf+
 p7Ns5VKY7Q/IVeplKHPcPyl1O+Gu16tB6oqyjizMHTmJQYBIyetcw5+EmbZUl2lEK2yOwZZclt5
 U/2KroxsQuN7MXF4jN8kfzSorRmB1xWdtLin+/uDF4keX7RL0my5EQph8OmwGnFGnSLTBNfDLBu
 wsoWSj2q7I0Qflurc2q5vzU5ixP5+kFvrhpRfilC6lCeV/jlEUuhGDhJiKiJ60mfOSl2B9nWbjh
 RFm79pWcIkyW5Y6BA5jRbItdeC2X/shkw9Y0tcVkCl7SgXpIpDVUx
X-Received: by 2002:a05:6a00:18a1:b0:77f:4a83:8f9 with SMTP id
 d2e1a72fcca58-7b225aea5c9mr263891b3a.2.1762539604641; 
 Fri, 07 Nov 2025 10:20:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEp48slzuNf2xNDfQ7pSwJ8KFhe1kEu7Fg9h/l0QPWqoKufTcN0wnRDUQmOiMOymyCwPYOK+g==
X-Received: by 2002:a05:6a00:18a1:b0:77f:4a83:8f9 with SMTP id
 d2e1a72fcca58-7b225aea5c9mr263854b3a.2.1762539604085; 
 Fri, 07 Nov 2025 10:20:04 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7b0ccd5c75bsm3550855b3a.70.2025.11.07.10.20.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Nov 2025 10:20:03 -0800 (PST)
Message-ID: <98956b34-ee28-4cc0-bb8b-321ac37e6d43@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 11:20:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Add qaic_ prefix to irq_polling_work
To: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 youssef.abdulrahman@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andersson@kernel.org
References: <20251031192511.3179130-1-zachary.mckevitt@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251031192511.3179130-1-zachary.mckevitt@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDE1MiBTYWx0ZWRfX2uhIEVyNFgiH
 dpMvZmbt65FdIyqMC8e/UyMO7CwVS7Uk7F49KHq/0+L4c01hTbHfZeZ52uoPUQ443GBbG6pH25m
 ngm7DwSiNSc2V+IbNEKwa262zlR8FMCdt7MIJ1vGqazKawx22QP/5HIz+Yq4SvsB3ursLszraYH
 A9gFxYkD3kathFo2lzK40y26BgH2ySPpn38To9DkD6O0YK/aEoYIXTk8q5aN3HpKmb+UTUSbh+a
 pToXNUBJLqAvcRWue5wf1xRgIrKYuL9QtNm5ctiV4ArGMAgl4y8JhOGTIMqOECHNGMjNekGEKVQ
 jhvccFPl3ZTMgf8h2uLKeIjTZTpAcMxfN35Sn8IWMHdgRGwHExiUXMBdZBsKh25OqqMBCu1NhHT
 nDuN5/AwnjCdiogn3QCzMEncSOj6FQ==
X-Proofpoint-ORIG-GUID: Lj8WVi6RxgK8xUxf_m-LsQ2PttMz6fkG
X-Authority-Analysis: v=2.4 cv=KsNAGGWN c=1 sm=1 tr=0 ts=690e3855 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VFpHpITcvpFWFpzWYsQA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: Lj8WVi6RxgK8xUxf_m-LsQ2PttMz6fkG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070152
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

On 10/31/2025 1:25 PM, Zack McKevitt wrote:
> Rename irq_polling_work to qaic_irq_polling_work to reduce ambiguity
> and avoid potential naming conflicts in the future.
> 
> Signed-off-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
