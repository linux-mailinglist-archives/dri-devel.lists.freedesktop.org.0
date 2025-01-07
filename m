Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DB0A0487A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 18:39:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76DF10E75B;
	Tue,  7 Jan 2025 17:39:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FzLCWCRG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28DFB10E75B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 17:39:54 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5401c68b89eso28408e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 09:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736271532; x=1736876332; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fQlXEI6MURNtejwo9xXMQKlzsJbPQq36yLYVLoDjgqc=;
 b=FzLCWCRGoS2sSBqkQZmmxJMvg2l7NYaTLI449E6QjgCyEbR+OwzgG0PZWx0Ovme2bn
 CmfdaqLmAVVxcDFtKVpUJKpEcBgUQW1gnvFDNjRBawRnM12zkzTmPhWDolyow0QTWmlO
 2KY6Wd+c29ndtsjV8ZiUFwFb/R/GivfEQ6FL/GyMnWsUtjgBQUTkEQysgbG1P64tFmLl
 Da70FUx3+GsrnjMX+Dxcyz6ggKf82Fk30DmAAweuXm1irnt/gFjofrCoHcF3Y8M4YUZH
 6nlHqmLVOu+LJfoLB/ZG76+tdtkTPMaJjtNqDalayt5dgkj+5DSV4O5GdillrWWRWEmd
 Eiwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736271532; x=1736876332;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fQlXEI6MURNtejwo9xXMQKlzsJbPQq36yLYVLoDjgqc=;
 b=V3s4MzzalP0T+IxT2cngJqu9H/9iC1cjAq1zySfAhSOGRDNutx8iFbadtsGVedb4tT
 YHq1efb8rVeYwL4DWPOG2XFRAWbRg9UkFKFWkEHDjMDREKr2euJDg0fkYzTphp3/G6Cd
 5qX6AL11W1LP1I642EmVZLa144OXRns+ncY65441QxqLa9vIDtDE0OuuayZALV4yy37P
 IQWTuo7iV0WnRh1uyBn6CWqUOX05B5EjssiOxPQKFix8CQqiDs1G1TDOClUuU0A8fiIv
 VgA/Y6zcBzVXrJ9rDmQTkTxGniZJBLcQehcV8krWSmzLk2odwQ08v6GFuhBHd6Z2h6vb
 V24w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2ObaClh4nkSIpZTpoTQFQRrOhyqwjucjuU69GgXu2JklB69zdGv6Pz3X6bpZ4BtacIJZwsFbB83o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yww6bzIdq5ZgisnXxYc/29JldhbKSvmViCmjxk4vS4iHJPpF4pe
 axYJn6niroV3i9c7UAnbDqpl8yiaUoHqHW0hpwzwdGISFCAMTBiJgHqaqQLazCmKX3m72Xfm79O
 F
X-Gm-Gg: ASbGnctp/lrh8N4AYI8UxSWbSyr5qwvXkOnP8Sqxob5Lf065XA5+PJj5ChBbOA+Wj1/
 UYwB3T5irZqDPmD+Ul9Oubh+0Gqk6nmiu7/uJ5PInTHugleub+6q2qs0dyRP/jE0iyVkuKKUfq6
 kZYIFzPE4mLwazkF+sfgRLGVKAVVKpoufqQYyCbe0QE7HZEdf+ByHi1FslLvhAwB6CJja3XBw9J
 AsNcKPyemGAfuDNwJP7+w/vNIVfGn/GXK1OzXaoTK71K1DM67Ys+fdX48llc3F5PPSXX3JESRwL
 oMDLI8vPz/0JaomxMGqZwPQ1BAo/cSGnjgLH
X-Google-Smtp-Source: AGHT+IFjHyOoeTGIuRcd5837wETFO/YUW4EJItn++XwvTL1J86+RSYhyMa3GZ6BV9FKFZ+YBjD1NDA==
X-Received: by 2002:a05:6512:3a90:b0:541:1c5f:bf86 with SMTP id
 2adb3069b0e04-54283dea8bcmr1549e87.18.1736271532511; 
 Tue, 07 Jan 2025 09:38:52 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223832a2dsm5345294e87.261.2025.01.07.09.38.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 09:38:51 -0800 (PST)
Date: Tue, 7 Jan 2025 19:38:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC/RFT 5/9] drm/vc4: hdmi: drop separate CEC
 unregistration
Message-ID: <fvpmsdf25dhcpwgfabj4s5xj6thewxr5xywqq6diejyieuqo3n@hidkidjpgzrp>
References: <20241225-drm-hdmi-connector-cec-v1-0-b80380c67221@linaro.org>
 <20241225-drm-hdmi-connector-cec-v1-5-b80380c67221@linaro.org>
 <20250107-outstanding-tangerine-jackdaw-1e2438@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107-outstanding-tangerine-jackdaw-1e2438@houat>
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

On Tue, Jan 07, 2025 at 03:36:20PM +0100, Maxime Ripard wrote:
> On Wed, Dec 25, 2024 at 01:10:13AM +0200, Dmitry Baryshkov wrote:
> > CEC adapter functions are protected by drm_dev_enter() / _exit(), so it
> > is safe to keep CEC registered until DRM device is being torn down. Drop
> > custom CEC unsregistration code and rely on the DRM core to unregister
> > CEC adapter.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/vc4/vc4_hdmi.c | 53 ++++++------------------------------------
> >  1 file changed, 7 insertions(+), 46 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > index 3086c2ad3bb2e8fafdc1f37ba985aa5785d49f9a..7b39000369e50f5368384575aa81919df5a7133c 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -2752,13 +2752,6 @@ static const struct cec_adap_ops vc4_hdmi_cec_adap_ops = {
> >  	.adap_transmit = vc4_hdmi_cec_adap_transmit,
> >  };
> >  
> > -static void vc4_hdmi_cec_release(void *ptr)
> > -{
> > -	struct drm_connector *connector = ptr;
> > -
> > -	drm_connector_cec_unregister(connector);
> > -}
> > -
> >  static int vc4_hdmi_cec_init(struct drm_connector *connector)
> >  {
> >  	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
> > @@ -2796,51 +2789,19 @@ static int vc4_hdmi_cec_register(struct vc4_hdmi *vc4_hdmi)
> >  {
> >  	struct platform_device *pdev = vc4_hdmi->pdev;
> >  	struct device *dev = &pdev->dev;
> > -	int ret;
> >  
> >  	if (!of_property_present(dev->of_node, "interrupts")) {
> >  		dev_warn(dev, "'interrupts' DT property is missing, no CEC\n");
> >  		return 0;
> >  	}
> >  
> > -	ret = drm_connector_hdmi_cec_adapter_register(&vc4_hdmi->connector,
> > -						      &vc4_hdmi_cec_adap_ops,
> > -						      vc4_hdmi->variant->card_name,
> > -						      1,
> > -						      vc4_hdmi_cec_init,
> > -						      NULL,
> > -						      &pdev->dev);
> > -	if (ret < 0)
> > -		return ret;
> > -
> > -	/*
> > -	 * NOTE: Strictly speaking, we should probably use a DRM-managed
> > -	 * registration there to avoid removing the CEC adapter by the
> > -	 * time the DRM driver doesn't have any user anymore.
> > -	 *
> > -	 * However, the CEC framework already cleans up the CEC adapter
> > -	 * only when the last user has closed its file descriptor, so we
> > -	 * don't need to handle it in DRM.
> > -	 *
> > -	 * By the time the device-managed hook is executed, we will give
> > -	 * up our reference to the CEC adapter and therefore don't
> > -	 * really care when it's actually freed.
> > -	 *
> > -	 * There's still a problematic sequence: if we unregister our
> > -	 * CEC adapter, but the userspace keeps a handle on the CEC
> > -	 * adapter but not the DRM device for some reason. In such a
> > -	 * case, our vc4_hdmi structure will be freed, but the
> > -	 * cec_adapter structure will have a dangling pointer to what
> > -	 * used to be our HDMI controller. If we get a CEC call at that
> > -	 * moment, we could end up with a use-after-free. Fortunately,
> > -	 * the CEC framework already handles this too, by calling
> > -	 * cec_is_registered() in cec_ioctl() and cec_poll().
> > -	 */
> 
> I'd really like to keep that comment, somewhere.

Ack, I will try to rephrase it so that it still fits the changed source.

-- 
With best wishes
Dmitry
