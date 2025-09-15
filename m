Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6B1B56DEB
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 03:33:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB70E10E289;
	Mon, 15 Sep 2025 01:33:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="A7Xz1Hy9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA3810E289
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 01:33:04 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58EKufiO008216
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 01:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=1Zu1F6svkPbGpkL46fCjLAFj
 5Y4T5FtR/7zChYLiSmI=; b=A7Xz1Hy9Q1edkC5OOC5mDD+KfqH7NWsAg2rRtLxT
 Kl0Z8gJNdUV/QOtU5f2Ok68A1X3lt14MLnj2kHw6+Dgx2WnUgIakmBu2kvVrTcup
 bxqZUMNKoAiU+SpFtH0Viy/GoHuD1KUm6yEBrrcffN9tbmBXsaX/EtF7lkCW5Mnb
 cqL4sU2hRTZ+HSly8FuEXWopcNQdSL7Lg7Ncl+My2lXAqUlB+2n9QLu+uCHL7CyK
 yPtTU6RWOBc+o/L39soEUVQfgzfoQDFKYdsgnMkug9r52GqwouK0DoZ7cAi78B8b
 zTqYMoDzLoUCMlpyWc/GuLnjV4I/2lmw6Drjp92dmER0Ow==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951snjx8n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 01:33:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b5e178be7eso111652981cf.1
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Sep 2025 18:33:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757899982; x=1758504782;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Zu1F6svkPbGpkL46fCjLAFj5Y4T5FtR/7zChYLiSmI=;
 b=QFDi3o4zfacXVSkHJiXl9lh02V+U8JKfmF5QzGZ/Za+hH8UjuPJIu5xf+tXB4tffOJ
 wTXAz9rJyRJFSUjZd8WUGXHuFma/jRc3sD7cWkegUMECf/X8qlBq+n8bm4uYZmcVW6KR
 09K2KieyJhS4HGdncQmMhISF2Qfu9HC3pBuEtj0Nxp1dg7B1KOUgoOdDDFGOa37/i5Ao
 ZlBSCBQpARSxPmGm9jzBFqaVywiBAoYKLuOC1rq6r2iwZhA4tUrb7o/pzVREY4tDU+Is
 qrYxSw/X/h5XcOYo5E16oSkaTG8vK0hwcYBV1rmxR3zUdqntOf8repL/eTpEbcc1Hisi
 ML6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVk8fphhAt6x25jCziQU4NtdYyGeqMfU/cqo7EVh6LKdycXIVQ5SPym/TC98SQPSfh8aawviiE5MOY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylO8s4ZYgOg+uRX7VBo66EAutTLc2+4nmX4pujseMLhgJV9QtU
 HSs1DL4TPe8I2IkktXasKypj4FjMZaGdCbWv4oMXnrJAiiyWybL+E3tlqPPKfJDIFMziUdX143y
 zCwqibo8ZEujPGsgsjRvruYyQYuNb5CFiTtUep0ARvUxgdayOEumTw1J5jZTb6KlleOhfDR0qiE
 27948=
X-Gm-Gg: ASbGncvScuyZRMZFcnF8uVyfYeFQrpqpUsXtKEo9tHcYuKfiyvamn7aTCsYdHtLjGqe
 Hx3tHTdrm2SUHUeA3lfwVvNsmhWQD+xaekz8QCLL7cx7J1Rjjzo0yzXdkTFD7Q7I8ISBGZutG42
 MQ3Acei6tE/nWG+A71cpvd+0x9Cdji29sfw5zdwpMWKyVy5LjaaThT1Ux6OfdBVd3jPj82lgNWO
 oTKUVuE+dQq/FM8Zv3WfXsJcwXjSh/qg0JMauYj+T3uD7iP0TMgZPO/Sn/mny1D6lnWGbVVRLSH
 nCRChyhZnptSH6Yu2lltvcOtd2EjwQBQ6ATZ1Lj4aA+dR1k2XopurXploRfdfnsiwWBl9WMXA8p
 kYx7BG99ZHi1bkH4wKJwVLrvkvh/dHuZYVyA3VCPVbz3NDDP3tJel
X-Received: by 2002:ac8:7e89:0:b0:4b4:96a8:f79c with SMTP id
 d75a77b69052e-4b77d12c8ebmr140170691cf.79.1757899981868; 
 Sun, 14 Sep 2025 18:33:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGBvsRDgTKSkuwUsdqfubmsZj2hQouxrHcRhgR849mIt5XnK0aMWxJZ1JOLD8JxXV0ZmVt3Q==
X-Received: by 2002:ac8:7e89:0:b0:4b4:96a8:f79c with SMTP id
 d75a77b69052e-4b77d12c8ebmr140170421cf.79.1757899981448; 
 Sun, 14 Sep 2025 18:33:01 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-571d16e79d0sm1964626e87.86.2025.09.14.18.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Sep 2025 18:32:59 -0700 (PDT)
Date: Mon, 15 Sep 2025 04:32:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dmitry.baryshkov@linaro.org, l.stach@pengutronix.de,
 dianders@chromium.org, m.szyprowski@samsung.com,
 andy.yan@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] drm/bridge: analogix_dp: Apply DP helper APIs to
 get adjusted voltages and pre-emphasises
Message-ID: <mxdaghfmr7fqt6ud6bhca72kewanaauhyuic6xl2izo6yp3r3y@6oytrsfxposs>
References: <20250911112756.4008435-1-damon.ding@rock-chips.com>
 <20250911112756.4008435-5-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911112756.4008435-5-damon.ding@rock-chips.com>
X-Authority-Analysis: v=2.4 cv=JO87s9Kb c=1 sm=1 tr=0 ts=68c76ccf cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8
 a=u2CTiyuJROzRloHrWhUA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: 0JRmem3AVypxj5EDVP83gv5m4bdla--Y
X-Proofpoint-GUID: 0JRmem3AVypxj5EDVP83gv5m4bdla--Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDA0MCBTYWx0ZWRfX/gSl2ubCPZoY
 PWSvqhHsrakbx8uoQDgbrjkblK8abGVG3VmaIdkG7AgqhDx7QHfgvg/YWGj2UPuBSBiXuOlXfqA
 i2YdJW/OSQsAJGY7DYWJ2dlYA1EQeqG56ONKRVdDgH/iGEWh4EqzyePaJgIMEdGG/oXaI13JacS
 bOcWvj9GdcznJpLiJWZXnlzaOW7SEiQ2Gs5vKp9RrGFRp9J1lPL9g/SPLWUJQwtL3dBnC5ui9P4
 wbG/3km9ebi91YIXQQevisruYv+SJnG7aPDDRLgLGlRX+Yk2C9cVYYRmCpLFMAnZwnZrxhRoOjh
 zL3fCiEydw/TNXK0j/c4aK3rlwztfnHgIkb+i/BVP37D+uSvwbSZ5u7rVX5SIppHmSBFcXc2tah
 kAjrydv6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-14_08,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130040
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

On Thu, Sep 11, 2025 at 07:27:56PM +0800, Damon Ding wrote:
> Replace analogix_dp_get_adjust_request_voltage() and
> analogix_dp_get_adjust_request_pre_emphasis() with existing DP helper
> APIs with the same function.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 49 ++++---------------
>  1 file changed, 9 insertions(+), 40 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
