Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E359941D664
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 11:30:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A76116E3B2;
	Thu, 30 Sep 2021 09:30:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 709176E3B2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 09:30:45 +0000 (UTC)
Date: Thu, 30 Sep 2021 09:30:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1632994239;
 bh=t/i72Ym8kik/57Q9hmhXxJ8apoGNhR+Jkou55/KZgpY=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=PwrOxcOhpZOfdC4agyXqzf8O01y2cAgCiqNMsVc9yq4AJzTiO1S7YQyVDcW2u9/FA
 N634V/zQEYsdvtX9cDTN8cukyhopZ4mP/XXTkMW/F7YLtGxxnss8ovuy1+cKB1m0aA
 luP+pmW7qT5Aq+KR+HQLA+ygJNuTDPUAIVOHSkjW1Ftblgk+s50C4greoKaKfQhcqh
 RctvilmGmYI6ccsxm31/Vl2jdyrlSK/QWMzBbutMBSHJxPn+l6+wdMESUXaKmov3yU
 b5FdM2qSDmiYLhMcu1QLn8utd4OyT/OMr9pRe0taoALNdPObo9NXaeVwVNEpJ0be7K
 /xctMWuPbk2pA==
To: Daniel Stone <daniel@fooishbar.org>
From: Simon Ser <contact@emersion.fr>
Cc: Pekka Paalanen <ppaalanen@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Daniel Stone <daniels@collabora.com>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Emil Velikov <emil.l.velikov@gmail.com>, Keith Packard <keithp@keithp.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Dave Airlie <airlied@redhat.com>
Subject: Re: [PATCH v2 2/2] drm/lease: allow empty leases
Message-ID: <-XyWTLbTDPqCN-dtlOV6b-XWq8Bu9lZ5TAjNcuuYpEan9ssGXS_vYP_W2fxLZvBU6GF6XoGEkRPgXQcrrGVJ3YaKO78K8WFDQycJBbj5vvw=@emersion.fr>
In-Reply-To: <CAPj87rModxmvm80OmeD2Upmu8UyysVQ_9CNJte4iPLUxbU3=hA@mail.gmail.com>
References: <20210903130000.1590-1-contact@emersion.fr>
 <20210903130000.1590-2-contact@emersion.fr> <20210922114844.67ed5697@eldfell>
 <CAPj87rModxmvm80OmeD2Upmu8UyysVQ_9CNJte4iPLUxbU3=hA@mail.gmail.com>
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

Thanks a lot for the reviews!
