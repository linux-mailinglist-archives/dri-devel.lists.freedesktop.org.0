Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F7334A2AC
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 08:46:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A1E6F383;
	Fri, 26 Mar 2021 07:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FFC66EE6B
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 00:39:16 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id 75so5207161lfa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 17:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=9maGiU0Rk/y8xCfMYoV6Sxga4CbEZAuMCNYVkOzPI8U=;
 b=oyCPm0nRjXenyPEEXd7WPKax8iTQ4ZJkjusEfhKMnwgHWtkWSZ1L1Psuyvx03SUSQk
 /RgGlSnRELW+22OZEYsc8NMeuyqql10n/PxAcpoAZiwrl/9nLgjcGGnnmVCqug1ASEVn
 csGeWqz2GdbWdrVcX6JyhDuCzGpA29uU3yNpZIHLUxxY8Hm3e8HDvDZn7gYrKLo5xSnh
 Qg30oImfVdSxhupWzZlPtxPH+wLHMW7yGX8E3rkGsEk2P0HTIMcjNOkm7qXwFJPIYhu8
 Or6+V3dRcFq1Us7JZm2dYRadbGUKR43eat2+HovN9eUJPCl2tMN33h8z7grKv0cv7loM
 +Ckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9maGiU0Rk/y8xCfMYoV6Sxga4CbEZAuMCNYVkOzPI8U=;
 b=uUheTsVYNpKm77YzTGV+17ON9apsxGbPpMwZSGwvQm8AKilmbcgi0ZrnI/0fALIBlm
 Hxo+HRQ5UDBFvydKFr7cIdsyyABvh9l7ht9p5QKXU1t2TOY4rJ1nHSoS8uo+Q3vK66Lv
 uQB/1HN2SkAnAz7/3vs44najMjUhhI8DP9OP+l+KJWu6nbi6XSKhi7CPbvcE3aM9ZEq1
 WNSjt5kYllkEfsZtN1kFSfvNDiMYGFFFrG1aN9b8m0ddsIrpS4P0AqELDEKC28V7+Bo8
 a79rA1Evulriwx5lBP3ZJNZOncFPefDuhiGUKjJjQhV1A9aUrBLxpuo9mGbKnHy8uPId
 u01g==
X-Gm-Message-State: AOAM5313MNRtofsgmh6JvgWYWaZYv13v5TNJtU85azcj4PxdUor5Fa7K
 VaSkFFfnT2CfTVWB53Jovihcyw==
X-Google-Smtp-Source: ABdhPJzGbo05As6/5IRCbLbQFLEfw8cSja8qkF5CNCUzmZzxGjCVUgDliBdD2tjZvGO17oy7dQydMA==
X-Received: by 2002:a05:6512:308b:: with SMTP id
 z11mr6258172lfd.487.1616719154521; 
 Thu, 25 Mar 2021 17:39:14 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
 by smtp.gmail.com with ESMTPSA id z9sm720233lfa.80.2021.03.25.17.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 17:39:13 -0700 (PDT)
Date: Fri, 26 Mar 2021 01:39:13 +0100
From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
To: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH] drm/bridge: adv7511: fix support for large EDIDs
Message-ID: <YF0tMe30JkLE/E8I@oden.dyn.berto.se>
References: <904185be-19ea-a321-a227-d4e659fe1b68@xs4all.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <904185be-19ea-a321-a227-d4e659fe1b68@xs4all.nl>
X-Mailman-Approved-At: Fri, 26 Mar 2021 07:46:48 +0000
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
Cc: Archit Taneja <architt@codeaurora.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hans,

Thanks for your patch.

On 2021-03-24 09:53:32 +0100, Hans Verkuil wrote:
> While testing support for large (> 256 bytes) EDIDs on the Renesas
> Koelsch board I noticed that the adv7511 bridge driver only read the
> first two blocks.
> =

> The media V4L2 version for the adv7511 (drivers/media/i2c/adv7511-v4l2.c)
> handled this correctly.
> =

> Besides a simple bug when setting the segment register (it was set to the
> block number instead of block / 2), the logic of the code was also weird.
> In particular reading the DDC_STATUS is odd: this is unrelated to EDID
> reading.
> =

> The reworked code just waits for any EDID segment reads to finish (this
> does nothing if the a segment is already read), checks if the desired
> segment matches the read segment, and if not, then it requests the new
> segment and waits again for the EDID segment to be read.
> =

> Finally it checks if the currently buffered EDID segment contains the
> desired EDID block, and if not it will update the EDID buffer from
> the adv7511.
> =

> Tested with my Koelsch board and with EDIDs of 1, 2, 3 and 4 blocks.
> =

> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Tested-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Testing on the Renesas board also requires these two adv7604 patches
> if you want to test with an HDMI cable between the HDMI input and output:
> =

> https://patchwork.linuxtv.org/project/linux-media/patch/00882808-472a-d42=
9-c565-a701da579ead@xs4all.nl/
> https://patchwork.linuxtv.org/project/linux-media/patch/c7093e76-ffb4-b19=
c-f576-b264f935a3ce@xs4all.nl/
> ---
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/d=
rm/bridge/adv7511/adv7511_drv.c
> index 76555ae64e9c..9e8db1c60167 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -328,6 +328,7 @@ static void adv7511_set_link_config(struct adv7511 *a=
dv7511,
>  static void __adv7511_power_on(struct adv7511 *adv7511)
>  {
>  	adv7511->current_edid_segment =3D -1;
> +	adv7511->edid_read =3D false;
> =

>  	regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER,
>  			   ADV7511_POWER_POWER_DOWN, 0);
> @@ -529,29 +530,35 @@ static int adv7511_get_edid_block(void *data, u8 *b=
uf, unsigned int block,
>  	struct adv7511 *adv7511 =3D data;
>  	struct i2c_msg xfer[2];
>  	uint8_t offset;
> +	unsigned int cur_segment;
>  	unsigned int i;
>  	int ret;
> =

>  	if (len > 128)
>  		return -EINVAL;
> =

> -	if (adv7511->current_edid_segment !=3D block / 2) {
> -		unsigned int status;
> +	/* wait for any EDID segment reads to finish */
> +	adv7511_wait_for_edid(adv7511, 200);
> =

> -		ret =3D regmap_read(adv7511->regmap, ADV7511_REG_DDC_STATUS,
> -				  &status);
> +	ret =3D regmap_read(adv7511->regmap, ADV7511_REG_EDID_SEGMENT, &cur_seg=
ment);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * If the current read segment does not match what we need, then
> +	 * write the new segment and wait for it to be read.
> +	 */
> +	if (cur_segment !=3D block / 2) {
> +		adv7511->edid_read =3D false;
> +		cur_segment =3D block / 2;
> +		regmap_write(adv7511->regmap, ADV7511_REG_EDID_SEGMENT,
> +			     cur_segment);
> +		ret =3D adv7511_wait_for_edid(adv7511, 200);
>  		if (ret < 0)
>  			return ret;
> +	}
> =

> -		if (status !=3D 2) {
> -			adv7511->edid_read =3D false;
> -			regmap_write(adv7511->regmap, ADV7511_REG_EDID_SEGMENT,
> -				     block);
> -			ret =3D adv7511_wait_for_edid(adv7511, 200);
> -			if (ret < 0)
> -				return ret;
> -		}
> -
> +	if (adv7511->current_edid_segment !=3D cur_segment) {
>  		/* Break this apart, hopefully more I2C controllers will
>  		 * support 64 byte transfers than 256 byte transfers
>  		 */
> @@ -579,7 +586,7 @@ static int adv7511_get_edid_block(void *data, u8 *buf=
, unsigned int block,
>  			offset +=3D 64;
>  		}
> =

> -		adv7511->current_edid_segment =3D block / 2;
> +		adv7511->current_edid_segment =3D cur_segment;
>  	}
> =

>  	if (block % 2 =3D=3D 0)

-- =

Regards,
Niklas S=F6derlund
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
