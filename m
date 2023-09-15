Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CC97A1E3C
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 14:15:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5068410E181;
	Fri, 15 Sep 2023 12:15:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D76910E181;
 Fri, 15 Sep 2023 12:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694780105; x=1726316105;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jH6v5bbbkkEM6BDUb1aHP3gU8Bm1CEPG4JUxxTB7iDI=;
 b=fsde/vXU3HuwMCrzIEoccDRLDRxXJbMaO4meSXbukv8h/Cv8NPkjeSlI
 0++bxDPznL7/I8Uwztgo9F4AQsmZaJi9+6mtQpcciLOPQqCR6KPbn5/qq
 fBgReRRf42tQhD5gc0QjpOKb0pvWWzaUMl4cTO64J8dUD+M4gdYaJJnKY
 tF2dT9R3WJueQfa0IwC64xxmdxx0oFRMnmSq320lPSDK1gU0f5dWDuzZn
 4cHRptDHWoRS9FF9DDdsMup8wgVkt0MlYXwt7IxQZ9c/kbRYsjE5yXqD/
 P+9wFLnUY3QJ85W4TaYxVQTp9DfhSj5fJfTRR3N9Cmet+SnQl7vXVSonW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="359490905"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="359490905"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 05:14:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="835190933"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="835190933"
Received: from kuha.fi.intel.com ([10.237.72.185])
 by FMSMGA003.fm.intel.com with SMTP; 15 Sep 2023 05:14:36 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Fri, 15 Sep 2023 15:14:35 +0300
Date: Fri, 15 Sep 2023 15:14:35 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [RFC PATCH v1 12/12] usb: typec: qcom: define the bridge's path
Message-ID: <ZQRKq7K8jKlH/Y4X@kuha.fi.intel.com>
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
 <20230903214150.2877023-13-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230903214150.2877023-13-dmitry.baryshkov@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Janne Grunau <j@jannau.net>,
 Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andy Gross <agross@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On Mon, Sep 04, 2023 at 12:41:50AM +0300, Dmitry Baryshkov wrote:
> In order to notify the userspace about the DRM connector's USB-C port,
> export the corresponding port's name as the bridge's path field.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c     | 11 +++++++----
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.c |  4 +++-
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.h |  6 ++++--
>  3 files changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> index b9d4856101c7..452dc6437861 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> @@ -156,6 +156,7 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
>  	struct device_node *np = dev->of_node;
>  	const struct pmic_typec_resources *res;
>  	struct regmap *regmap;
> +	char *tcpm_name;
>  	u32 base[2];
>  	int ret;
>  
> @@ -211,10 +212,6 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
>  	mutex_init(&tcpm->lock);
>  	platform_set_drvdata(pdev, tcpm);
>  
> -	tcpm->pmic_typec_drm = qcom_pmic_typec_init_drm(dev);
> -	if (IS_ERR(tcpm->pmic_typec_drm))
> -		return PTR_ERR(tcpm->pmic_typec_drm);
> -
>  	tcpm->tcpc.fwnode = device_get_named_child_node(tcpm->dev, "connector");
>  	if (!tcpm->tcpc.fwnode)
>  		return -EINVAL;
> @@ -225,6 +222,12 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
>  		goto fwnode_remove;
>  	}
>  
> +	tcpm_name = tcpm_port_get_name(tcpm->tcpm_port);
> +	tcpm->pmic_typec_drm = qcom_pmic_typec_init_drm(dev, tcpm_name);

So I got some questions and concerns off-list. This was one of the
concerns. That tcpm_name is now the actual port device name, so I'm
afraid this is not acceptable.

You can't use device name as a reference, ever. There is no way to
guarantee that a device with a specific name is what you meant it to
be by the time it's accessed.

If you need to deal with a device, then you have to get an actual
reference to it (class_find_device_by_fwnode() should work in this
case).

Ideally you would get the reference in the place where you actually
use it (so drm_connector.c or more likely drm_sysfs.c) but that would
mean a dependency on typec in there, if the component framework or
something like that (device links?) is not an option. You could of
course try to confine the dependency somehow. drm_class does not have
implementation for dev_uevent, so you could take over that as a
temporary solution.

The only way to avoid the dependency completely would be to pass that
device reference from here through your drm bridge chain somehow.
But that's also really fragile. But it could be acceptable as a
temporary solution perhaps, if it's even possible.

Br,

-- 
heikki
