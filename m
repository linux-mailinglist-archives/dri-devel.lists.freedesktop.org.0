Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6237E6DAA
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 16:41:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBAB010E8D4;
	Thu,  9 Nov 2023 15:41:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 437D610E8D4
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 15:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1699544476; x=1699803676;
 bh=wSggkVWjW7MPLzOiBKFeNgXfuCLsA2y7t1dhljxZI3g=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=bqz9Ia7mkJLZvbD4zBv0xlF/bOAJIV+1lVp1/YTbQbLXUsGHyNf8pPbyU7vboI7Hy
 EoO+j0kNBvhtwRXxPr9IIhF0h040u6ExNZdoeD1ofWBuJyQkTUQ7hKyZNnyDWsAEZT
 2RDcV336gsryazBOiDz6Hf07zHUNspnfCuuHWYPF5ypB8Yv7Bmj12vDMku4GxLllke
 j6AdWWBxLprEke61c3XRw3Hxq9znUpxLhcs8qWaxlBCwiYChXF36x5Vroct68V37wQ
 q1RUowKChpLGh+7P7FjUnoSg7JqaWpR3EMJrw+oL9hhm414VGvXjzFFWPwWbysCIk3
 bIO3qWqKr/jSA==
Date: Thu, 09 Nov 2023 15:41:05 +0000
To: "T.J. Mercier" <tjmercier@google.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC PATCH 2/2] vc4: introduce DMA-BUF heap
Message-ID: <0YGfYSjKF4-ZHh0jLiA36CYJbLCNdRQP79TdM1l5GnG_XuPP8E1Xzg7v4FQ4a_y8t095uyXQ0gg7M4JK9BVUFtPdO2MbLei1aoc3TfAAq9Y=@emersion.fr>
In-Reply-To: <CABdmKX0PgD0e3zYUNCpKRPuDoW68KTL5BTvHGuAwE1CRwVCtQg@mail.gmail.com>
References: <20231109074545.148149-1-contact@emersion.fr>
 <20231109074545.148149-2-contact@emersion.fr>
 <CABdmKX0PgD0e3zYUNCpKRPuDoW68KTL5BTvHGuAwE1CRwVCtQg@mail.gmail.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: =?utf-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Maxime Ripard <mripard@kernel.org>, Iago Toral Quiroga <itoral@igalia.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 John Stultz <jstultz@google.com>, Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, November 9th, 2023 at 16:14, T.J. Mercier <tjmercier@google.co=
m> wrote:

> > + exp_info.priv =3D vc4; / TODO: unregister when unloading */
> > +
>=20
> So unregistering a heap isn't currently possible, but we're trying to
> enable that here:
> https://lore.kernel.org/all/20231106120423.23364-7-yunfei.dong@mediatek.c=
om/

Great!

Note, I wouldn't actually need any ref'counting, a simpler function to
always unregister would be enough for my purposes I think. But if you
have an actual use-case for the ref'counting, that's completely fine for
me as well.
