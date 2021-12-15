Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E383B4755A3
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 10:58:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A210410E24D;
	Wed, 15 Dec 2021 09:58:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 954E910E24D
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 09:58:19 +0000 (UTC)
Date: Wed, 15 Dec 2021 09:58:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1639562296;
 bh=y61HC4/CbZjjotOesALb2CPVggqpksT55ESKDuNtL9w=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc;
 b=L2J2hPBpN7mSEZ7HQ1d5F6Jb61PWa6GyMdyvkWFgTkGu6uqFjZYDQFEeSv0Xtrxhc
 IUbQ1sWRz+a6wOR3jD6J9hdX/7NfIMDXEgOfrrxNDix+/ryBsSPA0TtrJx3WPqH/yY
 wnEEEWGyF6/JH23WuttQnjokKMcTegLbd/qj9ot1yk+cveGf372IADtq9xp1LFhkpE
 QdZnOu7AqdEg+9LU6R4+twkH98KDilFQMLybBPbCu9Sw5f1MqWAPV6iXHulLOM9A6E
 G7N+5DonAuPcJ58vmTZK9eLfvHr590Qk2QpcKTn3puVrsaYEp9yRE79/R9Z4W9kbVY
 5ScX6wVA/+IRQ==
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/plane: add alpha and blend_mode to atomic_print_state
Message-ID: <NJH25z_TKgSybtTGJaa2Q4wbYBwO3q2l_MDS0YXy39faQ8F6PNg6NuEKqX2jlKiZhKkN76M_kc9UqQCQijtIeC_41J5I1nYVzmrT7m27KLs=@emersion.fr>
In-Reply-To: <20211215095636.2330563-1-dmitry.baryshkov@linaro.org>
References: <20211215095636.2330563-1-dmitry.baryshkov@linaro.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, December 15th, 2021 at 10:56, Dmitry Baryshkov <dmitry.barysh=
kov@linaro.org> wrote:

> +=09drm_printf(p, "\talpha=3D%x\n", state->alpha);

Maybe use %04X here to make it clearer that 0xFFFF is the max?
