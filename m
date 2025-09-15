Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF76B56D37
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 02:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF94010E03E;
	Mon, 15 Sep 2025 00:14:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SUOFF4XN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF79F10E264
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 00:14:16 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58EMojhs023308
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 00:14:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=wfIfmtGDU0fMWPSXfBq3QGPr
 RejWAR38abE4jrrVyJ4=; b=SUOFF4XNRO46ay3UYMsN/RFX10KQxXKyoxTnQuXZ
 jFJzdaDG7YKTMEn9DWCJWxVSXROJy/EXK3NdO04I9mcIXSc+Yh/oybm+zoM+ge5X
 gi4fhfdHiD1oKn3jHPCZVjcbVhwM3M+b5O/K2xeAn5ptq4erGu7d/KduI3Oth0WJ
 +B805Q8T8Djcm8Rj4Ww2v9PMeN3VK6fe56aORWjK90imQIePdZ9NFJr4nuelu3MG
 rhecpEnLlhZspV/JJp+w/R9551cQIuSaCTbO+YqVOXuJrhx273m369UH0Fdvprq4
 MlL1BYxYnMQndpZgj3CiU5DnpjQx81xZnY8MOt7Q2TsqqQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49510aax5q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 00:14:15 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-7814871b57dso8755276d6.0
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Sep 2025 17:14:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757895255; x=1758500055;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wfIfmtGDU0fMWPSXfBq3QGPrRejWAR38abE4jrrVyJ4=;
 b=Xvt0UtkoZ0OZ/qIX0UIUc0exnddAyhD/2oDIA0caqfSVXU3t+YqYU4dBrnUViRLQwm
 IpIXmM+C9vt4N8DpAZOVrSg2dKYhLvDT7n+n91t6JQQ5dP/3pp8WPAZN+Fk2cVTp/Kbq
 pOxp7ffuyfC5tBKr+1x3MjkvUWsJjzHCHUsTRZDjRvkqoRx76+VLp4IPT9frAb6aUNao
 wJI4IQlVR8p55iB8oSjTnk/1Xr6eWEPF7qcO9DGzdbNWu1C69yzOJax9wX9Wt0j/Uffx
 KB1FCyb1RZ8+lIsGd5g9rnWIwBo473k+JtwfCcZplzNqnWt7YtwYV6A/yREw3rtcWX9I
 7SFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUg8J6gDZubmni01snZ4LeTi4h0QnPJNIigyyZtt5nb+ELizPhbFJ3DrWVeWvSHdUqC7PsPBdbRerQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5EBpo4YkzTqqfWYTYSK/kRqZNUR3hBTYhdodrKXL7XswZdKCl
 WYhtnaU5WOXb5UC7KQijGWlOu6iHxAHJmjh6FLJp91SunEOY9brpvYQoVgEjOhdliz0KEKP3fHA
 gEUEDMNu+opA8+JcyO13MLLKhWh5KVUcIbUqP8FPx5XGc7Lx9CzJOXWRwfaumzmlHWPFp4GQ=
X-Gm-Gg: ASbGncuD6AwStsIOl6lmfweFsegNoc2RalDYxpXZhIWD+qE8b0CmQ6LjtINqFs671MP
 Cn7eYKubzjILaHUNK2lHKYeFXjKXz5YshR2NQXEyDCOPPjomNTqjvTdwp5AJ18aWwi7RHn4VIjp
 rlFt9LmL344ilSLLKPxZq7tsJoo3/itC6lDl47Q/hArNO0wKX3srnr3jxP8DChuccSe2apWsyLF
 KaAyTQG6EkkalXdB/7q+Y5HaEyHpC+6IMrWrc8Neb3+E6MCjgVDzEvv4Kr34u1dfRLiZYLQSU3q
 HB2sd7jqG9/u8s/7sWK94GGXQVidJH5H7IzFWTQSPD5cKeap3V2oFV/6WsLM+1qD88hn+ebsWys
 3CZqjUhxF0WTbpUFU8HVdmmhyIQDrdX8TmnXe2FKikOXFhsH0Hal9
X-Received: by 2002:a05:6214:268e:b0:70d:cabf:470d with SMTP id
 6a1803df08f44-762262daa1cmr182241976d6.27.1757895254727; 
 Sun, 14 Sep 2025 17:14:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHObBFwIlp3GQ+VOBYwejw1PxkvVAwhDilkZbOEooVdFxkX7Rq1AOhro4RGokvljow6YU9iPw==
X-Received: by 2002:a05:6214:268e:b0:70d:cabf:470d with SMTP id
 6a1803df08f44-762262daa1cmr182241606d6.27.1757895254257; 
 Sun, 14 Sep 2025 17:14:14 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e5c692daesm3255202e87.26.2025.09.14.17.14.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Sep 2025 17:14:13 -0700 (PDT)
Date: Mon, 15 Sep 2025 03:14:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/9] drm: convert from clk round_rate() to
 determine_rate()
Message-ID: <pdodeksqchby7gtr7oukm7wqleu535kzh2g3uaseqmkxv5g7qx@jvh5fcppvutm>
References: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
 <aMawQYUIjPw9m4IO@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMawQYUIjPw9m4IO@redhat.com>
X-Authority-Analysis: v=2.4 cv=I/plRMgg c=1 sm=1 tr=0 ts=68c75a57 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=ErCwDgQeR7lfzThPobAA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzMiBTYWx0ZWRfXzYBAMbT3A4Ez
 yMprnJOngrQe326knq6afRHr4X4PVtRPUvaADGEN2lYmAw3ozN73G3/Fg7OCe3exeP0TEimugWN
 fxQeZRM0bSIrEEPHZlXTZpwJ95mVZlpUbBHLCitKacoVbU0vUVt0Pz6fyrHSRdOl1Y2GDu0q54d
 1FTRiTy3/FmT34YiUJOnZHtMbxZ+BP3fcKayhuHNU+WJpCpV5HnVXU4voVYquFdhc8hJRvm9zoj
 /zKchajIit8NSaZFtZWcBRI5nRNx2oHJq/GJ1QB2Ix0eIzGJog7FqQ3uJsYvSSZN9pEf0uu8ZbZ
 Ma3CQrpyL1UVAPgzCPXQfutphQ7P2wP8653uOeKeqUzLGKb49pFkMp3HWtTLw1S2JvwY8uwqk/N
 E3gyi988
X-Proofpoint-ORIG-GUID: 5yeApDuV6aL-5-QJ54_Wei11Pyl2mJfV
X-Proofpoint-GUID: 5yeApDuV6aL-5-QJ54_Wei11Pyl2mJfV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-14_08,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130032
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

On Sun, Sep 14, 2025 at 08:08:33AM -0400, Brian Masney wrote:
> Hi all,
> 
> On Mon, Aug 11, 2025 at 06:56:04AM -0400, Brian Masney wrote:
> > The round_rate() clk ops is deprecated in the clk framework in favor
> > of the determine_rate() clk ops, so let's go ahead and convert the
> > drivers in the drm subsystem using the Coccinelle semantic patch
> > posted below. I did a few minor cosmetic cleanups of the code in a
> > few cases.
> > 
> > Changes since v1:
> > - Drop space after the cast (Maxime)
> > - Added various Acked-by and Reviewed-by tags
> 
> Would it be possible to get this picked up for v6.18? I'd like to remove
> this API from drivers/clk in v6.19.
> 
> I'm not sure which tree(s) this should go through. All of the patches
> except patch 1 have at least one Acked-by or Reviewed-by.

Patches 3, 4 were merged through the msm tree.

> 
> Thanks,
> 
> Brian
> 

-- 
With best wishes
Dmitry
