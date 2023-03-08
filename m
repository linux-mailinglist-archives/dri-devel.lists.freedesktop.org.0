Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CD16B0EB2
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 17:27:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D29110E677;
	Wed,  8 Mar 2023 16:27:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44FE010E677
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 16:27:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 64E7DB81DA1
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 16:27:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12B3AC433A0
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 16:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678292833;
 bh=JbxCyI0huIIANoxirPXgBTBH1si+npk+dR+RaZC1gzg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YBZP76Ad87hnY4xkxLVRdMFSnnkcSazWx7ctmmBO3jZVceNLqFo7l/o98Wy2QDQu8
 KCm5hO2UoC4cgZ2At1VLFNv3t20NJCitR1wMZmwV6/Ijn6HFGydmu/pFkZA1hSQNaj
 2IoTojH/fyvBOxze9JfDeWsadU+aHiRwP58joHNRgUBdsiX77E3Ma64odWj+Pzxy2W
 pIKWg0AGt+xk1eakynuaU0yiixiUatM6EY+Enbosfw7gJ8C4PGlZRf8z9mkoDrZn9b
 OnX2dP6smKxPO9ltvuAks+krZ/DgL4wVuOT1A2Ni0y9iNvezRHmB1fAWkKR+Uwt5tp
 HipwG++0kQTKw==
Received: by mail-ed1-f51.google.com with SMTP id k10so44126521edk.13
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 08:27:12 -0800 (PST)
X-Gm-Message-State: AO0yUKWLO0jCf52HJyuKKgIn2L40SiidCSjhmYMNawWYuHea/O7KyMsT
 UroLAYJOQhIVP+aPQbsw8z7GvuMkYKi4dYPkWFc=
X-Google-Smtp-Source: AK7set8tv9oj0Cs64+dvjPmRThogjRBhvrPYlr0s1Jxp6xg8NhIzAjly/ShQhG8oQbSbN3jKigayPafGtW24VNutDRs=
X-Received: by 2002:a17:906:9143:b0:8ad:d366:54c4 with SMTP id
 y3-20020a170906914300b008add36654c4mr12974560ejw.4.1678292831332; Wed, 08 Mar
 2023 08:27:11 -0800 (PST)
MIME-Version: 1.0
References: <20230306160016.4459-1-tzimmermann@suse.de>
 <20230306160016.4459-23-tzimmermann@suse.de>
 <CAOZdJXUtkyg5Gv3HYCK-U1pQpY0_QBk99wtqUvz5RVy2W3Ak9w@mail.gmail.com>
 <aac88d8e-52e8-e2d5-2f41-bed7886bb3dc@suse.de>
In-Reply-To: <aac88d8e-52e8-e2d5-2f41-bed7886bb3dc@suse.de>
From: Timur Tabi <timur@kernel.org>
Date: Wed, 8 Mar 2023 10:26:34 -0600
X-Gmail-Original-Message-ID: <CAOZdJXWGNBHMPRmkBYeVL31=Q0Y=fLa8RG0KS668xQ9ozD+Xtg@mail.gmail.com>
Message-ID: <CAOZdJXWGNBHMPRmkBYeVL31=Q0Y=fLa8RG0KS668xQ9ozD+Xtg@mail.gmail.com>
Subject: Re: [PATCH 22/99] fbdev/fsl-diu-fb: Duplicate video-mode option string
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, teddy.wang@siliconmotion.com,
 adaplas@gmail.com, corbet@lwn.net, deller@gmx.de, thomas@winischhofer.net,
 mbroemme@libmpq.org, linux@armlinux.org.uk, dri-devel@lists.freedesktop.org,
 sudipm.mukherjee@gmail.com, James.Bottomley@hansenpartnership.com,
 spock@gentoo.org, pjones@redhat.com, paulus@samba.org, geert+renesas@glider.be,
 shawnguo@kernel.org, s.hauer@pengutronix.de, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 7, 2023 at 2:28=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
> > So after module_init is finished, mode_option_buf[] no longer exists?
>
> Does the __init attribute on a function affect the static variables in
> that function?

That is an excellent question.

https://stackoverflow.com/questions/64558614/what-happens-to-local-static-i=
dentifiers-in-init-function

I don't think the compiler is naturally aware of whatever section a
variable or function is placed in, so it can't really know that
mode_option_buf[] is suppose to have a limited lifetime.

Either way, the code seems wrong.  If mode_option_buf[] is marked as
__initdata, then it will disappear before the probe() function is
called.

If mode_option_buf[] remains resident, then we are wasting 256 bytes.
