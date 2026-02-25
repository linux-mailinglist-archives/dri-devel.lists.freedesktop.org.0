Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHLSL0+qnmntWgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 08:52:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18205193BEB
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 08:52:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110B710E1E3;
	Wed, 25 Feb 2026 07:52:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PNPVIPaG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A670510E1E3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 07:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772005962; x=1803541962;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=269NKUs++Bmxz+P2c3gQHTGC8qfo2DGUjFPHjWeMnxg=;
 b=PNPVIPaGXtK5UaQE/lTMam9HyWSUC/otAZWcQus/bQ61yLrTsq2Mnuup
 yyBMOdG61xfVlHdbaPQDmOUDXL4MyM0S+RovEDTMcxTj19Gw2ZJMU1Mbw
 IAGe+CYHhKCA+3Klh8meoqG4omx25/oIFhjXhWUKZRwhmIPE5AZ9NqnJM
 urIvJt4mWKdBkUdmVbCxvSUxUZ/uHMroRmRXlPi+hwFG912xtREWEjglC
 dLBgyvC/9QV4wiZPaxnVHO8TkU3pJKbdHL5d5tOIHbeP96xu9tnU1LHNV
 TaTi1ECmWDUmQ8dngU5iJGzWyZRA8+MeFZbbY5IGP5twugVOVceVpLJip A==;
X-CSE-ConnectionGUID: m+LdyyWSQrqRgO4zeKPiIA==
X-CSE-MsgGUID: guipkW8uRq+fRObo7X3AjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="95653369"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="95653369"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 23:52:42 -0800
X-CSE-ConnectionGUID: uOVFkiJQTBWMc9akefStzw==
X-CSE-MsgGUID: 67P0GeGEQ5WyJEIgfXQpMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="216168615"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.16])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 23:52:41 -0800
Date: Wed, 25 Feb 2026 09:52:38 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: dri-devel@lists.freedesktop.org, saurabhg.gupta@intel.com,
 alex.zuo@intel.com
Subject: Re: [PATCH] drm/client: Do not destroy NULL modes
Message-ID: <aZ6qRloUJKp4ow9m@intel.com>
References: <20260224221227.69126-2-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260224221227.69126-2-jonathan.cavitt@intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.52 / 15.00];
	MID_RHS_MATCH_TO(1.00)[];
	R_MIXED_CHARSET(0.83)[subject];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[ville.syrjala@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jonathan.cavitt@intel.com,m:saurabhg.gupta@intel.com,m:alex.zuo@intel.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[ville.syrjala@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 18205193BEB
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 10:12:28PM +0000, Jonathan Cavitt wrote:
> 'modes' in drm_client_modeset_probe may fail to kcalloc.  If this
> occurs, we jump to 'out', calling modes_destroy on it, which
> dereferences it.  This may result in a NULL pointer dereference in the
> error case.  Prevent that.
> 
> Fixes: 3039cc0c0653 ("drm/client: Make copies of modes")
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>

Thanks. Pushed to drm-misc-fixes.

> ---
>  drivers/gpu/drm/drm_client_modeset.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> index 262b1b8773c5..bb49b8361271 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -930,7 +930,8 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
>  	mutex_unlock(&client->modeset_mutex);
>  out:
>  	kfree(crtcs);
> -	modes_destroy(dev, modes, connector_count);
> +	if (modes)
> +		modes_destroy(dev, modes, connector_count);
>  	kfree(modes);
>  	kfree(offsets);
>  	kfree(enabled);
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
