Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEAD99A014
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 11:23:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6713210EA94;
	Fri, 11 Oct 2024 09:23:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q/owzOui";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6863E10E1E4;
 Fri, 11 Oct 2024 09:23:09 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4311c285bc9so7845905e9.3; 
 Fri, 11 Oct 2024 02:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728638588; x=1729243388; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=IOiecGXqXzNhTlmjmwy87hrmOfR1/dDXvFAQlfcGgBA=;
 b=Q/owzOuiZbbQGSUEdj9hXjwWCCxue8ikp1QZvWpjYZBrYUrngVq3rIgekV0HluLBLQ
 WPbxFFK3Lwl5LzjJvlGBTCM+B8AvOPWQB7y8zYgTWPa4cEljJVbLvJvSidoAED4ksQ85
 mjh0U1skFKlQkS4gZHuf73LXEn6T+GC4cifMOWg//nFFK3mecH1fSyT1PTLp/K1Xd5JS
 NnUmjqGf2UZV/yE8JEiiITum9jKr1b4RB5bKH665q46dJoEfZ28nG+fi8vS0quG64AWU
 LMT1/xST3M8lbVP2dY3iodkfmtw1oLqwtO9EXKhXaNQHyQpHYydakxw/4s0xP0VGF0rf
 CuHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728638588; x=1729243388;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IOiecGXqXzNhTlmjmwy87hrmOfR1/dDXvFAQlfcGgBA=;
 b=fnsIpM/IqryrgC1WNw9d8f3CR44egDCql+oUCrxj5SvonTG1GtwzbdRXNvPs8DAOpG
 70quaaGXfCy/i5CaMNueevn9mu6/Wq2FQ+0mTjodqkGliOmDtxI8wIYqPiL9AQqGaOvV
 /9Mb5/0DbOitkGjWtr4XMHLnFzViUQpvQU5Q321FOXdk5eT+zYcty0GThHkoa6QFh8KN
 ld5i8QaMirX83Dw/m2b1kY8eJSnInw025EWNe5CFVpZMXtQYL7SKs3bGECc+y5LWx5bi
 8fcOBrq38J9blgUFyZ1Ut0nEyXog1OMRuvvse7a9P3gARyb3gV4YNJHHtiD6OGp92lJc
 t+Jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7Xx5HUG15NO3ALhrKeJkrSvD/vZdcPIICBhJRtJ5h54eDOeFBsJ9OllU7WHTfly6gOLxoKKa+9Eg=@lists.freedesktop.org,
 AJvYcCVHR9RHNRV/bxopdaU5/jynPtzP7SgehHcg0o2nB9hURXTW/AenLbdaJJNwPbaJXm6k0IbD/5box1E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhCrE++qKVH27DwjlN7AAQP+gmHTj889686kaXQcsbZko9O2zo
 ujCsA5jcK1hrWpBe1ZE06k+zgH+bt3Vo9wX7sdSS9RSsUZOkkKTo
X-Google-Smtp-Source: AGHT+IFCpHTpf1SVzApNvm5UfTvlCRdGpiO+4ksGBDVfgzssVpTGLYWEJpO3lBAJlJMgphBJfhfG7g==
X-Received: by 2002:a05:600c:45cd:b0:42c:b4f1:f281 with SMTP id
 5b1f17b1804b1-4311df56f06mr14506995e9.34.1728638587406; 
 Fri, 11 Oct 2024 02:23:07 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d4b9180adsm3444614f8f.112.2024.10.11.02.23.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Oct 2024 02:23:06 -0700 (PDT)
Message-ID: <82416d60-36ec-4aac-b36c-83073b8354bd@gmail.com>
Date: Fri, 11 Oct 2024 11:23:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] PCI: Allow extending VF BAR within original
 resource boundary
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Cc: linux-pci@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kw@linux.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matt Roper <matthew.d.roper@intel.com>
References: <20240919223557.1897608-1-michal.winiarski@intel.com>
 <20240919223557.1897608-3-michal.winiarski@intel.com>
 <376713b2-6703-4fd2-b99f-cc67de4f267e@amd.com>
 <47iala6cl7tks7tw3wcrxm43y4xl4w24u6gfw5tekdcuabhndx@t37nyrqysrb5>
 <8fa25483-d6e2-4614-aa2a-c41af0529e5c@amd.com>
Content-Language: en-US
In-Reply-To: <8fa25483-d6e2-4614-aa2a-c41af0529e5c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Re-sending this as text from my private mail account since the AMD 
servers now seem to convert everything to HTML ^^.

Christian.

Am 11.10.24 um 10:57 schrieb Christian König:
> Am 10.10.24 um 10:59 schrieb Michał Winiarski:
>> On Fri, Sep 20, 2024 at 12:07:34PM +0200, Christian König wrote:
>>> Am 20.09.24 um 00:35 schrieb Michał Winiarski:
>>>> [SNIP]
>>>> @@ -487,6 +567,11 @@ static ssize_t sriov_numvfs_store(struct device *dev,
>>>>    		goto exit;
>>>>    	}
>>>> +	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
>>>> +		if (pdev->sriov->rebar_extend[i])
>>>> +			pci_iov_resource_do_extend(pdev, i + PCI_IOV_RESOURCES, num_vfs);
>>>> +	}
>>>> +
>>> That sounds like a really bad idea to me.
>>>
>>> Basically the suggestion is here that the PCI subsystem should silently
>>> extend and shrink the VF BARs when the number of VFs change?
>> Why do you think it's a bad idea? Everything is under PCI subsystem
>> control and the driver in charge has to explicitly opt-in to this
>> behavior on a per-BAR basis.
>
> And exactly that's a bad idea. The PCI subsystem shouldn't control 
> this, the driver should.
>
> At least for some devices we have tons of interactions with ACPI and 
> EFI. Only the driver does know for example when platform drivers which 
> might be in the way for a resize have been unloaded.
>
> From the past experience BAR resize should only be triggered by the 
> driver and never from the PCI subsystem while scanning the bus or 
> probing devices.
>
>>> Bjorn has the last word on that but I would say that instead the driver
>>> owning the PCIe device as hypervisor should resize the VF BARs to a desired
>>> size and that in turn restricts the number of VFs you can enable.
>> Then the PCI subsystem would silently change the driver_max_VFs (or new
>> variable, as driver_max_VFs is under PF control, so it's either new var
>> or checking VF BAR size in pci_sriov_set_totalvfs).
>
> Nope, the PCI subsystem should not magically adjust anything.
>
> What should happen instead is that the driver would call 
> pci_enable_sriov() with the number of virtual functions to enable and 
> the PCI subsystem then validates that number and return -EINVAL or 
> -ENOSPC if it won't work.
>
>> It also means that we have to do the maths to calculate the new VF limit
>> in both PCI subsystem and the caller.
>
> Well the point is that those calculations are different.
>
> What the subsystem does is to validate if with the number of requested 
> virtual functions the necessary resources will fit into the allocate 
> space.
>
> What the driver does previously is to either change the allocate space 
> or calculate the other way around and determine the maximum virtual 
> functions from the space available.
>
>> We can go this route as well - I just think it's cleaner to keep this
>> all under PCI subsystem control.
>
> I think that would be much cleaner, especially the PCI subsystem 
> shouldn't adjust any values given from the driver or even more general 
> overrule decisions the driver made.
>
> Instead proper error codes should be returned if some values don't 
> make sense or the subsystem isn't able to move around BARs currently 
> in use etc...
>
> Regards,
> Christian.
>
>> I'll keep the current behavior in v3, but I'm open to changing it.
>>
>> Thanks,
>> -Michał
>>
>>> Regards,
>>> Christian.
>>>
>>>>    	ret = pdev->driver->sriov_configure(pdev, num_vfs);
>>>>    	if (ret < 0)
>>>>    		goto exit;
>>>> @@ -881,8 +966,13 @@ static int sriov_init(struct pci_dev *dev, int pos)
>>>>    static void sriov_release(struct pci_dev *dev)
>>>>    {
>>>> +	int i;
>>>> +
>>>>    	BUG_ON(dev->sriov->num_VFs);
>>>> +	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++)
>>>> +		pci_iov_resource_do_restore(dev, i + PCI_IOV_RESOURCES);
>>>> +
>>>>    	if (dev != dev->sriov->dev)
>>>>    		pci_dev_put(dev->sriov->dev);
>>>> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
>>>> index e763b3fd4c7a2..47ed2633232aa 100644
>>>> --- a/drivers/pci/pci.h
>>>> +++ b/drivers/pci/pci.h
>>>> @@ -385,6 +385,7 @@ struct pci_sriov {
>>>>    	u16		subsystem_vendor; /* VF subsystem vendor */
>>>>    	u16		subsystem_device; /* VF subsystem device */
>>>>    	resource_size_t	barsz[PCI_SRIOV_NUM_BARS];	/* VF BAR size */
>>>> +	bool		rebar_extend[PCI_SRIOV_NUM_BARS];	/* Resize VF BAR */
>>>>    	bool		drivers_autoprobe; /* Auto probing of VFs by driver */
>>>>    };
>>>> diff --git a/include/linux/pci.h b/include/linux/pci.h
>>>> index 4cf89a4b4cbcf..c007119da7b3d 100644
>>>> --- a/include/linux/pci.h
>>>> +++ b/include/linux/pci.h
>>>> @@ -2364,6 +2364,7 @@ int pci_sriov_set_totalvfs(struct pci_dev *dev, u16 numvfs);
>>>>    int pci_sriov_get_totalvfs(struct pci_dev *dev);
>>>>    int pci_sriov_configure_simple(struct pci_dev *dev, int nr_virtfn);
>>>>    resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno);
>>>> +int pci_iov_resource_extend(struct pci_dev *dev, int resno, bool enable);
>>>>    void pci_vf_drivers_autoprobe(struct pci_dev *dev, bool probe);
>>>>    /* Arch may override these (weak) */
>>>> @@ -2416,6 +2417,8 @@ static inline int pci_sriov_get_totalvfs(struct pci_dev *dev)
>>>>    #define pci_sriov_configure_simple	NULL
>>>>    static inline resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno)
>>>>    { return 0; }
>>>> +static inline void pci_iov_resource_extend(struct pci_dev *dev, int resno, bool enable)
>>>> +{ return -ENODEV; }
>>>>    static inline void pci_vf_drivers_autoprobe(struct pci_dev *dev, bool probe) { }
>>>>    #endif
>

