Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F6E747241
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 15:08:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 251BE10E164;
	Tue,  4 Jul 2023 13:08:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F17A410E164;
 Tue,  4 Jul 2023 13:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=p2IeYQpGstyHc2o1uZoj5LpWskpFkCurknri7FAU7Sc=; b=doFCJ3+M2ZbnwCnNdylf69dbn7
 dEt8U5JRYhixIcAX4/NUmMkQDZ4Yv1Hh/NkwBjC5ObE9o8vEoAfQPYw7wCHQQI5Yuja91bxFm+NbL
 Blb/HMHvkbYn5Xo+/+e/pq8EDf7c9kn3U8xCg61HatQrAw8Kz3JHzRXB1XKbecqxHB30=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1qGfkR-000Ydd-1w; Tue, 04 Jul 2023 15:07:15 +0200
Date: Tue, 4 Jul 2023 15:07:15 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Quan, Evan" <Evan.Quan@amd.com>
Subject: Re: [PATCH V5 1/9] drivers core: Add support for Wifi band RF
 mitigations
Message-ID: <18dfe989-2610-4234-ade2-ffbc2f233c19@lunn.ch>
References: <20230630103240.1557100-1-evan.quan@amd.com>
 <20230630103240.1557100-2-evan.quan@amd.com>
 <7e7db6eb-4f46-407a-8d1f-16688554ad80@lunn.ch>
 <DM6PR12MB2619591A7706A30362E11DC5E42EA@DM6PR12MB2619.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR12MB2619591A7706A30362E11DC5E42EA@DM6PR12MB2619.namprd12.prod.outlook.com>
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

> > What is the purpose of this stage? Why would it not be supported for this
> > device?
> This is needed for wbrf support via ACPI mechanism. If BIOS(AML code) does not support the wbrf adding/removing for some device,
> it should speak that out so that the device can be aware of that.

How much overhead is this adding? How deep do you need to go to find
the BIOS does not support it? And how often is this called?

Where do we want to add complexity? In the generic API? Or maybe a
little deeper in the ACPI specific code?

       Andrew

