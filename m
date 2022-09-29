Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B77845EED67
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 07:54:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7131B10E75A;
	Thu, 29 Sep 2022 05:54:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B34010E75A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 05:54:48 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id bu25so690176lfb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 22:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date; bh=D2zS5R+SY5lgsDeCv88fyOwWafVkPPO/OVXuVjWeCOo=;
 b=f5fnw/+L+FYHa1FYi9FBNU0FCwiWpcZ/rxWwmniE2SW63TIjqvGX2xFEu7asDNsMN2
 cNmfk5lZR698gPO8B4UwUdZgGYcL2+nsgw7pA+iwdWn6ttedt07DARvd3SL+ZUejNPtn
 y66aTgvbrtnrBQSyqqDYFi55W0Yg0gNznPf5Rmd3u4srco9XdPrtWq4gJrlT7NxWayL1
 SiZC4FvV23yPnoJoLGaytGvnvNOxQBayE/ol8WvcFSXUWvZdbK+bXXBGczcKbmWFWjyg
 rcNL7QH6sSjOP0RhHTxtb7TXxZxNZKoQmF3+WtBDjkEqRtEINauncq1NK/Srx13rNOws
 tGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=D2zS5R+SY5lgsDeCv88fyOwWafVkPPO/OVXuVjWeCOo=;
 b=y1u/KoNJxdVyi3kH36H/Hv4/v7/V9tG2Gv16euYab8HJn6pva4A9mhTxr17es3IM64
 6CeHrM3EoKrJxB0jCcyzCoupGL/1/maY+wuk1T8e+9my31lf8mMBEmtxOO76qv2F2VAN
 0JdtJ1hozeJUtRlqNXlcX7TUhqYHrZror5cQ0ebfbkIGLML6+5ewDu69fVaJMSmPUhDH
 srdA0WyLWyDWr4WQjnC+yK8rMWSCwLggcCOcue6DscquhZrB7Z8jSvSExyf4n6Tvn/5N
 8kiBtXvbDqWYCvSKL1gByUH++07xkGyu6E0wVU5QVRfV7wr8HwSlkTGsc30nhi0JbIHD
 zUZw==
X-Gm-Message-State: ACrzQf1K6sXFbsgMmELSXHSs9TBB2EQCE1QSDLmnOeo7BpgJ1xVwlU5Q
 J/mqj6F8IAY7TsjBOjb59sYnCqHt09RezD+CPOU=
X-Google-Smtp-Source: AMsMyM45Xhrei0Jxvyg5Yw9oZZvDP5VYwgRjurV/0zwF/Tqam1EbAHDipQ1+9cqK5vuYxobKGrZO+FQV9l3IUcrccE0=
X-Received: by 2002:a05:6512:22d2:b0:49e:19a6:a304 with SMTP id
 g18-20020a05651222d200b0049e19a6a304mr599740lfu.561.1664430886602; Wed, 28
 Sep 2022 22:54:46 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?6JGJ5pif6L6w?= <yexingchen116@gmail.com>
Date: Thu, 29 Sep 2022 13:54:35 +0800
Message-ID: <CAMXbVUcSNwaW9_RGE=3H=4H8S_kK4bwm=zfaeKt9F=z6CUkBQw@mail.gmail.com>
Subject: Re: [PATCH linux-next v2] backlight: use sysfs_emit() to instead of
 scnprintf()
To: daniel.thompson@linaro.org
Content-Type: multipart/alternative; boundary="000000000000bfccd505e9ca8357"
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
Cc: linux-fbdev@vger.kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 lee@kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ye.xingchen@zte.com.cn, yexingchen116@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000bfccd505e9ca8357
Content-Type: text/plain; charset="UTF-8"

Thanks for your reply.

This patch about lp8788 fixes have already applied in:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=61e86018aebffd172c9da967f284469924d5e947

So this patch just fixed the rest.

Best Regards,
YE XINGCHEN

--000000000000bfccd505e9ca8357
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for your reply.<div><br></div><div dir=3D"auto">This patch about lp8=
788 fixes have already applied in:</div><div dir=3D"auto"><div><a href=3D"h=
ttps://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?=
id=3D61e86018aebffd172c9da967f284469924d5e947">https://git.kernel.org/pub/s=
cm/linux/kernel/git/next/linux-next.git/commit/?id=3D61e86018aebffd172c9da9=
67f284469924d5e947</a></div><br></div><div dir=3D"auto">So this patch just =
fixed the rest.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Best Reg=
ards,</div><div dir=3D"auto">YE XINGCHEN=C2=A0</div><div dir=3D"auto"><br><=
/div>

--000000000000bfccd505e9ca8357--
