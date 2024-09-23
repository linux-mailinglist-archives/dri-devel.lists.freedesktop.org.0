Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B9397EB2A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 14:00:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFFF810E23C;
	Mon, 23 Sep 2024 12:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dOLghqau";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A51610E23C
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 12:00:33 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5365392cfafso4294466e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 05:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727092831; x=1727697631; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Md7c9mcq1/wAV8F1yIx1w2UTYRhMAvy5XqGUWxmdRzs=;
 b=dOLghqau0YI8+DqT0NB6rjfh2Wp0m1Eo/8e8VcGY1Tm+dvh7ansue9kQZC9oVcQ/PF
 Hp1zNau0W5MPh37hsVU3WaO+0Y7gh9xmGIxenOzrf1s7t1yqvesYjCgt5tcLyVtJlmY8
 HQfHKI2R+xkp0vDCw1okQHZ3vVPxBHtvGEbOJzYhsFPgTmUG3PhWeGLC8kZk1hJfeeNK
 y83qJucsHHV5W1zCtsdDAwCOVw+uXq/UYNmWhnjuSewThF1fNu5I3h+l4FPq9FsQdxgv
 o2/lHu84FGsjP3KZO+uyvzwbF/V+iavu/Zo5lbLfEdDY5+SFhI1PJVifcAqntchPp2rR
 Cpmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727092831; x=1727697631;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Md7c9mcq1/wAV8F1yIx1w2UTYRhMAvy5XqGUWxmdRzs=;
 b=C80x7WG65/nNheA1WWnSChaKZmx2N6IZXErQE5vnOpXrceAPTiNYDb/FwoQRi8Ebgm
 fT+/xqqyR554HIslS9rma8+DAtg6wOHQ4ApI+ppjFXadvtmTgd2nOMuVzKjO3bLfneWF
 f8kHFUuYbUwTouSkVWki1Pz01JvT5KuYB4Y9/mnWjfQhH7IVX9fBQVtxJ6hLFDyT3Cos
 dnRcKHSmPzRQ1NfvEOAL5yP3je+YUr+StFOiWBK1ykWu4cJIC0uIiDv7RploVEAsCZlH
 be5KIZTPbMjlY3IukzyeaIs4mk/sWC2Pozmdgrg4gd1kPMHn/KHtjj5Wt9cLpgRI/C2F
 nohg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJOXEAF93JSmGFR2B0i/iYYF7pEtPIv3tqiFJHeFeOlzaqDDVhEuunAh2kUTeaT6dzMTVh4+67KWc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlzG2AnaMbqC7g6EYEhS/C7qdp/1r8u3vHJO0unCAsEKT83lx2
 CZiWu5y3W6+X+iiqYXFKQpCtYX2UfdxLG1ndLyX2GQmatEmvq7LPZRQ7f8rIWKA=
X-Google-Smtp-Source: AGHT+IHMGwxuJEOEo/1RvgDCQ5R3Ei7EBB5RFQQW8WFRvSBzxSt2KvoxnNg+eqQWxcQOM8CKEHQeaQ==
X-Received: by 2002:a05:6512:ac2:b0:536:5515:e9b5 with SMTP id
 2adb3069b0e04-536ac34092emr5338624e87.52.1727092831295; 
 Mon, 23 Sep 2024 05:00:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5368704da94sm3273569e87.89.2024.09.23.05.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 05:00:30 -0700 (PDT)
Date: Mon, 23 Sep 2024 15:00:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hermes Wu <Hermes.Wu@ite.com.tw>
Cc: Pin-yen Lin <treapking@chromium.org>, 
 Kenneth Hung <Kenneth.hung@ite.com.tw>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] drm/bridge: it6505: Add MCCS support
Message-ID: <x4eixnu3kta6u2xqf6mn7ons2pupr7oe5fzjur2pfhgppmozoq@lgmk7zwqhcqm>
References: <20240923094826.13471-1-Hermes.Wu@ite.com.tw>
 <20240923094826.13471-4-Hermes.Wu@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923094826.13471-4-Hermes.Wu@ite.com.tw>
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

On Mon, Sep 23, 2024 at 05:48:29PM GMT, Hermes Wu wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> Changes in v3:
>  -remove non used definition for aux i2x cmd reply
> 
> Add Aux-I2C functionality to support MCCS.
> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 174 +++++++++++++++++++++++++++-
>  1 file changed, 172 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 156440c6517e..5aedc5570739 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -125,6 +125,9 @@
>  #define REG_AUX_ADR_16_19 0x26
>  #define REG_AUX_OUT_DATA0 0x27
>  
> +#define REG_AUX_I2C_ADR 0x25
> +#define REG_AUX_I2C_OP 0x26
> +

Are these registers CMD-specific? Because I see that you already have
defines for 0x25 and 0x26.

>  #define REG_AUX_CMD_REQ 0x2B
>  #define AUX_BUSY BIT(5)
>  
> @@ -266,6 +269,19 @@
>  #define REG_SSC_CTRL1 0x189
>  #define REG_SSC_CTRL2 0x18A
>  
> +#define REG_AUX_USER_CTRL 0x190
> +#define EN_USER_AUX BIT(0)
> +#define USER_AUX_DONE BIT(1)
> +#define AUX_EVENT BIT(4)
> +
> +#define REG_AUX_USER_DATA_REC 0x191
> +#define M_AUX_IN_REC   0xF0
> +#define M_AUX_OUT_REC  0x0F
> +
> +#define REG_AUX_USER_TXB 0x190

And two defines for 0x190 too.

> +#define REG_AUX_USER_REPLY 0x19A
> +#define REG_AUX_USER_RXB(n) (n + 0x19B)
> +
>  #define RBR DP_LINK_BW_1_62
>  #define HBR DP_LINK_BW_2_7
>  #define HBR2 DP_LINK_BW_5_4
> @@ -301,6 +317,8 @@
>  #define MAX_EQ_LEVEL 0x03
>  #define AUX_WAIT_TIMEOUT_MS 15
>  #define AUX_FIFO_MAX_SIZE 16
> +#define AUX_I2C_MAX_SIZE 4
> +#define AUX_I2C_DEFER_RETRY 4
>  #define PIXEL_CLK_DELAY 1
>  #define PIXEL_CLK_INVERSE 0
>  #define ADJUST_PHASE_THRESHOLD 80000
> @@ -323,7 +341,12 @@
>  enum aux_cmd_type {
>  	CMD_AUX_NATIVE_READ = 0x0,
>  	CMD_AUX_NATIVE_WRITE = 0x5,
> +	CMD_AUX_GI2C_ADR = 0x08,
> +	CMD_AUX_GI2C_READ = 0x09,
> +	CMD_AUX_GI2C_WRITE = 0x0A,
>  	CMD_AUX_I2C_EDID_READ = 0xB,
> +	CMD_AUX_I2C_READ = 0x0D,
> +	CMD_AUX_I2C_WRITE = 0x0C,
>  
>  	/* KSV list read using AUX native read with FIFO */
>  	CMD_AUX_GET_KSV_LIST = 0x10,
> @@ -1106,6 +1129,154 @@ static ssize_t it6505_aux_do_transfer(struct it6505 *it6505,
>  	return ret;
>  }
>  
> +static int it6505_aux_i2c_wait(struct it6505 *it6505, u8 *reply)
> +{
> +	int err = 0;

Skip assignment here.

> +	unsigned long timeout;
> +	struct device *dev = it6505->dev;
> +
> +	timeout = jiffies + msecs_to_jiffies(AUX_WAIT_TIMEOUT_MS) + 1;
> +
> +	do {
> +		if (it6505_read(it6505, REG_AUX_USER_CTRL) & AUX_EVENT)
> +			break;
> +		if (time_after(jiffies, timeout)) {
> +			dev_err(dev, "Timed out waiting AUX I2C, BUSY = %X\n",
> +				it6505_aux_op_finished(it6505));
> +			err = -ETIMEDOUT;
> +			goto end_aux_i2c_wait;
> +		}
> +		usleep_range(300, 800);
> +	} while (!it6505_aux_op_finished(it6505));
> +
> +	if (!reply)
> +		goto end_aux_i2c_wait;
> +
> +	*reply = it6505_read(it6505, REG_AUX_USER_REPLY) >> 4;
> +
> +	if (*reply == 0)
> +		goto end_aux_i2c_wait;

assign err = 0 here, so that it's obvious that it's a successfull case.

> +
> +	if ((*reply == DP_AUX_NATIVE_REPLY_DEFER) ||
> +	    (*reply == DP_AUX_I2C_REPLY_DEFER))
> +		err = -EBUSY;
> +	else if ((*reply == DP_AUX_NATIVE_REPLY_NACK) ||
> +		 (*reply == DP_AUX_I2C_REPLY_NACK))
> +		err = -ENXIO;
> +
> +end_aux_i2c_wait:
> +	it6505_set_bits(it6505, REG_AUX_USER_CTRL, USER_AUX_DONE, USER_AUX_DONE);
> +	return err;
> +}
> +
> +static int it6505_aux_i2c_readb(struct it6505 *it6505, u8 *buf, size_t size, u8 *reply)
> +{
> +	int ret, i;
> +	int retry = 0;

Skip the init

> +
> +	for (retry = 0; retry < AUX_I2C_DEFER_RETRY; retry++) {
> +		it6505_write(it6505, REG_AUX_CMD_REQ, CMD_AUX_GI2C_READ);

empty line

> +		ret = it6505_aux_i2c_wait(it6505, reply);
> +		if ((*reply == DP_AUX_NATIVE_REPLY_DEFER) ||
> +		    (*reply == DP_AUX_I2C_REPLY_DEFER))

These two lines keep on being repeated over and over. Please consider
defining a helper function.

> +			continue;
> +		if (ret >= 0)
> +			break;
> +	}
> +
> +	for (i = 0; i < size; i++)
> +		buf[i] =  (u8)it6505_read(it6505, REG_AUX_USER_RXB(0 + i));

Single space, drop type conversion.

> +
> +	return size;
> +}
> +
> +static int it6505_aux_i2c_writeb(struct it6505 *it6505, u8 *buf, size_t size, u8 *reply)
> +{
> +	int i, ret;
> +	int retry = 0;
> +
> +	for (i = 0; i < size; i++)
> +		it6505_write(it6505, REG_AUX_OUT_DATA0 + i, buf[i]);
> +
> +	for (retry = 0; retry < AUX_I2C_DEFER_RETRY; retry++) {
> +		it6505_write(it6505, REG_AUX_CMD_REQ, CMD_AUX_GI2C_WRITE);

empty line

> +		ret = it6505_aux_i2c_wait(it6505, reply);
> +		if ((*reply == DP_AUX_NATIVE_REPLY_DEFER) ||
> +		    (*reply == DP_AUX_I2C_REPLY_DEFER))
> +			continue;
> +		if (ret >= 0)
> +			break;
> +	}
> +	return size;
> +}
> +
> +static ssize_t it6505_aux_i2c_operation(struct it6505 *it6505,
> +					struct drm_dp_aux_msg *msg)
> +{
> +	int ret;
> +	ssize_t request_size, data_cnt = 0;
> +	u8 *buffer = msg->buffer;
> +
> +	/* set AUX user mode */
> +	it6505_set_bits(it6505, REG_AUX_CTRL,
> +			AUX_USER_MODE | AUX_NO_SEGMENT_WR, AUX_USER_MODE);
> +	it6505_set_bits(it6505, REG_AUX_USER_CTRL, EN_USER_AUX, EN_USER_AUX);
> +	/* clear AUX FIFO */
> +	it6505_set_bits(it6505, REG_AUX_CTRL,
> +			AUX_EN_FIFO_READ | CLR_EDID_FIFO,
> +			AUX_EN_FIFO_READ | CLR_EDID_FIFO);
> +
> +	it6505_set_bits(it6505, REG_AUX_CTRL,
> +			AUX_EN_FIFO_READ | CLR_EDID_FIFO, 0x00);
> +
> +	it6505_write(it6505, REG_AUX_ADR_0_7, 0x00);
> +	it6505_write(it6505, REG_AUX_I2C_ADR, msg->address << 1);
> +
> +	if (msg->size == 0) {
> +		/* IIC Start/STOP dummy write */
> +		it6505_write(it6505, REG_AUX_I2C_OP, msg->request);
> +		it6505_write(it6505, REG_AUX_CMD_REQ, CMD_AUX_GI2C_ADR);
> +		ret = it6505_aux_i2c_wait(it6505, &msg->reply);
> +		goto end_aux_i2c_transfer;
> +	}
> +
> +	/* IIC data transfer */
> +	for (data_cnt = 0; data_cnt < msg->size; ) {
> +		request_size = min_t(ssize_t, msg->size - data_cnt, AUX_I2C_MAX_SIZE);
> +		it6505_write(it6505, REG_AUX_I2C_OP,
> +			     msg->request | ((request_size - 1) << 4));
> +		if ((msg->request & DP_AUX_I2C_READ) == DP_AUX_I2C_READ)
> +			ret = it6505_aux_i2c_readb(it6505, &buffer[data_cnt],
> +						   request_size, &msg->reply);
> +		else
> +			ret = it6505_aux_i2c_writeb(it6505, &buffer[data_cnt],
> +						    request_size, &msg->reply);
> +
> +		if (ret < 0)
> +			goto end_aux_i2c_transfer;
> +
> +		data_cnt += request_size;
> +	}
> +	ret = data_cnt;
> +end_aux_i2c_transfer:
> +
> +	it6505_set_bits(it6505, REG_AUX_USER_CTRL, EN_USER_AUX, 0);
> +	it6505_set_bits(it6505, REG_AUX_CTRL, AUX_USER_MODE, 0);
> +	return ret;
> +}
> +
> +static ssize_t it6505_aux_i2c_transfer(struct drm_dp_aux *aux,
> +				       struct drm_dp_aux_msg *msg)
> +{
> +	struct it6505 *it6505 = container_of(aux, struct it6505, aux);
> +	int ret;
> +
> +	mutex_lock(&it6505->aux_lock);
> +	ret = it6505_aux_i2c_operation(it6505, msg);
> +	mutex_unlock(&it6505->aux_lock);

Is it enough to protect from other commands sending data in parallel?
Also as much as I don't like it, in this case using guard() from
cleanup.h will remove a need for a separte function.

> +	return ret;
> +}
> +
>  static ssize_t it6505_aux_transfer(struct drm_dp_aux *aux,
>  				   struct drm_dp_aux_msg *msg)
>  {
> @@ -1115,9 +1286,8 @@ static ssize_t it6505_aux_transfer(struct drm_dp_aux *aux,
>  	int ret;
>  	enum aux_cmd_reply reply;
>  
> -	/* IT6505 doesn't support arbitrary I2C read / write. */
>  	if (is_i2c)
> -		return -EINVAL;
> +		return it6505_aux_i2c_transfer(aux, msg);
>  
>  	switch (msg->request) {
>  	case DP_AUX_NATIVE_READ:
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
