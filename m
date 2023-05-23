Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8889C70E905
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 00:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C20F10E53D;
	Tue, 23 May 2023 22:21:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB9A410E53D
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 22:21:06 +0000 (UTC)
Date: Tue, 23 May 2023 22:21:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1684880464; x=1685139664;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=Q1e7QkDV5Zacu07sYQ6VrJy6cddZnmEZQWUwJlA0IkQ2Dp+cc63CuXDJKddL4dmzg
 FRTg0R/s5sPxJYRKUgVSG7MEcskIAhZEj3e/jMGLeNN2fPmAepkvu8EQY4Y2l4vvUj
 ywSQ0w3psCVuNM1w1mlS95faA50I6N8DTnS3JesReu3qKKHRRPB1bxKj65iTAi2aoG
 KTXSUckbouWzTtewuw4YlKHYLb5DX+4CUN33vafnrFiP6LptMufPOIvPgq4vdPQ7gp
 kcrxOaz8lyC+kn41DXaJ2XRK68+YUr1AdDfjS6oQ8e5KrJT+oLh6r+KSWOWjDtVeQx
 hyCkUxZ+59GwQ==
To: Melissa Wen <mwen@igalia.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 01/36] drm/drm_mode_object: increase max objects to
 accommodate new color props
Message-ID: <V7P7Qs7O1XEpNUGXDkkpL6rV2Y2jJ60PhjEL7-qetMKUv6YF2C1leKhKS5zAj1qG8tkBcTqoHFhN_gW1SWaI9FwsQn1uzuvyZcreV6MwGPY=@emersion.fr>
In-Reply-To: <20230523221520.3115570-2-mwen@igalia.com>
References: <20230523221520.3115570-1-mwen@igalia.com>
 <20230523221520.3115570-2-mwen@igalia.com>
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
Cc: kernel-dev@igalia.com, Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, sunpeng.li@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org, Alex Hung <alex.hung@amd.com>,
 amd-gfx@lists.freedesktop.org, tzimmermann@suse.de,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Simon Ser <contact@emersion.fr>
