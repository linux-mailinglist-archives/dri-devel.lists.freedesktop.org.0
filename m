Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EADE555231
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 19:19:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 575961135A6;
	Wed, 22 Jun 2022 17:19:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D186E113559
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 17:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1655918338;
 bh=0psRK1LRQ0cczAVCM9k8EILN8Jb8iCK3Zlm/jeDS//o=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=UwRXNWPE7xpN0+emMVQmVyxXupQt4IcHDLxokLaN2IP4EXqfm5Z0zxp/i0cSK6b6K
 h1S1j7o2kIxDQs4ROPhGGQjxBAK3yXPLq9ejCHXUIr3/rJ8mCuQ95JrbR+5d24P446
 ZJ36Af1OjOkKJGKbUXDuWTrslvPuL/+GZvcU0eZ8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [174.250.8.7] ([174.250.8.7]) by web-mail.gmx.net
 (3c-app-mailcom-bs16.server.lan [172.19.170.184]) (via HTTP); Wed, 22 Jun
 2022 19:18:58 +0200
MIME-Version: 1.0
Message-ID: <trinity-356e941b-2ee3-4974-944b-5495ba4d00b8-1655918337996@3c-app-mailcom-bs16>
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: How do I gather up new code to be converted as patches?
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Jun 2022 19:18:58 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:/v/5UPCcGj7w5znF6uZD8iSflmWCgOzifVPYs4bkouVfwlX4Fw7OtgQWYpIOWb6HJYopa
 h0jj4JbDiYkJjrwtoL7IZ1ZO5umhvmxOvPTWkWt37T1KKHtbEZ3TOK6H+ViPpffAoyc9nm1zbopm
 M+cuBGCY/Gn2RJaywr1VQaIvIt1FZha8/qNT5tR+FT4mKuxoT1Y4WVLuwvnRmp4CpN1MgpYakbF4
 fM441R6RvBXmcgHTdMfoNWd/oXZrxVlA88EAVQEYvQuOgjraIyIoXiSjGsh6a66BX4xXvj4GRlIv
 rc=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:S1eM0luEpOs=:wo3a9s6WLGQyxu4R+/jGes
 5rfWKEOV6OEIKfYUicrva5ATbsfCmdIM/d7fkjA2We9VqaX/7G9lTUEjqGizP/bOZCE1fHmd3
 L1RWBg4kI2nDyGn0iL+Yq6MGpTpeGtdyw7YoRVTnuMPtM18KlrRpS+T4I5wn0xe03uK47kknS
 ZlgKZcPCS0nlH7eJtdiNg8hZZM7/KakDnKCH3pyxO6hk0PoDK5Oe/6bWozH/YJUmwc5hN/7VS
 SvmmbgYc2bu/+AKCyymqUSR6t3FIfo1j/lEABR7OI6uxsr1T4XobfTHS+n0m9au8mAbDSRu3D
 P0BTh4NFhUOuVDjV44llc5tZZvjlYThN5c6+IPadgphb6rcq4u0qp1nXHTMyS1PMVP9M+MDhK
 /ss6JWR9/BytqclNJEYP3yzCUwcxkmlgA0gGfzmi1GVA7fRSG+QmfjKMGWWmOFx50IZVzYL7c
 X05OvwH4VadO9//0KNRklJ82tKrXukzEEf/gljas2CiChgeDceDbNCAIin8L0Wd0ocQ5mJxwE
 4w6XVF9dwUSl339CfLLvyNn7qiTpty/ekUw4CLg6P8yLEq/17QI1OCd87GlN4AuUtjaYKzLT2
 AFJ0SyMDySbBLkM/41VzdBHcFoX/JeSDEuQWJcZWeJZfq7V67HPn+GdCyY420SoDCIiqmxfOW
 f4s6m/vD/mEgMOr5T0cow0QI21tFPyxezWlpJImfreZZVKV89mOZid73zXnAIgnMzFofl9hZ4
 R2lsPWRg+sXTvdZ/qTxE0jS/YslqMMv7wtoVpjcmnsQPmDG8qLHKGM3dBovrvL1MOrDmGzSSF
 7mSHg9s
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

I spent about 2 days trying to figure this out, but I guess not a lot of people do this, so I was not able to find a good example somewhere on the Internet.
How to I use git to gather up new code to be converted to patches?
Specifically, I have 20+ new files in one location (drivers/gpu/drm/via) and a small change to DRM main make file (drivers/gpu/drm/Makefile).
If someone can tell me how to do this, I will post the work on dri-devel.

Regards,

Kevin Brace
Brace Computer Laboratory blog
https://bracecomputerlab.com
