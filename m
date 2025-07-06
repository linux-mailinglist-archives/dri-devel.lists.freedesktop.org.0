Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCFBAFA4C6
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jul 2025 13:29:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EEB610E27E;
	Sun,  6 Jul 2025 11:29:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aqXA7bPe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F46210E27C
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Jul 2025 11:29:12 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5666xTXu015390
 for <dri-devel@lists.freedesktop.org>; Sun, 6 Jul 2025 11:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=lOiTYgyfVIMNWiK4w0/cs8AF
 7/kBmLhprudO0TxQlMw=; b=aqXA7bPeLDXMYyyOTyJDAv+e5Ks8riQT50oD4KSQ
 H/Jz/bo2qBgCR4E86+i2e7hlNaUz9OYlVw1JrcomAK6xKivHAVCS3n5pJfS5gz3F
 H0OG50uUqKOrpNsLsR3V2jJdDWRbvWWBTSxQ/S7SjJxmsO7yGQiLQk375BlaPtC0
 WxLubewP40Aqy4q1nFVCGIpBqAKvSGHmKaREjIz/Z1pyLyNZ4p/yuWYMmoyJMHLE
 GvnFWFNwGpbw0ZDM/Y3NawgqHsVa/cv0Y37hcaqiWhLM8KzdicgN42C3jR9XmSV1
 pCaXMiGFzygUgP3WRVNDGkyYRYWIc3t9h9ISD02/mdGdog==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu0vuqk0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Jul 2025 11:29:11 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-700c2d3f3d6so19281466d6.2
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Jul 2025 04:29:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751801350; x=1752406150;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lOiTYgyfVIMNWiK4w0/cs8AF7/kBmLhprudO0TxQlMw=;
 b=CAYrAaTDoqx5jMzUQX7sufJfIma1Thk7d0LdVErwwsrOR0B1p/joYG3BWz+ioYVhk2
 L7MaPYdMjNvQALn9xCckG8HfFiLaCXYgdM/a4bscpd08YRCcBQ3lu+5j8wwg/mOzxpuL
 0X1GZWVncpOkCOHk5goRa/Li6LWD4xJOfA6MS+AqHWJXUWk0ZkGNZZa0Tu38barCW9M6
 zhiGqAbClf8G6r+eWVU/5qxZzZmJdwcs1QHO1o1HhzyM9bvQo8u+OOgkKlvv2QvBUrTQ
 AFd95UMtZAxe9vtylrjnUu/rh9SsRJKqbFcqxZbkQghQx5DSZW155F0Bh1XMAu0IMXsq
 z7RA==
X-Gm-Message-State: AOJu0YyXYf2lpvH/hH4ohk1kTVhWhAfKaPEuK03vQwkt3WsIwEm68dub
 zw9bxRTboycv8df4AWZ+ioeNs1M5XOiUUHOiaG7Y0vinqgIoxi6Ua6PgVDk5bsUTteKfBB4D92e
 0MQtGUHHSA/GVEXTdtg1eR/RObYq1cGrvvadyYZ/Gcn3qkH3UpdCccP4tCeiNlmtt4vkUoEYKgi
 q9DvUD8w==
X-Gm-Gg: ASbGncsLQxze9n4KaiZUFLP/YfdhyhMy9QrYmB9a4Vk1r5ZsgT9MnziFqvE/TjP9fd0
 ZOaPMH13aTp6EHKIMlzdgRpy13QB3JmA/mkmWsdh9LKpxUIzt0VIGGTRf4QFNiQ5CBOYdqMAzta
 zh5tT5iV3aTfIF1me3zOJAAeURObYR46rit+RaUDg9WVJ0gpfa5/XqTXs/Qa2ZJoDcuxsj3CwcC
 5zc258rtocLWGA7IMAa/vSVTQPmKt8CpESYa3RcnoOnTZ1yROTrudwxdOW+usGbF69i3pq6iTiu
 5sLVIhQgyoLA8QeQHWn/wbRfAmC0kh6I7KaUcXuvC7+DxP7VQdMehMqHnA23Oel2OSMQONttRsU
 vFk1B3SIabOo/yl7p+pd+kJMtpjvf0R5jR9E=
X-Received: by 2002:a05:620a:618f:b0:7d3:90e4:157d with SMTP id
 af79cd13be357-7d5df193723mr1369696785a.54.1751801349782; 
 Sun, 06 Jul 2025 04:29:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjf8ujcCZQK3OmeUY/Rbyy94Je/ZQGZrfGrXCuVC9ARaWg05Xdecj7xqhXN4rspflfnFHB/w==
X-Received: by 2002:a05:620a:618f:b0:7d3:90e4:157d with SMTP id
 af79cd13be357-7d5df193723mr1369693485a.54.1751801349314; 
 Sun, 06 Jul 2025 04:29:09 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32e1b1202casm8234971fa.69.2025.07.06.04.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jul 2025 04:29:08 -0700 (PDT)
Date: Sun, 6 Jul 2025 14:29:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Robert Mader <robert.mader@collabora.com>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1] drm/vkms: Add writeback encoders as possible clones
Message-ID: <27oxphsevfwolf5mpm2vygrmp6wryujwmw65lsb7eqktykdw3z@lahceblqorgn>
References: <20250703090335.23595-1-robert.mader@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703090335.23595-1-robert.mader@collabora.com>
X-Proofpoint-ORIG-GUID: 2jtuJzXmRoGEYE1iZj0iRuFYZGyv0d1E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA3MSBTYWx0ZWRfX10KZ/csgKg1x
 Dz84BODodWX5BA+V8K+TInKETCgsU2qRTIEqr/rYAyQSb32+vK5Ty4Lc8TNGnpVuN+nov+PUWO/
 XGAPwYeugSTFdbHkEOjhhwNuyfUnKie1Gm80R2DO8zK4PzzOoKF2KmxxplH1F7uLBqlWqdkSOBt
 6l9fU+lZIMorBpBGfaupBedIsKWPo08sK8SQ/hG6f9Uz0kOZ6ZtMswCdzVehGzUFdtH504E5AkT
 LlCaoRDgu4ug8r55RHUWEiTodwGVj1/kP521gxWPBh5cpAicD2tsIbYDmdGtwlrykEivzdfIpbY
 Y8M4h6hOxG/cqczDOiNpMa2UEIyxYSyE0f9A0bwdOPxzmTJLPaaRHrJ8uJEsFW1Hl9vGvd161nN
 q1UMinnKaLWXUapwrTwbBRJEx7aakHFEPRqcwtKfAyCF2vQIk61Oa3F9Pju1SxmOpDtTG8/j
X-Authority-Analysis: v=2.4 cv=Rd2QC0tv c=1 sm=1 tr=0 ts=686a5e07 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=QX4gbG5DAAAA:8 a=-ZmrBLKp0mmY4W0HBxcA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: 2jtuJzXmRoGEYE1iZj0iRuFYZGyv0d1E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507060071
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

On Thu, Jul 03, 2025 at 11:03:35AM +0200, Robert Mader wrote:
> Since commit 41b4b11da0215 ("drm: Add valid clones check") setting
> the `possible_clones` values is a hard requirement for cloning.
> `vkms` supports cloning for writeback connectors in order to capture
> CRTC content, however that broke with said commit.
> 
> Writeback connectors are created on a per-CRTC basis, thus mark
> every non-writeback connector that is compatible with a given CRTC
> as possible clone - and vice-versa.
> 
> Using a default configuration, the corresponding `drm_info` output
> changes from:

It feels like the current possible_clones is incorrect according to the
documentation. Should there be a Fixes tag?


> 
> 
> Signed-off-by: Robert Mader <robert.mader@collabora.com>
> ---
>  drivers/gpu/drm/vkms/vkms_output.c    | 12 ++++++++++++
>  drivers/gpu/drm/vkms/vkms_writeback.c |  2 ++
>  2 files changed, 14 insertions(+)
> 

-- 
With best wishes
Dmitry
