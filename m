Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DE111C892
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 09:55:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04316ECBB;
	Thu, 12 Dec 2019 08:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com
 [IPv6:2607:f8b0:4864:20::a43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D55F06EC38
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 03:12:05 +0000 (UTC)
Received: by mail-vk1-xa43.google.com with SMTP id x199so349544vke.6
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 19:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=qFy+H7kpLOQCi2bXrFGLfTS3hB32HkInVCl6xfT8dpg=;
 b=f9f/ZIvuhipfZkdJbWXmdGI3pVMCVcwBp91c+WjdjRo8ogGWLZS3JS2kuPWNcx+1Q8
 4uncLB4lh9/sFVuGKRR7v+gqyvU/NxI5iLZw9c5Co3VigcfvfZdcuG3feEoXrJn4ayz6
 ynozln2QsBfUBfTPEindwhC5fALHrBYEn4+qYYzOWMdmNDazgRiO1mmZQTLVJ3p8hely
 tVy/pVxscfZjGlAYb5Nj5QykmVfs4Oog3NCRSOmtkqxzFV048FN03SdFqN+N/14Z33GX
 5iqyZJRbBAkvOXt9XAz4GUnqWxmuLoV3VKNoTU9a1KJc5v1Euzfvx9AXXqElonuWjB1Y
 j4EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=qFy+H7kpLOQCi2bXrFGLfTS3hB32HkInVCl6xfT8dpg=;
 b=uYCnZzIIsA1y5apMlx1iBF81STg2yIVOlSpEya64fTAQrZIWNkO2gJkqktrN9RtBiK
 tDHmxig9IfHBhCRS+uqHtuIfb7g4Ypa49TA4PBV6RxGtSxKHdpYJvDhsASRwi7EYdVQ/
 mfm8NoWM9rOGptNjXViDqyS54zp3IQbOwbi/48q3pI+Chk37PNm9yRC+WH+fZ9diXkMC
 cwtQdor5MUdtXMSHrKuJiLYzn53h9p8mASn6olXRkLvj8VSuLAYVW4//aQUmJCP6K3y7
 w+OhZlulnA1bVG2hZvMgo6yqvmaC0i5hqiQ5egiteSfvg1FtqQhaYLhGMRpZGOw1Nghf
 CoKA==
X-Gm-Message-State: APjAAAU+ZkdJVmfT6SwTJNF5N0lpXP8x8rP4+LvJgPkCjkMrpZ/AZ9DR
 R+cK1xIlf9+JkyEIX0fSbQO7VjGCkEKHqhRUBnga2d10t2E=
X-Google-Smtp-Source: APXvYqyx6Zmd4raW5J9N4q6zfcO2N6hCriLaDY868jczHq1oZAwZy5vfjRr6qFs+8X5Mt5AZsetwbIwA7bymHuMosG0=
X-Received: by 2002:ac5:cb1b:: with SMTP id r27mr7111767vkl.97.1576120324681; 
 Wed, 11 Dec 2019 19:12:04 -0800 (PST)
MIME-Version: 1.0
From: AceLan Kao <acelan@gmail.com>
Date: Thu, 12 Dec 2019 11:11:54 +0800
Message-ID: <CAMz9Wg91R82Xj+gQJCZHaHzvPE81V59thDkTqbq5578caEjKMQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/i915: Assume 100% brightness when not in DPCD
 control mode
To: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Thu, 12 Dec 2019 08:55:06 +0000
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

This series of patches works well on a new platform which has a panel
only controls by DPCD aux brightness.

Tested-by: AceLan Kao <acelan.kao@canonical.com>

-- 
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
