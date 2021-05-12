Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1012137BDBA
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 15:10:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B82256EBED;
	Wed, 12 May 2021 13:10:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 112EC6E7DD;
 Wed, 12 May 2021 13:10:17 +0000 (UTC)
Date: Wed, 12 May 2021 13:09:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1620825015;
 bh=8dbC0bXMl9KoiodKNr2CaJx6iRPp1MwGJ05L+enMrBY=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=Da+hPNgERTt3U0UEBeIUWh5yafKBvfr9hv+HFBnKA6kh8+VDt7B/QTZ9aoXegHVfe
 9bHtZSBsTKc0QxzXPuBOMWASIQGnVOZ8qPRejOMuo5Dhp2YsRLdPH+bEFFOkndBH9Y
 A3+QIgxIxO/eyUagggCz4ICHyTvLyLq5rpBaE4oJeaUYb+Fy+z1U8ZUOWptWr0ofMw
 H0QzFi34FfwXIm2jBgiEq/B6yElrRSRTVAj56HIllJzttGQrHfgMOvGZyxLnHAQ4Dw
 2xx5qyL1lCJO8QSQU5fPtRhivpCr3v5pjj7564zyJOeh09a/UOmN1jzK32ya7i/n1Z
 1e725loWyvrgA==
To: =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: New uAPI for color management proposal and feedback request
Message-ID: <9AhePX5AEosIsHWWHSHn742dMU9llkiX09EMzWK_hSE0bcAmsDD-nBSNG0tYbOdcwnru3WaFELpPaxIgntU4zboc5zauY-VPPICyVvr7DEA=@emersion.fr>
In-Reply-To: <YJvSUCCPvWz7y/r7@intel.com>
References: <8c0d7ad8-7ade-bf8a-0414-cc795fbb6aa2@tuxedocomputers.com>
 <YJvSUCCPvWz7y/r7@intel.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 intel-gfx@lists.freedesktop.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Werner Sembach <wse@tuxedocomputers.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, May 12th, 2021 at 3:04 PM, Ville Syrj=C3=A4l=C3=A4 <ville.syr=
jala@linux.intel.com> wrote:

> > Adoption:
> >
> > A KDE dev wants to implement the settings in the KDE settings GUI:
> >
> > https://gitlab.freedesktop.org/drm/amd/-/issues/476#note_912370
> >
> > Tuxedo Computers (my employer) wants to implement the settings desktop =
environment agnostic in Tuxedo Control Center. I
> > will start work on this in parallel to implementing the new kernel code=
.
>
> I suspect everyone would be happier to accept new uapi if we had
> multiple compositors signed up to implement it.

Sign me up. We already have a patch blocked by "Broadcast RGB"
standardization:

https://github.com/swaywm/wlroots/pull/2310
