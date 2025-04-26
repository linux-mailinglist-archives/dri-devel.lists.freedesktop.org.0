Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEDAA9D727
	for <lists+dri-devel@lfdr.de>; Sat, 26 Apr 2025 04:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8DC010E17C;
	Sat, 26 Apr 2025 02:07:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SVP6Bnra";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B13010E17C
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 02:07:04 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGKFAs002047
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 02:06:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=hVfsLsmSAu4FPUjKiv9wh0y2
 VuLXMaFjQQMfN0b6AAQ=; b=SVP6BnraL/aN7XzJbJwh/h1hbwgfAQOU5e1BKV8u
 MzrLGiNl4rVNgwWz5osi21AB4fVMxDtxzEAZ5hCvNepmiAv4XKbycK2OPvOPDSrX
 lvIfFHt4cQ0aMyVl5G3cpAvAwwYtGoHWhYX7F47kvvvt2s6yk11MkFgzRmU8rPRW
 7M0E0mmnmZCOclUZgxXxfBlde5yNA5oCZYhRUransiflieLwMSFDJBJMSjbfn4hK
 yLjBpfQZ5cufjfgFEQcijXaqHzBF2bxZs9vSWlhcx0oPZeOCHwn2Tv2ibXzWMJph
 hGoEx74f966Om4lvBicTHtpDHRDXIz+6Jbg63FBnebzqKQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3jqq3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 02:06:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5bb68b386so815324485a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 19:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745633213; x=1746238013;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hVfsLsmSAu4FPUjKiv9wh0y2VuLXMaFjQQMfN0b6AAQ=;
 b=TE8u1OoGHeATeJf1eViPmrM82eWLC7LodDBqYn5zMm+krOrvquUHPPwC2FyH4r8/Hz
 XMS8jWuuGKLzud52uTHmxNbNHCv4PaGhJ0DBoASNUmTm9hLG3zNAtgQAKebq2W6wT1AB
 vlYDGvo7/Mo+RHWLCXP6Bx0vaB5EW34eJBtjXpCX8tCwv3og0IwepWefsjGskoh87EhH
 8dxyVif/X6ZKijUFZtXfAXoB01dqzyLB8EOzclaTo7cgWw1KRFNt0ajhMP1aCDXrHx4B
 jubhftsID9ttijeeUZ63J+66RpGC/r1ZmN8834CNKeZiqitIQP/TsePKOaXLnUG7OTMl
 uBOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUD2ZpIFgR2RX8QMVNLYRATP3/FCC+S+W9fz7k42zeP//NpvWtPpL9QaOeGbKZiBrYLvnfkggQflIg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywiamiy4AketYE7IuKUBGxeq3eZNkatWDhpp1YT3xluWh6HGZQb
 mau0XfcpQdy+Z/I5BGUP8FusZYLtc1mch3+pKZmaUtQOy4AdXW30PeAjyTysRIfxLql64/cTyqc
 BLOPk093KgP8wSbr5BVtiKuw1RMQ/cVlvVbn3yrM7aLctwC40afbcSl39aHTwBj/ZMtI=
X-Gm-Gg: ASbGnctUgPOv4k1R4IT1fSyhPNoUKVn3fUUeiccq7N6opxz7Lpb09F5PNIfVf2jqEJn
 o/rw3J5tb0q/V+lax9IW+Psd0J6Xh/buOOcrZoikT8PXevpai+2QZ9Yk8KTZjzCWth1fbp0Cy2a
 l2+GW/KMr7Wl7AsYCeZi8hUn9dAKYZ1n4OX2/4z4sba+QaUT7ZMe+UJifXN34EHSdCUUuK/8EiD
 wA9nQ7XEJn1oW8hz6KGw/C/dfORWVQpkgM9QL4Ri6Dzejplm0KifKNKAwIeaE8/VrkftFMuoLvR
 RSs4QN9Cc8aW+OTv4oI8CjkfCIsIn/tvv1lwhMydnYrVFL2B4Nfqp1I+c2UafqAdqOXtSceFzxU
 =
X-Received: by 2002:a05:620a:1905:b0:7c3:d5a4:3df3 with SMTP id
 af79cd13be357-7c96687d640mr321885585a.34.1745633213174; 
 Fri, 25 Apr 2025 19:06:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4SMUT4h6GsDQGdEqaKfY00ULbElXli4PoIut0Y6O7SlBmj8y5hZZQ1GnqVySpZeyf1n/gHA==
X-Received: by 2002:a05:620a:1905:b0:7c3:d5a4:3df3 with SMTP id
 af79cd13be357-7c96687d640mr321883285a.34.1745633212842; 
 Fri, 25 Apr 2025 19:06:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-317d1b96e80sm9809931fa.103.2025.04.25.19.06.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 19:06:51 -0700 (PDT)
Date: Sat, 26 Apr 2025 05:06:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 07/23] drm/tests: hdmi: Replace '[_]MHz' with 'mhz'
Message-ID: <t76t7yilgl4bwzwgtnjwl6f2zjpgftbk6g5gdqu5yzqq7xa4jk@cyan56ziptk5>
References: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
 <20250425-hdmi-conn-yuv-v4-7-5e55e2aaa3fa@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-hdmi-conn-yuv-v4-7-5e55e2aaa3fa@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDAxNCBTYWx0ZWRfX7hciSMGetswx
 HGnxQUwgFwN7kVJ5c8/MGPPGNUe3egOYletN83m+2vwORFGEASHsoyU/w7UNuCw0uSu9DOKdMSB
 +45YDCJgBS1HQiIvtovbyKYc3rDl2c9fQiPFCmb4uCGlUX9ojApjOfNpZ8TW9fBO1KTe23yN1/E
 8Y/4m2dkSQpFTO+ZiiYEszMqPizJxutFYkNAAx0Vah0de/4IAUUbF9MpYshLZznYfLdYCueXOAn
 PYyO53YFdbxcb62DLP6aXJBhcT+JKjbGl918MALIBgxkyP4uZ6ZyyoXe3aQt8Oe5dbhVIA78frc
 LkfIkjsjg03S1ul2U637MnQpP1pjxtO+pB5iWeEo2GYQbJG3nWpC4/t8kyV4hJLpnTLFZoBfEMT
 c7Jq+5zyjir/GbGTbTOOhHBr3Fu1j2DtZcEfvFKaL96qXYCEJRxyt7lMrDKgWmlnarWYeYPK
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=680c3fbe cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=UTU-KeHaearOzU57cusA:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: s4rhBkQFuTZyBJVOMcjeCumxmX5jfEhu
X-Proofpoint-GUID: s4rhBkQFuTZyBJVOMcjeCumxmX5jfEhu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=900 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260014
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

On Fri, Apr 25, 2025 at 01:26:58PM +0300, Cristian Ciocaltea wrote:
> Improve consistency throughout drm_hdmi_state_helper_test.c by replacing
> the two occurrences of '[_]MHz' substring with 'mhz'.
> 
> As a bonus, this also helps getting rid of checkpatch.pl complaint:
> 
>   CHECK: Avoid CamelCase: <reject_100_MHz_connector_hdmi_funcs>
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
