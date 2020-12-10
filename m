Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 329E62D54A4
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 08:34:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE2B589C69;
	Thu, 10 Dec 2020 07:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAEA8897CD
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 07:34:36 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BA7YKLI081904;
 Thu, 10 Dec 2020 01:34:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1607585660;
 bh=4pPRU3Nmx4Nr9OtUB9U1KLuDZZOLhKF8C+S/ahGLZGc=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=da0tFDUVvmompMLN0RlgRbLxOnaen9x3i7dxoBMdlRDolZLc3o4KSPvJDuLZoeVCD
 5psuUb4OYrLtCJ/O2/oAyzDz2bRiiAYa1bZ7202wPkeDdP7klaFYhcubBV1L4It5Fu
 /bj1zMsgHx9MH75wzYDEHYkclpj+PdR9dL5crDNw=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BA7YKJ2002681
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Dec 2020 01:34:20 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 10
 Dec 2020 01:34:20 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 10 Dec 2020 01:34:20 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BA7YIm5015430;
 Thu, 10 Dec 2020 01:34:18 -0600
Subject: Re: [PATCH v5 29/29] drm/omap: dsi: allow DSI commands to be sent
 early
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-30-tomi.valkeinen@ti.com>
 <X8+gXWBwLItZA7gA@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <c5139c54-78c1-fe16-7f50-c60efd1f447b@ti.com>
Date: Thu, 10 Dec 2020 09:34:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X8+gXWBwLItZA7gA@pendragon.ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Sekhar Nori <nsekhar@ti.com>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/12/2020 17:48, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Tue, Dec 08, 2020 at 02:28:55PM +0200, Tomi Valkeinen wrote:
>> Panel drivers can send DSI commands in panel's prepare(), which happens
>> before the bridge's enable() is called. The OMAP DSI driver currently
>> only sets up the DSI interface at bridge's enable(), so prepare() cannot
>> be used to send DSI commands.
>>
>> This patch fixes the issue by making it possible to enable the DSI
>> interface any time a command is about to be sent. Disabling the
>> interface is be done via delayed work.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> ---
>>  drivers/gpu/drm/omapdrm/dss/dsi.c | 49 +++++++++++++++++++++++++++----
>>  drivers/gpu/drm/omapdrm/dss/dsi.h |  3 ++
>>  2 files changed, 47 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
>> index 53a64bc91867..34f665aa9a59 100644
>> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
>> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
>> @@ -3503,6 +3503,9 @@ static void dsi_enable(struct dsi_data *dsi)
>>  
>>  	WARN_ON(!dsi_bus_is_locked(dsi));
>>  
>> +	if (WARN_ON(dsi->iface_enabled))
>> +		return;
>> +
>>  	mutex_lock(&dsi->lock);
>>  
>>  	r = dsi_runtime_get(dsi);
>> @@ -3515,6 +3518,8 @@ static void dsi_enable(struct dsi_data *dsi)
>>  	if (r)
>>  		goto err_init_dsi;
>>  
>> +	dsi->iface_enabled = true;
>> +
>>  	mutex_unlock(&dsi->lock);
>>  
>>  	return;
>> @@ -3530,6 +3535,9 @@ static void dsi_disable(struct dsi_data *dsi)
>>  {
>>  	WARN_ON(!dsi_bus_is_locked(dsi));
>>  
>> +	if (WARN_ON(!dsi->iface_enabled))
>> +		return;
>> +
>>  	mutex_lock(&dsi->lock);
>>  
>>  	dsi_sync_vc(dsi, 0);
>> @@ -3541,6 +3549,8 @@ static void dsi_disable(struct dsi_data *dsi)
>>  
>>  	dsi_runtime_put(dsi);
>>  
>> +	dsi->iface_enabled = false;
>> +
>>  	mutex_unlock(&dsi->lock);
>>  }
>>  
>> @@ -4229,10 +4239,12 @@ static ssize_t omap_dsi_host_transfer(struct mipi_dsi_host *host,
>>  
>>  	dsi_bus_lock(dsi);
>>  
>> -	if (dsi->video_enabled)
>> -		r = _omap_dsi_host_transfer(dsi, vc, msg);
>> -	else
>> -		r = -EIO;
>> +	if (!dsi->iface_enabled) {
>> +		dsi_enable(dsi);
>> +		schedule_delayed_work(&dsi->dsi_disable_work, msecs_to_jiffies(2000));
>> +	}
>> +
>> +	r = _omap_dsi_host_transfer(dsi, vc, msg);
>>  
>>  	dsi_bus_unlock(dsi);
>>  
>> @@ -4397,6 +4409,14 @@ static int omap_dsi_host_detach(struct mipi_dsi_host *host,
>>  	if (WARN_ON(dsi->dsidev != client))
>>  		return -EINVAL;
>>  
>> +	cancel_delayed_work_sync(&dsi->dsi_disable_work);
>> +
>> +	if (dsi->iface_enabled) {
>> +		dsi_bus_lock(dsi);
>> +		dsi_disable(dsi);
>> +		dsi_bus_unlock(dsi);
>> +	}
>> +
>>  	omap_dsi_unregister_te_irq(dsi);
>>  	dsi->dsidev = NULL;
>>  	return 0;
>> @@ -4632,9 +4652,12 @@ static void dsi_bridge_enable(struct drm_bridge *bridge)
>>  	struct dsi_data *dsi = drm_bridge_to_dsi(bridge);
>>  	struct omap_dss_device *dssdev = &dsi->output;
>>  
>> +	cancel_delayed_work_sync(&dsi->dsi_disable_work);
>> +
> 
> Is there a risk of a race condition if omap_dsi_host_transfer() is
> called right here, before locking the bus ? Or is there a guarantee that
> the two functions can't be executed concurrently ? Same for
> dsi_bridge_disable() below.

Yes, there's a possibility for a race, if the panel driver does dsi command transactions via, say, a
timer, and doesn't take DRM locks that are shared with bridge-enable/disable/detach.

For bridge-enable, it shouldn't matter: If the disable callback is called just before bridge_enable
takes the dsi_bus_lock, no problem, bridge_enable just enables the interface again. If the callback
is ran just after bridge_enable's dsi_bus_unlock, no problem, dsi->video_enabled == true so the
callback does nothing.

Similarly for bridge-disable, the callback won't do anything if video_enabled == true, and after
bridge-disable has turned the video and the interface off, there's nothing to do for the callback.

The detach is a bit more unclear. Is the panel driver allowed to do "stuff" with bridges while
bridge detach is going on? If yes, it's probably broken. We should move the bus_locks to cover the
whole if() so that dsi->iface_enabled is inside the locks. With that change the delayed disable
itself should work fine.

But we don't have anything stopping omap_dsi_host_transfer being called after the whole bridge has
been detached (or called before attach). So, if we have a guarantee that the panels won't be doing
dsi transfers before/during bridge attach or after/during bridge detach, we have no issue. If we
don't have such a guarantee, it's broken.

I'll try to figure out if there's such a guarantee, but maybe it's safer to add a flag to indicate
if the bridge is available, and check that during omap_dsi_host_transfer.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
