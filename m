Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F40E0937F60
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2024 09:03:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C5A10E10C;
	Sat, 20 Jul 2024 07:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="BWouzIlP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E015210E10C
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jul 2024 07:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1721458985; x=1722063785; i=markus.elfring@web.de;
 bh=1d4rj1ENyT2bE7yRVA3GEiplBLH4UjpvL5h5t1+rrxo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=BWouzIlPeq87F7WCF9/+ASx0EnDi9C3aJTt38NAQmOwgDj09i4rkQ2QCsWq66In0
 +3S1cKWB5yEMLDzQVretIBxMe1BIo7AszE10TfvB7vUg5/7IJe700cIqev65GoAFs
 Wjv3J2yg+PCpKmcgMEY4CT9Tb+i216jYbs6AbJ2O9TUE2f66BO2lzDoMEbru63VHp
 AOMPdxwwCNx9u1ITCE0ZBvtBDPrWA+pdz2dDhBNqm75+s5jMIJBqeO5uRNTgfWCOS
 algHj/gem+jvQHL3/EUP6t+/P4+HIBq7kmlKCaqyYoLEVjppRPiNuVYX5GxVKtUCJ
 w9CMSa4mdahsk4+Cog==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Ma0Pm-1ss5BF0Dsi-00WHCF; Sat, 20
 Jul 2024 09:03:05 +0200
Message-ID: <af131c5b-2aeb-4875-82c2-e033d8250685@web.de>
Date: Sat, 20 Jul 2024 09:03:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: George Yang <George.Yang@amd.com>, Lizhi Hou <lizhi.hou@amd.com>,
 Min Ma <min.ma@amd.com>, Narendra Gutta
 <VenkataNarendraKumar.Gutta@amd.com>, dri-devel@lists.freedesktop.org,
 Oded Gabbay <ogabbay@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Max Zhen <max.zhen@amd.com>,
 Sonal Santan <sonal.santan@amd.com>
References: <20240719175128.2257677-2-lizhi.hou@amd.com>
Subject: Re: [PATCH 01/10] accel/amdxdna: Add a new driver for AMD AI Engine
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240719175128.2257677-2-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Nj8xCOuGKQDF5HRs1OkgnCh0D2KadxhyvD5PueweTe8eLSCtTyz
 5R0K2KI3rpa3H4JKkzDFi1IkLRZrOt73DLgjElGZe5kFoLJesuFrP+tV+70StpCf59Rtkqd
 raP1OK24w5ZwZt+TkuKSWtijfIoOrLE433/08n7WKSmwFbfzaoblFUHzlt7lNwGv0fZr5yt
 Giv4I7cQHJ7ZsHIujkIpg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cWiOIh88dwM=;qRaFtUxJO3Cur7t1GgjTJCq5Gis
 MFQAkdwzK9VvmSJCg203JfGdp9OvclCIJQze7Qx29UduMDUN4DhheM/BPj5WW9EbVKqB4h3jZ
 lXBRVmx7+xT98LYEh369k7zLqzy8c5HzwDdUBGjcmdh4jOEaCNp1eSpGiSbQfw4pttdBMUVoF
 fbXk0ng1ZYwGMXNqTl3oeNqYpvUey/f0pBGRwsf8rEr7CFjvigRV4+R32w0m85Pj9GKJTaNzg
 WqxbaCZ5PT5K/9CZRMrx7DLuyYoer3oBpFd12ZqgqnbFGmpSzbJ4ztUmnMZjpfqm+QUF02Q6+
 sit3wWDDmwXKujMda5hgqtRX45knBRRLH5VCIpm//XEJySfteGDS4GjLUui1607Ld0xNz0V2c
 3jRenHDXAYr1Dv8rqRh9nYavE6d6wnzQC4d1904e3ZNW1ORvQse08KvDuXJdF55ThG76IIpjC
 lU7z/L8q6N5D2CUN2DjtrsC3x4Tx+U6pXXmJljeYCsmi8G3XjGLEDR3SB04+mXhb3PyruAJQN
 /YQkw+tNNPGjIkTgpltCMAaKcrPHS1ZlJbd1lnbNlH7l4oZUAeAxeVgglokzWSl1fUe7yJj2b
 6KpaAplvLtOAi9XFkZo4dgl6+BAbrk96xoG8iOEl4ZOLwAaw4ulLs4k02ZOcP7AScF2Ec5WWS
 AuEKAyBfUkiXbOGVcz6HIQirBAt/3qePKwOa6VXdZdTB7BqhMIu6nL3qdMJw5NWW4qRLkyUQA
 cZY6pwyWEw4fQeWUpf4YMJof8Pnp/iWOE25NMub3JjNRTpDJtDmr0BcPkKZxZOXJhS9pBbGiX
 +6gO/e/WYK3jLq+VN8eXvWGA==
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

=E2=80=A6
> +++ b/drivers/accel/amdxdna/aie2_pci.h
> @@ -0,0 +1,144 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2023-2024, Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef _AIE2_PCI_H_
> +#define _AIE2_PCI_H_
=E2=80=A6

Please omit leading underscores from such identifiers.
https://wiki.sei.cmu.edu/confluence/display/c/DCL37-C.+Do+not+declare+or+d=
efine+a+reserved+identifier

Regards,
Markus
