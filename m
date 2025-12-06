Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5508CCA9FA4
	for <lists+dri-devel@lfdr.de>; Sat, 06 Dec 2025 04:31:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A1A10E06F;
	Sat,  6 Dec 2025 03:31:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ISUwJ69r";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XL2xlwYM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC4E10E06F
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Dec 2025 03:31:24 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B5FBKnD4177194
 for <dri-devel@lists.freedesktop.org>; Sat, 6 Dec 2025 03:31:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Jd8K2GOuhr1t88wH4EYraA5x
 kKERr4HZOlt68e1bdTQ=; b=ISUwJ69rn29uvLLw10xH/2zfu75u1AhobAPcb4Ot
 udC4cFs7XPhJ32QwD3Ef8wh3UhnjppDUGC7+bU9j7nfEzy2mE9Ub3Mbp9inxMX0X
 LQzB8hbw8a/wLW9hKTYc3psxc3TWx0uaallHc/fW8g/wBMvbXFq8vEm54Hj742uY
 ZCdb+DYZbXFUKiMvzcfE+Uk7paUhsnBYkuKf7pD5Y0ZHlj5eSiutM9iYq8IZrXsS
 cf4831+6RGIt1hECk8kRpwvGpqUYtYFBJ5aHR+jPgoFUGTF04/8lJO2pKS8TZBuT
 RUf5As6h/4s9aEeCXGid/6BGAZnJPCP+Gkka2lXHqTepwA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auwm5adjx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Dec 2025 03:31:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b29b4864b7so625430485a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 19:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764991883; x=1765596683;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Jd8K2GOuhr1t88wH4EYraA5xkKERr4HZOlt68e1bdTQ=;
 b=XL2xlwYMA1iTatqWrw6sxV1yqMe4S1QAR0DI/HTj9hVyASlZMe1997kQOeeeDi3co2
 GGQ3YX6YqbgYsJDtHnkBZGla7Clmz0p8RAXKuP50TlXkXpgu/FSvf4of2s9SUmFK2RJy
 +8I7ukXXPC7Ak4Tu9tXnyqVUX20U8WPWzcs9FEAnaIlbVwsGROALLZaGmVklQ/kq2nNA
 R7YzokvWK7P32Gg57vwErmMHcdIH5SIS/BVboXh7iVIduLI1c3piM6A1fU5yr61Tb8g9
 ctipJyOYc3b2FT1HjnxCzujj9tynopi3r3m5Fakpbo6LU+3z6gAZUMj3/byeb9sH4dws
 IjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764991883; x=1765596683;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jd8K2GOuhr1t88wH4EYraA5xkKERr4HZOlt68e1bdTQ=;
 b=fT7iL1fCcr7iL1SaxtDM8PCcmi9C/Ern+QzfpKPwZ5HrXil+Tac1ltsUMHYLLjueyG
 QKvHnVki2A9EgkHdkcVjj9CBtfcQcWsPB5uWmDcxdqAC5eOGXnao1OqlGn/SypxMp6QG
 X7kX5QvJPJXDE7amZw0OThvBRxp6CqvGQieoJv2op/UrBd7/FuwAPmD1IIB7IR99uL/+
 2d0jJFPRD3yO3XnmCxPqKDGSm+sW8mjBljcLkLxgt8hY7JBQ/jYZCCI3SHz4UGJ8/aMZ
 OLQaOKSwIeFQPb8YsKG2YNwtpTgOgnYrgUSuAFhpc1BcP9iDEyZZMuksNFX87Uceyu++
 Ssug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXSRiOk6Df2HBE8y4BNtktvw8o6/fqGzyKKzt/AV1qVFnK2M/an75kjOk+8Nm4KXm7l8ezKXBsidI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx21qzUOxLldy7YlhWt6DO1QfaKhMxZCK4PB0CBICrOvRd6K33v
 y8VySUwH10qrhxJBULbsOMOnSTDneUJU/7HS4LXVNPicTtjIz/zP/teqax8NK9xzHkzVo1LWDrS
 hY95S+udixq1rIg5LsJJ2HvK5nXAKymqKi3tTKKntgQWlsEqXis3tQkXUZw3Wsj06M10R7rM=
X-Gm-Gg: ASbGncvIHuxdyZykVCkBHW4Ou7n5yOUVufqsRLxbA6qgqS2jXbMmxF7dBsv5ouEP23V
 W63U1ubaHxto9+3OEnGaQiDO0lqiciKZHhjd3BxXJ1P6oKIiSq6Sp+1eqx3dj2E+iVzz5uZMkEH
 wDKEmrrbyYveUBlHXMIEJFSEGUascDEDS0YsYG37vwOmcKN5k+pj6+BsHPbbUXJO8PtWYBdJZfC
 Cgvm54tJtjZeMA4QsZOXmQfPNQp47ZypncXLzFlDdFiR7v2Xc0nhns6RoGKLCwzZDv//WaW+NYp
 u9A3HC0zLytfzxh2hlpTmBb550Pnm8toHdPRdMuReMo/okUkLfvb0TQQgrjgqsHUXZzlyKVCMbQ
 ErjXt9DWApz3EfMg9tBRZ8uXvT93mOJxe2i1CWtYBxd6Iw5BCX66S+sBSl071MUGViqz4TxHRpY
 ufrXo/edvHdrLWa2mIbYgC5P4=
X-Received: by 2002:a05:620a:19a9:b0:892:43af:ba4b with SMTP id
 af79cd13be357-8b6a24ffd23mr189641385a.29.1764991883315; 
 Fri, 05 Dec 2025 19:31:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEq/WTCdX0fKoZ2a2azt1sU2iXBXTs6gQI/MKqx6/FpzOFSetrd+1fb0pJIcD5wp+8nvtWg9g==
X-Received: by 2002:a05:620a:19a9:b0:892:43af:ba4b with SMTP id
 af79cd13be357-8b6a24ffd23mr189638585a.29.1764991882924; 
 Fri, 05 Dec 2025 19:31:22 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37e70596be1sm19423201fa.25.2025.12.05.19.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 19:31:22 -0800 (PST)
Date: Sat, 6 Dec 2025 05:31:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Xin Ji <xji@analogixsemi.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/2] drm: bridge: anx7625: implement minimal Type-C
 support
Message-ID: <kozspjah32l6czhb6kj7jba6vz2wbqldrhw6rov67ujlegrbby@3aeqmn2oico6>
References: <20251126-anx7625-typec-v1-0-22b30f846a88@oss.qualcomm.com>
 <20251126-anx7625-typec-v1-2-22b30f846a88@oss.qualcomm.com>
 <aTGJXAnlkK5vQTzk@kuha>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTGJXAnlkK5vQTzk@kuha>
X-Proofpoint-GUID: q5RCzwQxZ0fXmkgExCa9xeM8Tu62kI4l
X-Proofpoint-ORIG-GUID: q5RCzwQxZ0fXmkgExCa9xeM8Tu62kI4l
X-Authority-Analysis: v=2.4 cv=XeOEDY55 c=1 sm=1 tr=0 ts=6933a38c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=tLDSqiJ-wK1CsxduB6EA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAyNyBTYWx0ZWRfX0Kgv6sw9euR+
 zAmLE5wdT/iYHe5p9iahHtFyiWh+2ztTdCaeACbI1Uy8zUiwOh973uOeXdJlb/mIekBIJceRAnB
 wCynkG/2frf4LyYVXzFO4xYLn7bCm15hvAO3LRcStGT3RUiLQiX2quZ2+H04IfLfP/x0Cfzy+hw
 8gYnhS1q+rqghJuVVTQJyoccKvVV4ViXZFxRocaGb8pxHbsLBdQ39Gj7QR70+W0FVblHwJcPHDR
 bIKejneEwCrq/76y4Vjcm8P5uCqGSNskLHpSFhLkrUFPWr599QAes/6mLYIVt2KkzFl3iPudUKP
 vIh/Ij+CQmme8NtZe88L1LmIbpRWhv1HBZFNpBKHJBKJEken/qOT0+pqR36pzJ2ENlOLGDAWiE8
 Usw8CXwEDhhVQwtmpONJZIm5qY2BEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_09,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512060027
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

On Thu, Dec 04, 2025 at 03:15:08PM +0200, Heikki Krogerus wrote:
> Wed, Nov 26, 2025 at 11:41:57AM +0200, Dmitry Baryshkov kirjoitti:
> > ANX7625 can be used as a USB-C controller, handling USB and DP data
> > streams. Provide minimal Type-C support necessary for ANX7625 to
> > register the Type-C port device and properly respond to data / power
> > role events from the Type-C partner.
> > 
> > While ANX7625 provides TCPCI interface, using it would circumvent the
> > on-chip running firmware. Analogix recommended using the higher-level
> > interface instead of TCPCI.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> FWIW:
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Thanks!


-- 
With best wishes
Dmitry
