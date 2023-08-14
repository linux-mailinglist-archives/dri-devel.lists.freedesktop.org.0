Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7A677B6EB
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 12:40:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F022710E03B;
	Mon, 14 Aug 2023 10:40:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2227 seconds by postgrey-1.36 at gabe;
 Mon, 14 Aug 2023 10:40:12 UTC
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:242:246e::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA9F410E03B;
 Mon, 14 Aug 2023 10:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=J2KANedUadXaYMFYELF3QAJcmMwnPhF0mdoeDT4tKH0=; 
 t=1692009612; x=1693219212; b=XTbqdvserd5Owqk+oi7bMMBZdNwQOu9TSe/ZlHNH0XEhkLP
 pdtCJACHcMdldlsEMVY3cbkd0Qn8DC6n4D+f/N2NmOfrCIIrJnGz8B+Ym08yyluuyfeJ/Fm0Bfuv3
 JVKyOb9WJ9GK2zRYhJ9Y32ON46rdTuPzPZa94r77RESYomSxZg4pNtDKyyth9YFBCK4cUK7aGywND
 KIQa6lCdXytlux4RgA7Zq4DGE3ZPKGowrA8KtRYGRnbJejqYxQ57DVydhJlCEuZi5IdePq4TCHYHX
 o8NoezREV24wmiyY+kIoo8GR8ZaQd1QCi7JQ2foLwf6DdIUuEscFtu66OQFbQZpg==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.96) (envelope-from <johannes@sipsolutions.net>)
 id 1qVUP9-006dCg-23; Mon, 14 Aug 2023 12:02:31 +0200
Message-ID: <cabc7d0326e1169570eafdecef8df56369b4300b.camel@sipsolutions.net>
Subject: Re: [PATCH V7 4/9] wifi: mac80211: Add support for ACPI WBRF
From: Johannes Berg <johannes@sipsolutions.net>
To: Andrew Lunn <andrew@lunn.ch>, Mario Limonciello <mario.limonciello@amd.com>
Date: Mon, 14 Aug 2023 12:02:29 +0200
In-Reply-To: <5e92b45a-d99b-4a8a-9987-46c75a5fcb3c@lunn.ch>
References: <20230719090020.2716892-1-evan.quan@amd.com>
 <20230719090020.2716892-5-evan.quan@amd.com>
 <9b1f45f9-02a3-4c03-b9d5-cc3b9ab3a058@lunn.ch>
 <7d059aed-fac0-cdcd-63d5-58185bb345db@amd.com>
 <DM6PR12MB26196A993B3BA93392AA0FEDE403A@DM6PR12MB2619.namprd12.prod.outlook.com>
 <d4cfbbae-9cd0-4767-8c80-ec09d1dbaf9c@lunn.ch>
 <6aa9061b-1702-b8f2-9cb8-982895b9def4@amd.com>
 <5e92b45a-d99b-4a8a-9987-46c75a5fcb3c@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
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
 "davem@davemloft.net" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2023-07-25 at 22:09 +0200, Andrew Lunn wrote:
>=20
>=20
> It could well be that AMD based machine has a different ACPI extension
> to indicate this policy to what Intel machine has. As far as i
> understand it, you have not submitted this yet for formal approval,
> this is all vendor specific, so Intel could do it completely
> differently.

Already do, without the host software being involved in the same way.
There, I believe the ACPI tables just indicate what's needed and the
WiFi firmware sorts out the rest.

johannes
