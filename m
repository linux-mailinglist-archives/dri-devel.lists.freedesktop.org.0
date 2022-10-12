Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9EE5FC13F
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 09:25:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D883010E12B;
	Wed, 12 Oct 2022 07:25:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198E510E12B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 07:25:42 +0000 (UTC)
Date: Wed, 12 Oct 2022 07:25:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1665559539; x=1665818739;
 bh=YNnKBWMkizF9hzbILurW+IMdB42uOKnGrIWtsJAZ3oY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=buYU9vgAVtCJRKu+mgYz+bRChI8mVTHpMBtTYzoRFpPRjNf8xpOifJk+0inuRUiy4
 GjjamtMCsXeOmgKxcRqliXc3mB+OzuM77I2muMf5K7oH1xr8/PkEATeFbm2u0YAly/
 4jwLYAGiukI8mVBn+QjvxwIcYXpKtFErwUEM5abCbTEQedDXydFxwCf2OHvfAVosKT
 kU2UXnLYRbCGYjgl6zcR3mYUgYSR9c3uN/4I9ar2bkMf6DZ9Rrm1Aew0SENedbE+M8
 IhYoFzoToQIbgkW0BPDJthsjMQHtXFCuj5OZYbfHiRIXvWFCuyc+ziJ8eVBu5awcRM
 dY4LIviP6o2yA==
To: =?utf-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: Render only DRM devices
Message-ID: <1_6_W-ecBTg81SqYCtJ0j7h1t09AqaxnoP2uufly-AtK9fkwiQ0oQQk05IxERgFKgsEAtooSOEoCkjJ1WctKz6z1574qKYgIuZZj_8SqH9k=@emersion.fr>
In-Reply-To: <c99acf27-aa07-f365-2d1b-74cf160badd8@gmail.com>
References: <20221011110437.15258-1-christian.koenig@amd.com>
 <LDyPQX1u8PCwIfQuy1sQStoURXxBW-sM2cRZGiIJdf50YWWpG5HnlgD04FEfx88xnGtm0ZrvjF0XX4PF2qsXNYpdsUdmCswiuCO23-K2vaI=@emersion.fr>
 <7f14fd6b-475c-0b75-4faf-b777ebc42b02@gmail.com>
 <7IxXaAojWv9lUvhfsVunLet4nXmj7JUmYWlg5w6FMjaIpwD3q4TTLa35cCXozQAkGTXw3SaNKn5h-kwS1zOYV7fR8SqOfaX36mylqAihZfE=@emersion.fr>
 <c99acf27-aa07-f365-2d1b-74cf160badd8@gmail.com>
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
Cc: Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, October 12th, 2022 at 08:18, Christian K=C3=B6nig <ckoenig.le=
ichtzumerken@gmail.com> wrote:

> DRM auth based authentication is seen as a security risk and we want to
> get rid of that for render only devices (at least for the new ones).

Right, that makes sense for new hw/drivers. So we really need this to
be opt-in, we can't just do it for all existing render-only drivers
without breaking the kernel no-regression rule.

> I should probably add a wider explanation to the commit message.

Good idea!
