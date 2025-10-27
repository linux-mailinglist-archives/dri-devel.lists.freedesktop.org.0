Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D715AC0FD30
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 19:01:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B32910E539;
	Mon, 27 Oct 2025 18:01:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CgdEEbJU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5B810E539
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 18:01:47 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59RE4WZv3018367
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 18:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gfPIAz0ykJxRgruBtAUTEx9o9evpUFrEKqo1tOgYr2k=; b=CgdEEbJUCEs473C5
 d1c4UGXtjhqwhxB5CtiJh8vrnXA0M+BhZf3l5j0dLCg82hKBgypYZcewv+sDlG9d
 MXp1Nm7aZq21JtVnNheQBXaaJZY8YSYRzXC97Mq4crJy6w+Rqxtl6EMUuFOKJhTR
 Kq6MhM5zONXFAUiyjps7n5rGxRke7U15apr7xdJAfBIvibyWM/FZkpknuMDFjMka
 FAJ1K2Ri+iupc8JURTjScai8CHDO+hfEl9eSJO1SQEsExC+bFhufHzdBPW0NZ6IJ
 lfCFlRjNyHFF9DkNfPUjRKklyYV9cwSsQlJHBmCdGxp+R3lnIG/gV4qdfEkO5hcz
 Sami4w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2a6a8tx3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 18:01:46 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b6ceba8968dso3615485a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 11:01:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761588106; x=1762192906;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gfPIAz0ykJxRgruBtAUTEx9o9evpUFrEKqo1tOgYr2k=;
 b=n+dhqZhpr6amArxpF+ycmRl6wq2uqY6UhgYp8TnQrNnfOuJD5UmlAWq3MXGurjmmPp
 x5XH88UhZR1UEmk3aJ/zS6rAWuN2XsIOEdxwfne9Jro7JTTWGZ/PckH8ay6YdgfjNHhp
 JVGUhtQdk4Zr+C4+y+v00BtdzsACTbDDJmzhvZRXZ5fF90jlR7R2LeyLYt+B8HUMNs8x
 KvTswtxg02iCBrwZBklCg08X/dnAvqdVqfYu36BkatDipihe06wPPeM2Z5xXB/xHtXb8
 35D8lScdOuHWAbZUCcYNwUHAb5P31WDBgIga1VqKxa8u/59F8DqgsJJLZ03CJ5FPgBPA
 JFgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRYkDni15QZ6xLU/XOnXqoqx+ybrY39zliU1yG6OJiO8JfWqwxOQUGCHUGVT74FQYK4ajDdkDNKlg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNZ48t75bA19BKqOBdX7F3yfLZRO7Ly0yDB5Y8y6o5j3lFF6Ig
 hTAQwQRvIH1PfAV0EQjkNNAuaiV1AJ5ZH46HB8vzYavKT7Pf+97O/iVYqSqXY2W0mowsLHtL8lN
 ckI7vICkUxaqrZzLmTlXkqzj2y2EOaFgDk5pMU6d0sPDdXodWODecSqJxkJfa3OOvgXEJvQ4=
X-Gm-Gg: ASbGnct01QSDRDHGpBqpBvUDinSB2BKnfqVjES9UfJEbqy8r9oHJTXM3z/DyE2DUBPX
 hkjwTWMRhZFc7AdGH/U3dfr/TpMAvMa8M5yZ7WNm2rEuGhgdjmaYvA9cfYPLWCuhkWo56sMsKmw
 Ct+z1gKZUebaHIkJnF5GP/rmpOKdxLN/QwsQ7J9PxiIpxNPyYIe0lxP6yH0LPp0ujZCFqeyXljl
 uYZNe4oMHOYpZbKcHdFZI0mpJtxTWY32w5WO9SYqb33bU3jeRGOx2DNavRZAYTWYkxv6HOnpbqU
 rXZsxWjRI5PftcW3tEPOhFKjkLHANy6x2eYDBY3gJtLd50z202rY3dYeE+Nwc64loCWyc4LIc4n
 RWRnPk/s7xkM7qo1djiSw7F9Dp+sDYljy0prOTtp3zsDrJVwy6EF3
X-Received: by 2002:a17:902:ea04:b0:290:94ed:184c with SMTP id
 d9443c01a7336-294cb3b9d6bmr9729415ad.15.1761588105947; 
 Mon, 27 Oct 2025 11:01:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDJ4c2LPoDw7uJI7bAxqFS10F7ZY7lTryaN9QQDR+vt8dbcxZVVBo5JKZYFPDu9xFxUVPrlg==
X-Received: by 2002:a17:902:ea04:b0:290:94ed:184c with SMTP id
 d9443c01a7336-294cb3b9d6bmr9728885ad.15.1761588105368; 
 Mon, 27 Oct 2025 11:01:45 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29498cf35a5sm87962395ad.18.2025.10.27.11.01.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 11:01:44 -0700 (PDT)
Message-ID: <4f77d8a2-cbbd-4e4c-b58c-ae213b0fd01e@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 12:01:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/qaic: Update the sahara image table for AIC200
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Zack McKevitt <zmckevit@qti.qualcomm.com>,
 Aswin Venkatesan <aswivenk@qti.qualcomm.com>
References: <20251017173432.1207656-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251017173432.1207656-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDE2NyBTYWx0ZWRfX1RXG8ZuQukBh
 h1yzStuJ18B7wGKXrNIZX4yL9O3UlIdIx6R0fQmLdb0dDa37pejN1bp7E4EkUvuyHONMLWqpYPE
 p9IXYzv++RIUxQxl3NUkp8rbV/2QwUqEhP64uyOuvIqjSvTZhLu2BF1OEEIVwG7LNF2sc1MkQqS
 Ug0BHvD1gqRDMa//TzkO/dnln4dfFU3WbAgy5VcRJWeSqKlIUsSOoI0xSyqx3xD0GSyQJNzP3lv
 Fhss2NpHCWg1yy49aGnpqp41V+TwDLW7wSdMegzBpeYNrhOSmC0nytb3A71z8c2ldoqF9pLMKD9
 0GFmjSdm5+qf3un/xflMMWnfOqMtpVPP2dk0ybg4nmHpY5S//gZinOuZ4HkhuvHHvAfgf698C2V
 vNX8nhTkt5EoYHgWxJXhYn8Iz2iD1Q==
X-Proofpoint-ORIG-GUID: 1Mzxt_Q0DDVGWYvmuJZtCCQ-tx6GbBV5
X-Proofpoint-GUID: 1Mzxt_Q0DDVGWYvmuJZtCCQ-tx6GbBV5
X-Authority-Analysis: v=2.4 cv=A6Jh/qWG c=1 sm=1 tr=0 ts=68ffb38b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=QoCwUzDOKqydt9tafI0A:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270167
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

On 10/17/2025 11:34 AM, Youssef Samir wrote:
> From: Youssef Samir <quic_yabdulra@quicinc.com>
> 
> Update the Sahara image table for the AIC200 to add entries for:
> - qupv3fw.elf at id 54
> - xbl_config.elf at id 38
> - tz_qti_config.mbn at id 76
> And move pvs.bin to id 78 to avoid firmware conflict.
> 
> Co-developed-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Co-developed-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Pushed to drm-misc-next.

-Jeff
