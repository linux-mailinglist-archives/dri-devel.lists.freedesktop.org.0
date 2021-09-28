Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EEE41B95B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 23:35:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA216E9B9;
	Tue, 28 Sep 2021 21:35:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F5416E9B9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 21:35:12 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632864912; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=gqOhI5jADGstwqzjRQSY8ghP7IVG/7u+nBzAhdJ3Btk=;
 b=jCDqn9QO06i7zYRa4Fi7P//qK7/boP1Z2vmXsEn76TcZnac/8ViMiG2czHR6BYbrwTC7okpK
 eWH5qvywSwgdxqSZkOhrRiyKv9L1dcpWqvoJsYrrgCov2+G2OshMspSD3gncc74PeCus/pu2
 iBwRUh17SQjjMjrkhOstTl+qGOY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 61538a8f519bd8dcf0041c06 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 21:35:11
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 39893C43619; Tue, 28 Sep 2021 21:35:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7285BC43460;
 Tue, 28 Sep 2021 21:35:09 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 28 Sep 2021 14:35:09 -0700
From: abhinavk@codeaurora.org
To: Sean Paul <sean@poorly.run>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, swboyd@chromium.org, Sean Paul
 <seanpaul@chromium.org>, Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Rob Clark
 <robdclark@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [Freedreno] [PATCH v2 13/13] drm/msm: Implement HDCP 1.x using
 the new drm HDCP helpers
In-Reply-To: <20210928180219.GT2515@art_vandelay>
References: <20210915203834.1439-1-sean@poorly.run>
 <20210915203834.1439-14-sean@poorly.run>
 <2486179cbd76c34a9c085dfff98448e5@codeaurora.org>
 <20210928180219.GT2515@art_vandelay>
Message-ID: <48a284181bf6211b60f8318531051add@codeaurora.org>
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

On 2021-09-28 11:02, Sean Paul wrote:
> On Tue, Sep 21, 2021 at 07:25:41PM -0700, abhinavk@codeaurora.org 
> wrote:
>> On 2021-09-15 13:38, Sean Paul wrote:
>> > From: Sean Paul <seanpaul@chromium.org>
>> >
>> > This patch adds HDCP 1.x support to msm DP connectors using the new HDCP
>> > helpers.
>> >
>> > Cc: Stephen Boyd <swboyd@chromium.org>
>> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
>> > Link:
>> > https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-15-sean@poorly.run
>> > #v1
>> >
>> > Changes in v2:
>> > -Squash [1] into this patch with the following changes (Stephen)
>> >   -Update the sc7180 dtsi file
>> >   -Remove resource names and just use index (Stephen)
>> >
>> 
>> 
>> > [1]
>> > https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-14-sean@poorly.run
>> > ---
> 
> /snip
> 
>> > diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
>> > index 904535eda0c4..98731fd262d6 100644
>> > --- a/drivers/gpu/drm/msm/Makefile
>> > +++ b/drivers/gpu/drm/msm/Makefile
>> > @@ -109,6 +109,7 @@ msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
>> >  	dp/dp_ctrl.o \
>> >  	dp/dp_display.o \
>> >  	dp/dp_drm.o \
>> > +	dp/dp_hdcp.o \
>> >  	dp/dp_hpd.o \
>> >  	dp/dp_link.o \
>> >  	dp/dp_panel.o \
>> > diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c
>> > b/drivers/gpu/drm/msm/dp/dp_debug.c
>> > index 2f6247e80e9d..de16fca8782a 100644
>> > --- a/drivers/gpu/drm/msm/dp/dp_debug.c
>> > +++ b/drivers/gpu/drm/msm/dp/dp_debug.c
> 
> /snip
> 
>> > +static ssize_t dp_hdcp_key_write(struct file *file, const char __user
>> > *ubuf,
>> > +				 size_t len, loff_t *offp)
>> > +{
>> > +	char *input_buffer;
>> > +	int ret = 0;
>> > +	struct dp_debug_private *debug = file->private_data;
>> > +	struct drm_device *dev;
>> > +
>> > +	dev = debug->drm_dev;
>> > +
>> > +	if (len != (DRM_HDCP_KSV_LEN + DP_HDCP_NUM_KEYS * DP_HDCP_KEY_LEN))
>> > +		return -EINVAL;
>> > +
>> > +	if (!debug->hdcp)
>> > +		return -ENOENT;
>> > +
>> > +	input_buffer = memdup_user_nul(ubuf, len);
>> > +	if (IS_ERR(input_buffer))
>> > +		return PTR_ERR(input_buffer);
>> > +
>> > +	ret = dp_hdcp_ingest_key(debug->hdcp, input_buffer, len);
>> > +
>> > +	kfree(input_buffer);
>> > +	if (ret < 0) {
>> > +		DRM_ERROR("Could not ingest HDCP key, ret=%d\n", ret);
>> > +		return ret;
>> > +	}
>> > +
>> > +	*offp += len;
>> > +	return len;
>> > +}
>> 
>> It seems like the HDCP keys written using debugfs, just for my
>> understanding,
>> are you storing this in some secure partition and the usermode reads 
>> from it
>> and writes them here?
>> 
> 
> We have not sorted out the userspace side of HDCP enablement yet, so it 
> remains
> to be seen whether the keys will be injected via debugfs/firmware 
> file/property.
> 
> /snip
> 
>> > +static int dp_connector_atomic_check(struct drm_connector *connector,
>> > +				     struct drm_atomic_state *state)
>> > +{
>> > +	struct drm_connector_state *conn_state;
>> > +	struct dp_connector_state *dp_state;
>> > +
>> > +	conn_state = drm_atomic_get_new_connector_state(state, connector);
>> > +	dp_state = to_dp_connector_state(conn_state);
>> > +
>> > +	dp_state->hdcp_transition = drm_hdcp_atomic_check(connector, state);
>> 
>> I have a general question related to the transition flag and overall 
>> tying
>> the HDCP
>> enable and authentication to the commit.
>> So lets say there is a case where the driver needs to disable HDCP. It 
>> could
>> be due
>> to link integrity failure OR some other error condition which usermode 
>> is
>> not aware of.
>> In that case, we will set this hdcp_transition to true but in the next
>> commit we will
>> actually do the authentication. What if usermode doesnt issue a new 
>> frame?
>> This question arises because currently the link intergrity check is 
>> done
>> using SW polling
>> in the previous patchset. But as I had commented there, this occurs in 
>> HW
>> for us.
>> I dont see that isr itself in this patchset. So wanted to understand 
>> if
>> thats part of this
>> approach to still tie it with commit.
>> 
>> So if we go with the HW polling based approach which is the preferred
>> method, we need to
>> untie this from the commit.
>> 
> 
> In the case of error, the worker will detect it and try to 
> re-authenticate. If
> the re-authentication is successful, userspace will continue to be 
> unaware and
> everything will keep working. If re-authentication is unsuccessful, the 
> worker
> will update the property value and issue a uevent to userspace. So HDCP
> enablement is only tied to commits when the property value is changing 
> as a
> result of userspace.
> 
> Regarding SW vs HW link checks, I don't think there's any difference in 
> efficacy
> between them. If HW can be relied on to issue an interrupt in failure 
> cases, a
> follow-up set allowing for this seems like a great idea.
> 

Thanks for the explanation. Yes, from our experience it has been pretty 
reliable to
issue signal integrity failures. We already had the isr based approach 
downstream
and would prefer to keep it that way based on our experience of it 
firing reliably.
We can still keep the SW polling code but it should come into effect 
only if HW polling
is not supported / preferred.

>> > +
>> > +	return 0;
>> > +}
> 
> /snip
> 
>> > +static int dp_hdcp_load_keys(struct drm_connector *connector)
>> > +{
>> > +	struct dp_hdcp *hdcp = dp_display_connector_to_hdcp(connector);
>> > +	struct dp_hdcp_key *key;
>> > +	int i, ret = 0;
>> > +
>> > +	mutex_lock(&hdcp->key_lock);
>> > +
>> > +	key = hdcp->key;
>> > +
>> > +	if (!key->valid) {
>> > +		ret = -ENOENT;
>> > +		goto out;
>> > +	}
>> > +
>> > +	dp_hdcp_write_dp(hdcp, DP_HDCP_SW_LOWER_AKSV, key->ksv.words[0]);
>> > +	dp_hdcp_write_dp(hdcp, DP_HDCP_SW_UPPER_AKSV, key->ksv.words[1]);
>> > +
>> > +	for (i = 0; i < DP_HDCP_NUM_KEYS; i++) {
>> > +		dp_hdcp_write_hdcp(hdcp, DP_HDCP_KEY_LSB(i),
>> > +				   key->keys[i].words[0]);
>> > +		dp_hdcp_write_hdcp(hdcp, DP_HDCP_KEY_MSB(i),
>> > +				   key->keys[i].words[1]);
>> > +	}
>> > +
>> > +	dp_hdcp_write_hdcp(hdcp, DP_HDCP_KEY_VALID, DP_HDCP_SW_KEY_VALID);
>> 
>> I think all of these are TZ_*** registers. So the separation of 
>> write_hdcp()
>> Vs write_hdcp_tz()
>> is not very clear to me.
>> Maybe change the write APIs to something like dp_hdcp_write_hdcp_tz() 
>> for
>> the first address space
>> and dp_hdcp_write_hdcp_tz_hlos() for the other one?
>> 
> 
> Will do in v3, thank you for the suggestion.
> 
>> > +	wmb();
>> > +
>> > +	dp_hdcp_write_dp(hdcp, DP_HDCP_ENTROPY_CTRL0, get_random_u32());
>> > +	dp_hdcp_write_dp(hdcp, DP_HDCP_ENTROPY_CTRL1, get_random_u32());
>> > +	wmb();
>> > +
>> > +out:
>> > +	mutex_unlock(&hdcp->key_lock);
>> > +	return ret;
>> > +}
>> > +
>> > +static int dp_hdcp_hdcp2_capable(struct drm_connector *connector,
>> > bool *capable)
>> > +{
>> > +	*capable = false;
>> > +	return 0;
>> > +}
>> > +
>> > +static int dp_hdcp_hdcp1_read_an_aksv(struct drm_connector *connector,
>> > +				      u32 *an, u32 *aksv)
>> > +{
>> > +	struct dp_hdcp *hdcp = dp_display_connector_to_hdcp(connector);
>> > +	bool keys_valid;
>> > +	int ret;
>> > +	u32 val;
>> > +
>> > +	dp_hdcp_write_dp(hdcp, DP_HDCP_CTRL, 1);
>> > +
>> > +	ret = read_poll_timeout(dp_hdcp_are_keys_valid, keys_valid,
>> > keys_valid,
>> > +				20 * 1000, 10 * 1000, false, connector);
>> > +	if (ret) {
>> > +		drm_err(hdcp->dev, "HDCP keys invalid %d\n", ret);
>> > +		return ret;
>> > +	}
>> > +
>> > +	/* Clear AInfo */
>> > +	dp_hdcp_write_dp(hdcp, DP_HDCP_RCVPORT_DATA4, 0);
>> > +
>> > +	aksv[0] = dp_hdcp_read_dp(hdcp, DP_HDCP_RCVPORT_DATA3);
>> > +	aksv[1] = GENMASK(7, 0) & dp_hdcp_read_dp(hdcp,
>> > DP_HDCP_RCVPORT_DATA4);
>> > +
>> > +	ret = read_poll_timeout(dp_hdcp_read_dp, val,
>> > +				(val & DP_HDCP_AN_READY_MASK) == DP_HDCP_AN_READY_MASK,
>> > +				100, 10 * 1000, false, hdcp, DP_HDCP_STATUS);
>> > +	if (ret) {
>> > +		drm_err(hdcp->dev, "AN failed to become ready %x/%d\n", val, ret);
>> > +		return ret;
>> > +	}
>> > +
>> > +	/*
>> > +	 * Get An from hardware, for unknown reasons we need to read the reg
>> > +	 * twice to get valid data.
>> > +	 */
>> > +	dp_hdcp_read_dp(hdcp, DP_HDCP_RCVPORT_DATA5);
>> > +	an[0] = dp_hdcp_read_dp(hdcp, DP_HDCP_RCVPORT_DATA5);
>> > +
>> > +	dp_hdcp_read_dp(hdcp, DP_HDCP_RCVPORT_DATA6);
>> > +	an[1] = dp_hdcp_read_dp(hdcp, DP_HDCP_RCVPORT_DATA6);
>> 
>> Yes its true, but we also have a 1 microsec delay between the first 
>> and
>> second one.
>> So I would certainly preserve that.
> 
> Will do in v3, thank you for the suggestion.
> 
>> 
>> > +
>> > +	return 0;
>> > +}
>> > +
>> > +static int dp_hdcp_hdcp1_store_receiver_info(struct drm_connector
>> > *connector,
>> > +					     u32 *ksv, u32 status, u8 bcaps,
>> > +					     bool is_repeater)
>> > +{
>> > +	struct dp_hdcp *hdcp = dp_display_connector_to_hdcp(connector);
>> > +	u32 val;
>> > +
>> > +	dp_hdcp_write_tz(hdcp, HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA0,
>> > +			 ksv[0]);
>> > +	dp_hdcp_write_tz(hdcp, HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA1,
>> > +			 ksv[1]);
>> > +
>> > +	val = ((status & GENMASK(15, 0)) << 8) | (bcaps & GENMASK(7, 0));
>> > +
>> > +	dp_hdcp_write_tz(hdcp, HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA12,
>> > val);
>> > +
>> 
>> Cant this entire API be skipped for non-repeater cases from the hdcp 
>> lib
>> layer?
>> You can write the bcaps to this earlier and write the bstatus only if 
>> its a
>> repeater.
> 
> Could you expand on the benefits of this?

We can avoid the call coming into the vendor driver hook itself as it 
need not be called
for non-repeater cases. So something like this can be done in the HDCP 
lib?

if ( repeater && ops->hdcp1_store_receiver_info )
      ops->hdcp1_store_receiver_info(....);

> 
>> 
>> > +	return 0;
>> > +}
> 
> /snip
