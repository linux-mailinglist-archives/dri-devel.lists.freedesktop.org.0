Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F0E814596
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 11:31:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE09510E320;
	Fri, 15 Dec 2023 10:31:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7207210E320;
 Fri, 15 Dec 2023 10:31:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CD56562521;
 Fri, 15 Dec 2023 10:31:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F301EC433C8;
 Fri, 15 Dec 2023 10:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702636310;
 bh=vFbU2tFE37clXv2Xl5gB2YnceDfRmJ14hCYQib0idGw=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=IGrUXIxJovTU0LyzSnY5KAkgmcpMBYQxuXeISlBsJDNYrp/zEdCE8y0PAQGnzAh2B
 En0ApJAbZdjS35gQZoKuH7UjBW+C9V8hcUyhYvOZBQypuTrN7cUVDqjjKWs8gy5obs
 KIDNzTxVAe0Y3640AUwN9bPr6cDVHWhQg1eQ9iRp1Jw2uiNnJ0aS+0NPL+TOk2xKlX
 SqinmlYo1FLc2ZW8YWIf5m9VBtUlKDSZADH4n5VDYmQ8v9L/1s48PRagAOKy3T1Nbh
 PGRfz/o9QDv0lPInXzk6qhy1JqXpI3Op3ddgnADRRe3ePutHDzuwt3dz1CE4Ua6hNf
 Liogtyiqbqbzg==
Message-ID: <bfbffc035ccc1da6c224aebea128764e@kernel.org>
Date: Fri, 15 Dec 2023 10:31:47 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: =?utf-8?b?TWljaGHFgiBXaW5pYXJza2k=?= <michal.winiarski@intel.com>
Subject: Re: [PATCH v3 1/3] drm/managed: Add drmm_release_action
In-Reply-To: <20231211220939.215024-2-michal.winiarski@intel.com>
References: <20231211220939.215024-2-michal.winiarski@intel.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, Javier
 Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime
 Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-xe@lists.freedesktop.org, Michal
 Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 11 Dec 2023 23:09:37 +0100, Micha=C5=82 Winiarski wrote:
> Similar to devres equivalent, it allows to call the "release" action
> directly and remove the resource from the managed resources list.
>=20
> Signed-off-by: Micha=C5=82 Winiarski <michal.winiarski@intel.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
