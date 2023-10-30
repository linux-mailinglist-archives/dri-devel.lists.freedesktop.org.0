Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EAC7DB4FF
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 09:19:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2E710E234;
	Mon, 30 Oct 2023 08:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0455510E234;
 Mon, 30 Oct 2023 08:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698653959; x=1730189959;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AcMF9VjShgicwfllFdfbQHLrf8Zoz2LK1NqqErPLinU=;
 b=TInHKLT8G3jLigiHapY4FqcmhfVe4xk1FP07R+vQ1fp1VWn/L9N4X0of
 0nOV5BPqX1dNALYQrx5jYRcXs/ABrf+mROHMzr/JMMSivp5mlmPzCC4Kl
 1xGpzn/9PBjxqejZqRt5qaVL9RGj6B+miYmYvqArxa7X3IG9tJCwUDBtm
 B0QRdFgpwScMjlSI4nXzMeZ7a9ufBBF9KFaRMpa5yoVx28nOaq8md72bx
 fI4lP0f4rUEz08RCR6pkeGsE6hJ5Wz0PUfWHn9zZsmYiUk+zqjxv6EgQs
 svsqtXrYN9veaKda6CP3uEmeQBBoSIw5nAjuaCaL9ns3dBMflLps1EYLU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="871678"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="871678"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 01:19:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="753716240"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; d="scan'208";a="753716240"
Received: from kuha.fi.intel.com ([10.237.72.185])
 by orsmga007.jf.intel.com with SMTP; 30 Oct 2023 01:19:09 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Mon, 30 Oct 2023 10:19:08 +0200
Date: Mon, 30 Oct 2023 10:19:08 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [RFC PATCH v1 12/12] usb: typec: qcom: define the bridge's path
Message-ID: <ZT9m/OoFUiZaWy9s@kuha.fi.intel.com>
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
 <20230903214150.2877023-13-dmitry.baryshkov@linaro.org>
 <ZQRKq7K8jKlH/Y4X@kuha.fi.intel.com>
 <0F1BE090-92C4-4233-A77A-9B4C653DA1A7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0F1BE090-92C4-4233-A77A-9B4C653DA1A7@linaro.org>
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

On Mon, Oct 23, 2023 at 09:24:33PM +0300, Dmitry Baryshkov wrote:
> On 15 September 2023 15:14:35 EEST, Heikki Krogerus <heikki.krogerus@linux.intel.com> wrote:
> >Hi Dmitry,
> >
> >On Mon, Sep 04, 2023 at 12:41:50AM +0300, Dmitry Baryshkov wrote:
> >> In order to notify the userspace about the DRM connector's USB-C port,
> >> export the corresponding port's name as the bridge's path field.
> >> 
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> ---
> >>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c     | 11 +++++++----
> >>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.c |  4 +++-
> >>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.h |  6 ++++--
> >>  3 files changed, 14 insertions(+), 7 deletions(-)
> >> 
> >> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> >> index b9d4856101c7..452dc6437861 100644
> >> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> >> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> >> @@ -156,6 +156,7 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
> >>  	struct device_node *np = dev->of_node;
> >>  	const struct pmic_typec_resources *res;
> >>  	struct regmap *regmap;
> >> +	char *tcpm_name;
> >>  	u32 base[2];
> >>  	int ret;
> >>  
> >> @@ -211,10 +212,6 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
> >>  	mutex_init(&tcpm->lock);
> >>  	platform_set_drvdata(pdev, tcpm);
> >>  
> >> -	tcpm->pmic_typec_drm = qcom_pmic_typec_init_drm(dev);
> >> -	if (IS_ERR(tcpm->pmic_typec_drm))
> >> -		return PTR_ERR(tcpm->pmic_typec_drm);
> >> -
> >>  	tcpm->tcpc.fwnode = device_get_named_child_node(tcpm->dev, "connector");
> >>  	if (!tcpm->tcpc.fwnode)
> >>  		return -EINVAL;
> >> @@ -225,6 +222,12 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
> >>  		goto fwnode_remove;
> >>  	}
> >>  
> >> +	tcpm_name = tcpm_port_get_name(tcpm->tcpm_port);
> >> +	tcpm->pmic_typec_drm = qcom_pmic_typec_init_drm(dev, tcpm_name);
> >
> >So I got some questions and concerns off-list. This was one of the
> >concerns. That tcpm_name is now the actual port device name, so I'm
> >afraid this is not acceptable.
> >
> >You can't use device name as a reference, ever. There is no way to
> >guarantee that a device with a specific name is what you meant it to
> >be by the time it's accessed.
> 
> Hmm, could you please be more specific, why? I mean, class devices are not
> that easy to be renamed in sysfs, are they? Or are you concerned about the
> device being destroyed behind userspace's back? At least for MSM this will be
> a huge problem already, with the bridge driver suddenly being removed.

The race exists even in your case, but please do not look at this as a
solution for only your platform.

This is about showing the user space a link between two device
instances (struct device), and the way you do that is by creating a
symlink. That way the kernel can take care of reference counting and
guarantee that the link always points to the correct device. That way
the link will also be always visible in user space without requirement
for any specific ABI like it should.

thanks,

-- 
heikki
