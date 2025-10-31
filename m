Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CA1C25D6A
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 16:30:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E26410E2DC;
	Fri, 31 Oct 2025 15:30:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="k83hUwoE";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gt8Rk3sa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9923710E2DC
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 15:30:17 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59V8NCmO898461
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 15:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aubjBpZ4Wxz6WDYi3ML1S8Br7mpPFHUcMeGT2IdqfJM=; b=k83hUwoE2hZlFlIS
 oITN13ABbcaks5UErqK2TdL64wOAw1HGbfYOj/mxk2jhaplLkPD2f69cpA9lyyel
 BnVXZ+fbCtyn4IFA+wgHiQQZa1tH2bdci/akd+TnDbyRyk9D0HJ9c+SzO3i749lc
 eXgO8Huj3AgL4EodPMD6YTGbUMLo+L0DaXzgDEHsMyh/LYPEtLZ8LZPG61cIjKl0
 mr7F7tMjPXtCNC2rjoxsZhlGEEbfK+OoD0ljgZ8THSLhfBksXW4OjtqcgtUO9TEi
 IAJHMkK8PtE/PCDUkNVtaOz1TYjdfONAX2g95aNsZ4OMto2VGTy4eVUlSGwa/Yuh
 k2qzZg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4gb22hcg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 15:30:17 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b6cd4d3a441so2099576a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 08:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761924616; x=1762529416;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aubjBpZ4Wxz6WDYi3ML1S8Br7mpPFHUcMeGT2IdqfJM=;
 b=Gt8Rk3saog7zYqWGETTPThmYCxC47IbmLH5ZRaZKm9gelt5nUzl1vss/ZEF0yn16e4
 vKx+5+o3ffVK95nZGEH80J/SR3DH2hK372o/1vGroBQ9sRU23A8z/aO1g+oYAAc96n5n
 O+vxYFtywFIDFARXKGcHN2MBi5bAcZ0iBGBudURxRo/wkPP6ymSN6K7vaW3is8nwWw03
 oCX7iQMlbXAw5RzPvoYxOmDU3EZJJwcn9kpfsnpL+QMLQUtOokHvSaWA30Z0W2igI6S5
 tplmfegrVI/mQtZYjLNaQFnP5UqTbneo701ZWWe5l3GKdE1rQcdJGM0nVHTFyMugYUUd
 JFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761924616; x=1762529416;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aubjBpZ4Wxz6WDYi3ML1S8Br7mpPFHUcMeGT2IdqfJM=;
 b=g5h1LZxDXUiBF7R0/Oa/+kzNlBsK4AWx1mhK4IS9wfoiabvpj8L4u8ZU4Lh/dVrU1P
 V8kKZo9APf10sqkJ/TWkZ4NqM+R330Lii0vE72Yuj+ZSwlkg4RfcRUeXMh0RVzx0VTR5
 NDoTufq4VeOKHAQASPudkTFG3YpcgHXQM0uZnG9gwWTt57QyRDgjsuN4r990LEvHiURk
 cGzbSx9IrlsIaIJQYtz6qMXcP2k4796/KNw1gzgS9FqvwXcU8g3/Q/keR359t1EPJiw2
 1ov26LeYo+CKdBgNhdj4Xid3WNxINmCNQuEcTZ8W/jJKQtBJLQmU/G7UK4ZszMMILZp2
 m91g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8yjP0fUNqfo7KAsV6TZlLWC1wUMJz5v9BThKNpFL+h++iRyej1WUayIJDqKcUbDMcYQ17UAdI18c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyC/7d/jxQQKNNWVTE/ccuDMspjbVbF7vRQM0bC4VEJ+lRQ91MU
 MJAMP51AIwtW/ll0a1C8+FL6lWEzXYlATiWc/l5lukcdIxKjKOb8Ee+ci6iq6H+8hdRzgJihFHI
 xuERTctqIsxe/zwnBB+BiEsqbNxf7K/OEhoHoA/jcuVMVq7ShUk6+EpDqXleQLiT2PvHT9lM=
X-Gm-Gg: ASbGncsAtuLAnZxWZT07xzQi+BCfZGeQO5IrT6lRWvGUReuOWCgSs34pyxpSvcWewYl
 D6BZV4+rZYbfm//+tQ4a24IywtksaPv9J6zjUbO+RLgDTMIdZyLhOAy33MPlhfp/MXsTSVA00us
 RUeV56aOB70ru+egeRL6g+BJA1HQ6/TN73N0JyFt10zz5mrRSqKoluuNlYloUvcBYYgOiGW/l5t
 xVVuxeDCiQOg+A7D+Nn8Sp6Mf5HSePWp+Fe0RUvlE1QboIK1oz3N84PSsMRLiPAXeIbvSHCkYhv
 /0QoY6kQZIbYalokisB9SLYOnDAWApAP0mRGcnm8AAALD7uqARaxXV/LHsjkO4RVGHyDcVV1Vhc
 hCceOTt8+FWT5o0LodZcneGPIxV2zRgDqKwiFXurXW/e7XLBiBZIJ
X-Received: by 2002:a05:6a21:3998:b0:345:3eae:c6a3 with SMTP id
 adf61e73a8af0-3477c3d4aa1mr11213340637.18.1761924616203; 
 Fri, 31 Oct 2025 08:30:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGI0yjTWVj8oWnooNwsC1xD39utAJSo9GaWuze9TCeSTyfY65uj7xmGoPU885hFwiAxRoWjtw==
X-Received: by 2002:a05:6a21:3998:b0:345:3eae:c6a3 with SMTP id
 adf61e73a8af0-3477c3d4aa1mr11213279637.18.1761924615551; 
 Fri, 31 Oct 2025 08:30:15 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b9483c03f43sm1961613a12.24.2025.10.31.08.30.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Oct 2025 08:30:14 -0700 (PDT)
Message-ID: <ce252b99-c011-428f-a89a-5792f14c2eaa@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 09:30:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Use pointer from memcpy() call for assignment
 in copy_partial_exec_reqs()
To: Markus Elfring <Markus.Elfring@web.de>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Miaoqian Lin <linmq006@gmail.com>
References: <d154d3c4-dd3e-488d-862f-5361867a70f1@web.de>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <d154d3c4-dd3e-488d-862f-5361867a70f1@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=efswvrEH c=1 sm=1 tr=0 ts=6904d609 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=FP58Ms26AAAA:8 a=i7YI89PhWf-mWEaAo1gA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEzOCBTYWx0ZWRfX/9dhztOKyot2
 xbfld8vg6P41ngq5bKmAjZaC+6Db++FZXPN/YTAQjp0jlJtAFEkreV/rHKA3wV3MEx6XmnYmhZ1
 dNxcbv7G/voTDeiaC3lhZsNPlhF+ZFDeMMphopMXqBt8EPWnAiKEwqyL4gOLG5ifHwCxTRXhtCz
 EcNGglZ1wjrXjWi30t9cQRg6TFh4njhRi07G8GHzofqAvuBqtCi517MVFp1T0AzTwbNrlIgekme
 Hta+WAq4Xnt5zrVJk4vNcsvSgbNDq+i6HiX1/TB1cnWEvLE6KzLAduO2Ya8tQq5MbGLUZgFFO3H
 q2v/yGkMaJUw7+A/DSoxeUNCUWrWHREnE9vkJqYK9AQfK3QzVMkTHilWUvN/KS7LWU08KKkMHOK
 DIbJ+/DPrTEz/YUoWTX9PI9kTXLaBA==
X-Proofpoint-GUID: 9BFQlEDqoU77bJvkHyfLajFLDvp9Fmnz
X-Proofpoint-ORIG-GUID: 9BFQlEDqoU77bJvkHyfLajFLDvp9Fmnz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_05,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310138
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

On 10/31/2025 4:34 AM, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 31 Oct 2025 11:26:33 +0100
> 
> A pointer was assigned to a variable. The same pointer was used for
> the destination parameter of a memcpy() call.
> This function is documented in the way that the same value is returned.
> Thus convert two separate statements into a direct variable assignment for
> the return value from a memory copy action.
> 
> The source code was transformed by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

This does not match the address this patch was received from, therefore 
DCO does not appear to be satisfied.  I cannot accept this.

> ---
>   drivers/accel/qaic/qaic_data.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
> index fa723a2bdfa9..c1b315d1689c 100644
> --- a/drivers/accel/qaic/qaic_data.c
> +++ b/drivers/accel/qaic/qaic_data.c
> @@ -1171,8 +1171,8 @@ static inline int copy_partial_exec_reqs(struct qaic_device *qdev, struct bo_sli
>   	 * Copy over the last entry. Here we need to adjust len to the left over
>   	 * size, and set src and dst to the entry it is copied to.
>   	 */
> -	last_req = fifo_at(dbc->req_q_base, (tail + first_n) % dbc->nelem);
> -	memcpy(last_req, reqs + slice->nents - 1, sizeof(*reqs));
> +	last_req = memcpy(fifo_at(dbc->req_q_base, (tail + first_n) % dbc->nelem),
> +			  reqs + slice->nents - 1, sizeof(*reqs));

The new version reads worse to me, so I do not consider this to be an 
improvement.  This is not a critical path, so I doubt any performance 
increase that may exist outweighs the impact to readability.

-Jeff

