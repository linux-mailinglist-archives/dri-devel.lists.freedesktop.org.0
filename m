Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1C86C0008
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 09:28:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 218F610E165;
	Sun, 19 Mar 2023 08:28:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB55010E165
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Mar 2023 08:28:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 11093B808BB
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Mar 2023 08:28:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC17AC433D2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Mar 2023 08:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679214505;
 bh=fZ6XoNISYIT6yg304yM11lHKvXoxE5fP1aialrWSmvg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ARyancN5Q2f68o2J7emRdamkDkV4RK7NovUHETM5O0ri2w6ufFNJaqt5h9YvavR0m
 WOfOuNM2FyLaRbIwxptKlsWFt6bRaVckXBzxnGlrvdFBiFGx1ijgM8HzA4ankCRvk2
 N99RJAAwEBpfTL6PL0dWU6tycGcBuI/Wp12fRguJcWZeka5PQi4B4GfY/XbOKYvL6p
 hJc+2w1qkieR8kPpXnezcZI1gA5iD8SgyMEBTV6GYtqYNbJDOPYmx22IRu8IHCKVCE
 L0pxdHnXhj4nFbVNdjseL1Hb19h+n+elIo5Rg2GxKzj3jOOE2H7on5DVV2qTkb/Eqi
 NWywuZdOih+eg==
Received: by mail-yb1-f173.google.com with SMTP id e194so9803991ybf.1
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Mar 2023 01:28:25 -0700 (PDT)
X-Gm-Message-State: AO0yUKWELuiION8NUY+Y34J0SiZILEhC63UK01AnKMuw5n77lG29eh+S
 AaxWPkWtanTPxWVZ2HqFLUkFOEr1+oo7DzO94QQ=
X-Google-Smtp-Source: AK7set+JKtbAD/Anf5+ED4jF0G35zJiqQm0MoN2pOx8irOFBOsqdLL0Z/bBLl43Q4o3uUSeJ6WDaneGRNbhrbOibGSg=
X-Received: by 2002:a05:6902:1105:b0:b2f:bdc9:2cdc with SMTP id
 o5-20020a056902110500b00b2fbdc92cdcmr3097169ybu.7.1679214504826; Sun, 19 Mar
 2023 01:28:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230307043525.25660-1-bagasdotme@gmail.com>
 <babfe305-04cd-7213-8e1e-8fbcb2da10ae@quicinc.com>
In-Reply-To: <babfe305-04cd-7213-8e1e-8fbcb2da10ae@quicinc.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Sun, 19 Mar 2023 10:27:58 +0200
X-Gmail-Original-Message-ID: <CAFCwf10_uqp=LGDUqu9SUyHmrvKNHbniUD8XfNj7KtPFax-BPw@mail.gmail.com>
Message-ID: <CAFCwf10_uqp=LGDUqu9SUyHmrvKNHbniUD8XfNj7KtPFax-BPw@mail.gmail.com>
Subject: Re: [PATCH] accel: Link to compute accelerator subsystem intro
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Dylan Le <self@dylanle.dev>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Melissa Wen <mwen@igalia.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 7, 2023 at 6:04=E2=80=AFPM Jeffrey Hugo <quic_jhugo@quicinc.com=
> wrote:
>
> On 3/6/2023 9:35 PM, Bagas Sanjaya wrote:
> > Commit 2c204f3d53218d ("accel: add dedicated minor for accelerator
> > devices") adds link to accelerator nodes section of DRM internals doc
> > (Documentation/gpu/drm-internals.rst), but the target doesn't exist.
> > Instead, there is only an introduction doc for computer accelerator
> > subsytem.
> >
> > Link to that doc until there is documentation of accelerator internals.
> >
> > Fixes: 2c204f3d53218d ("accel: add dedicated minor for accelerator devi=
ces")
> > Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Thanks.
Will upstream through my tree (habanalabs-next)
Oded
