Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D1197D772
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 17:30:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDDF410E2F2;
	Fri, 20 Sep 2024 15:30:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VWcAswr+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F5210E839
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 15:30:42 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2f75d044201so21954591fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 08:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726846241; x=1727451041; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SC9Mqy+Zxwk2Yxe5IdpImEnZQYzuu7mUl0e3qpvR6SY=;
 b=VWcAswr+TmBpbd2C1bLLit6JKLLbsmRvYrhmh2xfRnMqK9bC38ocob5IJV7rrG3i+s
 PZFzEA4okrBq0PhyaAnyci6HupuFNzQucTmAIACw61GrR8Y24Oxtzl7RcXEZoPvxHjYv
 +iNgMIBsOKLcPfYfhWT4KoBYJvOHGPWaFlNzVPOO+iMTi4DuLsG7WqUCPq1JQ0G9wXOi
 gKCYExEIuSEMT3VeyKoQHxpfXqoQjty1QeVjBzW9zTPprDka7RnmwV6HaYbENCc3qOpn
 wKsVuAn3P+h5k/fuWgWRbyghfey1vZmnw3dm4+woHNWegJqH5kd7rhNvKF6Xj7GGSTfo
 VHTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726846241; x=1727451041;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SC9Mqy+Zxwk2Yxe5IdpImEnZQYzuu7mUl0e3qpvR6SY=;
 b=dUTbIGiLoFLsbp4tC9B3uOO9CungH+8z+lqyFx9GcH/PAWwg4AB0zOZEVnyxpeEVHU
 PFSZhrjgiUHfYDSa2KYRzw+B4ZpEZoskk6HdBUgC42uiLhV4dmBKFgi9ZRNaWrKAHmtR
 /vgBGgaQ1ws/LnwtXfe34lxmthsbxtEUYRgzJrAI7ZQtSIm5YvwwtTf3UtecV/8KSlAi
 APxwPnbiYNDA25rP11aOOh2/sCNno/4lGAKAgZjEClgTjvP7HqcUDYjiaip9HgLJRpet
 uIXMGhV3wrjr6KdHgA4qzRbT1rOC6lk1MaoOieigJ+KvAAMG4cvAr+QurKkzDk3QUXks
 W4BA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeVhf+GrUtaqnmLg5viT8IenUNn6Iez4l+4OAk9p4Jzv0WWwNBjh9+V7cZh32TwbGxn+iYEhLnwQ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxL+ckf+4pqhnZOXUQH23c41gPzuTelhIOPMRGsbueUWNKTy8jo
 lr64BSsVETdYITYSxb5V71iPbgsAn7fwFlLhcOwitUdVbFhQ3AENvP3OwxGF8cI=
X-Google-Smtp-Source: AGHT+IGrkJS4Y8Aa70oz9sSfKC/LV0xjh7R3un3X2qOeI5V1mzUjlKBAEQyrLugW1/15NQtI5Y36xg==
X-Received: by 2002:a2e:752:0:b0:2f0:2026:3f71 with SMTP id
 38308e7fff4ca-2f7c3d3e666mr17523011fa.8.1726846240803; 
 Fri, 20 Sep 2024 08:30:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f79d32686dsm18597881fa.63.2024.09.20.08.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2024 08:30:39 -0700 (PDT)
Date: Fri, 20 Sep 2024 18:30:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hermes Wu <Hermes.Wu@ite.com.tw>
Cc: Pin-yen Lin <treapking@chromium.org>, 
 Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, 
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, 
 Kenneth Hung <Kenneth.hung@ite.com.tw>
Subject: Re: [PATCH v1 2/2] drm/bridge: it6505:  Add MSSC suport
Message-ID: <di7r7oxzwacfoxfcitq6yhs2ulqnxikn3e3kzezwqcfytn74wu@o6yfhlqdcnki>
References: <20240920082451.9240-1-Hermes.Wu@ite.com.tw>
 <20240920082451.9240-3-Hermes.Wu@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240920082451.9240-3-Hermes.Wu@ite.com.tw>
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

On Fri, Sep 20, 2024 at 04:24:47PM GMT, Hermes Wu wrote:
> From: "Hermes.Wu" <Hermes.wu@ite.com.tw>
> 
> add AUX-I2C functionality to support MCCS. 

Same comment regarding the commit message.

> 
> Change-Id: I63e1a0e5da67526f89f35605a82944be67dee8ac

No Gerrit

> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 209 ++++++++++++++++++++++++++--
>  1 file changed, 200 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index cef02c8c363e..1a272c67e82b 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -127,6 +127,9 @@
>  #define REG_AUX_ADR_16_19 0x26
>  #define REG_AUX_OUT_DATA0 0x27
>  
> +#define REG_AUX_I2C_ADR 0x25
> +#define REG_AUX_I2C_OP 0x26
> +
>  #define REG_AUX_CMD_REQ 0x2B
>  #define AUX_BUSY BIT(5)
>  
> @@ -268,6 +271,19 @@
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
> +#define REG_AUX_USER_REPLY 0x19A
> +#define REG_AUX_USER_RXB(n) (n + 0x19B)
> +
>  #define RBR DP_LINK_BW_1_62
>  #define HBR DP_LINK_BW_2_7
>  #define HBR2 DP_LINK_BW_5_4
> @@ -303,6 +319,8 @@
>  #define MAX_EQ_LEVEL 0x03
>  #define AUX_WAIT_TIMEOUT_MS 15
>  #define AUX_FIFO_MAX_SIZE 16
> +#define AUX_I2C_MAX_SIZE 4
> +#define AUX_I2C_DEFER_RETRY 4
>  #define PIXEL_CLK_DELAY 1
>  #define PIXEL_CLK_INVERSE 0
>  #define ADJUST_PHASE_THRESHOLD 80000
> @@ -325,7 +343,12 @@
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
>  	/*extend read ncommand */
>  	CMD_AUX_GET_KSV_LIST = 0x10,
> @@ -333,8 +356,11 @@ enum aux_cmd_type {
>  
>  enum aux_cmd_reply {
>  	REPLY_ACK,
> -	REPLY_NACK,
> -	REPLY_DEFER,
> +	REPLY_NACK = 1,
> +	REPLY_DEFER = 2,

These are not changed. Why are you adding someting to it? Is it in fact
BIT(n) rather than just values?

> +
> +	REPLY_I2C_NACK = 4,
> +	REPLY_I2C_DEFER = 8,
>  };
>  
>  enum link_train_status {
> @@ -1087,7 +1113,6 @@ static ssize_t it6505_aux_do_transfer(struct it6505 *it6505,
>  				      size_t size, enum aux_cmd_reply *reply)
>  {
>  	int i, ret_size, ret = 0, request_size;
> -	struct device *dev = &it6505->client->dev;

unrelated.

>  
>  	mutex_lock(&it6505->aux_lock);
>  	for (i = 0; i < size; ) {
> @@ -1114,6 +1139,168 @@ static ssize_t it6505_aux_do_transfer(struct it6505 *it6505,
>  	return ret;
>  }
>  
> +
> +static int it6505_aux_i2c_wait(struct it6505 *it6505, u8 *reply)
> +{
> +	int err = 0;
> +	unsigned long timeout;
> +	struct device *dev = &it6505->client->dev;
> +
> +	timeout = jiffies + msecs_to_jiffies(AUX_WAIT_TIMEOUT_MS) + 1;
> +
> +	do {
> +		if (it6505_read(it6505, REG_AUX_USER_CTRL) & AUX_EVENT)
> +			break;
> +		if (time_after(jiffies, timeout)) {
> +			dev_err(dev, "Timed out waiting AUX I2C, BUSY = %X\n",
> +					it6505_aux_op_finished(it6505));
> +			err = -ETIMEDOUT;
> +			goto end_aux_i2c_wait;
> +		}
> +		usleep_range(300, 800);
> +
> +	} while (!it6505_aux_op_finished(it6505));
> +
> +	if (reply == NULL)
> +		goto end_aux_i2c_wait;
> +
> +	*reply = it6505_read(it6505, REG_AUX_USER_REPLY) >> 4;
> +
> +	if (*reply == 0)
> +		goto end_aux_i2c_wait;
> +
> +	if ((*reply == DP_AUX_NATIVE_REPLY_DEFER) ||
> +			(*reply == DP_AUX_I2C_REPLY_DEFER))
> +		err = -EBUSY;
> +	else if ((*reply == DP_AUX_NATIVE_REPLY_NACK) ||
> +			(*reply == DP_AUX_I2C_REPLY_NACK))
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
> +
> +	for (retry = 0; retry < AUX_I2C_DEFER_RETRY; retry++) {
> +
> +		it6505_write(it6505, REG_AUX_CMD_REQ, CMD_AUX_GI2C_READ);
> +
> +		ret = it6505_aux_i2c_wait(it6505, reply);
> +
> +		if ((*reply == DP_AUX_NATIVE_REPLY_DEFER) ||
> +			(*reply == DP_AUX_I2C_REPLY_DEFER))
> +			continue;
> +
> +		if (ret >= 0)
> +			break;
> +	}
> +
> +	for (i = 0; i < size; i++)
> +		buf[i] =  (u8) it6505_read(it6505, REG_AUX_USER_RXB(0 + i));
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
> +
> +		it6505_write(it6505, REG_AUX_CMD_REQ, CMD_AUX_GI2C_WRITE);
> +
> +		ret = it6505_aux_i2c_wait(it6505, reply);
> +
> +		if ((*reply == DP_AUX_NATIVE_REPLY_DEFER) ||
> +			(*reply == DP_AUX_I2C_REPLY_DEFER))
> +			continue;
> +
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
> +	struct device *dev = &it6505->client->dev;
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
> +		request_size = min(msg->size - data_cnt, AUX_I2C_MAX_SIZE);
> +		it6505_write(it6505, REG_AUX_I2C_OP,
> +					(msg->request) | ((request_size - 1) << 4));
> +
> +		if ((msg->request & DP_AUX_I2C_READ) == DP_AUX_I2C_READ)
> +			ret = it6505_aux_i2c_readb(it6505, &buffer[data_cnt],
> +							request_size, &msg->reply);
> +		else
> +			ret = it6505_aux_i2c_writeb(it6505, &buffer[data_cnt],
> +							request_size, &msg->reply);
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
> +
> +static ssize_t it6505_aux_i2c_transfer(struct drm_dp_aux *aux,
> +				   struct drm_dp_aux_msg *msg)
> +{
> +	struct it6505 *it6505 = container_of(aux, struct it6505, aux);
> +	int ret;
> +
> +	mutex_lock(&it6505->aux_lock);
> +	ret = it6505_aux_i2c_operation(it6505, msg);
> +	mutex_unlock(&it6505->aux_lock);
> +	return ret;
> +}
> +
> +
>  static ssize_t it6505_aux_transfer(struct drm_dp_aux *aux,
>  				   struct drm_dp_aux_msg *msg)
>  {
> @@ -1125,7 +1312,7 @@ static ssize_t it6505_aux_transfer(struct drm_dp_aux *aux,
>  
>  	/* IT6505 doesn't support arbitrary I2C read / write. */
>  	if (is_i2c)
> -		return -EINVAL;
> +		return it6505_aux_i2c_transfer(aux, msg);
>  
>  	switch (msg->request) {
>  	case DP_AUX_NATIVE_READ:
> @@ -1153,6 +1340,8 @@ static ssize_t it6505_aux_transfer(struct drm_dp_aux *aux,
>  	case REPLY_DEFER:
>  		msg->reply = DP_AUX_NATIVE_REPLY_DEFER;
>  		break;
> +	default:
> +		break;

why?

>  	}
>  
>  	return ret;
> @@ -1180,7 +1369,7 @@ static int it6505_get_edid_block(void *data, u8 *buf, unsigned int block,
>  		switch (reply) {
>  		case REPLY_ACK:
>  			DRM_DEV_DEBUG_DRIVER(dev, "[0x%02x]: %8ph", offset,
> -					     buf + offset);
> +								uf + offset);

This won't even compile.

>  			offset += 8;
>  			aux_retry = 100;
>  			break;
> @@ -1190,6 +1379,8 @@ static int it6505_get_edid_block(void *data, u8 *buf, unsigned int block,
>  			msleep(20);
>  			if (!(--aux_retry))
>  				return -EIO;
> +		default:
> +			break;
>  		}
>  	}
>  
> @@ -2031,8 +2222,8 @@ static int it6505_setup_sha1_input(struct it6505 *it6505, u8 *sha1_input)
>  
>  
>  	err =  it6505_get_ksvlist(it6505, sha1_input, down_stream_count * 5);
> -	if (err < 0)
> -		return err;
> +		if (err < 0)
> +			return err;

Don't randomly change the alignment (especially in the incorrect way).

>  
>  	msg_count += down_stream_count * 5;
>  
> @@ -2075,7 +2266,7 @@ static bool it6505_hdcp_part2_ksvlist_check(struct it6505 *it6505)
>  	for (retry = 0; retry < 3; retry++) {
>  
>  		err = it6505_get_dpcd(it6505, DP_AUX_HDCP_V_PRIME(0), (u8 *)bv,
> -					sizeof(bv));
> +			      sizeof(bv));

Again.

>  
>  		if (err < 0) {
>  			dev_err(dev, "Read V' value Fail %d", retry);
> @@ -2126,7 +2317,7 @@ static void it6505_hdcp_wait_ksv_list(struct work_struct *work)
>  
>  	ksv_list_check = it6505_hdcp_part2_ksvlist_check(it6505);
>  	DRM_DEV_DEBUG_DRIVER(dev, "ksv list ready, ksv list check %s",
> -				ksv_list_check ? "pass" : "fail");
> +			     ksv_list_check ? "pass" : "fail");

and again.

Please review your patches before submitting them.

>  
>  	if (ksv_list_check)
>  		return;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
