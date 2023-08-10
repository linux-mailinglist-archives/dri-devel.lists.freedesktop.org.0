Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2974177882C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 09:26:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4DA10E67D;
	Fri, 11 Aug 2023 07:26:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F97210E182
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 12:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691669636; x=1723205636;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=M9K6xJx8RUvgRqMgb5Yj3IJ3eVGvba8EcAYj4FU72So=;
 b=QvjqPyqbfEj2uALaFVGPBAF3u0+iK+pqRBqE1bhDj1S9vk0+nVVI2BYm
 X1rdaHB3aT5jpSSFjZGuMvj+PDIh7MqjVGrHgLNTesGoHS8gsf3nzQ0Pu
 4130ln+yXW+S46baYiNYhxpJ639U8BrdkvqjIg2NamB3ql6OoCaVa2P1P
 w5jYUhN1A4OT2BMF9jriME5Bw5oSJsPOKuuaxVeE9TujPVd1HoUYpTCe6
 kqkjAhTGT6IO55cudiGFzOL5g8s4wVWLAcUyYMHRERXBkZqBv/oxOer1k
 q+jCodHJX2RbNyHLvqTAa/Mc67AMh8xwIt3PCureYRzeAWKtT6FGPmlkZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="356348133"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="356348133"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 05:13:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="735401276"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="735401276"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO
 ijarvine-mobl2.mshome.net) ([10.237.66.43])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 05:13:52 -0700
Date: Thu, 10 Aug 2023 15:13:49 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: suijingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH v2 07/11] PCI/VGA: vga_client_register() return -ENODEV
 on failure, not -1
In-Reply-To: <bfe424f2-6dad-c8c9-ec82-8eda70f23cdf@loongson.cn>
Message-ID: <1f288175-a290-6f19-d562-cf98f613323c@linux.intel.com>
References: <20230808223412.1743176-1-sui.jingfeng@linux.dev>
 <20230808223412.1743176-8-sui.jingfeng@linux.dev>
 <b1a964e-a94b-2316-eeaf-fec2b2fa833b@linux.intel.com>
 <bfe424f2-6dad-c8c9-ec82-8eda70f23cdf@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1008233500-1691669634=:1816"
X-Mailman-Approved-At: Fri, 11 Aug 2023 07:26:19 +0000
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
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>, linux-pci@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1008233500-1691669634=:1816
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 10 Aug 2023, suijingfeng wrote:
> On 2023/8/9 21:52, Ilpo Järvinen wrote:
> > On Wed, 9 Aug 2023, Sui Jingfeng wrote:
> > 
> > > From: Sui Jingfeng <suijingfeng@loongson.cn>
> > > 
> > Changelog body is missing.
> 
> 
> I thought that probably the Fixes tag could be taken as the body of this
> commit,
> since there are no warnings when I check the whole series with checkpatch.pl.
> 
> 
> > > Fixes: 934f992c763a ("drm/i915: Recognise non-VGA display devices")
> > > Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> > > ---
> > >   drivers/pci/vgaarb.c | 15 ++++++---------
> > >   1 file changed, 6 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
> > > index 811510253553..a6b8c0def35d 100644
> > > --- a/drivers/pci/vgaarb.c
> > > +++ b/drivers/pci/vgaarb.c
> > > @@ -964,7 +964,7 @@ EXPORT_SYMBOL(vga_set_legacy_decoding);
> > >    *
> > >    * To unregister just call vga_client_unregister().
> > >    *
> > > - * Returns: 0 on success, -1 on failure
> > > + * Returns: 0 on success, -ENODEV on failure
> > So this is the true substance of this change??
> > 
> Yes.
> 
> 
> > It doesn't warrant Fixes tag which requires a real problem to fix. An
> > incorrect comment is not enough.
> > 
> > I think the shortlog is a bit misleading as is because it doesn't in any
> > way indicate the problem is only in a comment.
> 
> But it's that commit(934f992c763a) alter the return value of
> vga_client_register(),
> which make the commit and code don't match anymore.

This is useful information, no point in withholding it which forces 
others to figure it out by looking that commit up so put that detail into 
the changelog body.

> >   I'd prefer to
> > initialize ret = 0 instead:
> > 
> > 	int ret = 0;
> > 	...
> > 	if (!vgadev) {
> > 		err = -ENODEV;
> > 		goto unlock;
> > 	}
> > 	...
> > unlock:
> > 	...
> > 
> 
> But this is same as the original coding style, no fundamental improve.
> The key point is to make the wrapped code between the spin_lock_irqsave() and
> spin_unlock_irqrestore() compact.
> my patch remove the necessary 'goto' statement and the 'bail' label.
> After apply my patch, the vga_client_register() function became as this:
> 
> int vga_client_register(struct pci_dev *pdev,
>         unsigned int (*set_decode)(struct pci_dev *pdev, bool decode))
> {
>     int ret = -ENODEV;
>     struct vga_device *vgadev;
>     unsigned long flags;
> 
>     spin_lock_irqsave(&vga_lock, flags);
>     vgadev = vgadev_find(pdev);
>     if (vgadev) {
>         vgadev->set_decode = set_decode;
>         ret = 0;
>     }
>     spin_unlock_irqrestore(&vga_lock, flags);
> 
>     return ret;
> }

I'm not too attached to either of the ways around since there's no 
correctness issues here. Feel free to ignore my alternative suggestion
(make the separate patch out of it in anycase).

-- 
 i.

--8323329-1008233500-1691669634=:1816--
