Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6E72F462C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:22:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311A66E104;
	Wed, 13 Jan 2021 08:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1557 seconds by postgrey-1.36 at gabe;
 Wed, 13 Jan 2021 01:18:16 UTC
Received: from mail001.nap.gsic.titech.ac.jp (mail001.nap.gsic.titech.ac.jp
 [131.112.13.101])
 by gabe.freedesktop.org (Postfix) with SMTP id 9AF8789A35
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 01:18:16 +0000 (UTC)
Received: from 172.22.40.202
 by mail001.nap.gsic.titech.ac.jp with Mail2000 ESMTP Server
 V7.00(21113:0:AUTH_RELAY)
 (envelope-from <matsumoto.r.aa@m.titech.ac.jp>);
 Wed, 13 Jan 2021 09:52:04 +0900 (JST)
Received: from mail001.nap.gsic.titech.ac.jp (mail001.nap.gsic.titech.ac.jp
 [131.112.13.101])
 by drweb05.nap.gsic.titech.ac.jp (Postfix) with SMTP id 92BFD13FD04;
 Wed, 13 Jan 2021 09:52:04 +0900 (JST)
Received: from 153.240.174.134
 by mail001.nap.gsic.titech.ac.jp with Mail2000 ESMTPA Server
 V7.00(21083:0:AUTH_LOGIN)
 (envelope-from <matsumoto.r.aa@m.titech.ac.jp>);
 Wed, 13 Jan 2021 09:52:04 +0900 (JST)
Date: Wed, 13 Jan 2021 09:51:59 +0900 (JST)
Message-Id: <20210113.095159.2007886149433657238.ryutaroh@ict.e.titech.ac.jp>
To: lucas@debian.org
Subject: Re: [PATCH RFT 0/2] drm/vc4: Clear the display list on startup
From: Ryutaroh Matsumoto <ryutaroh@ict.e.titech.ac.jp>
In-Reply-To: <20210112195655.GA16821@xanadu.blop.info>
References: <20210112134730.810697-1-maxime@cerno.tech>
 <20210112195655.GA16821@xanadu.blop.info>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Mailman-Approved-At: Wed, 13 Jan 2021 08:21:20 +0000
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
Cc: maxime@cerno.tech, dri-devel@lists.freedesktop.org,
 dave.stevenson@raspberrypi.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

> week-end, so I cannot test before early next week. However I'm Ccing
> Ryutaroh Matsumoto who could also reproduce it. Maybe he is in a better
> position to test this (@Ryutaroh: I bounced the patches to you).

Should I apply PATCH RFT 0--2/2 to
https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.10.7.tar.xz
or some branch of someone's git repo?

On my Raspberry Pi 4B 8GB model, all versioins up to upstream 5.10.6
fail to boot on USB MSD due to changes to the USB handling by raspi
introduced in 5.10 series, and failed to boot from an SD card up to 5.10.3
or so. No working WiFi connections neither on my raspi 4b.

I am unsure if I can test the patch reliably. But I will try it within a few days.

Best regards, Ryutaroh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
