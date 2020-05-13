Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9451D463C
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 08:53:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC0B26EBD6;
	Fri, 15 May 2020 06:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 357 seconds by postgrey-1.36 at gabe;
 Wed, 13 May 2020 13:50:21 UTC
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 848BC6EA43
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 13:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1589377819;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=YaLTIDVvIsVnGsDvKlLMw5gSFFnANByOSl7bzaOVt50=;
 b=HOgAu1lfMmsoKT6fB646G32u9eI2fCvngDBq15rAD06AaeijjZ1xiFAC9VxkjtYZRU
 pg8SnB7zARt4PPs/t+loITv0AIir0NT25ZpPQcAb3yL1oHq/KqE7DoquD+n4luvmE7HS
 UXYCcGE+9fvdQwgcYq1q+1LBZ+sINgmqusgrGXf8aqiI4Lz/YN1qN2tEp1XPBJXfC/aD
 cDkGIVC0Jwd7iwNILLm/zHouRzrLMe1iKbIEfIBbkS1VDOsSxpcqR1p4E7J/TUaY+slo
 shcjoV+eqjqi3TJlrPCQ8C4TkchUgpYVRdjUNdqApHnC7jRqoWuOaVqa33Mp2WXGieLS
 Wl+A==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPgHIrNbXPxYhzBNqLudCKUKb/p81w=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:d46b:1f9c:f4bd:1f45]
 by smtp.strato.de (RZmta 46.6.2 AUTH) with ESMTPSA id I01247w4DDiH0ba
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 13 May 2020 15:44:17 +0200 (CEST)
Subject: Re: [RFC] Remove AGP support from Radeon/Nouveau/TTM
To: Rui Salvaterra <rsalvaterra@gmail.com>, =?UTF-8?Q?Michel_D=c3=a4nzer?=
 <michel@daenzer.net>
References: <d249c339-fa3f-4440-bbc8-c9cf08338174@physik.fu-berlin.de>
 <CALjTZvZcg60rgDux7+Kh3zaMBkd-OiqoJ7GyYrLxfvnwgc4Xng@mail.gmail.com>
 <CADnq5_M61r7CMtfMBx6Cf_N9SnJJn0PouiMjVg8wytEMF1YZfw@mail.gmail.com>
 <c5d29422-21bd-b786-c822-5643730ab8a6@daenzer.net>
 <CALjTZvZOHyEFVv-2RV94dFKDFQY4zxYEHt5uQ+1B48Npo4AwRw@mail.gmail.com>
 <alpine.DEB.2.02.2005121124110.28199@scenergy.dfmk.hu>
 <CADnq5_PwY5czTPepDwzc5qoMJ3cKc4Mui=uN=k1EOtmOD42Log@mail.gmail.com>
 <CAKMK7uG3R4uve41MkkcFSiDJ+p=MwW81gcFW7NFENjKbdDUZ+g@mail.gmail.com>
 <CADnq5_NFDjOzgnjHOHEcjacd2dX1kA1QEzHp8=NweZg_b-82-A@mail.gmail.com>
 <CAKMK7uHv_Hj8BB8t_i=EXx1C4WXw1PnmxuTyNfrA=b5eQMaSLg@mail.gmail.com>
 <CALjTZvZNb-KbdZwM3kLU4yK8zH+NSh35k=iBtfGJMF1xyjpSFg@mail.gmail.com>
 <69696543-7c0e-604d-ed29-721b1b99d44e@daenzer.net>
 <CALjTZvYsNsW9ytGpbUKv1uf9r6DJkAbQzyDbx7Ru+fCP34w4kQ@mail.gmail.com>
 <2612115a-eaa0-9bf9-1227-adbf7f75e1e7@daenzer.net>
 <CALjTZvbM=8h9g+T8+nx8mjuvv_etGAo7DJO5nCKAkg2bUNA+6g@mail.gmail.com>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <ed0215b7-16f5-133d-70ab-96c4387ca14a@xenosoft.de>
Date: Wed, 13 May 2020 15:44:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CALjTZvbM=8h9g+T8+nx8mjuvv_etGAo7DJO5nCKAkg2bUNA+6g@mail.gmail.com>
Content-Language: de-DE
X-Mailman-Approved-At: Fri, 15 May 2020 06:52:55 +0000
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "Karoly Balogh \(Charlie/SGR\)" <charlie@scenergy.dfmk.hu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

AGP mode/support is deactivated on PowerPC and it doesn't work reliable????

And what does these lines mean:

PowerMac G5 Dual:

OpenGL vendor string: DRI R300 Project
OpenGL renderer string: Mesa DRI R300 (RV350 4152) 20090101 AGP 8x 
PowerPC 64/Altivec TCL
OpenGL version string: 1.5 Mesa 7.6

Mac Mini G4:

OpenGL vendor string: Tungsten Graphics. Inc.
OpenGL renderer string: Mesa DRI R200 20060602 AGP 4x PowerPC/Altivec TCL
OpenGL version string: 1.3 Mesa 7.2

Screenshots:

- http://www.supertuxkart.de/stk07ubuntu910ppc.png
- http://www.supertuxkart.de/opensuse111-stk073.jpg

Cheers,
Christian


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
