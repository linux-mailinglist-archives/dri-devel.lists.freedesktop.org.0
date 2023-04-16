Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3B56E369F
	for <lists+dri-devel@lfdr.de>; Sun, 16 Apr 2023 11:30:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8029410E0D1;
	Sun, 16 Apr 2023 09:30:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6A610E0D1
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 09:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681637431; i=markus.elfring@web.de;
 bh=taXUqh59A6s5jLK2AMqvzxLyUAQof+foOlZbJMHpMq8=;
 h=X-UI-Sender-Class:Date:Subject:From:To:References:Cc:In-Reply-To;
 b=p9kfvogrpzQcjehpgr3vP9DNvYmhJg8KnjpHfTbqiHUTG3YxRhyZRsKC8nn+PNh+C
 IgctmtE7Yj2+U6GP1vj1ORTpV9MQdIRBGP58JhboY8McSsnaByroM1WKqxYp0dcq/l
 ioUtOmWPjfJNPg67h03/J3bcoXa404RRyr7Vvo/fbat9lMrSpNfb9BymbDCKeZcMIN
 nrjLU8Wm1fGHnQzpmhycjOnlN5pp3AUuuLgnCnGE31FaB11k4/0MWc1XES4tr2WnIy
 YTUgB55TX6YiYI1E1towlw2ha1uZ5NgQG120BsOdO70zIXgnTPyKohZcR4sxGZGPjX
 kRfJC40Dj0i3g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MLARS-1q4xdN0mZ8-00IAk1; Sun, 16
 Apr 2023 11:30:31 +0200
Message-ID: <2a746461-844a-2ad6-7b52-03f13fe1b9bf@web.de>
Date: Sun, 16 Apr 2023 11:30:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: [PATCH 0/9] GPU-DRM-nouveau: Adjustments for seven function
 implementations
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
In-Reply-To: <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iw+v+aCnrNtx+5y/6kxjkN4Kl9V8fZd2CmNmbqSHjI8zITy1Dor
 mtT4EPmX04v67L/2/64dI2v9e304IcgaVfVslHTvtnl9ifXrlbphIXi+qVRda/UUCGKRLb4
 Dv81299GNFZMUAqzqwVIiR9pOeRdpk0+qqY9WtkH0E0yV0HEZvKpdofwKlUPV1700fVGAbb
 09ujBRsH5FoaJkta6rswQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zua4EbQXjH4=;7ZivMlPiTYDvOkou6nAEnvn5XvN
 eCzlVuZ63BrSP26RHrwBjVTrIPRXMTJVKHPt6nodf4EJVysz/O0JDlUs5ryIP7suVXI66vT0P
 KE4rmIfU8/Qn5BcOK22TmQ5dLNgRERfTjFBf1smW5JaERJGZm6MaMVjPk4roM6+ASlyAPGfi5
 lj+/6BNg+U/Vb1kVmaHoxdrE70JAtSUei/TePlpCUoQ65B82N12Mnzi9rq8mf+QVdFMB7liz0
 l6Bqp2srEG595VAXjSmMDfsDrylb4gF2oGVzY/AwInkGTCXAfSEDQppCtPCUPhCGQ6Y29XrZL
 xg3BmmhY2aHLuyhuySou35Qf28K9LvUjFKRA+PBJi6I88zhaTFi+NJZVaGZldp07B13ztW6w8
 Hj4EP7SKEFLQBeyqTm6hKd0mHL8x9hT3EC4SR4Z6mRl15RT1p0UzUO6VxLdCMEB5h9xRfRQhV
 5e47X1dIJ5CGGjrWPVjO9WFtoMzf2GjehoPKE/Z5rwNWZH6Zw0/5071afdjKVkZpsUh+8DhYw
 QuELHn/+vKtoxiXLfUgepzJGd5LSjTHGvyLYgG7VDHG+EBKgDwrpz+87tDUvwAQgsYN2MWz/R
 /W26T4hI8XhnLAxhs13bsDPf/USwhQGv/TUx4U/jOGN0c/BYAjwao9yXEOlIUKPiuGXj+2ZlZ
 +GlBDqRnsaHS6xRfd3Rr//uL0eCuiTa1VRVqzqv8y6OSqSc9UXy7JB9r76UJ1eN5Y5UwUhyKd
 9vw762GQnv66SXXDwojErJHAhST7zHUZ2cswJf/3DjchBoKo1rvv2IbY44+5aMf9uhWANDOIw
 tXqJSQ8YD74MlrIxjoDrbza+aAWJDjEYNgN9N7zUIbaxuZNevtaVq3fZaGrD2oodIbY8rjEZc
 uJoDtz36I5hUuKb2rdrxsmN9z+uDZ8vpK2uT9Szt6rF86Em19WoT2Ug9g
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Date: Sun, 16 Apr 2023 11:22:23 +0200

Several update suggestions were taken into account
from static source code analysis.

Markus Elfring (9):
  debugfs: Move an expression into a function call parameter
    in nouveau_debugfs_pstate_set()
  debugfs: Move a variable assignment behind a null pointer check
    in nouveau_debugfs_pstate_get()
  debugfs: Use seq_putc()
    in nouveau_debugfs_pstate_get()
  debugfs: Replace five seq_printf() calls by seq_puts()
    in nouveau_debugfs_pstate_get()
  power_budget: Move an expression into a macro call parameter
    in nvbios_power_budget_header()
  clk: Move a variable assignment behind a null pointer check
    in nvkm_pstate_new()
  pci: Move a variable assignment behind condition checks
    in nvkm_pcie_set_link()
  pci: Move an expression into a function call parameter
    in nvkm_pcie_set_link()
  therm: Move an assignment statement behind a null pointer check
    in two functions

 drivers/gpu/drm/nouveau/nouveau_debugfs.c     | 19 ++++++++++---------
 .../nouveau/nvkm/subdev/bios/power_budget.c   |  3 +--
 .../gpu/drm/nouveau/nvkm/subdev/clk/base.c    |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/pci/pcie.c    |  7 +++----
 .../drm/nouveau/nvkm/subdev/therm/fanpwm.c    |  2 +-
 .../drm/nouveau/nvkm/subdev/therm/fantog.c    |  2 +-
 6 files changed, 17 insertions(+), 18 deletions(-)

=2D-
2.40.0

