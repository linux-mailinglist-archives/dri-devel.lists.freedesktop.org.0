Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EE36AB182
	for <lists+dri-devel@lfdr.de>; Sun,  5 Mar 2023 18:03:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A790C10E2FC;
	Sun,  5 Mar 2023 17:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3006::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF6F10E059
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Mar 2023 17:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202212;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cs38wfc5mA6Ce7PjoH6p87kmK5wNacamBUAKTex6r7g=; b=qe22YpgnnF/4k5vBiP4PiZPE+v
 Kzept7KD94dSh7ZhUebiOfCX1g9JBlvHGOMtjA1STDgm/DoMyqNIjpKiZeewCnYe1PJeMUov1Qwsy
 1pttcih54iFa+kBg8naVbyvgs5wiNA/c4/fnCjKhFuk9V6TkW2fcJUFefVQ12z+T8s8YUgInMCUrL
 4v7W3ockc7fiLUFcBWWINP3Y4PFkdqTwOzMLiufI/DxFS3VYnv7UOYLL02cMBaKQi+/Ytm1jmxiEO
 tuadt+Jj938r4d/QmKD4l5aXZp4kGTUKb34MPVCGevoB652QBBQ2rlbbZD/iDhFPKqXzZNmroahPT
 JgPlRMGg==;
Received: from [2a01:799:961:2c00:5fc6:a9a5:c042:d1cd] (port=36446)
 by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <noralf@tronnes.org>) id 1pYrlh-001823-0A;
 Sun, 05 Mar 2023 18:03:29 +0100
Message-ID: <aa580578-de68-736c-8568-2ff5887105a2@tronnes.org>
Date: Sun, 5 Mar 2023 18:03:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: gud: set PATH connector property
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>, Peter Stuge <peter@stuge.se>
References: <l85gVq-EKaN9dzH4I8FXxv-4FyPkLSh7R5SgmqwFuh-oBtzFXFfvK8VVnTdvWpKBDITXvGrnMM0VijQoUkXeWCMMaFb4GSYpaUcmXm2fvlM=@emersion.fr>
 <20230228123134.1311.qmail@stuge.se>
 <Rg-l1BDgSgbo04Mgca01xzLlg0MjL1P9SxE2GvPPQbOlkMLH1AtqvZ6zj6DItsDBfSIkScUbK4YIctzF57Y5Diinb99sXLqlgCCsAOEjNTc=@emersion.fr>
 <20230228151654.6175.qmail@stuge.se>
 <wuQMYhnV3GpWUX4DNccEvVlJspHv8B5GO_KUwDOd-Dp4Mj3yED93_ICPoPafUQuKjSgUSZYDSRenzpVmwu9ZuzK4G4NpkdYm_NtM2E83wMY=@emersion.fr>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <wuQMYhnV3GpWUX4DNccEvVlJspHv8B5GO_KUwDOd-Dp4Mj3yED93_ICPoPafUQuKjSgUSZYDSRenzpVmwu9ZuzK4G4NpkdYm_NtM2E83wMY=@emersion.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: noralf@tronnes.org, DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/2/23 13:01, Simon Ser wrote:
> On Tuesday, February 28th, 2023 at 16:16, Peter Stuge <peter@stuge.se> wrote:
> 
>> Simon Ser wrote:
>>
>>>>> Would it be possible to set the PATH connector property based on the
>>>>> USB port used by gud?
>>>>
>>>> Sadly not really easily.
>>>>
>>>> The physical topology underneath each host controller is stable but
>>>> bus numbers (usb1, usb2 etc.) are not.
>>>
>>> Oh, that's news to me. So if I unplug and replug a USB device, the bus
>>> number and bus device number might change?
>>
>> The bus number is stable as long as the bus (host controller) exists.
>>
>>> Or does this happen after a power-cycle? Or is this hardware-specific?
>>
>> Consider a host controller on a plug-in card, like ExpressCard (usb1)
>> and perhaps Thunderbolt (usb2) for a more modern example.
>>
>> The bus on each new host controller gets the next available bus number.
>>
>> Plug ExpressCard before Thunderbolt to get the order above. Unplug
>> both (usb1+usb2 disappear) then plug Thunderbolt back in before
>> ExpressCard; now Thunderbolt is usb1 and ExpressCard usb2.
> 
> Hm, right. With a first-come-first-served scheme, there is no way to
> have stable identifiers.
> 
> I'm having a look at prior art: udev has similar needs for network
> interface names. For USB they use [2] a scheme with
> port/config/interface. I have no idea what meaning these have, but
> would they be useful for building a PATH KMS property?
> 
> [1]: https://www.freedesktop.org/software/systemd/man/systemd.net-naming-scheme.html
> [2]: https://github.com/systemd/systemd/blob/7a67afe33192ce4a55e6825b80554fb4ebbb4b03/src/udev/udev-builtin-net_id.c#L758
> 

I'm no expert but that looks like a good idea, it has probably been well
scrutinized.

Maybe we can do something like this, not tested:

/* PATH=usb:[[P<domain>]s<slot>[f<function>]]u<usbpath>o<connector-index> */
int drm_connector_set_path_property_usb(struct drm_connector *connector,
struct usb_interface *intf)
{
	u8 config = intf->cur_altsetting->desc.bAlternateSetting;
	u8 ifnum = intf->cur_altsetting->desc.bInterfaceNumber;
	struct usb_device *usb = interface_to_usbdev(intf);
	struct device *dev = &intf->dev;
	char path[255], temp[64];

	strlcpy(path, "usb:", sizeof(path));

	while (dev = dev->parent) {
		struct pci_dev *pci;

		if (dev->bus != &pci_bus_type)
			continue;

		pci = to_pci_dev(dev);

		if (pci_domain_nr(pci->bus)) {
			snprintf(temp, sizeof(temp), "P%u", pci_domain_nr(pci->bus));
			strlcat(path, temp, sizeof(path));
		}

		snprintf(temp, sizeof(temp), "s%u", PCI_SLOT(pci->devfn));
		strlcat(path, temp, sizeof(path));

		if (pci->multifunction) {
			snprintf(temp, sizeof(temp), "f%u", PCI_FUNC(pci->devfn));
			strlcat(path, temp, sizeof(path));
		}

		break;
	}

	snprintf(temp, sizeof(temp), "u%s", usb->devpath);
	strlcat(path, temp, sizeof(path));

	if (config) {
		snprintf(temp, sizeof(temp), "c%u", config);
		strlcat(path, temp, sizeof(path));
	}

	if (ifnum) {
		snprintf(temp, sizeof(temp), "i%u", ifnum);
		strlcat(path, temp, sizeof(path));
	}

	snprintf(temp, sizeof(temp), "o%s", connector->index);
	strlcat(path, temp, sizeof(path));

	return drm_connector_set_path_property(connector, path);
}

Noralf.
