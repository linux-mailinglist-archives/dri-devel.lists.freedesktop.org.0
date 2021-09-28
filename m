Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2217541B94E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 23:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 504706E99F;
	Tue, 28 Sep 2021 21:28:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0766E99F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 21:28:38 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632864524; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=VT7iinxq+ondnOrpyGgbugybij1GIhqMkZ0s2qf3MeM=;
 b=fmw9thXnZVZvFahSa4GW5vhjl9ji/MV3+yqCg4IF4YAhdCAqLHwkB4zHpchx7bLf45j55+Ny
 h1R0FqiAif6VxCRNpyyrsJcIreJGBGQgGBrAXtmYRcC8kepHX37poLi7/ljTQd7n/uyWHl67
 2jRslQFk3rE7f83lW1ceMsIRU3Y=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 615388ec713d5d6f9610df62 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 21:28:12
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 90F4FC43616; Tue, 28 Sep 2021 21:28:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5DDACC4338F;
 Tue, 28 Sep 2021 21:28:10 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 28 Sep 2021 14:28:10 -0700
From: abhinavk@codeaurora.org
To: Sean Paul <sean@poorly.run>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, swboyd@chromium.org, Sean Paul
 <seanpaul@chromium.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Freedreno] [PATCH v2 04/13] drm/hdcp: Expand HDCP helper library
 for enable/disable/check
In-Reply-To: <20210928173336.GS2515@art_vandelay>
References: <20210915203834.1439-1-sean@poorly.run>
 <20210915203834.1439-5-sean@poorly.run>
 <e96c4be49ef53fec4a81785a43ecb18f@codeaurora.org>
 <20210928173336.GS2515@art_vandelay>
Message-ID: <31514b66e0b76f9607b79cdd4f4a6e31@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sean

On 2021-09-28 10:33, Sean Paul wrote:
> On Tue, Sep 21, 2021 at 04:34:59PM -0700, abhinavk@codeaurora.org 
> wrote:
>> On 2021-09-15 13:38, Sean Paul wrote:
>> > From: Sean Paul <seanpaul@chromium.org>
>> >
>> > This patch expands upon the HDCP helper library to manage HDCP
>> > enable, disable, and check.
>> >
>> > Previous to this patch, the majority of the state management and sink
>> > interaction is tucked inside the Intel driver with the understanding
>> > that once a new platform supported HDCP we could make good decisions
>> > about what should be centralized. With the addition of HDCP support
>> > for Qualcomm, it's time to migrate the protocol-specific bits of HDCP
>> > authentication, key exchange, and link checks to the HDCP helper.
>> >
>> > In terms of functionality, this migration is 1:1 with the Intel driver,
>> > however things are laid out a bit differently than with intel_hdcp.c,
>> > which is why this is a separate patch from the i915 transition to the
>> > helper. On i915, the "shim" vtable is used to account for HDMI vs. DP
>> > vs. DP-MST differences whereas the helper library uses a LUT to
>> > account for the register offsets and a remote read function to route
>> > the messages. On i915, storing the sink information in the source is
>> > done inline whereas now we use the new drm_hdcp_helper_funcs vtable
>> > to store and fetch information to/from source hw. Finally, instead of
>> > calling enable/disable directly from the driver, we'll leave that
>> > decision to the helper and by calling drm_hdcp_helper_atomic_commit()
>> > from the driver. All told, this will centralize the protocol and state
>> > handling in the helper, ensuring we collect all of our bugs^Wlogic
>> > in one place.
>> >
>> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
>> > Link:
>> > https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-5-sean@poorly.run
>> > #v1
>> >
>> > Changes in v2:
>> > -Fixed set-but-unused variable identified by 0-day
>> > ---
>> >  drivers/gpu/drm/drm_hdcp.c | 1103 ++++++++++++++++++++++++++++++++++++
>> >  include/drm/drm_hdcp.h     |  191 +++++++
>> >  2 files changed, 1294 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/drm_hdcp.c b/drivers/gpu/drm/drm_hdcp.c
>> > index 742313ce8f6f..47c6e6923a76 100644
>> > --- a/drivers/gpu/drm/drm_hdcp.c
>> > +++ b/drivers/gpu/drm/drm_hdcp.c
> 
> /snip
> 
>> > +static void drm_hdcp_helper_check_work(struct work_struct *work)
>> > +{
>> > +	struct drm_hdcp_helper_data *data =
>> > container_of(to_delayed_work(work),
>> > +							 struct drm_hdcp_helper_data,
>> > +							 check_work);
>> > +	unsigned long check_link_interval;
>> > +
>> 
>> Does this SW polling for Ri' mismatch need to be done even if the HW 
>> is
>> capable of doing it
>> on its own?
>> MSM HDCP 1x HW can periodically check Ri' mismatches and issue an 
>> interrupt
>> if there is a mismatch.
>> In that case this SW polling is not needed. So maybe check if the HW
>> supports polling and if so
>> skip this SW polling?
>> 
> 
> One could certainly change this to be HW driven. There is also an 
> interrupt on
> Intel for DP links which [re]schedules link check in the interrupt 
> handler,
> something similar could be done for msm. Note that even on these Intel 
> links
> which support the CP interrupt, the worker still runs on the normal 
> cadence. I
> haven't considered relying solely on the interrupt since I want to be 
> sure we
> didn't miss anything.
> 
> Sean

I think we should have the support for HW polling added. From our 
experience,
it has been pretty reliable for us and has a pretty consistent cadence 
in alignment
with the spec. I dont quite understand why we should have both in 
chipsets capable
of HW polling and am bit surprised if SW polling will catch something 
which HW
polling and the subsequent interrupt has missed.

> 
>> > +	mutex_lock(&data->mutex);
>> > +	if (data->value != DRM_MODE_CONTENT_PROTECTION_ENABLED)
>> > +		goto out_data_mutex;
>> > +
>> > +	drm_hdcp_helper_driver_lock(data);
>> > +
>> > +	if (data->enabled_type == DRM_MODE_HDCP_CONTENT_TYPE1) {
>> > +		if (drm_hdcp_hdcp2_check_link(data))
>> > +			goto out;
>> > +		check_link_interval = DRM_HDCP2_CHECK_PERIOD_MS;
>> > +	} else {
>> > +		if (drm_hdcp_hdcp1_check_link(data))
>> > +			goto out;
>> > +		check_link_interval = DRM_HDCP_CHECK_PERIOD_MS;
>> > +	}
>> > +	schedule_delayed_work(&data->check_work, check_link_interval);
>> > +
>> > +out:
>> > +	drm_hdcp_helper_driver_unlock(data);
>> > +out_data_mutex:
>> > +	mutex_unlock(&data->mutex);
>> > +}
> 
> /snip
