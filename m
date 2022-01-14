Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 425634903ED
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 09:34:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A9CD891A0;
	Mon, 17 Jan 2022 08:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F9E110EAA9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 10:35:04 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20E6h4gD020480;
 Fri, 14 Jan 2022 11:34:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=selector1;
 bh=RIXsykMSfBoDap0KDA7BfOr8gY7UNB4Kwa057e833C4=;
 b=S2LbzhX2bStSasodrbVQLbE1s+WNZk5TlHtTIMuzO2ldJiCsT2MniH03+TLaZSjhPDQX
 BCkB31/VPCOaNt+eVvDPk0DSTY4jRqbwq4zfA4r78cG0yvYuabfygKF811P6w+NzIsN+
 Bh3iG55v/n4oL5IObNkvqIYZ/QKYa50fgAjneh4M3ug+J0V0HY1fI1T9tm0aXM2AMXRQ
 UOhxbbhkEjQEYa8EXfpqyKKcuBjBXvH4KrFq32Nzj+YuGB5eWxPOCNG/sfeEwbplMNAj
 u5ablnglXxqAds98O2SdrQFE+jYqc3kP1i94H2FBAYYh7PA+dGEaEg1GYVvk3g/YTxLS kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dk45ascdv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jan 2022 11:34:41 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EAA9710003A;
 Fri, 14 Jan 2022 11:34:22 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DF556212303;
 Fri, 14 Jan 2022 11:34:22 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.75.127.45) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 14 Jan
 2022 11:34:22 +0100
Date: Fri, 14 Jan 2022 11:34:15 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Philippe Cornu <philippe.cornu@foss.st.com>
Subject: Re: [PATCH 2/2] MAINTAINERS: update drm/stm drm/sti and cec/sti
 maintainers
Message-ID: <20220114103415.GA374310@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Philippe Cornu <philippe.cornu@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>,
 Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <john.stultz@linaro.org>,
 Christian Konig <christian.koenig@amd.com>, soc@kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20220113171921.17466-1-philippe.cornu@foss.st.com>
 <20220113171921.17466-3-philippe.cornu@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220113171921.17466-3-philippe.cornu@foss.st.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-14_04,2022-01-14_01,2021-12-02_01
X-Mailman-Approved-At: Mon, 17 Jan 2022 08:34:35 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Laura Abbott <labbott@redhat.com>, linux-media@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 linaro-mm-sig@lists.linaro.org, soc@kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-kernel@vger.kernel.org,
 Liam Mark <lmark@codeaurora.org>, Christian Konig <christian.koenig@amd.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Philippe,

thanks for the patch.

Reviewed-by: Alain Volmat <alain.volmat@foss.st.com>

Alain

On Thu, Jan 13, 2022 at 06:19:21PM +0100, Philippe Cornu wrote:
> Add Alain as sti maintainer for both drm/sti & cec/sti.
> Add Raphaël as stm maintainer for drm/stm.
> 
> Signed-off-by: Philippe Cornu <philippe.cornu@foss.st.com>
> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6bea080d0159..708f8c86e4c9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6423,6 +6423,7 @@ F:	Documentation/devicetree/bindings/display/rockchip/
>  F:	drivers/gpu/drm/rockchip/
>  
>  DRM DRIVERS FOR STI
> +M:	Alain Volmat <alain.volmat@foss.st.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Maintained
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
> @@ -6431,6 +6432,7 @@ F:	drivers/gpu/drm/sti
>  
>  DRM DRIVERS FOR STM
>  M:	Yannick Fertre <yannick.fertre@foss.st.com>
> +M:	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
>  M:	Philippe Cornu <philippe.cornu@foss.st.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Maintained
> @@ -18152,6 +18154,7 @@ F:	Documentation/devicetree/bindings/sound/st,sti-asoc-card.txt
>  F:	sound/soc/sti/
>  
>  STI CEC DRIVER
> +M:	Alain Volmat <alain.volmat@foss.st.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/stih-cec.txt
>  F:	drivers/media/cec/platform/sti/
> -- 
> 2.17.1
> 
