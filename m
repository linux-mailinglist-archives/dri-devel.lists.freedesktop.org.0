Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F927AD1349
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jun 2025 18:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE84110E075;
	Sun,  8 Jun 2025 16:23:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ItSyQmRG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA12210E075
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jun 2025 16:23:48 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558AbgdA019322
 for <dri-devel@lists.freedesktop.org>; Sun, 8 Jun 2025 16:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=8BqS9FGjG6k7xRfoTZcE473z
 hdynVB2jR8LCaPdZRKA=; b=ItSyQmRG1EBBs5ffrgyrg3pFJwmgWjD2NauJpulX
 Wx5/+bAzLz2OzI4PGCEfe2Hg22K1oMbZLn37Z5Sjng+GggnhAGNGuR4j1cy9Qg1O
 qHmb5XX9wbM8RCK8XhA4nIy0serAmfmcJGxi/I4BlRo6Lfzw6/MjE5iQgiYJ+srv
 FqmX2N11IOxnydogILWb8mHk3QP0QGNGQrkU+Do1pwQZ0pAY00TsSqww7IRcZSdQ
 H282VFtQ+4CEJWrrMOzV2U4lqSQU11aR0YOyUThtf8Y2Q805BCyN2g/HgEc/glSj
 2koLs2Nrdp6n7pdeHx/BoAuWeevYTbf1GmWz2kNIQn1PFQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxkfs1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jun 2025 16:23:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7d09bc05b77so576126985a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jun 2025 09:23:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749399824; x=1750004624;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8BqS9FGjG6k7xRfoTZcE473zhdynVB2jR8LCaPdZRKA=;
 b=uwSqNbjanDLBwYzaWi2Pdu7rkwgZ+tdwdET/PrnJ2OF40gceEl5cvFHo0wzhpgmpXi
 B7Tbn0bS1UScEHjMGqaRqWsgIYD6lb5yiw4Hf00kdZW214fqTIOe0j074OaeJUyOlkZf
 QEyTgjWJaw+WrCKjGPuJ98Dszu3PWXY9lpmjqIgchPJnR+0cq/SiRNo2YjT1UM8ZK/OZ
 te7WFnz+KUhJgeNicXKN05rfBewEqUfGLnB93UPe0yQlGgTgnKcipq2IoyvL9sEYlpKY
 GJGNsCzVXYGRo/MmkyaqyZxqOATPg6Da1xm7tk5RomZvUyBD5rBUJicnpItoUschdaI6
 KMmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVowpcsVzrNg/2v2YfX6LHDonGpRrKjceMg3+bal6O7oQVWmbjJygCrGvBuh8Chdrvts/Jq0TIydM4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyyubNH/ivU2kO7nQ0xQ9bD/QOw3njxppqhiIk7MYY+gM9PuZz
 t0gKilILv0SP7wOMfBBu+7CaeZnikw2L8JW57Kq3PM07Z3pjkvhR6FHsYy+VW+KPtT52sxk9zK6
 g10DzQxCtnkDq9l6r9tpPVFOfvp8jst4MNyoxu9htC9KTrLuv9M5VBivKKe/RnXyLqnP8kJI=
X-Gm-Gg: ASbGnctm4WMzrKDrFpVtSG71H3x2qQX2ZGuwtDiwY+FyfQDiPuij0JeGF8YDpb2UPk/
 TZRFdfm5QzidE9R2qtZUq9doa00mBz9nssxflecc+kY1xxE5Y/N9yz5iiJGoQhatdfkPAYWd0RC
 Jx+glFeYaSnogJuLznpCavXy/W4+l7BrjiL2dbpASuWapeLsTWJtmWBn6Rv1arBGkYAOigTb1FL
 ZJvn414jc0Ida6TY4z2ktbKFuTGDa1WmDZh5vOKynlBNGBnQT4Sn7PPN+AWFjr9mVyP39F4LTWv
 6CaFvXJevUYUHTsL7MLr90zEcF0UXfR+wkHrbDL/ALliNTWktvtc2MNTB3uDGka9pKcphQBD5gE
 =
X-Received: by 2002:a05:620a:2496:b0:7d0:97a6:4539 with SMTP id
 af79cd13be357-7d229896afemr1619598685a.4.1749399823905; 
 Sun, 08 Jun 2025 09:23:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGg/LDaUtrNJz2qS+VkpV80cbp7BJtD4VRp369Ja9UkCitZOa4XtW2IA+TnAf2D4cUhuqPPFw==
X-Received: by 2002:a05:620a:2496:b0:7d0:97a6:4539 with SMTP id
 af79cd13be357-7d229896afemr1619594885a.4.1749399823567; 
 Sun, 08 Jun 2025 09:23:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32ae1d002acsm7590901fa.100.2025.06.08.09.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jun 2025 09:23:41 -0700 (PDT)
Date: Sun, 8 Jun 2025 19:23:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 andy.yan@rock-chips.com, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 l.stach@pengutronix.de, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] drm/bridge: analogix_dp: Formalize the struct
 analogid_dp_device
Message-ID: <ow5357zq3c2ovps5qssnh4afx7cp4qor2n7zhzsya7662nu3pf@3gbs2ocu7qiz>
References: <20250526120742.3195812-1-damon.ding@rock-chips.com>
 <20250526120742.3195812-2-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526120742.3195812-2-damon.ding@rock-chips.com>
X-Proofpoint-GUID: Z03-VHR4EA10F6gKRB2cp1pBhQy8ltm3
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=6845b910 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=Eae2FfFRo20rfu4mho0A:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: Z03-VHR4EA10F6gKRB2cp1pBhQy8ltm3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDEzMSBTYWx0ZWRfX9Ks3NZy8JRCp
 fdX8YkH44jr3iAdvFqSdSRS0gPKizzw+++XLH2I2mRq4VW7p+IebwPtYswvSNBRUU1tDaV+i12y
 Yd+ptj8kQYoOk4qQhWbJ5ScEHk00+MB3zW9nvRiX8rz7a30UEKsDSx5oRHqFhlJIvDG/NakBVth
 /eXibJ5QzyhEj8TC5vf8voghT4OImYFt/mhv8f2bk581HvnacnDrZBHA8zZ2j6bmHvQ2cbdCD/I
 9O+WEydNlqisBMHKbCv5Wk19XHRyvr5oDOvgWNnT5fIiuZvKQt4vztUsUBD1kQ/0ItdSNJlFFB0
 RvyD7Ff5/Yn8VasKF9NR8UM6pv+ttzJwTtXoX53U4G9oUH7HCyQRaOIMkpjvmnc2+JSioiTCUt0
 3ICZoDXy338m9u3f3WwDUz0SFA/FXNwfwvuf7a89r254kz2fSaLmYDQfDc5opgzV2ywbQwZE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=908 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506080131
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

On Mon, May 26, 2025 at 08:07:40PM +0800, Damon Ding wrote:
> Use the tap instead of the space for &analogix_dp_device.aux and
> &analogix_dp_device.force_hpd.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
