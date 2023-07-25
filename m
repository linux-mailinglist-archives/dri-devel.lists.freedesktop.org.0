Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5EE762D9A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 09:30:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF14710E424;
	Wed, 26 Jul 2023 07:30:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta01.prd.rdg.aluminati.org (mta01.prd.rdg.aluminati.org
 [94.76.243.214])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16FBB10E19E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 21:31:35 +0000 (UTC)
Received: from mta01.prd.rdg.aluminati.org (localhost [127.0.0.1])
 by mta01.prd.rdg.aluminati.org (Postfix) with ESMTP id 8A4D32043D;
 Tue, 25 Jul 2023 22:31:33 +0100 (BST)
Authentication-Results: mta01.prd.rdg.aluminati.org; dkim=pass (2048-bit key;
 unprotected) header.d=cantab.net header.i=@cantab.net header.a=rsa-sha256
 header.s=dkim header.b=RKEV+ImV; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mta01.prd.rdg.aluminati.org (Postfix) with ESMTP id 80159203EF;
 Tue, 25 Jul 2023 22:31:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cantab.net; h=
 user-agent:message-id:date:date:x-mailer:references:in-reply-to
 :subject:subject:from:from:received:received:received; s=dkim;
 t=1690320692; bh=nSYYXwXsJ3w0jsUKEwLruWqcUbl82KiUHi+XcN/l584=; b=
 RKEV+ImVOE1RQw4ku8zv5tkE8WvE33x7IR3idUg2uGpcf/bE0iWl/zqQYi8Uj9ii
 +SyCuHTB9lNgSGxT6/YVpPUj5STg+rHCqjCKkNF8V/ubHf6mi4KyixlS+3Ra5yBg
 iB4apSDLsz2vc3pWK/3jvvu7yaJZyBSd9jxLqKIh4TPnblCvJS1sjeAdw9MaTSEp
 yNj3c/kIzd3WwY/QMyVDwHXrlNx2HBGRZflfoAMTaFdV8LGKWwODoLlRfP5J46qj
 WeDH4e2DLWZseqoAVJ8bRM0OKd6/ezCaSOGa++YVd9XPVg3jCvocgZF7OI/UWaYQ
 rLWZ3zNDwE/fjslezYlc4w==
X-Quarantine-ID: <1Vv4cKb9WEqS>
X-Virus-Scanned: Debian amavisd-new at mta01.prd.rdg.aluminati.org
Received: from mta.aluminati.local ([127.0.0.1])
 by localhost (mta01.prd.rdg.aluminati.org [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id 1Vv4cKb9WEqS; Tue, 25 Jul 2023 22:31:32 +0100 (BST)
Received: from revelation.localdomain (static-87-75-118-217.vodafonexdsl.co.uk
 [87.75.118.217])
 by svc01-2.prd.rdg.aluminati.org (Postfix) with ESMTPSA id 11BD6780003;
 Tue, 25 Jul 2023 22:31:27 +0100 (BST)
Received: by revelation.localdomain (Postfix, from userid 1000)
 id 1D987120334; Tue, 25 Jul 2023 22:31:27 +0100 (BST)
From: Roger Sewell <roger.sewell@cantab.net>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/mgag200: Increase bandwidth for G200se A rev1
In-reply-to: Your message of Tue, 25 Jul 2023 21:37:48 +0200
 <ca6cd674-d268-6210-c66d-4750e28a5c77@suse.de>
References: <20230717133037.25941-1-jfalempe@redhat.com>
 <69a9ee2e-bd03-2a63-6651-0680475d7025@suse.de>
 <4f5d262c-527f-0fa6-45e3-a75aa22fcf0d@suse.de>
 <20230724215746.10928@revelation.broadband>
 <ca6cd674-d268-6210-c66d-4750e28a5c77@suse.de>
X-Mailer: MH-E 8.6+git; GNU Mailutils 3.13; GNU Emacs 27.2
Date: Tue, 25 Jul 2023 22:31:27 +0100
Message-ID: <20230725223127.4184@revelation.broadband>
User-Agent: MH (GNU Mailutils 3.13)
X-Mailman-Approved-At: Wed, 26 Jul 2023 07:30:32 +0000
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


Thomas,

Thank you for your reply.

>> Table 10 in the following document says that  1440x900@60Hz is
>> supported:
>> https://www.intel.com/content/dam/support/us/en/documents/motherboards/server/s5520ur/sb/e44031012_s5520ur_s5520urt_tps_r1_9.pdf
> 
> That manual says that the resolution is only supported with at most
> 24-bit colors. The old X code still supports that to some extend, but 
> modern userspace doesn't.

How can I check for sure whether I am using 24 or 32 bits per pixel ?

>> so in particular the chip is said to be a G200e, not the G200SE-A
>> that the kernel module seems to be interpreting it as. 

> It actually is the G200SE-A. It's just named differently by lspci. The
> PCI device id should be 0x0522.

It is indeed 0x0522.

> So the old kernel already did the right thing.

(but if I understand the situation right Xorg didn't ?)

> You can do
> 
>   cat /sys/class/drm/card1-VGA-1/modes
> 
> on the old and new kernel. With a monitor connector, it will tell you
> the supported resolutions.

With the new kernel and the unmodified mgag200 module it tells me that
1440x900 is not on the list - but Xorg still lists it under
Settings->Display (and Wayland doesn't). With the increased bandwidth
module in place it tells me 1440x900 is on the list. I think this is as
you expect as far as the kernel rather than Xorg is concerned.

Thanks,
Roger.
