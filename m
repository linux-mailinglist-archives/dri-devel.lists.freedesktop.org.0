Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0239D663F91
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 12:56:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC7910E5A4;
	Tue, 10 Jan 2023 11:56:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7AD10E5A4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 11:56:03 +0000 (UTC)
Date: Tue, 10 Jan 2023 11:55:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1673351762; x=1673610962;
 bh=RTaiwfeNfVaSDohea553rjNIZ+5PVfJH0ykf4KKSWRI=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=hDvEFEN7w5IZSbYGp08MZLFqA9RQMCQD/lhUzVqIBk8/8wjuyavTnWVewnmtcSIQ8
 9hrvpdAn0/xbAgpnP6uhRgZ+VPMVW+lZimA4+GVBJGG+jne2CVrufDAHyXac+XKPgs
 2p9y3nOTtMs40hh7cFiatV0WVtt+fxTxlVHmJcuDG5r7zkfYkuNrr3X1hJ72rm74Wa
 Ch7vhTqJ7QQJ6mkGEi716Ar7rdvsX/2ZVn/DwK6D2vWZbdwfFfU29srgABT1UqeFkl
 72qvzHDsBXb4CCutmr/Y1523oQNm5SEBHLplBGwzrdE3tRkc0z905H6h/qcpv5zqfo
 LZUzBQXWK62XA==
To: =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] doc: add dma-buf IOCTL code to table
Message-ID: <c9KK3fKHPFh6b-O2gCOodmh6naTwU6ez1qkpxaZAaRgdHydzKyxyc2nOUUbkvHoSf6yvNmDLIiLtwzX7830ZSjkZpmzxna5KuVRovmbn8hM=@emersion.fr>
In-Reply-To: <9b8d670e-afc8-1238-5a7d-5bbf9fc2e7d7@amd.com>
References: <20221128133853.355645-1-contact@emersion.fr>
 <dea4806e-f96a-262a-e0d5-ae60c199458c@amd.com>
 <CBxfX5V758BMJrTNNtWSrSxTq0Ep48B4PbOS-ryM5B-WDgErHc5zeJBDYNE9UwFVXDMSwd7Bj-Zu6PZZ2jnzGwcL1tHWYySujL9CgTTedoE=@emersion.fr>
 <9b8d670e-afc8-1238-5a7d-5bbf9fc2e7d7@amd.com>
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
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, January 10th, 2023 at 12:53, Christian K=C3=B6nig <christian.ko=
enig@amd.com> wrote:

> Am 10.01.23 um 12:49 schrieb Simon Ser:
>=20
> > On Tuesday, November 29th, 2022 at 10:56, Christian K=C3=B6nig christia=
n.koenig@amd.com wrote:
> >=20
> > > Should I also push this?
> > > I can push to drm-misc-next, but is that the suitable repo?
>=20
> I think so, unless you think that this is a necessary bug fix which
> should be backported.

Thanks! I pushed it there.
