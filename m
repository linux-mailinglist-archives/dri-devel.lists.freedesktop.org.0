Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12661AE9594
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 08:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE9010E835;
	Thu, 26 Jun 2025 06:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UoYQ+N4T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A195110E838
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 06:03:12 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q0DqGI031202
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 06:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zAw+vF31/8AdiO+erYtJscx3H3Rf6Jrg7lXaQ6w2fXA=; b=UoYQ+N4TKzXDaRem
 ZxZW0TxsMD9344z+kUc8ZkP0k18npFkuT2dYTehR+fNxXtqMpneI8vmBbCqsjrA6
 Hw8zMw/iJjT/WqvrejniApryT2kyC4CZHSM+1geMpG8wukZ/WJ/x/GemMHtV9xhY
 a68qfrVfSjDoAojM031WMduv7B3StNzThj5ZpEAGg+ZWoTjIuUeLK1SMnZVkk2JY
 NVh7LcJ4mjdAypZg3dHQ1hvK+4113I+ILIzgs6+HImL02aW9g9RwAA+/hADrIDG4
 UvPvJPxhMpi6l0bvRQWJn7bwVzAf63lHPFZ+nbyvaIlheXc889ncPlXXdqR5SjO4
 d3fIQw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b420gx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 06:03:06 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7492da755a1so555330b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 23:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750917786; x=1751522586;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zAw+vF31/8AdiO+erYtJscx3H3Rf6Jrg7lXaQ6w2fXA=;
 b=HjR5QJjjfUMcjlIWFBCvgLLZAiNsj1DlkF5/7P6+onNc0ZMiuwqvi8CTPJSu7E8YqT
 oJWgvK8ZvzcAqMBpFHrf+yRjD/KlLs3yqnARUx+FgnkbBMcuUK9honGLHIGzi+STDl49
 UF5xLZ2dMboHy6Oo6g1mScAtTPoQJwWnfhYzF66P6M9aIyp2o7ZKTNrPlg/HExg+EBWe
 X+WKyRFMpMnfBU2zd0K1oTNicGI9gZVWc0wKb+ePbpRdjtWt7Fc7WF6eXvCvbRg9//ER
 K/nAmyEyR/Z1yjX94FKUj0OEeNdQHlb4+sMpQKhxAKQFJVzkb1q7kaEToY4Sv9Ls5Yeg
 JJGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7ezrtDsBkubtMxoJguQuDHnKBFrg/xrbGz6goNhDcsezgzK1VUAKEqNLOUhbYN2UDf5A2epMWzlo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDs8QHWhF7Sl0QtEsoONWFWqYzV+5cDgtaCq7shQp03BJxJfaE
 uVzjNseGwBZqEeRheA/mVfdVTNsVYI6QgOp10Q/4it/BpYyDKgWIhToBx4zT6z3GsHRDZ2RYaeG
 d18oGzh3m+fYNJmLRsqTO1XsoTzxJwmeb6OftjMZ87jDhzLV2UVADFm0Cs4v9GEKzIDMhNtE=
X-Gm-Gg: ASbGncuem1eHzOA/tB2/7EILOS5M7z+BYAfQP5072yymwqgXIhKRNp9a+pq87bl5fLp
 ACxtR1pt+vV0+FHSA4E+AmFLVmBOTX7s6gQdKRgq1lgdNcok9z/UZVB/VZMVcLk5u9t/He8R3lT
 ICTsrfaAGy5/+egOIck4nhHLBbG8gxwbExOLaXuFGpWf9TvIBmp4gXLwAN/XXWVe3IjqofpFcdn
 iO81XV/YRXyQ7cE/L0+EOiGXDNooChznWMQ2q+p2lbKf/EzReMllXUpUj3+gYDOl6iZQzlNfjqJ
 0SmVAMGIR1c7lyXExv7FekJPz+aiXLnUOBngzwi6DfQaxiDk
X-Received: by 2002:a05:6a21:6185:b0:218:bb70:bd23 with SMTP id
 adf61e73a8af0-2207f35cfccmr9126434637.42.1750917785752; 
 Wed, 25 Jun 2025 23:03:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAZY2KhB8bCl/WbYS2FoCo2Ms0rCSvnA7RI6r9DuVu8+cXGdo4K/PTAhGks9c7EvtK428CXA==
X-Received: by 2002:a05:6a21:6185:b0:218:bb70:bd23 with SMTP id
 adf61e73a8af0-2207f35cfccmr9126395637.42.1750917785321; 
 Wed, 25 Jun 2025 23:03:05 -0700 (PDT)
Received: from [10.204.65.175] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-749c882f5b8sm6388591b3a.95.2025.06.25.23.03.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 23:03:04 -0700 (PDT)
Message-ID: <245d602f-3037-4ae3-9af9-d98f37258aae@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 11:33:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misc: fastrpc: Fix channel resource access in
 device_open
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 arnd@arndb.de, stable@kernel.org
References: <20250619051026.984361-1-ekansh.gupta@oss.qualcomm.com>
 <kk3jvlwjdzy2mfs6bip7dadrnsoxwksyp2odi3rfxkv4crmwtn@x5qyn4sp2gck>
 <2025062424-dizziness-theft-0502@gregkh>
 <2025062434-reviving-grumble-1e53@gregkh>
 <golcrcr6voafr3fqsnihyjyut36sii55vzws4josfhkjjg3nie@ur43qq2kvlsv>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <golcrcr6voafr3fqsnihyjyut36sii55vzws4josfhkjjg3nie@ur43qq2kvlsv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA0NyBTYWx0ZWRfXx99iYixv7GmN
 ibAdaGhinWkULrBsuJdY2hdArvzXA+uD7xdbrhjb/gLbd+fsWUqX61oL6r9VkHorf3vGg0x4DJk
 tmsMg3VveZ5AbxtFRawivpuR3z7ZvWbKgqQbwWC67MDCFkv31gUWNDjaTVcgGmYgZ/qrMfARl8R
 Vp73kNyPmMF6YR39EXzMwqTL3ma07hGricp48QL4DWKyqqqk/gWRCM7FFgX+kcdnfO7ZVS+qq1S
 Kw3PhEY+TkIk9Q260FA3C6ShpLazOvCPiohAtia0fXTvSJx1oMzCII0QGCxDB61PqQbLO/MwCKB
 ERgaxrRauAfX7F/Kcv1AWMX6Ny+DlSqpcrTfKqmp+QU3n1dDN0NYRuTENQjUBJPRek+J2RmekGS
 EEwdDiAa2vtd2CGHz51oAZ0e8CSFY+y6YI0iWRnV1RXdvQ4uORpeL+xZeHAaVpUpxmdN0Uo2
X-Proofpoint-ORIG-GUID: 9zr15YIJhsWVPjlDsVK2e25X7c1GC_oe
X-Proofpoint-GUID: 9zr15YIJhsWVPjlDsVK2e25X7c1GC_oe
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685ce29a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=A2EB1aqQ-V8H35JDescA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260047
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



On 6/25/2025 5:15 AM, Dmitry Baryshkov wrote:
> On Tue, Jun 24, 2025 at 04:38:25PM +0100, Greg KH wrote:
>> On Tue, Jun 24, 2025 at 04:36:35PM +0100, Greg KH wrote:
>>> On Tue, Jun 24, 2025 at 04:27:21PM +0300, Dmitry Baryshkov wrote:
>>>> On Thu, Jun 19, 2025 at 10:40:26AM +0530, Ekansh Gupta wrote:
>>>>> During rpmsg_probe, fastrpc device nodes are created first, then
>>>>> channel specific resources are initialized, followed by
>>>>> of_platform_populate, which triggers context bank probing. This
>>>>> sequence can cause issues as applications might open the device
>>>>> node before channel resources are initialized or the session is
>>>>> available, leading to problems. For example, spin_lock is initialized
>>>>> after the device node creation, but it is used in device_open,
>>>>> potentially before initialization. Move device registration after
>>>>> channel resource initialization in fastrpc_rpmsg_probe.
>>>> You've moved device init, however there is still a possibility for the
>>>> context devices to be created, but not bound to the driver (because all
>>>> the probings are async). I think instead we should drop the extra
>>>> platform driver layer and create and set up corresponding devices
>>>> manually. For example, see how it is handled in
>>>> host1x_memory_context_list_init(). That function uses iommu-maps, but we
>>>> can use OF nodes and iommus instead.
>>> Is this a real platform device?  If so, why do you need a second
>>> platform driver, what makes this so unique?  If this isn't a platform
>>> device, then why not just use the faux bus instead?
>>>
>>> It seems that "number of sessions" is a DT property, is that something
>>> that is really defined by the hardware?  Or is it just a virtual thing
>>> that people are abusing in the DT?
> Purely software value.
>
>>> And if you really have all these sessions, why not make them real
>>> devices, wouldn't that make things simpler?
>> Oh wait, these are "fake" platform devices under the parent (i.e. real)
>> platform device.  That's not good, please don't do that, use the faux
>> bus code now instead to properly handle this.  Attempting to create a
>> device when open() is called is really really odd...
> The driver doesn't created devices during open(). It creates them
> earlier, then another driver probes an populates the data. I suggest to
> follow Tegra approach, remove the sub-driver completely and instead of
> calling of_platform_populate() create necessary devices manually and set
> corresponding IOMMU configuration from the main driver's probe path.
Thanks for the suggestions. I'm checking this approach.
>

