Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B85E7DFFE4
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 10:05:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 283A810E4F3;
	Fri,  3 Nov 2023 09:05:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A6B10E4F3
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Nov 2023 09:05:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 7B599B81E93;
 Fri,  3 Nov 2023 09:05:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3347C433C7;
 Fri,  3 Nov 2023 09:05:20 +0000 (UTC)
Message-ID: <806f2ad3-c80b-41e5-9388-f1af7bace8e3@xs4all.nl>
Date: Fri, 3 Nov 2023 10:05:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 12/37] drm/connector: hdmi: Create Infoframe
 DebugFS entries
Content-Language: en-US, nl
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>,
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
References: <20231031-kms-hdmi-connector-state-v3-0-328b0fae43a7@kernel.org>
 <20231031-kms-hdmi-connector-state-v3-12-328b0fae43a7@kernel.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20231031-kms-hdmi-connector-state-v3-12-328b0fae43a7@kernel.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

Thank you for posting v3, this time it runs fine on my RPi 4, thank you for
fixing that.

I'll start working on a conformity checker for this.

I have a few remarks:

On 31/10/2023 17:48, Maxime Ripard wrote:
> There has been some discussions recently about the infoframes sent by
> drivers and if they were properly generated.
> 
> In parallel, there's been some interest in creating an infoframe-decode
> tool similar to edid-decode.
> 
> Both would be much easier if we were to expose the infoframes programmed
> in the hardware. It won't be perfect since we have no guarantee that
> it's actually what goes through the wire, but it's the best we can do.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_debugfs.c | 110 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 110 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 2de43ff3ce0a..3c65b1d3f926 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -538,6 +538,114 @@ static const struct file_operations drm_connector_fops = {
>  	.write = connector_write
>  };
>  
> +struct debugfs_wrapper {
> +	struct drm_connector *connector;
> +	struct drm_connector_hdmi_infoframe *frame;
> +};
> +
> +#define HDMI_MAX_INFOFRAME_SIZE		29
> +
> +static ssize_t
> +infoframe_read(struct file *filp, char __user *ubuf, size_t count, loff_t *ppos)
> +{
> +	const struct debugfs_wrapper *wrapper = filp->private_data;
> +	struct drm_connector *connector = wrapper->connector;
> +	struct drm_connector_hdmi_infoframe *infoframe = wrapper->frame;
> +	union hdmi_infoframe *frame = &infoframe->data;
> +	u8 buf[HDMI_MAX_INFOFRAME_SIZE];
> +	ssize_t len = 0;
> +
> +	mutex_lock(&connector->hdmi.infoframes.lock);
> +
> +	if (!infoframe->set)
> +		goto out;
> +
> +	len = hdmi_infoframe_pack(frame, buf, sizeof(buf));
> +	if (len < 0)
> +		goto out;
> +
> +	len = simple_read_from_buffer(ubuf, count, ppos, buf, len);
> +
> +out:
> +	mutex_unlock(&connector->hdmi.infoframes.lock);
> +	return len;
> +}
> +
> +static const struct file_operations infoframe_fops = {
> +	.owner   = THIS_MODULE,
> +	.open    = simple_open,
> +	.read    = infoframe_read,
> +};
> +
> +static int create_hdmi_infoframe_file(struct drm_connector *connector,
> +				      struct dentry *parent,
> +				      const char *filename,
> +				      struct drm_connector_hdmi_infoframe *frame)
> +{
> +	struct drm_device *dev = connector->dev;
> +	struct debugfs_wrapper *wrapper;
> +	struct dentry *file;
> +
> +	wrapper = drmm_kzalloc(dev, sizeof(*wrapper), GFP_KERNEL);
> +	if (!wrapper)
> +		return -ENOMEM;
> +
> +	wrapper->connector = connector;
> +	wrapper->frame = frame;
> +
> +	file = debugfs_create_file(filename, 0400, parent, wrapper, &infoframe_fops);
> +	if (IS_ERR(file))
> +		return PTR_ERR(file);
> +
> +	return 0;
> +}
> +
> +#define CREATE_HDMI_INFOFRAME_FILE(c, p, i)		\
> +	create_hdmi_infoframe_file(c, p, #i, &(c)->hdmi.infoframes.i)
> +
> +static int create_hdmi_infoframe_files(struct drm_connector *connector,
> +				       struct dentry *parent)
> +{
> +	int ret;
> +
> +	ret = CREATE_HDMI_INFOFRAME_FILE(connector, parent, audio);
> +	if (ret)
> +		return ret;
> +
> +	ret = CREATE_HDMI_INFOFRAME_FILE(connector, parent, avi);
> +	if (ret)
> +		return ret;
> +
> +	ret = CREATE_HDMI_INFOFRAME_FILE(connector, parent, drm);

Hmm, I had to look into the code to figure out that 'drm' stands for
Dynamic Range and Mastering InfoFrame. While entirely correct, it is
also very confusing in the context of the 'drm' subsystem.

I am not quite certain what the best approach is here.

Internally in the drm code it is talking about 'hdr' or 'hdr metadata',
but that's a bit confusing as well since there is also an HDR Dynamic
Metadata Extended InfoFrame defined in CTA-861, even though support for
that is not (yet) implemented in drm.

At minimum there should be a comment in the code explaining what drm
stands for in this context.

One option to consider is renaming this file to hdr_drm, thus indicating
that this is HDR related.

> +	if (ret)
> +		return ret;
> +
> +	ret = CREATE_HDMI_INFOFRAME_FILE(connector, parent, spd);
> +	if (ret)
> +		return ret;
> +
> +	ret = CREATE_HDMI_INFOFRAME_FILE(connector, parent, vendor);

There may be multiple vendor specific InfoFrames in the future, so how
would that be handled? Perhaps add a comment here that currently only one
vendor specific InfoFrame is supported, but suggest how to handle multiple
VSIFs in the future.

What would actually be nice (although probably not that easy to fix) is if
the name of the file would be "vendor-XXXXXX' where 'XXXXXX' is the IEEE OUI
number.

Regards,

	Hans

> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static void hdmi_debugfs_add(struct drm_connector *connector)
> +{
> +	struct dentry *dir;
> +
> +	if (!(connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
> +	      connector->connector_type == DRM_MODE_CONNECTOR_HDMIB))
> +		return;
> +
> +	dir = debugfs_create_dir("infoframes", connector->debugfs_entry);
> +	if (IS_ERR(dir))
> +		return;
> +
> +	create_hdmi_infoframe_files(connector, dir);
> +}
> +
>  void drm_debugfs_connector_add(struct drm_connector *connector)
>  {
>  	struct drm_minor *minor = connector->dev->primary;
> @@ -565,6 +673,8 @@ void drm_debugfs_connector_add(struct drm_connector *connector)
>  	debugfs_create_file("output_bpc", 0444, root, connector,
>  			    &output_bpc_fops);
>  
> +	hdmi_debugfs_add(connector);
> +
>  	if (connector->funcs->debugfs_init)
>  		connector->funcs->debugfs_init(connector, root);
>  }
> 

