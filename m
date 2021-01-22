Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D382C2FFE99
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 09:46:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB5996E9F9;
	Fri, 22 Jan 2021 08:46:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail003.nap.gsic.titech.ac.jp (mail003.nap.gsic.titech.ac.jp
 [131.112.13.103])
 by gabe.freedesktop.org (Postfix) with SMTP id B38066E99A
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 05:11:58 +0000 (UTC)
Received: from 172.22.40.205
 by mail003.nap.gsic.titech.ac.jp with Mail2000 ESMTP Server
 V7.00(2589:0:AUTH_RELAY)
 (envelope-from <matsumoto.r.aa@m.titech.ac.jp>);
 Fri, 22 Jan 2021 14:11:39 +0900 (JST)
Received: from mail004.nap.gsic.titech.ac.jp (mail004.nap.gsic.titech.ac.jp
 [131.112.13.104])
 by drweb08.nap.gsic.titech.ac.jp (Postfix) with SMTP id EF3BDF1;
 Fri, 22 Jan 2021 14:11:38 +0900 (JST)
Received: from 153.240.174.134
 by mail004.nap.gsic.titech.ac.jp with Mail2000 ESMTPA Server
 V7.00(2689:0:AUTH_LOGIN)
 (envelope-from <matsumoto.r.aa@m.titech.ac.jp>);
 Fri, 22 Jan 2021 14:11:36 +0900 (JST)
Date: Fri, 22 Jan 2021 14:11:32 +0900 (JST)
Message-Id: <20210122.141132.913061490695168856.ryutaroh@ict.e.titech.ac.jp>
To: lucas@debian.org
Subject: Re: [PATCH 1/2] drm/vc4: Correct lbm size and calculation
From: Ryutaroh Matsumoto <ryutaroh@ict.e.titech.ac.jp>
In-Reply-To: <20210121162622.GA16797@xanadu.blop.info>
References: <20210121105759.1262699-1-maxime@cerno.tech>
 <20210121110406.yeb4zoqwwgilyrhq@gilmour>
 <20210121162622.GA16797@xanadu.blop.info>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Mailman-Approved-At: Fri, 22 Jan 2021 08:45:43 +0000
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
Cc: popcornmix@gmail.com, maxime@cerno.tech, dri-devel@lists.freedesktop.org,
 dave.stevenson@raspberrypi.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

>> This one should fix your issue
>> Feel free to test it and let me know if it's not the case
> I confirm that the patches fix the issue I was seeing.

I also applied the sent patches
[PATCH 1/2] drm/vc4: Correct lbm size and calculation
[PATCH 2/2] drm/vc4: Correct POS1_SCL for hvs5
to the 5.10.9 kernel, and the symptom disappeared on my Raspberry Pi 4B 8GB.

Thank you very much! Ryutaroh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
