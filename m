Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A8C4E926C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 12:21:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2321A10E64B;
	Mon, 28 Mar 2022 10:21:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68DB810E64B
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 10:21:41 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22S8BMXE019040;
 Mon, 28 Mar 2022 12:21:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=selector1; bh=tr8bqECgyoSgmNdiTmE86VHoDSgPJHIr1yZr/4QXkyY=;
 b=PlJYqMPLB2Ap0PakzNbhZUD/HRlKXanYn6KAUefA556cYxJpoDB2oIyURqjVv1X5zzfu
 N49w+/Kgc+GGfJgW7eSZ5yhZkVQbUOPGLMoiqtG5vmkdJxFhy2ZnweaIPexdkSavKNoq
 6K+F9t2mPZqoVOMHCvlruXR5J+iyJj7aJ0nNvuFiZvLuDZkaWilo/KFCIS+siqP4ogwy
 WNSKcEVrGdKpqJ0Q1fJ13n//KraOty4e6GwmIl8mi93/+dMJJ1gTj8ybUZ/BtYWN84tG
 4VsKMI87LeKyKZqwxTncx/Pub+HyAQaO4QFPPy2zIMJoJUktshYyYhGFqtKxvgsesgcT Yw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3f1s4p132k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Mar 2022 12:21:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8D59810002A;
 Mon, 28 Mar 2022 12:21:23 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4495021ED5D;
 Mon, 28 Mar 2022 12:21:23 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.51) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 28 Mar
 2022 12:21:22 +0200
Date: Mon, 28 Mar 2022 12:21:16 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] drm: sti: don't use kernel-doc markers
Message-ID: <20220328102116.GA2406908@gnbcxd0016.gnb.st.com>
References: <20220326235132.25192-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220326235132.25192-1-rdunlap@infradead.org>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-28_03,2022-03-28_01,2022-02-23_01
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
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Aditya Srivastava <yashsri421@gmail.com>, David Airlie <airlied@linux.ie>,
 patches@lists.linux.dev, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Randy,

thanks for the patch.

Acked-by: Alain Volmat <alain.volmat@foss.st.com>

Alain

On Sat, Mar 26, 2022 at 04:51:32PM -0700, Randy Dunlap wrote:
> Don't mark static functions as kernel-doc.
> 
> Prevents multiple kernel-doc build warnings:
> 
> drivers/gpu/drm/sti/sti_hdmi.c:187: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  * HDMI interrupt handler threaded
> drivers/gpu/drm/sti/sti_hdmi.c:219: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  * HDMI interrupt handler
> drivers/gpu/drm/sti/sti_hdmi.c:241: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  * Set hdmi active area depending on the drm display mode selected
> drivers/gpu/drm/sti/sti_hdmi.c:262: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  * Overall hdmi configuration
> drivers/gpu/drm/sti/sti_hdmi.c:340: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  * Helper to concatenate infoframe in 32 bits word
> drivers/gpu/drm/sti/sti_hdmi.c:357: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  * Helper to write info frame
> drivers/gpu/drm/sti/sti_hdmi.c:427: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  * Prepare and configure the AVI infoframe
> drivers/gpu/drm/sti/sti_hdmi.c:470: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  * Prepare and configure the AUDIO infoframe
> drivers/gpu/drm/sti/sti_hdmi.c:555: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  * Software reset of the hdmi subsystem
> 
> Fixes: 5402626c83a2 ("drm: sti: add HDMI driver")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Aditya Srivastava <yashsri421@gmail.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> Cc: Alain Volmat <alain.volmat@foss.st.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/sti/sti_hdmi.c |   20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> --- linux-next-20220325.orig/drivers/gpu/drm/sti/sti_hdmi.c
> +++ linux-next-20220325/drivers/gpu/drm/sti/sti_hdmi.c
> @@ -183,7 +183,7 @@ void hdmi_write(struct sti_hdmi *hdmi, u
>  	writel(val, hdmi->regs + offset);
>  }
>  
> -/**
> +/*
>   * HDMI interrupt handler threaded
>   *
>   * @irq: irq number
> @@ -215,7 +215,7 @@ static irqreturn_t hdmi_irq_thread(int i
>  	return IRQ_HANDLED;
>  }
>  
> -/**
> +/*
>   * HDMI interrupt handler
>   *
>   * @irq: irq number
> @@ -237,7 +237,7 @@ static irqreturn_t hdmi_irq(int irq, voi
>  	return IRQ_WAKE_THREAD;
>  }
>  
> -/**
> +/*
>   * Set hdmi active area depending on the drm display mode selected
>   *
>   * @hdmi: pointer on the hdmi internal structure
> @@ -258,7 +258,7 @@ static void hdmi_active_area(struct sti_
>  	hdmi_write(hdmi, ymax, HDMI_ACTIVE_VID_YMAX);
>  }
>  
> -/**
> +/*
>   * Overall hdmi configuration
>   *
>   * @hdmi: pointer on the hdmi internal structure
> @@ -336,7 +336,7 @@ static void hdmi_infoframe_reset(struct
>  		hdmi_write(hdmi, 0x0, pack_offset + i);
>  }
>  
> -/**
> +/*
>   * Helper to concatenate infoframe in 32 bits word
>   *
>   * @ptr: pointer on the hdmi internal structure
> @@ -353,7 +353,7 @@ static inline unsigned int hdmi_infofram
>  	return value;
>  }
>  
> -/**
> +/*
>   * Helper to write info frame
>   *
>   * @hdmi: pointer on the hdmi internal structure
> @@ -423,7 +423,7 @@ static void hdmi_infoframe_write_infopac
>  	hdmi_write(hdmi, val, HDMI_SW_DI_CFG);
>  }
>  
> -/**
> +/*
>   * Prepare and configure the AVI infoframe
>   *
>   * AVI infoframe are transmitted at least once per two video field and
> @@ -466,7 +466,7 @@ static int hdmi_avi_infoframe_config(str
>  	return 0;
>  }
>  
> -/**
> +/*
>   * Prepare and configure the AUDIO infoframe
>   *
>   * AUDIO infoframe are transmitted once per frame and
> @@ -551,7 +551,7 @@ static int hdmi_vendor_infoframe_config(
>  
>  #define HDMI_TIMEOUT_SWRESET  100   /*milliseconds */
>  
> -/**
> +/*
>   * Software reset of the hdmi subsystem
>   *
>   * @hdmi: pointer on the hdmi internal structure
> @@ -785,7 +785,7 @@ static void sti_hdmi_disable(struct drm_
>  	cec_notifier_set_phys_addr(hdmi->notifier, CEC_PHYS_ADDR_INVALID);
>  }
>  
> -/**
> +/*
>   * sti_hdmi_audio_get_non_coherent_n() - get N parameter for non-coherent
>   * clocks. None-coherent clocks means that audio and TMDS clocks have not the
>   * same source (drifts between clocks). In this case assumption is that CTS is
