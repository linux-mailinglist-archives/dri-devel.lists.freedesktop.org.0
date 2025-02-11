Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2647A30517
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 09:02:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A1610E28D;
	Tue, 11 Feb 2025 08:02:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="DCMwcb+L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 345 seconds by postgrey-1.36 at gabe;
 Tue, 11 Feb 2025 08:02:07 UTC
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E142C10E28D
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 08:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1739260926; x=1739865726; i=markus.elfring@web.de;
 bh=b8cDJ4lSmHlxSHHsrsR6Ku6y7KJbcpSf5mf6dGPdv9A=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=DCMwcb+LdQWDaC3ydSQwbZDzHEvRtvyzeYk0UuVseL9H6DbYteeCFIWpP+Qmm9i0
 NsLuM5nDol46pCsbLBQannysz2L1CkwHlHfdtSxYYnLY9DLsrWauF9tGoHB6yy3Ls
 2glMywCsX+5n1zVFtgpT8zuuQKt7SpCWokTlgSwosHoAl3iV5swS9w7C/hPUlYix0
 FXtfJUi3xNr6piC7LDKvdOG0KPZUVJvYjNvxybmFUrqE4gUUYitW1lUcrCxWomC/h
 XeTbU9K1nk2wAtj6+4LSTXa4Q5nD271V4yR94Fke3xRjhBQ98sPUMSvPoWBYWg6GU
 uBLHZkl8VzT55u0G4g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.9]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MFrxr-1tbUw639Xr-004dft; Tue, 11
 Feb 2025 08:55:57 +0100
Message-ID: <03681acf-9524-4fd1-b40d-a7cafe1c5572@web.de>
Date: Tue, 11 Feb 2025 08:55:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2] drm: xlnx: zynqmp_dpsub: Add NULL checks in
 zynqmp_audio_init()
To: Charles Han <hanchunchao@inspur.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Vishal Sagar <vishal.sagar@amd.com>
References: <20250211032830.2400-1-hanchunchao@inspur.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250211032830.2400-1-hanchunchao@inspur.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:USnYnQXWxocGuM37zSToa8h9T0sJugExpCOPAS5wXImCLuqUR6f
 kLJhstS1kXuTCHVqA3fJIsdplst6DMALOOKqjeFeId2Q7VTrWPzFqE++bKGc5BqxsbyXXIq
 B1aXysi6VQyK5yFFob6D7zUp2GpHjotI5kYKrDsDYg8HHYcbhfk3KO31letLzoYY7gTVrQ5
 cFeUQobbXq0eaMDYDXPig==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:rayBcSsXpPY=;/25YZItIIAPyk97XuGYeTRnRxV1
 qxcJj4sNF13QQqfjt3+N9Oz5V850W0hsNq+tp+wkAFy1qtSFiC3LtOiuUOanJz4dumWiKZZ31
 cl0eFJgXKluMPQLMNqea9lZWk0mX/wQ9omj8dVqMpE+gM0QGror9x+cM/eneRFPgHcsfORMqG
 /69QlyQ5tbVQf+uTPz+j3dkW2RYimIBwsWIH96jvwjpxG4FuaYgD8mBW84aqMjiABBUKbLyPQ
 KXKTNKRC7p9zIr0HY1uqy9mIP3MNAnV5ACHCEVRXolxr/5VvozOLZI0Yri4wGRa7hd+yOJ5Cr
 fUVsxzb4g0AmnKEN3UYE80IoswKolUrrqOLwk5KXyD/5RtfI0MwgrqysjBi4iQgkPVtusK2iB
 5ogl5wHrF/7IVtdteIEqBHyMlKqnSI0qVcwiMNHT+6LaYntTPmIChDUOd/BRGj9PYb6MpXoBH
 +wdjKUdozsM2Jc5RcHKd2UuuZyLkYS/CClqUPc/5MqYC9Ldrx2UC2jLgX06LK54Igo6AH5Mug
 6c9YhJO0QmDF+fBMhdnK2dG1ZigWGDLnvyS5XbDzKof9nOCtqC4RevavjCB8Qm9YvBbf2p8xg
 j53W5NvY3jBcPZx0yKLWaC/zET/rFF4893KTECJJA0+urGA9bCAe8C7xFOSDUXgapEQkNFiMl
 sn5krfmTz2tNJr+JgFxyMVFcDxPxtGuzCB5h+FTr3vv4Lrz0TYn6x/CpCG7DhanuU09XJlN1p
 3X8nqvSSFGqwdzLSu3WibYDoB+heX2g7oo5GrrHRJVtq0R/VjimPej4+UI8pM/qoaxHd7pCE6
 WbOXGT+oDybdVRyKeyqcP6FABFtFQauY+4I58hFMHS+/huFeIgPtmQ1VscielGX8yiRoGUPJX
 wyZ1dEyioSKtZlK4bEnRRKkhjdb2Kht0ytHYlgitGIgUi5lvEGseYyYnWNHqSQxgCwPBVgjfp
 HKH5COxnv/3izNF0E1YRUvZh97e0zbd4oNaabATVQamg/FgYuJzZrsrrDS+GDfMhEECvH7XkX
 Lmh8nzKhuA4YVZtzCYCnUqHHa6Cax0JorBD9tthodgjaTt72US92lIL7d5q2vqtgJnxd+O/84
 v6uC6GvIGsFh6XJ7+pbaIjXzqDaqKJ+FGAFU807CeadQq2Q0+iWMMgDeYdy2v8Q/3nc2tpJJO
 fsg3+kEbfw6Rv0Uf8qhVLrJ3SivifJD0kcQxIkcuse9ccjmENt7Y6k4qYHW7vro7R5TH73xbh
 KAPJoTAIQnE28C1TgJJHRVlN1W/2KJ3kXskK1PXlMVLODusjErHLgxhpAvZUtxPgBANzKt2Z/
 0xbg20tiaBgn/ZZHDEJUp9q358Ki5AU6v//azlgBdMl+oXgdeci0Z0fZjgddF0MBTyh7tvxcL
 UsiX0Q07EUkfDI2y4gKLs8uKnYlYPg275zJ+SkbC5z4+fXAuA7oMeEdgI+4oj91qOz88lAHAT
 bMS4D4A==
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
> Add NULL check in zynqmp_audio_init(), to handle kernel NULL
> pointer dereference error.

* Can it be more desirable to prevent such issues?

* Would the message subject have been nicer with a key word like =E2=80=9C=
PATCH=E2=80=9D
  (besides other refinements)?


=E2=80=A6
> ---
>  drivers/gpu/drm/xlnx/zynqmp_dp_audio.c | 4 ++++
=E2=80=A6

Will you become more familiar with patch version descriptions?
https://lore.kernel.org/all/?q=3D%22This+looks+like+a+new+version+of+a+pre=
viously+submitted+patch%22
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.14-rc2#n310

Regards,
Markus
