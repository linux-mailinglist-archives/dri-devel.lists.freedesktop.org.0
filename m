Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC5E8AF8FB
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 23:37:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C1AF11370C;
	Tue, 23 Apr 2024 21:37:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="da+QMyFw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05BF111370C
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 21:37:20 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5196c755e82so8687751e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 14:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713908239; x=1714513039; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kKOy2Onz2bduMvgffnfy+AJO486vYEEqceDBb9NrREg=;
 b=da+QMyFwzwgSu5128GWeNrUBWXymmYw/Y9OFIAkEqH607OUlwQQL6IV0TIEVi9i97C
 RuIV4PSoLbEd/JBweEafS4dqRlPxtb+uHkHkfaby9+YTGw2qCEjxuJfSkv2d5G8FOwOy
 oXCxXkEVqYiNs7ml8apcQQs4sljSyqXE5h0Sud3p+1IFekDBwYJKsJutBfCFq4KDyu2f
 rsU+TaXQds4oPyeCJXUca91tXNaQkIeAtWJwCWV5REwSX2MuTZYuSBg0Vt7wLd1mHTrX
 iWmDkbFpfA2SY1LZa4S3Jpn8gOWS5XeX3xpP9d3UkVwlXYan1ol6QzFKPmSk96SSuw1y
 +eJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713908239; x=1714513039;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kKOy2Onz2bduMvgffnfy+AJO486vYEEqceDBb9NrREg=;
 b=bDKVrbo5qjiGmZWxF9QBk8QzJd/s03D+Xl+3qdyKEuHwiNNtFMU4BMFN2EASQuguaN
 Vln5OEfwyaLmUh0KPemlxj26HrFo8tysdlGtHpJf4EstZkk6/tChE2wDv8DRIxwRu10d
 ot4+PITlZ27KM3ZA/auUeGs+k5Sl1y5XFUKYz9QhVseUjrwMicy2HuugAXYqfk9KXhuz
 Fhgwqv9WT04xKtzkfJMtSn65xrZ1W/ijcKzO5Lwhd1lGge1MyvwUlYMjnV7Y5tGsniEO
 z+0t1fa5TwZ6qh2hRDfNwBxEM3KX61u+4R9cO9cDWcIut+soT91mUY6wJOg7nW+P236t
 aF/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUa+HajxBZ/qDlAIngyVRe6IpJcaJIbegrkXAeo8FrCRc4k+kwaUcgBZBvL75sxo/fQyblN6fM63eNx7f9ZTm9MTtpzBanmBxlBIH0Rl1Fy
X-Gm-Message-State: AOJu0YxDRVXBHm2ulpxu+Bxaikq45845Bk77CqxSx/bju5oKmHL6DkEA
 mqfUUdJVuChSMoVuImWuMNYdqNQYFtr8++rfrG7JTknbMupvK/rr/vrHoj5WjeA=
X-Google-Smtp-Source: AGHT+IFhnEsRYFD47ZvSWkX1FG81VjWRs/SY/nRUlZync6a5WrqbJRPkpMZiNNvrwk7zI1JAlXIBsA==
X-Received: by 2002:a05:6512:33c8:b0:51b:6f06:92f2 with SMTP id
 d8-20020a05651233c800b0051b6f0692f2mr600890lfg.33.1713908238937; 
 Tue, 23 Apr 2024 14:37:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 q20-20020ac24a74000000b00518bf46ff83sm2143505lfp.4.2024.04.23.14.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 14:37:18 -0700 (PDT)
Date: Wed, 24 Apr 2024 00:37:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v2] software node: Implement device_get_match_data fwnode
 callback
Message-ID: <hcltp2bbxxg2t7ibmzgiib7mgbwgmvzwnnq6mochdh7c4h76r3@bxj6yk5zq64e>
References: <20240422164658.217037-1-sui.jingfeng@linux.dev>
 <Zie3ebHOEpWHj1qV@smile.fi.intel.com>
 <d5bc1e73-a553-451e-ab74-f5f0ca259c6b@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d5bc1e73-a553-451e-ab74-f5f0ca259c6b@linux.dev>
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

On Wed, Apr 24, 2024 at 12:49:18AM +0800, Sui Jingfeng wrote:
> Hi,
> 
> Thanks a for you reviewing my patch.
> 
> 
> On 2024/4/23 21:28, Andy Shevchenko wrote:
> > On Tue, Apr 23, 2024 at 12:46:58AM +0800, Sui Jingfeng wrote:
> > > Because the software node backend of the fwnode API framework lacks an
> > > implementation for the .device_get_match_data function callback. This
> > > makes it difficult to use(and/or test) a few drivers that originates
> > Missing space before opening parenthesis.
> 
> OK, will be fixed at the next version.
> 
> 
> > > from DT world on the non-DT platform.
> > > 
> > > Implement the .device_get_match_data fwnode callback, device drivers or
> > > platform setup codes are expected to provide a string property, named as
> > > "compatible", the value of this software node string property is used to
> > > match against the compatible entries in the of_device_id table.
> > Yep and again, how is this related? If you want to test a driver originating
> > from DT, you would probably want to have a DT (overlay) to be provided.
> 
> There are a few reasons, please fixed me if I'm wrong.
> 
> DT (overlay) can be possible solution, but DT (overlay) still depend on DT.
> For example, one of my x86 computer with Ubuntu 22.04 Linux/x86 6.5.0-28-generic
> kernel configuration do not has the DT enabled. This means that the default kernel
> configuration is decided by the downstream OS distribution. It is not decided by
> usual programmers. This means that out-of-tree device drivers can never utilize
> DT or DT overlay, right?

No, this is not fully correct. The drivers anyway have to adopted for
the platforms they are used with. It is perfectly fine to have a driver
that supports both DT and ACPI at the same time.

> 
> I means that Linux kernel is intended to be used by both in-tree drivers and out-of-tree drivers.
> Out-of-tree device drivers don't have a chance to alter kernel config, they can only managed to
> get their source code compiled against the Linux kernel the host in-using.
> 
> Some out-of-tree device drivers using DKMS to get their source code compiled,
> with the kernel configuration already *fixed*. So they don't have a opportunity
> to use DT overlay.
> 
> Relying on DT overlay is *still* *DT* *dependent*, and I not seeing matured solution
> get merged into upstream kernel yet. However, software node has *already* been merged
> into Linux kernel. It can be used on both DT systems and non-DT systems. Software node
> has the least requirement, it is *handy* for interact with drivers who only need a small
> set properties.
> 
> In short, I still think my patch maybe useful for some peoples. DT overlay support on
> X86 is not matured yet, need some extra work. For out-of-tree kernel module on
> downstream kernel. Select DT and DT overlay on X86 is out-of-control. And I don't want
> to restrict the freedom of developers.

I don't think upstream developers care about the downstream kernels.

But let me throw an argument why this patch (or something similar) looks
to be necessary.

Both on DT and non-DT systems the kernel allows using the non-OF based
matching. For the platform devices there is platform_device_id-based
matching.

Currently handling the data coming from such device_ids requires using
special bits of code, e.g. platform_get_device_id(pdev)->driver_data to
get the data from the platform_device_id. Having such codepaths goes
against the goal of unifying DT and non-DT paths via generic property /
fwnode code.

As such, I support Sui's idea of being able to use device_get_match_data
for non-DT, non-ACPI platform devices.

Sui, if that fits your purpose, please make sure that with your patch
(or the next iteration of it) you can get driver_data from the matched
platform_device_id.

> 
> 
> > > This also helps to keep the three backends of the fwnode API aligned as
> > > much as possible, which is a fundamential step to make device driver
> > > OF-independent truely possible.
> > > 
> > > Fixes: ffb42e64561e ("drm/tiny/repaper: Make driver OF-independent")
> > > Fixes: 5703d6ae9573 ("drm/tiny/st7735r: Make driver OF-independent")
> > How is it a fix?
> 
> 
> Because the drm/tiny/repaper driver and drm/tiny/st7735r driver requires extra
> device properties. We can not make them OF-independent simply by switching to
> device_get_match_data(). As the device_get_match_data() is a *no-op* on non-DT
> environment.

This doesn't constitute a fix. It's not that there is a bug that you are
fixing. You are adding new feature ('support for non-DT platforms').

> 
> Hence, before my patch is applied, the two "Make driver OF-independent" patch
> have no effect. Using device_get_match_data() itself is exactly *same* with
> using of_device_get_match_data() as long as the .device_get_match_data hook is
> not implemented.
> 
> 
> See my analysis below:
> 
> When the .device_get_match_data hook is not implemented:
> 
> 1) On DT systems, device_get_match_data() just redirect to of_fwnode_device_get_match_data(),
>    which is just a wrapper of of_device_get_match_data().
> 
> 2) On Non-DT system, device_get_match_data() has *ZERO* effect, it just return NULL.
> 
> 
> Therefore, device_get_match_data() adds *ZERO* benefits to the mentioned drivers if
> the .device_get_match_data is not implemented.
> 
> Only when the .device_get_match_data hook get implemented, device_get_match_data()
> can redirect tosoftware_node_get_match_data() function in this patch.
> Therefore, the two driver has a way to get a proper driver match data on
> non-DT environment. Beside, the users of those two driver can provide
> additional software node property at platform setup code. as long as at
> somewhere before the driver is probed.
> 
> So the two driver really became OF-independent after applied my patch.
> 
> 
> > > Closes: https://lore.kernel.org/lkml/20230223203713.hcse3mkbq3m6sogb@skbuf/
> > Yes, and then Reported-by, which is missing here.
> > 
> > > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Cc: Daniel Scally <djrscally@gmail.com>
> > > Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > Please, move these after the cutter '---' line (note you may have that line in
> > your local repo).
> > 
> > ...
> > 
> 
> OK, thanks a lot for teaching me.
> 
> 
> > > +static const void *
> > > +software_node_get_match_data(const struct fwnode_handle *fwnode,
> > > +			     const struct device *dev)
> > > +{
> > > +	struct swnode *swnode = to_swnode(fwnode);
> > > +	const struct of_device_id *matches = dev->driver->of_match_table;
> > > +	const char *val = NULL;
> > > +	int ret;
> > > +	ret = property_entry_read_string_array(swnode->node->properties,
> > > +					       "compatible", &val, 1);
> > And if there are more than one compatible provided?
> 
> Nope, I think this is kind of limitation of the software node,
> platform setup code generally could provide a compatible property.
> No duplicate name is allowed. But we the best explanation would be
> platform setup code should provide the "best" or "default" compatible
> property.

The implementation is still incorrect. The swnode code shouldn't look
into the OF data. Please use non-DT match IDs.

> 
> 
> > > +	if (ret < 0 || !val)
> > > +		return NULL;
> > > +	while (matches && matches->compatible[0]) {
> > First part of the conditional is invariant to the loop. Can be simply
> 
> 
> Right, thanks.
> 
> 
> > 	matches = dev->driver->of_match_table;
> > 	if (!matches)
> > 		return NULL;
> > 
> > 	while (...)
> > 
> > > +		if (!strcmp(matches->compatible, val))
> > > +			return matches->data;
> > > +
> > > +		matches++;
> > > +	}
> > > +
> > > +	return NULL;
> > > +}
> 
> -- 
> Best regards,
> Sui
> 

-- 
With best wishes
Dmitry
