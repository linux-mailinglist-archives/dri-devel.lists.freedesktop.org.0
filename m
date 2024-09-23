Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF4997E971
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 12:07:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B1910E3CC;
	Mon, 23 Sep 2024 10:07:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nV/+Zwri";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A50210E3CC
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 10:07:38 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-53567b4c3f4so4337624e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 03:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727086057; x=1727690857; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=K7dtQZJAov3/a7TX9eVZXV4fMdnBS4uFPMH+c/TD/5g=;
 b=nV/+ZwrigItRNnptcexR1ZAlykSiqU4PvbfQ/LPAlD37G9F4Lth8Whp9BLNDbnWttC
 ErAw8wa+QrEnWGpJds1ennO5tphZ/o2HWlmRbMBC45s7SwH1KU2KqskEdW6YPihjTI76
 aF8RRyE0uu6wfG5Mrb5K7UKUXwz1MFacINXkLzEVb1aL9uzFBg+C6GO5mgZjaiZQotAj
 4z3rjIlNY8JFmM+FLtLQj511Qj99jEuWjn7r+aD6wgFRF5tS9gmp/g7E5zeu20SfZCHc
 sGOadY4Zm9NFdvox/5D3ewPNNs4zrPmu41MFDqK7dnXAo+x6WnRsUpDJYn+qef/eEOX7
 wyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727086057; x=1727690857;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K7dtQZJAov3/a7TX9eVZXV4fMdnBS4uFPMH+c/TD/5g=;
 b=OZKwUAYkWZtlRWHqCUqaZFEHdngNw6I5f/5k8Rw9JErbYoVs+m0oMhs1VcPG6fVDDV
 SaaAwdQny7bSJgB/Wf4KLivbKXu43IAP8U3f2Td0Dn6mxMZttUmk55QRKoP/LwB7Bpvg
 GglfL/GtJkwbW+AVRo1jQQUTGG+ttk1Yf1EgvucqKgbhc7kFz4nWZlbWG9PjUhECItkq
 qjb11alFTAfHWKRewi9x5Tdqac702tCFPqvLezOThlAeGnOSFNgmir3RtufV7i0aLeCY
 IdkWW1cYnOr1yvAkUuGoWQoObcDCvJFsY4rEweHl5lz/9LCaF0K59GaRRLWp0SB6NA7M
 xJzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmVFBeZwLCosb6sgyJLBQavWouUrBd7BPXnZu/iwSwuF8hqAHq+ZtbwwxIkfx8qnyC8NdFP/urO0M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNrl4k96yoV+EZ3mMj2WN7Y+tTO4Cs7xTJEaKGoZr7XZn7fS6f
 p8Jfq64mbCB2l7gSbDZWLxkEU18eBYCcIHCCNdYn0INQ7Alnf7rhz93IPHzco04=
X-Google-Smtp-Source: AGHT+IF59Nkw7itqeJpwOtNBEGRLjgAMfimJSIEXby1vuyjxkdHTTnZhlSiDpS5TrVBpejoMzMT7Ew==
X-Received: by 2002:a05:6512:230b:b0:536:55a3:70ad with SMTP id
 2adb3069b0e04-536ac2e5c5dmr5190414e87.22.1727086056657; 
 Mon, 23 Sep 2024 03:07:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53687046847sm3262687e87.11.2024.09.23.03.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 03:07:36 -0700 (PDT)
Date: Mon, 23 Sep 2024 13:07:34 +0300
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
Subject: Re: [PATCH v3 1/3] drm/bridge: it6505: fix AUX read use aux fifo
Message-ID: <wub2lb7eeswh4ztvyyofb7sajcqv6fkgzjuv7fmo22ykv5jj54@locn6d4mldjs>
References: <20240923094826.13471-1-Hermes.Wu@ite.com.tw>
 <20240923094826.13471-2-Hermes.Wu@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923094826.13471-2-Hermes.Wu@ite.com.tw>
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

On Mon, Sep 23, 2024 at 05:48:26PM GMT, Hermes Wu wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> Changes in v3:
>  -New in v3
> 
> 
> it6505 AUX FIFO mode only 16 byte.
> AUX FIFO mode only supports EDID read and DPCD KSV FIFO area.

ENOTREADABLE. It should be a text, not a set of phrases.
Also changelog comes afterwards.

> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 25 +++++++++++++++++--------
>  1 file changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 87b8545fccc0..d8b40ad890bf 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -300,7 +300,7 @@
>  #define MAX_CR_LEVEL 0x03
>  #define MAX_EQ_LEVEL 0x03
>  #define AUX_WAIT_TIMEOUT_MS 15
> -#define AUX_FIFO_MAX_SIZE 32
> +#define AUX_FIFO_MAX_SIZE 16
>  #define PIXEL_CLK_DELAY 1
>  #define PIXEL_CLK_INVERSE 0
>  #define ADJUST_PHASE_THRESHOLD 80000
> @@ -324,8 +324,13 @@ enum aux_cmd_type {
>  	CMD_AUX_NATIVE_READ = 0x0,
>  	CMD_AUX_NATIVE_WRITE = 0x5,
>  	CMD_AUX_I2C_EDID_READ = 0xB,
> +
> +	/* KSV list read using AUX native read with FIFO */
> +	CMD_AUX_GET_KSV_LIST = 0x10,

Don't mix two changes in a single patch. There should be one patch
fixing FIFO_MAX_SIDE (and then it should have Fixes tag) and another
patch adding CMD_AUX_GET_KSV_LIST. I keep on pointing to
Documenation/process/submitting-patches.rst, which you didn't seem to
have read. Please do it first. Ask any questions if you don't understand
something.

>  };
>  
> +#define GET_AUX_CONTROL_CODE(cmd) ((cmd) & 0x0F)
> +
>  enum aux_cmd_reply {
>  	REPLY_ACK,
>  	REPLY_NACK,
> @@ -965,7 +970,8 @@ static ssize_t it6505_aux_operation(struct it6505 *it6505,
>  	it6505_set_bits(it6505, REG_AUX_CTRL, AUX_USER_MODE, AUX_USER_MODE);
>  
>  aux_op_start:
> -	if (cmd == CMD_AUX_I2C_EDID_READ) {
> +	/* HW AUX FIFO supports only EDID and DCPD KSV FIFO aread */
> +	if (cmd == CMD_AUX_I2C_EDID_READ || cmd == CMD_AUX_GET_KSV_LIST) {
>  		/* AUX EDID FIFO has max length of AUX_FIFO_MAX_SIZE bytes. */
>  		size = min_t(size_t, size, AUX_FIFO_MAX_SIZE);
>  		/* Enable AUX FIFO read back and clear FIFO */
> @@ -996,7 +1002,7 @@ static ssize_t it6505_aux_operation(struct it6505 *it6505,
>  				  size);
>  
>  	/* Aux Fire */
> -	it6505_write(it6505, REG_AUX_CMD_REQ, cmd);
> +	it6505_write(it6505, REG_AUX_CMD_REQ, GET_AUX_CONTROL_CODE(cmd));

Looks like a separate fix.

>  
>  	ret = it6505_aux_wait(it6505);
>  	if (ret < 0)
> @@ -1030,7 +1036,7 @@ static ssize_t it6505_aux_operation(struct it6505 *it6505,
>  		goto aux_op_start;
>  	}
>  
> -	if (cmd == CMD_AUX_I2C_EDID_READ) {
> +	if (cmd == CMD_AUX_I2C_EDID_READ || cmd == CMD_AUX_GET_KSV_LIST) {
>  		for (i = 0; i < size; i++) {
>  			ret = it6505_read(it6505, REG_AUX_DATA_FIFO);
>  			if (ret < 0)
> @@ -1055,7 +1061,7 @@ static ssize_t it6505_aux_operation(struct it6505 *it6505,
>  	ret = i;
>  
>  aux_op_err:
> -	if (cmd == CMD_AUX_I2C_EDID_READ) {
> +	if (cmd == CMD_AUX_I2C_EDID_READ || cmd == CMD_AUX_GET_KSV_LIST) {
>  		/* clear AUX FIFO */
>  		it6505_set_bits(it6505, REG_AUX_CTRL,
>  				AUX_EN_FIFO_READ | CLR_EDID_FIFO,
> @@ -1078,8 +1084,11 @@ static ssize_t it6505_aux_do_transfer(struct it6505 *it6505,
>  	int i, ret_size, ret = 0, request_size;
>  
>  	mutex_lock(&it6505->aux_lock);
> -	for (i = 0; i < size; i += 4) {
> -		request_size = min((int)size - i, 4);
> +	for (i = 0; i < size; ) {
> +		if (cmd == CMD_AUX_I2C_EDID_READ || cmd == CMD_AUX_GET_KSV_LIST)
> +			request_size = min_t(int, (int)size - i, AUX_FIFO_MAX_SIZE);
> +		else
> +			request_size = min_t(int, (int)size - i, 4);

And this one is also separate.

>  		ret_size = it6505_aux_operation(it6505, cmd, address + i,
>  						buffer + i, request_size,
>  						reply);
> @@ -1088,6 +1097,7 @@ static ssize_t it6505_aux_do_transfer(struct it6505 *it6505,
>  			goto aux_op_err;
>  		}
>  
> +		i += request_size;
>  		ret += ret_size;
>  	}
>  
> @@ -2257,7 +2267,6 @@ static void it6505_link_training_work(struct work_struct *work)
>  		it6505->auto_train_retry--;
>  		it6505_dump(it6505);
>  	}
> -

And this is just a noise. Leave it as it is until somebody has to touch
these lines.

>  }
>  
>  static void it6505_plugged_status_to_codec(struct it6505 *it6505)
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
