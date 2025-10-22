Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4077BFD377
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 18:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D6F10E807;
	Wed, 22 Oct 2025 16:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="E6khpsQy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC4A10E807
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 16:30:52 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MA8X3l002484
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 16:30:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UVExzC/ZCldcYzHdZY/GkmSX7NUaqTgV3yEbwJDlx0c=; b=E6khpsQydcbAEi40
 zoafvNR9ktTHOR8zf7JsDSjupDet2ik4ZOKBJIsEpZVztICNanQQLUxcxo5lZNLZ
 FuBA7G1OlGkXlDALhK8uC9qyAqaSd4wp0SjY4ViiP2fdI9wJaz3zAhxWcusHNJT0
 mERFRU+kG4v8Oj2ITg9nmOmxD/v7ylNhz3cx7pny/1cVhCm+I8BsVGbqR8Xpswf6
 dDwC1TiL0wqS0I6Sc2uAb7fVg29N30DB+q6F8YTMvBT73SFDq3mSa3yGSy/xV+sR
 6jlvEBm0w79AcXVy1GSwtVLqfeSW+aMZ3fLBQzZ2Wvpt6VIejC6PUKjpuOi7HE/b
 oQYSnw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08wayy6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 16:30:52 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-87c19c8393dso23894726d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 09:30:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761150651; x=1761755451;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UVExzC/ZCldcYzHdZY/GkmSX7NUaqTgV3yEbwJDlx0c=;
 b=j8T5+c57VBO+s28MNRvZz8/qmCYdkCNDLFEr+79wgV1ugTw9SEbpvCURSRvbPZ3ZQz
 3FOTVqrc4DqVpFQR8978/7WW1jmN5pHGRWJY/70jolO1JN2xoqHQ059U+2OI4yICn85h
 ykUwxUTSumPXwuc+rdWipNn88zRa9/+tdloIv7xHfOlsSK9u0XKdvLNRcx4X2FaV1QmT
 sypIcSFE4SUfGKV8PF5cPKwbKoCDthBKGXYGuHavi62gB0CpnqGa1Lk4oLn9c+JZkAhA
 IadiTk1c5PGAoqC58Fca43p6dxbYC4xmGQNZVyjoaj1EKbUgpncr/Uw+bDvGLaAqnp2u
 wYMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdHyPvxGp6MKfIMBbyOJnqcQYO+L6mvzW2LS8Nm3CY0LueN1OiyAZW7NcnB8IEPVnpOI6coCxQZ6Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8q0TRFpNfjfDMhoRsBA0hDgzuBLCxqDRzwZsUjStfxbLM8XDu
 V+znMTepPp/SDybATNBjI53u6N37jjkxXrb0i7GE2/TWn9VH2nFj2XTywUafzl6E8RHDfcCnLPW
 X/jOOUZXVxBLQpIhsNvdrkcLd8kGElcfnPSu2DFY/4eXnueJJtLc/t5XojvUsjfyPtTwKRXo=
X-Gm-Gg: ASbGnctjC2G1oxZ1qYiqDSm+8DbsKPZNfrhFtoKi5cb5+Ck0QrYK3NnplSXRvi/RxD0
 NMLgDaQjQTcXU16Kn0Y5p62O/cU6CHviLjM8uYJYiDc0o99pN20x8mmNbrFkFpV8ujLxGoT3th7
 zjkERYBWkeraf1vzAjaw3YcuSqPS6qhjarcEoI1sqKhddAoDkptjbC/JtWixnRvdLaUgA381Sgf
 7YVJe/RZf1lg9yFEHjRPT78GgDl9SD3wIBIBoXZ/bz0binQLQcLeUmvVnW10GnRkS0ohDRFrDid
 Gb1OXMFUgjwikOr7/GMyCNuesalwbRC1MZTKz5TT7u66KAd2hQYyqpO7yCt/YTil3fGmdyBKyDd
 ZcTI2VmwBj/bnLm1/QQXzWwAAl+/cHXWE2Fi1MDK+r6M3dFMcI7eib8d7
X-Received: by 2002:a05:622a:199a:b0:4e8:a9f6:359 with SMTP id
 d75a77b69052e-4ea1178251cmr64395051cf.10.1761150650917; 
 Wed, 22 Oct 2025 09:30:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEu5byM9VPY0GokSXOTKlkuO/ePXSQsQWPpLZUvvK8N8S7OzCxNnNQq8bwkQTgfXEaXa53r3Q==
X-Received: by 2002:a05:622a:199a:b0:4e8:a9f6:359 with SMTP id
 d75a77b69052e-4ea1178251cmr64394541cf.10.1761150650310; 
 Wed, 22 Oct 2025 09:30:50 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65e83937a3sm1398041066b.23.2025.10.22.09.30.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 09:30:49 -0700 (PDT)
Message-ID: <8667f4c6-5d09-4ec0-96d3-d88c717a3d92@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 18:30:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Support the new READ_DATA implementation
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Carl Vanderlip <quic_carlv@quicinc.com>
References: <20251007224045.605374-1-youssef.abdulrahman@oss.qualcomm.com>
 <77abcd1d-ce69-42c8-9608-4a9557613d21@oss.qualcomm.com>
 <0514142e-b3a7-4d44-8ef3-31b3ce1ebc4a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0514142e-b3a7-4d44-8ef3-31b3ce1ebc4a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ERRcAS7rgMpm2UX-IUai_yUu3CKFYbWq
X-Proofpoint-GUID: ERRcAS7rgMpm2UX-IUai_yUu3CKFYbWq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfXw2yYrruKpkIr
 mJgMcGN39d7vPzgCPZGEBgomQ/ImyhH2Es8zlVcob1bO+LIe686Ly6yU1KBMKWfcX7qLqcqlcKR
 UPmBn/LRk+2rwyVSAITvVxRNAsE2m1myVwtTKrQ0YS9b2md6/aI5mElU34DujxCV+1aU7EwO8sC
 kYK8Q6vM59SUCS/UATLJupN692HevCQ7j5MQ7XWusCjxS6LboYMtxTY7ISL/hBsJgEegalw0woZ
 xTbzENtY1+bjMFYcncjPiUYrrkzSe6WLXMij2h5maTm8FF/5NfUSfhz4W/LD6cOfzp4kpUo5pZM
 AFVARuwXyRpGN9VcxbrTvkxHTsruddXCjR5j3tqF2IUMGopXTcFLX/VFD+Lzrr9XBNxCJXvCada
 cNNLZMOlrl41bXQVODmlQjCHZXdhAA==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68f906bc cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=V4hQleJxWy1ojOnldBYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090
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

On 10/22/25 6:28 PM, Jeff Hugo wrote:
> On 10/22/2025 10:03 AM, Konrad Dybcio wrote:
>> On 10/8/25 12:40 AM, Youssef Samir wrote:
>>> From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
>>>
>>> AIC200 uses the newer "XBL" firmware implementation which changes the
>>> expectations of how READ_DATA is performed. Larger data requests are
>>> supported via streaming the data over the transport instead of requiring
>>> a single transport transfer for everything.
>>
>> tldr just like reading/writing images in 'raw_mode' up until now?
> 
> I'm not sure I understand what you are asking here.

Sorry I confused sahara with firehose here.. The former doesn't have a
notion of what I referred to

> 
> AIC100 is the "old" SBL architecture. When the "current" XBL architecture came about, quite a bit of the components were rewritten. It seems like a different interpretation of the Sahara spec was taken for the XBL implementation.
> 
> In both cases, the boot component that is driving the Sahara component in FW will want segment X of the elf for the next step of processing.
> 
> In SBL, the Sahara component would have a specific MTU and break up the request (segment X of the elf) into MTU sized read requests for the host. The MTU is negotiated with the transport (MHI). The Sahara component expects the entire read request to be satisfied in a single return from the transport - anything less is an error.
> 
> In XBL, the Sahara component would make a single read request to the host for the entire request from the boot component (segment X of the elf), and expects the underlying transport to shove up data until the entire read request is satisfied (Sahara will sit in a loop until it gets all of the data).
> 
> There is a bit of oddity because the Sahara spec says that the host can indicate an error by sending a packet that is anything other than the requested read size, but "packet" is not defined. The SBL interpretation is that a "packet" is the transport packet - aka the MHI transfer.  The XBL interpretation is that the packet is a "Sahara packet" which is decoupled from the transport.
> 
> In the end, we have two different Sahara implementations in FW with different expectations, and both need to be supported.

Thanks

Konrad
