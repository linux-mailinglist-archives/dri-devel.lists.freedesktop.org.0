Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A598CAC6AEA
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 15:47:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E4E310E2ED;
	Wed, 28 May 2025 13:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fzYmNNTg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D5710E2ED
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 13:46:57 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SB4SAH025125
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 13:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=5hzV+dhuyMo7C+u+YPUX5zpP
 lQzTgz3llouJ+CsCBVw=; b=fzYmNNTgwrqs0DoPvI0SKeeE3FN8BfECbJvsi/Z0
 uH7iK415EphqNWCfHB5TRcHFrkbN7nRluHqUOU8QEHi0YwxFE6feQdPTqeZ7Xxgp
 NQhQgZ8m0PEhoIzygOwYGNjhbSbDOMo71rbs9Bzo3UdHLXB+sSvj+kZStzHFRGTF
 d4/wEcV8cpRYPFEd3HRjLtP0uoVL3qOX0kb1V6JJ4uImYJwWuHzKNjPlX3zf7H/X
 ANwNfNbKPgHDm5k8Laea/91SWlDCaNF6a8twZo4xEmdr9k0bKaocMDKPZ2U/x/Jz
 lvQibPYNLzdbZ+RhisoY4mwSgZ87ZuM/7GTdELhKsJtdHw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u79padrm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 13:46:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6fabd295d12so13413826d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 06:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748440015; x=1749044815;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5hzV+dhuyMo7C+u+YPUX5zpPlQzTgz3llouJ+CsCBVw=;
 b=d8q/Bm8L5kyjC22dzvz79zlRIkYF9XyQ5NagiQItsVCkA83PSDM3hhe1LJOshJzU4C
 zTHMQlxSkqVpLVktEiagTLoSF+vYetRQ2vXat+94WFR0OxR+qlNU+x5Q6O0X3lHjiBRk
 k00vBsFtoiL6dfMl7a+8kx1XD1JEsrxsOZbT7UDzs+zR1JavknzKGAHR4aiXnyvIuFIz
 /pHW6gx7zBDd6aLwei1jtuacOrjSDav+TYOr0hiH6v/HlxGRqprb9tJvZYBo5G9/A2d4
 8KrPtUkmfmev2dY+oip9hkZOTrUfIKSEZmxzFHHCMHlnwHVEMNymqgW5WQsBnK3rCWoR
 Deug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHog0x2H7RAoeDjBSEtG75A+mEvYZ3eQ7vCfHGz4BObfTmdxQI04kMwNpEPjWUYvxicRz1SswRINk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0scLg5Ci+7oOXbdC6O7VBKMNqDO1lv0tsHr3AIgATUUtsY3YA
 +z6uqp+4k1f6vIvvlcnTPdnGaGFJfDDm+WUxm8m3bPoO3pZZ/2FF98ZBGUXny2S/ft2mL+prrpp
 6LmNmoLfqO8IPQwIiwJhVTNtCm5pMj639smlfRISHMl5vcLCtJ+tuD3buXf1jfhDsvF51OGU=
X-Gm-Gg: ASbGncvRfxnR/vMh6Kd/ETlXa4+k8iQDil8XMwL5tqGf6of8S+5CI9U8gOkxnixi/H+
 SJQv0K9moVEc8fMaGe7cdK5MO5mUt6V3ZTruj9E2y7m6UMfvjY5LzEfUrrG01D/diJBqhD/qoPn
 xMcNcOkzPNXQuBnHwtsIr4dH95Ipaq2UmXr9WGeP6J5EOkuk9pBZ6wbS8+onAuB4Qxm85BeyNEI
 7Vsu3g6KzSMcbb5vpKmGK8DJzyVDruX2kXOhbayt9PFjziDT8IdVcajgo5Gd0ptyj8euRN0hIZV
 LXVgd9udfdEU2SoEONS6HZRBRUspU2dHw2fYRm1f3mYhN1r2v1mZIk6q3rb98BoPSKfUTh+A9Io
 =
X-Received: by 2002:a05:6214:2264:b0:6e8:8798:275d with SMTP id
 6a1803df08f44-6fabedbda93mr35115176d6.0.1748440015390; 
 Wed, 28 May 2025 06:46:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEX8saC8JowDgKFJqADUdGr+8GS/y//V7WI+R18oHaifS73zDbALgMCfKIS/VbxRoERUhg0rQ==
X-Received: by 2002:a05:6214:2264:b0:6e8:8798:275d with SMTP id
 6a1803df08f44-6fabedbda93mr35114386d6.0.1748440014911; 
 Wed, 28 May 2025 06:46:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5532f62b0a8sm294266e87.82.2025.05.28.06.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 06:46:54 -0700 (PDT)
Date: Wed, 28 May 2025 16:46:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
 biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Adam Ford <aford173@gmail.com>, Douglas Anderson <dianders@chromium.org>,
 Jesse Van Gavere <jesseevg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Improve adv7511_mode_set()
Message-ID: <wbja4vmaeqwuoyvfayra6tzik5n477yqaq6v2dmasgtvjlp6wp@bxccfh3hwc55>
References: <20250528070452.901183-1-tommaso.merciai.xr@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528070452.901183-1-tommaso.merciai.xr@bp.renesas.com>
X-Proofpoint-GUID: guPLbBjGZc9dUjLAaXUjO-LReaPefzU5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEyMCBTYWx0ZWRfX5zSRajKAddLM
 vfJJWatMIEkuUupPS0Ebr9giSvBbfztd1/csSU1h0G7t5tbYAD6QnIZ3WK0SBxyvdhzPXlA+0FM
 ovIpOqB4wnPPhESDNEmsQq7e/gojQovJC4Y6goPOSF3azaWNgTVB+YV/N5spQ1Y5pESbjQxP2/o
 KpoqRZzbf7ZV47eJx5L5BFEAG9rEZhVeXFASQHCRZm6nMv6uIkihGjXkTCiyhFtKC5oNTbavX02
 K889ug1h7ZSshnMYH1kSqVo+jrXLmy7DFZqCi+GEzlpKNi5LyP2yu+glyR/qaKx+UB35nO54Cc3
 Zb8mPWUt2td/NRB9CWGQyB9x7Mr4UC5TzcUyVtatEFtdtJuCrmceUkP/c9en4LvKmTgYiBZ9jmV
 GWQ5Bv5xYMK8kOOLqRbK0FiTaViLM/r6jLedLDW5NY/HGCfTD4yGCDi2k9lLn+D4JnNK37bu
X-Authority-Analysis: v=2.4 cv=HNnDFptv c=1 sm=1 tr=0 ts=683713d1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=mDXOUA0a1PfOXZ9ygMcA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: guPLbBjGZc9dUjLAaXUjO-LReaPefzU5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_07,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280120
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

On Wed, May 28, 2025 at 09:04:36AM +0200, Tommaso Merciai wrote:
> Dear All,
> 
> Currently adv7511_bridge_atomic_enable() call adv7511_power_on(), then
> adv7511_dsi_config_timing_gen() that is responsible to update h/v porch
> params.
> 
> But during the adv7511_mode_set() adv7511->curr_mode change and this is
> not reflected into the h/v ADV porch regs, then h/w porch regs are keeping
> the old values.
> 
> This series fix this issue moving adv711_dsi_config_timing_gen() into
> the adv7511_mode_set().
> 
> Thanks & Regards,
> Tommaso

For the series:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
