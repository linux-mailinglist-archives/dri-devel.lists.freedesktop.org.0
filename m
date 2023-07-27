Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4343B7665B0
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 09:46:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3AD610E672;
	Fri, 28 Jul 2023 07:46:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta01.prd.rdg.aluminati.org (mta01.prd.rdg.aluminati.org
 [94.76.243.214])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC5C10E608
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 21:34:45 +0000 (UTC)
Received: from mta01.prd.rdg.aluminati.org (localhost [127.0.0.1])
 by mta01.prd.rdg.aluminati.org (Postfix) with ESMTP id A227420494;
 Thu, 27 Jul 2023 22:34:43 +0100 (BST)
Authentication-Results: mta01.prd.rdg.aluminati.org; dkim=pass (2048-bit key;
 unprotected) header.d=cantab.net header.i=@cantab.net header.a=rsa-sha256
 header.s=dkim header.b=oVEtuhX/; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mta01.prd.rdg.aluminati.org (Postfix) with ESMTP id 9804020401;
 Thu, 27 Jul 2023 22:34:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cantab.net; h=
 user-agent:message-id:date:date:mime-version:x-mailer:references
 :in-reply-to:subject:subject:from:from:received:received
 :received; s=dkim; t=1690493682; bh=olkeFIpENS6gBvoMBIWpyv9oVU6u
 aFKCBVe3Us9ba3w=; b=oVEtuhX/wURBwUIlWlPAcxgN8l5RbWaakA5M5Rf1Y15W
 Ww4GvghqdD3yfpNM1bW50IVZGoQ3II93qWZwSUOcQZ8rfdV/xtQ5phTyiYVAPuA3
 NagUK5sHVCeqLAZULUdDFO0BdkiXfiQQHvcC1zDsjQjM1MOq8SA3n6PtT6+gIast
 Hx2hAmYcDpUlA8W/DFaX2taqRn9rF31X3I6G1NANXsZcdNdd2M+05ELqgwlO/K/e
 IdpFUYkrQ5Kf0jEh08C/Jk511RBSrJ82GxTdmBModvcBoI7Zl2qP3o/c1fslcLgN
 dDwJBSQUrMCgHfeRj0C1JBH5ds3i6K/ybhjZYa4ntg==
X-Quarantine-ID: <BGjo5IoAmyGM>
X-Virus-Scanned: Debian amavisd-new at mta01.prd.rdg.aluminati.org
Received: from mta.aluminati.local ([127.0.0.1])
 by localhost (mta01.prd.rdg.aluminati.org [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id BGjo5IoAmyGM; Thu, 27 Jul 2023 22:34:42 +0100 (BST)
Received: from revelation.localdomain (static-87-75-118-217.vodafonexdsl.co.uk
 [87.75.118.217])
 by svc01-1.prd.rdg.aluminati.org (Postfix) with ESMTPSA id 5D5441C0002;
 Thu, 27 Jul 2023 22:34:39 +0100 (BST)
Received: by revelation.localdomain (Postfix, from userid 1000)
 id 9B8F51202D3; Thu, 27 Jul 2023 22:34:38 +0100 (BST)
From: Roger Sewell <roger.sewell@cantab.net>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/mgag200: Increase bandwidth for G200se A rev1
In-reply-to: Your message of Wed, 26 Jul 2023 17:40:11 +0200
 <9c8a0a5f-fd7f-cf6d-7e6e-ca90bdf957c5@suse.de>
References: <20230717133037.25941-1-jfalempe@redhat.com>
 <69a9ee2e-bd03-2a63-6651-0680475d7025@suse.de>
 <4f5d262c-527f-0fa6-45e3-a75aa22fcf0d@suse.de>
 <20230724215746.10928@revelation.broadband>
 <ca6cd674-d268-6210-c66d-4750e28a5c77@suse.de>
 <20230725223127.4184@revelation.broadband>
 <9c8a0a5f-fd7f-cf6d-7e6e-ca90bdf957c5@suse.de>
X-Mailer: MH-E 8.6+git; GNU Mailutils 3.13; GNU Emacs 27.2
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Date: Thu, 27 Jul 2023 22:34:38 +0100
Message-ID: <20230727223438.4658@revelation.broadband>
User-Agent: MH (GNU Mailutils 3.13)
X-Mailman-Approved-At: Fri, 28 Jul 2023 07:44:51 +0000
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
Cc: airlied@redhat.com, jfalempe@redhat.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--=-=-=
Content-Type: text/plain


Thomas, Jocelyn,

As a result of the collection of the Xorg logs requested by Thomas, I've
realised that at some long-past point upgrade the 1440x900@60 mode
disappeared, and in order to get it back I introduced the file
/etc/X11/xorg.conf.d/20-screen.conf attached.

If I remove this file, then with the unmodified new mgag200 module in
place, on going to Settings->Display I am no longer even offered the
1440x900 option - presumably as a result of
mgag200_mode_config_mode_valid returning MODE_BAD.

With this file in place, and with the unmodified new mgag200 module in
place, I am offered this setting, but if I pick it then it is not used
but *is* written into ~/.config/monitors.xml, and then on next login
graphics fail completely.

Hypothesis: there are two different places in the code where mode_valid
is potentially checked, both of which use the mgag200 module, and the
old module only does this check at one of them (deciding which modes to
offer) (which check is bypassed for modes requested in xorg.conf.d),
while the new module does it at both (and hence fails invalid modes
requested in xorg.conf.d) ??

Looking for possible reasons why this might be the case (and straying
way beyond my competence), I note that in the old module
mga_vga_mode_valid is made known to other parts of the system in a
different way than mgag200_mode_config_mode_valid is in the new module
(and indeed they have different parameter types). (Might this be
relevant ?)

Best wishes,
Roger.



--=-=-=
Content-Type: text/plain
Content-Disposition: attachment; filename=20-screen.conf
Content-Description: Xorg conf file

Section "Monitor"
        Identifier      "My monitor"
        Modeline "1440x900" 106.50  1440 1520 1672 1904  900 903 909 934 -hsync +vsync
        Modeline "1280x800"  83.50  1280 1352 1480 1680  800 803 809 831 +hsync -vsync
        Modeline "1280x720"  74.44  1280 1336 1472 1664  720 721 724 746 -hsync +vsync
EndSection
Section "Screen"
	Identifier	"Builtin Default mga Screen 0"
	Device	"Builtin Default Device 0"
        Monitor "My monitor"
        SubSection "Display"
             Virtual 1440 900
             Modes "1440x900"
        EndSubSection
EndSection
Section "ServerLayout"
	Identifier	"Builtin Default Layout"
	Screen	"Builtin Default mga Screen 0"
EndSection

--=-=-=--
