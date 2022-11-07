Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5D162003D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 22:05:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 432A910E4AF;
	Mon,  7 Nov 2022 21:05:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB9D10E4A9
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 21:05:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 78C4CB816A0
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 21:05:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3578BC4347C
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 21:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667855110;
 bh=Zu50tGqg124bPyOMVvcoQdIculJ+KYQtsiSpZtdQVq4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AabtWJNmq1Z8Xd62qXornOCd4ZK3WhKppXVm4YynDe4++xb8YguttfBdNQXXw9utL
 ErdH/vNsCDN8KIsmTq9VxUiAtXIeQ4Ym2zOTYTesPPe8oPEIjn8k+qudKhLVrJsiCQ
 rSnVdbr93iQONLOAfi4cgOnEf/svFjIQ6d+uVIiVa2gHuhdFwrTMU5NlhLcyZuFsOJ
 M+/SaZrHlzd31Ao7huJTDQendPxB+OQUJLL6GzEmsFpt4IoDClYFHnxLljwjlPIf2M
 0bVUNEqbvngAnGlGkK4+fQ3I16nfHkCVST+31DDbyv++DM73sb/Cb8PceNxog9/lzY
 kTz3wiMBcWqfQ==
Received: by mail-yb1-f178.google.com with SMTP id g127so15122907ybg.8
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 13:05:10 -0800 (PST)
X-Gm-Message-State: ANoB5pkGGTgd36fwvLZ02mqXwt/KIdRdVBQNT+/R55VdySvjw0H7kDkr
 xeg99KOILfaCS3aggF2BH53HpWJspmi7BZPoekg=
X-Google-Smtp-Source: AA0mqf4KjNwhvJXdZttzDTXzxLD0NEeHGqaOOG0YDar2hzM7Q2wpgsR23hYSEEYa6fKsS6NkPJtYHOUyqYwmtjLhNO0=
X-Received: by 2002:a25:2389:0:b0:6d8:7f81:edaf with SMTP id
 j131-20020a252389000000b006d87f81edafmr3758306ybj.443.1667855109196; Mon, 07
 Nov 2022 13:05:09 -0800 (PST)
MIME-Version: 1.0
References: <20221106210225.2065371-1-ogabbay@kernel.org>
 <20221106210225.2065371-4-ogabbay@kernel.org>
 <2537e41d-f863-4819-57d2-09b9554f801b@quicinc.com>
In-Reply-To: <2537e41d-f863-4819-57d2-09b9554f801b@quicinc.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Mon, 7 Nov 2022 23:04:42 +0200
X-Gmail-Original-Message-ID: <CAFCwf12h2FH_CrPKszWfFVRCfnQeavYY+sXmjk9jChbT-+WBcQ@mail.gmail.com>
Message-ID: <CAFCwf12h2FH_CrPKszWfFVRCfnQeavYY+sXmjk9jChbT-+WBcQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 3/3] drm: initialize accel framework
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Christoph Hellwig <hch@infradead.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Jason Gunthorpe <jgg@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Arnd Bergmann <arnd@arndb.de>,
 Jiho Chu <jiho.chu@samsung.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 7, 2022 at 6:25 PM Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
>
> On 11/6/2022 2:02 PM, Oded Gabbay wrote:
>
> > @@ -603,6 +626,14 @@ static int drm_dev_init(struct drm_device *dev,
> >       /* no per-device feature limits by default */
> >       dev->driver_features = ~0u;
> >
> > +     if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL) &&
> > +                             (drm_core_check_feature(dev, DRIVER_RENDER) ||
> > +                             drm_core_check_feature(dev, DRIVER_MODESET))) {
>
> Shouldn't the indentation for the 2nd and 3rd line be such that the
> start of the lines is aligned with the "(" on the first line?
afaik there is no such rule. If there was, checkpatch should have reported that.
Oded
