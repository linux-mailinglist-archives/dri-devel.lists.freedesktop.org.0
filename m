Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80897738ED2
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 20:31:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7275210E111;
	Wed, 21 Jun 2023 18:30:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9047710E111;
 Wed, 21 Jun 2023 18:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=wbqS0dqLdsnGgfOnL91hu55tI6N00q9JeL9Dt8+bbtk=; b=y9Y5o9ZOPVdyNd0f/8z8mo1CWF
 XkhXM+i69HTv3SFPqxk6v7EmMBdE5flxZ9WQanyW/HrM7W28qVJ66H0vtH7C9pz49swW5KNMWcCL+
 3Zwgc4Ge14YT7QZNlatyjc9AHoer54a6qwK7h7cC0GTMQO2OPRl1KgAcCIRDo5mjB+uc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1qC2az-00HB0y-DN; Wed, 21 Jun 2023 20:30:21 +0200
Date: Wed, 21 Jun 2023 20:30:21 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Limonciello, Mario" <mario.limonciello@amd.com>
Subject: Re: [PATCH V4 1/8] drivers/acpi: Add support for Wifi band RF
 mitigations
Message-ID: <8d3340de-34f6-47ad-8024-f6f5ecd9c4bb@lunn.ch>
References: <20230621054603.1262299-1-evan.quan@amd.com>
 <20230621054603.1262299-2-evan.quan@amd.com>
 <3a7c8ffa-de43-4795-ae76-5cd9b00c52b5@lunn.ch>
 <216f3c5aa1299100a0009ddf4e95b019855a32be.camel@sipsolutions.net>
 <b1abec47-04df-4481-d680-43c5ff3cbb48@amd.com>
 <36902dda-9e51-41b3-b5fc-c641edf6f1fb@lunn.ch>
 <33d80292-e639-91d0-4d0f-3ed973f89e14@amd.com>
 <9159c3a5-390f-4403-854d-9b5e87b58d8c@lunn.ch>
 <a80c215a-c1d9-4c76-d4a8-9b5fd320a2b1@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a80c215a-c1d9-4c76-d4a8-9b5fd320a2b1@amd.com>
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

> And consumer would need to call it, but only if CONFIG_WBRF_ACPI isn't set.

Why? How is ACPI special that it does not need notifiers?

> I don't see why it couldn't be a DT/ACPI hybrid solution for ARM64.

As said somewhere else, nobody does hybrid. In fact, turn it
around. Why not implement all this in DT, and make X86 hybrid? That
will make arm, powerpc, risc-v and mips much simpler :-)

	Andrew
