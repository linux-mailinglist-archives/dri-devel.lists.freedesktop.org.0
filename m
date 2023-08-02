Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E36C76D880
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 22:19:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8456910E582;
	Wed,  2 Aug 2023 20:18:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta01.prd.rdg.aluminati.org (mta01.prd.rdg.aluminati.org
 [94.76.243.214])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E1210E582
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 20:18:55 +0000 (UTC)
Received: from mta01.prd.rdg.aluminati.org (localhost [127.0.0.1])
 by mta01.prd.rdg.aluminati.org (Postfix) with ESMTP id 0404820444;
 Wed,  2 Aug 2023 21:18:54 +0100 (BST)
Authentication-Results: mta01.prd.rdg.aluminati.org; dkim=pass (2048-bit key;
 unprotected) header.d=cantab.net header.i=@cantab.net header.a=rsa-sha256
 header.s=dkim header.b=oN/hf9Bq; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mta01.prd.rdg.aluminati.org (Postfix) with ESMTP id EFC2F20375;
 Wed,  2 Aug 2023 21:18:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cantab.net; h=
 user-agent:message-id:date:date:x-mailer:references:in-reply-to
 :subject:subject:from:from:received:received:received; s=dkim;
 t=1691007533; bh=PkIjVgYWXfNGGh7q7g8VhDuNj8yT0OgEnnw3SKnn8ug=; b=
 oN/hf9Bq8+3lz3H0fIoDOnylWX2zuNtrw0GKMUegimVa5v2XQwHGu1K+ZE8muJTf
 BQ4X4V5nMstaJ13QlB6mlr8ou8a5eb7dQD3UM6mruB9qjyNSJCAlL+wxAPpWWUp5
 3aW1TOU26H3I9BDODBBLwaFi6mvqLle4Bc7pUM83lGVHldYxhzIqetY4+EECQBt6
 qz2lb3PDs35gbV1YrE4LF/NViPNTSp0xkTzydc3293Bh+9J0fhWfJ3zeCRvgpsAZ
 5/3PtJc+DoV1pSAw2oAy/di1SSynBY6XU6VxYZY2J5fHKjmHg4qxmUp9AZtVoc3c
 CJUQQ1Yw90FH0FoL5vFZSQ==
X-Quarantine-ID: <Dz8ePdtMQyOo>
X-Virus-Scanned: Debian amavisd-new at mta01.prd.rdg.aluminati.org
Received: from mta.aluminati.local ([127.0.0.1])
 by localhost (mta01.prd.rdg.aluminati.org [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id Dz8ePdtMQyOo; Wed,  2 Aug 2023 21:18:53 +0100 (BST)
Received: from revelation.localdomain (static-87-75-118-217.vodafonexdsl.co.uk
 [87.75.118.217])
 by svc01-1.prd.rdg.aluminati.org (Postfix) with ESMTPSA id D19DD1C0002;
 Wed,  2 Aug 2023 21:18:49 +0100 (BST)
Received: by revelation.localdomain (Postfix, from userid 1000)
 id 21476120312; Wed,  2 Aug 2023 21:18:49 +0100 (BST)
From: Roger Sewell <roger.sewell@cantab.net>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/mgag200: Increase bandwidth for G200se A rev1
In-reply-to: Your message of Tue, 1 Aug 2023 17:55:13 +0200
 <51526559-24e0-344a-4455-62b4eb479185@suse.de>
References: <20230717133037.25941-1-jfalempe@redhat.com>
 <69a9ee2e-bd03-2a63-6651-0680475d7025@suse.de>
 <4f5d262c-527f-0fa6-45e3-a75aa22fcf0d@suse.de>
 <20230724215746.10928@revelation.broadband>
 <ca6cd674-d268-6210-c66d-4750e28a5c77@suse.de>
 <20230725223127.4184@revelation.broadband>
 <9c8a0a5f-fd7f-cf6d-7e6e-ca90bdf957c5@suse.de>
 <20230727223438.4658@revelation.broadband>
 <d5156750-34d4-87dc-41ff-f3c3ca1f48c3@suse.de>
 <3ff67cb3-c477-b834-3d6c-4eb99952d59b@redhat.com>
 <20230728131253.5411@revelation.broadband>
 <548751aa-6184-a5b0-2b90-d96ca04a8640@redhat.com>
 <20230801132128.4379@revelation.broadband>
 <51526559-24e0-344a-4455-62b4eb479185@suse.de>
X-Mailer: MH-E 8.6+git; GNU Mailutils 3.13; GNU Emacs 27.2
Date: Wed, 02 Aug 2023 21:18:49 +0100
Message-ID: <20230802211849.5166@revelation.broadband>
User-Agent: MH (GNU Mailutils 3.13)
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
Cc: airlied@redhat.com, Jocelyn Falempe <jfalempe@redhat.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Thomas, Jocelyn,

I just thought I'd let you know that it occurred to me that, now I
understood the workings of the mgag200 module better, I might be
able to get an even higher screen resolution than before.

So I relaxed the limits of this chip that returns unique_rev_id=1 to be
those that would have applied if it had had unique_rev_id=3, and set a
/etc/X11/xorg.conf.d/20-screen.conf file to contain the stuff below, and
used Settings->Display to pick 1920x1080 mode - and sure enough I get
perfect 1920x1080@60Hz screen resolution.

Interesting. Thomas, I owe you thanks for introducing the bug/feature we
have been discussing which has eventually led to my realising a big
improvement in my display. Also to all those who support open-source
software, without which a user would not be able to taylor his system to
match what he needs so well.

With best wishes,
Roger.



Section "Monitor"
        Identifier      "My monitor"
        Modeline "1440x900" 106.50  1440 1520 1672 1904  900 903 909 934 -hsync +vsync
        Modeline "1280x800"  83.50  1280 1352 1480 1680  800 803 809 831 +hsync -vsync
        Modeline "1280x720"  74.44  1280 1336 1472 1664  720 721 724 746 -hsync +vsync
        Modeline "1920x1080"  148.50  1920 2008 2056 2200  1080 1084 1089 1125 +hsync +vsync
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
