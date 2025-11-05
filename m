Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 825C4C353AA
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 11:52:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0743810E6F8;
	Wed,  5 Nov 2025 10:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=skynet.be header.i=@skynet.be header.b="BFC7hmQt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailbnc203.isp.belgacom.be (mailbnc203.isp.belgacom.be
 [195.238.22.237])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8125B89143;
 Wed,  5 Nov 2025 10:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=skynet.be; i=@skynet.be; q=dns/txt; s=rmail2;
 t=1762339942; x=1793875942;
 h=date:from:to:subject:message-id:reply-to:mime-version:
 content-transfer-encoding;
 bh=RPE9Bn3/BFqh3RQbnDcQETUu5sum5fwvQLo7RFTDAbU=;
 b=BFC7hmQtjqZv3Z8CAjnW4xfNqiHh9SoKV4H7tCQZPwS7ENMP1mQGZO6m
 KpxyPjyytY/P4CNw1mhmQ7GW7hCSlnOMnsSg1EaQKoiS0iYMqfbpUGLfV
 TFIaYi+gWor7nQQoI5fZ2PHTe3NrGCsIMocuy7AJ1vpUODyRae5D+2JRl
 RRJs5LKfhEyb65j6c0qSNo2YS+Xez7AsEK5HOzVBO4EaXUnBLI3A0/j2M
 Ipxtw0expYMC4YDXGbji9VHougPj4/V/csRYXs726je/isrgfzGJ39lQE
 O6rBLd5yYk7swsmbf2yomN6XpNHPiQlSbKsU6d+rMI3AAfIxqX5Yp2bdC w==;
X-CSE-ConnectionGUID: y3hX9VxoSlW47Bn1uGlhMQ==
X-CSE-MsgGUID: j8aWd4eJT3qOwVSIIEJpBA==
X-ExtLoop: 1
X-IPAS-Result: =?us-ascii?q?A2EJCQBsKwtp/47PEblagQkJgUmCFoEqgWkDlHwBAQEBA?=
 =?us-ascii?q?QEGgSEdhDGHRpBRgWkMgV8PAQEBAQEBAQEBCT0UBAEBAwSRWyc4EwECBAEBA?=
 =?us-ascii?q?QEDAgMBAQEBAQEBAQEBAQsBAQEFAQEBAQEBBgQBAgKBHYYJRg1JARABgyyBJ?=
 =?us-ascii?q?gEBAQEBAQEBAQEBAR0CDYE2ATWBAk0SFIIWWYJzFLNygTSBAYRk2VWBbYFKi?=
 =?us-ascii?q?FMBhW47hD1CfYEQgyCBXYQOARIBhmUEgiKBDoYngm+BOI5JBwdhWxwDWSwBV?=
 =?us-ascii?q?RMXCwcFgTAzAyAKKAwUGQIULw8EFjIdNzkMKBIvGHGBFINJIWgPBoESgRqCN?=
 =?us-ascii?q?wUFiQIbD4EHgj1ogQWCODyBRgkDC209NwYCDBsGRUIdEpNmF4MXQyQJGAQeT?=
 =?us-ascii?q?x8BSTk3KwWTKZ10lReEJowelVMzhASNE4ZJkwuZBiKLA4F4a5s5gX+BD3BNI?=
 =?us-ascii?q?BgagWIYWgEzCUkZD1YBll3HB3cQLAIHAQoBAQMJiG+KegEB?=
IronPort-Data: A9a23:XKh69a75NaQwPQaCSpDXzwxRtMbGchMFZxGqfqrLsTDasY5as4F+v
 mcbX22OOarbZzD3c90kPtiy8kNSvpKGmtY3TgBt+Hg0Eysa+MHILOrCIxarNUt+DCFioGFPt
 ptBNYaadZ5colv0/0/1WlQ0hSMhjclkfpKlVqicfHg3HVI4IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bNNwRcawr40Ird7ko+1BjOkGlA5AFnPKgW5Aa2e0Q9VfrzG4ngdxMUfaEJRoZWd
 86bpJml82XQ+QsaC9/Nut7Tbk0QT7fOChOFg3xQVrLKqkAqSvsai/tT2FI0MC+7uh3R9zxD4
 IwlWa+YEG/FCpbxdNE1CHG0JQknY/IZp+WefxBThuTIp6HOWyOEL/yDlyjaN6VAkgp8KTkmG
 fD1tFnhx/1M7g676OvTdwViuigsBNiwPLNOhGFn9jXmUakMR8nebKHKwOYNiV/chugWdRrfT
 8MdYzd1cFLEahsn1lU/UcJj2r73wCOnLHsB9Aj9SakfugA/yCR10bLzGMHWa9qHWYNfky50o
 0qWoD+jWEBBaLRzzxKHonuTirPCvx+gQaUNKoaZ19NImHe6kzl75Bo+EAHTTeOCol65Qd0aJ
 0EK9y4Gqakp6FftXp/6RRLQiG6DpBFZUtxWFPA84wylzqvP/x3fCHIJQzJMc986s9dwQiYlv
 neMksjgQDBirpWRSGmB7fGatz6/NSUOLnMFfWkDVwRty9X5ocQ/gwzCSv5nEbWplZv7Azz9z
 z2RrzQ5n/MUl8Fj/7qy7FTOhT7pqpXXQwod4gTMQnnj4Bl0aYKofI+07kCd6uxPRLt1VXGIs
 mQe3pHOsaVXUtTXzHPIGblXWr244f+AMTaahFhiA9wm8TCs/XPlcY04DCxCGXqF+/0sIVfBC
 HI/cysOjHOPFBNGppObr2585wrGAEQg+RnYuijoU+dz
IronPort-HdrOrdr: A9a23:7YrbvqqajHO5vZQHxYQoQtEaV5ojeYIsimQD101hICG9E/b4qy
 nApoV+6faZskd1ZJhCo7690cu7LU80nKQdieJ6AV7IZmbbUQWTQb2KobGD/9S2IVydysdtkZ
 1BXsFFeb7NMWQ=
X-Talos-CUID: 9a23:ynpNLW2lw667MNWwkrjPILxfC5slQizj3HDrJ3DkVkxvEaC6TV+1wfYx
X-Talos-MUID: 9a23:6tHC5wogZK0gLFTSBvcezzMyPfhkv6mMNBsUtoo4gOilGA5oER7I2Q==
X-IronPort-Anti-Spam-Filtered: true
Received: from aftr-185-17-207-142.dynamic.mnet-online.de (HELO albert.lan)
 ([185.17.207.142])
 by relay.proximus.be with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 05 Nov 2025 11:52:19 +0100
Received: from libv by albert.lan with local (Exim 4.94.2)
 (envelope-from <libv@skynet.be>)
 id 1vGb7i-000U0e-G9; Wed, 05 Nov 2025 11:52:18 +0100
Date: Wed, 5 Nov 2025 11:52:18 +0100
From: Luc Verhaegen <libv@skynet.be>
To: xorg-devel@lists.x.org, xorg-announce@lists.freedesktop.org,
 mesa-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
Subject: Graphics DevRoom 26: Cfp.
Message-ID: <aQssYjyLgxAP67Cl@skynet.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Reply-To: graphics-devroom-manager@fosdem.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

20 years after the first X.org DevRoom at FOSDEM 2006, there will be the 
16th Graphics DevRoom at FOSDEM on Sunday the 1st of February 2026.

The talk topics of the graphics devroom encompass:
* graphics drivers: display, 2d engines, 3d engines, at bootloader, 
kernel and userspace levels.
* media/video drivers: camera/capture engines, hardware media encoders 
and decoders on all levels.
* input drivers for bootloaders, kernels and userspace.
* windowing systems (X, wayland, surfaceflinger, others) and window 
managers.
* graphics toolkits (QT, GTK, others).
* 3D and Compute APIs (OpenGL, Vulkan, DirectX, others), and 3d and game 
engines.
* Virtual reality hardware and toolkits.
* Artificial Intelligence HW acceleration.
* Media encode and decode applications.
And the tools needed to help configure and run the above.

Submission deadline is the 7th of december, but do not count on this 
date, once the schedule has filled with enough solid talks, we will 
accept no more. Also, the best slots (afternoon) will be handed out on a 
first-come-first-serve basis.

You can submit your talk here: https://fosdem.org/submit

Since this an open source community event, please refrain from turning 
in a talk that is a pure corporate or product commercial. Also, this is 
a highly technical devroom on a conference aimed at developers and 
advanced users, so please only submit talks on a subject you actually 
worked on.

If you are unsure on whether you can come or not, perhaps you are unsure 
about corporate sponsorship of your travels (this is FOSDEM, why are you 
not there anyway?), wait with submitting your talk until you are certain 
that you can be present.

Please put some time and effort in your talk proposal, especially in the 
title and at least abstract, and your own background. While there is no 
more printed schedule, your description is what will get people to watch 
your talk, and will remain online forever next to the recording of your 
talk.

We have a full day at our disposal, which runs from from 9:00 til 17:00, 
so we can fit anywhere between 8 and 16 talks. With 5 minutes for setup 
time, and 5 minutes of Q&A, full hour talks are actually 50 minutes, and 
half hour talks are 20 minutes. Depending on the amount of proposals, we 
might need to switch to 20 minute talks for everyone.

All talks will be recorded and made available as CC-By-Sa or CC-By. The 
FOSDEM CoC will have to be agreed as well 
(https://fosdem.org/2026/practical/conduct/).

Submission tips:

When submitting at https://fosdem.org/submit, you can ignore the "You 
can enter proposals until 2025-11-16 22:00 (Europe/Brussels), 2 weeks 
from now." statement, as that is for Main track talks only, and not 
relevant for DevRooms.

Please put some time and effort in your talk proposal, especially in the 
title and at least abstract, and your own background. While there is no 
more printed schedule, your description is what will get people to watch 
your talk, and will remain online forever next to the recording of your 
talk.

On the first page, for track, select "Graphics". Please write your 
preferred slot length (20 or 50) in the submission notes. On page 2 you 
also need to provide a code license, this is a free-form field, so write 
what is appropriate.

If there are any issues, just email graphics-devroom-manager@fosdem.org, 
where you can reach the team of graphics devroom managers, Arek Hiler, 
Timur Kristóf and myself, who will also schedule and review your talk 
submissions.

We will be keeping a keen eye on submissions and scheduling, and hope to 
see you all at FOSDEM.

Thanks!

Luc Verhaegen.

