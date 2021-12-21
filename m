Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A739E47BFF3
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 13:50:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C30841121C8;
	Tue, 21 Dec 2021 12:50:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 7216 seconds by postgrey-1.36 at gabe;
 Tue, 21 Dec 2021 12:50:35 UTC
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E3D1121C8;
 Tue, 21 Dec 2021 12:50:35 +0000 (UTC)
Date: Tue, 21 Dec 2021 12:50:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1640091033;
 bh=7gcclE6TcAlSC7JYqTkNySi57ryYwSWINX7R0nMpD5E=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc;
 b=Ycmm3GUESwV8+w92bwSyXIx+xNsupOHp+UUSmUkGWEXjPLaR8ta356CiC3fpkFx2f
 3xY2lvgVc4ThL7SnL8bCLwvCVhySBU6MADv6nVptNJCAu4Vi7AAGiJeZXv8rUgbh60
 +71YiClgMCfBVGyPX7KfcP/fpeRBiUK38QDOkaSQND9WZojaubve1m5sF2cieb0YVj
 hoolDm34LJ1Qvc1y+vX5tIS9JavXfN+mJj5VFHCTP9pXRV0QO2C2GuhoGUOXHGQ7UN
 OmTQ7oJMg74pvc1t+lM+jU7atn49HZVegSX+pKMtl+cLaitSQDxhS5v2RniVIworeL
 T/9X4GR1NmanQ==
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 1/3] drm/plane: Mention format_mod_supported in IN_FORMATS
 docs
Message-ID: <zEXvJPFVMVjCARLW_PC1SWMnWn5sbkbHy6SPAyG_sv-iWXEcFIagb59MZorV_yjb7WYPlwcnNeKky4vTnnAHdDe8pY7UVNd-y8pN21TSdtY=@emersion.fr>
In-Reply-To: <CAA8EJpphECjTnr=EPaToxeqoQshSt-aF_41mEjO41GukZqbvTA@mail.gmail.com>
References: <20211221101319.7980-1-jose.exposito89@gmail.com>
 <20211221101319.7980-2-jose.exposito89@gmail.com>
 <CAA8EJppMsqot1isnMYeSWVJm4tC-PoqUDL9jwd5HJ72tca0HQQ@mail.gmail.com>
 <9_OAfk8h0URTETEHMPKLX0zP7-pirLOCmv0iAiOCuRRcuuVRBjYBXk2YWAAogEANzumyffgjeRZD0nGtKTk5AeGdTLsN5Q7gVnQzr_x45WA=@emersion.fr>
 <CAA8EJpphECjTnr=EPaToxeqoQshSt-aF_41mEjO41GukZqbvTA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Cc: sean@poorly.run, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 jernej.skrabec@gmail.com, tzimmermann@suse.de,
 =?utf-8?Q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 freedreno@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, December 21st, 2021 at 13:33, Dmitry Baryshkov <dmitry.baryshko=
v@linaro.org> wrote:

> I'd still suggest to fix create_in_format_blob()

Yeah, I agree. I thought there were a good reason why create_in_format_blob=
()
behaves this way but can't find anything in the Git history, so fixing it t=
o
behave as the documentation says would be best.
