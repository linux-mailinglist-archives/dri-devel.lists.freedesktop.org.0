Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5FB275176
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 08:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08CD16E43A;
	Wed, 23 Sep 2020 06:27:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27386E43A
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 06:27:14 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id nw23so26096348ejb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 23:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Y34f+5Kd/KvB1BX6do2jUDB4j8wdx4q8DfhowJXwf58=;
 b=oG1sWhv3Dmb4XCM9aodvPXTg4LSWuo1v1tZFpm+dm5BnSxGWwrDsaWMWO8NENpqYlJ
 Mxc7kmdKp14WCUN1cHFNRW8PhJtr4Mxdvr8A7xqDfmflCHLbpvokISn/dWfEyRADt4EP
 QITPDUMTC5wusUx2hMKpmAKdTr4fMOttm+oXlaUiIflzZeffRYeStWfaPt2R3Fj9nMcb
 KEowo8L0y3M9PZtvbvMwFCqWL1vUX+9Ipk4BCUYiymsWCfLZ2VCinZg7wuQuvwXdMPxm
 PzXVsRMNhJNjw5ldLyNeeRyY6zb8onHRGNq3cBvz+tqB+BwjR/6U+Bisy1i6Xmp/UJk7
 Atig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Y34f+5Kd/KvB1BX6do2jUDB4j8wdx4q8DfhowJXwf58=;
 b=JH3BpJ+yLZFiNTcuTuoabk3DIHw44q/DzIzPYaAUIx45nQ2Zu2+yZ9M43rBWNMo7Xi
 brsieYPWitIFWTfrvHR6qX6VkJ7Doc3+EATeTghZBrYw1M5FfsuFVSKUYvF/KaVKf3S2
 JfE2aV7tPZxMtpSC4TvUNf4XxpvvZY7VQvItSn6tzepwPfPMQ6fps1Esj5ataHcnsXLs
 IId5RnwOcdYgwAgdgIk9QbxHh+e6g4zh66VZ9M7dbTrnwWR3jaIJIW6CPKqksdxi7+/L
 3UogV9Xlkzb8T7t/RZg6qNWMTM6SB5kjWzG0b/C/mj5Orv9YCtjBaGVnd1vm2W7QZW6x
 ZaVw==
X-Gm-Message-State: AOAM530xKHhbcjFJcQbx+Ho/2vERpKBEHUCzZaNIWSYtstN0PuIBm5t6
 ucwWpsnjQOXdGN+I8VdJBGR/pIaAm2Z3nHgKDdM=
X-Google-Smtp-Source: ABdhPJyTRrVqj5fscFNK8YbBtDITUVRbohSzaKj9VdcTLpnqyYN2kGDrJVjfJ72TG/kSKkK+I1tnsUiNW3SuiJ90Evk=
X-Received: by 2002:a17:906:3aca:: with SMTP id
 z10mr8683642ejd.419.1600842433348; 
 Tue, 22 Sep 2020 23:27:13 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 23 Sep 2020 16:27:02 +1000
Message-ID: <CAPM=9tzrrjzx=msAadV8Ru_7shvOWdCunQt733Gy_fdyYS=4Xg@mail.gmail.com>
Subject: rfc/wip ttm get rid of binding branch
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>
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
Cc: Thomas Hellstrom <thomas.hellstrom@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Spent today trying to straighten out some of the ideas I had for
dropping bind/unbind paths into drivers.

https://github.com/airlied/linux/commits/ttm-no-more-bind

I think it mostly trends to the right place, the bind/unbind paths all
end up in drivers, you get a move/invalidate_notify or move_notify in
drivers (only drm_gem_vram, still uses move_notify).

I've only booted nouveau with this so far, just looking to see if it's
a good idea or maybe I've gone too far :-P

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
