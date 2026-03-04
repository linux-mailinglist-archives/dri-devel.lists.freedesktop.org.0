Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IhcLIKLtp2msmAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 09:30:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D363A1FCA26
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 09:30:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED65E10E970;
	Wed,  4 Mar 2026 08:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dpIGWoAs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313C010E979;
 Wed,  4 Mar 2026 08:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772613020; x=1804149020;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mp9zMsFj1crKWQWsG/YFBfCHeFkesRYiNEgMhSLYSaw=;
 b=dpIGWoAsWiAnn88RTfUVelZsCLvstEdcApEYpfA1/w8CFh0TcgtQFtOQ
 cHqHDaAI9FTHgkqf5HZwwHkjoz3XGQ15NRTxZDLe2ODK3TXSG/5LJ0rko
 fqWQlfrRfmsGvRXu7MaglloNbx4VzRdDqrZ0V3VNU8+PtfZCkl0qn4YIX
 75Q5tHPl4BGO8A2LvM7KZQ74nzssmgKbvFoDMmNhMQ39MPKMmbqVIMolT
 Dd0RornEeAwYA9EM0EiRGJp9XVauXghvW0o50s9TU7Km/qGI8laPq1i1J
 g6VOBUFeL26/SAv9UKxHEa0t75mnXI69bbfnyfbZedkZkLUuk6gBfLvTN g==;
X-CSE-ConnectionGUID: JQEbMjYIQdCYP2eAaPLOcA==
X-CSE-MsgGUID: WRy/LEmoTXuWP6UD/rWwZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73794511"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="73794511"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 00:30:11 -0800
X-CSE-ConnectionGUID: 0LiY+/uJTluHJEmJ71zJMQ==
X-CSE-MsgGUID: SgDsOcDWTn+St2v7I/uplQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="217433706"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.245.178])
 ([10.245.245.178])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 00:30:10 -0800
Message-ID: <77e5ca2b-7473-44d1-ba4b-8a301adcd788@linux.intel.com>
Date: Wed, 4 Mar 2026 09:29:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/dp: Add definition for Panel Replay full-line
 granularity
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "Shankar, Uma" <uma.shankar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20260225074221.1744330-1-jouni.hogander@intel.com>
 <DM4PR11MB63607DE2CD6A445F51C9925DF472A@DM4PR11MB6360.namprd11.prod.outlook.com>
 <f84e9e8b9147cabfd86996c6d81d9767668db949.camel@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <f84e9e8b9147cabfd86996c6d81d9767668db949.camel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Queue-Id: D363A1FCA26
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[maarten.lankhorst@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Hey,

Den 2026-02-27 kl. 06:49, skrev Hogander, Jouni:
> On Thu, 2026-02-26 at 21:02 +0000, Shankar, Uma wrote:
>>
>>
>>> -----Original Message-----
>>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf
>>> Of Jouni
>>> Högander
>>> Sent: Wednesday, February 25, 2026 1:12 PM
>>> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
>>> Cc: Hogander, Jouni <jouni.hogander@intel.com>;
>>> dri-devel@lists.freedesktop.org
>>> Subject: [PATCH 1/2] drm/dp: Add definition for Panel Replay full-
>>> line granularity
>>>
>>> DP specification is saying value 0xff 0xff in PANEL REPLAY
>>> SELECTIVE
>>> UPDATE X GRANULARITY CAPABILITY registers (0xb2 and 0xb3) means
>>> full-
>>> line granularity. Add definition for this.
>>
>> I think it would be good to call this also out also in comment:
>> "The SU region width shall be equal to the horizontal width of the
>> timing being transported"
>> This clarifies what is meant by full line granularity here.
> 
> I will add this comment.
> 
>>
>>>
>>> Cc: dri-devel@lists.freedesktop.org
>>> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
>>> ---
>>>  include/drm/display/drm_dp.h | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/include/drm/display/drm_dp.h
>>> b/include/drm/display/drm_dp.h index
>>> e4eebabab975..8b15d3eeb716 100644
>>> --- a/include/drm/display/drm_dp.h
>>> +++ b/include/drm/display/drm_dp.h
>>> @@ -571,6 +571,8 @@
>>>  # define
>>> DP_PANEL_REPLAY_LINK_OFF_SUPPORTED_IN_PR_AFTER_ADAPTIVE_SYN
>>> C_SDP	(1 << 7)
>>>
>>>  #define DP_PANEL_REPLAY_CAP_X_GRANULARITY		0xb2
>>> +# define DP_PANEL_REPLAY_FULL_LINE_GRANULARITY		0xffff
>>
>> Space in #define can be removed.
> 
> I followed convention used elsewhere in drm_dp.h. I.e. register field
> definitions have this extra space. What do you think?
> 
> BR,
> Jouni Högander
Seems to be the convention here, so fine with me.

For merging through drm-intel:
Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

>>
>> With above fixed, Change looks good to me.
>> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
>>
>>>  #define DP_PANEL_REPLAY_CAP_Y_GRANULARITY		0xb4
>>>
>>>  /* Link Configuration */
>>> --
>>> 2.43.0
>>
> 

