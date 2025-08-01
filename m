Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0965B180A2
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 13:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B820110E834;
	Fri,  1 Aug 2025 11:04:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Up3tLr1+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0132310E833
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 11:04:27 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5718aH5d018971
 for <dri-devel@lists.freedesktop.org>; Fri, 1 Aug 2025 11:04:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=NgRcL7ZzvTtLCYCuWN7Ar9gM
 KYLMCAowZwuINSJ1rW4=; b=Up3tLr1+ZRyH/8JyXscwVyb++epGiqLhGPbiCd1n
 dg6EXUVBuHHB6ETD4o3lY8aRx21kaXbIHsxw/ONgW+zHrTKjSjhrBxVI/xrcCgJo
 L92+LphSidvf82akRopdNEx4/MCKeAuwvZ7aySqEPplr8SVqPagGgIf9Cls1DnhK
 /stb+p0QSyYmhEKPQ3e61K23zRh5SMkvMjHljJtG9dgi7dRXrxzoPFdbyO/GlTLF
 01ubzJhQWzq39DlqiLUAWLIJUQehyriJRPPRBlj9p8Ucg1DtddqLu8SbzsGarXOv
 nyJRy3GQtw8Iq+elK5hU2cXLl5lhhRsAy9uozCOPY97uvw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qdabgh1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 11:04:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4aef237945fso31866011cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 04:04:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754046266; x=1754651066;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NgRcL7ZzvTtLCYCuWN7Ar9gMKYLMCAowZwuINSJ1rW4=;
 b=PgmH45cTmrX4q0EfhWJkCKQpwLonFkRZdD7FREA0VUxkr4NbveYNg2g5+A3Y5KUiQ5
 KVsc7GPKd/mUxPAxM1u503hVCWx4xxMQffXfrqurySTiA1MXHD4Cp2KqUsocKdBMD7Po
 O+WCTz2LGyfaXwpGxKf+bAZhJ4hU/ECfD4bKB+R3oX5XM1nq+LhRzshq3c7v0JqC3GrR
 C+gZfI4pJYTDAFU62O1KktZFacjnAH92aAN7TB/7DlgumoPENda2LVzmw5m1nr6DcQCU
 G7rdcvamwBAP4ctubdWICylDmebC3DiIllxGt0xHotASxWG8FJ5ElKkh6orZhP7bUGXV
 voDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWm2cl90i3dQUfws5tiZGSIMNvlHlgL+8gSWpLU96/TzRWMfHRLIWW1+DaqUYCf8IWKmUjHqVx+Itc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhJGm3rw9hMhwA5j0zhgIPLz5sQSZ/6oe0COrtMsDHuK194i7D
 o7h1xKqT2f7Tcf+5Zun7ZhNKgtcv+idAxqTM2ak2oUIivNcGQVSrQ2u5b8S1cU/kqh6lk8rF58a
 yYaD7/k6iCDVFfTFv4SyDgZq/kkwbLOx+l/5Rxqy3zsCW8eok/1oE9HhuX4TJA8BgARL+kDw=
X-Gm-Gg: ASbGncvkPrldo7KHt22Qi+wui+E6ZDmZ2Wgizv9Ifv3SlDC5veO0wM/rX0gYffCO+47
 OQqbrKzcyhzMvcRUK1kFmkDCPdt39Y56+c0+EfLI0oUp2j9jKT9uVaeHJAr6/v8lhq+POMo8bcJ
 Rzks5y9slsntOXKc0dWZZxVf/zesaUv7BHvQgjV2P+Ic3gSkDetjzKzBajBImTdI+sCOHmnC5vF
 V+V86CTjsni0Ai47JpZ+fTFEJmtp0ehN6+1yLebJrkj/PooAQDgiREL2ztbY4SRdglFR+TiBVWC
 0YrC26w9zHJVCf48Vifqz4Dn273GLqejxLHxvau1AgBBCvjT5NnqbK4lu1p/zdDHMzHLwF9TXBv
 c6403tRiNrNRBXnfxL6y1/oI+Ut7pws769u3IMeLcEOGqXDhlLs9K
X-Received: by 2002:ac8:6312:0:b0:4ab:65ae:410e with SMTP id
 d75a77b69052e-4aedd3d7118mr112659751cf.29.1754046266190; 
 Fri, 01 Aug 2025 04:04:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuigU5I/fNY+R/JXK4FaI194+ce8U1d910+DeVFR6Gtmc8iLAg+RFSFlfj1DqL2LEydQoptw==
X-Received: by 2002:ac8:6312:0:b0:4ab:65ae:410e with SMTP id
 d75a77b69052e-4aedd3d7118mr112659231cf.29.1754046265530; 
 Fri, 01 Aug 2025 04:04:25 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-33238272d3fsm5667011fa.5.2025.08.01.04.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 04:04:24 -0700 (PDT)
Date: Fri, 1 Aug 2025 14:04:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the drm-misc tree
Message-ID: <bnmpfzdhbr4wlpk4qfcewfotmstbf53ulni3jo7bklranpq7ls@qugmpsudkzzy>
References: <20250611140933.1429a1b8@canb.auug.org.au>
 <20250801143440.59e13a4b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801143440.59e13a4b@canb.auug.org.au>
X-Proofpoint-ORIG-GUID: z8Gk1joW38VuTPuSZ6qfq7iAQzKmgA1b
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=688c9f3b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rOUgymgbAAAA:8
 a=83lZ8fBB0w3I-Wmrrl8A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-GUID: z8Gk1joW38VuTPuSZ6qfq7iAQzKmgA1b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDA4MSBTYWx0ZWRfX7W7GrXe5eoE6
 +K5QcQKHvBFHM1qs+XGkSFf23D+RJ4kJKZb1aLv92h03eY0SjMpP+PpzdZDUsQOLhA3Q3dUQrou
 COOikYSdEF/2hNeLGKf1PNR/Ow5epwBwPuQ/GPgYfNcdy7Ljr18BKRhw7vKaoW5jSkVVIzCHjF3
 GSTL3s10ZZkVV6pro+KWHXNYlc1aAw6gqT2ig2JkwEU0TuNVFCCDlrjIfpylN3lz5xQU5y6ei3Z
 ehCT8El1t+yQRn87RNQ8JarMnX63ZhZfcYkKX58oBSsF+yTEuniKlnrTlK02m7+CErKCZ1nXtOr
 69daR0y3JwtIN7eG1zd2GEAXVAo0pVLlAVstUTyqbJlM3zH0LuvIuunFCNwytLFjFoj74+flC8V
 7Pi8jv/3h1S94sQDAYvxFsI2XwB/tRodtmgCtfxBMVSbVL1zjjJZTesl2MIQ0NCiRPP0wZKj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_03,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010081
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

On Fri, Aug 01, 2025 at 02:34:40PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> On Wed, 11 Jun 2025 14:09:33 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > 
> > After merging the drm-misc tree, today's linux-next build (htmldocs)
> > produced these warnings:
> > 
> > include/drm/drm_bridge.h:943: warning: Function parameter or struct member 'hdmi_cec_init' not described in 'drm_bridge_funcs'
> > include/drm/drm_bridge.h:943: warning: Function parameter or struct member 'hdmi_cec_enable' not described in 'drm_bridge_funcs'
> > include/drm/drm_bridge.h:943: warning: Function parameter or struct member 'hdmi_cec_log_addr' not described in 'drm_bridge_funcs'
> > include/drm/drm_bridge.h:943: warning: Function parameter or struct member 'hdmi_cec_transmit' not described in 'drm_bridge_funcs'
> > 
> > Introduced by commit
> > 
> >   a74288c8ded7 ("drm/display: bridge-connector: handle CEC adapters")
> 
> I am still seeing these warnings.  That commit is now in Linus' tree.

I've posted the fix at:
https://lore.kernel.org/dri-devel/20250801-drm-hdmi-cec-docs-v1-1-be63e6008d0e@oss.qualcomm.com/

-- 
With best wishes
Dmitry
