Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCAE15CF23
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 01:38:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4010A6F8A5;
	Fri, 14 Feb 2020 00:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459566F8A5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 00:37:58 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1581640678; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=hcsoCO8xW0CaLKJYkahvzO5VfFo0gI9i9riFH8X0OP0=;
 b=IRNO9bFjFKi1xjDzuz41y7HVriUXrsGYR3wYbOTgRqpupI1tjGVU14tyHNDyicJf/HcM1LXV
 3xeJ9qM85Z9RltlMy4Ez5yi6whi5OOm0wwly3YUnTaN9WA+G6QZP7GORP0SvOmidZw8LHrHO
 4jwX9Fut6OgY2sZxP0ebNrCOfIw=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e45ebe3.7f0e2ff83490-smtp-out-n03;
 Fri, 14 Feb 2020 00:37:55 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B8A83C4479C; Fri, 14 Feb 2020 00:37:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: chandanu)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E0753C43383;
 Fri, 14 Feb 2020 00:37:53 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 13 Feb 2020 16:37:53 -0800
From: chandanu@codeaurora.org
To: Rob Clark <robdclark@gmail.com>
Subject: Re: Re: [DPU PATCH v3 3/5] drm/msm/dp: add displayPort driver support
In-Reply-To: <3130b7844837a8caaa10f9f4f5633eab@codeaurora.org>
References: <1575294437-6129-1-git-send-email-chandanu@codeaurora.org>
 <0101016ec6df0d33-edb8acfc-a6f1-486e-a8db-38ec498951ed-000000@us-west-2.amazonses.com>
 <CAF6AEGtHkPSx8xU+CdomDtOqLr-cC2bgfHngWWZzx=8STAsQtA@mail.gmail.com>
 <3130b7844837a8caaa10f9f4f5633eab@codeaurora.org>
Message-ID: <9f595103b30f2785a2beb74c8e0392f7@codeaurora.org>
X-Sender: chandanu@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hoegsberg@google.com, abhinavk@codeaurora.org,
 varar@codeaurora.org, seanpaul@chromium.org, freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hello Rob,
We removed the bridge object for DisplayPort due to review comments in 
patch set 1.

Added more details below.

> -------- Original Message --------
> Subject: Re: [DPU PATCH v3 3/5] drm/msm/dp: add displayPort driver 
> support
> Date: 2019-12-02 08:48
> From: Rob Clark <robdclark@gmail.com>
> To: Chandan Uddaraju <chandanu@codeaurora.org>
> Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
> <devicetree@vger.kernel.org>, linux-arm-msm
> <linux-arm-msm@vger.kernel.org>, Abhinav Kumar
> <abhinavk@codeaurora.org>, Sean Paul <seanpaul@chromium.org>,
> dri-devel <dri-devel@lists.freedesktop.org>, "Kristian H. Kristensen"
> <hoegsberg@google.com>, freedreno <freedreno@lists.freedesktop.org>
> 
> On Mon, Dec 2, 2019 at 5:48 AM Chandan Uddaraju 
> <chandanu@codeaurora.org> wrote:
>> 
>> Add the needed displayPort files to enable DP driver
>> on msm target.
>> 
>> "dp_display" module is the main module that calls into
>> other sub-modules. "dp_drm" file represents the interface
>> between DRM framework and DP driver.
>> 
>> changes in v2:
>> -- Update copyright markings on all relevant files.
>> -- Change pr_err() to DRM_ERROR()
>> -- Use APIs directly instead of function pointers.
>> -- Use drm_display_mode structure to store link parameters in the 
>> driver.
>> -- Use macros for register definitions instead of hardcoded values.
>> -- Replace writel_relaxed/readl_relaxed with writel/readl
>>    and remove memory barriers.
>> -- Remove unnecessary NULL checks.
>> -- Use drm helper functions for dpcd read/write.
>> -- Use DRM_DEBUG_DP for debug msgs.
>> 
>> changes in V3:
>> -- Removed changes in dpu_io_util.[ch]
>> -- Added locking around "is_connected" flag and removed atomic_set()
>> -- Removed the argument validation checks in all the static functions
>>    except initialization functions and few API calls across msm/dp 
>> files
>> -- Removed hardcoded values for register reads/writes
>> -- Removed vreg related generic structures.
>> -- Added return values where ever necessary.
>> -- Updated dp_ctrl_on function.
>> -- Calling the ctrl specific catalog functions directly instead of
>>    function pointers.
>> -- Added seperate change that adds standard value in drm_dp_helper 
>> file.
>> -- Added separate change in this list that is used to initialize
>>    displayport in DPU driver.
>> -- Added change to use drm_dp_get_adjust_request_voltage() function.
>> 
>> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
>> ---
> 
> [snip]
> 
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index f96e142..29ac7d3 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -967,6 +967,9 @@ static void dpu_encoder_virt_mode_set(struct 
>> drm_encoder *drm_enc,
>> 
>>         trace_dpu_enc_mode_set(DRMID(drm_enc));
>> 
>> +       if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS && 
>> priv->dp)
>> +               msm_dp_display_mode_set(priv->dp, drm_enc, mode, 
>> adj_mode);
>> +
> 
> for better or for worse, DSI and HDMI backends create an internal
> drm_bridge object to avoid all of these shunts over from the encoder.
> We might be still the only driver to do this, but IMHO it is better
> than making each encoder know about each backend, so we might as well
> stick with that.
> 
> (same goes for the other 'if (drm_enc->encoder_type == 
> DRM_MODE_ENCODER_TMDS)'s)
> 

We had the below comments from Sean Paul to remove the bridge object in 
patch set 1 of this change.

**********  ******************
> +static const struct drm_bridge_funcs dp_bridge_ops = {
> +	.mode_fixup   = dp_bridge_mode_fixup,
> +	.pre_enable   = dp_bridge_pre_enable,
> +	.enable       = dp_bridge_enable,
> +	.disable      = dp_bridge_disable,
> +	.post_disable = dp_bridge_post_disable,
> +	.mode_set     = dp_bridge_mode_set,
> +};

I'm not convinced you need any of this. The only advantage a bridge gets 
you is
to be involved in modeset. However the only thing you do in modeset is 
save the
mode (which is only used in enable). So why not just use the mode from 
the
crtc's state when encoder->enable is called?

That allows you to delete all of the bridge stuff here.

> +
> +int dp_connector_post_init(struct drm_connector *connector, void 
> *display)
> +{
> +	struct msm_dp *dp_display = display;
> +
> +	if (!dp_display)
> +		return -EINVAL;

*******************************  ****************

thanks
Chandan

> BR,
> -R
> 
> 
>>         list_for_each_entry(conn_iter, connector_list, head)
>>                 if (conn_iter->encoder == drm_enc)
>>                         conn = conn_iter;
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
