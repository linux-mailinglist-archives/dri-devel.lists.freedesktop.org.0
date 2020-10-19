Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D26292EAA
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 21:43:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66BC46EA55;
	Mon, 19 Oct 2020 19:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE1366EA55
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 19:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1603136588;
 bh=lWMfIgBK3N+/t8/PnaA+rqnkgG4NCB2rXgcxXYJukKc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=LQWr3BnhkGvUJKr5t6bH+xj2aiwEu7HLt99D0kweBFirls1qV4ienQ5upq2FYNa5n
 DPSJVEgs+DWQ5Z9TdJsysj2Vwwotphf3saC7eIehqMDXPfvQ2RWKUl4YBL4IXCOZa+
 ZrHiTHtG0KKwFXiEbq4NGb6M6SwZ3m/Zu8gMzpHw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [173.228.6.223] ([173.228.6.223]) by web-mail.gmx.net
 (3c-app-mailcom-bs01.server.lan [172.19.170.58]) (via HTTP); Mon, 19 Oct
 2020 21:43:08 +0200
MIME-Version: 1.0
Message-ID: <trinity-a0f09460-7d25-457a-aef8-e70fcf617a83-1603136588694@3c-app-mailcom-bs01>
From: Kevin Brace <kevinbrace@gmx.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: It appears drm-next TTM cleanup broke something . . .
Date: Mon, 19 Oct 2020 21:43:08 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20201018210412.GA515543@ravnborg.org>
References: <trinity-7bf82d9f-a022-48f3-bca0-d06eb28ebe35-1603048517864@3c-app-mailcom-bs08>
 <20201018210412.GA515543@ravnborg.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:iuTbFe3j7s4sf/g2p+hxckS8AKYZsei1vWIQs471TLMBixnbPe+uPOIAaiiu/P3fYwYlA
 C+d+3lj15OOyRRnl2zHdZ6vWOYQrF8DIB8+MOh7dUAYWlxG1uV2xoVZ9+qHkb1yn+RSae8Yb0UdQ
 1VzIYJdsIjixQgv9z2Ti6zwV80wSZPy/armjQqkjexh/toGv9wuh6x9rRnPoUk0hYk3VTePGem1N
 Vd8M3jboxZ9E/Tj4vw+ZB7AIeQIzXaYJiiVwtODMBK/1amToMgYrkHyyponDhX7yDouQxCZiFsCf
 E8=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:JYb1ieIJLXQ=:giawXrAzCSqpheWoMrE5iD
 lt/QaDz1KlJciKml7aNSWDVcotInSlqSB3v211Kbyte+MQ4/aAib981oFRoGh+JaCayg6Qpt2
 0PDakxz+9jaOsFo0xK4g9zQv2LF/Kdo5G+X19xaO1uBS3xsg7+kEAqidR1LFKFG90JgWBVrxk
 wJ3obKnbQI9i/23qPcXQwQN6tYlcxS9QteBmBNGWLAbLAGE4a6lpnQygooD/N6smJlq9Nf3+a
 Jxy7IIktW/kvpj/1As63GpViRMG3a2CJjKjPAJWmfLTc/e54oWxWg7cWHLPumvulThLdjDqq4
 Y6J8T83ame+E4X4H3AF/t5CEOCgwSsnwk/XBs4tM6luEUHG1aMitoo+5cOSWumRIwY42M8hmD
 uEQIvllPs329sS/ll8qjrgCDgEfyYAHP93J5sIvWRzPMb+N+CPI9KIy7/UAgjOcL1H9wWXsAM
 rnHsu/2I5fddGaMAh83wWH7PInXIHrD06SIyjbgeO2UP4O1lmwZwrtEEPDR/J/qGezuGoHxpp
 mjR4t1Cv5Ld69z9bp/95CETOZ/4mNQ6muob3BlY7Ss493wUj3EAvs4RHSxmZyemYlVRdfBJTY
 a7lSi0bRwXlPk=
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
Cc: Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thanks for asking the question.
The current OpenChrome DRM code has these two major issues.

1) It does not support atomic modesetting

I do internally have working code to support atomic modesetting, but it is not ready for committing into the upstream OpenChrome DRM repository.
In particular, it suffers from a freeze relating to a cursor plane.
The freeze is a bad kind that kern.log does not really tell me what is wrong.
If I disable hardware cursor, the atomic modesetting based OpenChrome DRM appears to work okay.
In other words, I am getting close to getting atomic modesetting working, but I am stuck.


2) Double allocation of visible portion of frame buffer

This is a big problem left behind from the previous developer who developed OpenChrome prior to me.
For some reason, the developer wanted to allocate visible portion of the frame buffer to be the maximum possible size supported by the detected monitor when initializing the frame buffer inside OpenChrome DRM code.
I believe Radeon DRM does something similar to that.
The problem is, OpenChrome DDX allocates an equal sized frame buffer visible portion during the DDX's initialization.
This means that we got two same sized visible portions allocated, but OpenChrome DDX and OpenChrome DRM combined should really be allocating only one.
At this point, OpenChrome is not supporting double buffering.
This double allocation of a visible portion of the frame buffer contributes to a X Server crash when the screen is resized and 16 MB or less (i.e., 8 MB) shared frame buffer is reserved by the system via BIOS setup.
I personally think letting OpenChrome DRM allocate the visible portion of the frame buffer is the way to go, but if so, how do I get the DDX or shadow FB to access the frame buffer visible portion allocated by OpenChrome DRM?
Any suggestions on what to do about this issue will be greatly appreciated.
Perhaps, I should post a question to dri-devel regarding this issue.
I really do not know what I should do at this point.

Regards,

Kevin Brace
Brace Computer Laboratory blog
https://bracecomputerlab.com


> Sent: Sunday, October 18, 2020 at 2:04 PM
> From: "Sam Ravnborg" <sam@ravnborg.org>
> To: "Kevin Brace" <kevinbrace@gmx.com>
> Cc: dri-devel@lists.freedesktop.org, "Dave Airlie" <airlied@redhat.com>
> Subject: Re: It appears drm-next TTM cleanup broke something . . .
>
> Hi Kevin.
>
> On Sun, Oct 18, 2020 at 09:15:17PM +0200, Kevin Brace wrote:
> > As usual, I pulled in DRM repository code for an out of tree OpenChrome DRM repository a few days ago.
>
> I know you have been working on and off on the openchrome driver for a
> long time now. Any chance we will see the driver submitted for upstream soon?
>
> 	Sam
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
