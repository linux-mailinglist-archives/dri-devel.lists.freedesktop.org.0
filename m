Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC73CDA51D
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 20:11:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5BB10E2B7;
	Tue, 23 Dec 2025 19:11:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SnvF8WlK";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZCJLB1E7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB84A10E2B7
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 19:11:31 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BNBTdeL1358168
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 19:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=5WqlbIqMYypcu4zwIBS5ReRI
 kDgffTefGxU6lC8W+8s=; b=SnvF8WlKENCBEr0RDvn8Kphj5bLzhQPGXY557jvB
 ow+gxmpoHh7FsBJ0ZHkCjTSOHXSCtR5304AvKCNf+BHmWUJHEGie1dLin4NrCS9z
 KrA0JNY65MWCxMp+Xe29L5TU/1IPRdulUO6AieEyYWbMQ3oRLC4PJiP6j4bjgr/0
 22nMk4b4KcIPxAVlVbr3JQqDzwKAN5nWSuSqJC6hJay7/q8kW7Jw83xc4dDNW3Gk
 7QJQbn7MjANWiSJkXdY1V6s30SO/dQcVzUDy/rOjMmN/Ztc8N7sFeaSlJJWOoJMZ
 Ki36BR75vOs7MyLvkSQfHyzkYH//Rf7QNIdsiyEHXnzQAw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b78xc4ay7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 19:11:30 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-5dfb4950a48so8551187137.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 11:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766517090; x=1767121890;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5WqlbIqMYypcu4zwIBS5ReRIkDgffTefGxU6lC8W+8s=;
 b=ZCJLB1E7zRvvPbFAI9ePHVjsMzZepW/Pr1E/WpHfPzVRKKMX6bbMywqcis3mhgevsL
 7I5usuRp73wgaOZDlO5jR4NBFwVUB4U+POI10M4XrOd7TkaZa7G+DKVbxF4QRVFk4GTQ
 bHJhVjsLWOFZDUJnB9fQFVpe3brKfuwLCegEKJ/86Ayx3/4f8xIt8xsFYP2Nme8dKJRd
 a8NyNuk/iL6+KVl+PF81liAmeGBCkH37CMvoZ/cHq93wkf0Jd+YrBX+C/WQ7C8rd4e9Q
 GleKzmFigRzVxjxPjVS+mJT8FGpnIk6Z4PeKz/gBuCe0Z4UXwRoqUUXbABjZBa12S2PD
 67fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766517090; x=1767121890;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5WqlbIqMYypcu4zwIBS5ReRIkDgffTefGxU6lC8W+8s=;
 b=sC4IXI3Mh+R0uzcH7VEEmSFMTXuPRVBS3ttOM3MvYMqhCwWUMv3zQPOntpu9G5McfE
 3iW/146zIdzcKRKusTRnExMlYLIDEjLVyOTbH0OSnDhBFTmUglO2Zt2piZ7eN56umfZ6
 W1o/ZpliEOUkWTb7relfbaA5Jmnhr5R/Uz/G0Xv9brmaMJnEOTRlbS14nBlR1O1HcrJA
 QTYqQeBw3eQz3VtJ3SCvKsi+yv6B4j8Zpwbk0SOvVR4AQRnscv3qs3NsRXftv/w0Hut9
 ig0enwpPD53GAlCb1cw5vuV+RS+v5/jfF/zM7kwzs9pMDIyNvCl+jcNAtzCWsaJSmIE4
 ZUfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKfsE71fkLVpGtj1RZH6SJSn6GYWbFEb0n29Q4anELi0Q1J7Hd95E5gwaLAHOTdFe5gXtmqFoSKXE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyy2LHHS6LuZaU+8vYJa3Idsq5VtF9XxUdQ7HbM14tXw9pF1dz4
 Mpt/CeeQztCZAQEhRzxufiJRkEKbCJrs3Hwwjx5NWfyIL/cN+Skjy6DoBOn4Hwp77Ejcvxmzaey
 2DPFKgvKzyqpC1gXF2q2l64IH1X57d/bNFi/xC9PG7LZoFVtcVTw3sllx6Q49JUuZvdc6/3A=
X-Gm-Gg: AY/fxX4Opwjmuy391o0OOSyRZTokPTeSisQnurGk/E96iCAzrc7cxMCMccwGUrM6SYF
 IlXXKctrJrjD4useheozs8D2IqII0oXqw5RGwxmrcvanLJL2zDMOxfcX4IMbErCCA75dR7SweiG
 FBFJxhbtutIG/E0tZNCPyZBnv9G/MCovMfH8Cgz+ggsg0ip6zqW/IfGSfnbGGnuVnp8keQ22Ztj
 vlaJaTnd7PKcTqoMXeYJCoo2eIgPJ16lAX+9F8FOCM8E3C87gXKLGkFt2ca5cLZ1U/cL+cAA+vm
 WmwNUgVZjJhbmBh+o+7rCm24br1eCiyR0mGmuXrC5E0YOUwSUGKbOoNzl22h1KLJSEsS2urkadk
 YYhznno37sRCFRMFcdd6jiZzYm183tfGmoEwozzoGxCK9X/gaQdQwlPnUZ/o4u+9UF2H9ASuRTX
 h7S54ZG8lips2A5BAu7+iTUJ0=
X-Received: by 2002:a05:6102:2d0c:b0:5db:d60a:6b2f with SMTP id
 ada2fe7eead31-5eb1a41db7dmr5302222137.0.1766517090191; 
 Tue, 23 Dec 2025 11:11:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHgx0jxpaUYoDI4pPd579ixs0cCDKJC1PyfNVK90hDHCm51byzGas8iZBANeyUIpCgP4OZKAg==
X-Received: by 2002:a05:6102:2d0c:b0:5db:d60a:6b2f with SMTP id
 ada2fe7eead31-5eb1a41db7dmr5302214137.0.1766517089792; 
 Tue, 23 Dec 2025 11:11:29 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-381224de6eesm38394521fa.6.2025.12.23.11.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 11:11:27 -0800 (PST)
Date: Tue, 23 Dec 2025 21:11:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
Cc: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com,
 ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] accel/qaic: Update copyright headers to yearless format
Message-ID: <s5uio2nrt2eyarutacxxqqleufvqdrltafchpmyptkhmvivugy@guqkrtzimfdp>
References: <20251223172425.2283978-1-youssef.abdulrahman@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223172425.2283978-1-youssef.abdulrahman@oss.qualcomm.com>
X-Proofpoint-GUID: 3aZgTHYQBy_upnxyFxs5_YqL55XEna7p
X-Proofpoint-ORIG-GUID: 3aZgTHYQBy_upnxyFxs5_YqL55XEna7p
X-Authority-Analysis: v=2.4 cv=cuKWUl4i c=1 sm=1 tr=0 ts=694ae962 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QhubHCdxnLeoQf_mCp4A:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE2MCBTYWx0ZWRfX106NhoDdULzT
 Ot9DeVez+5qsKEf3dnqpuVrQhvW4t4n25CBnVif7B3xph9p7SQFjbUdM5UThotLJB0vlzFQA8px
 wvTgPqT21yvjXirFFxoLeaZ6sDbrrgAYFKSzzhnA2YHObcvzHxs4I04T/qre1CUGpVUYMu8lvBx
 cSkikZK3R5WuW8le4+SYg+3/QM+y7vnGmkfGXVjM/qEIn2twhfriHLC5/DSKlKyFrPpNwgwg0ge
 eWokj/9b+8clt+E8cwgc8f+jxzoSWY+hrCiYNULmSbEVuKRg91no5sjhlrdWR2g6cgh0fG51+BL
 Ls/G7jcdlYwy9bXGDJLWPO/NrY/Ve3+V+NviEqVXUUTjosopLHAdFJZ0OGv2Hp1o6D5FOQcQuTE
 PlejefkSwPs2l17r8gJc9vpORkdepTDdaQoofVTt8c+tZ1HHRsm7k8ZcyS4whzVRpYfzbTcUy0N
 Fka6j3PZORyZBhU6l+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230160
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

On Tue, Dec 23, 2025 at 06:24:25PM +0100, Youssef Samir wrote:
> From: Zack McKevitt <zmckevit@qti.qualcomm.com>
> 
> Update copyright headers in accordance with Qualcomm's current
> legal policy.
> 
> Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> ---
>  drivers/accel/qaic/mhi_controller.c | 2 +-
>  drivers/accel/qaic/mhi_controller.h | 9 ++++-----
>  drivers/accel/qaic/qaic.h           | 9 ++++-----
>  drivers/accel/qaic/qaic_control.c   | 2 +-
>  drivers/accel/qaic/qaic_data.c      | 2 +-
>  drivers/accel/qaic/qaic_debugfs.c   | 2 +-
>  drivers/accel/qaic/qaic_debugfs.h   | 2 +-
>  drivers/accel/qaic/qaic_drv.c       | 2 +-
>  drivers/accel/qaic/qaic_ras.c       | 1 -
>  drivers/accel/qaic/qaic_ras.h       | 1 +
>  drivers/accel/qaic/qaic_ssr.c       | 2 +-
>  drivers/accel/qaic/qaic_ssr.h       | 9 ++++-----
>  drivers/accel/qaic/qaic_timesync.c  | 3 ++-
>  drivers/accel/qaic/qaic_timesync.h  | 7 +++----
>  drivers/accel/qaic/sahara.c         | 2 +-
>  drivers/accel/qaic/sahara.h         | 2 +-
>  16 files changed, 27 insertions(+), 30 deletions(-)
> 

I think, this is _exactly_ why we are switching to the year-less
strings, to reduce the extra noise. Unless we are required to do so, I
doubt there is a point in updating copyright headers just for the sake
of it.

-- 
With best wishes
Dmitry
