Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF14B1B45F
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 15:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B28610E693;
	Tue,  5 Aug 2025 13:12:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.b="NdN1sd5s";
	dkim=permerror (0-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b="HY8wyhZ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ADE410E26A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 13:12:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1754399546; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=YgffpZwOd0ir6vofQiAxkEVhB04XZHvZqufJZQ2k68g836FdP5L3kOe2GLEXfRYLZx
 DgmVE9HxZjko+jpAFE5z06awdztIezz6KVp5YNMHDe4bbXgFyu//6nAJwtRZNxaUFIKF
 QK9fmMNg85gorRt7oUCI5WC/Cl42Y14v1D+8j5YKJBa1Uvm/Ba4DIJBp3TbiuwQKDyWA
 9zbyXDdqKo28II4Sqe3VVrsiq6AwRDYkCXAPO/bt3k/NfxIN3oGq4t7geuyXJWXuEisV
 gy5ShjlFa5it6RaCKdyl85GauqnD8ZCNj1/oWod1rcs05rFjFkBAHgQJJAWnwke7LYVZ
 Pm+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1754399546;
 s=strato-dkim-0002; d=strato.com;
 h=To:In-Reply-To:References:Message-Id:Date:Subject:From:Cc:Date:From:
 Subject:Sender;
 bh=UW7EfqCMh67rDWgINn+d9NsZvqdMBFWknd/HCp912Z4=;
 b=haGRjWrZymaiLcsrq8tuMmF6isGBMCdfHcf2/Y5szSolOGHS3GO6mnsg7icvgOxe9L
 LPxlD4L9AB2xfpgwksqUaFdrXtZuekYXvEwl7ztoSv/aCC7dpOQTo+uW5hxrZi8QoSVh
 CPgulw35fbtHI6u01epd6MIp2joGOBYs06iW/wjcYnm0h6JjgD52uswwAF8suIG+sujZ
 mvR3aQOSp9SF9mdcVbHK6BJ0ZTQmbiol6BDTXQ0l+GToO8kps5TEbJERmLu2lxhjaPLq
 t2gYlBoUFIiDeDE2qaXS9ccvPJpy9SY+sa01BcU+jK4TvW39dZvOV7H4lzuLj3Vvw7m3
 zItw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1754399546;
 s=strato-dkim-0002; d=xenosoft.de;
 h=To:In-Reply-To:References:Message-Id:Date:Subject:From:Cc:Date:From:
 Subject:Sender;
 bh=UW7EfqCMh67rDWgINn+d9NsZvqdMBFWknd/HCp912Z4=;
 b=NdN1sd5sj9WLw6I+RHPxIVuvxy7aHfheLYqRpimzOwcGwoweILMqHAz2SFDmd7+KB5
 jihvzSN/O20Qmbcuz3e9nmHZihySDG4l3c6qY6X7NTxnQKgnWJXBbcj0N3mskLuNkD1i
 u4baTqD5cUz+ixLb6g5C6WKTddSoGQ9iKhyhp1UoMjkoPpMf1cPePZRlGhLICGZr5mfa
 cSJxTDXodzWbOEUbvnrZ3pN+N2e1q2JUKFzDTr71jDOoliVk2CuocLA2JZEXmjfl/DM1
 bC4JGuPA8GC75Tydh5qbaeQWTy0/UFXUBRPJV9fXae++v1DbY+nIArojZaAqTBcbeee8
 Zc0Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1754399546;
 s=strato-dkim-0003; d=xenosoft.de;
 h=To:In-Reply-To:References:Message-Id:Date:Subject:From:Cc:Date:From:
 Subject:Sender;
 bh=UW7EfqCMh67rDWgINn+d9NsZvqdMBFWknd/HCp912Z4=;
 b=HY8wyhZ6fZ0zlGSyLDDShuqvgG1L55fPaQiLa2hgs1hTHGsnds0OnOrMTv4FteJEPz
 Uv6fFr832K9MHmPsDuCA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5nns3LEXHXelTAWdgfp5X5/AypUnTpAXpdvFoA="
Received: from smtpclient.apple by smtp.strato.de (RZmta 52.1.2 AUTH)
 with ESMTPSA id e6066c175DCQwVI
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 5 Aug 2025 15:12:26 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: [Linux PPC] [X1000] [e5500] Kernel 6.17 testing and DRM issue
Date: Tue, 5 Aug 2025 15:12:15 +0200
Message-Id: <29E89652-6101-46CD-850B-846BB4EC59A0@xenosoft.de>
References: <3D84DBE3-1A8B-4BBD-8663-B7B5D1B36B27@xenosoft.de>
In-Reply-To: <3D84DBE3-1A8B-4BBD-8663-B7B5D1B36B27@xenosoft.de>
To: Jamie Krueger <jamie@bitbybitsoftwaregroup.com>,
 =?utf-8?Q?G=C3=BCrkan_Sinan?= <sinan.amigaone@gmail.com>,
 Julian Margetson <runaway@candw.ms>,
 Darren Stevens <darren@stevens-zone.net>,
 Steven Jeffery <sajeffer@gmail.com>, Pat Wall <pjwall@mac.com>,
 Pat Wall <pjwall@me.com>, Lyle Hazelwood <lylehaze@gmail.com>,
 Steve-David Marguet <steve@esdeem.ch>, George Sokianos <walkero@gmail.com>,
 TJ Ferreira <macsociety1@gmail.com>, Christian Zigotzky <info@xenosoft.de>,
 pjs@pjsa.net, Ben Cato Malkenes <ben.cato@gmail.com>,
 Kenneth Lester <ken@five-star.com>, madskateman@gmail.com,
 Allan Cairns <acefnq@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Daniel Reimann <halle_saale@arcor.de>, hypexed@yahoo.com.au,
 Alex Deucher <alexander.deucher@amd.com>,
 developers DRI <dri-devel@lists.freedesktop.org>
X-Mailer: iPhone Mail (22G86)
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

Hi All,

Here is the alpha5 of kernel 6.17 for X1000 and e5500 machines (X5000/20, X5=
000/40, Mirari, and QEMU VMs).

I created kernels with and without the drm-next-2025-07-30 updates [1] becau=
se of the issue with the Radeon graphics framebuffer device #15. [2]=20

Download and further information: https://github.com/chzigotzky/kernels/rele=
ases/tag/v6.17.0-alpha5

Please test both kernels.

Thanks,
Christian

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/c=
ommit/?id=3D260f6f4fda93c8485c8037865c941b42b9cba5d2

[2] https://github.com/chzigotzky/kernels/issues/15=

