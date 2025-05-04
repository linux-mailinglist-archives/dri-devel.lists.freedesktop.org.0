Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E71AA87E8
	for <lists+dri-devel@lfdr.de>; Sun,  4 May 2025 18:16:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 017EC10E067;
	Sun,  4 May 2025 16:16:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jjIO5Rsq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B7110E067
 for <dri-devel@lists.freedesktop.org>; Sun,  4 May 2025 16:16:40 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544FKnud021273
 for <dri-devel@lists.freedesktop.org>; Sun, 4 May 2025 16:16:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2EVC3je5HAhssIAnNfZ+XqOXLnIfrV/oZD5AQQ6xe/s=; b=jjIO5RsqjwOL8NcZ
 Qifcx92SBgVIeZQ9Nc4Pg+OJtmB3KHtixWVrzFuxZaztvsMUbkQ/GS+L6ATcygWS
 PYEgNHlYxtF1EcMtZZmS1rQ0GvxQ6yKUOAKsmSKqvZpXEjAwaGSgCP43qkU40OrF
 xORvhu2q9vZsoXxbpUqtC8HV7YkH3RkU0dawPX8ANytBXxaVbZpZL7/0NP8fnkRR
 LFAFhIzI3oElI+Ci8MBru8G/iCOOydwToIajdRl+I/Igiabr6clEnQdWYRp7kBJJ
 dyFmOjv0ldDhNfzX/xJ6NuRirda0kuANJIEKA7X28iD1BJpTc1+E3QnFoRO/nImK
 VfQCHw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dd3n21ur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 16:16:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5e2a31f75so372782085a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 09:16:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746375398; x=1746980198;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2EVC3je5HAhssIAnNfZ+XqOXLnIfrV/oZD5AQQ6xe/s=;
 b=iH2iO2fo9pSNlRJ9pLZa52XFGUtHL8yhhHXq2zXBZT/5QENBjR/yJaXtQzAU1f5rqN
 aWZYGdG5+SzYuXNgjOh/lJ0OTe7CQ71hoqpkmc9P2giUfvN0fq8lb+dFAQ39n3pRdCWt
 kv6InUq7W7ZKIFEMt93+VKom61iK1Gpm0fiFy2L0VyvBDT/1vb5L2pSsvUGoJ7fJB2+v
 DVHfRJg8KSFpJnmstHB4A12jtn2uXg/1t8AAbUbPJOFMqRKZwVJ1jadmr0F1fHh4ZkNZ
 +VdIuKsjBhvQzesOANkkkxSyCrcG6qe4VOiWc6bnVUnte2mtVLnclsGwU9LCNChBjhcs
 L//g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQKKfFBQqKYCl85u8+Tn7Dje7jh0ZuUe3NN6LBkw/qcAflsTol3uubkozlhFfiTlHeqrGjhGbFFvk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXXg4nOLMNiBDsbPJaW9P538PDMH2panZ4OXiS5lMIadykjsk5
 k8NLSC7AwJ9zXI9GWfdTFLnrCNEapuWJvpf6KrxzGryQHCaXkQcB6NXI1k1Bse/P6EXJwZ26LrO
 xWaJHeMiv+/bwdYm3acwvCxX8Txo6q6OOe3FnJ7t8nYuSxKGNMgtU5BG1tBH/qsMyCEA=
X-Gm-Gg: ASbGncsxiQ1EopUcS5o9rkI7mEiP64/E7SYI1z/DZZtNVeESVj9cwti4QwpFpmhLAvl
 JQUdn5cOxT2yQgEuNN/V/cLBLX0Bd59njRRIX9mjhHym8Xd0/sKpW9zIpHO77qnc+6XWhR+w2Wf
 BRHmauCi/eizKjiWTCuLEZoMu4/kXEnJ/ZgW5Iri81fRCi+DJNIms3YGvkKdGEquWfbtdYzGmce
 PjPmN1cnAmVQI83zyCAFSTowxTvY/z168c2Cm2rhYGLTS02j1icb4eLjmhWzMQg2iPKyzcPtXYZ
 22jRicAt4C6OhAIVjFmDC2GWZE9u0+wu6Fua3nflnlVhogohqIkp1P4f+7EfX2JrLaTovQ6Unk8
 =
X-Received: by 2002:a05:620a:371e:b0:7c3:d5a4:3df3 with SMTP id
 af79cd13be357-7cae3aa64e3mr573861985a.34.1746375398513; 
 Sun, 04 May 2025 09:16:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiT08Hu2FwqUiAAbt7TpcAAf+6cb8td1czl+K5aq9kRsZS87wnWvgBk2BX0BgUjYPWiwBvqg==
X-Received: by 2002:a05:620a:371e:b0:7c3:d5a4:3df3 with SMTP id
 af79cd13be357-7cae3aa64e3mr573858585a.34.1746375398104; 
 Sun, 04 May 2025 09:16:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94edff7sm1299766e87.137.2025.05.04.09.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 09:16:37 -0700 (PDT)
Date: Sun, 4 May 2025 19:16:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Andy Yan <andyshrk@163.com>, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, hjc@rock-chips.com, mripard@kernel.org,
 neil.armstrong@linaro.org, knaerzche@gmail.com,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v4 0/7] Convert inno hdmi to drm bridge
Message-ID: <nco27hnwykffzgirhocskltrkcds32tefkix23nfknf3e5m3zd@mkrrbw6kogsi>
References: <20250422070455.432666-1-andyshrk@163.com>
 <9503607.rMLUfLXkoz@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9503607.rMLUfLXkoz@diego>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfXzz+QJW9m7UBR
 bK8Wq7A0vqz7qVQRiuOLSN4l8F33av0nXiACyvoS98tDP4qwKw4UPtZep31rVxBR6CFStSV+KB4
 fkg2Z2DsSV3StfZqtUOVGscyLwwCXaRe+gvqzUzqQwaCWc1C1khuQLZVxzOKuPb4f2dkrmdKkXj
 Ec63bo97BfO+8SgKluzvQB0822AtKjfxAg91GxGrV8JOpEdkaXxAWAMlXq5IQpA8NqMAQv9vCtG
 raanyIEwJ7ngHcuM4VFl7CwVjLKZBDqYVSUEW+1OhjgJ+dL3kTIMr9pUk+mIRDRRplTFDiX5v7F
 OR9/7l0BuDDo7oVWP5/oxQKSxvNTwZUjaAuJ9+mjUfHfSEd2+bLvXVpTveVMYPH82Aj8BcIsYtM
 egyF2+7UWkRvaNbaiOegFrSHnSnL8k5VKXQMdiVUcMrNiJsvdzCHwRfuAuec3REyaM1r3hP3
X-Proofpoint-GUID: GkfgdjAXU4USxgCS4GyO9pth3wmVRWuA
X-Proofpoint-ORIG-GUID: GkfgdjAXU4USxgCS4GyO9pth3wmVRWuA
X-Authority-Analysis: v=2.4 cv=UNDdHDfy c=1 sm=1 tr=0 ts=681792e7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=dt9VzEwgFbYA:10 a=s8YR1HE3AAAA:8 a=iQVnW9HZ8WsgGSc_yxwA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040152
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

On Sat, May 03, 2025 at 04:42:04PM +0200, Heiko Stübner wrote:
> Am Dienstag, 22. April 2025, 09:04:39 Mitteleuropäische Sommerzeit schrieb Andy Yan:
> > From: Andy Yan <andy.yan@rock-chips.com>
> > 
> > When preparing to convert the current inno hdmi driver into a
> > bridge driver, I found that there are several issues currently
> > existing with it:
> > 
> > 1. When the system starts up, the first time it reads the EDID, it
> >    will fail. This is because RK3036 HDMI DDC bus requires it's PHY's
> >    reference clock to be enabled first before normal DDC communication
> >    can be carried out.
> > 
> > 2. The signal is unstable. When running the glmark2 test on the screen,
> >    there is a small probability of seeing some screen flickering.
> >    This is because The HSYNC/VSYNC polarity of rk3036 HDMI are controlled
> >    by GRF. This part is missing in the current driver.
> > 
> > PATCH 1~6 are try to Fix Document in the dt-binding, then add the
> > missing part in driver and dts.
> > PATCH 7 converts the curren driver to drm bridge mode.
> 
> After resurrecting my rk3036-kylin which hasn't sucessfully booted in a
> while, I could veryify this series, so on a rk3036-kylin
> 
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> 
> 
> I'll probably apply patches 1-4 to drm-misc later today, as that solely
> touches the Rockchip (and only rk3036-)side and patches 5+6 to the
> rockchip tree.
> 
> Patch 7 should probably get some attention by people more familiar with
> drm-bridges, so I'll let that sit for a bit longer.

I will take a look later, but on the first glance it looks like there
are too many things going on in that patch, including some unnecessary
fnction movements and define movements, etc. I would kindly ask to split
the non-functional refactorings and the functional ones (splitting to a
library, etc).

> 
> 
> Thanks a lot for working on all this
> Heiko
> 
> 

-- 
With best wishes
Dmitry
