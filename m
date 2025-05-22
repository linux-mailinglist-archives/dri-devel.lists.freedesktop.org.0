Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA901AC0C45
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 15:08:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 049AC10EA3F;
	Thu, 22 May 2025 13:08:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TiXQUVad";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E9510EA3F
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 13:08:51 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7T4wE027699
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 13:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=DJi7j+M1RBOvHbcBZkRqK8/G
 si/9/J2x7eD+sSVq2/k=; b=TiXQUVadb2f2+r49UHjnhJBHHT+Lo6XN1ohK8ss5
 on5d4nEuWOlPeLqIQuBj2lcbLXfsGpl2mUdrMSK6jur/gfJsTXkouYM9OSrSZjOO
 J7EFKWLNKlrgnv1R6s3p05pm149eIbNJ5nn/a6i0Agi3DbTKxZsCZYTIQArzF0Ai
 piZn3Lt9wwrxuOsruegQu9OymBxFbSCJr4nJXMeGxUAn8pu0Gur3ip9Wm9aKB8O3
 kyofoeiyXsxICiPd29HRkGMjORN0zh/5sdQaqzrOb5FQ5lQxfsxA0g9b7EYc5mEE
 xtg6A3n8pgIqm9oSBMp9bAiT1sf/i1x+C24+xL7PtsufTA==
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9eb53-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 13:08:50 +0000 (GMT)
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-3dc7bc950ceso32662565ab.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 06:08:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747919327; x=1748524127;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DJi7j+M1RBOvHbcBZkRqK8/Gsi/9/J2x7eD+sSVq2/k=;
 b=MtRLmLAOlX8Q1btAMGprNL/WlZSvyksA8QKfqjqCq506Z7iwmUAcjnKKYc46UZfqm1
 EHztCIJopFvXcvr0rDuHohpi2a9Gi1vW+MkEUgX7HQ6z50J8PuD8YRghuAF+RbBlaB+d
 eLxMXR3cZOT+8vP7xsQgIlNUWJV+ewHHcko7Ji1L2bfd/5SCMNHGt1Vfb+H2MnB3/a4d
 tgaCa3TrKpnmR29QM4KLNpgvXmPd6SkliU+/BmFGctd1GZLzjVu2IxD4V4lltkurTzJ5
 xRgOYIvb6eqyM+eManOu55TrGklFjkAxiEi1JbugxyXFKYo2Z4IRXrT3TDcB9hUXpFL0
 esvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnKZC7+k98gv/ebZkgtAlxjzs9O16Jj7oFitEadWONgSFfb1yZxa9X1G1WhDKChPcm8wSluc553qE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpaiCwv/8JKa/qS0AQmpWUnjHZfXx6zJEAo2k50stgsemizpUK
 QjMP0rB0kxVE7DlMX4/ldP75x22Y5dNMFZ5SNlpSuEhngCvm9NTVj0x9p7w/gFwiaSZ/HfYq66h
 LzWCZRW3sVBz+aME6k7VLpttR8QxsyVxau46QPVRjfvrFc2f+a8SygvZmvM1+vJUaN/vcSaY=
X-Gm-Gg: ASbGncsQVxqb///2tOLvFtkmZS7skDxgo32InbLc5VISrS1HafAnls7vfWXsQihWIye
 LFxJ20LTG4JizUFt25mEQs7fl5z1V0zyQmov8f6dxsMGfOfhJhRIx5eU/x6LHJvoQM0hxkXdjjK
 eaTDNowosEVljcsFUUFSaNs1XVnjXVwpojiTPxQDytFvm43n4OrfaN5MlfkaG0cWlMoSEwj2pRV
 KspI3dH1Ij9KQtIQ+sqGyD6w5wXXdijD1zVrn4+MumFjPWxyt/o7xYGpYAwNJyUnBpnU49ZeFx9
 Wm2t4T2wbAXmfl5CFzZns67Ud9WwbPx/keL9QrrfLiXCKV0Ncxy8Qy6NTNolvvS1MXhE/9JS8xE
 =
X-Received: by 2002:a05:6e02:1489:b0:3d8:1d7c:e197 with SMTP id
 e9e14a558f8ab-3db842fe965mr263415085ab.7.1747919327120; 
 Thu, 22 May 2025 06:08:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvfUBsJCzHaG0IdypGYuFRgNGAJw7D+1sU0Oukz6Zh13k7pm8Eh33CZDVeTRmPagkRvVHBEg==
X-Received: by 2002:a05:6e02:1489:b0:3d8:1d7c:e197 with SMTP id
 e9e14a558f8ab-3db842fe965mr263414675ab.7.1747919326670; 
 Thu, 22 May 2025 06:08:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e702d5besm3391285e87.187.2025.05.22.06.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 06:08:45 -0700 (PDT)
Date: Thu, 22 May 2025 16:08:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Louis Chauvet <louis.chauvet@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 02/22] drm: convert many bridge drivers from
 devm_kzalloc() to devm_drm_bridge_alloc() API
Message-ID: <qkqyfksvimaks4wb4si72shewdc7ccy4n3srpkv3jf5snphepu@zpci2dquivhj>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250509-drm-bridge-convert-to-alloc-api-v3-2-b8bc1f16d7aa@bootlin.com>
 <4yeqvg3wnlr2bhb54zutgqpkehrodat5w5x4rr5qjlrc2ts3pz@gr2iosycclpl>
 <20250512160201.7d0b21d8@booty>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512160201.7d0b21d8@booty>
X-Proofpoint-ORIG-GUID: T-BQC2KPlEMDqHuVZaEhAHSdBHEtUwJl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDEzNCBTYWx0ZWRfX8f8zhz4cZ/mu
 MXhcGiZtLlSEuLly/E1zd2PRio2E+xn0sV/x8LJgGK90ztN37tuZftlzBwCXEVkrjqnUEvoIkIO
 1SKEtDpj6Ja6xLzFxMLNDIiWoaYn0XZyuz2CUZRrLXsEuscJMKOzJFrRYSi9dKZAtf21EXQvFJr
 9jZ+849qnqdcH3rdzmCH6QBui41C+bohYw2nwHBvpPq76q2xm+botEVNfvylBGIpyHNo0vgrGOy
 fIZO68ZILvfv0G5peE3zREnH1m3NCqzDjw9KAgctDE3iTHm5xBPYd1FByK/nkchUDRfCY/Gi23e
 fPX/z0AhNCIdRpquXtUG/cZikD+VBaeUfwC8WeKajxesKT4q8dAJ6PuSFJF7xf2fnzTkk5nJcMk
 rJCPUJRLhficYtDZ+1vBi4kD7jmPc/VVUPoBEh8KiF+g1ojtizH6WmeGZjEF3I1EJvhwLYl5
X-Authority-Analysis: v=2.4 cv=GawXnRXL c=1 sm=1 tr=0 ts=682f21e2 cx=c_pps
 a=i7ujPs/ZFudY1OxzqguLDw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8 a=e5mUnYsNAAAA:8
 a=mfs67VCVHBiljQDpEFYA:9 a=CjuIK1q_8ugA:10 a=j7KN7tcCHpQA:10
 a=Ti5FldxQo0BAkOmdeC3H:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: T-BQC2KPlEMDqHuVZaEhAHSdBHEtUwJl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220134
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

On Mon, May 12, 2025 at 04:02:01PM +0200, Luca Ceresoli wrote:
> Hi Maxime,
> 
> On Sat, 10 May 2025 10:43:04 +0200
> Maxime Ripard <mripard@kernel.org> wrote:
> 
> > Acked-by: Maxime Ripard <mripard@kernel.org>
> 
> Thanks for looking at this series!
> 
> Unfortunately the exynos patch is still needing a decision. Quick recap
> of the story:
> 
>  1. patch was sent in v2, nobody acked/reviewed it [1]
>  2. was applied by mistake to drm-misc-next [2]
>  3. you pinged maintainers, no reply do far -> should be reverted [3]
>  4. Louis (fomys) asked on IRC how to handle it, no reply [4]
>  5. in this v3 I added a revert (patch 1), no acks/reviews on it [5]
> 
> [1] https://lore.kernel.org/lkml/20250424-drm-bridge-convert-to-alloc-api-v2-14-8f91a404d86b@bootlin.com/
> [2] https://lore.kernel.org/lkml/832a9db0-cf8a-4d35-8a98-08053fbd6723@bootlin.com/
> [3] https://lore.kernel.org/lkml/20250430-arrogant-marmoset-of-justice-92ced3@houat/
> [4] https://dri.freedesktop.org/~cbrill/dri-log/index.php?channel=dri-devel&highlight_names=&date=2025-05-07
> [5] https://lore.kernel.org/lkml/20250509-drm-bridge-convert-to-alloc-api-v3-1-b8bc1f16d7aa@bootlin.com/
> 
> What to do? Proposed plan:
> 
>  1. Louis immediately applies the revert (patch 1)

I can't help but notice that both Louis and you have bootlin.com email
addresses. Granted the lack of responses, can't you ping him internally?

>  2. I send v4 with the original patch to hopefully be reviewed/acked
> 
> Plan is OK?
> 
> I'm assuming Louis doesn't need an Acked/Reviewed-by for that, but I might
> be wrong, and we both would like to avoid further mess.
> 
> This annoying issue is taking much more effort to be fixed than it took
> to develop it. I'd like to get past it and think about the next steps
> in bridge lifetime management.
> 
> Thanks for your understanding.
> 
> Luca
> 
> -- 
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
With best wishes
Dmitry
