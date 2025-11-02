Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B33C2A761
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 09:02:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D3389FEA;
	Mon,  3 Nov 2025 08:02:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=skynet.be header.i=@skynet.be header.b="l3GGihYM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailbnc202.isp.belgacom.be (mailbnc202.isp.belgacom.be
 [195.238.22.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A488310E034;
 Sun,  2 Nov 2025 21:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=skynet.be; i=@skynet.be; q=dns/txt; s=rmail2;
 t=1762118587; x=1793654587;
 h=date:from:to:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=RPE9Bn3/BFqh3RQbnDcQETUu5sum5fwvQLo7RFTDAbU=;
 b=l3GGihYMpQnRatTzHC7szgxpgO/cEEInDyeCdQ7C32uJhLHBQ+M+QG+r
 U9GojN5sWk1NrNllJqrl102AEgVYT2iQY0wjE2jI+2M1Wsbf6G9edB5t2
 2cj4eWjhvbBZdYrdKxL/UbJT2XYZ0TRfhaVdVIUPGWUJKB65omqNG8sYF
 dgmNRG2u2ui0DxySYxBRK6MCQDqpC8QgjSM9Zt39YIKv7WbLVcXURZqht
 N9jvVm0+nbWt50rBi+s6mxdXhE6SwOKSalsiFmd0CLPF0qBItk4kmwztw
 y/ZDRdMsbP9zETW1hEuACUbuEbOL6CR8KM1CDqAmHoytrE0jIe7W6e9fe Q==;
X-CSE-ConnectionGUID: 8mK8eDy6RdOYSXmiL2H+zA==
X-CSE-MsgGUID: GY86iWPAQdmvNU8zH/9S+Q==
X-ExtLoop: 1
X-IPAS-Result: =?us-ascii?q?A2EcBwCGygdp/47PEblagQkJgUmCFoEqgWkDlHsBAQEBA?=
 =?us-ascii?q?QEGgSEdhDGHRpI6gWsPAQEBAQEBAQEBCT0UBAEBAwSRVic4EwECBAEBAQEDA?=
 =?us-ascii?q?gMBAQEBAQEBAQEBAQsBAQEFAQEBAQEBBgQBAgKBHYYJRg1JARABgyyBJgEBA?=
 =?us-ascii?q?QEBAQEBAQEBAR0CDYE2ATWBAl8UghZZgnMUr0qBNIEBhHzZPYFtgUqIUQGFb?=
 =?us-ascii?q?IR4Qn2BEIMghWsBEgGGZQSCIoEOhieCb4E4jjuBShwDWSwBVRMXCwcFgWMDU?=
 =?us-ascii?q?jluMh2BJEEYcYEUg0khaA8GgRKDUYkmD4ESgyiBBYI7PIEMAwttPTcUGwaVC?=
 =?us-ascii?q?heDGEMkCRgEHk8fAUk5NysFkymddJUXhCaMHpVTM4QEjROGSZMLmQaLJYF4a?=
 =?us-ascii?q?5s5gX+BD3BNIBgaglQBMwlJGQ9WAZZdxld3ECwCBwEKAQEDCYhvinoBAQ?=
IronPort-Data: A9a23:ZpA8AK530wkWkUEwWbRYlgxRtFHHchMFZxGqfqrLsTDasY5as4F+v
 mUdX2qAaffbYWX3L9B+bo3n8RkA7cXRyocwQVQ/ri0zEysa+MHILOrCIxarNUt+DCFioGFPt
 ptBNYaadZ5colv0/0/1WlQ0hSMhjclkfpKlVqicfHg3HVI4IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bNNwRcawr40Ird7ko+1BjOkGlA5AFnPKgR5Aa2e0Q9VfrzG4ngdxMUfaEJRoZWd
 86bpJml82XQ+QsaC9/Nut7Tbk0QT7fOChOFg3xQVrLKqkAqSvsai/tT2FI0MC+7uh3R9zxD4
 IwlWa+YEG/FCpbxdNE1CHG0JQknY/IZp+WefxBThuTIp6HOWyOEL/yDlyjaN6VAkgp8KTkmG
 fD1tFnhx/1M7g676OvTdwViuigsBJnuH9MSlmA+9z3+PM0WRJHnGYWJ9/YNiV/chugWdRrfT
 8MdYzd1cFLEahsn1lU/UcJj2r73wCOnLHsB9Aj9SakfugA/yCR10bLzGMHWa9qHWYNfky50o
 0qYoD2hUk9KbbRzzxKqwyLyh9D3tBr3XZw0Ke2q1rk7ux6qkzl75Bo+EAHTTeOCokGkUspfK
 kcPvyYjs7I180nuS9D7VhK1ulaKuQUQVt8WFPc1gCmDzbHY7gOxAmkfUiUHZts9uMIzAzsw2
 Tehj9TzCnljvaOYTVqZ96yItnWify8PIgcqdSgeQk4M5d/kvYc4gzrLT81/C+i7lND4FTzrw
 CyNtG45nbp7pcsGzKz+8V3ZqzatvYTSCAAv6wjbU3mm8gRhIom/aOSA5ULaqPpNMoudZl2Ap
 2Qf3caE4e0CAIqOiCuVBuIXE9mB+P+UNDTajRtjEocs8xyp+mW/ZsZe+jxzKEpyMdoDYXnue
 kC7kQdQ4oJDeX6nYa5+S5y+Bt5szqX6E9nhEPfOYbJmZ5l6dAaK+Al2ZUmK2GbsgA4nlqRXB
 HuAWc+iEWxfUPQ6iWPpAr1Fjvpymnp4yXLVTJX6xFKi17eCIXmTTbYDPR2CY4jV8Z+5nekcy
 P4HX+Pi9vmVeLSWjvX/mWLYEbzGwbXXy3w7Rwy7u9Nv+jZbJVw=
IronPort-HdrOrdr: A9a23:uFuUSanB9j/CsWXPej74b86oiE3pDfKw3DAbv31ZSRFFG/Fwz/
 re4cjzpiWE9Ar5OUtQ6+xoXZPrfZqyz+8P3WB8B8bGYOCEghrcEGgB1/qZ/9SIIUSXnZ8+6U
 4JSdkcNDSaNykcsS+O2njALz9W+qjgzEnHv5a7815dCS5tcL9p9Ap0B0K2FUdsVBBaCZdRLv
 ahz/sCiT7lV3p/VKqG77o+MNQrZeenqHsrW38773dN0nj3sdvIgISKYyRwgy1uLQ+nio1Sjl
 Qt2zaJl5lLesva9vfRulWjnKhrpA==
X-Talos-CUID: 9a23:zUpWR26pIIX1OXg0QdsspEs3Ss0JYyPnwFDhGH+9CEIzaP6HYArF
X-Talos-MUID: 9a23:2VmnywUAJuc2+VPq/BDd1G9jC/9B2qirFmYwwYcm/Ji/dhUlbg==
X-IronPort-Anti-Spam-Filtered: true
Received: from aftr-185-17-207-142.dynamic.mnet-online.de (HELO albert.lan)
 ([185.17.207.142])
 by relay.proximus.be with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 02 Nov 2025 22:23:03 +0100
Received: from libv by albert.lan with local (Exim 4.94.2)
 (envelope-from <libv@skynet.be>)
 id 1vFfXS-000REM-7c; Sun, 02 Nov 2025 22:23:02 +0100
Date: Sun, 2 Nov 2025 22:23:02 +0100
From: Luc Verhaegen <libv@skynet.be>
To: graphics-devroom-manager@fosdem.org
Subject: FOSDEM26 Graphics DevRoom
Message-ID: <aQfLts8tzMUjv1zf@skynet.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 03 Nov 2025 08:02:16 +0000
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
