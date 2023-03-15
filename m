Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF6F6BBE04
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 21:35:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3CE10E061;
	Wed, 15 Mar 2023 20:35:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5302B10E061
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 20:35:46 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id cy23so80256562edb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 13:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678912544;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=STu7lwk9EWynFbyJNEYgTVBgHJBbpHb6vY8xGQ/7rhw=;
 b=FSHsf23S+z7bVQb6Vq+rVXQ4AkzThCspIf2anR6pirX8XoD4TZWwBG78EbgMEowmic
 l+0USVDmXm6eN4odnJmvDHfJT0OTXK0i/o4w3L/I+N2fVQqI7xs2GUE2qGSphtIiFki5
 hzhKrJBFDM8FjUVJtPzvrOWxqdqs8FYRFn3zXAEfqAjrjeT/ENzhp0JzmSGmkFmitpqe
 LEUbNh5/7HZDd8wmPIAEWq/H63DcebgOyUnkCPyKCtDgOg8R+0BHzTNXyM8fYtaYtys5
 /Bkr5WwITSYG0eJRBuPc6YA1P+iDN71cSfB2jBH6YzIH4G7wuF5I/DXeAMK7G2sGH2be
 TtKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678912544;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=STu7lwk9EWynFbyJNEYgTVBgHJBbpHb6vY8xGQ/7rhw=;
 b=Ax4QVAA4t6Ap7Z6NQFjgJ+ZKvFSLjARGDvzsMi2/pt6MMJoqgnJ0GXVXR8kdja8j2J
 SyDi1vrSkTh19Y+6T95R65NyRNYG46RP5cFSTDrR93apwb2PJAApy22XyLPviq2E+Ptm
 TYFZ7bvzV4KDcFG3FuKen+FGMSAdQopjwCLPgYVKdO2b/hTaQzLB2sv27xDfJjZuFD7E
 IQv/RETI8M0rqgf2KDLr26HRWy/2LFHFx9zpLafdEH/t8hVGMhRwngxQSuxBzdVxRmgd
 bNyOeeWbhg4sornRh4aT6oRuRdLh4N+3Gwy4MU+RkZVNfM9W2v9nieaAI2KfKPWEMkUQ
 FxeQ==
X-Gm-Message-State: AO0yUKUvRLwmrhaWuzULeoYn9o9efhy62HbtI/qWzuWNO74Kn0EaeiE4
 DjzBFCDzgHLSvGHoSxIVUpLe+pzbu6tB8IV/iYx8obir
X-Google-Smtp-Source: AK7set/MjMlEKSe8+TQ0gXyeZW7hT4mNMONUGs9jKLJ+853ZryPu0oV/iyoVSFTi3ctii6WFlS5MruFSzZDK6DgnPcM=
X-Received: by 2002:a50:874e:0:b0:4fb:2593:846 with SMTP id
 14-20020a50874e000000b004fb25930846mr2189681edv.3.1678912544317; Wed, 15 Mar
 2023 13:35:44 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 16 Mar 2023 06:35:32 +1000
Message-ID: <CAPM=9txaQfHkjs6nWcwBtnYQXtr996dyht7wasJ7QOovjepmAw@mail.gmail.com>
Subject: enhancing module info to allow grouping of firmwares
To: "Luis R. Rodriguez" <mcgrof@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey moduly/firmware people,

We are facing a problem in the future of NVIDIA providing giant
firmwares for their devices that are version locked with unstable
APIs. Even if they weren't version locked we'd likely have to support
multiple major versions over time.

Now this becomes a problem because when you generate multiple
initramfs and stick them into /boot over time the number of firmwares
MODULE_FIRMWARE will match will increase and dracut will shove them
all into the initramfs.

I think one way to mitigate that would be to provide some sort of
grouping of module firmwares that are acceptable, and having dracut
only pick one from the list to provide in the initramfs (hopefully the
latest one). That way the driver can provide a list of MODULE_FIRMWARE
lines and userspace knows they are a group.

I've just little idea how we could expose this via current module
info, happy to try and come up with an enhanced scheme maybe with a
fallback to just include all of them but was just wanting to get some
feedback on whether this was something that anyone has ever considered
before now.

Thanks,
Dave.
