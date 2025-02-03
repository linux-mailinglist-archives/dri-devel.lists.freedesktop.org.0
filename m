Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1256A2530F
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 08:29:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 805FC10E2AF;
	Mon,  3 Feb 2025 07:29:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="B3vyI9Ft";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 358 seconds by postgrey-1.36 at gabe;
 Mon, 03 Feb 2025 07:29:42 UTC
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D588C10E2AF
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 07:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1738567779; x=1739172579; i=markus.elfring@web.de;
 bh=pL2jDbwM2tnoDPxkIcout16iJtvsCV65sn/2QOSZBsY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=B3vyI9FtxhKE3xcPNi42R2Qhn/Qb+lxdypUwhzsmcv7igk8RUsQioqisXpysUYpw
 Tc+0bOiYyhd+lDU7lpxRoqAAogMraXmovmxjqgqyIQ2QvkMreOGczO8rsUxII/zbd
 V5B1NXMWcu4mwneofRBldH+eeP45x+3Naj4Z9vBC3mi7bjj9Y3h6QKxgUxHaH7ZgY
 RhNIns7tZl7UOFtecS00xxvDcgylI6o1NwMQ+bA4or+Nme0t7gGjHgWCOLeRw5P0C
 oQ3dg0ekY7Wau05lq303ybG67EfNKvc4bop55MPuTC0vKN31ffRaUIxcuQ+cHxY6D
 DevHJqMAJKL1nAne1Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.29]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MjgX3-1szyFN23FD-00mF3n; Mon, 03
 Feb 2025 08:22:18 +0100
Message-ID: <875fe1a2-64b4-43f9-8b6c-60e416a37248@web.de>
Date: Mon, 3 Feb 2025 08:22:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [01/16] coccinelle: misc: secs_to_jiffies: Patch expressions too
To: Easwar Hariharan <eahariha@linux.microsoft.com>, cocci@inria.fr
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-block@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-xfs@vger.kernel.org,
 ceph-devel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net,
 imx@lists.linux.dev, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, Carlos Maiolino <cem@kernel.org>,
 Chris Mason <clm@fb.com>, Christoph Hellwig <hch@lst.de>,
 Damien Le Moal <dlemoal@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>,
 David Sterba <dsterba@suse.com>, Dick Kennedy <dick.kennedy@broadcom.com>,
 Dongsheng Yang <dongsheng.yang@easystack.cn>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 James Smart <james.smart@broadcom.com>, Jaroslav Kysela <perex@perex.cz>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jens Axboe <axboe@kernel.dk>,
 Josef Bacik <josef@toxicpanda.com>, Julia Lawall <Julia.Lawall@inria.fr>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Ilya Dryomov <idryomov@gmail.com>,
 Kalesh Anakkur Purayil <kalesh-anakkur.purayil@broadcom.com>,
 Keith Busch <kbusch@kernel.org>, Leon Romanovsky <leon@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Nicolas Palix <nicolas.palix@imag.fr>, Niklas Cassel <cassel@kernel.org>,
 Oded Gabbay <ogabbay@kernel.org>, Ricardo Ribalda <ribalda@google.com>,
 Sagi Grimberg <sagi@grimberg.me>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sebastian Reichel <sre@kernel.org>,
 Selvin Xavier <selvin.xavier@broadcom.com>, Shawn Guo <shawnguo@kernel.org>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Takashi Iwai <tiwai@suse.com>,
 Victor Gambier <victor.gambier@inria.fr>, Xiubo Li <xiubli@redhat.com>,
 Yaron Avizrat <yaron.avizrat@intel.com>,
 Ricardo Ribalda <ribalda@chromium.org>
References: <20250128-converge-secs-to-jiffies-part-two-v1-1-9a6ecf0b2308@linux.microsoft.com>
 <e06cb7f5-7aa3-464c-a8a1-2c7b9b6a29eb@web.de>
 <632be2db-78d2-4249-92f0-3f60e0373172@linux.microsoft.com>
Content-Language: en-GB
In-Reply-To: <632be2db-78d2-4249-92f0-3f60e0373172@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:unmzcva3DfFDe8J5T/SEse13ECLrm00SFr+jMbswdVLKuVhkuYO
 KrTlmHqHj2q9ogvXNY+OT9rpa/y77P4OKcbhTRE4HQfNnHl3vyWWfzK02lPKs/doF/0oo/N
 zaSBPOg0Tas1K5KCmS6LhNSs0R2vs1xLG29Gypkmwc3S031NZBDDMgkSSAGcQ2a7o9N0Sjo
 97PGMtERfjxkxxcBQ4+cg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:O4+1yz2eOOQ=;cYucBAkKciilp3EfFUJPMbhSxL/
 f0JKh0lYXaz3Jgtrkb7z8BSa3Y5CiXLRzyqEdkd/fZMxNNsu7vTVHObt7fuhD96tA8OvwazRu
 pVsIWS9Xo7idAou3NuuFyTlXJoVPp0BEDs0NSggeXg5Az9T6IB2xfpObSYR20bB0i7+E3/y0I
 erojxWm1AvLMJ9CHmR3ARt2S+AyN8pJwq18U0ZKkhMZyvfHl7ThrZlh8u2v6qe7HijeP1boaV
 Qe9h43sc8tZHnAoMejbMIak00qM7DquYi/3ySyWM+BA65QEf0UyN+UJReTYsxrxgyC0k3/1FA
 49MWxoIXbhXug4RhPnYnRSKizJZr3D8r6BMdTp9Ruz1ybRUpurns/LbYa4Ze4TZGHGI6Ly78C
 bgOqrioEiG5gFegQmYJvpnnopAFZcEnzFWtU7CtSPoZhi2B2/qtNQP4SDk651ogb623e+wR+r
 Ad3Z79rLTyoracSZ+R1AaTg40bsOXQ+sexkCBpfhP5JBkKaAZXg477GesclLoYJMOHmFPSYH0
 UCDzOKLJkQkO5IEMZUj/d9f6IpAOxkCshBz0tWOeFk7b1NjwECDw9HFdek5+oamoKt9eGHGPu
 Urwl/b0udNTd9yDCHyfio2OC9rqKy4vZM5t2VZicwsHG9DUrCm1Dk5gOPHaf3cgwt9TOSQ9Om
 W8Qc0hIqN+6GDcS1aBlOvzoEPvfhjEJibOcu8ArQbINKlSaH/pSGEZ46Ju+beRBsG+nYy/aeC
 yvaYi5lIA/DIgX/PH/Vw/e3UU4emlOligF7nEetZrNIIM07fEhIbLkyB6bct75i9WuA3PKGBd
 aZifJDg8SvYORccYuigtQ1y3IuVfKOQUIa6ZyhqbL/ndiPcIlKV3DJ4QA0vikrDWe8OrQLo+b
 Ma14W5lq7n/vzTVJVEQN3q0BOSB9qa0/gFrzwic0ElKJeQmNvMowFHmVId51OoqrXBw/9OON/
 QLZiGI61ypkHXh4Gg/OqAbqhXMwxyPOrRdwTi0eG5o/o64dCuOOm0IOzwvyhraw9CYWlhtonx
 PrTGOcA/84h0Eh2CnPkau3o93LrKyNx4rbIXFHiXGUEq3f1fwYxbO4VnBBHm28MLpUhboLj2n
 BRyLBcd3wF07PN3qDwUHO3pHTqNzZqenlMctIRoXJu4Hyii/N3ePwzwbw474Idcai7INn5yYu
 MugSI1SKskLtU2KQKQQhrIHlBKRRirLYzojx5TPoPntMgtAjwLRYSCMwL3MR0KT5e577NqpU9
 rSpWyQibnMQ0Fq9khKY6UEPxwhRdsVNjU9NyKtdssE5VsSXhiUFgvvZpkDt/3WJCh5pnAOw2B
 +aysxF18o/UZ6JPljRVcR2HR+Bj6WJD0db83ovZfVsfybLz2n2TOCmZkPXmILLmlmF3
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

> As it stands, I'll fix up the current rules in v2 following your
> suggestion to keep the multiplication in each line to allow Coccinelle
> to use the commutativity properties and find more instances.

Corresponding software development challenges can eventually be clarified =
further.


> I'll refrain from implementing the report mode until current instances
> have been fixed because of the issue we have already seen[1] with CI
> builds being broken. I would not want to break a strict CI build that is
> looking for coccicheck REPORT to return 0 results.

You got into the mood to test support for an information in the software d=
ocumentation.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/dev-tools/coccinelle.rst?h=3Dv6.13#n92
=E2=80=9C=E2=80=A6
Note that not all semantic patches implement all modes.
=E2=80=A6=E2=80=9D

Regards,
Markus
