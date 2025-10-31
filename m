Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1209C2605F
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 17:10:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E71510EBE8;
	Fri, 31 Oct 2025 16:10:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="E4a9SlnC";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aIUaKi95";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C78DF10EBE8
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 16:10:40 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59V9dVTB1418130
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 16:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oDhfCaLas3av++l6wCRbWmRupmbim+JRjVNXxtLxBgQ=; b=E4a9SlnCoEi18la7
 T5c99HFGcnd8AI9AzQvs+ZzHViRXFQQ+fLddOw7fbUfx0MFO2F/9K2esbCqxLHG9
 WWGp3YQdflKN6aP81ZaYgpU983eF2bxEsWJpRv+xkF6Jobm+xxP7Pm7I2fodNarF
 DVO3gXB5cBdiuSueBTghS2ipsvdAIrDCvEC8Dfx/iBjGcUESsiKUeHtVhzX3Z5SR
 o7U48WNjj4lol3dlgJxuJLcCCL0LKjMpePZZ6vpAvppUSyS7K53MHyyeUyuYSXRr
 /wi1XWp0D/KJIhi2ElvG6VVDmtQ79zUxPQKw5KrRP/annSg/+P2T16X+BaZiB7SQ
 Wj5yXg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4k69jb3k-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 16:10:39 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b55443b4110so1784717a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 09:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761927039; x=1762531839;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oDhfCaLas3av++l6wCRbWmRupmbim+JRjVNXxtLxBgQ=;
 b=aIUaKi95loG8jqW/WEzm1biEYElGs50S9aLWrRxz7nvMfOkT4Dp2LlrkY9N7M8Um0O
 Hke+0T/JeF82dpci22wWvvqFPCc4Iw6WF+LvkDoLvmkn3dzW6EiYssxn/wCB6euF3zqW
 siZTVXbex5uuCw/+K3oytDB0mwTg1yJW8lVheUFLS2mY5jbk4VQv48dgrNtRWWG3XEPG
 Z4vwbEhIdGuKaETrwynxW8hAR57kY6bOgdtctPFKTXENGsbzKrarjJ2fEzPD4a3gSAIR
 qqGgPNICxVS+FqB7/tXbj5+mXJ3q7/g1fXB+G9acPCQVOGKVE/w76VAG67sLoVA/m6RT
 qYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761927039; x=1762531839;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oDhfCaLas3av++l6wCRbWmRupmbim+JRjVNXxtLxBgQ=;
 b=Z+AnglzrND6CtAu/I9eow3tc+u1Wux9VwmwA/qxikrR3V27Yjvb7pv0VfnxUYQ7VUG
 AICS2B5aR70QvYVm/ijg+2OIxqSuSesVi5f0gqacT/1G5mttRApghFbrjWEizzW7jPDd
 RCjJTTprezwUozstWvFEPrFOyHRKZwqclDeb2uUXQPrsKCeW/h4P0BMP+IYobVRgC2La
 EJ8Fooh2U0wTZYtW8fwUqbyE7dg1YkUWLlka39YDJ6Czc897Lux/BNjV9T7uLk+xDhzK
 wiH1dybSZtOA6DAhO3S2TNOoLHiFV/ncrHAHGNDYaagLqeNvyuFHvJzFCx5boBKzCh9X
 4dMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzGznT85V2Te8vqcrGER5hTHbE+vP4EBOR2rRa6PUtUc9ezjU1Cd6F4D847yMEbCCZ1U54XI88Na8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOEYqnj/C5j9AmY+/4cdsxuq3Hl2R+vJc6uScIJb3QidLRn5kN
 cVKaZj1wsu2krI6/4PNEdfrHsGWTJ9VeoBowP1QDEazHZ1ssS2TzqYX3xc3/O4hnYEhu5yw6gxB
 28zgTmirbzxMAZccngTDvSoErubgiTaYaMNZ52NqE0GdraFN8sfOobgaQoNJ2y7U8NIobBjs=
X-Gm-Gg: ASbGncuvabwgj0aK7iuHGOlXWiMQRLuXHGM5c8lT81uv4rViY/KuBzEDFJ/yjA47rIZ
 4elSal2yX7dnMJkhsgiCPXN7yYUn0jmCdqeaeZGOuhHghPPU66csXjOU6zfefXflH8Lc8g79Wam
 +IJm7NH5rXRBupC3KIUqAhMafjTfRi+4YbsPXBCJsfmRrOQ2RWyyLvGmRZ0OXUsx56PPVsYfzl2
 AnfMgNZLETmv0SxN2rHn1ezt7u653Qv5l+lsTttzeaTWvEo9fBiM2Xqi5vJnxcsDxeXi6/4/e32
 xxZf6Ga+1BkkPGINmph2txoaATTl2A1dZ5I56OnQsQFfZdxjHfJh8dXzmFAi/ezIydoxIZeOvQz
 xZePl6Xk5Qnf/1q4ktg0AB/kh2VfpBgaAGPvr2G7ME5455cM1uAi6
X-Received: by 2002:a05:6a20:6a0e:b0:343:af1:9a4f with SMTP id
 adf61e73a8af0-348b7502e0fmr6416110637.0.1761927038651; 
 Fri, 31 Oct 2025 09:10:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfwVdhGXO4W6ccy+Gs7nhmHf0xQRAxLoFsaiEkVtoeW1Wt9oOjMi8+GReoMdVleuWYmKRYOg==
X-Received: by 2002:a05:6a20:6a0e:b0:343:af1:9a4f with SMTP id
 adf61e73a8af0-348b7502e0fmr6416060637.0.1761927038101; 
 Fri, 31 Oct 2025 09:10:38 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a7d8d71718sm2665414b3a.23.2025.10.31.09.10.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Oct 2025 09:10:37 -0700 (PDT)
Message-ID: <04645402-1e62-42cb-a8ff-3e5f8d852ea5@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 10:10:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Use pointer from memcpy() call for assignment
 in copy_partial_exec_reqs()
To: Markus Elfring <Markus.Elfring@web.de>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Miaoqian Lin <linmq006@gmail.com>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
References: <d154d3c4-dd3e-488d-862f-5361867a70f1@web.de>
 <ce252b99-c011-428f-a89a-5792f14c2eaa@oss.qualcomm.com>
 <2dd26f37-7a42-44b3-8902-5c6b5492655a@web.de>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <2dd26f37-7a42-44b3-8902-5c6b5492655a@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDE0NSBTYWx0ZWRfX7sDHyaR2lEBf
 OXZdQLPqQ9fT36/xm+pfKp380MSHhxYGfNN0w2sXNgXgFByFpriDg3tBStQqPrn+RjJeHmXZK6C
 VjbfCgfq7muiVXNcxCQZ0fe1DC2iAbswNmRIiL6inkAlU/s89PwNoOZmTykw9GLDBEIvps3X2Qy
 YoG8Gn0B+kx2ZhaclbIIcXYvfQjb48LICXsh6zUUlwTKHr4OfpIEUno1woCn5lrBzz4LWmisH/g
 AzJ0+QlkcfqDbfinu3GIgL8BD/O0Sm3i5N+qHbGI+7vlaYQY8xh6gcN9UkTQmNM4MZwgxv/UU2j
 /Kpp2nUpR/6Qkj35wbHa+SZLV08iU9V9LgTya2i14+TXN3RxrAC/wimMePIntxOBqLvRiS5rS3M
 8WaewRS2kMYgv2z61RN7916hYTdlrQ==
X-Authority-Analysis: v=2.4 cv=Bv2QAIX5 c=1 sm=1 tr=0 ts=6904df7f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=FP58Ms26AAAA:8
 a=ozBfHW6_ZNkyg7WjN1IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: rPbUIX1Od9mgEH02QTJbU-y99RQTNhSK
X-Proofpoint-ORIG-GUID: rPbUIX1Od9mgEH02QTJbU-y99RQTNhSK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_05,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310145
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

On 10/31/2025 9:34 AM, Markus Elfring wrote:
>>> From: Markus Elfring <elfring@users.sourceforge.net>
>>> Date: Fri, 31 Oct 2025 11:26:33 +0100
> …>> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
>>
>> This does not match the address this patch was received from, therefore DCO does not appear to be satisfied.  I cannot accept this.
> 
> I find such a change rejection questionable.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.18-rc3#n409

I received this patch from "Markus Elfring <Markus.Elfring@web.de>". 
There is no SOB from "Markus Elfring <Markus.Elfring@web.de>" therefore 
"Markus Elfring <Markus.Elfring@web.de>" has not followed the DCO.

The resolution to this is either the author and the SOB change to 
"Markus Elfring <Markus.Elfring@web.de>" or "Markus Elfring 
<Markus.Elfring@web.de>" adds a SOB at the end to show the path the 
patch took (reference the paragraph in the documentation you linked to, 
starting at line 449).

-Jeff
