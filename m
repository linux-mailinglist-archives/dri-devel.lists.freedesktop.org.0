Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FFC2D3FC1
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 11:18:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D786E811;
	Wed,  9 Dec 2020 10:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF49A6E811
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 10:18:31 +0000 (UTC)
Date: Wed, 09 Dec 2020 10:18:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607509109;
 bh=G/K2rdUUwbWg+iLw4g7S66hh8si6GG1ygZTtYsswBdE=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=G3IJj62wCcugg99u6VgNkXhmVsWQrGzQZqUTVCXQj0971vOov+eRBwaE1y6hvuW0A
 mm3Eoh0L1orO6tQ58Fu/NRtNm8fhUGBJt/GQXnpOiCdWS7tglxRxAxovle/6Dv47Ya
 j6g19EH21gbvVyV5DgOCYwr4S/MKp7XU/F9/aYCC1/0qV2lOESiV4b2k4zggoJX9xj
 ZZjSRVmWHTAYLupyijf5GJEJvhrF9fmG3eoES7FgZhR7vE/rfuTf2WefFSQVaNfXI1
 uZ6Hs6u54/ICrkWq+aqk2flGMkNY2W/CSR9cbgTWqq+E03n4Lw4JvUAOlG2n40gpc3
 6ffi4Ibg8Wk/Q==
To: James Park <jpark37@lagfreegames.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: drm_basic_types.h, DRM_FOURCC_STANDALONE
Message-ID: <VOvpgkJSLSX_nWnr-hgXPJUyndzrUMaHHFos_Smu67du13TLRRPLDpySE45bht1cGd_xTsGoQbJ5gGT4Ofzmji1lXa5eZNCkmUf8QkUyWx0=@emersion.fr>
In-Reply-To: <1607364939-640-2-git-send-email-jpark37@lagfreegames.com>
References: <202012080129.qAoCOovN-lkp@intel.com>
 <1607364939-640-1-git-send-email-jpark37@lagfreegames.com>
 <1607364939-640-2-git-send-email-jpark37@lagfreegames.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, December 7th, 2020 at 7:15 PM, James Park <jpark37@lagfreegames.com> wrote:

> Create drm_basic_types.h to define types previously defined by drm.h.
> Use DRM_FOURCC_STANDALONE to include drm_fourcc.h without drm.h.
> This will allow Mesa to port code to Windows more easily.
>
> Signed-off-by: James Park <jpark37@lagfreegames.com>

This version sounds fine to me, thanks.

Acked-by: Simon Ser <contact@emersion.fr>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
