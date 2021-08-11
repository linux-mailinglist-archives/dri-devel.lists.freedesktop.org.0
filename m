Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1859F3E8E77
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 12:22:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C1486E115;
	Wed, 11 Aug 2021 10:22:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE296E115
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 10:22:42 +0000 (UTC)
Date: Wed, 11 Aug 2021 10:22:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1628677360;
 bh=fFv6ZGpgid4MXbgxFI3m1V1NGWNooU/fG7oArX8VObk=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=tB0uoy6zZuMrG3Fwi5KuFjBnKoUG5DjCuSJkBezxyYcpKqam01IrXbLkWF90PBJFZ
 54juitDsOt6aHQ4FjxXiDuu+7W2kAWAxLgKA36cPWanTDConyAhNe7x5B/Jp5CmQW9
 ZZ9/EvcMFhQ9ZI872GEpIot6trH4NDfvor/tvcJe9kxNiF9m0wgVHv/mjCjY4e51v6
 ezNzwtv4jxTq6bk9fjxfjc4nH1kjPpsh/+FdcCGpKOkbd2AOcyqBojEu7u3u7H/pmM
 Mwtkb7KHUU6l+NsMquwtNrrHLRJlChEKEcy9WAxbQP1Rk3QHMdC2tmJ73VTwOrqPoe
 AOCI+aNLqe8TQ==
To: John Cox <jc@kynesim.co.uk>
From: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: How to obtain a drm lease from X for overlay planes as well as a
 primary plane?
Message-ID: <6jWplco0jml0gylXZig6cLBcACGz10c8CyGyX4FNyIBZh6lAiL_ZV_Ao3oVH0YdW5qgFXKgZF2Xk_kcAMKY47qyTQfpElvJxKCwmOG72Q6E=@emersion.fr>
In-Reply-To: <1j87hgl0vgbns96eooqsmnqg0jar5b7hr6@4ax.com>
References: <34a5hg1rb804h8d1471apktsgl5v9n9u1e@4ax.com>
 <YRObs1/iDhgCbMo8@phenom.ffwll.local>
 <1j87hgl0vgbns96eooqsmnqg0jar5b7hr6@4ax.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, August 11th, 2021 at 12:19, John Cox <jc@kynesim.co.uk> wrote=
:

> That MR seems to be done so is probably an inappropriate
> place to ask - where would you recommend as an appropriate forum?

For Wayland related questions, you can ask on IRC or on the
wayland-devel mailing list.
