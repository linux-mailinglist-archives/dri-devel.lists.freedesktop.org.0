Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A5CB1AD1F
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 06:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B8110E10A;
	Tue,  5 Aug 2025 04:27:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kThrxO3m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3914410E10A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 04:27:11 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574KQ4h6008000
 for <dri-devel@lists.freedesktop.org>; Tue, 5 Aug 2025 04:27:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oOc6z05PE+JQqEEqbcSZYn5GdoipElasSOcBl/QC7mg=; b=kThrxO3mtDNyptln
 ENj7Vn4UHb1q8h4R/1TPBHteW6nAWsKccbCxgqx3M2Tsp5BF4lbQSBXdzn7Y8CvX
 unP4tP0f7Eg8v9agYfX/RG4oyuQLzYthdK/1fTVj1Dmgn2zvDqhovuJL+k4ZlIQN
 l65RRm8cSYq7nQspXUEBeRnUflH/zkRDomKPWp9LrQhQGNVwtM5pEhUipo4AXWUr
 Z7Jw2K2YJI3/NRya0dPmhBGmELtQy4/iCNm56LtqumsWlbB09EjccwrVPXSlt3pe
 CIA0lIWAnYImH0wM/Jbf6oMIYuvZC1xMWW9ArpYQaqrKIzlzmK1fo3y5k8d0O2S3
 Z2U1Qg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489b2a70mx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 04:27:09 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-75e28bcec3bso7242739b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 21:27:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754368028; x=1754972828;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oOc6z05PE+JQqEEqbcSZYn5GdoipElasSOcBl/QC7mg=;
 b=MRXGi1lmUX7JHoUjHsS+/zfAus3Q7eIA037iCoapflQvumk18D9AYiZWcyD6VzFYBh
 PzXDF9oDc73MX8rYIa+NKMcUg0h+/vN15v9Ckic6hWEc0FF/LNz5voRVC4z0HXoyPGDF
 eKySXWpTu4Aq4D4bbwE8fQr3ko/bH7xj//XVjxD9OIKSu+fKPeqmqN5a4D3Mf8UXBvJH
 tfc/6yewmP5VYPeCwXHfBPVcGjtt3rvul/9IJCS1WheFVAQiAjzxgntiBDyoYVOC29wx
 KKWlsjckdRl2lft1Zuj98IuNJLy6ylCsSfc0OjEOfKIf06AMIDqqjg7atXLCqnsuOruo
 3Bug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuJRP0sI0G2e3Lo33KBCaHEpzPdXswGgtHony+r8fqVL9EGo9wxXN1sNixTGjoPt17XozGu5MdP/4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+cu5cYtab0BujIWf+RktnAJsQ6RxaASKWks6U7tSzIIgBsrV0
 Vmltmw3RwYyC8MI5Ucv/udxiaNZkwtYYwiP/7IXXKvhBYXJNxQlXGY+sVbfeAyn0HqzPhnyKL9T
 Rc0jGDvpNRKeaz5XVH4u/FY7QlIAFrTd/tFpefMoq7aSYfR4Wnmg6Egz9wiZEelXuOIn/7J4=
X-Gm-Gg: ASbGncvor5L7uxNun0qMtNnYOqYXAGfl6rR1h56tLRlPZ7mkrGkXKLh6fI3UuwZoLTE
 LgrnrfMkth6Z2f4MIGw1xsBTnRIahV/K/oaJ9lECRZUDFoU7/buw1V34gInWjEojNe5Gc5nn9tm
 ys8psnGng5EeTPiBCwIgo3zjNJfJpuIdG7CvMN2oJTvx4Je2C4M9qxCEjyxGNHLIDlyq8lJRM6g
 jUaVJRt2zgOrXLZ3wTeNycq/evD7NgzoZuEjx1otbftoxYn/SUmTeU7+r6P73h+n4/QOLWFqFY4
 Dpg9iD0wFb1/mvWEwwUyth3Y8BQrlNMzUPcMNFz8APKmHuEgCDtTdGTBDv8=
X-Received: by 2002:a05:6a00:21d4:b0:74e:ab93:422b with SMTP id
 d2e1a72fcca58-76bec2f304fmr16590734b3a.4.1754368028321; 
 Mon, 04 Aug 2025 21:27:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFw0pS+Af4/vl57IxtwquJOBQTfIqG+DV8SuowUeMiLkLhA25xCUY8PxbXrQoBIQT63gbcfpA==
X-Received: by 2002:a05:6a00:21d4:b0:74e:ab93:422b with SMTP id
 d2e1a72fcca58-76bec2f304fmr16590676b3a.4.1754368027830; 
 Mon, 04 Aug 2025 21:27:07 -0700 (PDT)
Received: from [10.5.16.15] ([14.99.203.242]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bccfd4893sm11746425b3a.107.2025.08.04.21.26.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 21:27:07 -0700 (PDT)
Message-ID: <3e880194-5ac8-4056-929c-ac103bedc737@oss.qualcomm.com>
Date: Tue, 5 Aug 2025 09:56:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Add Type-C DP support for RK3399 EVB IND board
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20250729090032.97-1-kernel@airkyi.com>
 <3kefqzjewmsyzfvyi33kvlgjd6jphjg3fsnixb3of7yb3xkgs2@hgi6xfkgd653>
 <63ec11cf-7927-431a-995e-a5fc35ef1ba7@rock-chips.com>
 <pk5wecbbpxn7v4bdwtghhdnm76fmrmglelytljwfb4cgvpu2i6@rk5turgyt5xq>
 <0207826d-a987-4464-b306-29bdbfac45bc@rock-chips.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <0207826d-a987-4464-b306-29bdbfac45bc@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OKwn3TaB c=1 sm=1 tr=0 ts=6891881d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=BCJAbJEDZziWQyy0sFgk6w==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8
 a=lJfCAnFZCnoPuUJW_CAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: Vs3uOfRLhh_jDPjJRf14AyeuwPYJasCu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDAyOSBTYWx0ZWRfX+N4J0Opdtki/
 OOpu8cWjzlizrsst8yn0VM6ZfniWRmOrgA0Jjv7qGVqaLKRDBV9roIUza8beYn4lUy6d81TVXfu
 V0PwggbCFJU+pRP6pO6UH0j7PxfFZQBrPAKC1VjJpXznx0UQmgss6HIGoYWAcSuwQz8V3BrC34G
 zpC2OytVS1nWsY69r1RiS8c7RIVId3sFIqKSKHg3vT+MPghpPjDI0wSczJarF+dUWh6P3vyWEkC
 /5GqDt2qhUuIVIEGlV5JDrQ31apXRjYcaARtro7rfI7L32KfP6V2mu3sPNMT53g3ZGGPbX/8KUX
 tWA3GD3i4emkrFgkHZ2b63/kGWfuyP+q0s+8Qc7gDZRWi/3JCw5w0C5n7uoKWULO6bMJgrg0Ewh
 KuEv+DdaENjzbw/+DzZHLgvFEK1ju6m0c7Scu8VSIDz73B175LJEDbSID/iIxHpbFfIi49eh
X-Proofpoint-GUID: Vs3uOfRLhh_jDPjJRf14AyeuwPYJasCu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_10,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508050029
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

On 05/08/2025 09:13, Chaoyi Chen wrote:
> Hi Dmitry,
> 
> On 8/2/2025 5:55 PM, Dmitry Baryshkov wrote:
> 
> [...]
> 
> 
>>> Currently, the software simply selects the first available port. So 
>>> if user
>>> plugs in DP dongles in both USB-C ports, the DP driver will select 
>>> the first
>>> port. This process is implemented in cdn_dp_connected_port() .
>>>
>> I think Stephen Boyd has been looking on similar issues for Chromebooks,
>> which were sharing DP controller between several USB-C ports. I don't
>> remember what was his last status. I think there it was easier since the
>> bifurcation point was the EC.
> 
> I think the latest progress should be here: [0]. It seems that it hasn't 
> been updated for a while.

Might be :-(

> 
> [0]: https://lore.kernel.org/all/20240901040658.157425-1- 
> swboyd@chromium.org/
> 
> 
>>
>> I think, CDN-DP needs to register up to two encoders and up to two
>> connectors, having a separate drm_bridge chain for each of the DP
>> signals paths (in the end, you can not guarantee that both branches will
>> have the same simple CDN-DP -> PHY -> USB-C configuration: there can be
>> different retimers, etc).
>>
>> Both encoders should list the same CRTC in possible_crtcs, etc. Of
>> course, it should not be possible to enable both of them.
>>
>> This way if the user plugs in two DP dongles, it would be possible to
>> select, which output actually gets a signal.
> 
> That makes sense, but this might make the DP driver quite complex. I 
> will see if I can make it happen.

I think it's trading one burden for another, because CDN-DP currently 
has a complication of calling cdn_dp_get_port_lanes() / 
cdn_dp_enable_phy() in a loop rather than just enabling one instance.

> 
> 
>>
>>>
>>>>> BTW, one of the important things to do is to implement extcon-like
>>>>> notifications. I found include/drm/bridge/aux-bridge.h , but if the
>>>>> aux-bridge is used, the bridge chain would look like this:
>>>>>
>>>>> PHY0 aux-bridge ---+
>>>>>                      | ----> CDN-DP bridge
>>>>> PHY1 aux-bridge ---+
>>>>>
>>>>> Oh, CDN-DP bridge has two previous aux-bridge!
>>>>>
>>>>> Now, I try to use drm_connector_oob_hotplug_event() to notify HPD
>>>>> state between PHY and CDN-DP controller.
>>>> Does it actually work? The OOB HPD event will be repoted for the usb-c
>>>> connector's fwnode, but the DP controller isn't connected to that node
>>>> anyhow. If I'm not mistaken, the HPD signal will not reach DP driver in
>>>> this case.
>>> Yes.  What you mentioned is the case in
>>> drivers/usb/typec/altmodes/displayport.c . I have also added a new 
>>> OOB event
>>> notify in the PHY driver in Patch 3, where the expected fwnode is 
>>> used in
>>> the PHY. So now we have two OOB HPD events, one from altmodes/ 
>>> displayport.c
>>> and the other from PHY. Only the HPD from PHY is eventually passed to 
>>> the DP
>>> driver.
>> This way you will loose IRQ_HPD pulse events from the DP. They are used
>> by DPRX (aka DP Sink) to signal to DPTX (DP Source) that there was a
>> change on the DPRX side and the DPTX should reread link params and maybe
>> retrain the link.
> 
> Sorry, I still don't quite understand your point. I think the entire 
> notification path is as follows:
> 
> Type-C mux callback -> RK3399 USBDP PHY -> PHY calls 
> drm_connector_oob_hotplug_event() -> DP driver
> 
> Are you concerned that the IRQ_HPD event is not being handled somewhere 
> along the path? Is it that the Type-C mux callback didn't notify the 
> PHY, or that after the PHY passed the event to the DP driver via the OOB 
> event, the DP driver didn't handle it?

The IRQ_HPD is an event coming from DPRX, it is delivered as a part of 
the attention VDM, see DP_STATUS_IRQ_HPD. It's being handled by the 
altmode displayport.c driver and is then delivered as an OOB hotplug 
call. However, it's not a mux event, so it is not (and it should not) 
being broadcasted over the typec_mux devices.

The way we were handling that is by having a chain of drm_aux_bridges 
for all interim devices, ending up with a drm_dp_hpd_bridge registered 
by the TCPM. This way when the DPRX triggers the IRQ_HPD event, it is 
being handled by the displayport.c and then delivered through that 
bridge to the DP driver.

-- 
With best wishes
Dmitry
