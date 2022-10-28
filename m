Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1F5610A5A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 08:34:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA0B10E772;
	Fri, 28 Oct 2022 06:34:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E107610E772
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 06:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1666938837; x=1698474837;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eJ18tpwwc/rpWlQ+O50RYQQCz6MqhUnD4QtQ9uWF9MA=;
 b=Giypiz8/ZzS9tglie9I/x4lvyoLTE3aOf4kQyTWb5DtzZSl4CX3romuD
 WiAwtnGKrxt3Jw1whI54f8mkrRWMNXXvQITad971h+jM9HEyEC0T4M6xu
 n6gA2RqKv7NnhfFB+friNPyR2+ansGhHkNlwoep8JPKnlz92r2DPFompB
 LeyEsYP1UKZSiGhXBQ9efcpZMx+GfaFuR0ibxUE/X3gvZG2v6gHo7LSKw
 1ESS56MNXqAqrfmjL3D65JuuK/o9vVF9+uN6f5msbOobjjH5/4Ad2eSWo
 58GVfIcaLOWyzr2uTRxm8L1sfz6YsyupcTzgIL9/bKkdMidNKrwD3bcMs g==;
X-IronPort-AV: E=Sophos;i="5.95,220,1661810400"; d="scan'208";a="27027102"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 28 Oct 2022 08:33:55 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Fri, 28 Oct 2022 08:33:55 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Fri, 28 Oct 2022 08:33:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1666938835; x=1698474835;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eJ18tpwwc/rpWlQ+O50RYQQCz6MqhUnD4QtQ9uWF9MA=;
 b=OqtW9tgQPGQlmvH2crBLpptIQ2qnxaATjwVGMZBRNTrK86G84kEVvSTm
 50yeTdXT/FYRUIxTi4AhLxvEWACGEFRw83KU2s2BqX5+R+0Sy+vKfqxoA
 +X0cpt7I/OOWYBTsB1u9bYDgn6Goh+0eg7NwvSkz+NXEB0gvM8cEPFXxo
 gkefGQ6OwjxJcPxwn5N9H0WKVdw4YuhSO/c/H9/MBXpc7bJRB9bdlK+GT
 U+JfAFVtCC8YYqqmproSWeIGSs9Ka4VEAGyUou9zPraiHg82V4vQ9OsSg
 ji5l+sIe17oti+FRUBOUs/AJyF/ONH6qPbNWLb5TpZolxKueZiY23HQ7p w==;
X-IronPort-AV: E=Sophos;i="5.95,220,1661810400"; d="scan'208";a="27027101"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 28 Oct 2022 08:33:54 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 9D695280056;
 Fri, 28 Oct 2022 08:33:54 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/2] drm/ofdrm: Cast PCI IDs to u32 for comparing
Date: Fri, 28 Oct 2022 08:33:49 +0200
Message-ID: <2204479.tdWV9SEqCh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <4d4a9515-facd-9dd3-1028-6a3622fe9da6@suse.de>
References: <20221027115707.17980-1-tzimmermann@suse.de>
 <5987066.DvuYhMxLoT@steina-w> <4d4a9515-facd-9dd3-1028-6a3622fe9da6@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: dri-devel@lists.freedesktop.org, javierm@redhat.com,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Am Donnerstag, 27. Oktober 2022, 16:04:34 CEST schrieb Thomas Zimmermann:
> * PGP Signed: 10/27/2022 at 04:04:34 PM
> 
> Hi
> 
> Am 27.10.22 um 15:07 schrieb Alexander Stein:
> > Hello Thomas,
> > 
> > Am Donnerstag, 27. Oktober 2022, 13:57:06 CEST schrieb Thomas Zimmermann:
> >> Properties of 32-bit integers are returned from the OF device tree
> >> as type __be32. Cast PCI vendor and device IDs from __be32 to u32
> >> before comparing them to constants. Fixes sparse warnings shown below.
> >> 
> >>    drivers/gpu/drm/tiny/ofdrm.c:237:17: warning: restricted __be32
> >>    degrades
> >> 
> >> to integer drivers/gpu/drm/tiny/ofdrm.c:238:18: warning: restricted
> >> __be32
> >> degrades to integer drivers/gpu/drm/tiny/ofdrm.c:238:54: warning:
> >> restricted __be32 degrades to integer
> >> 
> >> See [1] for the bug report.
> >> 
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> Link:
> >> https://lore.kernel.org/dri-devel/202210192208.D888I6X7-lkp@intel.com/ #
> >> [1] ---
> >> 
> >>   drivers/gpu/drm/tiny/ofdrm.c | 5 ++++-
> >>   1 file changed, 4 insertions(+), 1 deletion(-)
> >> 
> >> diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
> >> index 0e1cc2369afcc..0da8b248ccc6e 100644
> >> --- a/drivers/gpu/drm/tiny/ofdrm.c
> >> +++ b/drivers/gpu/drm/tiny/ofdrm.c
> >> @@ -231,8 +231,11 @@ static u64 display_get_address_of(struct drm_device
> >> *dev, struct device_node *of return address;
> >> 
> >>   }
> >> 
> >> -static bool is_avivo(__be32 vendor, __be32 device)
> >> +static bool is_avivo(__be32 vendor_id, __be32 device_id)
> >> 
> >>   {
> >> 
> >> +	u32 vendor = (__force u32)vendor_id;
> >> +	u32 device = (__force u32)device_id;
> > 
> > I don't have much context, but just from reading this, shouldn't this be
> > be32_to_cpu() instead?
> 
> I should have explained that in the commit message. The values are
> supposed to be in big endian. We compare to PCI ids. The code originally
> was taken from [1], which does the right thing. The next version will
> add this info to the commit message.
> 
> Best regards
> Thomas
> 
> [1]
> https://elixir.bootlin.com/linux/v6.0.5/source/drivers/video/fbdev/offb.c#L3
> 57

Thanks for the link. The commit message for that original change [2] indicates 
this was a fix on a Powerstation which happens to be a PowerPC aka big-endian.
This this happens to work as intended, but not on little-endian machines.
vendor_id is __be32 (big-endian) and you compare this to PCI_VENDOR_ID_ATI 
(0x1002) which is native-endian. I guess you see the problem.
See also [3] where a property is converted properly.

Thinking about it, instead of calling 'is_avivo(*vendor_p, *device_p)'
I'd prefer something like 'is_avivo(be32_to_cpup(vendor_p), 
be32_to_cpup(device_p))', so there is no need to pass __be32 around.

Best regards,
Alexander

[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
commit/?id=57a20d8fb0d2a05abe40abd6bb29e3f923721f1b
[3] https://elixir.bootlin.com/linux/v6.0.5/source/drivers/bus/fsl-mc/fsl-mc-bus.c#L1027

> > Best regards,
> > Alexander
> > 
> >> +
> >> 
> >>   	/* This will match most R5xx */
> >>   	return (vendor == PCI_VENDOR_ID_ATI) &&
> >>   	
> >>   	       ((device >= PCI_VENDOR_ID_ATI_R520 && device < 0x7800) ||




