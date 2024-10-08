Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0BA995522
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 18:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2752010E1AE;
	Tue,  8 Oct 2024 16:58:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=squebb.ca header.i=@squebb.ca header.b="fV1hF5wX";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="WzvzS8IL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 342 seconds by postgrey-1.36 at gabe;
 Tue, 08 Oct 2024 16:11:14 UTC
Received: from fout-a5-smtp.messagingengine.com
 (fout-a5-smtp.messagingengine.com [103.168.172.148])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF5610E58E;
 Tue,  8 Oct 2024 16:11:14 +0000 (UTC)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfout.phl.internal (Postfix) with ESMTP id A5B77138022C;
 Tue,  8 Oct 2024 12:05:31 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
 by phl-compute-02.internal (MEProxy); Tue, 08 Oct 2024 12:05:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1728403531;
 x=1728489931; bh=e3fTuelKeA36CjKjBwC52sshdoWr3rHup2IJ/WsNqqA=; b=
 fV1hF5wXW9stRq+9GJrKYLWrSNnwK74f2sOqIPI1Lx2GBRkq2A7239ZP9XoXmAMe
 Jl+/OW/xJwvS/uCrmZCs2Ptr5mmXTGvmGmvqr+uyNhNpEJqmoXBrvvHe9nl7xjVd
 IXliBqj8xc8NuUUxH/Ry+0av8tth5h1HshwhFHwSpruUwvScN83YMtrJ/4eKFanf
 BMVQ/y+ITxJp/XIFbghrNtNRNaL0i52aLTNcuQ/KSRNHfSEDAmdi9wTcWSwqWTS2
 dgjz1u16O6Chu0ciR8qn+gTPbR+G4vVbHWnL3XvdLsab90sJKRpzqPiT/NowCfeH
 BI/clch4/izUvrlNoaG7Dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728403531; x=
 1728489931; bh=e3fTuelKeA36CjKjBwC52sshdoWr3rHup2IJ/WsNqqA=; b=W
 zvzS8ILEFv4l/ano0dKzb8MEZJHqq2OqJlf454A+i62WGPgrX3SMWwvlY9UZ63NP
 8PELjlJmo34VnB4aYembOSIYJJmf4YCNSeeneidVeCDfq6HXNAJBGmvXPpLSfN+6
 zqNl5JZZ3S7W06NfQXoASmNeSypmBarh4nPeVPuziQK26zOcnD4dSzD1Pa+liHeQ
 8D73O5rh618caoF0xCHKBVS46o9VG4RBd78nwR2skCO9GCRJMm1K95++WVXJmAvX
 rEENkmV2ZH11PbjAcFWOuWU+YTuq7amgejVShk1w0i9rZHlDqPVi/wYbrhUGyU1o
 E0ZJYO+nf5n+6tPf2OeOg==
X-ME-Sender: <xms:S1gFZ8aRcdD3vMEjcjuBNodXkpnjvenfPJ56pEGW_WH6cf1fk0M65g>
 <xme:S1gFZ3YR0Scuxor576Q1dniRQ743clvAowUHXIFnxyAgygOBUyS-JWMTI_EsI15Uf
 czB5_Q0Pvu2QSgBhEE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdefuddgleejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
 necuhfhrohhmpedfofgrrhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnh
 hovhhosehsqhhuvggssgdrtggrqeenucggtffrrghtthgvrhhnpefhuedvheetgeehtdeh
 tdevheduvdejjefggfeijedvgeekhfefleehkeehvdffheenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhho
 sehsqhhuvggssgdrtggrpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouh
 htpdhrtghpthhtoheprghlvgigrdhhuhhnghesrghmugdrtghomhdprhgtphhtthhopegr
 lhgvgigrnhguvghrrdguvghutghhvghrsegrmhgurdgtohhmpdhrtghpthhtohephhgrrh
 hrhidrfigvnhhtlhgrnhgusegrmhgurdgtohhmpdhrtghpthhtohepmhgrrhhiohdrlhhi
 mhhonhgtihgvlhhlohesrghmugdrtghomhdprhgtphhtthhopehsuhhnphgvnhhgrdhlih
 esrghmugdrtghomhdprhgtphhtthhopehkvghrnhgvlhdquggvvhesihhgrghlihgrrdgt
 ohhmpdhrtghpthhtohepmhifvghnsehighgrlhhirgdrtghomhdprhgtphhtthhopehsuh
 hpvghrmhdusehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrmhguqdhgfhigsehlihhs
 thhsrdhfrhgvvgguvghskhhtohhprdhorhhg
X-ME-Proxy: <xmx:S1gFZ2_L3C0VCVtAhSMWdGf3TflgRmm7CwwAwX3AyK238DvnBwiAmQ>
 <xmx:S1gFZ2rE__ZkXp11GIWja-Fbm82iut1WksehQlL3jFTEfD9OPBIuQQ>
 <xmx:S1gFZ3qhWS8nG_W3HaoCOxeRAJlvbGBvdGQNDgKaRwOSYJaGrR_ffw>
 <xmx:S1gFZ0T5m9l5oarIoRlKJA05xdl-3AMWEn02kZ1wVpFrtNylz45xYw>
 <xmx:S1gFZ63TlpNsX93n3mLrBr3AJt5AEZStDeBw6f3nQ4rcLQMJISy7wJ3L>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 3C54A3C0068; Tue,  8 Oct 2024 12:05:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 08 Oct 2024 12:05:10 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Mario Limonciello" <superm1@kernel.org>, "Alex Hung" <alex.hung@amd.com>, 
 "Alexander Deucher" <alexander.deucher@amd.com>,
 "Melissa Wen" <mwen@igalia.com>
Cc: kernel-dev@igalia.com, "Limonciello, Mario" <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, sunpeng.li@amd.com
Message-Id: <0a996d5e-37f9-423d-9f6a-f6b83fe5f870@app.fastmail.com>
In-Reply-To: <20240927230600.2619844-6-superm1@kernel.org>
References: <20240927230600.2619844-1-superm1@kernel.org>
 <20240927230600.2619844-6-superm1@kernel.org>
Subject: Re: [PATCH v8 5/5] drm/amd/display: Fetch the EDID from _DDC if
 available for eDP
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 08 Oct 2024 16:58:00 +0000
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

On Fri, Sep 27, 2024, at 7:06 PM, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
>
> Some manufacturers have intentionally put an EDID that differs from
> the EDID on the internal panel on laptops.
>
> Attempt to fetch this EDID if it exists and prefer it over the EDID
> that is provided by the panel. If a user prefers to use the EDID from
> the panel, offer a DC debugging parameter that would disable this.
>
> Reviewed-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v3:
>  * Change message to INFO when using ACPI EDID
>  * rebase
> ---
>  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 65 ++++++++++++++++++-
>  drivers/gpu/drm/amd/include/amd_shared.h      |  5 ++
>  2 files changed, 67 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c 
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index b8004ccdcc33..7534e1624e4f 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -23,6 +23,8 @@
>   *
>   */
> 
> +#include <acpi/video.h>
> +
>  #include <linux/string.h>
>  #include <linux/acpi.h>
>  #include <linux/i2c.h>
> @@ -887,6 +889,60 @@ bool dm_helpers_is_dp_sink_present(struct dc_link *link)
>  	return dp_sink_present;
>  }
> 
> +static int
> +dm_helpers_probe_acpi_edid(void *data, u8 *buf, unsigned int block, 
> size_t len)
> +{
> +	struct drm_connector *connector = data;
> +	struct acpi_device *acpidev = ACPI_COMPANION(connector->dev->dev);
> +	unsigned char start = block * EDID_LENGTH;
> +	void *edid;
> +	int r;
> +
> +	if (!acpidev)
> +		return -ENODEV;
> +
> +	/* fetch the entire edid from BIOS */
> +	r = acpi_video_get_edid(acpidev, ACPI_VIDEO_DISPLAY_LCD, -1, &edid);
> +	if (r < 0) {
> +		drm_dbg(connector->dev, "Failed to get EDID from ACPI: %d\n", r);
> +		return r;
> +	}
> +	if (len > r || start > r || start + len > r) {
> +		r = -EINVAL;
> +		goto cleanup;
> +	}
> +
> +	memcpy(buf, edid + start, len);
> +	r = 0;
> +
> +cleanup:
> +	kfree(edid);
> +
> +	return r;
> +}
> +
> +static const struct drm_edid *
> +dm_helpers_read_acpi_edid(struct amdgpu_dm_connector *aconnector)
> +{
> +	struct drm_connector *connector = &aconnector->base;
> +
> +	if (amdgpu_dc_debug_mask & DC_DISABLE_ACPI_EDID)
> +		return NULL;
> +
> +	switch (connector->connector_type) {
> +	case DRM_MODE_CONNECTOR_LVDS:
> +	case DRM_MODE_CONNECTOR_eDP:
> +		break;
> +	default:
> +		return NULL;
> +	}
> +
> +	if (connector->force == DRM_FORCE_OFF)
> +		return NULL;
> +
> +	return drm_edid_read_custom(connector, dm_helpers_probe_acpi_edid, 
> connector);
> +}
> +
>  enum dc_edid_status dm_helpers_read_local_edid(
>  		struct dc_context *ctx,
>  		struct dc_link *link,
> @@ -909,8 +965,11 @@ enum dc_edid_status dm_helpers_read_local_edid(
>  	 * do check sum and retry to make sure read correct edid.
>  	 */
>  	do {
> -
> -		drm_edid = drm_edid_read_ddc(connector, ddc);
> +		drm_edid = dm_helpers_read_acpi_edid(aconnector);
> +		if (drm_edid)
> +			drm_info(connector->dev, "Using ACPI provided EDID for %s\n", 
> connector->name);
> +		else
> +			drm_edid = drm_edid_read_ddc(connector, ddc);
>  		drm_edid_connector_update(connector, drm_edid);
> 
>  		/* DP Compliance Test 4.2.2.6 */
> @@ -1300,4 +1359,4 @@ bool dm_helpers_is_hdr_on(struct dc_context *ctx, 
> struct dc_stream_state *stream
>  {
>  	// TODO
>  	return false;
> -}
> \ No newline at end of file
> +}
> diff --git a/drivers/gpu/drm/amd/include/amd_shared.h 
> b/drivers/gpu/drm/amd/include/amd_shared.h
> index 3f91926a50e9..1ec7c5e5249e 100644
> --- a/drivers/gpu/drm/amd/include/amd_shared.h
> +++ b/drivers/gpu/drm/amd/include/amd_shared.h
> @@ -337,6 +337,11 @@ enum DC_DEBUG_MASK {
>  	 * @DC_FORCE_IPS_ENABLE: If set, force enable all IPS, all the time.
>  	 */
>  	DC_FORCE_IPS_ENABLE = 0x4000,
> +	/**
> +	 * @DC_DISABLE_ACPI_EDID: If set, don't attempt to fetch EDID for
> +	 * eDP display from ACPI _DDC method.
> +	 */
> +	DC_DISABLE_ACPI_EDID = 0x8000,
>  };
> 
>  enum amd_dpm_forced_level;
> -- 
> 2.43.0

For the series, we tested at Lenovo and it fixed a couple of different issues we had seen and reported on different HW models.
 - issue with setting 1600 x 1200 on Z16 G2
 - issue with frequency setting being incorrect on T14 G4 AMD with OLED panels
I didn't do the testing myself (I don't have the configurations on hand that reproduce the problem) but my colleagues did.
Can I do a:
Tested-by: Lenovo Linux team <mpearson-lenovo@squebb.ca>
Or is there some other protocol for this?

Thanks
Mark
