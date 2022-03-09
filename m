Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 842074D29A9
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 08:47:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 018BC10E69E;
	Wed,  9 Mar 2022 07:47:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4711610E69E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 07:47:48 +0000 (UTC)
Date: Wed, 09 Mar 2022 07:47:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1646812065;
 bh=fRARsxr9zi5NZqjUtX+i1REA45nQJNuwkujw5lkKIOM=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=dX2Juhi4GyR0iKQyL+bAbRF4gr6EB7Z2K1IPyWXHUtsDfP4RDMxFr1mIt7d380yVw
 EvmAUD0D7PVjmKA90P3pHz4CBrtSQ8UWEX/GiGLlNlLrtaBe2CIQm64TGNpvy8rnBb
 hkBWY5YPdGDI8b3CnrD0dj55tP/poC98am+IN4HDXptcOsP5IBxlblLJ9t502poFi+
 G0kUzeBaa9uN4DxCEaIw95iLTcY1Ij+aTKufAxGNvEguZr8+qjRJ3Rc84veabtaVBi
 3jfbz1CJw6V/bjgbiR3P1JXYQYcUgv67OdSzwc81XgsNb7pCG+VjQ0xFYFjcQyj8GW
 7sGuRUDumG5rg==
To: Shashank Sharma <contactshashanksharma@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
Message-ID: <Ymb96aes4qNvdggMW_Icw6i6kbswV37jJ6T_8N6JmHlaZazbaHL8gV_LFbvLydLIawvKn1cN01mh6sWORSlLZ3BqzJtjsutf7OmCqBOzGag=@emersion.fr>
In-Reply-To: <20220308180403.75566-1-contactshashanksharma@gmail.com>
References: <20220308180403.75566-1-contactshashanksharma@gmail.com>
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Shashank Sharma <shashank.sharma@amd.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alexandar Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Maybe it would be a good idea to state the intended use-case in the
commit message? And explain why the current (driver-specific IIRC) APIs
aren't enough?

Since this introduces new uAPI, can you point to a user-space patch
which uses the new uAPI? See this link for more info on DRM user-space
requirements:
https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspac=
e-requirements

Please use drm_dbg_* and drm_warn_* helpers instead of DRM_DEBUG and
DRM_WARN. This allows identifying on which device the uevent happens.

On Tuesday, March 8th, 2022 at 19:04, Shashank Sharma <contactshashanksharm=
a@gmail.com> wrote:

> +void drm_sysfs_reset_event(struct drm_device *dev, struct drm_reset_even=
t *reset_info)

reset_info can be const.
