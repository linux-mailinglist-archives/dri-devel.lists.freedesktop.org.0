Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB9AC2A0CF
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 06:20:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A0B010E0C0;
	Mon,  3 Nov 2025 05:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cWqpkcDy";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QE6GMGB+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59FC110E0C0
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 05:20:25 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A2MUvX21338875
 for <dri-devel@lists.freedesktop.org>; Mon, 3 Nov 2025 05:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=7GGfOekLc0CHGGD6nfIjuSVS
 vP2PeOzTU8l9vvvf41g=; b=cWqpkcDy5W5BxSkQBNgW/S3VUlm16SZ7FShTh7qS
 gcmzBRAggLjDO6GqPMVuljyLcXT1Kh4SbSP8YltOWB7FFRftBxSGn555j6KTRlNJ
 /bsRe59GNBHzLF5uTVKOFI0v+8qbUA9BErYvkPDnlc/wqSOQ6Nimm8oFqCAYIj0J
 EBlNFsxGWjl4ZuqT9y8hc/yPZFqEHxF7mRgouhSTIdcoWok7fwnbG2+JZn66g0pR
 85CF+wQ3018k7UUM4kRUxz8fi5+y/nZG8X4e0pALJrkR1r0+qubMYlpQ1TIV6Ggo
 /ybFcu1qsoX5YXzOpNQyKU+HZbIWgGsMw/bFlTEZ0mWMZw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a595rueva-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 05:20:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4eba120950fso105367741cf.2
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Nov 2025 21:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762147223; x=1762752023;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7GGfOekLc0CHGGD6nfIjuSVSvP2PeOzTU8l9vvvf41g=;
 b=QE6GMGB+fPJTAccbsSUsYg1DdUDZ5hR6VzApakCq4Uu36so42qTFkZ95jLzVF92VS5
 SfDJlkcId2hWVq9wEepK4nhjhBRWXwv9ofP+MB0zNyknt5twICDk4EUT7SWT+HW9GPrX
 Pc+1cKzuUkQbj/CpVaZgcQFIVc0clCSOK/WxywjjXjS0a112TitG1KUp4SeruiKW90TL
 jRKM7d0M+opt2qYNIzIu6lgpj3evY02LzdpKURFKq8BQIYywWCTM6Q1Mizr1qLAVv+jU
 DVHI5ATgnbQOt2sf4Ud7XzAbi4PEb/BTmi1UlF+Wc8jxJr0GUxLVxXuopVUY99XXfkFx
 HL0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762147223; x=1762752023;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7GGfOekLc0CHGGD6nfIjuSVSvP2PeOzTU8l9vvvf41g=;
 b=mvk4RHlutB3IvV76hs4FvgZ/GQLH84QzUPD1FSfiBJetj6Gx8SFXv87XP67J/q31Qf
 xc0KZGubOdYmKFvc1Txypcs1ukS+BatlAN3wrm7hfc+P6qmSonqDEk0O3iBl+3b5on+y
 NUZKTp/dmon+joeDeyY6QZu0z3Q7yW/dry8f3ePCKjt4P0pn9Ix8k1uy5jpprxQP5z2d
 61T/Vo/cokiDDCloZdlyZqq9WySpYR8SoT5D6e3TsPwx0G9Q5X8hceD4Uo7U0RLcWfJl
 MszxTCuhayLwTLyHQyn/MWrRAIgqHz/15Sv+1tYUw+QGPdi0roRrSBE1X9XbVaQB0IyR
 dp3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlk34HCDDtGJnFzjd8Z6yJNxB9yDkbJfb46mVkfB1m5uB84pZh5VpYqfHrj4ptOwaekzKE8dFO320=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0kOG9oSgmKnHGs4/e6Eh+7/WwO69kifkgmVZF9CLqky43OEd4
 SWGyT4Zq946Cd1LDtl+kH5hN+cPULt34EgK9xQP2tv7LoI//ggu5UqQIav87jNrNpwi6GQJQPV1
 yQ9YRSAtrPRxOFvXO7AAjLbwEFQFE92W70t/OH1tQCTtUZk/RUddzvPJoOCjhXtLTGAW1qI8=
X-Gm-Gg: ASbGncuKFIj3CyW/euUxOGb6ac4LbMkOP7QI3mZtkV0C+f1XEV7zPm5FJonmnSvYsEe
 Qxvhoso1CAf6qk6/CsWk942fIj3V4l6bWbTXO+N10MNIFXgqJwlqTNMZM8AE9s8PuCSZI+RRHe5
 1rL3LjaZUZSm51e3Hn6mxAf2Xs64tGKmex6aad4ME9nQ8DnpPi9Xm/RI9IRwF4IsZXI+JhBm6T6
 nmucKB6hJ3n3/IEd5aVhHepZsmFe3j36lK2RAf9QblJ9JSsCDKT0RSAOGDOOJaUU5RtpMUcFku+
 nu0/fovhTg/6dkCuLqXc85JpvGk3yQ2lvz6wHyH0JC/pnxpoqtDSOr5wESBfthJceTZnYUwYZrj
 7kveaoQrZLl69tYBPNOwV6XcDRM7i2ibGHskVMgLYx6iVrhk22Gifbw69emoXXXXFRErL0AgAMy
 XoQLZXjDx9mI0I
X-Received: by 2002:ac8:6f17:0:b0:4ec:eef1:52f9 with SMTP id
 d75a77b69052e-4ed31073eebmr185256511cf.67.1762147223412; 
 Sun, 02 Nov 2025 21:20:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlxVVTClCdm2b14QJHu5NecoS0dWkyd0akYNoXO8ZN/iF/gNbPqXOw3mB1GIGfjm+us1bdjg==
X-Received: by 2002:ac8:6f17:0:b0:4ec:eef1:52f9 with SMTP id
 d75a77b69052e-4ed31073eebmr185256241cf.67.1762147222851; 
 Sun, 02 Nov 2025 21:20:22 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5942e2bac22sm457536e87.62.2025.11.02.21.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Nov 2025 21:20:20 -0800 (PST)
Date: Mon, 3 Nov 2025 07:20:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] drm/display: bridge_connector: get/put the stored
 bridges: fix NULL pointer regression
Message-ID: <whkqe5j4ydzjh6f7qiiz5q3dpqwry7anadpzl3dfvjftz36tua@zq4vkvriadci>
References: <20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-0-667abf6d47c0@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-0-667abf6d47c0@bootlin.com>
X-Proofpoint-GUID: 0yB_5Y5kuOAyQ3m9k8qvzcJxMApodg2W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDA0NyBTYWx0ZWRfX5mljb++1cW2G
 8D5aATVVqd+UZmRgjt4m6FLPC7eWKC4djo986H7oLAPUl++Y/xjTW4PrltPFOFSRa2PfBnqnl2u
 ClrM2wwDtJqsBbVKTslJ3kDoIysmPqDhwrVk2NFjfPMitT+O95JX6hB5qdDN0fpoV37bNGm+++O
 56sMDJ6qh9vpFSKayO3nBUgICk5V6Szujk4OuC49Z25M1vN2BJu1G3LGq9XZ2v4M4U850KYywrP
 he7jcx3ASwtlwBMxjLxC3Ogsafe2AZqZI+gCGQcOHLhGjObmQPVQ+hxa41bZnUG9A5RZhxq3tqO
 pzYatfe9rWUfTM632D19oC/B6BBUJuVFgmF0yrT9nKqlZfrYAtuPx7UtYfRjudNtgB3CCv2THC+
 Hvw5RXnC7Z0Wu5qDfFX3mZdFyZ1wJw==
X-Proofpoint-ORIG-GUID: 0yB_5Y5kuOAyQ3m9k8qvzcJxMApodg2W
X-Authority-Analysis: v=2.4 cv=XYeEDY55 c=1 sm=1 tr=0 ts=69083b98 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8 a=hD80L64hAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=AWrDNu5aXUrvGcUHwcEA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030047
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

On Fri, Oct 17, 2025 at 06:15:03PM +0200, Luca Ceresoli wrote:
> A patch of mine recently merged in drm-misc-next [1] has a NULL pointer
> deref regression (reported here [2] and here [3]). Being in lack of a quick
> fix, I sent a revert proposal [4].
> 
> The revert proposal has no answers currenty, and in the meanwhile I have a
> patch that implements the original idea but without the same bug. So here's
> a v2 series with:
> 
>  - the same revert patch
>  - the original patch but rewritten without the same bug (and even simpler)
> 
> Also the re-written patch is now split in two for clarity because it was
> doing two somewhat different things.
> 
> [1] https://lore.kernel.org/all/20250926-drm-bridge-alloc-getput-bridge-connector-v2-1-138b4bb70576@bootlin.com/
> [2] https://lore.kernel.org/lkml/336fbfdd-c424-490e-b5d1-8ee84043dc80@samsung.com/
> [3] https://lore.kernel.org/lkml/CA+G9fYuKHp3QgPKjgFY3TfkDdh5Vf=Ae5pCW+eU41Bu=D7th2g@mail.gmail.com/
> [4] https://lore.kernel.org/lkml/20251016-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v1-1-81d6984c5361@bootlin.com/
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
> Changes in v2:
> - No changes to the revert patch
> - Added the (corrected) patch introducing the same feature as the original
>   buggy patch, and also split it in two fir clarity
> - Link to v1: https://lore.kernel.org/r/20251016-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v1-1-81d6984c5361@bootlin.com
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> # db410c



-- 
With best wishes
Dmitry
