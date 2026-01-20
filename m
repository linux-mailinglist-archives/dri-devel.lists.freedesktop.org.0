Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEOVKfbEb2lsMQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 19:09:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BEE49259
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 19:09:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B4810E642;
	Tue, 20 Jan 2026 18:09:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mlatWlRK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92FD210E642
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 18:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768932593; x=1800468593;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=G6wgJ0cFt5Mpcf7L6etVyM/V9jV/VCFAqFHpoomnhWY=;
 b=mlatWlRKX0cnFLFVvsK9u1WiamY5fOazts1c0/7hboYzz7RvQ7Dc856+
 zhOmBt/UerlgCP7KhD9bTeBkYqBRvEhcEsFrQMqeH+7z45RC+fCtMkpCP
 G8H4QUpyn2WHwsEwlEmqFchiLkxUYPQHgZAaJBeTbSEvTyA9EKXBKeUVI
 IKCPwebku8vIz8cqHXnSWC7KRBEca+ksS0sXtkew8C9oALwJzjroBr9jn
 LqA6BIesbob+XxYLmhSG1Qdf0558o8DaIRgTrW0q7ISXo8buEj98OMp1y
 jvPR2j59GsbuBFB34XQ+FrI5E4XyRbx6dByRlu4430u8SgThIb82qbn72 w==;
X-CSE-ConnectionGUID: mFiITu9cTSGZgarndU+FSw==
X-CSE-MsgGUID: GB6RV5iFSqy+P1RW7FS55A==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70203499"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="70203499"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 10:09:53 -0800
X-CSE-ConnectionGUID: 1f6//eqRTBuZ/kR5Er4Sww==
X-CSE-MsgGUID: 91tm/O55Tx+mF9yw4T9VSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="211064623"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.13])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 10:09:52 -0800
Date: Tue, 20 Jan 2026 20:09:49 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "jpeisach@ubuntu.com" <jpeisach@ubuntu.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/edid: Use struct cea_db when parsing HDMI VSDB
Message-ID: <aW_E7bHNsUzDaeC1@intel.com>
References: <20260117205139.13991-1-jpeisach@ubuntu.com>
 <cb276398394bd5de209dfcee5216fcb2f6670974@intel.com>
 <aW-iQPICWLQ6Iez7@intel.com>
 <E4531EA5-EF45-493F-A1EB-7677D0BC71FC@ubuntu.com>
 <aW-1d--9syo7F61k@intel.com>
 <F9D0FB5B-2C81-4BC1-B6D4-8E660ABE2D9B@ubuntu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <F9D0FB5B-2C81-4BC1-B6D4-8E660ABE2D9B@ubuntu.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ubuntu.com:email]
X-Rspamd-Queue-Id: 09BEE49259
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 12:46:59PM -0500, jpeisach@ubuntu.com wrote:
> 
> 
> > On Jan 20, 2026, at 12:03 PM, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > 
> > On Tue, Jan 20, 2026 at 11:37:59AM -0500, jpeisach@ubuntu.com <mailto:jpeisach@ubuntu.com> wrote:
> >> 
> >> 
> >>> On Jan 20, 2026, at 10:41 AM, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> >>> 
> >>> On Mon, Jan 19, 2026 at 03:39:12PM +0200, Jani Nikula wrote:
> >>>> On Sat, 17 Jan 2026, Joshua Peisach <jpeisach@ubuntu.com> wrote:
> >>>>> drm_parse_hdmi_vsdb_video is one of the parsers that still do not use the
> >>>>> cea_db struct, and currently passes a u8 pointer.
> >>>>> 
> >>>>> Set the correct struct type and update references to the data accordingly.
> >>>>> This also makes the same change to drm_parse_hdmi_deep_color_info as
> >>>>> necessary.
> >>>>> 
> >>>>> Signed-off-by: Joshua Peisach <jpeisach@ubuntu.com>
> >>>>> ---
> >>>>> drivers/gpu/drm/drm_edid.c | 26 +++++++++++++-------------
> >>>>> 1 file changed, 13 insertions(+), 13 deletions(-)
> >>>>> 
> >>>>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> >>>>> index 26bb7710a..15bd99e65 100644
> >>>>> --- a/drivers/gpu/drm/drm_edid.c
> >>>>> +++ b/drivers/gpu/drm/drm_edid.c
> >>>>> @@ -6290,7 +6290,7 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
> >>>>> }
> >>>>> 
> >>>>> static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
> >>>>> -					   const u8 *hdmi)
> >>>>> +					   const struct cea_db *db)
> >>>>> {
> >>>>> 	struct drm_display_info *info = &connector->display_info;
> >>>>> 	unsigned int dc_bpc = 0;
> >>>>> @@ -6298,24 +6298,24 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
> >>>>> 	/* HDMI supports at least 8 bpc */
> >>>>> 	info->bpc = 8;
> >>>>> 
> >>>>> -	if (cea_db_payload_len(hdmi) < 6)
> >>>>> +	if (cea_db_payload_len(db) < 6)
> >>>>> 		return;
> >>>>> 
> >>>>> -	if (hdmi[6] & DRM_EDID_HDMI_DC_30) {
> >>>>> +	if (db->data[6] & DRM_EDID_HDMI_DC_30) {
> >>>> 
> >>>> That's not the same thing, but off-by-one now. Ditto everywhere that
> >>>> changes from u8* to db->data[].
> >>>> 
> >>>> The main problem with the change (even with fixed offsets) is that the
> >>>> *specs* typically use indexing from the beginning of the data block, not
> >>>> from the beginning of payload data.
> >>>> 
> >>>> We've discussed this before with Ville (Cc'd) but I'm not sure if we
> >>>> reached a conclusion.
> >>> 
> >>> I guess we could give up on the index matching the spec byte#.
> >>> Looks like the HDMI VSDB parsing is the only place where we
> >>> actually have the two match, and everwhere else it's
> >>> already inconsistent.
> >>> 
> >>> Also maybe we should add something to also exclude the
> >>> extended tag from the payload, for the blocks that use
> >>> the extended tag...
> >>> 
> >>> -- 
> >>> Ville Syrjälä
> >>> Intel
> >> 
> >> I personally believe it is important to match the spec for consistency
> >> and reference. Unless I am looking at the wrong thing, bit 6 should have
> >> the correct index.
> >> 
> >> Also I think cea_db in the context of the function calls here are
> >> just the data blocks. Unless you mean that by having the struct's first
> >> member being the tag_length if offsetting everything, but I don't think
> >> it is? Let me know if I'm wrong :)
> > 
> > The tag+length byte is:
> > byte# 1 in the CTA spec
> > byte# 0 in the HDMI spec
> > 
> > There's no super nice way to use the byte# as the index for both.
> > Also the length checks end up looking somewhat confusing when
> > comparing them with the corresponding index.
> > 
> > -- 
> > Ville Syrjälä
> > Intel
> 
> The name of the functions specifically say HDMI, so I think that's the
> system to use: there are functions that say CTA in the name, like
> parse_cta_y420cmdb - so that is CTA, and these functions follow HDMI.

I'm saying that there is no really sane way to deal with the CTA byte#
convention. So I think it's probably best to just go for a single
consistent approach for both CTA and HDMI. That way people at least
won't get confused by the different convetion between the functions.
And the length checks wouldn't look incorrect.

Another option might be to add some kind of hdmi_db_byte() and
cta_db_byte() helpers and use those instead of the bare index.
But the length checks would still look off, unless we also hide
those in some kind of helpers. Not sure what those would look like
though. Also some blocks can eg. contain multiple descriptors of some
size, and for those the spec defines the byte# relative to the
individual descriptor rather than the whole block.

-- 
Ville Syrjälä
Intel
