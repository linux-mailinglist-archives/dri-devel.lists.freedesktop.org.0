Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE9673AB7D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 23:21:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B23A10E081;
	Thu, 22 Jun 2023 21:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79AAF10E081;
 Thu, 22 Jun 2023 21:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=VKG6+IdxFzEQrIUTUFzRlQOgrRogYWFGqz3oYumqx6I=; b=Sj
 1FzTXwjoVTPbttMFRbQevVbcmtxiZBogtoMjVDlnwbvNzXZx+KRtkQRdN18Laanb58dXxNu7kKlC/
 OAWP5E4COJhQ2oaKefv+cnoiU2IquPGVhx3vu1Ownp4f48y8KFzGfX3zQ1f7BnS/n+a05eecR3Le/
 sgjnaYDSd7oMRf4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1qCRj8-00HIwp-Jy; Thu, 22 Jun 2023 23:20:26 +0200
Date: Thu, 22 Jun 2023 23:20:26 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Limonciello, Mario" <mario.limonciello@amd.com>
Subject: Re: [PATCH V4 1/8] drivers/acpi: Add support for Wifi band RF
 mitigations
Message-ID: <e4168f82-f750-4917-b319-85bb7fe71ce4@lunn.ch>
References: <20230621054603.1262299-2-evan.quan@amd.com>
 <3a7c8ffa-de43-4795-ae76-5cd9b00c52b5@lunn.ch>
 <216f3c5aa1299100a0009ddf4e95b019855a32be.camel@sipsolutions.net>
 <b1abec47-04df-4481-d680-43c5ff3cbb48@amd.com>
 <36902dda-9e51-41b3-b5fc-c641edf6f1fb@lunn.ch>
 <33d80292-e639-91d0-4d0f-3ed973f89e14@amd.com>
 <9159c3a5-390f-4403-854d-9b5e87b58d8c@lunn.ch>
 <a80c215a-c1d9-4c76-d4a8-9b5fd320a2b1@amd.com>
 <8d3340de-34f6-47ad-8024-f6f5ecd9c4bb@lunn.ch>
 <07ad6860-8ffb-cc6c-a8e5-e8dc4db4e87a@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <07ad6860-8ffb-cc6c-a8e5-e8dc4db4e87a@amd.com>
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
Cc: jingyuwang_vip@163.com, bellosilicio@gmail.com, rafael@kernel.org,
 trix@redhat.com, lijo.lazar@amd.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mdaenzer@redhat.com,
 amd-gfx@lists.freedesktop.org, linux-acpi@vger.kernel.org, kuba@kernel.org,
 pabeni@redhat.com, lenb@kernel.org, andrealmeid@igalia.com, arnd@arndb.de,
 hdegoede@redhat.com, Evan Quan <evan.quan@amd.com>, netdev@vger.kernel.org,
 Xinhui.Pan@amd.com, linux-wireless@vger.kernel.org, edumazet@google.com,
 christian.koenig@amd.com, tzimmermann@suse.de, alexander.deucher@amd.com,
 Johannes Berg <johannes@sipsolutions.net>, davem@davemloft.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 21, 2023 at 01:50:34PM -0500, Limonciello, Mario wrote:
> So if we go down this path of CONFIG_WBRF and CONFIG_WBRF_ACPI, another
> question would be where should the new "wbrf.c" be stored?  The ACPI only
> version most certainly made sense in drivers/acpi/wbrf.c, but a generic
> version that only has an ACPI implementation right now not so much.
> 
> On 6/21/2023 1:30 PM, Andrew Lunn wrote:
> > > And consumer would need to call it, but only if CONFIG_WBRF_ACPI isn't set.
> > Why? How is ACPI special that it does not need notifiers?
> ACPI core does has notifiers that are used, but they don't work the same.
> If you look at patch 4, you'll see amdgpu registers and unregisters using
> both
> 
> acpi_install_notify_handler()
> and
> acpi_remove_notify_handler()
> 
> If we supported both ACPI notifications and non-ACPI notifications
> all consumers would have to have support to register and use both types.

I took a quick look at this:

#define CPM_GPU_NOTIFY_COMMAND		0x55
+static void amdgpu_acpi_wbrf_event(acpi_handle handle, u32 event, void *data)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)data;
+
+	if (event == CPM_GPU_NOTIFY_COMMAND &&
+	    adev->wbrf_event_handler)
+		adev->wbrf_event_handler(adev);
+}

handle is ignored, All you need is the void * data to link back to
your private data.

I find it interesting that CPM_GPU_NOTIFY_COMMAND is defined here. So
nothing else can use it. Should it maybe be called
CPM_AMDGPU_NOTIFY_COMMAND?

Overall, looking at this, i don't see anything which could not be made
abstract:

static void amdgpu_wbrf_event(u32 event, void *data)
{
       struct amdgpu_device *adev = (struct amdgpu_device *)data;

       if (event == WBRF_GPU_NOTIFY_COMMAND &&
           adev->wbrf_event_handler)
               adev->wbrf_event_handler(adev);
}

int amdgpu_register_wbrf_notify_handler(struct amdgpu_device *adev,
					wbrf_notify_handler handler)
{
	struct device *dev = adev->dev);

	adev->wbrf_event_handler = handler;

	return wbrf_install_notify_handler(dev, amdgpu_wbrf_event, adev);
}

	Andrew
