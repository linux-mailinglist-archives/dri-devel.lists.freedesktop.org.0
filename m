Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E896B1AAB49
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 17:05:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262166EA0A;
	Wed, 15 Apr 2020 15:05:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CCAC6EA0A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 15:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586963120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DGPe2yu1Cz0ss6JPc0CNTd19aDg92qxzZOlOLfEgz9I=;
 b=K9O9GdxGFFTqJrHzlW4jYNfeIUbcMaiuFklpAK6KZHdfDPYVZS4pudUCVpu2f67jgK5L4t
 svzO26viaA1k6F5QXfP8ZTAOo3L44wUaUmi4QTzrVS05C7MAD95V1imY6NGT48VOfNs7OA
 xxuZXwzBC6F8nf8zV+NL12zoP/gx6S0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-fCtusrUrPL-o7sk48cjLEA-1; Wed, 15 Apr 2020 11:05:17 -0400
X-MC-Unique: fCtusrUrPL-o7sk48cjLEA-1
Received: by mail-wm1-f70.google.com with SMTP id o26so5077643wmh.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 08:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DGPe2yu1Cz0ss6JPc0CNTd19aDg92qxzZOlOLfEgz9I=;
 b=TYEES7Kr8xu3Mtp05/ltVH8W8dk0CtskPhJNJae1qklSaw42x05H8IxYNzarpRkZUm
 Fvy7t0jONbju9vmgfJgrI23OIa93RQ7ok0NZmCs7qdPfawOnBFtaR0Rv8vx01INuDIiD
 YohEiMFNKg3zY5+b8odV8RUZlwtnL8QwOIwHrjPLQHqKEdySXa9S/qER2tLOI/HduIuF
 cK1gr401K7Cpb6EF9QxlTlpgaP35ilfjRczWg80DJFJJmAf5O8idnCcMqSxCsPAt4MpZ
 vNq8MZrz+M4WtS9kRdKoD3YEFp8Udb2v1hAQCGl3h7L1GrBIHirlNfKkYJVY5Fy6bXOA
 tyFQ==
X-Gm-Message-State: AGi0PuaWK1FczWztmd/OVesyUyk1kqxcHHigNgBaIv3hiAGlPvLRnb0C
 Ukhd1vy2HEPoAM+uA0PojJdFVz2R80A+w+ZHEUAPhLc1zXl5e0jx7H7BTSPxJ/cyjU3J3meWHIZ
 SBM7nsSSJvtVBO83bsoCmnFltwgAJ
X-Received: by 2002:adf:dfc2:: with SMTP id q2mr17562610wrn.390.1586963116160; 
 Wed, 15 Apr 2020 08:05:16 -0700 (PDT)
X-Google-Smtp-Source: APiQypInNtGpLq6xNGNWAqqoyPpwPCPUKuuDSeTuUstzKFJ2go27oAlqPNYKwf0Qb8H1hsP8o5LR4A==
X-Received: by 2002:adf:dfc2:: with SMTP id q2mr17562585wrn.390.1586963115951; 
 Wed, 15 Apr 2020 08:05:15 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id y18sm24759409wmc.45.2020.04.15.08.05.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2020 08:05:15 -0700 (PDT)
Subject: Re: [PATCH 22/59] drm/gm12u320: Don't use drm_device->dev_private
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-23-daniel.vetter@ffwll.ch>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <76e2f239-a2ac-d50a-f1c4-22bffdf34d72@redhat.com>
Date: Wed, 15 Apr 2020 17:05:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200415074034.175360-23-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 4/15/20 9:39 AM, Daniel Vetter wrote:
> Upcasting using a container_of macro is more typesafe, faster and
> easier for the compiler to optimize.
> 
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>

LGTM:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>   drivers/gpu/drm/tiny/gm12u320.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
> index 907739a67bf6..cc397671f689 100644
> --- a/drivers/gpu/drm/tiny/gm12u320.c
> +++ b/drivers/gpu/drm/tiny/gm12u320.c
> @@ -98,6 +98,8 @@ struct gm12u320_device {
>   	} fb_update;
>   };
>   
> +#define to_gm12u320(__dev) container_of(__dev, struct gm12u320_device, dev)
> +
>   static const char cmd_data[CMD_SIZE] = {
>   	0x55, 0x53, 0x42, 0x43, 0x00, 0x00, 0x00, 0x00,
>   	0x68, 0xfc, 0x00, 0x00, 0x00, 0x00, 0x10, 0xff,
> @@ -408,7 +410,7 @@ static void gm12u320_fb_update_work(struct work_struct *work)
>   static void gm12u320_fb_mark_dirty(struct drm_framebuffer *fb,
>   				   struct drm_rect *dirty)
>   {
> -	struct gm12u320_device *gm12u320 = fb->dev->dev_private;
> +	struct gm12u320_device *gm12u320 = to_gm12u320(fb->dev);
>   	struct drm_framebuffer *old_fb = NULL;
>   	bool wakeup = false;
>   
> @@ -558,7 +560,7 @@ static void gm12u320_pipe_enable(struct drm_simple_display_pipe *pipe,
>   				 struct drm_plane_state *plane_state)
>   {
>   	struct drm_rect rect = { 0, 0, GM12U320_USER_WIDTH, GM12U320_HEIGHT };
> -	struct gm12u320_device *gm12u320 = pipe->crtc.dev->dev_private;
> +	struct gm12u320_device *gm12u320 = to_gm12u320(pipe->crtc.dev);
>   
>   	gm12u320->fb_update.draw_status_timeout = FIRST_FRAME_TIMEOUT;
>   	gm12u320_fb_mark_dirty(plane_state->fb, &rect);
> @@ -566,7 +568,7 @@ static void gm12u320_pipe_enable(struct drm_simple_display_pipe *pipe,
>   
>   static void gm12u320_pipe_disable(struct drm_simple_display_pipe *pipe)
>   {
> -	struct gm12u320_device *gm12u320 = pipe->crtc.dev->dev_private;
> +	struct gm12u320_device *gm12u320 = to_gm12u320(pipe->crtc.dev);
>   
>   	gm12u320_stop_fb_update(gm12u320);
>   }
> @@ -641,7 +643,6 @@ static int gm12u320_usb_probe(struct usb_interface *interface,
>   	mutex_init(&gm12u320->fb_update.lock);
>   
>   	dev = &gm12u320->dev;
> -	dev->dev_private = gm12u320;
>   
>   	ret = drmm_mode_config_init(dev);
>   	if (ret)
> @@ -706,7 +707,7 @@ static __maybe_unused int gm12u320_suspend(struct usb_interface *interface,
>   static __maybe_unused int gm12u320_resume(struct usb_interface *interface)
>   {
>   	struct drm_device *dev = usb_get_intfdata(interface);
> -	struct gm12u320_device *gm12u320 = dev->dev_private;
> +	struct gm12u320_device *gm12u320 = to_gm12u320(dev);
>   
>   	gm12u320_set_ecomode(gm12u320);
>   
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
