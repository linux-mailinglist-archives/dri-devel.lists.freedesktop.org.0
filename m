Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AFD2A374F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 00:50:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B94D86E598;
	Mon,  2 Nov 2020 23:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3271B6E598
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 23:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1604361043;
 bh=0odSNWU3uqM11t6LEvwL2jIVxZtW4lzSgSl4X4aZQ+g=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=BXgybCKKq/aCh5kJp04ksVk5nlrEUeq9V2lgJ5QnC/A3Ra2Z0bVZ68YyaXs3yCdDQ
 PLDHvVMvau3krWvFPHxhLbQgtomdQkCqKiItRZvRd7TYHp1j3jFmbf3fb0sc3+cqjw
 zBctntdY/w4dpqmbCxIR/tcYwaI7Q9I0l3Q8YwlI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [173.228.6.223] ([173.228.6.223]) by web-mail.gmx.net
 (3c-app-mailcom-bs01.server.lan [172.19.170.58]) (via HTTP); Tue, 3 Nov
 2020 00:50:43 +0100
MIME-Version: 1.0
Message-ID: <trinity-0d015aed-dc82-456d-9640-de541eafed45-1604361043510@3c-app-mailcom-bs01>
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel <dri-devel@lists.freedesktop.org>
Subject: Why is atomic_disable callback's plane->state->crtc sometimes null?
Date: Tue, 3 Nov 2020 00:50:43 +0100
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:wSeC25wiUdTDrC0PS9o1wzKex4ouw/HZ8za7rVfl5ii0ZEclHOzShgFGFQYf93Scao1x4
 0zJVDEwfFz4AevUL4IJRNLdshedVo4WJrxOA6D7zUkMA35GUbA0AhVnxC9aDbdFFhLrRP0q2ksqr
 hPWcOkLadwzddZjbx93l7DhAdfxSHj2ufFZyUTj2A1OH3rlrh9R2DcRsgUQ2VE/8/hAsRg8sBz+k
 F3Fl1QA30h2S+ZpfJaSqasgJqjoI+/g46DzFN+EDR4BdP9A6j70utLm0S3NUFDjOfi3oO+s9u/op
 dw=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:B9uENZc9v/M=:zAwGlVBlFM8CUkxXZjb6gh
 qRGFQZJPyVHyeYYppyZ7xRTFUeagmo00Dj7D1WFKViLyt1Ze2YHJzZw1dmPrnyMO23bBqNQsR
 SqqzcXNpIPQUBNeiMthtY5dZlrGGZ+njGd+AjHsV/HLF7vtArgNTuL4/C7DaEkZ9xsV3Fxi0T
 pdKjbSRjwRGUBxJGb+XVO1KKCgm3N4Fr1IsJv0Yw8RoTmm6wv8N+CwQLxOAOUgETuiXpHE/e5
 lXNUafJD4VsutM9cWDyWAlS9iqRogl4y4RanianFoAm88VsjDGZo4ZTchSNf+Kgnh6nJertNB
 J08Z8SCYAel5BXLVOUGWUvZz6hxzus3CJqa7mjeq6MqylvcXSQq5qq2btgGPZCwK3oe/2CEyO
 VwjUaEz9PnE27OT3GL5mHOWW3VAQx6DcbW+YmZViTaaiT3uRCS9aaKmKh1GkGDWN+GFa0ixTj
 optOpfCA0lftlxqkWZulGWygWt/b/wtAwleUui2flBXWfLh9KNC3woKMB4U3TcEvuM9yPtZkD
 WFlzigcRek9eM+8LgR4wOGOHN2Qp5nMTVOEljI1pItGbkUkPnmlamg2U61WDVM4ev73UMC2+h
 UFDhykObj3T44=
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

First, I will like to thank those who gave me hints on how to proceed with getting rid of an unwanted double allocation of visible portion of the frame buffer.

https://lists.freedesktop.org/archives/dri-devel/2020-October/283452.html

I may repost the question later to the mailing list based on the feedback I received.
    After a few more days of trying, I finally got my prototype OpenChrome DRM atomic modesetting code barely working for both primary and cursor planes (cursor plane was not working previously).
I finally figured out what was causing the freeze, and in fact, I am writing this e-mail from the very computer that has the experimental code running.
The code itself is still quite unstable that standby resume is not working and VT (Virtual Terminal) is broken, but X Server is working fine just with a few minor weird artifact lines on the right and bottom edges of the screen.
Anyway, the question I have here (and I am assuming that Daniel Vetter will give me an explanation) is that I noticed that for cursor plane's atomic_disable callback, plane->state->crtc is null or sometimes null.
Why is this?
Assuming that plane->state->crtc will not be null was one the reason why the code was not working, so I will like to know the reason.

Regards,

Kevin Brace
Brace Computer Laboratory blog
https://bracecomputerlab.com

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
