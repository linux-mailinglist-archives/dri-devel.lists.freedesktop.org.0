Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B46D658CB2
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 13:28:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A59410E052;
	Thu, 29 Dec 2022 12:28:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3A010E052
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 12:28:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 41B2BB81913
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 12:27:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB478C433D2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 12:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672316876;
 bh=kMyVX3hg9ufAE640eUtlK+duN/DOwEbGq6CsAH0RFpg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GI2zZo+vDQhG/4GZj20RE1NAvTP2RmC4PcROi5lNyZwDULNM3zm7m29XeFRegG3iq
 DKr3o0pPX+0S7goAG93sCKkowjaU9mT7Y8VDCj6YLSRZvNRpagiddPPqG6j7fFw53r
 AVr1DE8/E8aIKXEjtnZAkImXGpUWsCRk2G69/P9KUWEe41QJUPFwgX6xBiaf4cmnjO
 7lgv49lsC9lvx7YQ3s5OGQik/cmA1fQ1hx1c6Xd+PAOUIAfxeeMYdzNXOn4/vrfR6U
 3GgdLOh93QjQWxhzmJ/3PowWrC+d9V7/7ie2+DV9VzbJc3YSZ+Ia5V2fvU0873F+u7
 zpkHhfs8XDKxA==
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-417b63464c6so258526567b3.8
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 04:27:56 -0800 (PST)
X-Gm-Message-State: AFqh2kpdHCyOXF1wGCt3pbMMvaURE1GSot8axqqv/SlPGhCGTc1aXSVg
 nUdv0paQ03UdaQiUzS1Cr2CWl6vBePIW8513RPE=
X-Google-Smtp-Source: AMrXdXvbkB7RvKVDzQDmZBdvczEpFKYqXxTUYwGdumSZ1d2h8wVpkpY8a/NOxNif2Pa56CsSZ68dT/sx+EPANuc+rrk=
X-Received: by 2002:a81:838d:0:b0:46e:a921:1d82 with SMTP id
 t135-20020a81838d000000b0046ea9211d82mr2312203ywf.487.1672316875943; Thu, 29
 Dec 2022 04:27:55 -0800 (PST)
MIME-Version: 1.0
References: <20221226213227.26953-1-ogabbay@kernel.org>
 <5db3ee62-d864-1eb7-65c3-21e86037cbe0@quicinc.com>
In-Reply-To: <5db3ee62-d864-1eb7-65c3-21e86037cbe0@quicinc.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Thu, 29 Dec 2022 14:27:29 +0200
X-Gmail-Original-Message-ID: <CAFCwf106PK-Rbr-P397xqm_4xkiKZgbo6CfGbSQQQTq0=AWQPA@mail.gmail.com>
Message-ID: <CAFCwf106PK-Rbr-P397xqm_4xkiKZgbo6CfGbSQQQTq0=AWQPA@mail.gmail.com>
Subject: Re: [PATCH 1/2] habanalabs/uapi: move uapi file to drm
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 27, 2022 at 8:29 PM Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
>
> On 12/26/2022 2:32 PM, Oded Gabbay wrote:
> > Move the habanalabs.h uapi file from include/uapi/misc to
> > include/uapi/drm, and rename it to habanalabs_accel.h.
> >
> > This is required before moving the actual driver to the accel
> > subsystem.
> >
> > Update MAINTAINERS file accordingly.
> >
> > Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
>
> This would impact the hl-thunk project at
> https://github.com/HabanaAI/hl-thunk as the open userspace, right?  I
> don't appear to see corresponding changes there.  Is there a dev branch
> I'm missing?
I will change it in a few weeks. The driver changes are only inside my
branch, I have time until the next merge cycle.
Oded
>
> -Jeff
