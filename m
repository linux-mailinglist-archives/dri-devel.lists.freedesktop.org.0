Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 719CFAC2E3D
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 10:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89AB010E137;
	Sat, 24 May 2025 08:11:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OU1yU/ep";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D805810E137
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 08:11:41 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54O4CLPN018180
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 08:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tHPIepG7q7mc2xqprg9sD27w/5edJZMQOBa1WzER5So=; b=OU1yU/epswZPLPX3
 EaLw6wAQmJII3aCjx2G8e++6kSShC1uOQNWeZ7FyISn2eh49vSYnb9uPO/l6oTMo
 cSjjfkEP2cKScFD+l0XiDv997FNeF+qIby5KVSfIUNUrODDLvL1WV5dDZLC7e81j
 JLQJQJVtZDIH0wZlxdb3whIyQ36l1woQ7SS3lv1LaOmx6lqwWjLt3C252y7tmkpf
 gVoxXBEtmA+jRfK68RYdQYSjUWuHUnhenLro9YvyNlkMtEzWhwxvn+86rS9nGUgm
 Ft/sZXL/YCiQv5WtTN2rC8HmyJdV/muwiuqSvOwRR/v0RpAKnianiCdVQem5IOjr
 KqKOPA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjgaw2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 08:11:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5d608e6f5so162308585a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 01:11:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748074300; x=1748679100;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tHPIepG7q7mc2xqprg9sD27w/5edJZMQOBa1WzER5So=;
 b=FBZpEpUnkRbkhcCUVMvr9dTVBXdtj5ulTsjMQei3FP/ddjiEb9ryXiZ53N6ckiVPy4
 JUTiuewc3kFo0y629NHwBzvj7VGuJZA1HP52bFm/FzlfKkuLYqzN/Gr9tma1toaH6V+V
 8fxaRXQ1ZljCzsPCmRSZ03IF3ZEwmepY2Xd0Jkfvd8rR43o3Zb4jw8oSSZ7eyB0/bfcW
 pgullN+sRMUApXG4/q7X5j/p4me28jS92hUN0t3BlFhYJMECipi60mzXOQBj/T7T6NUu
 PhEwawoK4wurmvPmQcfLXWYzc9YeXOhtjwhewK/KjO/tmKJhYw93Zkhgil2+hHQGLBE6
 tT8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/byL22mWO5wW79Ykq6CePB79MlsEnXYoDAbSeMJeDcUbkikvVPCHqjJ1MXupy1DrbllVqDTO32XU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVNX05saGwMD/a6GmAnzlGC69A4sOtVsfrHeIA8SB0uCpsSX5K
 kXAOjVUkt0NwZZR9guv/5UCY+deYnS2JTELDpGKRauNVVhMcOOygyuVnDKUSpCHati8chQiC6ck
 UThfKq/DU1JUr8Wwle9L6gV7O4K+R2cxgGrHsRnTUHKgczLE1ZN4kbaCiY1sK0trHIGb1U/k=
X-Gm-Gg: ASbGncta8PLptaVn3SwbfGS9CXGbfVHfiG1iZxMXdgKBY3Me/CVRdEgQ8QMsMmyf1TT
 /JujK3MF2LFZN1JCCsNvmslhQQM+Gp+IKahWYWEhH66UBrxJKQDt2uEljDmifrsuZnSDfieEkZI
 cM3BRWLaObnTMVZM9JXuDt0TiLy3Iyve5vEQv9YOyvgjbWhyl3jMI7oZzqgz5VhzUeUmNZ+vxlB
 9zbRJRwjZBIFFOxrtQ2a9EEEGKILX7ehlp3eQgzENig+1JUUkDXdFMWAEdePgOpsTosSTmydyKx
 ioXWH52Y4z7RNteAbDy4aGpVJgi8sY69DC/WrUkVtsi6eOXybVYJTecAC+HVFfhFI4r0WMccvaA
 =
X-Received: by 2002:a05:620a:f15:b0:7ca:f40b:f44b with SMTP id
 af79cd13be357-7ceecc44cacmr332737585a.50.1748074299685; 
 Sat, 24 May 2025 01:11:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGh+51bBBWaUmqP+dgjFmfrbkOFuigtqEW7bD1m0xToXs6orv1NCpLgTxWoAXv/SLi3H/a8SA==
X-Received: by 2002:a05:620a:f15:b0:7ca:f40b:f44b with SMTP id
 af79cd13be357-7ceecc44cacmr332735885a.50.1748074299340; 
 Sat, 24 May 2025 01:11:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085b8efesm41722811fa.73.2025.05.24.01.11.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 May 2025 01:11:38 -0700 (PDT)
Date: Sat, 24 May 2025 11:11:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, neil.armstrong@linaro.org,
 sebastian.reichel@collabora.com, stephen@radxa.com,
 dri-devel@lists.freedesktop.org, hjc@rock-chips.com,
 mripard@kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 yubing.zhang@rock-chips.com, naoki@radxa.com,
 Laurent.pinchart@ideasonboard.com, Andy Yan <andy.yan@rock-chips.com>,
 krzk+dt@kernel.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/9] drm/bridge: synopsys: Add DW DPTX Controller
 support library
Message-ID: <osjee6ibus3kuhv7oqqvki2wdxjotjfgcnxarpovvw25jiwhqg@uburpxawk754>
References: <20250403033748.245007-1-andyshrk@163.com>
 <20250403033748.245007-3-andyshrk@163.com>
 <2f4796ad.a2e0.196ceb908b0.Coremail.andyshrk@163.com>
 <hsrec7lguapfxdxulyncypdx5c2rzamcxeoj2kiojw3ukvi5c3@lwr6eriwoxdy>
 <7d4f2ae8.23f1.197014e386f.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d4f2ae8.23f1.197014e386f.Coremail.andyshrk@163.com>
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=68317f3d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8
 a=s8YR1HE3AAAA:8 a=rLSYf88_2vispd5-KzUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: e6o9SR7v_P-bjK24mFqoCwXpeyrsqLwr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI0MDA3MyBTYWx0ZWRfX2Yo7kLnwfXse
 57o0pjH3IRF9QOoQD3cUfI6TMGtlH7m4WgSScbkI+Qw1ZmmnshZ2rRnQqpw37wMVtmz3UfAx3Tm
 y4DeQbzEyqvQGMh/P8YB2qunTQ5GI0uhFGh7lSTuQ+mEn+C7OwmDzxCrQCB232EVyJbMBRSHi48
 Gc3+E+0aqApGWVVxA39nPjIzLtkOWmzu2MKKk9F+QZfslUBe2ppTMdecBYkYBeLCmccqnVm4xMQ
 bdgYiCwHoa1T7e13dOPyecGRtD8VbJi3z8Ul8GEnETM3bAEKbwzRT1P78mF3qfKI/pmw4iAsKvK
 C/vty0TJKTyd7fvVMkxOs7nPXcTh1HRIiQaypltjbZT6fpoAsmQyEmv6G0Al2oBOYFW1SzvzJz2
 Z8O1aL6ea64XbJx/bzezeXbwBEuJ25hxwsHEbHd3t/WNgg+dGIvdhuylAV84mPbnv1ARCKXT
X-Proofpoint-GUID: e6o9SR7v_P-bjK24mFqoCwXpeyrsqLwr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-24_04,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505240073
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

On Sat, May 24, 2025 at 03:59:52PM +0800, Andy Yan wrote:
> 
> 
> Hello Dmitry,
> 
> 
> 在 2025-05-24 15:46:15，"Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com> 写道：
> >On Wed, May 14, 2025 at 08:15:55PM +0800, Andy Yan wrote:
> >> Hello Dmitry，
> >> 
> >>     Would it be convenient for you to continue reviewing this patch at your convenience?
> >> Or let me know your opinion on this patch.
> >>  
> >>    There is still one unresolved issue highlighted by you in the first version: try to use drm_dp_read_sink_count_cap
> >> instead of dw_dp_has_sink_count. But there is no response on my patch try to Pass down connector to drm bridge detect hook[0].
> >>    I don't know how to proceed with this patch at the moment.
> >
> >Please excuse me for the delay. It seems Maxime doesn't like that patch,
> >but I do not see a viable generic alternative.
> >
> 
> 
> I still want to express my gratitude for your help. 
> So, could we perhaps first keep this part as it is now, and
> we can switch to the generic helper in one day when we find a proper way to get the connector ?
> 

Yes. I will take a look at the series in one of the forthcoming days.

> 
> >> 
> >> 
> >> [0]https://lore.kernel.org/dri-devel/20250321085345.136380-1-andyshrk@163.com/
> >> 
> >> Thank you.
> >>   
> >> At 2025-04-03 11:37:30, "Andy Yan" <andyshrk@163.com> wrote:
> >> >From: Andy Yan <andy.yan@rock-chips.com>
> >> >

-- 
With best wishes
Dmitry
