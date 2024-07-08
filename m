Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E97929C26
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 08:27:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A2DC10E1E7;
	Mon,  8 Jul 2024 06:27:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iQvDtGEM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA3FE10E1E7
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 06:27:41 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [194.75.195.10])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3CF938D0;
 Mon,  8 Jul 2024 08:27:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1720420028;
 bh=M2yZFFWGMI2s0O1mAmsg/59lSWpUZvsuyIzL+Z1KSpg=;
 h=Date:From:To:Cc:Subject:From;
 b=iQvDtGEMeevEnkmZ4Wsa29iNAnK64+xOKo6r8r7UfowtvcP8Kxf4Eh12k5EBN35PS
 X16PqvEsT5Qh08cCkgM96e901CgcehwLkSSEYWIzukb2P98U/bRAZDh12NiTepG7aM
 evoRBuHWyUVLR6nc29/X75cfqf2bkSgL056nD0gQ=
Date: Mon, 8 Jul 2024 09:27:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: =?utf-8?B?8J+Qpy1tZWRpYQ==?= <linux-media@vger.kernel.org>,
 =?utf-8?B?8J+Qpy1kcmk=?= <dri-devel@lists.freedesktop.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>
Subject: CFP: Complex Cameras =?utf-8?B?4oCTIFVu?= =?utf-8?Q?locking?= the
 Future of Open-Source Camera Software
Message-ID: <20240708062718.GA10946@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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

Ricardo and I are co-organizing a microconference during Linux Plumbers
2024 in Vienna to discuss problems related to support of complex cameras
in Linux systems, and find how to solve them.

The camera hardware landscape has undergone a dramatic transformation,
moving from simple frame producers to highly configurable and
programmable systems. Unfortunately, open-source camera software has
struggled to keep pace, creating a bottleneck that hinders innovation
and limits the potential of modern camera technology.

The Complex Camera microconference will bring together key stakeholders
to address the urgent challenges and opportunities in open-source camera
software development.

Call for Proposals:

We invite proposals for topics in the following and related areas:

- What kind of kernel API is required for Complex Cameras?
- What level of hardware documentation do we require from vendors?
- In which kernel subsystems should Complex Cameras reside?
- How shall the camera stack interact with other subsystems like
  NPUs/GPUs?
- What does the perfect camera software stack look like?
- How can we support dual camera stacks (open and proprietary) on top of
  a single upstream kernel driver? Can we support non-open features?
- How can we allocate/share memory efficiently between the different
  subsystems?

Who Should Attend:

- Kernel developers
- ISP vendors
- OEMs
- Camera software developers
- Linux distribution maintainers

Microconference Format:

The microconference will consist of short discussion topics, introduced
and moderated by the participants. Each topic lead is expected to
prepare a short presentation that will be shared with all the attendees
in advance so we can use the Micro Conference for questions and face to
face discussions.

After the conference we will divide in smaller working groups.

Submission Deadline: 15th July 2024

We look forward to your contributions in making complex cameras a
reality in Linux!

[1] https://lpc.events/event/18/contributions/1679/

-- 
Regards,

Laurent Pinchart
