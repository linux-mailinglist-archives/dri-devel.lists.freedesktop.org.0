Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BB19895F9
	for <lists+dri-devel@lfdr.de>; Sun, 29 Sep 2024 16:37:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4265110E027;
	Sun, 29 Sep 2024 14:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.b="AN3J/NuF";
	dkim=permerror (0-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b="G693hetU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60BF210E027
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Sep 2024 14:37:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1727620643; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=o50ap7lkTl42EXSBZ+uouQJocsZdNj+Qy7Nis+xJiRwu0AheVGXXJOgH2va9eTz8CF
 msFhOkaoeUYZjD17A64zYoVR1hz4wLG3DwrDLUSNBO3npAUiuyP9cYsDsRZPfmd18yvG
 imkNauUaVl/rmum5vMQXZNu5Ezi6dDfZr1p4D69F7p/HUEi5S+2HLMf0F4gXuKIZtfsw
 F1NO9s0fwMOLYG8AW3NLBSAEPrri5C2hFpOn6KrECCp8VcyqYxIlM2beHa6ZYmDsPPuV
 thKTW2WeZ+qtXBczfrGE2l/FuirunGyRzI+pSRWOKP7s0dTbWERQ744Mj/CYuFjzitPx
 f4tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1727620643;
 s=strato-dkim-0002; d=strato.com;
 h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
 From:Subject:Sender;
 bh=xTlmt9OtlFYXrF7MkQW27hTuUMeHPuXE1OIEGFh/DEA=;
 b=k/qsHbCJrpiTIphRZJzr9ORnMDrB6h3HgSMdpcKJsIEnBmjf6icGvDZHhjyqmcPJ2i
 V5dx7T31pb6sHX1XYv4gskdvlpsG4kUbkvszDj0lI1tLDobdazjiJSe2FgcY8g1u2+VL
 BYqxIqz6/EnHrHAZwKgkAjQmWp3hThehrzglYgawwMepWW06L/1mYrBfOruVhmdm861/
 msVqtvxfbu8ZLmfZ2Ftxwpw6hRbuBgyzPd+MNp92suG+3a2pY/gGrMpnacqxdTMFyG+B
 Lavfy9Ot8GWg6RzeCujLuN16J9YAuwwlKIZi29ew5bteodUfHXytgTsP6f9ZxwKRxnor
 yFSA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1727620643;
 s=strato-dkim-0002; d=xenosoft.de;
 h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
 From:Subject:Sender;
 bh=xTlmt9OtlFYXrF7MkQW27hTuUMeHPuXE1OIEGFh/DEA=;
 b=AN3J/NuFeBU8Giva0DXSDBXYP4oWSUg23TrUrgei0anJrbrrZD+fBL9wHFQfVqc8b+
 zq1ySJ/wqPN6iBiDVNEArhKAVINBQXL/0LcWK819wwx6Ehb9Xd1B8LeyIKmW2hodOncS
 1tkiUAcH24DT8jx35V8cKqqWGkQ4NAa9jTU+76UrDuTu43jWAqM8NaXjFvxzBb0bNq4G
 vuECAz9qeb9HumSd1MiUvct5vnCL8cdWc2YC5eRBozYgZWqmabNKsmcm/iAQDhFIK4mo
 xge0t2xWxUBaIGdkTSMe1wDEV4bBbG3QIvQhgewnKFeFu/ubL2oRbFd7J8OtmuRdKNqc
 2QjQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1727620643;
 s=strato-dkim-0003; d=xenosoft.de;
 h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
 From:Subject:Sender;
 bh=xTlmt9OtlFYXrF7MkQW27hTuUMeHPuXE1OIEGFh/DEA=;
 b=G693hetUE2cguG+2twHVyVufo25xyytGjjexf+w6xZ2dFQDnpUOeV8Ec6BXd6+dxn7
 2pNlc0P8rpIQCIxx0oAQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7VpixsyiSXHvOldBC3Q4gRH8qR5blLZ9VChEUEN0="
Received: from smtpclient.apple by smtp.strato.de (RZmta 51.2.8 AUTH)
 with ESMTPSA id e0da1a08TEbNOnS
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sun, 29 Sep 2024 16:37:23 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: FSL P5040 board doesn't boot after DRM updates (drm-next-2024-09-19)
Date: Sun, 29 Sep 2024 16:37:12 +0200
Message-Id: <37D93804-DC55-4B2D-A82F-85BD45D9E131@xenosoft.de>
References: <14b64e90-2e3b-4bee-a8c9-2f8d6eed5d68@csgroup.eu>
Cc: developers DRI <dri-devel@lists.freedesktop.org>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>
In-Reply-To: <14b64e90-2e3b-4bee-a8c9-2f8d6eed5d68@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Alex Deucher <alexander.deucher@amd.com>
X-Mailer: iPhone Mail (22A3354)
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

Hello,

I tested the latest Git kernel with my VAPOR-X Radeon HD5870 1GB GDDR5 PCI-E=
 DUAL DVI-I/HDMI/DP on my PASEMI Nemo board today.
Unfortunately it has the same issue like my FSL P5040 board.

I think it depends on which graphics card is used.

It could be, that FSL P5020 boards are also affected.

dmesg (via null modem RS-232 serial cable): https://www.xenosoft.de/PuTTY_P5=
040_U-Boot.log

Please check the drm-next-2024-09-19 updates: https://git.kernel.org/pub/scm=
/linux/kernel/git/torvalds/linux.git/commit/?id=3Dde848da12f752170c2ebe11480=
4a985314fd5a6a

Thanks,
Christian=

