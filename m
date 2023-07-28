Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C62C766F65
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 16:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE4F10E6FF;
	Fri, 28 Jul 2023 14:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta01.prd.rdg.aluminati.org (mta01.prd.rdg.aluminati.org
 [94.76.243.214])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA3610E6AF
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 09:11:08 +0000 (UTC)
Received: from mta01.prd.rdg.aluminati.org (localhost [127.0.0.1])
 by mta01.prd.rdg.aluminati.org (Postfix) with ESMTP id A6A9020E3F;
 Fri, 28 Jul 2023 10:11:07 +0100 (BST)
Authentication-Results: mta01.prd.rdg.aluminati.org; dkim=pass (2048-bit key;
 unprotected) header.d=cantab.net header.i=@cantab.net header.a=rsa-sha256
 header.s=dkim header.b=L+CL2nN+; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mta01.prd.rdg.aluminati.org (Postfix) with ESMTP id 9872B20A63;
 Fri, 28 Jul 2023 10:11:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cantab.net; h=
 user-agent:message-id:date:date:x-mailer:references:in-reply-to
 :subject:subject:from:from:received:received:received; s=dkim;
 t=1690535464; bh=cZxLZ1tEBpIhujgoIVogT13OIOH3s7uUxVDPsDsABic=; b=
 L+CL2nN+EW9kpLiWrwot5raHTXxOZ6yv3ZP7c8IgshX+vHv1BiKp2bZbJJ62ZUoZ
 AbEmQK7fszBodfGQ8MrkEQIlnZ3X1/DqeACgYibyzCughw/h9o+iOFpYhSNs5pT/
 ws3I/objkIF0O8OxVBI4VEcM03iq2z5noCop7/gc3vi6vvEkcmzgXbePJaED5fh5
 6BQr1QQ8fGPvD6CtE19O7lZ/w4U3nn9y2F3kFYTGtVxUnbB5pXpmn1RxVUW0kMOs
 F8YH5UDYpC54fA3/KVCwVgD9gQB1KRvLTTfd6R8VCm3dIbcLUMk8b1efINAUgHBX
 jcrYlGfEY5ppBIbPfewZrA==
X-Quarantine-ID: <rILQLmbFLLSm>
X-Virus-Scanned: Debian amavisd-new at mta01.prd.rdg.aluminati.org
Received: from mta.aluminati.local ([127.0.0.1])
 by localhost (mta01.prd.rdg.aluminati.org [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id rILQLmbFLLSm; Fri, 28 Jul 2023 10:11:04 +0100 (BST)
Received: from revelation.localdomain (static-87-75-118-217.vodafonexdsl.co.uk
 [87.75.118.217])
 by svc01-2.prd.rdg.aluminati.org (Postfix) with ESMTPSA id 8991D780003;
 Fri, 28 Jul 2023 10:11:01 +0100 (BST)
Received: by revelation.localdomain (Postfix, from userid 1000)
 id C4DE41202BB; Fri, 28 Jul 2023 10:11:00 +0100 (BST)
From: Roger Sewell <roger.sewell@cantab.net>
To: "Jocelyn Falempe" <jfalempe@redhat.com>
Subject: Re: [PATCH] drm/mgag200: Increase bandwidth for G200se A rev1
In-reply-to: Your message of Fri, 28 Jul 2023 10:09:13 +0200
 <3ff67cb3-c477-b834-3d6c-4eb99952d59b@redhat.com>
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
X-Mailer: MH-E 8.6+git; GNU Mailutils 3.13; GNU Emacs 27.2
Date: Fri, 28 Jul 2023 10:11:00 +0100
Message-ID: <20230728101100.5287@revelation.broadband>
User-Agent: MH (GNU Mailutils 3.13)
X-Mailman-Approved-At: Fri, 28 Jul 2023 14:24:33 +0000
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Jocelyn, Thomas,

JF> I think the culprit is probably this patch:
JF> https://patchwork.freedesktop.org/patch/486242/
JF> 
JF> before this patch,
JF> mgag200_simple_display_pipe_mode_valid() always return MODE_OK
JF> 
JF> after this patch, it checks the bandwidth limit too.

I can easily test this theory, which sounds entirely reasonable - I will
do so and let you know the result.

TZ> I'm not quite sure how to proceed here, as the driver is correct and
TZ> the problem came from a mismatching config file on your system.

In so far as a user's viewpoint is relevant, I would say this: 

A user wants to be able to obtain any mode that actually is usable with
his hardware. He starts from a position of not having any extra config
files in place, and it works. He wants a different mode, so he adds a
config file. If he does that deliberately, then the system should allow
it, even if it goes over some theoretical limit - as if he gets no
video, he will then know exactly why he got no video (and can use the
tty interface after a reboot to remove his config file). (But by all
means put a warning message in the logs.)

What is really bad is for a mode that used to work to stop working with
no explanation - and even to stop working in such a manner that the only
way to get the system back is to force a reboot by removing power rather
than defaulting to a different mode. (But I think that that behaviour
results from userspace not expecting a late rejection of the mode.)

Moreover, any decent system that uses a GUI to allow you to change
screen mode offers you a preview before locking that mode in - and
automatically reverses the change if the user doesn't confirm it.

So I would prefer a mode chosen by a deliberate xorg config file to not
be rejectable by the driver, but just give a warning in the logs.

(But I do understand that you will also need to consider other points of
view.)

I'll confirm the result of the above test shortly.

Thanks,
Roger.
