Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A09B3762309
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 22:10:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B9188EF0;
	Tue, 25 Jul 2023 20:10:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4470588EF0;
 Tue, 25 Jul 2023 20:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=hcL2mqqsLeV3tZhZn+BYSnnk2Sx4D0F1irDuol7LTQc=; b=i/IcwdgcbJcVBOpP7tnZosGJDw
 F6rJ2JciP99M4OcSqvkRiuSqtR1CUyga7uLDKceFxgh7kKo8+FQMFcjzcAlr7KXVM/Dkp06RuEvRm
 XCSyTPcUWcYSQGGsXl2oZmdxkpwWTOrRm1hEJhmeSdIrlcG26NbctxNi4LPWv+AyY5Qg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1qOOLt-002IlW-Ae; Tue, 25 Jul 2023 22:09:49 +0200
Date: Tue, 25 Jul 2023 22:09:49 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH V7 4/9] wifi: mac80211: Add support for ACPI WBRF
Message-ID: <5e92b45a-d99b-4a8a-9987-46c75a5fcb3c@lunn.ch>
References: <20230719090020.2716892-1-evan.quan@amd.com>
 <20230719090020.2716892-5-evan.quan@amd.com>
 <9b1f45f9-02a3-4c03-b9d5-cc3b9ab3a058@lunn.ch>
 <7d059aed-fac0-cdcd-63d5-58185bb345db@amd.com>
 <DM6PR12MB26196A993B3BA93392AA0FEDE403A@DM6PR12MB2619.namprd12.prod.outlook.com>
 <d4cfbbae-9cd0-4767-8c80-ec09d1dbaf9c@lunn.ch>
 <6aa9061b-1702-b8f2-9cb8-982895b9def4@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6aa9061b-1702-b8f2-9cb8-982895b9def4@amd.com>
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
 "mdaenzer@redhat.com" <mdaenzer@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
 "lenb@kernel.org" <lenb@kernel.org>,
 "andrealmeid@igalia.com" <andrealmeid@igalia.com>,
 "arnd@arndb.de" <arnd@arndb.de>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "Quan, Evan" <Evan.Quan@amd.com>,
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

> This comes back to the point that was mentioned by Johannes - you need to
> have deep design understanding of the hardware to know whether or not you
> will have producers that a consumer need to react to.

Yes, this is the policy is keep referring to. I would expect that
there is something somewhere in ACPI which says for this machine, the
policy is Yes/No.

It could well be that AMD based machine has a different ACPI extension
to indicate this policy to what Intel machine has. As far as i
understand it, you have not submitted this yet for formal approval,
this is all vendor specific, so Intel could do it completely
differently. Hence i would expect a generic API to tell the core what
the policy is, and your glue code can call into ACPI to find out that
information, and then tell the core.

> If all producers indicate their frequency and all consumers react to it you
> may have activated mitigations that are unnecessary. The hardware designer
> may have added extra shielding or done the layout such that they're not
> needed.

And the policy will indicate No, nothing needs to be done. The core
can then tell produces and consumes not to bother telling the core
anything.

> So I don't think we're ever going to be in a situation that the generic
> implementation should be turned on by default.  It's a "developer knob".

Wrong. You should have a generic core, which your AMD CPU DDR device
plugs into. The Intel CPU DDR device can plug into, the nvidea GPU can
plug into, your Radeon GPU can plug into, the intel ARC can plug into,
the generic WiFi core plugs into, etc.

> If needed these can then be enabled using the AMD ACPI interface, a DT one
> if one is developed or maybe even an allow-list of SMBIOS strings.

Notice i've not mentioned DT for a while. I just want a generic core,
which AMD, Intel, nvidea, Ampare, Graviton, Qualcomm, Marvell, ...,
etc can use. We should be solving this problem once, for everybody,
not adding a solution for just one vendor.

      Andrew
