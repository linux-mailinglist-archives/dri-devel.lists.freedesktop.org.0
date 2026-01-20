Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIQqA4C1b2nHMAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 18:04:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8D7483B5
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 18:03:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4BF10E636;
	Tue, 20 Jan 2026 17:03:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z6nTetz/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5477310E636
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 17:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768928636; x=1800464636;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1pQWaMLr6+Kj/Go/3GBJDQQFhWDvvkrZ+a95rsUCR4Q=;
 b=Z6nTetz/vUyxv97JB3SN7lGu3DHGKnKgpXnX4EXvp6J9Kd1tH7x5qVn1
 4g9D65su5OlW/ylQDCcyPIpCQxE7vrrEqyi1rb03Rs6vttf4n5IOyobHA
 Iwhfxjf616Mles/wDe6OXrCimtP8ev/IVrDkvYkJHlaGN7l69IRGh4948
 hdHT+Tw7uiFouBuqBH0xJ6wObMwvrimGYGta4Jis8DTbMxJWjzxmPuTfR
 kzDIURpkRO1+rrmT5dSh61+dnbWWMGRbCiJSRqT4twKjL3Q4HHqkSv5HR
 TM6gcG8OjxUA7s5WshzrqiX6Yrkqkq4syeRZgDdxd8KwALUy+ZQltXEDQ w==;
X-CSE-ConnectionGUID: kzhpbEzaRCKR7q61YofIOg==
X-CSE-MsgGUID: T9fwcnQqRZGbOVrTjgnvNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="57705785"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="57705785"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:03:56 -0800
X-CSE-ConnectionGUID: wH99VmyHSvGpWPSjqINv8w==
X-CSE-MsgGUID: hjEV1tyKQuOeLAD+oFGrRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="206214228"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.13])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:03:54 -0800
Date: Tue, 20 Jan 2026 19:03:51 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "jpeisach@ubuntu.com" <jpeisach@ubuntu.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/edid: Use struct cea_db when parsing HDMI VSDB
Message-ID: <aW-1d--9syo7F61k@intel.com>
References: <20260117205139.13991-1-jpeisach@ubuntu.com>
 <cb276398394bd5de209dfcee5216fcb2f6670974@intel.com>
 <aW-iQPICWLQ6Iez7@intel.com>
 <E4531EA5-EF45-493F-A1EB-7677D0BC71FC@ubuntu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <E4531EA5-EF45-493F-A1EB-7677D0BC71FC@ubuntu.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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
X-Spamd-Result: default: False [-0.60 / 15.00];
	R_MIXED_CHARSET(0.71)[subject];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[ville.syrjala@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:jpeisach@ubuntu.com,m:jani.nikula@linux.intel.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ville.syrjala@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,ubuntu.com:email]
X-Rspamd-Queue-Id: 6A8D7483B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 11:37:59AM -0500, jpeisach@ubuntu.com wrote:
> 
> 
> > On Jan 20, 2026, at 10:41 AM, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > 
> > On Mon, Jan 19, 2026 at 03:39:12PM +0200, Jani Nikula wrote:
> >> On Sat, 17 Jan 2026, Joshua Peisach <jpeisach@ubuntu.com> wrote:
> >>> drm_parse_hdmi_vsdb_video is one of the parsers that still do not use the
> >>> cea_db struct, and currently passes a u8 pointer.
> >>> 
> >>> Set the correct struct type and update references to the data accordingly.
> >>> This also makes the same change to drm_parse_hdmi_deep_color_info as
> >>> necessary.
> >>> 
> >>> Signed-off-by: Joshua Peisach <jpeisach@ubuntu.com>
> >>> ---
> >>> drivers/gpu/drm/drm_edid.c | 26 +++++++++++++-------------
> >>> 1 file changed, 13 insertions(+), 13 deletions(-)
> >>> 
> >>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> >>> index 26bb7710a..15bd99e65 100644
> >>> --- a/drivers/gpu/drm/drm_edid.c
> >>> +++ b/drivers/gpu/drm/drm_edid.c
> >>> @@ -6290,7 +6290,7 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
> >>> }
> >>> 
> >>> static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
> >>> -					   const u8 *hdmi)
> >>> +					   const struct cea_db *db)
> >>> {
> >>> 	struct drm_display_info *info = &connector->display_info;
> >>> 	unsigned int dc_bpc = 0;
> >>> @@ -6298,24 +6298,24 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
> >>> 	/* HDMI supports at least 8 bpc */
> >>> 	info->bpc = 8;
> >>> 
> >>> -	if (cea_db_payload_len(hdmi) < 6)
> >>> +	if (cea_db_payload_len(db) < 6)
> >>> 		return;
> >>> 
> >>> -	if (hdmi[6] & DRM_EDID_HDMI_DC_30) {
> >>> +	if (db->data[6] & DRM_EDID_HDMI_DC_30) {
> >> 
> >> That's not the same thing, but off-by-one now. Ditto everywhere that
> >> changes from u8* to db->data[].
> >> 
> >> The main problem with the change (even with fixed offsets) is that the
> >> *specs* typically use indexing from the beginning of the data block, not
> >> from the beginning of payload data.
> >> 
> >> We've discussed this before with Ville (Cc'd) but I'm not sure if we
> >> reached a conclusion.
> > 
> > I guess we could give up on the index matching the spec byte#.
> > Looks like the HDMI VSDB parsing is the only place where we
> > actually have the two match, and everwhere else it's
> > already inconsistent.
> > 
> > Also maybe we should add something to also exclude the
> > extended tag from the payload, for the blocks that use
> > the extended tag...
> > 
> > -- 
> > Ville Syrjälä
> > Intel
> 
> I personally believe it is important to match the spec for consistency
> and reference. Unless I am looking at the wrong thing, bit 6 should have
> the correct index.
> 
> Also I think cea_db in the context of the function calls here are
> just the data blocks. Unless you mean that by having the struct's first
> member being the tag_length if offsetting everything, but I don't think
> it is? Let me know if I'm wrong :)

The tag+length byte is:
byte# 1 in the CTA spec
byte# 0 in the HDMI spec

There's no super nice way to use the byte# as the index for both.
Also the length checks end up looking somewhat confusing when
comparing them with the corresponding index.

-- 
Ville Syrjälä
Intel
