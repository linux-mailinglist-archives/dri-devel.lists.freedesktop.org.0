Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEB0B4FEDE
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 16:09:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E1310E786;
	Tue,  9 Sep 2025 14:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="b1bLkqxS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 715B510E786
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 14:09:14 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899Lftt004293
 for <dri-devel@lists.freedesktop.org>; Tue, 9 Sep 2025 14:09:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=EYu1rpz+ayR2SpOvoCVl+NKt
 GHzEbiyh3LtAwSa8Rr0=; b=b1bLkqxSWaFGTMVylB1j5y3Y6QjWykOVTq1IUWl4
 wfC3iYr9inLdBqRLg15wCKrAGHOIo4NqeCJCgknA3J4PYyMkOUkFmQB/MPpiK0WL
 uGbzBKpeVhtbn6+QChXxC+ymPMM3bvfGNZidE+4rsCzW2aIJvVO9OEfjq29ZR6GT
 U7OkiJYSp77OzGz9EAxDjlp7K9lsr4wZNE7kpNP1q9WnY0B0oVyIGJKRxkYy5Tir
 G201dvXruxguRVeTJ/gAsGpILLvN5NUGtAwRqWgbmmMWXY8O7TxU+0psfEyR6vbT
 qFceOllu65Tqo5Fi+pvM3Z40NteIIHXbDVPlzxI6Pj0shw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapgreg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 14:09:13 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-52dd148a454so1824788137.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 07:09:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757426953; x=1758031753;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EYu1rpz+ayR2SpOvoCVl+NKtGHzEbiyh3LtAwSa8Rr0=;
 b=XY+frHF4AsX92phdHHdMwubGnp94A6clIH0P97ObuYaki06ytpm+ZPH5TnwrLNUVhq
 xByXC7RTD455G7/inS2vGbgi55oLEXM6vRmNf6AbnieUaUDbWAetOumzgU6ZV2dCs3l8
 Qti7mAaJao/SWLan8KSd0j5OO+DjAmpQXiISsYSl/4o4ruY/v969yrkr62tmI+FRMxKB
 +SKFurnUwbvTQoZeLml5BMQOMLcbKhZDFdk/dxrlYLrZrMf+LsIh+08Gw64n22zfeP8P
 zarLOGBGNDfzRbtmhEInuC/BK1EtXtX6TNsTn9H6iaWGxO1INmUnK8kLOd9GhBHTiZrm
 Vj1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYEv257LZBR3kEfO+5Q3d3rz9bPh/czLWtwFaoD9zHU9yEIyXd+8v+I91TkdGdLtuMj07pNNhgn0g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMCJTFUYASPzJqVixwzk9IWbefpdZcrGRfwH+u/btRPbLz1Sy4
 aEFCNfY7jSObjIzi+pFcbLWURawIU8IpjSfXy3HJMEYY4Jo4IxVOzYVgX9vxw1OCAnBDKzcifXL
 naW0OqKHJV8hOhpMR520GkEOYApQN4TDzPQ4FS3v1Xd3bYNke0HIPOmmM8PcRul7WCbGFBWo=
X-Gm-Gg: ASbGncsy78XNq1APV8nnBkhwLfojac1/kHhAlr+yw8iJRkJxldOuwmTZk5199PCbQK4
 OHt3jCXe1+KWPl7xf6qEx3RTal0NVXEqV04zsnQnyikoKOBZCq9ZyknubP5i+ODpSF87HGGzgfl
 5hR60ERyFu7iPqQz/mogbMMjLdUL6CPz+MpufgklXYZ2+EWKaS9lV+CtthedPNi3bUH8W/JYiTw
 hwBQXjPXoxoKw843JYcIUmPcZ+6Zeg9kJbhsObHgGjNqJeD0N+K5Q8WLBPPpSVJPqyBO9H6bvBA
 EV7rFy/FIa3Q63nBpeSj7zzMWPZ0XFfXTdmadTjuepKGkMrKS+ICTsjfrH2Rk36lTzIg0PETmps
 EXe8HDe8glHVc2qAlJy45HbakIRIqpzcrk6SreDQ6T56K49mtI2v+
X-Received: by 2002:a05:6102:ccf:b0:51e:92cc:6e6a with SMTP id
 ada2fe7eead31-53d160d3f9cmr3496643137.33.1757426952538; 
 Tue, 09 Sep 2025 07:09:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyuKF9ZBGLqEfAfogvaq5jLi8aIGvizJ1KZg/LwAwtCivtLJUEnFV5T1DNQ2HVkHyvZqaCww==
X-Received: by 2002:a05:6102:ccf:b0:51e:92cc:6e6a with SMTP id
 ada2fe7eead31-53d160d3f9cmr3496589137.33.1757426951750; 
 Tue, 09 Sep 2025 07:09:11 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5680cafaa64sm551811e87.43.2025.09.09.07.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 07:09:10 -0700 (PDT)
Date: Tue, 9 Sep 2025 17:09:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Harikrishna Shenoy <h-shenoy@ti.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 andy.yan@rock-chips.com, mordan@ispras.ru, linux@treblig.org,
 viro@zeniv.linux.org.uk, aradhya.bhatia@linux.dev, javierm@redhat.com,
 tomi.valkeinen@ideasonboard.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devarsht@ti.com, u-kumar1@ti.com,
 s-jain1@ti.com, lyude@redhat.com, luca.ceresoli@bootlin.com
Subject: Re: [PATCH v6 1/6] drm/bridge: cadence: cdns-mhdp8546-core: Remove
 legacy support for connector initialisation in bridge
Message-ID: <gptscrssnl7lck6ga6bzu4grcjcbokbdznbg4skbpvrmuo57ex@4zjugogguuw4>
References: <20250909090824.1655537-1-h-shenoy@ti.com>
 <20250909090824.1655537-2-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909090824.1655537-2-h-shenoy@ti.com>
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68c03509 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=sozttTNsAAAA:8 a=EUspDBNiAAAA:8 a=7EYWOy9vIozSJFQcaasA:9
 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: rWvCmwJaXOs5VP3mtb9rDo2u6lPdut_X
X-Proofpoint-ORIG-GUID: rWvCmwJaXOs5VP3mtb9rDo2u6lPdut_X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX4hIv9BYWkS8Z
 /ifDhbLnnCuzgZaxpU91RlAvx4j0WSJgjQeo4Y/wdFva39jPkAzbyBayeObBdxLABiUqm/rQMga
 yBL+mNKQQIgBKt16W7XCxaTN6/YCrle+kSvxVL0hH5F+CF6JCNirrjg+e1PtgY5rAx2lwb03jtm
 wsrmI6rwF1tIZi4q6p3CoY2K6EGumYtkC+Y26lCvhD3Gfgbl7uUHFzm025XaDGOEp582pBBxF4G
 4eX0lHHnQTisdiVWcfrLbcZh7D6pp9Da049VHbW4DHdmsq+kpsDjaGzdLom7CFkX9Kj3TDadtr8
 4BK00bmoVBwqudp9G3gZpnXxcWxacWI3pdsV7IHImOayvGE36+YK4CugP04ituQ4IZYl3FRv33C
 4Y0/GqBR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000
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

On Tue, Sep 09, 2025 at 02:38:19PM +0530, Harikrishna Shenoy wrote:
> From: Jayesh Choudhary <j-choudhary@ti.com>
> 
> Now that we have DBANC framework, remove the connector initialisation code
> as that piece of code is not called if DRM_BRIDGE_ATTACH_NO_CONNECTOR flag
> is used. Only TI K3 platforms consume this driver and tidss (their display
> controller) has this flag set. So this legacy support can be dropped.
> 
> Fixes: c932ced6b585 ("drm/tidss: Update encoder/bridge chain connect model")

I'm not sure, why do you have this Fixes tag. Other than that:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>  .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 187 +-----------------
>  1 file changed, 10 insertions(+), 177 deletions(-)
> 

-- 
With best wishes
Dmitry
