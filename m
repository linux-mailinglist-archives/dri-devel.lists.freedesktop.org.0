Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9577BD8F6
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 12:49:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 541DA10E25B;
	Mon,  9 Oct 2023 10:49:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D38210E27B;
 Mon,  9 Oct 2023 10:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696848580; x=1728384580;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=Yiwzmx2e2Ap23rek9RN1pQZOdIHRNwqKb4bQdsfEJSc=;
 b=lGj+dRxdfaNkZzlnP0Uckbm5cDswwVu2WgOj86vV/ljbT+ltoy3KyANy
 UMV7GdxmyZZLRpxIGrQUe14Q6hkiedriMx0vIqOFnkROfNQk8VTogVoxF
 sEDPhgdTOm4YAoMiEKBdZTTGafW94HKQznA/vbGZp65IzvxnFDyIip7Ae
 y7ZX2ykaiq0JDXJyszNE+0+bmmjhfedTvsxKz8bfM53mLcejAL/iqZDGc
 VSSpGvHk9FxdpNXldye7/Hj+PkCTHxMlf2OEX7Vg0N73gdeP5WrnOwJhx
 C9eIaiztS7ku8yWyDWo9mkgSxbQjqlrKAVoCVdRfE7nHVR83NqcbaPwZy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="450614326"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="450614326"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 03:49:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="876756441"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="876756441"
Received: from lshebash-mobl3.ccr.corp.intel.com ([10.252.57.254])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 03:49:35 -0700
Date: Mon, 9 Oct 2023 13:49:32 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH v2 04/16] platform/x86/amd/pmf: Add support for PMF Policy
 Binary
In-Reply-To: <6a0a2b8c-b942-4029-bf3c-4f20c4492795@amd.com>
Message-ID: <de4748f3-3961-4fc1-5258-a71f3742c4@linux.intel.com>
References: <20230930083715.2050863-1-Shyam-sundar.S-k@amd.com>
 <20230930083715.2050863-5-Shyam-sundar.S-k@amd.com>
 <d05080a8-1d9f-f36c-6569-f81a94258f7a@linux.intel.com>
 <6a0a2b8c-b942-4029-bf3c-4f20c4492795@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-716636749-1696848579=:1721"
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
Cc: Xinhui.Pan@amd.com, Patil.Reddy@amd.com, basavaraj.natikar@amd.com,
 dri-devel@lists.freedesktop.org, jikos@kernel.org,
 amd-gfx@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 markgross@kernel.org, Hans de Goede <hdegoede@redhat.com>,
 benjamin.tissoires@redhat.com, mario.limonciello@amd.com,
 linux-input@vger.kernel.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-716636749-1696848579=:1721
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 9 Oct 2023, Shyam Sundar S K wrote:
> On 10/4/2023 5:30 PM, Ilpo Järvinen wrote:
> > On Sat, 30 Sep 2023, Shyam Sundar S K wrote:
> > 
> >> PMF Policy binary is a encrypted and signed binary that will be part
> >> of the BIOS. PMF driver via the ACPI interface checks the existence
> >> of Smart PC bit. If the advertised bit is found, PMF driver walks
> >> the acpi namespace to find out the policy binary size and the address
> >> which has to be passed to the TA during the TA init sequence.
> >>
> >> The policy binary is comprised of inputs (or the events) and outputs
> >> (or the actions). With the PMF ecosystem, OEMs generate the policy
> >> binary (or could be multiple binaries) that contains a supported set
> >> of inputs and outputs which could be specifically carved out for each
> >> usage segment (or for each user also) that could influence the system
> >> behavior either by enriching the user experience or/and boost/throttle
> >> power limits.
> >>
> >> Once the TA init command succeeds, the PMF driver sends the changing
> >> events in the current environment to the TA for a constant sampling
> >> frequency time (the event here could be a lid close or open) and
> >> if the policy binary has corresponding action built within it, the
> >> TA sends the action for it in the subsequent enact command.
> >>
> >> If the inputs sent to the TA has no output defined in the policy
> >> binary generated by OEMs, there will be no action to be performed
> >> by the PMF driver.
> >>
> >> Example policies:
> >>
> >> 1) if slider is performance ; set the SPL to 40W
> >> Here PMF driver registers with the platform profile interface and
> >> when the slider position is changed, PMF driver lets the TA know
> >> about this. TA sends back an action to update the Sustained
> >> Power Limit (SPL). PMF driver updates this limit via the PMFW mailbox.
> >>
> >> 2) if user_away ; then lock the system
> >> Here PMF driver hooks to the AMD SFH driver to know the user presence
> >> and send the inputs to TA and if the condition is met, the TA sends
> >> the action of locking the system. PMF driver generates a uevent and
> >> based on the udev rule in the userland the system gets locked with
> >> systemctl.
> >>
> >> The intent here is to provide the OEM's to make a policy to lock the
> >> system when the user is away ; but the userland can make a choice to
> >> ignore it.
> >>
> >> and so on.
> >>
> >> The OEMs will have an utility to create numerous such policies and
> >> the policies shall be reviewed by AMD before signing and encrypting
> >> them. Policies are shared between operating systems to have seemless user
> >> experience.
> >>
> >> Since all this action has to happen via the "amdtee" driver, currently
> >> there is no caller for it in the kernel which can load the amdtee driver.
> >> Without amdtee driver loading onto the system the "tee" calls shall fail
> >> from the PMF driver. Hence an explicit "request_module" has been added
> >> to address this.
> >>
> >> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

> >> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> >> index 678dce4fea08..787f25511191 100644
> >> --- a/drivers/platform/x86/amd/pmf/core.c
> >> +++ b/drivers/platform/x86/amd/pmf/core.c
> >> @@ -384,6 +384,18 @@ static int amd_pmf_probe(struct platform_device *pdev)
> >>  		return -ENOMEM;
> >>  
> >>  	dev->dev = &pdev->dev;
> >> +	err = apmf_check_smart_pc(dev);
> >> +	if (!err) {
> >> +		/* in order for Smart PC solution to work it has a hard dependency
> >> +		 * on the amdtee driver to be loaded first even before the PMF driver
> >> +		 * loads. PMF ASL has a _CRS method that advertises the existence
> >> +		 * of Smart PC bit. If this information is present, use this to
> >> +		 * explicitly probe the amdtee driver, so that "tee" plumbing is done
> >> +		 * before the PMF Smart PC init happens.
> >> +		 */
> > 
> > But please follow no-text on /* line formatting for multiline comments. 
> > Also start with a capital letter.
> > 
> > 
> >> +		if (request_module("amdtee"))
> > 
> > Are you aware that this won't give you very strong guarantees about 
> > anything if request_module()'s function comments is to be believed?
> > 
> > If that's all what you're after, MODULE_SOFTDEP("pre: amdtee"); is 
> > probably enough (and I unfortunately don't know the answer how to do it if 
> > you want something stronger than that when you don't directly depend on 
> > the symbols of the other module).
> 
> MODULE_SOFTDEP("pre: amdtee"); did not help.

So how was this module loaded then? I suppose if the user does insmod, the 
softdep wouldn't be honored but modprobe should load the dependencies 
first.

> There is no consumer loading the 'amdtee' driver today in the kernel.
> Even now with this change, the pmf driver calls the TEE subsystem APIs
> that will eventually land in amdtee code.
>
> So the call flow would be:
> pmf driver-> tee subsystem -> amdtee driver -> ASP

Right, and that indirect route is why it won't be made as hard 
dependency.

> IMO, in order to make this link work request_module() would be
> required. Is that OK to retain request_module() in v3?

Fine.

> >> +	struct ta_pmf_enact_result policy_apply_table;
> >> +	u32 rsvd[906];
> > 
> > This is some size (SZ_1K?) - sizeof(ta_pmf_enact_result)? I don't know if 
> > compiler would like such a construct though in the array declaration. If 
> > the compiler isn't complaining it would be the most informative way to 
> > state the size but if it's not happy, a comment might be useful.
> 
> This is a reserved space for future use. And that's the same way
> defined in the FW as well. If I play with the sizes, the FW (PMF TA)
> starts to misbehave and does not provide outputs all the time.
> 
> Like you mentioned, are you Ok if I just put a comment as "reserved
> space for future use"?

You can put the comment if you want but I understood that even without 
the comment. I was just interested in how that magic number 906 was 
derived and if it could have been better defined.

I think you can leave the line as is.

-- 
 i.

--8323329-716636749-1696848579=:1721--
