Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA83D6DC99B
	for <lists+dri-devel@lfdr.de>; Mon, 10 Apr 2023 18:57:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4375710E104;
	Mon, 10 Apr 2023 16:57:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5793A10E104
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Apr 2023 16:57:03 +0000 (UTC)
Date: Mon, 10 Apr 2023 16:56:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1681145819; x=1681405019;
 bh=BLXk8sIFEZU7VKeQQVi06utuufVMENhw9AmXejCo+Qw=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=LzsGXxNHiAfQEn270XO9hChZJw2PABjp5MQqbTKdarF0RoU/l7h9fUeOTCOrNajQQ
 YHpKdPhIwG3PJi7dPIOfNFOKfy/SgkfrfLwGSK3tsYg7pXwt9W79BfRGAKGhOlszk9
 jfXSJERxdYHMQR5QuDUiuonrLJCv/p6sUZT11yGYSf3WaIUyBtjgLT9uX2goWHpSFy
 Nni/TzPzQKYRlOb7F/CBDBPfRxgJdavudSNivPzsPdVGMeExm6fAMZBOlegpDZIz5v
 /U+Uhc8Jy91F3hXq9PciX6AH+jIw/xwc8GgFX5GzwZzrQlQPqVrxiDrDR1p9+PqxPH
 oIKI0KXhAShmQ==
To: =?utf-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2] drm/vkms: add module parameter to set background color
Message-ID: <gY5DtUoeqVhT1HdJU8yjHSqwe9gTIbV6Q2yVDYRyI_JGHS6Lo73Ivjs2G8d_5T_qL2q7pOhjC6O_aPk2Pnn3npdhzh2Y-_nrD98r3ONMrWc=@emersion.fr>
In-Reply-To: <20230410125435.128689-1-mcanal@igalia.com>
References: <20230410125435.128689-1-mcanal@igalia.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 dri-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I think this should be a KMS property instead of a module parameter.
Is there a reason why this patch uses a module parameter? It breaks
user-space expectations.
