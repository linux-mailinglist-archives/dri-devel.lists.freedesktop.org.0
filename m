Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A64BC232D
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 18:56:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6647910E6F3;
	Tue,  7 Oct 2025 16:56:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hPkjPhNw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B13C710E6F4
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 16:56:29 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597EjqDj011061
 for <dri-devel@lists.freedesktop.org>; Tue, 7 Oct 2025 16:56:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Xj0bCeFa5Gd+90grvrhkEam+EB/Y7rRFAUz956EmphU=; b=hPkjPhNwQz1JN0Et
 TyLybKO5NEa/786LuPNKmikbV2A70PhJ0b6+uRuqKtJSFOP+PNcBbyax3wmGSmie
 w3kOYfw45PzvNyCBwQK4jUWyeU0MsIszjz/2zFLtSj/alUaSIzEPPQSAxFbcV0EJ
 ///yxHiWk0KZPjmE7iMcbdeW+2+7ivWmvOhPNiDdXD2TZTJagR2YtYam9aGR5dfv
 XV0Wfk8gNtEAKj+AGa/7Nj+ZA9tWUldBRLXH74vX09zfjSCvhGe9c5eRgYArvO+p
 tFego89QUflcPnbWfeQAvwe1z5aUP4N24nt3KW3+6HtOYCNegN/ahjYM8aBbD92M
 naK16A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49n4wkrdf8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 16:56:29 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-780fb254938so5248652b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 09:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759856188; x=1760460988;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xj0bCeFa5Gd+90grvrhkEam+EB/Y7rRFAUz956EmphU=;
 b=jpW/UFJS1IonmuoBKC31/YqcePxmtsq5VQxlP+1HkUw8CqzmiC8tRJnrT+drwPByRr
 XeTvmBZniWbClWuNilkEJV8YwEhmBExccire4SLvezOTlLTz4HDRpAz2R1nc1HARRsVM
 2sPJn484hIFmT6wTLWXGLCm1tH3GGwmjFX03sPq5thkyfb5gvINX4P9Z3MvP0ROHw16t
 9WyvaAlRm8LKNIfcSMtrttdaOp98s6IzG0p82AeciW6KncMGrJpOG4uvieUhm6A4m5np
 lDLFYI3g40Jww+plMqnolkI0VWqvqlSlIVeuMdKS/iwnZk9gyPfVCeIihzR9TJzUk4MZ
 A2cQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgNYhskiaC7cZ0lWPT1iUnuLCi1ZXIx+Ef4E5dgQvKPXJMDztp7POxUMFyjnnKOah+JHsCzYgeLoo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYuncqQEZhiZ8+VsSQ1myWr8AeE/M3d8l9lr+Sw9F69HTl81IM
 Ajk00wawGNescnFMrruww3bS/Rb2duMA1dh4QObLFYRZO8DYU77ekJfBX5YFSAca9QWua2mM+r/
 3A3X2KNTMYQPYSyKnXOyW295Tw5QT3QFfJstG5nSmNX6CeS34Fc1aftlUc5NnFjqq30SsyRY=
X-Gm-Gg: ASbGnctr5PUjVSB9FO7C6xLhXn+h9RLvtpcyZX+OheqJOeynK2mzxfm1vux8UJJ2MdA
 bF4jiVZnik8DFlmQGKeTy/amdYrG/5Q9rA6b8VBAZb6nf8aM1Xo1t/zFTmSq2/tSK3yYqLr3OKo
 DINQx2NHBlQfaLgEP/4TQf5EIE6ajg7xfx8eyl0wIXMRZyD8jqOi/qoxmS3xw44LN7URQOyuulx
 K6/m9FAgzKVHZd6rvi4k0ZReYkHwBEQWygmKDDdSaHSsF3kHdORkYewU9B14zVsZPYm/it6tdu+
 w0mTLmLST4oq1aD33HuOjpZKu4a7cp7u2+Sd0Fv5FaU1jTQ1m29dBOFGyzyqciEUZZ5wq2JlTXz
 IqEcxFnkptZGFtrJs5J4=
X-Received: by 2002:a05:6a20:6a2a:b0:2e6:b58a:dde9 with SMTP id
 adf61e73a8af0-32da83e59f1mr322620637.40.1759856188229; 
 Tue, 07 Oct 2025 09:56:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6jcZsIwr0116rypVqpIXcuiblJ44Zbn8/iOBv+jsI0REI9Mgb0n4FtlA8GegIQgpOShaKrg==
X-Received: by 2002:a05:6a20:6a2a:b0:2e6:b58a:dde9 with SMTP id
 adf61e73a8af0-32da83e59f1mr322569637.40.1759856187684; 
 Tue, 07 Oct 2025 09:56:27 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b6099af2deesm15681209a12.12.2025.10.07.09.56.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 09:56:27 -0700 (PDT)
Message-ID: <12b5d459-946c-4626-90a7-928e705896b5@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 10:56:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Add QuPFW image entry for AIC200
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007161733.424647-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007161733.424647-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDExNyBTYWx0ZWRfX5Frt4QcoarOi
 KwFUDgTID03h7rYc7G8LlAW87sIuIDFRIiL36HbgnOncy2hF92xSJw4XtJdCE/RgjkKfa3Rh317
 +hb+4xhTOiq8Pr2TA1P35MpYx+rfqDvLv+Es+FhaKvg9hR9BqELFLLVPr9MvIBqiVLDBTtn65iz
 1Iv8oJA9CyXpipFt0JHvK9nH5VoWIxpalHVXMBOH4zeCm1L3oh0gvAQ4Ml5qMco7iVUjNLL8UGM
 oyVDLeDtxAPl+aHQXubPCVGM4KW22ltb+DwE1FG+s+BKDjwhlz6ileGA+oq7NQY9VAgS7pj4bDr
 s5AtQ7WKlc1+REGqi/WBh08RigFh8VXRYd0Cd5kz+9EDcjZ9A1j4kvJGdnRlYU2f/1YpVG5V8ni
 H5gnyeInmAZAeihP2iCzjn4FQLufJQ==
X-Authority-Analysis: v=2.4 cv=BP2+bVQG c=1 sm=1 tr=0 ts=68e5463d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=5fljqs_j-1MQuW37vUkA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: JS-avjbH2eHl4H-hLlY1V-tYk-GZxxqi
X-Proofpoint-ORIG-GUID: JS-avjbH2eHl4H-hLlY1V-tYk-GZxxqi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510070117
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

On 10/7/2025 10:17 AM, Youssef Samir wrote:
> From: Youssef Samir <quic_yabdulra@quicinc.com>
> 
> Update the Sahara image table for the AIC200 to add an entry for QuPFW
> image at id 54.
> 
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
