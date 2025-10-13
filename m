Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E53CBD6BF6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 01:34:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF5DC10E509;
	Mon, 13 Oct 2025 23:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ASZkRqzq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C43DD10E509
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 23:34:00 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHDT1m016735
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 23:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ns8DmaMxKM88jNPuqvXlj9sxBNI0TnXoXLNFqhX1m/g=; b=ASZkRqzqfoivc8wm
 DkHRpTpQwD/5O+9QDLMgSJSFty3gyHbR5XCWq3EwpsYbQhOX20WWjIET5ReZpvG7
 4O9tGR2AlFIBP2VIWrLSEcyLSnzGJTE9mNsYTregvhYB2U7cFSzqxMzBvkO6Sx+7
 /up3be3VRy8N4RtqMGX6UQAz7ZEbSFHsEJVNAVkVWIBa/JCRjEzMmrUJtbJmR1lm
 GPtpGVyzJ+H3ZlfWNyJa/zx34jTNz/1/YuEV58S1DMOe/9an0OdqLSvXnk2fbQY5
 40nb81bd5bUwLL3LFwSLxLbn2wm80fL3YRgblJPNg6K0OLWJY9ipmI6bhrasrHZ4
 h+PP6w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1aau6c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 23:34:00 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-339ee7532b9so24318077a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 16:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760398439; x=1761003239;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ns8DmaMxKM88jNPuqvXlj9sxBNI0TnXoXLNFqhX1m/g=;
 b=j0RaabMB1V9jLpGCoWy9USBcuROYysaMpEn1KTdKyJrvn1U5qecKcNoU/lXUChfyDW
 jBXW1pjpR7i6t/zygl+hgonabTeH6khaizHl9Y2mv6OIXd/gqk8UPR5G5UbiVRyG4TWW
 1vsOKWZmoPsdVcwet/BewzNu9up3ZcWYTzLhBuLUG2XtedKEfmVWpfQyF3qNxfxkCc/A
 KG0W+eRS9IfYYKP6uDNSke+hzwpeg+z2C10WLDiUPrVSzqkcgB4GTIxHO48/2QAr0+iH
 yedp27RsCDGaURE98hy5GnzjadUHPGAXY5nHz19UdKRSTqDmAakO7XSAFJ7CUbhhC0l0
 YCyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3QcTDcPyl8oStDLIQYDFhVz1arr/5OXeev4J6Ud6YhFfCn5foW3BJc+wK4FthPKCVCq4k2LIzMk0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8h0o0rXur/blNNlWgFZfkgbxGH8pUluJOpu2zxG7Do7bl2UVA
 mOHMn+ylFKqvZP/WHdG1Vnfn6zutoozPlObWNSzxDk8678bQqntdXHGQ2J6SNYfl+0HHF8+fgOA
 HE7O9OTf8tXS1XaqMz/MeQFLLYcRcl0N/1vFGkvjj1KHR5OqY5HGRE26i8shUo+flAjeYrKE=
X-Gm-Gg: ASbGncsHFT9YM3qc+fEJJx/gAF/gCYwbJo7yinyl6SSaqKC/Xng4EI94h9EV08AKveO
 Qi64LwTuP84eCaluC9fM9nDPlZtW0oJZbMZjxeYliTOTK6j9pByLy1H8rSX2czP5IFMKwsMWF7g
 +TbrL7etL3XqP56T4vJxaIAwYVvZVK9yasNfMbSMVR0Z0iKcSqe4DYovUDO/AKU1YARI4Q4upvE
 TWShpf4U85h4MVb9GPhMsjBJRWESl1bmW0eL0fN5juNsu3YJy60WspDqd5XDaBCGTD619SRGWzh
 ghpT2prAXccIkBrbCGX6WmkQaOua+KFYCdvpOgGoZO4H8wg618RLQjYCl4QOtNV1jfxzef4f+s1
 7//Fy5UQZeY02KDoBTw3GovAtsl4=
X-Received: by 2002:a17:90b:350f:b0:338:3d3c:3e03 with SMTP id
 98e67ed59e1d1-33b513a1fd3mr35444427a91.35.1760398439223; 
 Mon, 13 Oct 2025 16:33:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOG8Xmn6oBweYzW940qppsZEyZaNm919sf9o7zhUhkiZD8VS2+CVe/CUNRIwzVCDTFez10uw==
X-Received: by 2002:a17:90b:350f:b0:338:3d3c:3e03 with SMTP id
 98e67ed59e1d1-33b513a1fd3mr35444405a91.35.1760398438792; 
 Mon, 13 Oct 2025 16:33:58 -0700 (PDT)
Received: from [192.168.0.43] (ip68-107-70-201.sd.sd.cox.net. [68.107.70.201])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b61b12756sm13578133a91.25.2025.10.13.16.33.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 16:33:58 -0700 (PDT)
Message-ID: <cfe0db30-7669-4e99-a084-ff8aa06ff05d@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 16:33:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Support the new READ_DATA implementation
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 jeff.hugo@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Carl Vanderlip <quic_carlv@quicinc.com>
References: <20251007224045.605374-1-youssef.abdulrahman@oss.qualcomm.com>
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251007224045.605374-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68ed8c68 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=5tLIbcgRqjftBxpLK6l6Jw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=hMcU9Fbdl6L4-kwaL4sA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: GfNgm6ejvwOHsFcp20Z-niEnNEiHV_w5
X-Proofpoint-ORIG-GUID: GfNgm6ejvwOHsFcp20Z-niEnNEiHV_w5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfX0e7+QN5i+ZzU
 uQRoIaL8hC/mocE4UfwQK6SD5hRZe78YzDPe22S5Lji/AzCKixxHTiercp3X8A40T2xm/+Bfwxd
 54v33RNdHzBtt/TPN63+JsoJJWpDcy7dZ+7yd7KRNDcsOqEtQL3Tu/H//Z6bxbDOYfSVIcIu+/o
 SgilGIlw91TJ4nZHwaMZkubWf25k6dibrLu1H+wjK+fquOnCz5n9UKcJ8ko8Mh5MYe76DaDniLX
 4SNGFwa7KMdIffSAqazSsJgf12fBYi7Xzmi2WtuQPgP1Xu5PJSUgYPRAeU5WItQ6cjUWKE8Efvq
 T2f2TsIzP/9opH7gycorkE/iZYikNtMKoYZsZO2x3qYhb8597ej/p5gxfT2IbvsVK5y+0XTArZ0
 pj9Fw0d8j5oDoKOTSfle0ADLN7I1Yg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_08,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035
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

On 10/7/2025 3:40 PM, Youssef Samir wrote:
> From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> 
> AIC200 uses the newer "XBL" firmware implementation which changes the
> expectations of how READ_DATA is performed. Larger data requests are
> supported via streaming the data over the transport instead of requiring
> a single transport transfer for everything.
> 
> Co-developed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Signed-off-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> ---

Reviewed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
