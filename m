Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A0C7283D0
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 17:37:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C3010E0B8;
	Thu,  8 Jun 2023 15:37:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 688E410E0B8
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 15:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686238629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dnOFROsF7B7sQwXM8eGHqjnV3KCLoennVYcraYtkdpA=;
 b=c/mSsndr+vfoLSRKc5/sZxm1j01t87LYbbHt5C/Lgf5iV8WRj5a9XwU+HTURinN28cgTIx
 BsQLc2C3aLDdHaUs/U0OF97LnMTj9EcoYxUtmTa5AVb1RUp7AY1dw0cPgnuejNoRkY+9cJ
 ZuTpFWtK3veoLoG2fEC9Ci9a+pSPWL8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-dWYUHhdGMQGx6oW_hdGnxQ-1; Thu, 08 Jun 2023 11:37:05 -0400
X-MC-Unique: dWYUHhdGMQGx6oW_hdGnxQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09B34282CCAA;
 Thu,  8 Jun 2023 15:37:04 +0000 (UTC)
Received: from mail.corp.redhat.com (unknown [10.45.224.77])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6216B492B0A;
 Thu,  8 Jun 2023 15:36:59 +0000 (UTC)
Date: Thu, 8 Jun 2023 17:36:56 +0200
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 08/10] HID: i2c-hid: Support being a panel follower
Message-ID: <y3l4x3kv7jgog3miexati5wbveaynnryzqvj6sc4ul6625f2if@w7nqgojfavfw>
References: <20230607215224.2067679-1-dianders@chromium.org>
 <20230607144931.v2.8.Ib1a98309c455cd7e26b931c69993d4fba33bbe15@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607144931.v2.8.Ib1a98309c455cd7e26b931c69993d4fba33bbe15@changeid>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
Cc: dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Frank Rowand <frowand.list@gmail.com>,
 linux-input@vger.kernel.org, hsinyi@google.com, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 linux-arm-msm@vger.kernel.org, yangcong5@huaqin.corp-partner.google.com,
 Jiri Kosina <jikos@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Jun 07 2023, Douglas Anderson wrote:
> 
> As talked about in the patch ("drm/panel: Add a way for other devices
> to follow panel state"), we really want to keep the power states of a
> touchscreen and the panel it's attached to in sync with each other. In
> that spirit, add support to i2c-hid to be a panel follower. This will
> let the i2c-hid driver get informed when the panel is powered on and
> off. From there we can match the i2c-hid device's power state to that
> of the panel.
> 
> NOTE: this patch specifically _doesn't_ use pm_runtime to keep track
> of / manage the power state of the i2c-hid device, even though my
> first instinct said that would be the way to go. Specific problems
> with using pm_runtime():
> * The initial power up couldn't happen in a runtime resume function
>   since it create sub-devices and, apparently, that's not good to do
>   in your resume function.
> * Managing our power state with pm_runtime meant fighting to make the
>   right thing happen at system suspend to prevent the system from
>   trying to resume us only to suspend us again. While this might be
>   able to be solved, it added complexity.
> Overall the code without pm_runtime() ended up being smaller and
> easier to understand.

Generally speaking, I'm not that happy when we need to coordinate with
other subsystems for bringing up resources...

Anyway, a remark inlined (at least):

> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v2:
> - i2c_hid_core_panel_prepared() and ..._unpreparing() are now static.
> 
>  drivers/hid/i2c-hid/i2c-hid-core.c | 82 +++++++++++++++++++++++++++++-
>  1 file changed, 81 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> index fa8a1ca43d7f..368db3ae612f 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -38,6 +38,8 @@
>  #include <linux/mutex.h>
>  #include <asm/unaligned.h>
>  
> +#include <drm/drm_panel.h>
> +
>  #include "../hid-ids.h"
>  #include "i2c-hid.h"
>  
> @@ -107,6 +109,8 @@ struct i2c_hid {
>  	struct mutex		reset_lock;
>  
>  	struct i2chid_ops	*ops;
> +	struct drm_panel_follower panel_follower;
> +	bool			is_panel_follower;
>  };
>  
>  static const struct i2c_hid_quirks {
> @@ -1058,6 +1062,34 @@ static int i2c_hid_core_initial_power_up(struct i2c_hid *ihid)
>  	return ret;
>  }
>  
> +static int i2c_hid_core_panel_prepared(struct drm_panel_follower *follower)
> +{
> +	struct i2c_hid *ihid = container_of(follower, struct i2c_hid, panel_follower);
> +	struct hid_device *hid = ihid->hid;
> +
> +	/*
> +	 * hid->version is set on the first power up. If it's still zero then
> +	 * this is the first power on so we should perform initial power up
> +	 * steps.
> +	 */
> +	if (!hid->version)
> +		return i2c_hid_core_initial_power_up(ihid);
> +
> +	return i2c_hid_core_resume(ihid);
> +}
> +
> +static int i2c_hid_core_panel_unpreparing(struct drm_panel_follower *follower)
> +{
> +	struct i2c_hid *ihid = container_of(follower, struct i2c_hid, panel_follower);
> +
> +	return i2c_hid_core_suspend(ihid);
> +}
> +
> +static const struct drm_panel_follower_funcs i2c_hid_core_panel_follower_funcs = {
> +	.panel_prepared = i2c_hid_core_panel_prepared,
> +	.panel_unpreparing = i2c_hid_core_panel_unpreparing,
> +};

Can we make that above block at least behind a Kconfig?

i2c-hid is often used for touchpads, and the notion of drm panel has
nothing to do with them. So I'd be more confident if we could disable
that code if not required.

Actually, I'd be even more happier if it were in a different compilation
unit. Not necessary a different module, but at least a different file.

Cheers,
Benjamin

> +
>  int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
>  		       u16 hid_descriptor_address, u32 quirks)
>  {
> @@ -1119,6 +1151,41 @@ int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
>  	hid->bus = BUS_I2C;
>  	hid->initial_quirks = quirks;
>  
> +	/*
> +	 * See if we're following a panel. If drm_panel_add_follower()
> +	 * returns no error then we are.
> +	 */
> +	ihid->panel_follower.funcs = &i2c_hid_core_panel_follower_funcs;
> +	ret = drm_panel_add_follower(&client->dev, &ihid->panel_follower);
> +	if (!ret) {
> +		/* We're a follower. That means we'll power things up later. */
> +		ihid->is_panel_follower = true;
> +
> +		/*
> +		 * If we're not in control of our own power up/power down then
> +		 * we can't do the logic to manage wakeups. Give a warning if
> +		 * a user thought that was possible then force the capability
> +		 * off.
> +		 */
> +		if (device_can_wakeup(&client->dev)) {
> +			dev_warn(&client->dev, "Can't wakeup if following panel\n");
> +			device_set_wakeup_capable(&client->dev, false);
> +		}
> +
> +		return 0;
> +	}
> +
> +	/*
> +	 * -ENODEV means that we're not following a panel, so any other error
> +	 * is a real problem (like -EPROBE_DEFER, -ENOMEM, ...).
> +	 */
> +	if (ret != -ENODEV)
> +		goto err_mem_free;
> +
> +	/*
> +	 * We're not following a panel. That's fine and means that we
> +	 * can power up right away.
> +	 */
>  	ret = i2c_hid_core_initial_power_up(ihid);
>  	if (ret)
>  		goto err_mem_free;
> @@ -1143,7 +1210,14 @@ void i2c_hid_core_remove(struct i2c_client *client)
>  	struct i2c_hid *ihid = i2c_get_clientdata(client);
>  	struct hid_device *hid;
>  
> -	i2c_hid_core_power_down(ihid);
> +	/*
> +	 * If we're a follower, the act of unfollowing will cause us to be
> +	 * powered down. Otherwise we need to manually do it.
> +	 */
> +	if (ihid->is_panel_follower)
> +		drm_panel_remove_follower(&ihid->panel_follower);
> +	else
> +		i2c_hid_core_power_down(ihid);
>  
>  	hid = ihid->hid;
>  	hid_destroy_device(hid);
> @@ -1171,6 +1245,9 @@ static int i2c_hid_core_pm_suspend(struct device *dev)
>  	struct i2c_client *client = to_i2c_client(dev);
>  	struct i2c_hid *ihid = i2c_get_clientdata(client);
>  
> +	if (ihid->is_panel_follower)
> +		return 0;
> +
>  	return i2c_hid_core_suspend(ihid);
>  }
>  
> @@ -1179,6 +1256,9 @@ static int i2c_hid_core_pm_resume(struct device *dev)
>  	struct i2c_client *client = to_i2c_client(dev);
>  	struct i2c_hid *ihid = i2c_get_clientdata(client);
>  
> +	if (ihid->is_panel_follower)
> +		return 0;
> +
>  	return i2c_hid_core_resume(ihid);
>  }
>  
> -- 
> 2.41.0.162.gfafddb0af9-goog
> 

