Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C368757F38
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 16:17:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E7510E34A;
	Tue, 18 Jul 2023 14:16:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF9D10E375;
 Tue, 18 Jul 2023 14:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=foGX3qPz8g1mE0AjGZ0RURTetuvRz0ZaIIFsjuTQ33o=; b=JBWA+Dva8h/kZCHzxx0beMUCVO
 DBM9NutUs8keY3cK4qSE6pjYwC5UbxQ9p8BI2hjbn36sLUsJjXa4y569DibqyziXWk0dXdIQ/ymwt
 OrHeqJt0QmXf5YAkADGAfUAJ3xrX0I1mXokQ96A+GrImP/aazfRTj/U6IF8GcT4CGHYo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1qLlUl-001dCP-Ng; Tue, 18 Jul 2023 16:16:07 +0200
Date: Tue, 18 Jul 2023 16:16:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Quan, Evan" <Evan.Quan@amd.com>
Subject: Re: [PATCH V6 1/9] drivers core: Add support for Wifi band RF
 mitigations
Message-ID: <642e3f4d-976b-4ee1-8f63-844b9568462e@lunn.ch>
References: <20230710083641.2132264-1-evan.quan@amd.com>
 <20230710083641.2132264-2-evan.quan@amd.com>
 <5439dd61-7b5f-4fc9-8ccd-f7df43a791dd@lunn.ch>
 <DM6PR12MB2619CF4D4601864FF251A1FAE438A@DM6PR12MB2619.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR12MB2619CF4D4601864FF251A1FAE438A@DM6PR12MB2619.namprd12.prod.outlook.com>
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
Cc: "jingyuwang_vip@163.com" <jingyuwang_vip@163.com>,
 "bellosilicio@gmail.com" <bellosilicio@gmail.com>,
 "rafael@kernel.org" <rafael@kernel.org>, "trix@redhat.com" <trix@redhat.com>,
 "Lazar, Lijo" <Lijo.Lazar@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mdaenzer@redhat.com" <mdaenzer@redhat.com>, "Limonciello,
 Mario" <Mario.Limonciello@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
 "lenb@kernel.org" <lenb@kernel.org>,
 "andrealmeid@igalia.com" <andrealmeid@igalia.com>,
 "arnd@arndb.de" <arnd@arndb.de>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "edumazet@google.com" <edumazet@google.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "johannes@sipsolutions.net" <johannes@sipsolutions.net>,
 "davem@davemloft.net" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> The wbrf_supported_producer and wbrf_supported_consumer APIs seem
> unnecessary for the generic implementation.

I'm happy with these, once the description is corrected. As i said in
another comment, 'can' should be replaced with 'should'. The device
itself knows if it can, only the core knows if it should, based on the
policy of if actions need to be taken, and there are both providers
and consumers registered with the core.

   Andrew
