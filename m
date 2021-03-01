Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC59327CD2
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 12:08:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14AE56E59F;
	Mon,  1 Mar 2021 11:08:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net
 [194.109.24.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 150556E59F
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 11:08:01 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud9.xs4all.net with ESMTPA
 id GgP6lCpXQC40pGgP9lhj2n; Mon, 01 Mar 2021 12:08:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1614596880; bh=sB8gn7ITrtTQgxIUOieZ/3PHxgfw16cXjUetSnHXHcQ=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=RqE6lnePmZXjyax5+KvwEn9Xwkw6goDSAoRBsB5uhqgN85I19gYqDIbg2MAHOLwxO
 IChyHv6ZPWOMhz47m7XMfweTTW73+MsGjTCf4OQHz2ZmoDTX5ZG1cd0e6I3LkqifTq
 Vfbr6Hq29DUceOBKTG5kGYSygDx5tXVlz3D8zRgxVQa/h16vlKgcZ+cNqTU/y9ZtzI
 zxmQxIilSjb/7BBBL96V9ioIvmiz9uZbg8vowK1diJh7A/sbnovWzPZcqSfxfVucsA
 B69wXbdn3v/a9P3QNAiAERCXDQ3+YMTmOcOcJK2zfceyNvGFgpu/ZQOFnBIAaR/HDU
 fPEs5tH1Ly9OQ==
Subject: Re: [PATCH 2/5] drm/omap: hdmi4: switch to the cec bridge ops
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20210211103703.444625-1-hverkuil-cisco@xs4all.nl>
 <20210211103703.444625-3-hverkuil-cisco@xs4all.nl>
 <YC+qFsroJl8+Oy3q@pendragon.ideasonboard.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <b0c9050b-099f-bf2b-a566-9f5893d1b417@xs4all.nl>
Date: Mon, 1 Mar 2021 12:07:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YC+qFsroJl8+Oy3q@pendragon.ideasonboard.com>
Content-Language: en-US
X-CMAE-Envelope: MS4xfFPe2YlN+A9fhHQbP+pTQwEyjn09Bivetk1rxuPfH556ZQwpCOByvcUSV8xhbtDf0TeUlPBwWfJiiV1ockqIWA5syWHsol8DmcqOPV/OLrqE9+kIvpRn
 fb37fbqSn4WaKVOnjKnwmZ3LeYI9bzZ1NcXMeS8fGt51tdzKGwibV/EDBRZEDV/VU/n41l51m98lehR26wJcW9S73iW8H48VMY7YelHKD78YFl/OKZIvNVC4
 0J6cS2GIcm+bR3s32W7YC/62lZp4sMJXD5N/Fi0C/NwmE59xWhLevY7RFtvbjrvX1+rtUzcCQyPvVKoYhZT8CGP0IznkomSQSujesU80mUPd2g+wTTNE8rY5
 yUOZHT/VjYKwtVXaLygGlhgvCU2gNj3mj/29tUPvBGbaBv6NTyMEYJZj75P1Fs09KBGv2Vmh
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
Cc: Tony Lindgren <tony@atomide.com>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 linux-omap@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/02/2021 13:07, Laurent Pinchart wrote:
> Hi Hans,
> 
> Thank you for the patch.
> 
> On Thu, Feb 11, 2021 at 11:37:00AM +0100, Hans Verkuil wrote:
>> Implement the new CEC bridge ops. This makes it possible to associate
>> a CEC adapter with a drm connector, which helps userspace determine
>> with cec device node belongs to which drm connector.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>  drivers/gpu/drm/omapdrm/dss/hdmi4.c     | 28 +++++++++++++++++--------
>>  drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c |  8 ++++---
>>  drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h |  7 ++++---
>>  3 files changed, 28 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
>> index 8de41e74e8f8..765379380d4b 100644
>> --- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
>> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
>> @@ -482,6 +482,21 @@ static struct edid *hdmi4_bridge_get_edid(struct drm_bridge *bridge,
>>  	return edid;
>>  }
>>  
>> +static int hdmi4_bridge_cec_init(struct drm_bridge *bridge,
>> +				 struct drm_connector *conn)
>> +{
>> +	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
>> +
>> +	return hdmi4_cec_init(hdmi->pdev, &hdmi->core, &hdmi->wp, conn);
>> +}
>> +
>> +static void hdmi4_bridge_cec_exit(struct drm_bridge *bridge)
>> +{
>> +	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
>> +
>> +	hdmi4_cec_uninit(&hdmi->core);
>> +}
>> +
>>  static const struct drm_bridge_funcs hdmi4_bridge_funcs = {
>>  	.attach = hdmi4_bridge_attach,
>>  	.mode_set = hdmi4_bridge_mode_set,
>> @@ -492,13 +507,15 @@ static const struct drm_bridge_funcs hdmi4_bridge_funcs = {
>>  	.atomic_disable = hdmi4_bridge_disable,
>>  	.hpd_notify = hdmi4_bridge_hpd_notify,
>>  	.get_edid = hdmi4_bridge_get_edid,
>> +	.cec_init = hdmi4_bridge_cec_init,
>> +	.cec_exit = hdmi4_bridge_cec_exit,
>>  };
>>  
>>  static void hdmi4_bridge_init(struct omap_hdmi *hdmi)
>>  {
>>  	hdmi->bridge.funcs = &hdmi4_bridge_funcs;
>>  	hdmi->bridge.of_node = hdmi->pdev->dev.of_node;
>> -	hdmi->bridge.ops = DRM_BRIDGE_OP_EDID;
>> +	hdmi->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_CEC;
>>  	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
>>  
>>  	drm_bridge_add(&hdmi->bridge);
>> @@ -647,14 +664,10 @@ static int hdmi4_bind(struct device *dev, struct device *master, void *data)
>>  	if (r)
>>  		goto err_runtime_put;
>>  
>> -	r = hdmi4_cec_init(hdmi->pdev, &hdmi->core, &hdmi->wp);
>> -	if (r)
>> -		goto err_pll_uninit;
> 
> I'm wondering ifwe need to delay the creation of the CEC adapter until
> the DRM connector is ready, or if we could only delay its registration ?
> Catching errors related to adapter creation early could be nice, the
> more error we have to handle at DRM bridge connector creation time, the
> more complex the error handling will be for bridge support.

I feel that that is overkill, but if you really want this, just let me know.
Splitting it up would actually make it more complex for me since I would have
to check whether to call cec_unregister_adapter or cec_delete_adapter, depending
on whether the CEC registration was successful or not.

Regards,

	Hans

> 
>> -
>>  	r = hdmi_audio_register(hdmi);
>>  	if (r) {
>>  		DSSERR("Registering HDMI audio failed\n");
>> -		goto err_cec_uninit;
>> +		goto err_pll_uninit;
>>  	}
>>  
>>  	hdmi->debugfs = dss_debugfs_create_file(dss, "hdmi", hdmi_dump_regs,
>> @@ -664,8 +677,6 @@ static int hdmi4_bind(struct device *dev, struct device *master, void *data)
>>  
>>  	return 0;
>>  
>> -err_cec_uninit:
>> -	hdmi4_cec_uninit(&hdmi->core);
>>  err_pll_uninit:
>>  	hdmi_pll_uninit(&hdmi->pll);
>>  err_runtime_put:
>> @@ -682,7 +693,6 @@ static void hdmi4_unbind(struct device *dev, struct device *master, void *data)
>>  	if (hdmi->audio_pdev)
>>  		platform_device_unregister(hdmi->audio_pdev);
>>  
>> -	hdmi4_cec_uninit(&hdmi->core);
>>  	hdmi_pll_uninit(&hdmi->pll);
>>  }
>>  
>> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c b/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c
>> index 43592c1cf081..64f5ccd0f11b 100644
>> --- a/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c
>> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c
>> @@ -335,10 +335,10 @@ void hdmi4_cec_set_phys_addr(struct hdmi_core_data *core, u16 pa)
>>  }
>>  
>>  int hdmi4_cec_init(struct platform_device *pdev, struct hdmi_core_data *core,
>> -		  struct hdmi_wp_data *wp)
>> +		   struct hdmi_wp_data *wp, struct drm_connector *conn)
>>  {
>> -	const u32 caps = CEC_CAP_TRANSMIT | CEC_CAP_LOG_ADDRS |
>> -			 CEC_CAP_PASSTHROUGH | CEC_CAP_RC;
>> +	const u32 caps = CEC_CAP_DEFAULTS | CEC_CAP_CONNECTOR_INFO;
>> +	struct cec_connector_info conn_info;
>>  	int ret;
>>  
>>  	core->adap = cec_allocate_adapter(&hdmi_cec_adap_ops, core,
>> @@ -346,6 +346,8 @@ int hdmi4_cec_init(struct platform_device *pdev, struct hdmi_core_data *core,
>>  	ret = PTR_ERR_OR_ZERO(core->adap);
>>  	if (ret < 0)
>>  		return ret;
>> +	cec_fill_conn_info_from_drm(&conn_info, conn);
>> +	cec_s_conn_info(core->adap, &conn_info);
>>  	core->wp = wp;
>>  
>>  	/* Disable clock initially, hdmi_cec_adap_enable() manages it */
>> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h b/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h
>> index 0292337c97cc..b59a54c3040e 100644
>> --- a/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h
>> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h
>> @@ -29,7 +29,7 @@ struct platform_device;
>>  void hdmi4_cec_set_phys_addr(struct hdmi_core_data *core, u16 pa);
>>  void hdmi4_cec_irq(struct hdmi_core_data *core);
>>  int hdmi4_cec_init(struct platform_device *pdev, struct hdmi_core_data *core,
>> -		  struct hdmi_wp_data *wp);
>> +		   struct hdmi_wp_data *wp, struct drm_connector *conn);
>>  void hdmi4_cec_uninit(struct hdmi_core_data *core);
>>  #else
>>  static inline void hdmi4_cec_set_phys_addr(struct hdmi_core_data *core, u16 pa)
>> @@ -41,8 +41,9 @@ static inline void hdmi4_cec_irq(struct hdmi_core_data *core)
>>  }
>>  
>>  static inline int hdmi4_cec_init(struct platform_device *pdev,
>> -				struct hdmi_core_data *core,
>> -				struct hdmi_wp_data *wp)
>> +				 struct hdmi_core_data *core,
>> +				 struct hdmi_wp_data *wp,
>> +				 struct drm_connector *conn)
>>  {
>>  	return 0;
>>  }
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
