Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8762DB54AF8
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 13:25:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5402010EC10;
	Fri, 12 Sep 2025 11:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LveBUbH5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874C610EC10
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:25:09 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fWOO014362
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:25:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=L/KO/8ARjOPSDYaWONlEfU/h
 96fvcT5jnTcbxDheBto=; b=LveBUbH5+IKoDERn3kFHQVSoFlOGA9aorkBY/HWO
 R5EL/IvDmc70MUV3aHLzEuhud1sqlDxJ4NZbl2FuERCj8gzqIQAu8JsMxTnqWGuz
 sYcg6uggPDMyMbhLlhwFZ3BDs6M78dW/WsBLET6Inb9puclecuiqjYoNYdYCSRK6
 yXNBQpM76/7ntmPWiu1sg7WeIF0nUG9YjOWXar/DXywryufl4eAS/6YXWaTWr2ec
 MuQT4gpOMmYWUok7/NiNRrx1ZAiDWRrs+KsdlsO/YcPW7xhY87psQphr9yANTN+o
 3DFfdeIlMbiLCe5MF/bpVAb757j/hbtQmT0DgOHKouPl9w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493qphw61c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:25:08 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-76485dfc1f5so41911366d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 04:25:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757676308; x=1758281108;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L/KO/8ARjOPSDYaWONlEfU/h96fvcT5jnTcbxDheBto=;
 b=SRWiSSrdJiEGbqelXWF5qIjRS3LbhPPyApA/4c2BIsPP1zI2boGUfshUsfktFmFcBf
 QCbT34uSKE0Go1P2DrrfuHyx++xZGKuCsfhRz4KvBS/L5eJRogXfk713pfEdwumqkGdT
 1nGROON7tHgHjn7M+Boep1aELCMnQ8ssS80bzX44FzKbHrjxGB0IsQalKH0foTFIN5ez
 /Hoy9x7sOQOpVBE07XXw0w9VbKBz+lQ149IjdLQe3zjIVbQ9g1j5pHM454eb3YD0Rf5V
 SR95TvKsGjjaIqAydJlVYaTWTMMWtAgm6SS3A2NcY2zv1M9C8BF9r09xualt2cFhQJlJ
 WTag==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3dO7aGp+DyKc5tyy5QkGtv4likMS8uGQGK72ok6MTMUsZNabR8WAXTwCPU5quiRUJkSYri/APtyk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjNuvjWdBhEj8+2CYeZpqD8J/FrbnyKqi/5CLCgM6WgMAQ5Hmq
 hxLmMo6dZhA5WTjh5YANz3ipvPm5RWRyNMXyVbi+W97knu2fw1WD71bK78LHyew1NQsn3cFajgH
 LYqDkHudNe2w/1sLfMfqpuUhRu1W2GN6dUg90c0V3pSfxD2DuUeNK2oBeZaLn3wf3yJMdBbA=
X-Gm-Gg: ASbGnctnkcK2opO11FdtUmdZtOoEyRZUygE9DNc4p4Bl/TF+WY4DoVmQ0A4UBt3BuaN
 pAJZdvE/a6b9aBVuESK2I1zKTThAUufQ0RiC4WR8RUvinFnhjUl6CDMIHMXX48jdkfrjGurSt04
 5sYBcdfQ11XVhFTdIOMDlSaglp5aRCjDpjN4mmz237hYryIzQlwBMWbVdKUhU973lFb+x3BTaKV
 AKnFmaNtz5Gm+T2ulVAqLWCiFkkXPrsYt80yU3r5h4Xoh6scxzteo+wJOBlrd2Kg833W7UXlR8U
 /5lr0Sf7XDMAy1NMsn2o5HbySJYhVWhlXyMSonVD1MgSbMTBTFYAnEo1kLCDZY8NJ+erMsYHbHu
 pAE6CtROMqfTedSJxk2FXrNUokNkdt5kh2bIbcsv35eWbkq/8Z1qA
X-Received: by 2002:a05:6214:1c09:b0:727:e45a:562c with SMTP id
 6a1803df08f44-767c5fc1237mr36407286d6.45.1757676307410; 
 Fri, 12 Sep 2025 04:25:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBvOKZjxSrcCAvaaBqR3mwSYec8GgXHcFcEBSSwTJG6nn1Xn5NwUdFapU5ndqxPzynNLhv7A==
X-Received: by 2002:a05:6214:1c09:b0:727:e45a:562c with SMTP id
 6a1803df08f44-767c5fc1237mr36406556d6.45.1757676306608; 
 Fri, 12 Sep 2025 04:25:06 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e65754ab0sm1059810e87.132.2025.09.12.04.25.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 04:25:05 -0700 (PDT)
Date: Fri, 12 Sep 2025 14:25:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
 chenjianmin@huawei.com, fengsheng5@huawei.com, libaihan@huawei.com,
 shenjian15@huawei.com, shaojijie@huawei.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 drm-dp 02/11] drm/hisilicon/hibmc: fix dp
 probabilistical detect errors after HPD irq
Message-ID: <3sywcmtd4uksow6exaav6smx4wwrlp7mur6mcrpw3qklvbr3kn@dqypx4fmnhrw>
References: <20250813094238.3722345-1-shiyongbang@huawei.com>
 <20250813094238.3722345-3-shiyongbang@huawei.com>
 <aayi7zjrmru2ancexrqmcutams6ohde3nrkhqacixwp45dsk4v@7ig6hqzahdxf>
 <1dd93bb7-4f67-4b9b-8b6a-d7c5c77cf807@huawei.com>
 <ce47v3y77uc4dunlwyvmfe6j7d7mza4zfrbvu5dz67t66jdlop@vqgv47saj37i>
 <8bbfd02f-138d-420c-b456-10d0c913f46e@huawei.com>
 <cdmtfluxqes3bv3t7suctbajp4jmpih6fhegkbf7mxvy4umzrd@rtpupear4el2>
 <13b3f4d9-c8b4-445f-8f9e-a57a1fa2bbb5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13b3f4d9-c8b4-445f-8f9e-a57a1fa2bbb5@huawei.com>
X-Authority-Analysis: v=2.4 cv=aPDwqa9m c=1 sm=1 tr=0 ts=68c40314 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=i0EeH86SAAAA:8 a=74nAKEOhdCrmlouCdhMA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: oHJQjLQsNhBrGFSaF-pIX4phRshCYQeI
X-Proofpoint-ORIG-GUID: oHJQjLQsNhBrGFSaF-pIX4phRshCYQeI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDA0MCBTYWx0ZWRfXyosds34v0psV
 YUe7dfpMHhJXoU767gKEq/VLrcXN4ZCq2HS2H94v/GdKD2J7+av5zeGXGFkv847dDNYp3Vpg8ui
 Cfgur5/IUbWJlWVDNk4vNEhfvNaDFqXQAEMQcwHCliZwdpYMk2URufmB6svXJMwPtDCyKonRRLS
 6zxNk0tDeT8CFsiMJD+16K+PwPENHMAHTEGc8IGVP6w2Sw8tFtlAUXxyQ10gvpGLDm8rxDj2h+f
 EuYF+GMQ0yvjGIhYGrLybLsq+JYbsVGOPbfiBQFwdIqDAuLpCucajz0i6OoyYQjuRt3XPStGO/m
 qHaN8zCbC3eZBinD0vJuU1g5/p+eSDwdxeCMwckYB7XL7o+MI0OqF3jEYvkne/nWETQ8bAdUush
 w0IdrBCs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509110040
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

On Fri, Sep 12, 2025 at 09:23:05AM +0800, Yongbang Shi wrote:
> 
> > On Thu, Sep 11, 2025 at 05:32:40PM +0800, Yongbang Shi wrote:
> > > > On Thu, Aug 14, 2025 at 08:19:41PM +0800, Yongbang Shi wrote:
> > > > > > On Wed, Aug 13, 2025 at 05:42:29PM +0800, Yongbang Shi wrote:
> > > > > > > From: Baihan Li <libaihan@huawei.com>
> > > > > > > 
> > > > > > > The debouncing when HPD pulled out still remains sometimes, 200ms still can
> > > > > > > not ensure helper_detect() is correct. So add a flag to hold the sink
> > > > > > > status, and changed detect_ctx() functions by using flag to check status.
> > > > > > THis doesn't explain what is wrong with
> > > > > > drm_connector_helper_detect_from_ddc(). In the end, this function
> > > > > > doesn't use the HPD pin.
> > > > > I'm sorry about the misunderstanding.
> > > > > The issue is that after plugging or unplugging the monitor, the driver takes no action sometimes
> > > > > even though an interrupt is triggered. The root cause is that drm_connector_helper_detect_from_ddc()
> > > > > still returns connected status when the monitor is unplugged.
> > > > > And I will fix the way in the end.
> > > > Can you perform a normal DP detection: read DPCD and check that there is
> > > > a DPRX attached and that it's either non-branch device or it has one or
> > > > more sinks?
> > > I'm very sorry that I didn't get the last sentence's asking before.
> > > It's a non-branch device. We just connect a DP monitor.
> > Somebody might connect a different configuration than the one that you
> > are using.
> 
> Okay, I can add the check drm_dp_is_branch() in the DP's detect_ctx() to
> intercept branch devices, is that good?

My suggestion is to implement DP detection in the way it's done by other
DP drivers.

-- 
With best wishes
Dmitry
