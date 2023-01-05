Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E07165E947
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 11:49:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DED810E6E7;
	Thu,  5 Jan 2023 10:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B68CF10E6E7
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 10:49:22 +0000 (UTC)
Date: Thu, 05 Jan 2023 10:49:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1672915760; x=1673174960;
 bh=g0El+7yEvwMYEEvSaouDVwaxCIF4rrmA90wOk7mWPhA=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=DawvJUOCNabBNWXVwcYffqcSBfmBgFrvPDATekm/RdsV9hlBCwDlpyuuUReIjvD32
 /alvVGXq0TkS7O4jD7SHyoj+aOyn9Kg9alUsPBgvO/wSH08D/dY0T0Ti4G/kF/MdwT
 VGOJVfWbE8X9g0U348A1fq9FC7ghAHonqwKJj2SODc2EdkyczgFmH0sjx2DN05F4+7
 CHMMTOecw1L4V5kHpPIcafgtGyVhlwqE3GiiiGBvkvyFRSPI4iPVijX8c0KfQfkd76
 1QKeZL0D2NgrhYIxRPhi+UuGcJDwcaj/UU/tcDUFiUiEyg9E/VH9ZdkvnH2I8v6wte
 Jx4wa/UZQ8AjA==
To: Yi Xie <yixie@google.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/vkms: Add a DRM render node to vkms
Message-ID: <lLLNWDA7BZobVyngTCQom4A04_kK7GpfiETvVOtk1pPILE0T1fQhyCgmG7A3ag_jQ6yC4-Eq1Fbjl_2At777yS55Wc_rvH9_UZPu-7gfm2Q=@emersion.fr>
In-Reply-To: <20230105052325.514970-1-yixie@google.com>
References: <20230105052325.514970-1-yixie@google.com>
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
Cc: melissa.srw@gmail.com, hamohammed.sa@gmail.com,
 dri-devel@lists.freedesktop.org, rodrigosiqueiramelo@gmail.com,
 lepton@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, January 5th, 2023 at 06:23, Yi Xie <yixie@google.com> wrote:

> Some libraries including Mesa and virglrenderer require a render node to
> fully function. By adding a render node to vkms those libraries will
> work properly, supporting use cases like running crosvm with virgl GPU
> support via llvmpipe on a headless virtual machine.

This doesn't sound like a good idea to me. Devices without render
capabilities should not fake it.

User-space (e.g. wlroots) relies on "no render node" to enable
software rendering (Pixman instead of GL).
