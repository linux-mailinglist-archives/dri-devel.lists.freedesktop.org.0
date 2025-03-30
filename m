Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98031A75CAE
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 23:18:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F8B10E293;
	Sun, 30 Mar 2025 21:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fb1AsJUC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2524010E293
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 21:18:14 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UL5plF021136
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 21:18:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Paayu8WvfEGwEqdQbUj3+ZGD
 d1cOdWz4M9UO1SwtVuw=; b=fb1AsJUCSOSzNfD21cezt7tvkihLf6jcbCuz+ZeV
 SMkxnxnA5r5KD3z29dwkdPGLtkDrIxfIEsay5bf4t/FG8HQyKoti0wlmULHwvtaL
 gJhIFYuCTmyTGmHJOTh/6UUSd1ErEG3dfnNm00nMq67RFb9IPgY60Fr/KkBta0nk
 qRbQQnPbZttwkvgbl4PvrEFqqLzWbQyq8XJW6N9efK4gN5tKHG6UEKt2dvsYG60j
 J/wJBkI76m0cLA/pe4oGLj7QBrlDe/OtX9tvKQFwLBFyeTK7GPiVSxFWcUFkaNK6
 dwOHKemuHlOJw/9tMQroYJO6L89Wf269fBI4VjdH7SO1QA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p9892suh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 21:18:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5750ca8b2so643789485a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 14:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743369492; x=1743974292;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Paayu8WvfEGwEqdQbUj3+ZGDd1cOdWz4M9UO1SwtVuw=;
 b=MU3sg/9hjo43fbFMzg9etXysm5xeSNJHzgA5VoK2LgNZn4UhLzVAAVbdnF/QcUK8zS
 4DZhwfKgkVpHGEufTK7ihKUmETjwvAQQNnS1bYO7PNt73AP8wy4GdmyhULx7wcFCDLVo
 OJkwyV0Q/g1N6gXV356220lYX5R2sFRXeR5tWPupgldkGd7qxGWUC7wdf53tWZq3NJap
 biMz3WIlvkgZyQ33PvUSV6lddkKCjPYliMEmANhXXXRpGs/2Eqyleo8zjunndSJQt0G+
 ZuqIlNvbxXIKF93a+f8ymvaVidAt72xkdr6rUfnHattHwfKJBNK+N9mlqV0Pd1zeBwgk
 FKgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXi+9N8kJqonwnZB3719sucL8WDIRM/NS4G8PzF/D+gZMoU21HjB5DC1cbKbwzOMMTO9uKf3nlI10E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+EWL1zwV/JfPOTCIhYz3RlyUrI6dgQ4isnV6fcavL7VbSvq2U
 uOummQq/YJAv+n3/85aFS9bG3J1ufp9my9w/A28/H2vnufXlQBBWqw0LPpLIOPQTIKV/I76S0vh
 BQGAsWzJX48YneZQXZoPduD1Eh2pDeiq7oTSNYNhwjZT0CLbranOLpyd30+4Nqd4GCUw=
X-Gm-Gg: ASbGncsZkGprxIZUp4WwshpcrICAjwuL2rZqNnUHpDE4eOBtXGzh0QB2zG6YjtHFT+0
 CnwtXu+M+qbAnIbhhatAZ+IGE8YmV6e4rBs/Rs9YP04j4R7i5HhekAYdaesRr69cgg9y6BFiwvT
 Nvme4pQawG8nXtstoEBVO2YZecYhaemFIOPSyJvlrRa3sZLXqLJBLQ/CFUNg9810mI7ng1SSIg2
 /aQIltYNayI1R3ceCLaSx9AgbEsNuJDX9+SeQIGaHh7Zr9stWnwdtVapvmrZ94Avch1gw/bqEd2
 WrFjlGg1O1n8a8K5iZNsAqM0dD0OqCUqRCGiQYk78udeWcnBygizwaahDMCLfav3YL/HRK5M8Nn
 b00A=
X-Received: by 2002:a05:620a:4722:b0:7c5:18bb:f8b8 with SMTP id
 af79cd13be357-7c6862ef454mr1103732385a.1.1743369492210; 
 Sun, 30 Mar 2025 14:18:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAv7jrTxDdjg78EAAVbYKt+dMneuIjLdd38so3bZG7Hgu4I+zdN5YTn/dl7VRlOI11qb8vvQ==
X-Received: by 2002:a05:620a:4722:b0:7c5:18bb:f8b8 with SMTP id
 af79cd13be357-7c6862ef454mr1103729685a.1.1743369491843; 
 Sun, 30 Mar 2025 14:18:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30dd2aa92a3sm12169691fa.12.2025.03.30.14.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 14:18:09 -0700 (PDT)
Date: Mon, 31 Mar 2025 00:18:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/15] drm/connector: hdmi: Add missing bpc debug info
 to hdmi_try_format_bpc()
Message-ID: <esfrpbkbcvktjfu3u4m3wlc3te73t42pz3k2eb5pthdl2w7o4w@mwgwseljuaml>
References: <20250326-hdmi-conn-yuv-v3-0-294d3ebbb4b2@collabora.com>
 <20250326-hdmi-conn-yuv-v3-4-294d3ebbb4b2@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326-hdmi-conn-yuv-v3-4-294d3ebbb4b2@collabora.com>
X-Authority-Analysis: v=2.4 cv=fIk53Yae c=1 sm=1 tr=0 ts=67e9b514 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=Go0fpDh_rV6_VJzv3a0A:9
 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: DuhMYam8-ue9xprCpTBZZ7XrUVtO61I3
X-Proofpoint-ORIG-GUID: DuhMYam8-ue9xprCpTBZZ7XrUVtO61I3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_09,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 suspectscore=0
 mlxlogscore=922 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503300150
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

On Wed, Mar 26, 2025 at 12:19:53PM +0200, Cristian Ciocaltea wrote:
> The very first debug message in hdmi_try_format_bpc() is incomplete, as
> it doesn't provide the given bpc in addition to the tried format.
> 
> Add the missing debug information and drop the now redundant message
> from hdmi_compute_config().
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
