Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9453BB1B230
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 12:44:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86AE610E264;
	Tue,  5 Aug 2025 10:44:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="D0/F8yS6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C7210E264
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 10:44:42 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5758QfAR031681
 for <dri-devel@lists.freedesktop.org>; Tue, 5 Aug 2025 10:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HQj3FZoctR5ZS2xg/dOfzXuT0Dr0fvmcc9XZPTdXy0Y=; b=D0/F8yS6/OcIy9ah
 7YaYrsXNvAazegfh/GMt3/QvEy/j3/9zjhmhDdSZN5eOoxX0//gOc93vmKCwwaio
 tuQrFNy8O1HrQHG+Ye3CNeQqk2LaLBk00aHITaNjZm9dy6BCLlC2vhe614Pgqm/H
 IsBydYHwgenHTj0I2Ffgd36qePbfRXGL34H7NhfPxok74Q5WUhg7qpasftnYSMPG
 dmQJO7tUjBd5FtDTP8CcORgTyjhKfOpWBJWxLmrxA5oNclvJjLAvJCoJPE7U8Md1
 iKB+ndNvnLf99f4CTyG4cDWhe9YRVij8SDgNTVpAkEC/M9eY1nlKQzoUc2CpNKqW
 JMxy1w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ak5a4whu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 10:44:41 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-70748301f71so88205156d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 03:44:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754390680; x=1754995480;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HQj3FZoctR5ZS2xg/dOfzXuT0Dr0fvmcc9XZPTdXy0Y=;
 b=Xh+2UtKOCYkImkiZQYqUQEhJoqS0BMf8KB+Qvaw1QHmnSQd03Cyuh9lQQqFz1tJGjw
 mJ5QCYFQW6N0+UyUDtHsCIQIBGCCYtiaRLn5XMb6jvFBNaOgnQmf8yLK+8i7ZnnBduYH
 K4AyzWE2Tivwdwb6ZNiEf+TNmuRy2g2oLv/pcrUjrJ/aTeWJQA7XVZLRt7XyEqbTnnN+
 u/hPYkmwWUHvzUC8eI2zabGRmk0GQNJQxy4SZiXVdtLylBiJ6z0a8wAuHGiH1GiR/rfe
 XgMqtzzK1GAvw9Y5blJSzzmW9BGOCZOwRuduvkCfneyd4sQ7gKmw/LR6DE5aGAfSFBRV
 KOyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxIVlkzqC0lfUah9EKFtbFZQBjZTkUhk18DL9QGzWTOC+LyBSIJXhTpTRjwx+vKESJL3KcdBUoUNA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywfdg3W7BhmQ2BTrKctyB6IMWtXbWbLEd7N2rjI6DsOEoOIUHta
 TmKUk0kwXVUj5sh2FORveHQ3qlO74CM0rSIf4F4je2xYuj/+mpjd5c+RURPxNX0Mq3LDG6r/J3g
 asoU+4HhZBCtVCakz8IMHkfd3hvJYbFedDWpPmyHxZHPBr3VDCZRwQ9iuPLHq8u3fSgoqamw=
X-Gm-Gg: ASbGnctRVlyj4g9ilMG5Z250QQv1mvl2tiIMOZpnCvg+VCa+Z/T7bIo1jGwZArIr3ZF
 1weS/GFy6GtfmleGK8miO9Wb1DpWRK850fZ002GrUA1P4JNVoCXyOyn7hdjOxgdQz9DoIDQbGH+
 c2dl549WZC/tj7ekitBw51vRe/+sNfGH0tgA83QqcUHyoUuCGeSoF3lje0hJxTzaF8hbwEUEPWu
 94nWcdYRmH62X2eaPf/hbjCL48JTy+Tnjb1fGQp4Prc6jufke623VnvZAoNRwrL4SNvQsdilHZF
 mSCKnkIio21aVLRYbPqYOsgbAz1l43sVDItpGvQ4e1Hdyaag8Jf8HL3ar8Cp8HV+7SkDlAqxr8C
 OgUq2+Z5mgWiyaLuBlhReHtmPV3F6XGeZNIxpG8z2tWoxCxRyjg8P
X-Received: by 2002:a05:6214:5001:b0:707:6425:23fc with SMTP id
 6a1803df08f44-709362430abmr166448956d6.26.1754390680319; 
 Tue, 05 Aug 2025 03:44:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+lMiAsbHz8RoaMN5eHDsdtapu2Nr4qMF3fZ3qhDMKzwzlcVX/R3oTueoOHY1lwn3LqnbIIg==
X-Received: by 2002:a05:6214:5001:b0:707:6425:23fc with SMTP id
 6a1803df08f44-709362430abmr166448516d6.26.1754390679809; 
 Tue, 05 Aug 2025 03:44:39 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-332389807eesm19601341fa.88.2025.08.05.03.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 03:44:38 -0700 (PDT)
Date: Tue, 5 Aug 2025 13:44:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
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
Subject: Re: [PATCH v3 0/5] Add Type-C DP support for RK3399 EVB IND board
Message-ID: <6nfmxwtwcvuyo2jaao7fele7jcgcykfpy7czbcbjmjxv7cs5sc@dmbtot73kw63>
References: <20250729090032.97-1-kernel@airkyi.com>
 <3kefqzjewmsyzfvyi33kvlgjd6jphjg3fsnixb3of7yb3xkgs2@hgi6xfkgd653>
 <63ec11cf-7927-431a-995e-a5fc35ef1ba7@rock-chips.com>
 <pk5wecbbpxn7v4bdwtghhdnm76fmrmglelytljwfb4cgvpu2i6@rk5turgyt5xq>
 <0207826d-a987-4464-b306-29bdbfac45bc@rock-chips.com>
 <3e880194-5ac8-4056-929c-ac103bedc737@oss.qualcomm.com>
 <f726862a-bd18-43ee-b307-8daef2451e6b@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f726862a-bd18-43ee-b307-8daef2451e6b@rock-chips.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA3NiBTYWx0ZWRfX0ra44AeTMg9c
 WTBVyHRdTUNzTU/AZwwVWfUAW4hRR9Mo31ClBIS1Rtd/Hp46VrE3sChY6ajLnCWobrkC7kDZnfr
 22eEgg89XnrKXOs1c8VLz9i0tNZ1BK81CalzvyjzTzpHnkDxBIg+PdywEdQALkcu1vrrrFtoute
 uBiVE8frXgZVJzQp4Dl/yg5mhB23+yhiY7U27yL/qBedp5CnKOyc1kPf3h1PRTEI9qj5EOBxORW
 E/SsPp94377BKp/oQY+Y5yA2uL8XFGBWn4RPhZ/UPixguDj80nEXGXAnU+Ke/gLk3L4+nVJTD6n
 /2rvf3fqyoQpna2ZGmWJDNlDAMvTE8KwsWpnYhYHW6rg4VmTA4cKT3xIVok5gqieD0uZnw2aQ1K
 z4C7R9NMkmFHgotQU8LpIr/99k5/9cr+R7ji4I0fGH9mCKEWb7eAt9OvsvImpbstV14t7OCC
X-Proofpoint-GUID: LEyuXZX8V3yk3BulRZMXe7jViLwK9Roz
X-Authority-Analysis: v=2.4 cv=LP1mQIW9 c=1 sm=1 tr=0 ts=6891e099 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=rd-FPC7Uua5lUePm5bYA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: LEyuXZX8V3yk3BulRZMXe7jViLwK9Roz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_03,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 spamscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050076
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

On Tue, Aug 05, 2025 at 02:32:17PM +0800, Chaoyi Chen wrote:
> Hi Dmitry,
> 
> On 8/5/2025 12:26 PM, Dmitry Baryshkov wrote:
> > On 05/08/2025 09:13, Chaoyi Chen wrote:
> > > Hi Dmitry,
> > > 
> > > On 8/2/2025 5:55 PM, Dmitry Baryshkov wrote:
> > > 
> > > [...]
> > > 
> > > 
> > > > > > > BTW, one of the important things to do is to implement extcon-like
> > > > > > > notifications. I found include/drm/bridge/aux-bridge.h , but if the
> > > > > > > aux-bridge is used, the bridge chain would look like this:
> > > > > > > 
> > > > > > > PHY0 aux-bridge ---+
> > > > > > >                      | ----> CDN-DP bridge
> > > > > > > PHY1 aux-bridge ---+
> > > > > > > 
> > > > > > > Oh, CDN-DP bridge has two previous aux-bridge!
> > > > > > > 
> > > > > > > Now, I try to use drm_connector_oob_hotplug_event() to notify HPD
> > > > > > > state between PHY and CDN-DP controller.
> > > > > > Does it actually work? The OOB HPD event will be repoted
> > > > > > for the usb-c
> > > > > > connector's fwnode, but the DP controller isn't
> > > > > > connected to that node
> > > > > > anyhow. If I'm not mistaken, the HPD signal will not
> > > > > > reach DP driver in
> > > > > > this case.
> > > > > Yes.  What you mentioned is the case in
> > > > > drivers/usb/typec/altmodes/displayport.c . I have also added
> > > > > a new OOB event
> > > > > notify in the PHY driver in Patch 3, where the expected
> > > > > fwnode is used in
> > > > > the PHY. So now we have two OOB HPD events, one from
> > > > > altmodes/ displayport.c
> > > > > and the other from PHY. Only the HPD from PHY is eventually
> > > > > passed to the DP
> > > > > driver.
> > > > This way you will loose IRQ_HPD pulse events from the DP. They are used
> > > > by DPRX (aka DP Sink) to signal to DPTX (DP Source) that there was a
> > > > change on the DPRX side and the DPTX should reread link params
> > > > and maybe
> > > > retrain the link.
> > > 
> > > Sorry, I still don't quite understand your point. I think the entire
> > > notification path is as follows:
> > > 
> > > Type-C mux callback -> RK3399 USBDP PHY -> PHY calls
> > > drm_connector_oob_hotplug_event() -> DP driver
> > > 
> > > Are you concerned that the IRQ_HPD event is not being handled
> > > somewhere along the path? Is it that the Type-C mux callback didn't
> > > notify the PHY, or that after the PHY passed the event to the DP
> > > driver via the OOB event, the DP driver didn't handle it?
> > 
> > The IRQ_HPD is an event coming from DPRX, it is delivered as a part of
> > the attention VDM, see DP_STATUS_IRQ_HPD. It's being handled by the
> > altmode displayport.c driver and is then delivered as an OOB hotplug
> > call. However, it's not a mux event, so it is not (and it should not)
> > being broadcasted over the typec_mux devices.
> > 
> > The way we were handling that is by having a chain of drm_aux_bridges
> > for all interim devices, ending up with a drm_dp_hpd_bridge registered
> > by the TCPM. This way when the DPRX triggers the IRQ_HPD event, it is
> > being handled by the displayport.c and then delivered through that
> > bridge to the DP driver.
> 
> I think the issue goes back to the beginning. The key is to reuse the logic
> in displayport.c, and the previous approach of directly setting the fwnode
> has already been rejected. Is it a good idea to register the aux hpd bridge
> in displayport.c? In this way, we don't need to register it with a bunch of
> PD drivers (such as fusb302), which seems like a more generic solution.

displayport.c comes into play only when you actually attach a DP dongle,
which is too late for bringing up the display pipeline. But your point
is valid, it might be worth moving drm_dp_hpd registration to
typec_port_register_altmode().

-- 
With best wishes
Dmitry
