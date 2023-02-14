Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFDC696ED1
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 22:02:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10CE510E02A;
	Tue, 14 Feb 2023 21:02:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5990A10E02A
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 21:02:19 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id bx22so16275895pjb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 13:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=W6hAhBiQuth0RKcnjuFyrUtYy0R0R70e768Xjzo8E0U=;
 b=jOmPB1ACFnX+/zisfeaSLjG4FhSn0QnWgmifX98JHwpJACkaxlJFxO2WjH0ZwIOXMK
 2jT+uqHwpLCirTfEj/o00WPbNhrmc9VoSEQZvL1o6gUpT4uFfMVHnCjxFvzH3ZRFszdQ
 Swm/mjwDVuhh8efFl0RR0gZh0d5A8ZgpXYDng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W6hAhBiQuth0RKcnjuFyrUtYy0R0R70e768Xjzo8E0U=;
 b=ngEs1Rur/JXrNjXmx0rj2Ok0LJZ0GoOYAaWpTOx6LuB4L3AhTi8TflanFV5AgR3W2A
 HQtVnwAiDKJQznnbPUJy9UJpGlyMFw1YgepDGZvjjOA655B3e68L1lOPZSVJPhdH5n0M
 GgG2+1RdjOMpljsvrh42tJekPEdAzMKxJHyvl+ZGmNP+QY5QbCGQ7Gvne4KMV8V8oEoh
 s08vmwWJmlxcy/OIlkAuNtZawdd0Xi9HYVDiRycQV33Q0YrkoF4SwQ2AD3gMIDVKcglV
 TxB5XfNJbyBt2tU9QJy38p1DfIe28BsD+K7V1hUEiSISo8EW/ORNRg1qTvZ00KE49gF+
 c1XA==
X-Gm-Message-State: AO0yUKV78diMkumDX3a3QHzwuEZs+8sHpVz/i5yXSauGLfe7YseP0dgl
 2YeYWMkVEs6VfLvKGyzrSjjT4w==
X-Google-Smtp-Source: AK7set8GH8MT1B1/+MwnjQMXXhlEC6xkXlh6cIC1LPv1l4MuOxPCfxB+ZU7zhZbT56mtSGTMmnSRUw==
X-Received: by 2002:a17:902:e886:b0:199:15bb:8316 with SMTP id
 w6-20020a170902e88600b0019915bb8316mr4697228plg.68.1676408538908; 
 Tue, 14 Feb 2023 13:02:18 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:6604:c04d:808d:7d6])
 by smtp.gmail.com with ESMTPSA id
 iz17-20020a170902ef9100b00196025a34b9sm1811353plb.159.2023.02.14.13.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 13:02:18 -0800 (PST)
Date: Tue, 14 Feb 2023 13:02:15 -0800
From: Brian Norris <briannorris@chromium.org>
To: Kencp huang <kencp_huang@asus.corp-partner.google.com>
Subject: Re: [PATCH 1/1] drm/bridge: analogix_dp: add a quirk for Bob panel
Message-ID: <Y+v216m4Ba+tiIlt@google.com>
References: <20230208031519.7440-1-kencp_huang@asus.corp-partner.google.com>
 <20230208044406.8280-1-kencp_huang@asus.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208044406.8280-1-kencp_huang@asus.corp-partner.google.com>
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
Cc: neil.armstrong@linaro.org, jernej.skrabec@gmail.com, rfoss@kernel.org,
 andrzej.hajda@intel.com, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kencp_huang@asus.com, wzz@rock-chips.com,
 seanpaul@chromium.org, Laurent.pinchart@ideasonboard.com, zyw@rock-chips.com,
 hoegsberg@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

You seem to have sent this twice, perhaps to adjust the To/CC list. I
think I've picked the right one to reply to, but it's usually nice to
use a "v2" notation or otherwise put a comment somewhere in the email.

On Wed, Feb 08, 2023 at 12:44:06PM +0800, Kencp huang wrote:
> From: zain wang <wzz@rock-chips.com>
> 
> Some panels' DP_PSR_STATUS (DPCD 0x2008) may be unstable when we
> enable psr. If we get the unexpected psr state, We need try the
> debounce to ensure the panel was in PSR
> 
> Signed-off-by: zain wang <wzz@rock-chips.com>
> Signed-off-by: Chris Zhong <zyw@rock-chips.com>
> Commit-Ready: Kristian H. Kristensen <hoegsberg@chromium.org>

'Commit-Ready' isn't something that makes sense for upstream Linux. The
other 'Tested-by' and 'Reviewed-by' *might* make sense to carry forward,
even though these were from the Chromium Gerrit instance, but they also
applied to a very old and different version of this patch, so probably
not.

I'd suggest starting over with only the Signed-off-by tags.

> Tested-by: Kristian H. Kristensen <hoegsberg@chromium.org>
> Reviewed-by: Kristian H. Kristensen <hoegsberg@chromium.org>
> Tested-by: Kencp huang <kencp_huang@asus.corp-partner.google.com>
> Signed-off-by: Kencp huang <kencp_huang@asus.corp-partner.google.com>
> ---
>  .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 71 +++++++++++--------
>  1 file changed, 42 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> index 6a4f20fccf84..7b6e3f8f85b0 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> @@ -935,25 +935,54 @@ void analogix_dp_enable_psr_crc(struct analogix_dp_device *dp)
>  	writel(PSR_VID_CRC_ENABLE, dp->reg_base + ANALOGIX_DP_CRC_CON);
>  }
>  
> -static ssize_t analogix_dp_get_psr_status(struct analogix_dp_device *dp)
> +static int analogix_dp_get_psr_status(struct analogix_dp_device *dp,

Probably could be called 'analogix_dp_wait_psr_status()', since it's no
longer just a "getter" function.

> +				      int status)

This would probably make more sense as a 'bool psr_active' or some
similar naming, since it doesn't really represent a "status" field now,
but more of a "am I entering or exiting PSR?" parameter.

>  {
>  	ssize_t val;
> -	u8 status;
> +	u8 reg, store = 0;
> +	int cnt = 0;
> +
> +	/* About 3ms for a loop */

The commit description explains why you need this polling/debounce loop,
but it's good to document such artifacts in the code too, when they're
as strange as this one. Perhaps a short explanation about the "bouncing"
behavior of some panels here? "Some panels' DP_PSR_STATUS register is
unstable when entering PSR."

Also, I already had a (pre mailing list) question about why this doesn't
use readx_poll_timeout(), so I'll repeat for the record one reason not
to: it's difficult to handle the stateful debouncing aspect with that
macro, and keep the 'store' variable around.

> +	while (cnt < 100) {
> +		/* Read operation would takes 900us */
> +		val = drm_dp_dpcd_readb(&dp->aux, DP_PSR_STATUS, &reg);
> +		if (val < 0) {
> +			dev_err(dp->dev, "PSR_STATUS read failed ret=%zd", val);
> +			return val;
> +		}
> +
> +		/*
> +		 * Ensure the PSR_STATE should go to DP_PSR_SINK_ACTIVE_RFB
> +		 * from DP_PSR_SINK_ACTIVE_SINK_SYNCED or
> +		 * DP_PSR_SINK_ACTIVE_SRC_SYNCED.
> +		 * Otherwise, if we get DP_PSR_SINK_ACTIVE_RFB twice in
> +		 * succession, it show the Panel is stable PSR enabled state.
> +		 */
> +		if (status == DP_PSR_SINK_ACTIVE_RFB) {
> +			if ((reg == DP_PSR_SINK_ACTIVE_RFB) &&
> +			    ((store == DP_PSR_SINK_ACTIVE_SINK_SYNCED) ||
> +			     (store == DP_PSR_SINK_ACTIVE_SRC_SYNCED) ||
> +			     (store == DP_PSR_SINK_ACTIVE_RFB)))
> +				return 0;
> +			else
> +				store = reg;
> +		} else {

You dropped the ACTIVE_RESYNC and INACTIVE comments from below. Those
probably should move here.

With those fixed, I think this would be fine:

Reviewed-by: Brian Norris <briannorris@chromium.org>

> +			if ((reg == DP_PSR_SINK_INACTIVE) ||
> +			    (reg == DP_PSR_SINK_ACTIVE_RESYNC))
> +				return 0;
> +		}
>  
> -	val = drm_dp_dpcd_readb(&dp->aux, DP_PSR_STATUS, &status);
> -	if (val < 0) {
> -		dev_err(dp->dev, "PSR_STATUS read failed ret=%zd", val);
> -		return val;
> +		usleep_range(2100, 2200);
> +		cnt++;
>  	}
> -	return status;
> +
> +	return -ETIMEDOUT;
>  }
>  
>  int analogix_dp_send_psr_spd(struct analogix_dp_device *dp,
>  			     struct dp_sdp *vsc, bool blocking)
>  {
>  	unsigned int val;
> -	int ret;
> -	ssize_t psr_status;
>  
>  	/* don't send info frame */
>  	val = readl(dp->reg_base + ANALOGIX_DP_PKT_SEND_CTL);
> @@ -998,26 +1027,10 @@ int analogix_dp_send_psr_spd(struct analogix_dp_device *dp,
>  	if (!blocking)
>  		return 0;
>  
> -	/*
> -	 * db[1]!=0: entering PSR, wait for fully active remote frame buffer.
> -	 * db[1]==0: exiting PSR, wait for either
> -	 *  (a) ACTIVE_RESYNC - the sink "must display the
> -	 *      incoming active frames from the Source device with no visible
> -	 *      glitches and/or artifacts", even though timings may still be
> -	 *      re-synchronizing; or
> -	 *  (b) INACTIVE - the transition is fully complete.
> -	 */
> -	ret = readx_poll_timeout(analogix_dp_get_psr_status, dp, psr_status,
> -		psr_status >= 0 &&
> -		((vsc->db[1] && psr_status == DP_PSR_SINK_ACTIVE_RFB) ||
> -		(!vsc->db[1] && (psr_status == DP_PSR_SINK_ACTIVE_RESYNC ||
> -				 psr_status == DP_PSR_SINK_INACTIVE))),
> -		1500, DP_TIMEOUT_PSR_LOOP_MS * 1000);
> -	if (ret) {
> -		dev_warn(dp->dev, "Failed to apply PSR %d\n", ret);
> -		return ret;
> -	}
> -	return 0;
> +	if (vsc->db[1])
> +		return analogix_dp_get_psr_status(dp, DP_PSR_SINK_ACTIVE_RFB);
> +	else
> +		return analogix_dp_get_psr_status(dp, 0);
>  }
>  
>  ssize_t analogix_dp_transfer(struct analogix_dp_device *dp,
> -- 
> 2.34.1
> 
