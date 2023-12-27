Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A847F81EFC0
	for <lists+dri-devel@lfdr.de>; Wed, 27 Dec 2023 16:27:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF2410E074;
	Wed, 27 Dec 2023 15:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 510 seconds by postgrey-1.36 at gabe;
 Wed, 27 Dec 2023 15:27:51 UTC
Received: from mail.rmail.be (mail.rmail.be [85.234.218.189])
 by gabe.freedesktop.org (Postfix) with ESMTP id 59B0610E0C2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Dec 2023 15:27:51 +0000 (UTC)
Received: from mail.rmail.be (domotica.rmail.be [10.238.9.4])
 by mail.rmail.be (Postfix) with ESMTP id 82E3A46ED6;
 Wed, 27 Dec 2023 16:19:19 +0100 (CET)
MIME-Version: 1.0
Date: Wed, 27 Dec 2023 16:19:19 +0100
From: AL13N <alien@rmail.be>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org
Subject: RPI4B: what is needed for /dev/video10 to work ( v4l_m2m )
Message-ID: <7dc14b52e065177eee044348599b8b33@rmail.be>
X-Sender: alien@rmail.be
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,


I have a RPI4B with upstream kernel 6.1 64bit and there is no 
/dev/video10 present. I thought if I waited a bit more, it would appear 
in the kernel, but that was folly on my part.

Currently, watching a movie is painful since the software decoding is 
way too slow and it has very low fps on 1080p (or even 720p or even 
480p)

IIRC, someone told me something else has to be fixed before the codecs 
can be done, but I don't remember what it was, or i didn't find it in my 
email/the archives.

Can someone tell me what exactly needs to be done (in kernel) so that I 
can take a crack at it, (hopefully with some help)?

I don't remember if this was relevant, but there was some talk of 
needing to use opengl output with a specific texture format for it to 
work? or is that seperate?


Thanks in advance,

AL13N
