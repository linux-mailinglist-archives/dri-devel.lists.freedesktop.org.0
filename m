Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8C4C92295
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 14:41:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A9710E77A;
	Fri, 28 Nov 2025 13:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=gert.wollny@collabora.com header.b="WxSU2IJb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA8310E8F0;
 Fri, 28 Nov 2025 13:41:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1764337275; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Zr1QZ6svF8xCBWptqcB2mRB1y2gUSse+Mt2igqJf9TaxHxNpOqyNToPGaa9rI8sfVqxNcumQ11ojE6CMJl35i33DqZQDAtdhNMUhzEmr7m7du3YRjU4N+Mqeit/nik7pRu07IYFXX7EgX91mNq8CWgO+Ln4MFLIZHWnnsSStBiQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1764337275;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Bikpb6bipipgwnRno90+ri0PtrliM7CCiEbCWOgJxCk=; 
 b=O0Fm+JK11bnUPbjLBE9a74Gy4qyZ6sG495Y09pBZ0Wy7DBG0tDiO2EG9Cjt5laJ5XTaTra59iFjyhRjRSjOlMs3RdYQs2wi5m+NcXlBPhkuXIoY9PrE6t/uLjtKP8clXAZy717lBsaD/WsZ/81COPd13+hKW8kDSQBcJAhM40Ok=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=gert.wollny@collabora.com;
 dmarc=pass header.from=<gert.wollny@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764337275; 
 s=zohomail; d=collabora.com; i=gert.wollny@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=Bikpb6bipipgwnRno90+ri0PtrliM7CCiEbCWOgJxCk=;
 b=WxSU2IJbk24WU0V3nXUNZw6arnSs6v960sbtAFFjoLkukawQcLzTB/yfeQ7mhdTy
 cb80UtAcAtZe4VS1AdQ9Z46e8OVilvM90M3/HHYSIezl26dAwvdrMubIZmBNAznNQ0W
 WVCZlNcerwG/Hy/erKnFTB5N9a2HRVBeynUVEW2o=
Received: by mx.zohomail.com with SMTPS id 1764337272921783.0738830021492;
 Fri, 28 Nov 2025 05:41:12 -0800 (PST)
Message-ID: <2a5f5e5c29a8ba03b89e96fb5c2a65a93fb501fa.camel@collabora.com>
Subject: Re: [PATCH v5 2/5] drm/etnaviv: move some functions to a header to
 be able to use them externally
From: Gert Wollny <gert.wollny@collabora.com>
To: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Lucas Stach <l.stach@pengutronix.de>, Russell King
 <linux+etnaviv@armlinux.org.uk>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Fri, 28 Nov 2025 14:39:28 +0100
In-Reply-To: <CAH9NwWe5oD7YRnnP5jKY8L+YoeVYsU5NLKUyerXpZrFU16So4g@mail.gmail.com>
References: <20251110144625.18653-1-gert.wollny@collabora.com>
 <20251119164624.9297-1-gert.wollny@collabora.com>
 <20251119164624.9297-3-gert.wollny@collabora.com>
 <CAH9NwWe5oD7YRnnP5jKY8L+YoeVYsU5NLKUyerXpZrFU16So4g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
MIME-Version: 1.0
X-ZohoMailClient: External
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2025-11-28 at 09:56 +0100, Christian Gmeiner wrote:
>=20
> > +#ifndef etnaviv_buffer_h
> > +#define etnaviv_buffer_h
> > +
>=20
> You missed my comment from the previous review.

Sorry about that.=20
>=20
>=20
>=20
> In order to save you from doing another round, I will fix the
> last nit, if that is okay for you.
>=20
Sure, that's fine with me, thanks a lot,=20

Gert=20


