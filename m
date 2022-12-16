Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3894464EEAB
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 17:11:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA5B10E5FA;
	Fri, 16 Dec 2022 16:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C1310E5FB;
 Fri, 16 Dec 2022 16:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671207057; x=1702743057;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=dX9WZ/JD1h3m5AmrtUHUUyLwsWYF2Mia/nik3ZyIzfE=;
 b=JMyl/cszcqBeZoeT0YzKWplnwDeP7R+VAYcDEyVLyQnAb3vTOC96zDYV
 11IB9f33pHci+Jksxna6bfzXw6opeIniNRgg1du9uKp8LYJhAXfLD3X71
 ug2uEeNmSCByUw0zQkJ2l+GaXR6cBAr5qXWspZY0jeq3lzf2aNid8gkUQ
 ImPQUdF75eUVFEhGqj99Gb0JnCH4w0pchiBbTqJO3Ay/pgvixDazQ8CmO
 vOuooFi+PExaw0QRfoVkCbmvhuFl50KjDx1ItDEf++YLu9P6NUwUYOxg6
 /FeJtR/fTwB/QCyi85E1uQBopc5lw0fL08l6QSyZsuaw7MFY20EUHyivD A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="319050117"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="319050117"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 08:10:43 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="978653047"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="978653047"
Received: from fbielich-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.62.38])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 08:10:42 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: imre.deak@intel.com, Lyude Paul <lyude@redhat.com>
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/display/dp_mst: Fix down/up message
 handling after sink disconnect
In-Reply-To: <Y5yKXXBUycSHov5g@ideak-desk.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221214184258.2869417-1-imre.deak@intel.com>
 <1ade43347769118c82f1b68bd8b51172a1012a37.camel@redhat.com>
 <Y5yKXXBUycSHov5g@ideak-desk.fi.intel.com>
Date: Fri, 16 Dec 2022 18:10:39 +0200
Message-ID: <875yebuy68.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 16 Dec 2022, Imre Deak <imre.deak@intel.com> wrote:
> On Wed, Dec 14, 2022 at 04:41:42PM -0500, Lyude Paul wrote:
>> For the whole series:
>> 
>> Reviewed-by: Lyude Paul <lyude@redhat.com>
>
> Thanks for the review, pushed it to drm-misc-next.

Hmm, with the drm-misc *not* cherry-picking patches from drm-misc-next
to drm-misc-fixes, these will only get backported to stable kernels
after they hit Linus' tree in the next (as opposed to current) merge
window after a full development cycle. Wonder if they should be
expedited.

BR,
Jani.

>
>> Thanks!
>> 
>> On Wed, 2022-12-14 at 20:42 +0200, Imre Deak wrote:
>> > If the sink gets disconnected during receiving a multi-packet DP MST AUX
>> > down-reply/up-request sideband message, the state keeping track of which
>> > packets have been received already is not reset. This results in a failed
>> > sanity check for the subsequent message packet received after a sink is
>> > reconnected (due to the pending message not yet completed with an
>> > end-of-message-transfer packet), indicated by the
>> > 
>> > "sideband msg set header failed"
>> > 
>> > error.
>> > 
>> > Fix the above by resetting the up/down message reception state after a
>> > disconnect event.
>> > 
>> > Cc: Lyude Paul <lyude@redhat.com>
>> > Cc: <stable@vger.kernel.org> # v3.17+
>> > Signed-off-by: Imre Deak <imre.deak@intel.com>
>> > ---
>> >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 3 +++
>> >  1 file changed, 3 insertions(+)
>> > 
>> > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> > index 51a46689cda70..90819fff2c9ba 100644
>> > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> > @@ -3641,6 +3641,9 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
>> >  		drm_dp_dpcd_writeb(mgr->aux, DP_MSTM_CTRL, 0);
>> >  		ret = 0;
>> >  		mgr->payload_id_table_cleared = false;
>> > +
>> > +		memset(&mgr->down_rep_recv, 0, sizeof(mgr->down_rep_recv));
>> > +		memset(&mgr->up_req_recv, 0, sizeof(mgr->up_req_recv));
>> >  	}
>> >  
>> >  out_unlock:
>> 
>> -- 
>> Cheers,
>>  Lyude Paul (she/her)
>>  Software Engineer at Red Hat
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
