Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KmZLL/GqGlaxAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 00:56:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6533C2093B2
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 00:56:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B35A10EADB;
	Wed,  4 Mar 2026 23:56:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="px9zWiSd";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="khdJL+eT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B6B10EADC
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 23:56:42 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 624LjiuI1423687
 for <dri-devel@lists.freedesktop.org>; Wed, 4 Mar 2026 23:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=EbLJv2J9kPBGNa5oq1GyOOHM
 jtzn/aJKqBG/UtKmSDw=; b=px9zWiSdVRBjjzNYUaw0oeny/GHhyRKP7xnlLFdl
 mqsmRZBdQr5BS11VgzyT00uk7CDQJxVDyaOXcB9Ls3O9bOz+J7ORwzp34aFygZ/v
 W5jKE9g0yahVQ3SP76yjOwaDCM1PNzaownz+CA3mVt6CgLiJoPjGmp5zyGGhqGr0
 PhYgMs4VlqTN5f4UnIQ3o7Q9fXzAtJjh6iK1qsMZB4KAEZFOdnwggI863piJrQrt
 JNfLcwzBN1QECqgxTNiKM1wHcjr4ZymUNW5mXDQRdiyWahXteJDpr/KHIkKNvV9n
 KWdAXnCpZWuEP03yZIgWEWf+kG2eJSWvO1xktrJlxIzCGw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpe8u3a8w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 23:56:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8ca3ef536ddso1539579185a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 15:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772668601; x=1773273401;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EbLJv2J9kPBGNa5oq1GyOOHMjtzn/aJKqBG/UtKmSDw=;
 b=khdJL+eTE7fA/n3PWPWs5kCfEPCxJHzwRnfrkFcc/NKWhJ2sIFpaiy4bDhQDQ4dCX6
 Z3ygiCC8cF1UV5OfJEGBjSK3+MCXvPMygkaidLq3NIFK48R9VrL07HbIHU6IwoI5BtlQ
 6/fptCbba/nWFL5/hC8tie9aYq+0zcv+mPOinC5kbpvx6PCdxYSZ56wFwUQtv21eYh4p
 2f7ZN6Y4HuSxmKtElzzujHPb/YRvK2MfmX/eJpTIXejQqXgnhlV+0hweA53oOpqwbHad
 rJFuzQwCBI7iJVDy95EIPJmJl85IAQuNFmOgyEQqknqAdMp6KYVnoT513RJ0Q90lP0Ra
 LTCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772668601; x=1773273401;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EbLJv2J9kPBGNa5oq1GyOOHMjtzn/aJKqBG/UtKmSDw=;
 b=KQdxuR0cbgMcFdVWLSreXZK0D/fn/jdatP+n2NS73hXr7PEZIA0KY/dbga98TRmQIP
 PsH4AJgn8NiqgQ4wiEnF7qgF3OTqVvGgdKkqrPFi5G5hlL9lEYxt5Vq+kg85Nry4byJd
 1VMKzPhCyyo1m7L+1ZlrpHi8ndsJCDXzreXLu6Kdsh7/9tuj0wZ+GLU9YtexiAXuGSg6
 WW3qz+kzoJ7kdZw6BrZPbTFei6umXQh3HnC6E7LEb0N+njntwOc1prAP0VkyQQUzAwRQ
 ptXcd9n/Jv9zxZtPdjsn5dzxskhDNB2MLhbdUFdGIBtmw9uxh3tG4G7A9phvrr5wSEbn
 P5bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6VpuzUsAy4kEykTDfgDsYsWjx8pRtSGdb0J50IYmxitCIkP8SbuHxgXKu7hDEVUdL6f6i4PiOIOs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yym4S2PS5UN/uKgpgdbNxcVqnT4JojbClVfm/i81u7sxco+ri9h
 MXiJJBKYhisaWdOXGpxH99qiYyF7SU+D76vZS2E+dGxXag72s3utgPONIzShn9bFCMaicb+HtG2
 DS6azcK9BhdsKU6EtJ5ypjWM52jv5nDK+4GWvOH8ojAWebY+WvleTej2k4cn/zbYOwiTZa4o=
X-Gm-Gg: ATEYQzy5/VfdJkyNZ28tSxVtwWY42V3yEW3YYKBRfqic+ETIYCmZhpQU1U37KfT1ABI
 2dBZWdIE+WfN98gnHQQuTiYTqNaDTqdmhWtNC0hfo62TZR1UyKjmotBbaF02vFXc5wDIoqDLZVU
 DHkPOiHGv30Hip9qtpdXTkSkWXq0g0xn6sv6REqqez5cts7pAfwf+XTJ8WKlYmDOhDwF2Y6XlGw
 xljx+f5lEmhx4Y+di6sLgJ5dHJX3CmpLtuMirKB/bgtNlKn9YgJidhpDNnlrwfDuAaNtyVpmyuS
 fyv6zLOX5S8cFDegIEIZ6DaU0WcxF7nYJ1mZwSb8Oq9TB4yHvlTNn1KmHamwDtWzOeSwqUi86ht
 C4KK8hzjtES3FP/RlluXwd767EVxZSvliTfDB2vYG1DHDEe7Ir/JVqZelY8fvkZwKWAmM0lyGhz
 CYh6CYtxTiv5zawzpegNJXqZf1yKhTNppfMds=
X-Received: by 2002:a05:620a:1a29:b0:8b1:2fab:30a8 with SMTP id
 af79cd13be357-8cd5afceee6mr495520785a.74.1772668601139; 
 Wed, 04 Mar 2026 15:56:41 -0800 (PST)
X-Received: by 2002:a05:620a:1a29:b0:8b1:2fab:30a8 with SMTP id
 af79cd13be357-8cd5afceee6mr495517685a.74.1772668600503; 
 Wed, 04 Mar 2026 15:56:40 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a125ceeafbsm1231277e87.85.2026.03.04.15.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 15:56:39 -0800 (PST)
Date: Thu, 5 Mar 2026 01:56:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com
Subject: Re: [PATCH phy-next 20/22] phy: include PHY provider header
Message-ID: <c6rtwgrwhqnkc7pomesjlmtqoj5pwsitvteolmf3t4spemysb2@rvcuyqqrj67s>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-21-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304175735.2660419-21-vladimir.oltean@nxp.com>
X-Proofpoint-ORIG-GUID: HIHz4Nk6nWOaPPhkaPfc_IPx76ZDysa8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE5OCBTYWx0ZWRfXy2l9m43Q6JaT
 Bi+Vxap22G31pe721PrjBgyxbA+lJu7qZBVe1JoFwocRvJmvxPMaTG8vT5wCYaxGSFgDZlsZOLI
 +HOryb6wXql/VtxFgBEvRvyH2pyenUSKxogcNfqeTboIBQNq0wBepU7Lt5BraUE0jbHxIBIfWQa
 +kmnESEOR9s2RT7cc0uWHIJEQG0IEypUl/YcbqQsUX/j/DaRy//Mj+FXsL1hi9OzJoGXMnQji/3
 ZxA/XFAbGVaA0GR9Qr4GwU4IzOBnnvYNavj3DoJ/TABO97sIJrsG+mlGV4lal8ABwxsf1pI6GmO
 cFf3I/dWazPd7SIzTjX2WZ6ApI/qKg9X3QcA0pVgcaU+jYXirVetdsZsixAVwSdUCO5rcFRcbVg
 dtnE/5GTt7ldmXgVox9eONW4JfEMvjra3SrK1p08zMJ3E+kmdlzoR1YnZMgzmczFLuzMB+qgqxi
 3qTnooTJe1dv1Skrczw==
X-Authority-Analysis: v=2.4 cv=FpAIPmrq c=1 sm=1 tr=0 ts=69a8c6b9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=8AirrxEcAAAA:8
 a=EUspDBNiAAAA:8 a=6HcPSIi93OwE2-2V8-kA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: HIHz4Nk6nWOaPPhkaPfc_IPx76ZDysa8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040198
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
X-Rspamd-Queue-Id: 6533C2093B2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:vladimir.oltean@nxp.com,m:linux-phy@lists.infradead.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:freedreno@lists.freedesktop.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-can@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-ide@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-tegra@vger.kernel.org,m:linux-usb@vger.kernel.org,m:netdev@vger.kernel.org,m:spacemit@lists.linux.dev,m:UNGLinuxDriver@microchip.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,nxp.com:email,oss.qualcomm.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 07:57:33PM +0200, Vladimir Oltean wrote:
> The majority of PHY drivers are PHY providers (obviously).
> 
> Some are providers *and* consumers (phy-meson-axg-mipi-dphy,
> phy-meson-axg-pcie). These are the Amlogic AXG SoCs, which split the
> physical layer into two chained PHYs: the digital layer and the analog
> layer. The DSI or PCIe controller interacts only with the digital PHY,
> presumably for simplicity.
> 
> The rest of PHY drivers which include <linux/phy/phy.h> do so because
> they call phy_set_bus_width(), a consumer function.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
>  drivers/phy/allwinner/phy-sun4i-usb.c                 | 3 ++-
>  drivers/phy/allwinner/phy-sun50i-usb3.c               | 3 ++-
>  drivers/phy/allwinner/phy-sun6i-mipi-dphy.c           | 4 ++--
>  drivers/phy/allwinner/phy-sun9i-usb.c                 | 3 ++-
>  drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c         | 2 ++
>  drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c  | 3 ++-
>  drivers/phy/amlogic/phy-meson-axg-pcie.c              | 2 ++
>  drivers/phy/amlogic/phy-meson-g12a-mipi-dphy-analog.c | 3 ++-
>  drivers/phy/amlogic/phy-meson-g12a-usb2.c             | 2 ++
>  drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c        | 3 ++-
>  drivers/phy/amlogic/phy-meson-gxl-usb2.c              | 3 ++-
>  drivers/phy/amlogic/phy-meson8-hdmi-tx.c              | 3 ++-
>  drivers/phy/amlogic/phy-meson8b-usb2.c                | 3 ++-
>  drivers/phy/apple/atc.c                               | 3 ++-
>  drivers/phy/broadcom/phy-bcm-cygnus-pcie.c            | 3 ++-
>  drivers/phy/broadcom/phy-bcm-kona-usb2.c              | 4 +++-
>  drivers/phy/broadcom/phy-bcm-ns-usb2.c                | 3 ++-
>  drivers/phy/broadcom/phy-bcm-ns-usb3.c                | 3 ++-
>  drivers/phy/broadcom/phy-bcm-ns2-pcie.c               | 3 ++-
>  drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c             | 3 ++-
>  drivers/phy/broadcom/phy-bcm-sr-pcie.c                | 3 ++-
>  drivers/phy/broadcom/phy-bcm-sr-usb.c                 | 3 ++-
>  drivers/phy/broadcom/phy-bcm63xx-usbh.c               | 3 ++-
>  drivers/phy/broadcom/phy-brcm-sata.c                  | 3 ++-
>  drivers/phy/broadcom/phy-brcm-usb.c                   | 2 +-
>  drivers/phy/cadence/cdns-dphy-rx.c                    | 3 ++-
>  drivers/phy/cadence/cdns-dphy.c                       | 4 ++--
>  drivers/phy/cadence/phy-cadence-salvo.c               | 3 ++-
>  drivers/phy/cadence/phy-cadence-sierra.c              | 3 ++-
>  drivers/phy/cadence/phy-cadence-torrent.c             | 3 ++-
>  drivers/phy/canaan/phy-k230-usb.c                     | 3 ++-
>  drivers/phy/eswin/phy-eic7700-sata.c                  | 3 ++-
>  drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c        | 3 ++-
>  drivers/phy/freescale/phy-fsl-imx8m-pcie.c            | 4 ++--
>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c            | 3 ++-
>  drivers/phy/freescale/phy-fsl-imx8qm-hsio.c           | 6 +++---
>  drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c       | 3 ++-
>  drivers/phy/freescale/phy-fsl-lynx-28g.c              | 3 ++-
>  drivers/phy/hisilicon/phy-hi3660-usb3.c               | 3 ++-
>  drivers/phy/hisilicon/phy-hi3670-pcie.c               | 3 ++-
>  drivers/phy/hisilicon/phy-hi3670-usb3.c               | 3 ++-
>  drivers/phy/hisilicon/phy-hi6220-usb.c                | 3 ++-
>  drivers/phy/hisilicon/phy-hisi-inno-usb2.c            | 4 +++-
>  drivers/phy/hisilicon/phy-histb-combphy.c             | 3 ++-
>  drivers/phy/hisilicon/phy-hix5hd2-sata.c              | 3 ++-
>  drivers/phy/ingenic/phy-ingenic-usb.c                 | 3 ++-
>  drivers/phy/intel/phy-intel-keembay-emmc.c            | 3 ++-
>  drivers/phy/intel/phy-intel-keembay-usb.c             | 3 ++-
>  drivers/phy/intel/phy-intel-lgm-combo.c               | 4 ++--
>  drivers/phy/intel/phy-intel-lgm-emmc.c                | 3 ++-
>  drivers/phy/lantiq/phy-lantiq-rcu-usb2.c              | 3 ++-
>  drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c           | 4 ++--
>  drivers/phy/marvell/phy-armada375-usb2.c              | 3 ++-
>  drivers/phy/marvell/phy-armada38x-comphy.c            | 3 ++-
>  drivers/phy/marvell/phy-berlin-sata.c                 | 3 ++-
>  drivers/phy/marvell/phy-berlin-usb.c                  | 3 ++-
>  drivers/phy/marvell/phy-mmp3-hsic.c                   | 3 ++-
>  drivers/phy/marvell/phy-mmp3-usb.c                    | 3 ++-
>  drivers/phy/marvell/phy-mvebu-a3700-comphy.c          | 3 ++-
>  drivers/phy/marvell/phy-mvebu-a3700-utmi.c            | 3 ++-
>  drivers/phy/marvell/phy-mvebu-cp110-comphy.c          | 3 ++-
>  drivers/phy/marvell/phy-mvebu-cp110-utmi.c            | 3 ++-
>  drivers/phy/marvell/phy-mvebu-sata.c                  | 3 ++-
>  drivers/phy/marvell/phy-pxa-28nm-hsic.c               | 3 ++-
>  drivers/phy/marvell/phy-pxa-28nm-usb2.c               | 3 ++-
>  drivers/phy/marvell/phy-pxa-usb.c                     | 3 ++-
>  drivers/phy/mediatek/phy-mtk-dp.c                     | 3 ++-
>  drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c            | 1 -
>  drivers/phy/mediatek/phy-mtk-hdmi.h                   | 3 ++-
>  drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c           | 2 +-
>  drivers/phy/mediatek/phy-mtk-mipi-dsi.h               | 3 ++-
>  drivers/phy/mediatek/phy-mtk-pcie.c                   | 2 +-
>  drivers/phy/mediatek/phy-mtk-tphy.c                   | 2 +-
>  drivers/phy/mediatek/phy-mtk-ufs.c                    | 2 +-
>  drivers/phy/mediatek/phy-mtk-xfi-tphy.c               | 2 +-
>  drivers/phy/mediatek/phy-mtk-xsphy.c                  | 2 +-
>  drivers/phy/microchip/lan966x_serdes.c                | 4 ++--
>  drivers/phy/microchip/sparx5_serdes.c                 | 2 +-
>  drivers/phy/motorola/phy-cpcap-usb.c                  | 3 ++-
>  drivers/phy/motorola/phy-mapphone-mdm6600.c           | 4 +++-
>  drivers/phy/mscc/phy-ocelot-serdes.c                  | 3 ++-
>  drivers/phy/nuvoton/phy-ma35d1-usb2.c                 | 3 ++-
>  drivers/phy/phy-airoha-pcie.c                         | 2 +-
>  drivers/phy/phy-can-transceiver.c                     | 3 ++-
>  drivers/phy/phy-core-mipi-dphy.c                      | 4 ++--
>  drivers/phy/phy-core.c                                | 2 ++
>  drivers/phy/phy-google-usb.c                          | 3 ++-
>  drivers/phy/phy-lpc18xx-usb-otg.c                     | 3 ++-
>  drivers/phy/phy-nxp-ptn3222.c                         | 3 ++-
>  drivers/phy/phy-pistachio-usb.c                       | 4 ++--
>  drivers/phy/phy-snps-eusb2.c                          | 2 ++
>  drivers/phy/phy-xgene.c                               | 3 ++-
>  drivers/phy/qualcomm/phy-ath79-usb.c                  | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-apq8064-sata.c          | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-edp.c                   | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c        | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c           | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-ipq806x-sata.c          | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c           | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-m31-eusb2.c             | 2 ++
>  drivers/phy/qualcomm/phy-qcom-m31.c                   | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-pcie2.c                 | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c             | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c      | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c              | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c               | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c        | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c               | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c              | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-qusb2.c                 | 4 ++--
>  drivers/phy/qualcomm/phy-qcom-sgmii-eth.c             | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c         | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c      | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c           | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-usb-hs.c                | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-usb-hsic.c              | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-usb-ss.c                | 3 ++-
>  drivers/phy/ralink/phy-mt7621-pci.c                   | 3 ++-
>  drivers/phy/ralink/phy-ralink-usb.c                   | 3 ++-
>  drivers/phy/realtek/phy-rtk-usb2.c                    | 3 ++-
>  drivers/phy/realtek/phy-rtk-usb3.c                    | 3 ++-
>  drivers/phy/renesas/phy-rcar-gen2.c                   | 3 ++-
>  drivers/phy/renesas/phy-rcar-gen3-pcie.c              | 3 ++-
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c              | 3 ++-
>  drivers/phy/renesas/phy-rcar-gen3-usb3.c              | 3 ++-
>  drivers/phy/renesas/phy-rzg3e-usb3.c                  | 3 ++-
>  drivers/phy/renesas/r8a779f0-ether-serdes.c           | 3 ++-
>  drivers/phy/rockchip/phy-rockchip-dp.c                | 3 ++-
>  drivers/phy/rockchip/phy-rockchip-dphy-rx0.c          | 3 ++-
>  drivers/phy/rockchip/phy-rockchip-emmc.c              | 3 ++-
>  drivers/phy/rockchip/phy-rockchip-inno-csidphy.c      | 3 ++-
>  drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c      | 4 ++--
>  drivers/phy/rockchip/phy-rockchip-inno-hdmi.c         | 2 ++
>  drivers/phy/rockchip/phy-rockchip-inno-usb2.c         | 3 ++-
>  drivers/phy/rockchip/phy-rockchip-naneng-combphy.c    | 3 ++-
>  drivers/phy/rockchip/phy-rockchip-pcie.c              | 2 +-
>  drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c     | 3 ++-
>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c     | 2 ++
>  drivers/phy/rockchip/phy-rockchip-snps-pcie3.c        | 3 ++-
>  drivers/phy/rockchip/phy-rockchip-typec.c             | 4 ++--
>  drivers/phy/rockchip/phy-rockchip-usb.c               | 3 ++-
>  drivers/phy/rockchip/phy-rockchip-usbdp.c             | 2 ++
>  drivers/phy/samsung/phy-exynos-dp-video.c             | 3 ++-
>  drivers/phy/samsung/phy-exynos-mipi-video.c           | 3 ++-
>  drivers/phy/samsung/phy-exynos-pcie.c                 | 3 ++-
>  drivers/phy/samsung/phy-exynos4210-usb2.c             | 3 ++-
>  drivers/phy/samsung/phy-exynos4x12-usb2.c             | 3 ++-
>  drivers/phy/samsung/phy-exynos5-usbdrd.c              | 2 ++
>  drivers/phy/samsung/phy-exynos5250-sata.c             | 3 ++-
>  drivers/phy/samsung/phy-exynos5250-usb2.c             | 3 ++-
>  drivers/phy/samsung/phy-s5pv210-usb2.c                | 3 ++-
>  drivers/phy/samsung/phy-samsung-ufs.c                 | 2 +-
>  drivers/phy/samsung/phy-samsung-ufs.h                 | 3 ++-
>  drivers/phy/samsung/phy-samsung-usb2.c                | 2 ++
>  drivers/phy/samsung/phy-samsung-usb2.h                | 3 ++-
>  drivers/phy/socionext/phy-uniphier-ahci.c             | 3 ++-
>  drivers/phy/socionext/phy-uniphier-pcie.c             | 3 ++-
>  drivers/phy/socionext/phy-uniphier-usb2.c             | 3 ++-
>  drivers/phy/socionext/phy-uniphier-usb3hs.c           | 3 ++-
>  drivers/phy/socionext/phy-uniphier-usb3ss.c           | 3 ++-
>  drivers/phy/sophgo/phy-cv1800-usb2.c                  | 3 ++-
>  drivers/phy/spacemit/phy-k1-pcie.c                    | 4 ++--
>  drivers/phy/spacemit/phy-k1-usb2.c                    | 3 ++-
>  drivers/phy/st/phy-miphy28lp.c                        | 4 ++--
>  drivers/phy/st/phy-spear1310-miphy.c                  | 3 ++-
>  drivers/phy/st/phy-spear1340-miphy.c                  | 3 ++-
>  drivers/phy/st/phy-stih407-usb.c                      | 3 ++-
>  drivers/phy/st/phy-stm32-combophy.c                   | 3 ++-
>  drivers/phy/st/phy-stm32-usbphyc.c                    | 2 ++
>  drivers/phy/starfive/phy-jh7110-dphy-rx.c             | 3 ++-
>  drivers/phy/starfive/phy-jh7110-dphy-tx.c             | 3 ++-
>  drivers/phy/starfive/phy-jh7110-pcie.c                | 3 ++-
>  drivers/phy/starfive/phy-jh7110-usb.c                 | 3 ++-
>  drivers/phy/sunplus/phy-sunplus-usb2.c                | 3 ++-
>  drivers/phy/tegra/phy-tegra194-p2u.c                  | 3 ++-
>  drivers/phy/tegra/xusb-tegra124.c                     | 2 +-
>  drivers/phy/tegra/xusb-tegra186.c                     | 2 +-
>  drivers/phy/tegra/xusb-tegra210.c                     | 2 +-
>  drivers/phy/tegra/xusb.c                              | 2 +-
>  drivers/phy/ti/phy-am654-serdes.c                     | 3 ++-
>  drivers/phy/ti/phy-da8xx-usb.c                        | 3 ++-
>  drivers/phy/ti/phy-dm816x-usb.c                       | 3 ++-
>  drivers/phy/ti/phy-gmii-sel.c                         | 3 ++-
>  drivers/phy/ti/phy-omap-usb2.c                        | 3 ++-
>  drivers/phy/ti/phy-ti-pipe3.c                         | 3 ++-
>  drivers/phy/ti/phy-twl4030-usb.c                      | 3 ++-
>  drivers/phy/xilinx/phy-zynqmp.c                       | 4 ++--
>  include/linux/phy/phy-sun4i-usb.h                     | 2 +-
>  include/linux/phy/ulpi_phy.h                          | 2 +-
>  189 files changed, 363 insertions(+), 193 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> #phy/qualcomm


-- 
With best wishes
Dmitry
