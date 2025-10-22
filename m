Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D1CBFD8C4
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 19:23:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333E410E81A;
	Wed, 22 Oct 2025 17:23:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AuVCW9pZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 192F210E16C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 17:23:16 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MFEsBE012317
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 17:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 h4HbQ9Kq0nKjjLfSvRhNm703ai3Fj0UHEOwHANMEM5Q=; b=AuVCW9pZzcRdkPFc
 ELCrmipX5ru1vyoAHhrz9qC0d0SRDmgUTL1/Qa790ieV8Js0tcJD1vnST22H9cOL
 oEIvKHUBEbrKd+vUnNEXY2xko7EGqp72RWyNLoReDSiTRBtvnj+nA8FyaAMfo9fq
 lHNgLO+U/nJiYp5e8M6I5hdEFu34lZy7AK5OaC3XPTmK/VE7e1Nj8Y3GBakzKkul
 hoCkOEnLHtZiljf2OL0AVPaMFwGcs1H/xAyBA0lcIaFJDGv0JlOa5yDXNEgqBuJW
 Oo0hh8IVSCVajI3bAH1/1n6ilxn2u0bgclujUdAyVxMgbRXVPoi7jv/IGHlgcjdt
 YM1beA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0kc83-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 17:23:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-286a252bfbfso184138025ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 10:23:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761153794; x=1761758594;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h4HbQ9Kq0nKjjLfSvRhNm703ai3Fj0UHEOwHANMEM5Q=;
 b=b7FcFU2eaWpne7Z4lrHl6QrOli8M75E2ei1NBnH4+NUH+QSu3InWFMrr2FjN55QaZ+
 TpEFrFm7K4GHbUUEQfN+n+CEPnEnJZi2xT3buFijmDIRxot1T/WRukGUPkbWlK95P3iB
 XMAvHY0jskpyh0dQeU3K6JqAB2XeyTpiMk/U8dpus401QmHnMAnBFaTKHIbK+9gRE2CL
 akF8yJaXEYvtSsuf7Lex7kl18Xx/Rc/ShGlv2+z88kyMjHqzXtbq9m5FqhaM5ldwQbu3
 gJxqUEkbnZjD3eXa0/ibbudRFtcZJoENFUOc6kMi8VpMtXeCJxs7M5yjVAaqexALEJsS
 XVuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqhA3pscJeQ16q3fXrouyp1qcTEmmInbFHXmre5Ot+SaAdKqF4uqMQXzjV4wKpvJHzkRnVNHNCuAQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz49Z6k8pyFmehabbQizDjYS29REBZm7l0AXIz7i6tPNY+fynuY
 gBbtiZGsX9PK/He/FqrNfheYLb5wVfEYxmt6Y1Jt1K52V+vGSUMX7wD9Pk0i+K+e0Abxbqvmnhu
 D10WneQ+0Tk14mOC0AbCWuPTmEGgwYfdO1LuB0qPKCgKhvTD3gil8j+Sx5UD1Ej23pwutH+Q=
X-Gm-Gg: ASbGncvjJlKd+T3E+08jAeudvhIjJVNtNsu31Al2saXRR40i/qTAIlOHiCg/wmd9xr+
 pYsgxem1KyUhMUqhFADS6iT4v05ydt3PXgJ1Km1ZlDKBpYPc17c6v+iY5JKUVSDvw9onuNpDGFb
 QMMXf4q+ij4JXNjrBgQS0W0lz3ZXltPSf/FsZmKYW1MSr/XKCj69e+6VfAc8a+QpIcGAfPTLzpP
 vjqT3nA4JoeGcJG9TlEMcWsQ9Nw32bbPJJHQaopAm1GTHJjKRRv4Jz4MlfCySZHce17qkFtjmg5
 5/Alesbc7LshpCMMX+BhPHA23/LKbV1YOhG5Lb4QroGqLgv2SZhe20qEczOUmMINnne8zEt3iuN
 V9Sf/gPibMLOoyq3UWSooWU9sTVtUtaBr6uxhL266elTQAIs8al4Kj+E5Cyb45w==
X-Received: by 2002:a17:902:e849:b0:269:63ea:6d4e with SMTP id
 d9443c01a7336-290ca121e0amr252436675ad.37.1761153793764; 
 Wed, 22 Oct 2025 10:23:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKt4p7Xd8bh5MzUXllIZuL70U1L/6951/46Q3Ga/8lJ9Ptko1Mzwjty0oBFlVYmlP4mRpE5A==
X-Received: by 2002:a17:902:e849:b0:269:63ea:6d4e with SMTP id
 d9443c01a7336-290ca121e0amr252436335ad.37.1761153793347; 
 Wed, 22 Oct 2025 10:23:13 -0700 (PDT)
Received: from [192.168.0.43] (ip68-107-70-201.sd.sd.cox.net. [68.107.70.201])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33e28ec1b20sm2558979a91.1.2025.10.22.10.23.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 10:23:13 -0700 (PDT)
Message-ID: <dbfab86c-64c2-4f20-a15b-adc3757bfc71@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 10:23:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: rename constant for clarity
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 jeff.hugo@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251022141606.3740470-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
In-Reply-To: <20251022141606.3740470-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfX6RXb4FwmUYO5
 nv2EFRdNNLbhlqRd2cItkLShER+UvaCPh5iL4ZP6uZFR5iLoKZCioDPiYIaUvv2VbtC+AXnMvqB
 NaWsH2IgoieCHymoRm2NV1v6C8d5Lbnyd9RJtZDnwcDeHHKcZb98IRPChAVwtgyu12bRhZ6gy39
 G3nOZSEH1zI21kUJTDyiqaTVaOpXLmFv6NgjjMjNIwejA7gnH/aeuKlTwZ5WRwcji2OEN4LHyj8
 00EfzYexOk3r4p6Kg5O76XTgxoSJE2jADxQ3yEwjEgnpRUH4uAidhYCtcrL6XeaVYipJFSTEbZV
 2a8p2quKeX+LfQLWUc0tOZDBVNT4LNsV8PA2LyljCP+vzLC0rL8KwJQpiNfUPxaDn6GrI/Qp3Xd
 TDr+jF3htIgvfegZ4n1V5Fzwg1mfkg==
X-Proofpoint-ORIG-GUID: GQh9J-Ao7EJqr1__fzclv-CL693h-_pM
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68f91303 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=5tLIbcgRqjftBxpLK6l6Jw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=f2z2pkWm2ht2ZSlzglkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: GQh9J-Ao7EJqr1__fzclv-CL693h-_pM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167
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

On 10/22/2025 7:16 AM, Youssef Samir wrote:
> From: Troy Hanson <thanson@qti.qualcomm.com>
> 
> QAIC_MANAGE_EXT_MSG_LENGTH is ambiguous and has been confused with
> QAIC_MANAGE_MAX_MSG_LENGTH. Rename it to clarify it's a wire length.
> 
> Signed-off-by: Troy Hanson <thanson@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> ---

Reviewed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
