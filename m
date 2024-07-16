Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AFE93243B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 12:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A6F910E643;
	Tue, 16 Jul 2024 10:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="iN4Zp/6M";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2IApRjXU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rODjBwde";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gkpuZE6L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2224D10E643
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 10:37:23 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7DDBE1F8AC;
 Tue, 16 Jul 2024 10:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1721126241; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=JwvHqez0nUQ8CHJgtZH6w4IeiUX93ear2y4wrsW1sTU=;
 b=iN4Zp/6Ms3J4BsoWdD2o678ld5C+XoOo1tXWBHif8anHUbSgcfNI1Y8O0FEoIkPRIikrDE
 E1J8nJbhzRlgnkJ6isKfEJvV8WKy8s+4ujR3z2ofGNkpCBpXKknE8C3Nb3x2cB7ZIrAQDC
 BY8JKkWwNv4CJ2Knf9yr2ZfJxFfFSi4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1721126241;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=JwvHqez0nUQ8CHJgtZH6w4IeiUX93ear2y4wrsW1sTU=;
 b=2IApRjXU68E2QSVQiu8Nfz7DG/sx1QShG5JHC1Tm+COSy3gAyx0DLPY2Oy7vTM14J8Vj0L
 DAc+UnamWTCPdJCQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rODjBwde;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gkpuZE6L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1721126239; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=JwvHqez0nUQ8CHJgtZH6w4IeiUX93ear2y4wrsW1sTU=;
 b=rODjBwdeBOH4VzqvXXKkO6BIHm6zJPRK1v07iN94IbvooZSFE4ovjKQK8wlO7Dap4F8FqG
 sBOFrTdsXvr1e5OE3i4GdyrFETAQ/ytYVCdx+CdCXdIcPbVZO5RVg4LSh9GT9j5/oloebB
 Vb1Zn3k8M/sLjHvlIcX6LGxM9Ws7jfs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1721126239;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=JwvHqez0nUQ8CHJgtZH6w4IeiUX93ear2y4wrsW1sTU=;
 b=gkpuZE6LkDvisVshy795m8+zU9pbdfebQGS/BYzbyvMVgcukT4MQcRIQUf/7h3n+gxHSU4
 NLEFlmxgYEgMxRDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 419E7136E5;
 Tue, 16 Jul 2024 10:37:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ASNyDl9NlmYzMgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 16 Jul 2024 10:37:19 +0000
Message-ID: <98eed3e0-507b-465d-9f3a-0a5e414369b5@suse.de>
Date: Tue, 16 Jul 2024 12:37:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] drm/probe-helper: Optionally report single connected
 output per CRTC
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: jfalempe@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 dri-devel@lists.freedesktop.org
References: <20240715093936.793552-1-tzimmermann@suse.de>
 <20240715093936.793552-3-tzimmermann@suse.de>
 <ZpZBXXMf1KRCn1hd@phenom.ffwll.local>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <ZpZBXXMf1KRCn1hd@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 7DDBE1F8AC
X-Spam-Flag: NO
X-Spam-Score: -0.50
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.50 / 50.00];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; XM_UA_NO_VERSION(0.01)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FREEMAIL_CC(0.00)[redhat.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com,lists.freedesktop.org];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[8]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, suse.de:dkim, suse.de:email]
X-Spam-Level: 
X-Spamd-Bar: /
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

Hi

Am 16.07.24 um 11:46 schrieb Daniel Vetter:
> On Mon, Jul 15, 2024 at 11:38:58AM +0200, Thomas Zimmermann wrote:
>> For CRTCs with multiple outputs (i.e., encoders plus connectors),
>> only report at most a single connected output to userspace. Make
>> this configurable via CONFIG_DRM_REPORT_SINGLE_CONNECTED_CRTC_OUTPUT.
>>
>> Having multiple connected outputs on the same CRTC complicates
>> display-mode and format selection, so most userspace does not
>> support this. This is mostly not a problem in practice, as modern
>> display hardware provides a separate CRTC for each output. On
>> old hardware or hardware with BMCs, a single CRTC often drives
>> multiple displays. Only reporting one of them as connected makes
>> the hardware compatible with common userspace.
>>
>> Add the field prioritized_connectors to struct drm_connector. The
>> bitmask signals which other connectors have priority. Also provide
>> the helper drm_probe_helper_prioritize_connectors() that sets
>> default priorities for a given set of connectors. Calling the
>> helper should be enough to set up the functionality for most drivers.
>>
>> With the prioritization bits in place, update connector-status
>> detection to test against prioritized conenctors. So when the probe
>> helpers detect a connector as connected, test against the prioritized
>> connectors. If any is also connected, set the connector status to
>> disconnected.
>>
>> Please note that this functionality is a workaround for limitations
>> in userspace. If your compositor supports multiple outputs per CRTC,
>> CONFIG_DRM_REPORT_SINGLE_CONNECTED_CRTC_OUTPUT should be disabled.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/Kconfig            |  15 +++++
>>   drivers/gpu/drm/drm_probe_helper.c | 104 +++++++++++++++++++++++++++++
>>   include/drm/drm_connector.h        |   2 +
>>   include/drm/drm_probe_helper.h     |   2 +
>>   4 files changed, 123 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index fd0749c0c630..d1afdbd2d93b 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -105,6 +105,21 @@ config DRM_KMS_HELPER
>>   	help
>>   	  CRTC helpers for KMS drivers.
>>   
>> +config DRM_REPORT_SINGLE_CONNECTED_CRTC_OUTPUT
>> +       bool "Report only a single connected output per CRTC"
>> +       depends on DRM
>> +       default n
>> +       help
>> +         CRTCs can support multiple encoders and connectors for output.
>> +         More than one pair can be connected to a display at a time. Most
>> +         userspace only supports at most one connected output per CRTC at a
>> +	 time. Enable this option to let DRM report at most one connected
>> +	 output per CRTC. This is mostly relevant for low-end and old
>> +	 hardware. Most modern graphics hardware supports a separate CRTC
>> +	 per output and won't be affected by this setting.
>> +
>> +         If in doubt, say "Y".
> Uh I think this is way too much, because this defacto makes this uapi for
> all drivers, forever.
>
> The reason we added the hacks for the bmc connectors was the old "no
> regressions" rule: Adding the BMC connectors broke the setup for existing
> users, we can't have that, hence why the hack was needed. For any new
> driver, or for new platforms, we don't have this regression problem.

It's a problem with userspace, not with drivers. The ast and mgag200 
drivers would be fixed easily.

Wrt UAPI, drivers have to opt-in by setting the prioritized_connectors 
bitmask. Anything but ast and mgag200 will not be affected in any case. 
And for ast/mgag200 there's also no change from the current behavior.

>
> So I think the better way to lift this code from ast/mga is if we a lot
> more focused workaround:
>
> - Add a new probe helper for subordinate connectors, they will report
>    disconnected if any other connector is connected.

There are no subordinate connectors. They are all equal. The current 
patch does what you suggest, but in a generic fashion. I'd otherwise 
have to introduce more abstraction to each affected driver to 
differentiate between the reported status and the real status.

>
> - Put a really big warning onto that function that it should only be used
>    as a workaround for the regression case, not anywhere else.

Isn't that what the patch already does in some way?

>
> - Ideally drivers also don't use that for any new chips where the "no
>    regression" rule doesn't apply.
>
> - I wouldn't bother with the Kconfig, because if we make it a global
>    option we cannot ever change it anyway. The only way to phase this out
>    is by never applying this hack to new hardware support.

I liked Maxime's idea of providing a client cap for userspace that is 
not affected.

I don't think that current userspace treats ast and mgag200 any 
different from the other drivers. It's just that userspace doesn't 
support these drivers' hardware layout. If we add a new driver for new 
hardware with similar limitations, it would also be affected. I think 
that userspace would end up in a whack-a-mole situation if they start 
treating such hardware specifically.

The real fix here is userspace supporting (or at least actively 
ignoring) multiple connected outputs per CRTC.

>
> I think it would be also good to link to the specific userspace that falls
> over, and how it falls over. At least hunting around in git history for
> ast/mga200 didn't reveal anything.

AFAIU it's most of current userspace. At least Gnome, but also KDE and 
Weston.

Best regards
Thomas

>
> Cheers, Sima
>> +
>>   config DRM_PANIC
>>   	bool "Display a user-friendly message when a kernel panic occurs"
>>   	depends on DRM && !(FRAMEBUFFER_CONSOLE && VT_CONSOLE)
>> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
>> index f14301abf53f..fc0652635148 100644
>> --- a/drivers/gpu/drm/drm_probe_helper.c
>> +++ b/drivers/gpu/drm/drm_probe_helper.c
>> @@ -352,6 +352,74 @@ static int detect_connector_status(struct drm_connector *connector,
>>   	return connector_status_connected;
>>   }
>>   
>> +static int reported_connector_status(struct drm_connector *connector, int detected_status,
>> +				     struct drm_modeset_acquire_ctx *ctx, bool force)
>> +{
>> +#if defined(CONFIG_DRM_REPORT_SINGLE_CONNECTED_CRTC_OUTPUT)
>> +	struct drm_connector *prio_connector = connector;
>> +	struct drm_device *dev = connector->dev;
>> +	struct drm_connector_list_iter iter;
>> +	struct drm_connector *pos;
>> +	u32 connector_mask;
>> +	int ret = 0;
>> +
>> +	if (!connector->prioritized_connectors)
>> +		return detected_status;
>> +
>> +	if (detected_status != connector_status_connected)
>> +		return detected_status;
>> +
>> +	connector_mask = drm_connector_mask(connector);
>> +
>> +	/*
>> +	 * Find the connector with status 'connected' and a higher
>> +	 * priority.
>> +	 */
>> +	drm_connector_list_iter_begin(dev, &iter);
>> +	drm_for_each_connector_iter(pos, &iter) {
>> +		if (!(drm_connector_mask(pos) & connector->prioritized_connectors))
>> +			continue;
>> +
>> +		/*
>> +		 * Warn if connector has priority over itself.
>> +		 */
>> +		if (drm_WARN_ON_ONCE(dev, pos == connector))
>> +			continue;
>> +
>> +		/*
>> +		 * Warn if both connectors have priority over each other. Pick the
>> +		 * one with the lower index.
>> +		 */
>> +		if (drm_WARN_ON_ONCE(dev, pos->prioritized_connectors & connector_mask)) {
>> +			if (pos->index > connector->index)
>> +				continue;
>> +		}
>> +
>> +		ret = detect_connector_status(pos, ctx, force);
>> +		if (ret < 0)
>> +			break;
>> +		if (ret == connector_status_disconnected)
>> +			continue;
>> +
>> +		prio_connector = pos;
>> +		break;
>> +	}
>> +	drm_connector_list_iter_end(&iter);
>> +
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	/*
>> +	 * We've found another connected connector. Report our connector
>> +	 * as 'disconnected'.
>> +	 */
>> +	if (prio_connector != connector)
>> +		detected_status = connector_status_disconnected;
>> +#endif
>> +
>> +	return detected_status;
>> +}
>> +
>>   static enum drm_connector_status
>>   drm_helper_probe_detect_ctx(struct drm_connector *connector, bool force)
>>   {
>> @@ -373,6 +441,12 @@ drm_helper_probe_detect_ctx(struct drm_connector *connector, bool force)
>>   	if (WARN_ON(ret < 0))
>>   		ret = connector_status_unknown;
>>   
>> +	ret = reported_connector_status(connector, ret, &ctx, force);
>> +	if (ret == -EDEADLK) {
>> +		drm_modeset_backoff(&ctx);
>> +		goto retry;
>> +	}
>> +
>>   	if (ret != connector->status)
>>   		connector->epoch_counter += 1;
>>   
>> @@ -408,6 +482,7 @@ drm_helper_probe_detect(struct drm_connector *connector,
>>   		return ret;
>>   
>>   	ret = detect_connector_status(connector, ctx, force);
>> +	ret = reported_connector_status(connector, ret, ctx, force);
>>   
>>   	if (ret != connector->status)
>>   		connector->epoch_counter += 1;
>> @@ -416,6 +491,35 @@ drm_helper_probe_detect(struct drm_connector *connector,
>>   }
>>   EXPORT_SYMBOL(drm_helper_probe_detect);
>>   
>> +/**
>> + * drm_probe_helper_prioritize_connectors - Set connector priorities
>> + * @dev: the DRM device with connectors
>> + * @connector_mask: Bitmask connector indices
>> + *
>> + * drm_probe_helper_prioritize_connectors() prioritizes all connectors
>> + * specified in @connector_mask. All given connectors are assumed to
>> + * interfere with each other. Connectors with a lower index have priority
>> + * over connectors with a higher index.
>> + */
>> +void drm_probe_helper_prioritize_connectors(struct drm_device *dev, u32 connector_mask)
>> +{
>> +	struct drm_connector_list_iter iter;
>> +	struct drm_connector *connector;
>> +	u32 prioritized_connectors = 0;
>> +
>> +	drm_connector_list_iter_begin(dev, &iter);
>> +	drm_for_each_connector_iter(connector, &iter) {
>> +		u32 mask = drm_connector_mask(connector);
>> +
>> +		if (!(mask & connector_mask))
>> +			continue;
>> +		connector->prioritized_connectors = prioritized_connectors;
>> +		prioritized_connectors |= mask;
>> +	}
>> +	drm_connector_list_iter_end(&iter);
>> +}
>> +EXPORT_SYMBOL(drm_probe_helper_prioritize_connectors);
>> +
>>   static int drm_helper_probe_get_modes(struct drm_connector *connector)
>>   {
>>   	const struct drm_connector_helper_funcs *connector_funcs =
>> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
>> index 5ad735253413..e3039478e928 100644
>> --- a/include/drm/drm_connector.h
>> +++ b/include/drm/drm_connector.h
>> @@ -1985,6 +1985,8 @@ struct drm_connector {
>>   	/** @epoch_counter: used to detect any other changes in connector, besides status */
>>   	u64 epoch_counter;
>>   
>> +	u32 prioritized_connectors;
>> +
>>   	/**
>>   	 * @possible_encoders: Bit mask of encoders that can drive this
>>   	 * connector, drm_encoder_index() determines the index into the bitfield
>> diff --git a/include/drm/drm_probe_helper.h b/include/drm/drm_probe_helper.h
>> index d6ce7b218b77..05e23485550d 100644
>> --- a/include/drm/drm_probe_helper.h
>> +++ b/include/drm/drm_probe_helper.h
>> @@ -17,6 +17,8 @@ int drm_helper_probe_detect(struct drm_connector *connector,
>>   			    struct drm_modeset_acquire_ctx *ctx,
>>   			    bool force);
>>   
>> +void drm_probe_helper_prioritize_connectors(struct drm_device *dev, u32 connector_mask);
>> +
>>   int drmm_kms_helper_poll_init(struct drm_device *dev);
>>   void drm_kms_helper_poll_init(struct drm_device *dev);
>>   void drm_kms_helper_poll_fini(struct drm_device *dev);
>> -- 
>> 2.45.2
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

