Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9805A2D9D49
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 18:11:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B9289E08;
	Mon, 14 Dec 2020 17:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3929689E08
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 17:11:34 +0000 (UTC)
Received: from [192.168.0.217]
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 871BD96;
 Mon, 14 Dec 2020 18:11:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1607965891;
 bh=Hf6z4hWwA/0AGyH0jp0Wr9gbs26isy6v3beUyLaRklM=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=TzT5Q4bsUiLLf11JO+4D5XuAK+DJH/LVfhCbo+33hksuLmFiq5DCPshgFmF7/gI75
 uQi6MwMpefewNfGgB2yNo7sMBRDcAcXiO6g17WZa5BvVNQMQKQDqV6CyeYbuj2F5LF
 yr6ZIrJ4D9esKibqiDpbKQ8dJmSQLoSV8zyYChIU=
Subject: Re: [PATCH 7/9] drm: rcar-du: Replace dev_private with container_of
To: Jacopo Mondi <jacopo@jmondi.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <20201204220139.15272-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201204220139.15272-8-laurent.pinchart+renesas@ideasonboard.com>
 <20201214105808.xrjyul6hrjsremli@uno.localdomain>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <c7e2b82f-2cd6-6495-bbd8-2eb9731f7f20@ideasonboard.com>
Date: Mon, 14 Dec 2020 17:11:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201214105808.xrjyul6hrjsremli@uno.localdomain>
Content-Language: en-GB
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
Reply-To: kieran.bingham@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On 14/12/2020 10:58, Jacopo Mondi wrote:
> Hi Laurent,
> 
> On Sat, Dec 05, 2020 at 12:01:37AM +0200, Laurent Pinchart wrote:
>> Now that drm_device is embedded in rcar_du_device, we can use
>> container_of to get the rcar_du_device pointer from the drm_device,
>> instead of using the drm_device.dev_private field.
>>
>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> De gustibus non est disputandum


Err ... um ... what he said - whatever that is ... maybe ...

/me checks if google is still working to translate ...

Oh ok ;-)

Well - Yes, I like to_*(from) conversion macros ... so

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> 
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> Thanks
>   j
> 
>> ---
>>  drivers/gpu/drm/rcar-du/rcar_du_drv.c   | 2 --
>>  drivers/gpu/drm/rcar-du/rcar_du_drv.h   | 5 +++++
>>  drivers/gpu/drm/rcar-du/rcar_du_kms.c   | 8 ++++----
>>  drivers/gpu/drm/rcar-du/rcar_du_plane.c | 2 +-
>>  4 files changed, 10 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
>> index 4ab99ac49891..d6a8b7899952 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
>> @@ -587,8 +587,6 @@ static int rcar_du_probe(struct platform_device *pdev)
>>  		return PTR_ERR(rcdu->mmio);
>>
>>  	/* DRM/KMS objects */
>> -	rcdu->ddev.dev_private = rcdu;
>> -
>>  	ret = rcar_du_modeset_init(rcdu);
>>  	if (ret < 0) {
>>  		if (ret != -EPROBE_DEFER)
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
>> index e5b6f456357e..98d6bac3f2fa 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
>> @@ -102,6 +102,11 @@ struct rcar_du_device {
>>  	unsigned int vspd1_sink;
>>  };
>>
>> +static inline struct rcar_du_device *to_rcar_du_device(struct drm_device *dev)
>> +{
>> +	return container_of(dev, struct rcar_du_device, ddev);
>> +}
>> +
>>  static inline bool rcar_du_has(struct rcar_du_device *rcdu,
>>  			       unsigned int feature)
>>  {
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
>> index 57bb0dc22807..d6b71a9361ca 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
>> @@ -327,7 +327,7 @@ const struct rcar_du_format_info *rcar_du_format_info(u32 fourcc)
>>  int rcar_du_dumb_create(struct drm_file *file, struct drm_device *dev,
>>  			struct drm_mode_create_dumb *args)
>>  {
>> -	struct rcar_du_device *rcdu = dev->dev_private;
>> +	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
>>  	unsigned int min_pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
>>  	unsigned int align;
>>
>> @@ -349,7 +349,7 @@ static struct drm_framebuffer *
>>  rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
>>  		  const struct drm_mode_fb_cmd2 *mode_cmd)
>>  {
>> -	struct rcar_du_device *rcdu = dev->dev_private;
>> +	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
>>  	const struct rcar_du_format_info *format;
>>  	unsigned int chroma_pitch;
>>  	unsigned int max_pitch;
>> @@ -421,7 +421,7 @@ rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
>>  static int rcar_du_atomic_check(struct drm_device *dev,
>>  				struct drm_atomic_state *state)
>>  {
>> -	struct rcar_du_device *rcdu = dev->dev_private;
>> +	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
>>  	int ret;
>>
>>  	ret = drm_atomic_helper_check(dev, state);
>> @@ -437,7 +437,7 @@ static int rcar_du_atomic_check(struct drm_device *dev,
>>  static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
>>  {
>>  	struct drm_device *dev = old_state->dev;
>> -	struct rcar_du_device *rcdu = dev->dev_private;
>> +	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
>>  	struct drm_crtc_state *crtc_state;
>>  	struct drm_crtc *crtc;
>>  	unsigned int i;
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
>> index 5f69ff4502c1..02e5f11f38eb 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
>> @@ -128,7 +128,7 @@ static int rcar_du_plane_hwalloc(struct rcar_du_plane *plane,
>>  int rcar_du_atomic_check_planes(struct drm_device *dev,
>>  				struct drm_atomic_state *state)
>>  {
>> -	struct rcar_du_device *rcdu = dev->dev_private;
>> +	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
>>  	unsigned int group_freed_planes[RCAR_DU_MAX_GROUPS] = { 0, };
>>  	unsigned int group_free_planes[RCAR_DU_MAX_GROUPS] = { 0, };
>>  	bool needs_realloc = false;
>> --
>> Regards,
>>
>> Laurent Pinchart
>>

-- 
Regards
--
Kieran
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
