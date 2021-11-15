Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 087F8450277
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 11:25:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120FC6E8A6;
	Mon, 15 Nov 2021 10:25:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8F06E8E2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 10:24:59 +0000 (UTC)
Date: Mon, 15 Nov 2021 10:24:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1636971897;
 bh=L5quzF5nCycoEMtAtq1LGWLs42kPlj3RNDtMOjMojjc=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=rFMYvRiqr8uIZKqh/OqxSZGFwP5teHxTRvFX3I+ytD47zO0MMS7Ta/XAlTVWvzstk
 AGFDuHmz/rt6qemCxtqGp+nzRATfvXoDKHbX5mtAWMpNyb4vj3bjkVGfzQd0pPJGPA
 8qTdQ+15wDq3Dv3iRubPBmXN9TwR+JpyLnLw3Hb/ko9QQz3NC8D3mLR/oloHCEyvmK
 knNxoDpI8yKyfPelb/JptS/wGYqKJFLEv4+bDM6WdmwBN031nuqJ0YZfK8D8mkY3sc
 gpBMK16LYIJ2hHEzmVNeh6YU4lECWeaLocNKlH4QpQio6yRPLUCRrS13LlfqW3CjXt
 GSKFnNyBXyH3w==
To: Jani Nikula <jani.nikula@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: change logs to print connectors in the form
 CONNECTOR:id:name
Message-ID: <FA_pOwZDBfWW7NDxnHcCdMMqwbgstLNzftE9m4Dgtyewq8lYjHNSsdBZWpO_ULCLt2hCO0SVW5xku_qcEghQMtawUVdbmQeu7c4hBtg19pQ=@emersion.fr>
In-Reply-To: <87ilwt3ei7.fsf@intel.com>
References: <YZARol5A5hS+5a5m@gineta.localdomain> <87ilwt3ei7.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Claudio Suarez <cssk@net-c.es>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, November 15th, 2021 at 11:22, Jani Nikula <jani.nikula@linux.int=
el.com> wrote:

> - Adding drm_dbg_connector() which would take drm_connector as context,
>   and do drm_dbg_kms() with the above prefix.

This wouldn't work great in case multiple connectors/planes/etc are involve=
d,
or when drm_dbg_atomic() is used.
