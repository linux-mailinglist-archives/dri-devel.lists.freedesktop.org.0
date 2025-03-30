Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B010CA75BC2
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 20:17:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0044C10E349;
	Sun, 30 Mar 2025 18:17:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="a298Ave/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8243210E349
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 18:17:08 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UDpqhc025645
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 18:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=dcSksA11RlOYohkA60SYzmtV
 b9G/fNoYNF/FlKhWLUg=; b=a298Ave/aiaZ62Jo76qt4r3+hYH5USThmjwt4Idk
 7MYrE8ogftZH3RMVB0dRC2oVCKJM5osebYZsAu2Lr7/MlVz7x1p+HQccxGfwpRz7
 BwTFmXdrSeCcZLZ8WEQioiN1+6Y/zRMikdPWMSQA54DTCqOs9Mjr86RPF+irb7Bo
 vgD9wtaRuKMJAbEc8yN+Sz6zF+pVxzAf7wgkzqPES3uJppMDokgseur1AdW6rrvV
 fB9lhcs5uLya6DMZxDzu5GnDO2CGYO+yXGDU8DXBjIGdGKl2d/lMRmgBOxqE++9w
 L//Spgf2s4pgZxBNdMO56RsyVBCFoYSL/6wzIvGQIX37cA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p9mjjjak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 18:17:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7bb849aa5fbso788928385a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 11:17:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743358626; x=1743963426;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dcSksA11RlOYohkA60SYzmtVb9G/fNoYNF/FlKhWLUg=;
 b=YeDhlmouJJYBZApIFrJ15ACQdJd1dsdPBhnVILokWUpJnetTCTFYNgbZCTpA6YZ2NC
 OubRiL6EjG5hYXEutpZ5CUs0m1+Wmv2ljHo+8Tq/XqD43p2nldwtrJF0uq+dXYqxZJIy
 k2+7GvRRztfOIVCZE4uDunXbL4oPQBd0OcfBwGydUfo/JYUL+z2EX2//0YYnk9k1Xtoa
 hnZla/LvM/e7/ohynEv5WR499zw1DDNyQHRtBjPK2m9KeRNCKTPmZ7wPVDCt94EQf7Fo
 1oqkaHG7b3G+VXJeScb7dbaFK3r9wJsXRGjgbnSevYoimcdRE8L2b6L9RfeoSyyTYYfd
 hmmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8V7rpLV15zdoj9i3FkdLkg0JMuhMHgwR/6qjNTPa8o/hHCObQpU16z/Ei2hHXF6raK2HTvJYi5JU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPXzAtFg7K3J4CLL8Mh4k/6i7sq32i/H+1z3mKMKValiYsyQmY
 ydUMKtn4uwmhBzCUUCsVKc32g4xxw5EJ+XdyoqR9hqyYVqTGA8UYAd51fj6/bzGeIKYyzAC4DWU
 3Ao94zEd1+yCR9UwbyHauaNVetEjDSGB/x9mUSZbDcBb/qLQEv7ueYHnO7hup1mXc2hw=
X-Gm-Gg: ASbGnctazHRakWRVPpDhccvMO7XegKf6j2/dHYWvtxjYwNrLjxzgdJyhhWbSZH5lhqQ
 iKMtXjrJEv+Pc0wzaeOMC82MQM8A1EUWCyjQTf+kZO/0WHUGLm5P+x3rKRROnztZ8OQVjfuqmFr
 PAx9j2Kg55imN7pnfVoCfxji+YbBlXe5T/he/R+JOcK/MyIWcoYwBKhxBj0dqdO48Hi6Nf+P2lA
 ni+CYteN5gzMeGQPwDnjUSMoE9SfwNaj4BuddP1/i4XeWzynlEuJ/saYYVdksyHQOvaYPtWyrdp
 nG9kwn11VK+Ql/Gttkf1QTFGsGFMczNcsgivVLuZN+7snIpdKU/63GHd7XoZ0ESIMe36ZAJL89g
 3gaY=
X-Received: by 2002:a05:620a:3186:b0:7c5:50cc:51b3 with SMTP id
 af79cd13be357-7c69072c8ddmr825387085a.33.1743358626633; 
 Sun, 30 Mar 2025 11:17:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjrCySJld3XG7/AgsGbLsMX1lIvdoId2dpO0+vc7j49p/kntZmwsaPQy1MzMkMt0UlMwFlzQ==
X-Received: by 2002:a05:620a:3186:b0:7c5:50cc:51b3 with SMTP id
 af79cd13be357-7c69072c8ddmr825384885a.33.1743358626387; 
 Sun, 30 Mar 2025 11:17:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54b09580011sm935682e87.149.2025.03.30.11.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 11:17:04 -0700 (PDT)
Date: Sun, 30 Mar 2025 21:17:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hermes.wu@ite.com.tw
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw, treapking@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] drm/bridge: it6505: check INT_LINK_TRAIN_FAIL
 while link auto training
Message-ID: <afnywa3x3nheteid7mt7u6hljge2tensmelj54ztamassmfpj5@7vyxzaprijoc>
References: <20250326-fix-link-training-v2-0-756c8306f500@ite.com.tw>
 <20250326-fix-link-training-v2-2-756c8306f500@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326-fix-link-training-v2-2-756c8306f500@ite.com.tw>
X-Authority-Analysis: v=2.4 cv=Mfhsu4/f c=1 sm=1 tr=0 ts=67e98aa3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=Ns9eNvu6AAAA:8 a=EUspDBNiAAAA:8 a=_LDb0pKpX-kM06tvKcsA:9
 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=LZLx1i01EnjtqRv10NxV:22
X-Proofpoint-ORIG-GUID: rI-VKF7omvyIDPeeAK7vxeMU0iTsDUfH
X-Proofpoint-GUID: rI-VKF7omvyIDPeeAK7vxeMU0iTsDUfH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=818 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503300128
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

On Wed, Mar 26, 2025 at 01:34:14PM +0800, Hermes Wu via B4 Relay wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> When start link training, interrupt status INT_LINK_TRAIN_FAIL can
> use to check link training fail and no need to wait until timeout.
> 
> it6505_irq_link_train_fail() remove from interrupt and no longer used.
> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 25 ++++++++++++++-----------
>  1 file changed, 14 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
