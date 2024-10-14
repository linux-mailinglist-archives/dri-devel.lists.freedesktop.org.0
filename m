Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C7C99C96D
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 13:52:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F9910E442;
	Mon, 14 Oct 2024 11:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="f//aa2Gb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C915A10E442
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 11:52:49 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2fb5740a03bso4243961fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 04:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728906768; x=1729511568; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FasUY+27JFwaZjFeTC/WhRBPBBVBy6YfkzShBDyclc0=;
 b=f//aa2GbgFV/0OsJRVEv84ofy73HF1RWV2l6VXHtBP3G1+S99U096Yv0MUC5dZbQA9
 1DQANihjJhyWzRFJRCfTqqyw0eP5+zapfJKOwd+EMIKYxjScJHYUdtHJop0ak9EM9odz
 3PfBkykvO2EoC7dD4+OCY9EU6m7oVuiL3q5t1so3HCzYb36HQt/QYKw65jFGBaqPksHx
 GmnOePl13xA5z6NA3acLuQtVx7unT+4mbc6uIEXbChB52gZyzY4mp9GIDj5BOgl8/tkE
 4tghXdom9OeDKpsbT3SG25v9vsPG0tv2glKXXX9QFFzIbwHDt5TAu85FPHuCvEE9v12h
 br1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728906768; x=1729511568;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FasUY+27JFwaZjFeTC/WhRBPBBVBy6YfkzShBDyclc0=;
 b=FW9IITWlYcesYQQ86DoQVVhnSZFoWdX+uD0lxVriSvAvz9DlvDwca4ipT2TVPsYmk+
 rmf/wpDAvWATD4mKIXk8Sk+NtpsftT2mZ7Owj1JW6E9DL5IrFkcoWTYCE6Q8Z26D6Mgk
 ix5vjJsQhGxgQ/AExLjxkhC+GjqdI5iWA/1BowOB4qGwMF+GLDEoiXePe//egDvh0hnt
 23irVTMaPGErPlV1jNljBsQWtSnY8jEKrtwAI+T+iQUDjqOS+QEWxMPq3UgDVnTVUr7N
 elIformXtogp/r4mexes9HB+sgbfmSw+lBPm27IFNPCWJU0KNrKaNdvNXVXqyemOkB9V
 27ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnnPmU04aFbmWO5eKM7H2JSUWvgzDD+1wozmN5nzpNMIZ9YzAL9VV8ZWV7Iq6cGg8Xm22CIgGcego=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzA0qzqNmSm+vPG20stRBiU2VHCwABVUsFW9/kkn7QxxbSZENX7
 4sVSwijB4HKLAUVQydC4/tkGQAzqeLeSCkwLRg7cOF3r0jne2TM7SE0q0bSmTDQ=
X-Google-Smtp-Source: AGHT+IHvOIGeABb4m0MJqsfhsfRK0zmSYZ2zkqLdCAdpl0opDqTIu+xf0BdvG/swZBDSwYCHy0q1Ag==
X-Received: by 2002:a05:651c:211b:b0:2fb:5786:251f with SMTP id
 38308e7fff4ca-2fb57862748mr7762271fa.37.1728906767868; 
 Mon, 14 Oct 2024 04:52:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fb24706343sm14556531fa.77.2024.10.14.04.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 04:52:46 -0700 (PDT)
Date: Mon, 14 Oct 2024 14:52:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hermes Wu <Hermes.Wu@ite.com.tw>
Cc: Pin-yen Lin <treapking@chromium.org>, 
 Kenneth Hung <Kenneth.hung@ite.com.tw>, Pet Weng <Pet.Weng@ite.com.tw>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, 
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 03/10] drm/bridge: it6505: add AUX operation for HDCP
 KSV list read
Message-ID: <2nceoodtqfspaxs5ipmrezivknexqwi4yc4mr4lak6yjgowpz5@evhz3vy45lb4>
References: <20241001064305.32180-1-Hermes.Wu@ite.com.tw>
 <20241001064305.32180-4-Hermes.Wu@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001064305.32180-4-Hermes.Wu@ite.com.tw>
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

On Tue, Oct 01, 2024 at 02:43:02PM +0800, Hermes Wu wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> HDCP KSV list readback can choose to use AUX FIFO or general data register.
> For some DisplayPort devices, the KSV list must be read in 5 byte boundaries.
> The original AUX read command does not support these devices.
> 
> The AUX command operation control register "REG_AUX_CMD_REQ" uses b[3:0] as AUX operacion control, and b[7:4] are status bits and read only.
> To change KSV read operation uses "CMD_AUX_NATIVE_READ" from using the data registers to using AUX FIFO.
> The extended command "CMD_AUX_GET_KSV_LIST" is added as "CMD_AUX_NATIVE_READ" with the 0x10 flag which selects AUX FIFO mode.

Please keep the commit message wrapped at 72-75 chars.

Other than that:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 864fab7e388f..9a022c095af4 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -126,6 +126,7 @@
>  #define REG_AUX_OUT_DATA0 0x27
>  
>  #define REG_AUX_CMD_REQ 0x2B
> +#define M_AUX_REQ_CMD 0x0F
>  #define AUX_BUSY BIT(5)
>  
>  #define REG_AUX_DATA_0_7 0x2C
> @@ -324,6 +325,9 @@ enum aux_cmd_type {
>  	CMD_AUX_NATIVE_READ = 0x0,
>  	CMD_AUX_NATIVE_WRITE = 0x5,
>  	CMD_AUX_I2C_EDID_READ = 0xB,
> +
> +	/* KSV read with AUX FIFO extend from CMD_AUX_NATIVE_READ*/
> +	CMD_AUX_GET_KSV_LIST = 0x10,
>  };
>  
>  enum aux_cmd_reply {
> @@ -965,7 +969,8 @@ static ssize_t it6505_aux_operation(struct it6505 *it6505,
>  	it6505_set_bits(it6505, REG_AUX_CTRL, AUX_USER_MODE, AUX_USER_MODE);
>  
>  aux_op_start:
> -	if (cmd == CMD_AUX_I2C_EDID_READ) {
> +	/* HW AUX FIFO supports only EDID and DCPD KSV FIFO area */
> +	if (cmd == CMD_AUX_I2C_EDID_READ || cmd == CMD_AUX_GET_KSV_LIST) {
>  		/* AUX EDID FIFO has max length of AUX_FIFO_MAX_SIZE bytes. */
>  		size = min_t(size_t, size, AUX_FIFO_MAX_SIZE);
>  		/* Enable AUX FIFO read back and clear FIFO */
> @@ -996,7 +1001,7 @@ static ssize_t it6505_aux_operation(struct it6505 *it6505,
>  				  size);
>  
>  	/* Aux Fire */
> -	it6505_write(it6505, REG_AUX_CMD_REQ, cmd);
> +	it6505_write(it6505, REG_AUX_CMD_REQ, FIELD_GET(M_AUX_REQ_CMD, cmd));
>  
>  	ret = it6505_aux_wait(it6505);
>  	if (ret < 0)
> @@ -1030,7 +1035,7 @@ static ssize_t it6505_aux_operation(struct it6505 *it6505,
>  		goto aux_op_start;
>  	}
>  
> -	if (cmd == CMD_AUX_I2C_EDID_READ) {
> +	if (cmd == CMD_AUX_I2C_EDID_READ || cmd == CMD_AUX_GET_KSV_LIST) {
>  		for (i = 0; i < size; i++) {
>  			ret = it6505_read(it6505, REG_AUX_DATA_FIFO);
>  			if (ret < 0)
> @@ -1055,7 +1060,7 @@ static ssize_t it6505_aux_operation(struct it6505 *it6505,
>  	ret = i;
>  
>  aux_op_err:
> -	if (cmd == CMD_AUX_I2C_EDID_READ) {
> +	if (cmd == CMD_AUX_I2C_EDID_READ || cmd == CMD_AUX_GET_KSV_LIST) {
>  		/* clear AUX FIFO */
>  		it6505_set_bits(it6505, REG_AUX_CTRL,
>  				AUX_EN_FIFO_READ | CLR_EDID_FIFO,
> @@ -1076,7 +1081,8 @@ static ssize_t it6505_aux_do_transfer(struct it6505 *it6505,
>  				      size_t size, enum aux_cmd_reply *reply)
>  {
>  	int i, ret_size, ret = 0, request_size;
> -	int fifo_max_size = (cmd == CMD_AUX_I2C_EDID_READ) ? AUX_FIFO_MAX_SIZE : 4;
> +	int fifo_max_size = (cmd == CMD_AUX_I2C_EDID_READ || cmd == CMD_AUX_GET_KSV_LIST) ?
> +						 AUX_FIFO_MAX_SIZE : 4;
>  
>  	mutex_lock(&it6505->aux_lock);
>  	i = 0;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
