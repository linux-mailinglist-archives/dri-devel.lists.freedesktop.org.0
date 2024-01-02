Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C495821EBE
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jan 2024 16:33:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C346E10E1C6;
	Tue,  2 Jan 2024 15:33:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.rmail.be (mail.rmail.be [85.234.218.189])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0919010E1C6
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jan 2024 15:33:21 +0000 (UTC)
Received: from mail.rmail.be (domotica.rmail.be [10.238.9.4])
 by mail.rmail.be (Postfix) with ESMTP id 4273A474AE;
 Tue,  2 Jan 2024 16:33:20 +0100 (CET)
MIME-Version: 1.0
Date: Tue, 02 Jan 2024 16:33:20 +0100
From: AL13N <alien@rmail.be>
To: dri-devel@lists.freedesktop.org
Subject: Re: RPI4B: what is needed for /dev/video10 to work ( v4l_m2m )
In-Reply-To: <pvdyykhzadinp67zppew25zekdy3pinvhton3okdex3gsvq7ex@lp7uz7dxd3rc>
References: <7dc14b52e065177eee044348599b8b33@rmail.be>
 <pvdyykhzadinp67zppew25zekdy3pinvhton3okdex3gsvq7ex@lp7uz7dxd3rc>
Message-ID: <c253cdf461c0be41debc0193705f9381@rmail.be>
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
Cc: Maxime Ripard <mripard@kernel.org>, Emma Anholt <emma@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maxime Ripard schreef op 2024-01-02 11:03:
> Hi,
> 
> On Wed, Dec 27, 2023 at 04:19:19PM +0100, AL13N wrote:
>> I have a RPI4B with upstream kernel 6.1 64bit and there is no 
>> /dev/video10
>> present. I thought if I waited a bit more, it would appear in the 
>> kernel,
>> but that was folly on my part.
>> 
>> Currently, watching a movie is painful since the software decoding is 
>> way
>> too slow and it has very low fps on 1080p (or even 720p or even 480p)
>> 
>> IIRC, someone told me something else has to be fixed before the codecs 
>> can
>> be done, but I don't remember what it was, or i didn't find it in my
>> email/the archives.
>> 
>> Can someone tell me what exactly needs to be done (in kernel) so that 
>> I can
>> take a crack at it, (hopefully with some help)?
>> 
>> I don't remember if this was relevant, but there was some talk of 
>> needing to
>> use opengl output with a specific texture format for it to work? or is 
>> that
>> seperate?
> 
> That's something for linux-media. The hardware codec isn't part of vc4
> or v3d, it's a separate controller that requires a separate driver (in
> v4l2).
> 
> That driver isn't upstream, and that would need the first thing to
> tackle.
> 
> Maxime

Can I assume you're talking about the vchiq driver, which would have 
multiple things including codecs, or am I misunderstanding it?
