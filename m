Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C2883FADE
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 00:10:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 810C710FF05;
	Sun, 28 Jan 2024 23:10:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www254.your-server.de (www254.your-server.de [188.40.28.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1433C10E500;
 Sun, 28 Jan 2024 18:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=windeck-gymnasium.de; s=windeck_hetzner; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:In-Reply-To:References:Subject:To:From:Message-ID:
 Date:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
 bh=pLIQI3W41b4CWYuYVFr//9ggDBCy+rm1o0L2EOl+CKg=; b=Jepu72W9RObtxs6+VaNrQPZ3L6
 5MfKQzTxj0GmqCrb//zcSZmaz8yHk5M1boKir84sW1w7P1etNv3Q211HLAhT5sbu+/WKBL+bpGS0L
 6O1fxll8k7C7mRmr0KqsXVNOWnZmtQX+Nl9UGZEldMzazL7ElC9xYVtbdpCrhd/OSLNthMDdrwoqi
 jwA8NBNasDhqFEDO7mKBPQx70P+j0A0QAkRbIzXImkIQsGVSG/Nczf4myipHTaNsAUyrNNKO9viMa
 ofSitOP910nKSBdfx6yDh9R1Lm5XwUwOwx32J/z86Ft7S7LZi4YeB7FDvzLTtNBJ3GhWalePhmC2Y
 6SxBdmwg==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
 by www254.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <administrator@windeck-gymnasium.de>)
 id 1rU9xx-000Lgb-JV; Sun, 28 Jan 2024 19:33:13 +0100
Received: from [192.168.0.34] (helo=webmail.your-server.de)
 by sslproxy04.your-server.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-CHACHA20-POLY1305:256) (Exim 4.92)
 (envelope-from <administrator@windeck-gymnasium.de>)
 id 1rU9xw-000LyX-VK; Sun, 28 Jan 2024 19:33:12 +0100
Received: from p200300C227008B00aBB733Fa4DB1a46e.dip0.t-ipconnect.de
 (p200300C227008B00aBB733Fa4DB1a46e.dip0.t-ipconnect.de
 [2003:c2:2700:8b00:abb7:33fa:4db1:a46e]) by webmail.your-server.de (Horde
 Framework) with HTTPS; Sun, 28 Jan 2024 19:33:12 +0100
Date: Sun, 28 Jan 2024 19:33:12 +0100
Message-ID: <20240128193312.Horde.LVLLBfWU20JOoAAZklOkEat@webmail.your-server.de>
From: administrator@windeck-gymnasium.de
To: amd-gfx@lists.freedesktop.org, Hamza Mahfooz <hamza.mahfooz@amd.com>
Subject: Re: [PATCH] drm/amd/display: add panel_power_savings sysfs entry to
 eDP connectors
References: <20240126222300.119292-1-hamza.mahfooz@amd.com>
 <e6bedb02-a3b4-4351-b41e-6f635a77c0ef@windeck-gymnasium.de>
In-Reply-To: <e6bedb02-a3b4-4351-b41e-6f635a77c0ef@windeck-gymnasium.de>
User-Agent: Horde Application Framework 5
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: administrator@windeck-gymnasium.de
X-Virus-Scanned: Clear (ClamAV 0.103.10/27168/Sun Jan 28 10:37:47 2024)
X-Mailman-Approved-At: Sun, 28 Jan 2024 23:10:36 +0000
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

I've applied the patch to 6.7.2. The device then shows up under:

/sys/devices/pci0000:00/0000:00:08.1/0000:c1:00.0/drm/card1/card1-eDP-1/amdgpu/panel_power_savings
(on Framework Laptop 13 amd 7840U with 780M).

After a few tests i can say that at least in my system it’s not  
working. Setting a value between 0 and 4 in
/sys/.../panel_power_savings changes nothing in the panel behavior.  
There are no errors in kernel log.

Setting an abmlevel via kernel option still works as intended.

The issue can be resolved if one set the panel_power_savings value and  
after that change the display resolution to a lower value and than  
switch back. For example this script works:

xterm -e 'echo 0 | sudo tee  
/sys/devices/pci0000:00/0000:00:08.1/0000:c1:00.0/drm/card1/card1-eDP-1/amdgpu/panel_power_savings'
gnome-randr modify -m 1920x1200@59.999 eDP-1 && gnome-randr modify -m  
2256x1504@59.999 eDP-1

> Am 26.01.24 um 23:22 schrieb Hamza Mahfooz:
> We want programs besides the compositor to be able to enable or disable
> panel power saving features. However, since they are currently only
> configurable through DRM properties, that isn't possible. So, to remedy
> that issue introduce a new "panel_power_savings" sysfs attribute.
>
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
> .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 59 +++++++++++++++++++
> 1 file changed, 59 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index cd98b3565178..b3fcd833015d 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6534,6 +6534,58 @@  
> amdgpu_dm_connector_atomic_duplicate_state(struct drm_connector  
> *connector)
> return &new_state->base;
> }
> +static ssize_t panel_power_savings_show(struct device *device,
> + struct device_attribute *attr,
> + char *buf)
> +{
> + struct drm_connector *connector = dev_get_drvdata(device);
> + struct drm_device *dev = connector->dev;
> + ssize_t val;
> +
> + drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
> + val = to_dm_connector_state(connector->state)->abm_level;
> + drm_modeset_unlock(&dev->mode_config.connection_mutex);
> +
> + return sysfs_emit(buf, "%lu\n", val);
> +}
> +
> +static ssize_t panel_power_savings_store(struct device *device,
> + struct device_attribute *attr,
> + const char *buf, size_t count)
> +{
> + struct drm_connector *connector = dev_get_drvdata(device);
> + struct drm_device *dev = connector->dev;
> + long val;
> + int ret;
> +
> + ret = kstrtol(buf, 0, &val);
> +
> + if (ret)
> + return ret;
> +
> + if (val < 0 || val > 4)
> + return -EINVAL;
> +
> + drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
> + to_dm_connector_state(connector->state)->abm_level = val ?:
> + ABM_LEVEL_IMMEDIATE_DISABLE;
> + drm_modeset_unlock(&dev->mode_config.connection_mutex);
> +
> + return count;
> +}
> +
> +static DEVICE_ATTR_RW(panel_power_savings);
> +
> +static struct attribute *amdgpu_attrs[] = {
> + &dev_attr_panel_power_savings.attr,
> + NULL
> +};
> +
> +static const struct attribute_group amdgpu_group = {
> + .name = "amdgpu",
> + .attrs = amdgpu_attrs
> +};
> +
> static int
> amdgpu_dm_connector_late_register(struct drm_connector *connector)
> {
> @@ -6541,6 +6593,13 @@ amdgpu_dm_connector_late_register(struct  
> drm_connector *connector)
> to_amdgpu_dm_connector(connector);
> int r;
> + if (connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
> + r = sysfs_create_group(&connector->kdev->kobj,
> + &amdgpu_group);
> + if (r)
> + return r;
> + }
> +
> amdgpu_dm_register_backlight_device(amdgpu_dm_connector);
> if ((connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) ||



