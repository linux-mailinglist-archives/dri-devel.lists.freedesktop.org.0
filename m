Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E35BF6334CB
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 06:46:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B07D10E36F;
	Tue, 22 Nov 2022 05:46:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C2010E36F
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 05:46:38 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id i12so9509110qvs.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 21:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jjiZg3BkKRa+5nrgX4c6pM7EemDt9g+l9eFKcUuBwg0=;
 b=LGqR8sYOlJCM7sRrnNFAfrnydhj12NbWtVQsTHjVpM+NG8nU/c+AyEea9A0AH/GN8G
 egm8+O5nltbpOQsSiAwk+bgqQg1m4tGzDJW1sKx2xz4pbY0owbTW+2+5iC0kh36cG3gD
 8/dMVb8Vi/ul16v707s8H9Zet8YJOe+T2S6/0l9hVzzC7OAQFi0uowu/srq2MvqgLxW7
 nv/Pr0jpYreeB5k1PbLe061bc3+dx2NO6DcMdO9uCk5Q/D6LlzpiKR+XKxqq4lfm7Ed+
 XnTAwP0PMbj2VyUR7sgBUd2PoEGqCXs5PxBW7XiphSLH2H93UFPlG4Hb9AF2QkcZybyz
 ErLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jjiZg3BkKRa+5nrgX4c6pM7EemDt9g+l9eFKcUuBwg0=;
 b=t0/IujXagngupiLa7j8efAG6UzMSUrTbe+oXmqyx+QXiPFaH1HUFitthlw6TKr4Ony
 HMrn1U8OipztLWx9wP4p9AR+2hk46NiRNaFgKb0LXJ9ywy0qZh4TAtIvbN3zWYmCYtKo
 WFX5KeLl3HeS6/ZdeDaT+ber0ulaHtuypY6g4HtRnb9aPiDO1o2yXzwXtc1bX25r2BaT
 zGvKrh2RrNRY/JXTh0BILqv/RF7r+ZIPfSb83WsVaxgh4RpcMlv5ULZXwa4Dyxrty25O
 PCQnlB9iUohL00L/ONbrB13WThBRx5TFy3PdsyQvX1hpAtbGB01ymm/Ii59+PZp88jYe
 1VHw==
X-Gm-Message-State: ANoB5pnCPTOYknaXkACbcPkOhYd+5RCTMyd4wDuAVT+a6hu0QgNLHyM4
 jlBnAoqit1C4ESY6nHqLS5cTxoX7/ltbzLZgHT8=
X-Google-Smtp-Source: AA0mqf5IMb6LpswSHC0kaNKDc8KRo0Lq8j0cuqoJ8fiLuaKlNKXC3eaHdq7e8Jir7bvwXYtpNlHqOL6DPGm5skhaPpw=
X-Received: by 2002:a05:6214:3712:b0:4bb:9358:2a1e with SMTP id
 np18-20020a056214371200b004bb93582a1emr4535379qvb.97.1669095997497; Mon, 21
 Nov 2022 21:46:37 -0800 (PST)
MIME-Version: 1.0
References: <20221119204435.97113-1-ogabbay@kernel.org>
 <02c514c0-62c4-1cdf-5d3f-b3d8942ef005@amd.com>
In-Reply-To: <02c514c0-62c4-1cdf-5d3f-b3d8942ef005@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 22 Nov 2022 15:46:25 +1000
Message-ID: <CAPM=9ty_YHrM5QhAjgFvNdpkEwnB_WHsouhYG8m5XGrb+kmWAQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] new subsystem for compute accelerator devices
To: Sonal Santan <sonal.santan@amd.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiho Chu <jiho.chu@samsung.com>, Oded Gabbay <ogabbay@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>,
 Christopher Friedt <chrisfriedt@gmail.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Kevin Hilman <khilman@baylibre.com>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 22 Nov 2022 at 09:06, Sonal Santan <sonal.santan@amd.com> wrote:
>
> On 11/19/22 12:44, Oded Gabbay wrote:
> > This is the fourth (and hopefully last) version of the patch-set to add the
> > new subsystem for compute accelerators. I removed the RFC headline as
> > I believe it is now ready for merging.
> >
> > Compare to v3, this patch-set contains one additional patch that adds
> > documentation regarding the accel subsystem. I hope it's good enough for
> > this stage. In addition, there were few very minor fixes according to
> > comments received on v3.
> >
> > The patches are in the following repo:
> > https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/accel.git/log/?h=accel_v4
> >
> > As in v3, The HEAD of that branch is a commit adding a dummy driver that
> > registers an accel device using the new framework. This can be served
> > as a simple reference.
> >
> > v1 cover letter:
> > https://lkml.org/lkml/2022/10/22/544
> >
> > v2 cover letter:
> > https://lore.kernel.org/lkml/20221102203405.1797491-1-ogabbay@kernel.org/T/
> >
> > v3 cover letter:
> > https://lore.kernel.org/lkml/20221106210225.2065371-1-ogabbay@kernel.org/T/
>
> Thanks for defining the new accel subsystem. We are currently working on
> DRM based drivers for unannounced acceleration devices. I am fine with
> these changes with the assumption that the choice of using classic DRM
> or accel is left up to the individual driver.

I don't think that decision should be up to any individual driver
author. It will have to be consensus with me/Daniel/Oded and the
driver authors.

Dave.
