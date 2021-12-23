Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A32B47E11E
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 11:10:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB8310E21B;
	Thu, 23 Dec 2021 10:10:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0099610E21B
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Dec 2021 10:10:24 +0000 (UTC)
Date: Thu, 23 Dec 2021 10:10:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1640254223;
 bh=JZk2QkwvQMw2dr3xN0Nul1fIObR/x6Mzssnku9CKGxI=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc;
 b=jogA9ITM2pLDQetcpufIntC4yTHzrr4+DWIpmT87TPMpju4Ot4RMQ+WoPBM247Tpu
 O8vwV/m9VY6TxbagfU0VqDfUoySRpsVQo8xeuk9rtka7kmhULzDeBU2qj80qLAr/Pl
 tyDxdNlMTeN0/VI1nIPmPi2rBZGD7vDOaQvRjOwGNN+LymeR2yX0gOrADjxqBRv/DK
 ozo9R/9VLfI7qonEXrrdE+T/byG6eNDz/7xkaNdebwMR90q+uJRbnzVrYS6X2DgczQ
 EA5Qt9X6ExeKkKVzmhOOM5KaR6wD89AGhOi8m7lMoK37T0naYw47i++tgbFwpoVybB
 Jjs8alSOHkPVQ==
To: =?utf-8?Q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: =?utf-8?Q?Re:_[PATCH_v2_1/6]_drm/plane:_Make_format=5Fmod=5Fsupported_truly=C2=A0optional?=
Message-ID: <8OwW5vWFemsZ6SHYICEo6Ic972ApufOImdVLLprAxvjF3AxrjQghwFAZsQ1WJNqrv2fCTyB16g4JALC8omFmZ8-vcmTV289KfBEIkKMS5xc=@emersion.fr>
In-Reply-To: <20211222090552.25972-2-jose.exposito89@gmail.com>
References: <20211222090552.25972-1-jose.exposito89@gmail.com>
 <20211222090552.25972-2-jose.exposito89@gmail.com>
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
Cc: airlied@linux.ie, alexandre.torgue@foss.st.com,
 benjamin.gaignard@linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 marex@denx.de, linux-imx@nxp.com, intel-gfx@lists.freedesktop.org,
 tzimmermann@suse.de, s.hauer@pengutronix.de, rodrigo.vivi@intel.com,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, yannick.fertre@foss.st.com,
 linux-kernel@vger.kernel.org, philippe.cornu@foss.st.com,
 mcoquelin.stm32@gmail.com, dmitry.baryshkov@linaro.org, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, December 22nd, 2021 at 10:05, Jos=C3=A9 Exp=C3=B3sito <jose.e=
xposito89@gmail.com> wrote:

> Make "create_in_format_blob" behave as documented.

LGTM, nice!

Reviewed-by: Simon Ser <contact@emersion.fr>

CC Ville just in case
