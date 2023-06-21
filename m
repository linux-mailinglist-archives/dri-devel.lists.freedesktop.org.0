Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0B1739265
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 00:20:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0405510E043;
	Wed, 21 Jun 2023 22:20:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2887D10E043;
 Wed, 21 Jun 2023 22:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=cP+HR2GmRZPnSeQ8lcOfEZ7k5nuBFTrLSVTHUrZopt8=; 
 t=1687385999; x=1688595599; b=R+ow3AIvq+FmawzeeFHUCuvs41WuRIqQOiv7K3FsJmTHojh
 Nn0n7i/X7nDswf2+FdnuP0dM6EwqopMOioCrMG6ZwCXrEm5QFBRA0t7PwflIniwuO89Tc4P0z20oG
 odLRF9j+WoZqOTgYc53c6RmjzkMFvK4PPYl04WucdFjHgipmtlprVGR4WROVoEpwGoJgoCMn1APFA
 Iq8sMeJ8ZJPh3EU6fURJfmDK5CSWLsHBa3qYKZL7gthV6x/hfCecLuIOhkDkNweCEqmD6vtvnC9vX
 dje1UMcK0yQskAdKPIOtStbMYw9Y7E64eqbbkjs1OR5BycsbLqd7ZQOX6/0PRcBg==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.96) (envelope-from <johannes@sipsolutions.net>)
 id 1qC6AD-00Duer-15; Thu, 22 Jun 2023 00:18:58 +0200
Message-ID: <3e337dc0482e16e2aaa4090b613dc8dea7803fa8.camel@sipsolutions.net>
Subject: Re: [PATCH V4 1/8] drivers/acpi: Add support for Wifi band RF
 mitigations
From: Johannes Berg <johannes@sipsolutions.net>
To: Andrew Lunn <andrew@lunn.ch>, "Limonciello, Mario"
 <mario.limonciello@amd.com>
Date: Thu, 22 Jun 2023 00:18:53 +0200
In-Reply-To: <08dd8d17-6825-4e53-8441-85c709326f48@lunn.ch>
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
 <08dd8d17-6825-4e53-8441-85c709326f48@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
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
 davem@davemloft.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2023-06-21 at 21:25 +0200, Andrew Lunn wrote:
> > ACPI core does has notifiers that are used, but they don't work the sam=
e.
> > If you look at patch 4, you'll see amdgpu registers and unregisters usi=
ng
> > both
> >=20
> > acpi_install_notify_handler()
> > and
> > acpi_remove_notify_handler()
> >=20
> > If we supported both ACPI notifications and non-ACPI notifications
> > all consumers would have to have support to register and use both types=
.
>=20
> Why would you want to support ACPI notifications and non-ACPI
> notifications? All you need is wbrf notification.
>=20
> The new wbrf.c should implement wbrf_install_notify_handler() and
> wbrf_remove_notify_handler().
>=20
> As to where to put wbrf.c? I guess either drivers/base/ or
> drivers/wbrf/. Maybe ask GregKH?

Not sure it should even be called WBRF at that point, but hey :)

Honestly I'm not sure though we need this complexity right now? I mean,
it'd be really easy to replace the calls in mac80211 with some other
more generalised calls in the future?

You need some really deep platform/hardware level knowledge and
involvement to do this, so I don't think it's something that someone
will come up with very easily for a DT-based platform...

If we do something with a notifier chain in the future, we can just
install one in the ACPI code too, and react indirectly rather than
calling from wifi to the ACPI directly.

johannes
