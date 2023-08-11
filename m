Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8DB778822
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 09:26:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D5810E66B;
	Fri, 11 Aug 2023 07:26:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACABD10E662
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 06:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691735484; x=1723271484;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=V7PsEkPjhDBm1ENkVpxF6OMUVudl/gPj3e7UY4Zbwrc=;
 b=SF74kWAanqmhu8F2pX7MECYz/55d8SBqiI+RKrKkOWVwb+3QWoJrvOsh
 IAwCdhzaAmgpKqTwBXmc5LzW2egyUpmOFkuN7aHq6OhJRB01I28LMJzI0
 9IPU53s1IwwNodPgU3laXJoLykwT10UH5wPgya+765zvWGlAyqcoftvvR
 ZQWW65f1EobA0SxoibjB/nkJ+w6g5rVsTavNSKi6v4AJ/L33EIrH9g+pt
 RgNbR6vUzl7dOeeWUk9708WpHn1xcz5DscNB5fWKl+Y+VQHDSfdwYo6xa
 Lxmokbl/mdSq55T9dSW1dHF797H+ajIpn+r9OtaKbTi5YaSb0+cUAP8hX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="356571516"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="356571516"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 23:31:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="822550154"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="822550154"
Received: from aberko-mobl1.ger.corp.intel.com ([10.252.51.87])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 23:31:21 -0700
Date: Fri, 11 Aug 2023 09:31:15 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: suijingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH v2 02/11] PCI: Add the pci_get_class_masked() helper
In-Reply-To: <a0d6277c-a4ad-38a5-bc6f-883513987547@loongson.cn>
Message-ID: <9e512f44-c47f-85e8-0ea-81d7cbc99a67@linux.intel.com>
References: <20230808223412.1743176-1-sui.jingfeng@linux.dev>
 <20230808223412.1743176-3-sui.jingfeng@linux.dev>
 <19dc4b81-5b72-247c-d459-3ea9d1cddff0@linux.intel.com>
 <a0d6277c-a4ad-38a5-bc6f-883513987547@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1349199904-1691734933=:1742"
Content-ID: <50a536e7-4387-1688-4c95-d3496f7b66d@linux.intel.com>
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

--8323329-1349199904-1691734933=:1742
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <c27f82a-0f7-f05b-1721-225a83cded3@linux.intel.com>

On Thu, 10 Aug 2023, suijingfeng wrote:

> Hi,
> 
> 
> On 2023/8/9 22:01, Ilpo Järvinen wrote:
> > On Wed, 9 Aug 2023, Sui Jingfeng wrote:
> > 
> > > From: Sui Jingfeng <suijingfeng@loongson.cn>
> > > 
> > > Because there is no good way to get the mask member used to searching for
> > > devices that conform to a specific PCI class code, an application needs to
> > > process all PCI display devices can achieve its goal as follows:
> > This is mixing old and new way in a single sentence (which is confusing)?
> 
> 
> Thanks for reviewing, but I can't understand this sentence.
> Are you telling me that my description have grammar problem or something else?

I think it's a bit of both.

> I means that before apply this patch, we don't have a function can be used
> to get all PCI(e) devices in a system by matching against its the PCI base
> class code only,
> while keep the Sub-Class code and the Programming Interface ignored.
> By supply a mask as argument, such thing become possible.

This explanation you put into this reply is much easier to follow and 
understand. I recommend you'd use it to replace the unclear fragment 
above. So something along the lines of:

  There is no function that can be used to get all PCI(e) devices in a 
  system by matching against its the PCI base class code only, while keep 
  the Sub-Class code and the Programming Interface ignored.

  Add pci_get_class_masked() to allow supplying a mask for the get.

  [After this you can put the explanining code block+its intro if you 
   want]

-- 
 i.

> If an application want to process all PCI display devices in the system,
> then it can achieve its goal by calling pci_get_class_masked() function.
> 
> 
> > > pdev = NULL;
> > > do {
> > > 	pdev = pci_get_class_masked(PCI_BASE_CLASS_DISPLAY << 16, 0xFF0000,
> > > pdev);
> > > 	if (pdev)
> > > 		do_something_for_pci_display_device(pdev);
> > > } while (pdev);
> > > 
> > > While previously, we just can not ignore Sub-Class code and the
> > > Programming
> > cannot
> > 
> > > Interface byte when do the searching.
> > doing the search.
> 
> 
> OK, will be fixed at the next version.
> 
> 
> > > Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> > > ---
> > >   drivers/pci/search.c | 30 ++++++++++++++++++++++++++++++
> > >   include/linux/pci.h  |  7 +++++++
> > >   2 files changed, 37 insertions(+)
> > > 
> > > diff --git a/drivers/pci/search.c b/drivers/pci/search.c
> > > index b4c138a6ec02..f1c15aea868b 100644
> > > --- a/drivers/pci/search.c
> > > +++ b/drivers/pci/search.c
> > > @@ -334,6 +334,36 @@ struct pci_dev *pci_get_device(unsigned int vendor,
> > > unsigned int device,
> > >   }
> > >   EXPORT_SYMBOL(pci_get_device);
> > >   +/**
> > > + * pci_get_class_masked - begin or continue searching for a PCI device by
> > > class and mask
> > > + * @class: search for a PCI device with this class designation
> > > + * @from: Previous PCI device found in search, or %NULL for new search.
> > > + *
> > > + * Iterates through the list of known PCI devices.  If a PCI device is
> > No double spaces in kernel comments. Perhaps your editor might be adding
> > them on reflow (might be configurable to not do that).
> > 
> > > + * found with a matching @class, the reference count to the device is
> > > + * incremented and a pointer to its device structure is returned.
> > > + * Otherwise, %NULL is returned.
> > > + * A new search is initiated by passing %NULL as the @from argument.
> > > + * Otherwise if @from is not %NULL, searches continue from next device
> > > + * on the global list.  The reference count for @from is always
> > > decremented
> > > + * if it is not %NULL.
> > Use kerneldoc's Return: section for describing return value.
> > 
> > > + */
> > > +struct pci_dev *pci_get_class_masked(unsigned int class, unsigned int
> > > mask,
> > > +				     struct pci_dev *from)
> > > +{
> > > +	struct pci_device_id id = {
> > > +		.vendor = PCI_ANY_ID,
> > > +		.device = PCI_ANY_ID,
> > > +		.subvendor = PCI_ANY_ID,
> > > +		.subdevice = PCI_ANY_ID,
> > > +		.class_mask = mask,
> > > +		.class = class,
> > > +	};
> > > +
> > > +	return pci_get_dev_by_id(&id, from);
> > > +}
> > > +EXPORT_SYMBOL(pci_get_class_masked);
> > > +
> > >   /**
> > >    * pci_get_class - begin or continue searching for a PCI device by class
> > >    * @class: search for a PCI device with this class designation
> > > diff --git a/include/linux/pci.h b/include/linux/pci.h
> > > index 0ff7500772e6..b20e7ba844bf 100644
> > > --- a/include/linux/pci.h
> > > +++ b/include/linux/pci.h
> > > @@ -1180,6 +1180,9 @@ struct pci_dev *pci_get_slot(struct pci_bus *bus,
> > > unsigned int devfn);
> > >   struct pci_dev *pci_get_domain_bus_and_slot(int domain, unsigned int
> > > bus,
> > >   					    unsigned int devfn);
> > >   struct pci_dev *pci_get_class(unsigned int class, struct pci_dev *from);
> > > +struct pci_dev *pci_get_class_masked(unsigned int class, unsigned int
> > > mask,
> > > +				     struct pci_dev *from);
> > > +
> > >   int pci_dev_present(const struct pci_device_id *ids);
> > >     int pci_bus_read_config_byte(struct pci_bus *bus, unsigned int devfn,
> > > @@ -1895,6 +1898,10 @@ static inline struct pci_dev
> > > *pci_get_class(unsigned int class,
> > >   					    struct pci_dev *from)
> > >   { return NULL; }
> > >   +static inline struct pci_dev *pci_get_class_masked(unsigned int class,
> > > +						   unsigned int mask,
> > > +						   struct pci_dev *from)
> > > +{ return NULL; }
> > >     static inline int pci_dev_present(const struct pci_device_id *ids)
> > >   { return 0; }
> > > 
> 
--8323329-1349199904-1691734933=:1742--
