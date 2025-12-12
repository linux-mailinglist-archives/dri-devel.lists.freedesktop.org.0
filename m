Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E258CB996C
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 19:43:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5FBB10E932;
	Fri, 12 Dec 2025 18:43:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.b="n3413Qgi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2650 seconds by postgrey-1.36 at gabe;
 Fri, 12 Dec 2025 18:43:35 UTC
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com
 [148.163.147.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E1C910E932;
 Fri, 12 Dec 2025 18:43:35 +0000 (UTC)
Received: from pps.filterd (m0134421.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BCH3GoG1683500; Fri, 12 Dec 2025 17:59:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=pps0720; bh=np
 2iqSH8Ibpce3ROXqgezygwl7KnXhGd2HAk1dmKrUQ=; b=n3413QgilpGmfyWFsB
 1GzT6JHyTng5xY6KvEc8Y5R+ehsnWqQjr3unn8YSvlKKX5KMC51nVy8V2E8RtM5k
 BHlc7q1Wvp+ip3QKYufyWWumlq9LxbTfY5cFMxSXPlR/AzfZuxoXGOHDBSP8/w89
 uIKA0l05NtbJw2P5f978IdXmp/GF01H3CilKNx9LLwHeVWhr9UIUpJ53v8HdBQ37
 ilHfpUfH7X2MhXwkGPkNsldV3tjfudtpJrgDolcmo4tldwMAAb28X5A51tTotr3c
 g2MnTZxl+1hpvxrNYSny0bFjpocA89mZjqklSYjORJVuEwXv0AOr/IyrkMpX5oXl
 T6/w==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
 by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4b0myw1tps-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 12 Dec 2025 17:59:16 +0000 (GMT)
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 7885413064;
 Fri, 12 Dec 2025 17:59:16 +0000 (UTC)
Received: from ilogsc-qemu.local (unknown [16.231.227.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (Client did not present a certificate)
 by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTPS id 7A8B2801064;
 Fri, 12 Dec 2025 17:59:15 +0000 (UTC)
Date: Fri, 12 Dec 2025 11:59:04 -0600
From: Steve Wahl <steve.wahl@hpe.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: Simon Richter <Simon.Richter@hogyros.de>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Steve Wahl <steve.wahl@hpe.com>
Subject: Re: vgaarb, and bridges not capable of VGA forwarding
Message-ID: <aTxX6KSd2Uhnd8bQ@ilogsc-qemu.local>
References: <f5069152-3cb7-459e-9727-f5a25256fd9c@hogyros.de>
 <aTv93a2Sqpj88Low@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aTv93a2Sqpj88Low@intel.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDE0MyBTYWx0ZWRfX5EpFPrmBVLGn
 AI7tdvTKhIrlhocriMtkklk4Xw+lCFhLVniNXLv8VAoOTf7GiY+X5HO2r/9pfH9CkIdk53anmYw
 Pce/yh3sY8Y/R+/DwMJf+6gk7TQM5oQQAsuBUtOINS4PgFVqoUCynXNp2mqM/HpWuqMCd+zO0pR
 gklhyAzcUr9R/xczIf51MvBtYDpX3ntAB9ZMRzYekBrvvK0KdlGiX16ZP0DCv5hyjRNg5Kv1jxY
 3+M5Cuyx18zc/srtuRzBe4b7RObDArIRTht0npzRkrPu5CxBaAF15qMLFsXPiW9njFPHAo9UBdV
 BJFzWX+kxFSBN1y5uj5DwMTS18UY2Cy6vCtpujjhGZuH1XGrimKpWGrjHgUaG/Ro4KNPAUEMPo9
 K2uOCIMyBWc/awPqchAEfT6Ka8IvBQ==
X-Proofpoint-GUID: qwQ7n8Ys9kM1TlmNMgk89PMGxAmt4wm6
X-Proofpoint-ORIG-GUID: qwQ7n8Ys9kM1TlmNMgk89PMGxAmt4wm6
X-Authority-Analysis: v=2.4 cv=cc/fb3DM c=1 sm=1 tr=0 ts=693c57f4 cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=8nJEP1OIZ-IA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=kMc7RQFhNHtIPjlnOKUA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=Vxmtnl_E_bksehYqCbjh:22
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_05,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501
 clxscore=1011 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512120143
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

Hi,

I somehow missed the first message, but saw Ville's reply.  (HPE email
problem, possibly?  Corporate is finicky about some email things.)

I'm placing the one question I think I can answer inline below:

On Fri, Dec 12, 2025 at 01:34:53PM +0200, Ville Syrjälä wrote:
> On Thu, Dec 11, 2025 at 11:43:13PM +0900, Simon Richter wrote:
> > Hi,
> > 
> > (cc Steve Wahl because UV BIOS is tangentially involved)
> > (cc Ville Syrjala because of the recent thread about VGA arbiter)
> > 
> > I'm looking into
> > 
> >      https://urldefense.com/v3/__https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1824__;!!NpxR!gfuCvZx88l1D_2aox3_me1EFGcTVvba2mVU-c-8rLBWcQ2FLmMWTl4h8c7zasCBM-sAYW9EuoMXEyyVeedabAZEq2cQ$ 
> > 
> > again because I have a similar problem.
> > 
> > In pci_set_vga_state, we traverse the PCI bridges upwards, and set the 
> > VGA forwarding bit on all of them up to the root. Now I happen to have a 
> > root bridge that refuses to set this bit, so if I read it back after 
> > setting it, it is still unset.
> > 
> > TTBOMK, that is allowed in the PCI specification, and the correct way to 
> > indicate that a bridge cannot forward VGA accesses.
> > 
> > The smallest possible change is to read back the bridge control 
> > register, and if the bit is still unset, terminate the loop and return 
> > an error.
> > 
> > I'm trying to find out now if this is a good idea, and am a bit puzzled:
> > 
> > It appears the only place that can generate errors is 
> > pci_set_vga_state_arch, which is a dispatch mechanism with a single 
> > user, uv_bios_set_legacy_vga_target.
> > 
> > According to the comment, the errors generated here are -EINVAL, -ENOSYS 
> > and -EBUSY. The implementation returns the return value from an EFI 
> > call, which appears to be defined to be a negated POSIX errno number, so 
> > this has a high chance of being correct.
> > 
> > If pci_set_vga_state_arch does not return an error, the normal 
> > pci_set_vga_state function runs, and there is no way for the arch 
> > specific function to indicate that the rest of the function should not 
> > run. Is that intentional, or should the BIOS call replace the normal 
> > implementation?

Unfortunately, I have very little experience with VGA usage on our UV
platform, the majority of our kernel development work is done using a
serial console setup, so I don't know if I've even seen this function
exercised.  System test and customers may be different, however.

But it does seem obvious that for the UV platform, this BIOS call is
intended to be called in addition to, not instead of, the normal
implementation.  The original checkin comment for the uv_set_vga_state
comment:

    x86, uv: Update UV arch to target Legacy VGA I/O correctly.
    
    Add function to direct Legacy VGA I/O traffic to correct I/O Hub.
    
Most members of the UV platform have external node controllers (XNC,
aka Hubs) that essentially expand the number of sockets connected via
UPI.  So I expect that under these conditions we need the BIOS to set
up some routing in the Hubs, in addition to what the existing kernel
code does.

I think others on this list are probably better equipped to handle
the rest of the questions.

Thanks,

--> Steve Wahl, HPE

> > It also seems that vgaarb is the only caller, and it does not look at 
> > the return value from this function. So if I fix that, and propagate the 
> > error upwards, I first need a way to indicate that __try_vga_get failed 
> > without there being a conflict, and then I need all vga_get callers to 
> > have error handling. The latter sounds doable.
> > 
> > What I'm unsure about:
> > 
> > 1. Does this seem like a viable approach?
> > 
> > 2. What interface makes sense for returning an error here? This function 
> > is supposed to return the conflicting device -- should I just make this 
> > a PTR_ERR?
> > 
> > 3. What error would be appropriate for a bridge refusing to activate the 
> > VGA bit? It's not EIO, it's not EACCES, it's not EINVAL, the closest is 
> > probably ENOSYS, but even that feels wrong.
> > 
> > 4. How likely is it for this to break something else? Are there PCI 
> > bridges that forward VGA but implement the bridge control register 
> > incorrectly?
> > 
> >     Simon
> 
> I wonder how bad it would be to just tickle the VGA bit
> when the bridge is added. Basically something like:
> 
> if (BRIDGECTL.VGA) {
> 	bridge.has_vga = true;
> } else {
> 	BRIDGECTL.VGA = 1
> 	if (BRIDGECTL.VGA)
> 		bridge.has_vga = true;
> 	BRIDGECTL.VGA = 0
> }
> 
> Obviously there is a tiny race there where the bridge might
> temporarily forward VGA accesses to the wrong device. But
> maybe the race is small enough to not really matter? Or I
> guess if you're really worried about the race you could do
> this check under stop_machine() *shudder*.
> 
> BTW I recently posted this:
> https://lore.kernel.org/intel-gfx/20251208182637.334-1-ville.syrjala@linux.intel.com/ 
> where I'm trying to fix the mess around VGA accesses in i915/xe.
> Some of the more hacky things there should probably be properly
> fixed in vgaarb, but I don't really have the time/energy to
> deal with that right now.
> 
> -- 
> Ville Syrjälä
> Intel

-- 
Steve Wahl, Hewlett Packard Enterprise
