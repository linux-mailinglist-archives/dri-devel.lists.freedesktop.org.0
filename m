Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YH2LGRP2eWkE1QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 12:42:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C84A0AEE
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 12:42:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89BC710E6AE;
	Wed, 28 Jan 2026 11:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IIG97y2h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DACC10E6AB;
 Wed, 28 Jan 2026 11:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769600527; x=1801136527;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=7V57PF/K4KWB0Lf/aLPtIvJRf80T3BVClO24KED1RdQ=;
 b=IIG97y2h+kwDvv1E6A2u1lrkR8P6M+jApvpwH0p0mNPieR1VzUh+jiGh
 8y4uH7mLq3c5eW87Y8uO05YTDIQJ9M/0xc0cZ4EvgwqlaCTgEqC9BdyBa
 lRzNlQfdKTxvrdvS2W8c1m/GIlWrtIk84JohqGaDen7S3WmC942sHROVr
 lAkNjRA9cF56e7FCTDJGeQTB6XsL51TYaxwu/6zeNQKNHyBJy+x97k3au
 4bz1t//7IfAJtenDrEHQzCUk7LG5I8PHV1zgkc0MFSh5w7ZZV+c4rMASG
 gL+Nx4Tcc97INDlLaaP51RYFhO+R6e5vPQdHdKt0h9cgH1qNrN2YYaZBL w==;
X-CSE-ConnectionGUID: a5kvkBKJQnWJFhLq/6X5eA==
X-CSE-MsgGUID: 6hpX4O4MQw6lcB1YoCqG0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70704886"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="70704886"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 03:42:06 -0800
X-CSE-ConnectionGUID: EEfl5fiRT1eatRGG6hIgPA==
X-CSE-MsgGUID: kQH+rG8mS3KpGLXTFW6jnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="213114894"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.207])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 03:42:02 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: airlied@gmail.com, atharvatiwarilinuxdev@gmail.com,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, joonas.lahtinen@linux.intel.com,
 linux-kernel@vger.kernel.org, rodrigo.vivi@intel.com, simona@ffwll.ch,
 tursulin@ursulin.net, ville.syrjala@linux.intel.com
Subject: Re: [PATCH 2/2] drm/i915/display: Disable display for iMac's
In-Reply-To: <20260127183924.1109-1-atharvatiwarilinuxdev@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <bc778f93d4e2a18848bc93a51aed9b627bcbb2cf@intel.com>
 <20260127183924.1109-1-atharvatiwarilinuxdev@gmail.com>
Date: Wed, 28 Jan 2026 13:41:59 +0200
Message-ID: <c4cc37ed9b626155706d5b167935c65eb5fc139d@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,linux.intel.com,vger.kernel.org,intel.com,ffwll.ch,ursulin.net];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D5C84A0AEE
X-Rspamd-Action: no action

On Tue, 27 Jan 2026, Atharva Tiwari <atharvatiwarilinuxdev@gmail.com> wrote:
>>At a glance, this seems like the appropriate level.
>> 
>> What if you drop patch 2 and supply i915.disable_display=1 module
>> parameter? Or return false from intel_display_device_enabled().
>
> I added the i915.disable_display=1 module parameter and removed the patch
> , but then the display just goes blank, here are some logs:

Mmh, okay. Honestly, I still feel like this would be the better thing to
do, but I don't think I have the time to debug this further. Feels like
a rabbit hole. ;)

So I guess let's go with ignoring display completely. The way to go is
to extend has_no_display() with a struct dmi_system_id array, and use
dmi_check_system() on it. Even if it's just one, it'll be so much easier
to extend later on.

Something like this, completely untested of course:

static bool has_no_display(struct pci_dev *pdev)
{
	static const struct pci_device_id ids[] = {
		INTEL_IVB_Q_IDS(INTEL_VGA_DEVICE, 0),
		{}
	};

	static const struct dmi_system_id dmi_ids[] = {
		{
			.ident = "Apple iMac",
			.matches = {
				DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Apple Inc."),
				DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "iMac"),
			}
		},
		{}
	};

	return pci_match_id(ids, pdev) || dmi_check_system(dmi_ids);
}

Finally, it would really be super helpful if you could file a bug at the
fdo gitlab as described at [1], along with the full dmesg with debugs
enabled, running just patch 1, and then you could reference that issue
in the commit. So we'd have some info for posterity of what's actually
going on.


Thanks,
Jani.

-- 
Jani Nikula, Intel
