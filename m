Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBCF36B202
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 12:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD626E1CD;
	Mon, 26 Apr 2021 10:59:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5FC6E1CD
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 10:59:01 +0000 (UTC)
Date: Mon, 26 Apr 2021 10:58:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1619434739;
 bh=lplXbMMht7QbKl9pR0DcvmRbXnGVw6Q2NzMV7TGxGYM=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=HW3a32GX5hXbtqpOOl+kKl1P38EhgYtsC+yvca2o2BoiV6hqmzLn0fpuyCJX26mu5
 N/gRtTVyGtCBKeJXOS5oJrfakYJH6qp2uBjNdp/v66TGKGP3AVCsvGr6a0Mr81YPRt
 ZDzDtN+jLcL7h/a+K9cqn7qIcLs4E9ZCNSGZGBqGUY2lBMguNhS0BqvSV0xBCQAusr
 KMjAHsbs4BMrIQFa2BbXt95ekTXdyHk38nRkFKr/jN2qiypjDLaveMW0HRdLUJmvFf
 lQJQC8tqGFD9hOyHftbG98jUcXrcGcV95hL0FFPKI9k9+fE+ehIkNOR8dyx5LT5utL
 a2bku/ly2EQFA==
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 1/1] drm/doc: document drm_mode_get_plane
Message-ID: <UucmifK8H9QRiWjD9XezmvdKmY-gXYG2c5LcJlAtmZDvpmvX3dqiNqzng6EPm6Kj_1_1nKi4S2vzFPTpKYoou_ARj-27xlxSoeMtrcpxLUk=@emersion.fr>
In-Reply-To: <20210426103656.0a212089@eldfell>
References: <20210422181004.34247-1-leandro.ribeiro@collabora.com>
 <20210422181004.34247-2-leandro.ribeiro@collabora.com>
 <20210423141126.308d4145@eldfell>
 <3c3a5d35-10bf-4b32-1970-aed4bc1d6488@collabora.com>
 <20210426103656.0a212089@eldfell>
MIME-Version: 1.0
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
Cc: airlied@linux.ie, kernel@collabora.com, dri-devel@lists.freedesktop.org,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, April 26th, 2021 at 9:36 AM, Pekka Paalanen <ppaalanen@gmail.com> wrote:

> > > This should probably explain what the bits in the mask correspond to.
> > > As in, which CRTC does bit 0 refer to, and so on.
> >
> > What about:
> >
> > "possible_crtcs: Bitmask of CRTC's compatible with the plane. CRTC's are
> > created and they receive an index, which corresponds to their position
> > in the bitmask. CRTC with index 0 will be in bit 0, and so on."
>
> This would still need to explain where can I find this index.

This closed merge request had some docs about possible CRTCs:

https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/102
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
