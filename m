Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A876C67527
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 06:11:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5439110E0C3;
	Tue, 18 Nov 2025 05:11:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.b="xMjtBTNd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460F610E0C3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 05:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1763442694; x=1763701894;
 bh=eGJYegJXYdkTkpnVMFHSx4fCvqjsPGRM2tW017C5z6I=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=xMjtBTNd0mkjrbIqar07gub107F/Ab7BKNXk/C1HNCJDy2QKFbbrDjl/ahKV4zXwY
 DyhN7p/ezh59K9tQx0lJ1VGgpgrB0ld5y3r7Dx2/ra+iuqvoJ3ICGYNgKLjzG8ZJ2u
 E4vKie0z+uiO5Yz+Pep33jBqzdfejqP65GKpY9+HyDHXNI6txVsOdERh00mVc/RQPp
 ZkO0ZZ1gx0ZKeMa6P+nnwMV74o6dGNSr7MM7CyKmEBNRkVO6R6sBE8mFusX6Ow/HP1
 hdxn/eh+Rnz0XaeI8io9Is9E7E8LGcvPlqG3hjAL1QsiMlbEKbuQZFXmnU+eDCsOCh
 ribdEdSvwkm+A==
Date: Tue, 18 Nov 2025 05:11:29 +0000
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
From: CS Sushi Man <cssushiman@protonmail.com>
Subject: Question about Documentation
Message-ID: <QtcHY-S3WYkUFd-_P1GNmqw_vKiRVK_x4TbN8UTzSFk1AUQhUYmLoFDKezJ2kQZCvh3VjhGA1bJaJ6W8OeMubWXCw-lBdalbRbere18y_7E=@protonmail.com>
Feedback-ID: 93478688:user:proton
X-Pm-Message-ID: a85d20def00adeccbddeee980dbf7681096e55a6
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Greetings dri-devel,

  I wish to find adequate documentation on the userspace protocols that an
application like X11 would use. I also intend to utilize GPU acceleration, =
as
well as access the 3D/compute engines at a more direct level (direct access=
 to
the push/command buffer).

  I have seen that there is documentation in the Linux kernel docs, however=
,
this seems to be primarily for reference by the driver developers; It would=
 be
a bit slow for me to decipher the correct order/functions to use to for exa=
mple,
create a framebuffer, and attach it to a CRTC, using this documentation. I =
am
looking primarily for a large, single programming guide (sort of like the C=
UDA
C++ programming guide). I also intend to utilize MPO with X11 itself.

  I would appreciate some pointers, and some advice on how to utilize this
API to its full potential, since I really like Linux. I already know how to
build and link with LibDRM. Thanks for your time,

  - Michael

PS. I wrote an earlier message to this mailing list, however, it was poorly
worded, and it used HTML tags. I am sorry to have brought such horrors upon=
 this
space, please forgive me.
