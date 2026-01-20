Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KI91KEuib2mWDgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 16:42:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4E4466B9
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 16:42:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F208905A;
	Tue, 20 Jan 2026 15:42:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TuLyzKsv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C3410E61F
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 15:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768923719; x=1800459719;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=UbIwb+qsuP9hP5xMksCk0ZIBQa/zIJyTUx3cEf6bOSk=;
 b=TuLyzKsvkarJ8Z7bBQ/peByFGVpMKpr3o9jee+k+9pdkHrmwVFgDMWhF
 z5JkKgGBxpiKGddnQCZfmVlITtM9TZayxaE8X7INTz+NIU/8uuEWwxDJU
 OEwP7BvTVAwD/vI1EO7doXbEaZRCT0C6HcPL3a3NO0BNTaF+Y/YYHROVX
 JUjdtvRSrJi2zTZBZo3BjCrjSjeHcGZj92bO5qcJ+zJgp0t31/Jdxtkbx
 C6Vg9SAmeQALEtPdc5YJ8hbzyPgmP+moMJie/KQhmtR3gcpiPmE9we64/
 HCGFROqPJPFt9eEyE1sXmlTa1VKsbOJr0epDWjCbJE3I4pIExxiPOyeYP w==;
X-CSE-ConnectionGUID: NTu0GAzMTzyrHDaxop7eng==
X-CSE-MsgGUID: JxyZpRgERKK3LJZf4P8kNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="95608660"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="95608660"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 07:41:58 -0800
X-CSE-ConnectionGUID: l5I0P0i7Q0y21O/PyArUtw==
X-CSE-MsgGUID: MAeh0Y8zSpy5iFh5hHXHng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="210641442"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.13])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 07:41:56 -0800
Date: Tue, 20 Jan 2026 17:41:52 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joshua Peisach <jpeisach@ubuntu.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/edid: Use struct cea_db when parsing HDMI VSDB
Message-ID: <aW-iQPICWLQ6Iez7@intel.com>
References: <20260117205139.13991-1-jpeisach@ubuntu.com>
 <cb276398394bd5de209dfcee5216fcb2f6670974@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb276398394bd5de209dfcee5216fcb2f6670974@intel.com>
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
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jani.nikula@linux.intel.com,m:jpeisach@ubuntu.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[ville.syrjala@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[ville.syrjala@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:mid,intel.com:dkim,ubuntu.com:email]
X-Rspamd-Queue-Id: 3D4E4466B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jan 19, 2026 at 03:39:12PM +0200, Jani Nikula wrote:
> On Sat, 17 Jan 2026, Joshua Peisach <jpeisach@ubuntu.com> wrote:
> > drm_parse_hdmi_vsdb_video is one of the parsers that still do not use the
> > cea_db struct, and currently passes a u8 pointer.
> >
> > Set the correct struct type and update references to the data accordingly.
> > This also makes the same change to drm_parse_hdmi_deep_color_info as
> > necessary.
> >
> > Signed-off-by: Joshua Peisach <jpeisach@ubuntu.com>
> > ---
> >  drivers/gpu/drm/drm_edid.c | 26 +++++++++++++-------------
> >  1 file changed, 13 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > index 26bb7710a..15bd99e65 100644
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -6290,7 +6290,7 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
> >  }
> >  
> >  static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
> > -					   const u8 *hdmi)
> > +					   const struct cea_db *db)
> >  {
> >  	struct drm_display_info *info = &connector->display_info;
> >  	unsigned int dc_bpc = 0;
> > @@ -6298,24 +6298,24 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
> >  	/* HDMI supports at least 8 bpc */
> >  	info->bpc = 8;
> >  
> > -	if (cea_db_payload_len(hdmi) < 6)
> > +	if (cea_db_payload_len(db) < 6)
> >  		return;
> >  
> > -	if (hdmi[6] & DRM_EDID_HDMI_DC_30) {
> > +	if (db->data[6] & DRM_EDID_HDMI_DC_30) {
> 
> That's not the same thing, but off-by-one now. Ditto everywhere that
> changes from u8* to db->data[].
> 
> The main problem with the change (even with fixed offsets) is that the
> *specs* typically use indexing from the beginning of the data block, not
> from the beginning of payload data.
> 
> We've discussed this before with Ville (Cc'd) but I'm not sure if we
> reached a conclusion.

I guess we could give up on the index matching the spec byte#.
Looks like the HDMI VSDB parsing is the only place where we
actually have the two match, and everwhere else it's
already inconsistent.

Also maybe we should add something to also exclude the
extended tag from the payload, for the blocks that use
the extended tag...

-- 
Ville Syrjälä
Intel
