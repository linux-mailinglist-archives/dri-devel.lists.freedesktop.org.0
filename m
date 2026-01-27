Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAlMLrWleGnVrgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 12:47:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCF693D7A
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 12:47:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C07610E54D;
	Tue, 27 Jan 2026 11:46:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bJkpA0VB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88CE610E54D
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 11:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769514419; x=1801050419;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=Kk8a9FSr9F/qQGlMehCmUulagEZX/jAtBNaQNoWW9FA=;
 b=bJkpA0VBkfB7gTEjYi8LE2PDRXy0pVVLwBmUmj2/llACnUTdvU8QDJUF
 nZWlzjWeojBnaL0gRK3ZwjqRw4cIPZmgbxC15ylN+PnO9XMiQfxyhj/Ph
 zqDdiZVNEIucGEx+/Ge+mwlhwot8HmsdR9J1y41uTX6YxU+qeLUQ+/+tv
 i37Kd3uT9FHb+xpBBZj7P/+HbdvLJVbwmVNmIv2SmoCI/qhzmlIiYs0O8
 4sCRiOl1m2jAgKIZbF6w7Vl4P1FdsJ8OQtsrypwtgZ7IbAlKiOoe86KMl
 3GO8kwBjHevl2aayTyFX0Ty7pFZf+qTq9+nxqNn/HV1dEsToVFEZed7I1 w==;
X-CSE-ConnectionGUID: 9RcCsmowTwaXg3Yr4g63lg==
X-CSE-MsgGUID: 0yM1HZNYSPe5LnSM4seZUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81814173"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="81814173"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 03:46:58 -0800
X-CSE-ConnectionGUID: 91wVuJPvTzOOj3KaB+Kf9w==
X-CSE-MsgGUID: tyueqwKnQKu20ZRQDgBrAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="207081415"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.67])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 03:46:53 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 27 Jan 2026 13:46:49 +0200 (EET)
To: Mario Limonciello <mario.limonciello@amd.com>
cc: ogabbay@kernel.org, maciej.falkowski@linux.intel.com, 
 Hans de Goede <hansg@kernel.org>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
 Lizhi Hou <lizhi.hou@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, 
 max.zhen@amd.com, sonal.santan@amd.com, 
 platform-driver-x86@vger.kernel.org, VinitKumar.Shukla@amd.com, 
 Patil Rajesh Reddy <Patil.Reddy@amd.com>
Subject: Re: [PATCH V4] platform/x86/amd/pmf: Introduce new interface to
 export NPU metrics
In-Reply-To: <6467de90-7a03-4e15-a549-bc882b29d579@amd.com>
Message-ID: <ce45da68-9ef1-9391-95ee-8bcb614b0b51@linux.intel.com>
References: <20260115173448.403826-1-lizhi.hou@amd.com>
 <176892084537.15580.12089679537024504744.b4-ty@linux.intel.com>
 <6467de90-7a03-4e15-a549-bc882b29d579@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1908535892-1769514409=:1055"
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mario.limonciello@amd.com,m:ogabbay@kernel.org,m:maciej.falkowski@linux.intel.com,m:hansg@kernel.org,m:jeff.hugo@oss.qualcomm.com,m:lizhi.hou@amd.com,m:Shyam-sundar.S-k@amd.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,m:platform-driver-x86@vger.kernel.org,m:VinitKumar.Shukla@amd.com,m:Patil.Reddy@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ilpo.jarvinen@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+,1:+];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linux.intel.com:mid]
X-Rspamd-Queue-Id: 3DCF693D7A
X-Rspamd-Action: no action

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1908535892-1769514409=:1055
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 26 Jan 2026, Mario Limonciello wrote:

>=20
>=20
> On 1/20/2026 8:54 AM, Ilpo J=C3=A4rvinen wrote:
> > On Thu, 15 Jan 2026 09:34:48 -0800, Lizhi Hou wrote:
> >=20
> > > The PMF driver retrieves NPU metrics data from the PMFW. Introduce a =
new
> > > interface to make NPU metrics accessible to other drivers like AMDXDN=
A
> > > driver, which can access and utilize this information as needed.
> > >=20
> > >=20
> >=20
> >=20
> > Thank you for your contribution, it has been applied to my local
> > review-ilpo-next branch. Note it will show up in the public
> > platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> > local branch there, which might take a while.
> >=20
> > The list of commits applied:
> > [1/1] platform/x86/amd/pmf: Introduce new interface to export NPU metri=
cs
> >        commit: 15e19bd95be5c79f2f98b727edda002ba86f8d03
> >=20
> > --
> >   i.
> >=20
>=20
> Lizhi,
>=20
> One clarification.  What about the XDNA driver side of this change, are y=
ou
> still going to do it this cycle?
>=20
> If so; this either needs an immutable branch from Ilpo or that side of th=
e
> change needs to go through pdx86 as well.

Hi Mario,

I was told to me by Lizhi the xdna side patch not going to pursued in=20
this cycle [1] so I went with that and changing that now is not realistic=
=20
because of merges I've performed to for-next (I could have easily done=20
IB for the change back when applying the patch which would have been the=20
default but given that mention, I didn't bother).

[1] https://lore.kernel.org/all/93210832-aa75-7639-c9d2-99ec802d88e4@amd.co=
m/

--=20
 i.

--8323328-1908535892-1769514409=:1055--
