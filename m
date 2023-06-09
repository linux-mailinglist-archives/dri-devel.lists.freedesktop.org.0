Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFF1729CEE
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 16:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D9F10E6AF;
	Fri,  9 Jun 2023 14:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB0E510E6AF
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 14:31:56 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f122ff663eso2313323e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jun 2023 07:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686321114; x=1688913114;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J2y2HdDd7pDRhxkuoV0sN0tGmbLDSEWqGjjnTOPE8C0=;
 b=jv6QgWSWJK9B49CWVEjYYq8OTrViNl5tn0TnuYZDfsu7ddSU+eWiK7dM+r8VmImRu/
 XshjhX5j9vxKlqOl0yMQaJ6sZLpSyoYF5Cg5tWdMFmDHMvdSAFSeB4Gk1gvBhP5lKa+b
 oWEF7agXfNxGbkjTg/xUVaMx/Fr6ogU8wuPG4r4wv5eu4C6iOniTfmY0FI4Fcgf24eNy
 NAjZvyszlpElPHSUdDG9PZxH1/kuFOoblF7ReH5fJjeEMhe+wAerQq4idTebaiID9sAv
 A/qV7vZ1K7dzcC/UjVbaTWd9PtBC2J1mHDVOPErOGBG1665guAQLq8gBUqQWE3r5sqbg
 YOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686321114; x=1688913114;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J2y2HdDd7pDRhxkuoV0sN0tGmbLDSEWqGjjnTOPE8C0=;
 b=CV1KcHS/1JuVPMUszIxM2lLspR5YejOI9iPhHMC/+gEEHFMglZt9kY+/5LUAewXH/O
 5nj9xwplEgZqv7EVRFBIRVVgQ7+Q3uRBDp4bdDcLBnSAB0+AMf3qbAEvlcXBuIAqMiKH
 kh6ZjH1Ds9uW2jxtxzKCodehwe8/IRiNCMkuCdC62VrExQthzThP7xTBivCarqqy2zwz
 wcgoX0KB1L0W0t1Mjv4ACBeF8yBbjFxPtNdIsgJmeRQyO9/CJ7RuHAdmYH4Mjd7HCpJK
 ZGex6toLXW7IoiUkyDLcX8u6a0zISoeMrY4245YztsvJXhMjO06GbC3mz53VvUyDrMXI
 jLuw==
X-Gm-Message-State: AC+VfDznRT8VNAJ2P7Nm7fqgtC+z/Hv+pB27kCSIS+FabJUVRapMoHII
 9x8uCrjcDoSdwktPYeG6mUQ=
X-Google-Smtp-Source: ACHHUZ5c+syomOcPl20/KiXNVGkRj8MpgvmbDUBaQd5g7W8c0gmKY1MCKxluMEQITPiWqgOL7sc/IQ==
X-Received: by 2002:ac2:5b5b:0:b0:4f3:a9d3:4893 with SMTP id
 i27-20020ac25b5b000000b004f3a9d34893mr1119113lfp.35.1686321114094; 
 Fri, 09 Jun 2023 07:31:54 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 u26-20020a05600c00da00b003eddc6aa5fasm2862276wmm.39.2023.06.09.07.31.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jun 2023 07:31:53 -0700 (PDT)
Message-ID: <eed12356-4bc8-29a3-6105-b2bc65d74029@gmail.com>
Date: Fri, 9 Jun 2023 16:31:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [RESEND 05/15] drm/mediatek/mtk_disp_ccorr: Remove half completed
 incorrect struct header
Content-Language: en-US, ca-ES, es-ES
To: Lee Jones <lee@kernel.org>
References: <20230609081732.3842341-1-lee@kernel.org>
 <20230609081732.3842341-6-lee@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230609081732.3842341-6-lee@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 09/06/2023 10:17, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>   drivers/gpu/drm/mediatek/mtk_disp_ccorr.c:47: warning: Function parameter or member 'clk' not described in 'mtk_disp_ccorr'
>   drivers/gpu/drm/mediatek/mtk_disp_ccorr.c:47: warning: Function parameter or member 'regs' not described in 'mtk_disp_ccorr'
>   drivers/gpu/drm/mediatek/mtk_disp_ccorr.c:47: warning: Function parameter or member 'cmdq_reg' not described in 'mtk_disp_ccorr'
>   drivers/gpu/drm/mediatek/mtk_disp_ccorr.c:47: warning: Function parameter or member 'data' not described in 'mtk_disp_ccorr'
> 
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>   drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> index 1773379b24398..720f3c7ef7b4f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> @@ -34,11 +34,6 @@ struct mtk_disp_ccorr_data {
>   	u32 matrix_bits;
>   };
>   
> -/**
> - * struct mtk_disp_ccorr - DISP_CCORR driver structure
> - * @ddp_comp - structure containing type enum and hardware resources
> - * @crtc - associated crtc to report irq events to
> - */

That surely suppress the warning but I think the correct to do here is to fix 
the documentation instead of deleting it.

Regards,
Matthias

>   struct mtk_disp_ccorr {
>   	struct clk *clk;
>   	void __iomem *regs;
