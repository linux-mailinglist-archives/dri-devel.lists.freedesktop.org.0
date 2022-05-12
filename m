Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D405251B4
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 17:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E97B6112652;
	Thu, 12 May 2022 15:58:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5CDE112652
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 15:57:58 +0000 (UTC)
Date: Thu, 12 May 2022 15:57:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1652371076;
 bh=v4iEiHbRYsw1zSS5MV+mUxhAbI/jE2IIMdDmWuVzZ6E=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=CgJBlZiymPn5AmLyIRD6VN4wTqjEV5sAof60AirAopx0VZlpHbkqWwbAqtv3vvIX+
 srFclqntJQVCrnjut401gbXxbdJBcIKhoUpm+uGf2J0wY90d8vNIE2FDUowe74r0SQ
 R+AFAdHK5v/iQrogm6LucivULKrdEWq0BLe53tUfI6Xpv6M45WtqCD/e/5hQKUte61
 KF1kw3ldBydD4nk3U3TgswPVnoaYIXJcmcPMDJOilyx7JO09QqmeXuNYGEyQ+0QVMo
 ouLd2pnEeJjazqTqKVx/sOhnZFwo6bdmlbfruqfidkS0SBEeCj4bYsMh31qD4pnDdM
 Wz6WbMW8T5ScA==
To: Mark Yacoub <markyacoub@chromium.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH libdrm] xf86drmMode: Create
 drmModeCreatePropertyBlobWithFlags
Message-ID: <qKRKdiAeH6GpFefVyigqHct3kapx9qkkizlooM6XHlb6Fed79omcgGtLAx5YSqJSQ-BC9Ei2bPG_ICx4juR6E8S-KN2xmkSAE8tIkq7NQVc=@emersion.fr>
In-Reply-To: <20220512154549.2003425-1-markyacoub@chromium.org>
References: <20220512154549.2003425-1-markyacoub@chromium.org>
Feedback-ID: 1358184:user:proton
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: seanpaul@chromium.org, dri-devel@lists.freedesktop.org,
 markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Note, the headers in include/drm/ must be updated in a special manner
from the kernel. See the README in the subdir for details.
