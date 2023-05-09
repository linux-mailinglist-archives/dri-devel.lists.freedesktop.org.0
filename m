Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CCA6FC079
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 09:31:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB0910E340;
	Tue,  9 May 2023 07:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 546 seconds by postgrey-1.36 at gabe;
 Tue, 09 May 2023 07:31:28 UTC
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D4610E340
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 07:31:27 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3495WGoY024204; Tue, 9 May 2023 09:22:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=selector1;
 bh=97PZYDfJILy385JWBuVl17AkpUXt3cDO4HUDlkN0lIw=;
 b=2p3Vrd06qkXn4Dg641lBznHO3yAptcMyS2R4RCmn++Ky4N03niaa6lPKfd5bb176KAUW
 n7MvxJDZZwObL3hAOexpJ4SblYZ+PjhbAuTn9eGlrMBTLSEY2wovfXBP3BRxKAchkKot
 zRjTVpupB8OYK/Vo7LYgu3c20uwJ9cmgV+ktaNc4CRsgLq2agHqKHnu60n46Jvk6gfqm
 dnNuJsMXksz8dQpmu64zeQf9SWN4YF+6pEJal1mVYsu79vunx/sVQBkujaEt8qfugIjP
 6iVxEVHbGJ1XJDClVyqYOctbYcB2+SHasyfBoFgd8+yI7EfjsfOyPNidhUZTjpU6sc9w EA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qf787atba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 May 2023 09:22:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B0CAC10002A;
 Tue,  9 May 2023 09:22:16 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9DC46212306;
 Tue,  9 May 2023 09:22:16 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 9 May
 2023 09:22:16 +0200
Date: Tue, 9 May 2023 09:22:11 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 41/53] drm/sti: Convert to platform remove callback
 returning void
Message-ID: <20230509072211.GA1593946@gnbcxd0016.gnb.st.com>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-42-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230507162616.1368908-42-u.kleine-koenig@pengutronix.de>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_04,2023-05-05_01,2023-02-09_01
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Acked-by: Alain Volmat <alain.volmat@foss.st.com>

Regards,
Alain

On Sun, May 07, 2023 at 06:26:04PM +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert the sti drm drivers from always returning zero in the
> remove callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/gpu/drm/sti/sti_compositor.c | 5 ++---
>  drivers/gpu/drm/sti/sti_drv.c        | 6 ++----
>  drivers/gpu/drm/sti/sti_dvo.c        | 5 ++---
>  drivers/gpu/drm/sti/sti_hda.c        | 5 ++---
>  drivers/gpu/drm/sti/sti_hdmi.c       | 6 ++----
>  drivers/gpu/drm/sti/sti_hqvdp.c      | 5 ++---
>  drivers/gpu/drm/sti/sti_tvout.c      | 5 ++---
>  7 files changed, 14 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sti/sti_compositor.c b/drivers/gpu/drm/sti/sti_compositor.c
> index 142a8e1b4436..33487a1fed8f 100644
> --- a/drivers/gpu/drm/sti/sti_compositor.c
> +++ b/drivers/gpu/drm/sti/sti_compositor.c
> @@ -258,10 +258,9 @@ static int sti_compositor_probe(struct platform_device *pdev)
>  	return component_add(&pdev->dev, &sti_compositor_ops);
>  }
>  
> -static int sti_compositor_remove(struct platform_device *pdev)
> +static void sti_compositor_remove(struct platform_device *pdev)
>  {
>  	component_del(&pdev->dev, &sti_compositor_ops);
> -	return 0;
>  }
>  
>  struct platform_driver sti_compositor_driver = {
> @@ -270,7 +269,7 @@ struct platform_driver sti_compositor_driver = {
>  		.of_match_table = compositor_of_match,
>  	},
>  	.probe = sti_compositor_probe,
> -	.remove = sti_compositor_remove,
> +	.remove_new = sti_compositor_remove,
>  };
>  
>  MODULE_AUTHOR("Benjamin Gaignard <benjamin.gaignard@st.com>");
> diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
> index ef6a4e63198f..451480041130 100644
> --- a/drivers/gpu/drm/sti/sti_drv.c
> +++ b/drivers/gpu/drm/sti/sti_drv.c
> @@ -246,11 +246,9 @@ static int sti_platform_probe(struct platform_device *pdev)
>  	return component_master_add_with_match(dev, &sti_ops, match);
>  }
>  
> -static int sti_platform_remove(struct platform_device *pdev)
> +static void sti_platform_remove(struct platform_device *pdev)
>  {
>  	component_master_del(&pdev->dev, &sti_ops);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id sti_dt_ids[] = {
> @@ -261,7 +259,7 @@ MODULE_DEVICE_TABLE(of, sti_dt_ids);
>  
>  static struct platform_driver sti_platform_driver = {
>  	.probe = sti_platform_probe,
> -	.remove = sti_platform_remove,
> +	.remove_new = sti_platform_remove,
>  	.driver = {
>  		.name = DRIVER_NAME,
>  		.of_match_table = sti_dt_ids,
> diff --git a/drivers/gpu/drm/sti/sti_dvo.c b/drivers/gpu/drm/sti/sti_dvo.c
> index 577c477b5f46..0dca0048dd25 100644
> --- a/drivers/gpu/drm/sti/sti_dvo.c
> +++ b/drivers/gpu/drm/sti/sti_dvo.c
> @@ -567,10 +567,9 @@ static int sti_dvo_probe(struct platform_device *pdev)
>  	return component_add(&pdev->dev, &sti_dvo_ops);
>  }
>  
> -static int sti_dvo_remove(struct platform_device *pdev)
> +static void sti_dvo_remove(struct platform_device *pdev)
>  {
>  	component_del(&pdev->dev, &sti_dvo_ops);
> -	return 0;
>  }
>  
>  static const struct of_device_id dvo_of_match[] = {
> @@ -586,7 +585,7 @@ struct platform_driver sti_dvo_driver = {
>  		.of_match_table = dvo_of_match,
>  	},
>  	.probe = sti_dvo_probe,
> -	.remove = sti_dvo_remove,
> +	.remove_new = sti_dvo_remove,
>  };
>  
>  MODULE_AUTHOR("Benjamin Gaignard <benjamin.gaignard@st.com>");
> diff --git a/drivers/gpu/drm/sti/sti_hda.c b/drivers/gpu/drm/sti/sti_hda.c
> index 15097ac67931..6ee35612a14e 100644
> --- a/drivers/gpu/drm/sti/sti_hda.c
> +++ b/drivers/gpu/drm/sti/sti_hda.c
> @@ -792,10 +792,9 @@ static int sti_hda_probe(struct platform_device *pdev)
>  	return component_add(&pdev->dev, &sti_hda_ops);
>  }
>  
> -static int sti_hda_remove(struct platform_device *pdev)
> +static void sti_hda_remove(struct platform_device *pdev)
>  {
>  	component_del(&pdev->dev, &sti_hda_ops);
> -	return 0;
>  }
>  
>  static const struct of_device_id hda_of_match[] = {
> @@ -812,7 +811,7 @@ struct platform_driver sti_hda_driver = {
>  		.of_match_table = hda_of_match,
>  	},
>  	.probe = sti_hda_probe,
> -	.remove = sti_hda_remove,
> +	.remove_new = sti_hda_remove,
>  };
>  
>  MODULE_AUTHOR("Benjamin Gaignard <benjamin.gaignard@st.com>");
> diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
> index 8539fe1fedc4..3d8ddceca845 100644
> --- a/drivers/gpu/drm/sti/sti_hdmi.c
> +++ b/drivers/gpu/drm/sti/sti_hdmi.c
> @@ -1471,7 +1471,7 @@ static int sti_hdmi_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int sti_hdmi_remove(struct platform_device *pdev)
> +static void sti_hdmi_remove(struct platform_device *pdev)
>  {
>  	struct sti_hdmi *hdmi = dev_get_drvdata(&pdev->dev);
>  
> @@ -1479,8 +1479,6 @@ static int sti_hdmi_remove(struct platform_device *pdev)
>  	if (hdmi->audio_pdev)
>  		platform_device_unregister(hdmi->audio_pdev);
>  	component_del(&pdev->dev, &sti_hdmi_ops);
> -
> -	return 0;
>  }
>  
>  struct platform_driver sti_hdmi_driver = {
> @@ -1490,7 +1488,7 @@ struct platform_driver sti_hdmi_driver = {
>  		.of_match_table = hdmi_of_match,
>  	},
>  	.probe = sti_hdmi_probe,
> -	.remove = sti_hdmi_remove,
> +	.remove_new = sti_hdmi_remove,
>  };
>  
>  MODULE_AUTHOR("Benjamin Gaignard <benjamin.gaignard@st.com>");
> diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
> index 02b77279f6e4..0fb48ac044d8 100644
> --- a/drivers/gpu/drm/sti/sti_hqvdp.c
> +++ b/drivers/gpu/drm/sti/sti_hqvdp.c
> @@ -1400,10 +1400,9 @@ static int sti_hqvdp_probe(struct platform_device *pdev)
>  	return component_add(&pdev->dev, &sti_hqvdp_ops);
>  }
>  
> -static int sti_hqvdp_remove(struct platform_device *pdev)
> +static void sti_hqvdp_remove(struct platform_device *pdev)
>  {
>  	component_del(&pdev->dev, &sti_hqvdp_ops);
> -	return 0;
>  }
>  
>  static const struct of_device_id hqvdp_of_match[] = {
> @@ -1419,7 +1418,7 @@ struct platform_driver sti_hqvdp_driver = {
>  		.of_match_table = hqvdp_of_match,
>  	},
>  	.probe = sti_hqvdp_probe,
> -	.remove = sti_hqvdp_remove,
> +	.remove_new = sti_hqvdp_remove,
>  };
>  
>  MODULE_AUTHOR("Benjamin Gaignard <benjamin.gaignard@st.com>");
> diff --git a/drivers/gpu/drm/sti/sti_tvout.c b/drivers/gpu/drm/sti/sti_tvout.c
> index 2499715a69b7..64615638b79a 100644
> --- a/drivers/gpu/drm/sti/sti_tvout.c
> +++ b/drivers/gpu/drm/sti/sti_tvout.c
> @@ -872,10 +872,9 @@ static int sti_tvout_probe(struct platform_device *pdev)
>  	return component_add(dev, &sti_tvout_ops);
>  }
>  
> -static int sti_tvout_remove(struct platform_device *pdev)
> +static void sti_tvout_remove(struct platform_device *pdev)
>  {
>  	component_del(&pdev->dev, &sti_tvout_ops);
> -	return 0;
>  }
>  
>  static const struct of_device_id tvout_of_match[] = {
> @@ -891,7 +890,7 @@ struct platform_driver sti_tvout_driver = {
>  		.of_match_table = tvout_of_match,
>  	},
>  	.probe = sti_tvout_probe,
> -	.remove = sti_tvout_remove,
> +	.remove_new = sti_tvout_remove,
>  };
>  
>  MODULE_AUTHOR("Benjamin Gaignard <benjamin.gaignard@st.com>");
> -- 
> 2.39.2
> 
