Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE36EBCF86B
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 18:51:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7F210E0D6;
	Sat, 11 Oct 2025 16:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EvAdmvm6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A1810E0D6
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 16:51:48 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59B4BT70024733
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 16:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=xDql/hmPHmbhLyPjNWGht0Ir
 lePqDSoVlgpyDaLxB/g=; b=EvAdmvm6JMiBwFtspv0DVRebMaZ0aXzHvBjDTmh6
 Pl60vwPGKB0cy3LVeUlVVjqCfimlC7XL7NnbIhmMZ5worXFZG91+Siul6cbVZs0L
 /tYDYwhfev7fPrgJq8VIpAhQ7xY1tndC7UIOZzQNtAtgIOpFU9lLhrlSlZ/tMh00
 G4rXeTkQIwVKyC9ovm5cMzFOzx94tfTYYTPcIji09/iwL63WTS2Gd45X9PBAW6MA
 YYde0awJMTCsglI/bbJwhzW00Y2bz+0MQmivyjvX1rPJD0xqfMcU8RutgBgNGbY1
 HiCWWxsnlZUDXyE/g5bcjD72dU2gQvJZLDvITIxdLDojUg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0brva7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 16:51:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-856c1aa079bso1725567085a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 09:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760201506; x=1760806306;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xDql/hmPHmbhLyPjNWGht0IrlePqDSoVlgpyDaLxB/g=;
 b=Gv4o/mdri8nbF4tWjxUc4j9W/q1GcScWBJ3dtrILy1NsRwQy66thf7T+q9buD/t1Dw
 m0/Imo1mwvy+qvbaYd1JwLUDuKE0pGLFQmLb4wESaRxejQyuzjpxbuLvq/EpFfWhrajE
 s9T3k8k21fwvVJJquSsKKg8QE6LoNao51o144lLpdY+dODbzpuwJUXTkYMs0Ux0Q8yqc
 5jwLG1HNXvx8R7EjXPw9kM8exQqGpG3xjZvOods26A/L0wC8lmgNCi351wLgvNacGh2E
 TMWjxskPEEiWCk3gdaGSLoPntf8l0t7rPlDO6hxf1YRH8sdSnS9l+2lE0LZ0VwNwNzEX
 FLzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCViv57zx+gmwlhExsN2VvFuiC+EXX2dGd2LilkmNbCJ3nT1LglnHPyx01IWCPROkjQ58TYIK+UWzNQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjaTfJvweXe30J4T6EvIDhU9c/QoeHCE4YLJsziIT/svUTJOMs
 Ni6s2yjXcWoaydDoGPI6p6U4w6KtYwISFhSErET/lw3hroHY24L5eMj1+7q4sgxFuO/VsWUMDod
 znt3siY/erDf2DUCVlNX5s1zC0F76pQXbHgZLlKx436sr/VCD9X9UaOFFTFQzvJxepiq/kjU=
X-Gm-Gg: ASbGncudm2Ay4SncikauXU6I38Djanggr7uBOisyAD4tOZ29BHU4sb8uVv+66figTf3
 vM4Y5NT/DV1L57aIv5b+veD6RG9zZxwasj61ihKLkv0UknrrxbCvG4Bqa7SQQa8Ji1gwdRvnJqs
 r+NirAVYL7q3iDI9TfbdgG+l7zSOqnV+miX8yhF6KgB9J6zsQKB5dNfP6GpsZZzxsOPSqz7Mdrs
 aHxAbBT0PLUHKBg8zDwh9I8AWtkJZQrLXD9HPJ6od9uw715ktVGs6SKG2U/EhucuAPEtE6rsCap
 DkETPj4wf6xMQcua2ThLh4B6k7QUNlD1GPRvYHhNE+UvVPgA6JLj9W13nmDms/21qGQXwuYA2TW
 zYqxI3tI3vPPlcCPFiYbAXSApOdTBC432Hik4VMsNms+10edZWeca
X-Received: by 2002:a05:620a:690f:b0:878:7b3e:7bc4 with SMTP id
 af79cd13be357-8820b47d5cemr2727435185a.11.1760201506220; 
 Sat, 11 Oct 2025 09:51:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1knLg1ejAD4VBlbVpVAYhUPHuhDgVtfBnPSvgk3VxA9bjqCPn8ECh/NUyGL80y7radiIDxw==
X-Received: by 2002:a05:620a:690f:b0:878:7b3e:7bc4 with SMTP id
 af79cd13be357-8820b47d5cemr2727433485a.11.1760201505751; 
 Sat, 11 Oct 2025 09:51:45 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5908856394bsm2060654e87.66.2025.10.11.09.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Oct 2025 09:51:44 -0700 (PDT)
Date: Sat, 11 Oct 2025 19:51:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 1/8] usb: typec: Add default HPD device when register
 DisplayPort altmode
Message-ID: <4eizpzejw43gqt5jauvkeij65rracols2voa2osflwyjrwbvun@sovgqfuhg6mc>
References: <20251011033233.97-1-kernel@airkyi.com>
 <20251011033233.97-2-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011033233.97-2-kernel@airkyi.com>
X-Proofpoint-GUID: tRHGfGNtjv5n8RxGnO9PQp0gjrr1PvPm
X-Proofpoint-ORIG-GUID: tRHGfGNtjv5n8RxGnO9PQp0gjrr1PvPm
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68ea8b23 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s8YR1HE3AAAA:8 a=RXhTPAuaP42idGtAG2cA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX4IYSl3nWoPPl
 MqQInPl4tT6gYjFy7Mjvrj961RNtVafj0ysbQvfu+dC09dtBJvVRi7B0cDmN+4XZTo8P12oAImI
 X/ciT8Vaj50lIAfnhXpOqc+YwO0Nq9RMkfz+1DqUi25HI1vPxYTkbiSUdLlcqHHh5IckfkBSX+k
 U0GtvS8Su0yOInbYgu8VaQYLYJKp8AuGF0czPGWKK7w2TU0jJL/ZirVFvpuJqRdMim4EXObe5iU
 urH44RpHgjgJBZ/SuGkbz1yXzahAAz9zs4R1s11Y5C9Do9Sp3puiCWYCneQuqwdb/VA+Noak0dU
 xUpPq8JJvoRnRPXKtQ8bD0bFNCAjOrnrT81J2gTWGN5xlTR/bhe86UqVSLcQgmxJ18VFl8ofp1L
 JymJOPUGpv8o7e7ivUK2L299CuzkKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-11_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022
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

On Sat, Oct 11, 2025 at 11:32:26AM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> Add default DRM AUX HPD bridge device when register DisplayPort
> altmode. That makes it redundant for each Type-C driver to implement
> a similar registration process in embedded scenarios.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
> 
> Changes in v5:
> - Remove the calls related to `drm_aux_hpd_bridge_notify()`.
> - Place the helper functions in the same compilation unit.
> - Add more comments about parent device.
> 
>  drivers/usb/typec/class.c         | 26 ++++++++++++++++++++++++++
>  include/linux/usb/typec_altmode.h |  2 ++
>  2 files changed, 28 insertions(+)
> 
>  
> +static void dp_altmode_hpd_device_register(struct typec_altmode *alt)
> +{
> +	if (alt->svid != USB_TYPEC_DP_SID)
> +		return;
> +
> +	/*
> +	 * alt->dev.parent->parent : USB-C controller device
> +	 * alt->dev.parent         : USB-C connector device
> +	 */
> +	alt->hpd_dev = drm_dp_hpd_bridge_register(alt->dev.parent->parent,
> +						  to_of_node(alt->dev.parent->fwnode));

You can not do this, unless you make TYPEC core:

depends on DRM || DRM=n
select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF

> +	if (IS_ERR(alt->hpd_dev))
> +		alt->hpd_dev = NULL;
> +}
> +
>  static struct typec_altmode *
>  typec_register_altmode(struct device *parent,
>  		       const struct typec_altmode_desc *desc)

-- 
With best wishes
Dmitry
