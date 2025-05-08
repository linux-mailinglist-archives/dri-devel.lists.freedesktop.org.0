Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD72EAAFAE9
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 15:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B8910E1CC;
	Thu,  8 May 2025 13:10:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FZbZC116";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A38D10E1CC
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 13:10:09 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5489cTtH013054
 for <dri-devel@lists.freedesktop.org>; Thu, 8 May 2025 13:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=w/O4EtEjKK+qxbkmtbfvbyAd
 Ep6/N7mvPIzRsQHghBE=; b=FZbZC116dEhg/lCpeG0WMcIP6bTCI1H1YrNIJ19s
 uFrkXgxtEeo/HjdKpWVycc7EuAyNoyML70FQLGC/kjpRpIIthFxRuASfJmIphsqd
 1PXzzmv24l5s505c6AL5teBZm3xJS5Zmk6XgdOAiHojt6VPskIG8i7E8ZVTjU5VH
 P0AxxDhV4D5b0gdbDDP40FWoJEEVGlwDfxYyDzpPthuKVOIKL4kalgQEgkN8Qaxm
 IUn6tbgybzb2bpl7gfK8vrFbElTSAmAxDbywD/Q1boLS5Vhg3vcNc6u/HRs1S6HQ
 vrLxa5pbwYaNSR/xoHN2427k+iTryH0hsKona/Ts8UiYsw==
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gt52rjgg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 08 May 2025 13:10:08 +0000 (GMT)
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-3da779063a3so10595325ab.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 May 2025 06:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746709808; x=1747314608;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w/O4EtEjKK+qxbkmtbfvbyAdEp6/N7mvPIzRsQHghBE=;
 b=T/X9Y+4r48paPwl1Ug6CDl4/W+p3rGJazdCsB5BnKld5txcUNeoRH0n9MibtNHmtfK
 Qb5TDBtz3eGh4E0EO98Us/hLgIz+qPRfMNyndDxjHGBNSXOOwEaTLyrDf3d6TGraWrot
 C3LkroBMaPmcmVsZvNqztcHPaBoJOgl6Ga5JXVwWrYooQeLANR1XhnT4iNGfVUNPGMY9
 +8CujzGqNY8HaH5SEW/om+28s7q60vlkzpHKuJR0Alm2336w3n7AAh2EfLm0zbuy0a7M
 Mt5NzWKZGmrejHSdAkN/Ebz04c73T57Vz+18jtxGP7f2AV0S/XSdJE6L/DcN5uJGou+6
 wZJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3TcgWOwggJnslPJncEwm0eOuFquBJW5pR92t5TBI0ZGWmhPzanLgwwOe2PzOSbEguB8mNrsJqm7I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoI+7px0Kj/wUHigrwnILlWXEhadnj5I61/FuRvfStdUDg0Z92
 RqumqPdH6UU1qUbLZacYWZg/CYr56b8iaJjEcmHAKbALMl59ra7N/zyIU0n1OskXNGwIWvAPi8N
 5qkXRB/a9pS8a6fY8jqHG8dm8D3v4TaLnI/5mllDwYXxGW2a7zgtx8GAhTgx60aZxl9I=
X-Gm-Gg: ASbGnctckzwdrfcYfxqcPgGdQoY2KUbL8QI4wqc8VT3wHJIcrxKM/VzAmb3QNNBX2dr
 dyYRJSTDoOL9+3vEu82aq9p2iUnKEHiVRy2JMeee+OB7LEF/4+qDe4MZbCG+G2ndfMWDvo8Nl6z
 ccNNJvAm5Urx9EPOAkSxI7hBw+DRifULi1WCVNSiGz781FyW8VCdxroXWPcm08MmLim381wk5+9
 IY6Es+kB63C+Gg29DL4ujpFPMLqLcH4eF2ErlxGG2u0F8/pPuGEg2jsJMkr9ZnH6gcTF219mh7/
 RvfG6Eo+IDlqPYdVIzoxjnoTnKiATYTf27Jp8jH4bsjLZdMIFG24+5Acdy4TLf2rGcM9U4x4J+Y
 =
X-Received: by 2002:a05:6e02:194e:b0:3d9:39ae:b23c with SMTP id
 e9e14a558f8ab-3da73930025mr87333565ab.20.1746709808045; 
 Thu, 08 May 2025 06:10:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGB314junkzcSWTlXKpliaMGOOcVxB2b9W3HBxoMLJhqRFuk3kZ19/VfaMA3FAuObQqYvaDaw==
X-Received: by 2002:a05:6e02:194e:b0:3d9:39ae:b23c with SMTP id
 e9e14a558f8ab-3da73930025mr87333165ab.20.1746709807695; 
 Thu, 08 May 2025 06:10:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-326c2d937b1sm71441fa.55.2025.05.08.06.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 06:10:05 -0700 (PDT)
Date: Thu, 8 May 2025 16:10:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 10/14] drm/msm/dpu: Use dedicated WB number definition
Message-ID: <b4e6kiaxlsth6ix6gxlfgfzracx6sogv6fnm6yu42rbvrbprp4@ih2cgxtyuwpd>
References: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
 <20250506-quad-pipe-upstream-v9-10-f7b273a8cc80@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506-quad-pipe-upstream-v9-10-f7b273a8cc80@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDExMCBTYWx0ZWRfXy7dGRiv4fHaw
 IO48R8OMJUkrcXGH7wE8uyklIq6jNw6EMwH6QBt1TDoKstEo65Kk0LssVFG+Tj3j4syQls0VwBb
 R7Z3pKxLIMO96uqTKvpatXQJ5Ag4Fav3a7gbFbo6nNfb3R/ip1j/aDFYutHqJpQpzNo0XQC0Th6
 xJHE0KCNyBbC85jZlg8hGxnwt0Ae79enqt2MnLTDZ0PhRNmb9AwhClj1LgLwUboAnyEQq48nri+
 rRfLlCkcqTSTtwucOLEqIfKO13CUygSrs2Ir1P9Wr0bnjjWAmy+mMW9jHl45JWQimt/VoCniu/O
 E9rDYfhbZtGt2+VDOhuk05U4ZMxPfcitSEaq9avh86Zt4dPfLRjKUbUda1zWII1cypr5kvCx659
 ZuQUJ6WjAo6KDYIqbXvmUFQUpgCpCYYUn4BW3Xm8sITq0J2jGSzw5Tq/baLfwHWDmFJd2G9e
X-Authority-Analysis: v=2.4 cv=LKFmQIW9 c=1 sm=1 tr=0 ts=681cad31 cx=c_pps
 a=knIvlqb+BQeIC/0qDTJ88A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=bMUmxHA0tSjQgQxMAzsA:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=8vIIu0IPYQVSORyX1RVL:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: tAwE4wtZ1JSdNZjvI60Jnfnf5Z0PooW3
X-Proofpoint-GUID: tAwE4wtZ1JSdNZjvI60Jnfnf5Z0PooW3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_04,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=815 clxscore=1015 lowpriorityscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080110
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

On Tue, May 06, 2025 at 11:47:40PM +0800, Jun Nie wrote:
> Currently MAX_CHANNELS_PER_ENC is defined as 2, because 2 channels are
> supported at most in one encoder. The case of 4 channels per encoder is
> to be added. To avoid breaking current WB usage case, use dedicated WB
> definition before 4 WB usage case is supported in future.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
