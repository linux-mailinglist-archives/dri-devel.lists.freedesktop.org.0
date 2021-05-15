Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D80C381944
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 16:12:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B236E1BE;
	Sat, 15 May 2021 14:12:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F796E1BE
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 14:12:05 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id AEA30240026
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 16:12:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
 t=1621087923; bh=nYWsiFXeww31dfCt2HdQr49qDRQj4YG+cC5C2F74D4A=;
 h=To:From:Subject:Date:From;
 b=pcA07WxrYIrqrXFnorTSZ91nYaJoTtxdEcn8eJw0Qt6QYKcRJsPZh/xFVeIlCA9uk
 IjVdAnBv4pum32AAQd8Caim3h70v6UXPPgUUQzohPiHSZrje/8VoTVRfpSrh/1ZeZa
 IerQLJKXRfoeCiVaNmbeN5hfwA4NwhmDgIYYZNkjg2TXVweVvOpgYiNzRHL4jOg9EZ
 H49l9wHgnRj0CeUD9QECkKAldtJYbZlhjzsS1x+ixFdWwoUPDr9TTrSaLoley56mxW
 xVuV0zt3zNRA7pYvbWh5nvLfSwo7XaBlmxD5SjxM6Cj/hJ/Bjr8X1KoQuCuLUvyKfK
 OVJ75dr7QNHtw==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4Fj6lk73Mgz6tmD
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 16:12:02 +0200 (CEST)
To: dri-devel@lists.freedesktop.org
From: Richard Dietrich Wachler <rwachler@posteo.net>
Subject: dual RX460 result in logspam about P2P DMA
Message-ID: <68fa29da-d548-b179-cae4-77de5ae7766f@posteo.net>
Date: Sat, 15 May 2021 14:11:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

Excuse my novicesness,

i use 2 RX460 on a KGPE-D16 server board to drive 4 displays.

02:00.0 VGA compatible controller: Advanced Micro Devices, Inc. 
[AMD/ATI] Baffin [Radeon RX 460/560D / Pro 
450/455/460/555/555X/560/560X] (rev cf)
06:00.0 VGA compatible controller: Advanced Micro Devices, Inc. 
[AMD/ATI] Baffin [Radeon RX 460/560D / Pro 
450/455/460/555/555X/560/560X] (rev cf)

There is a noticeable mouse lag on the second card, so i investigated 
and got logspam 20 times a second like this:

May 15 15:58:27 xx kernel: amdgpu 0000:02:00.0: cannot be used for 
peer-to-peer DMA as the client and provider (0000:06:00.0) do not share 
an upstream bridge or whitelisted host bridge

It seems there is no real way to disable the check or disable P2P DMA 
completely. Or maybe my problem is elsewhere?

Thanks for any hints, i havent found anything about this as its quite a 
new feature.

Richard Wachler

