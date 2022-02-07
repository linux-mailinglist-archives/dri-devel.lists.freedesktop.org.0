Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9AC4ABEAE
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 13:57:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B067910EF8A;
	Mon,  7 Feb 2022 12:57:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E47710EF8A
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 12:57:29 +0000 (UTC)
Date: Mon, 07 Feb 2022 12:57:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1644238641;
 bh=f8kebzgyEwbma2LTxX2qJiLpT2Umo59tQD0RG7lyyAk=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc;
 b=Ce4ab1DV+Rn5WDa2PnFC1Lm+Bifd7qIFdu2JRoFDbLiiK8OyMTd0pBJwZvxRos9Om
 JOiHptejS4622mOrNHrrtaqxq8jvvERBQy0RcuHygdVgUptoZpZ2R8QMb8UueldPZl
 +schCEzHW0YcW78DqeXCUMPmF75YlB2g0CHhY6Ub9i/Om3kt1czgw6uy87SWAltU7n
 9Z2eQa77IZe+i0lOfIjPHmAN8r8AsNqqrk51x6N2iH69tN4U928VULAxoa2lz407EZ
 cQDQXmV6qEcs7DoiI3l753e/QkyyfzaynMW51NizfQXs9JIv+n28k+m3G5+olX0ti/
 ZII3NQASJ0hBA==
To: Hans de Goede <hdegoede@redhat.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/privacy-screen: Fix sphinx warning
Message-ID: <oYHv9BS3lw2vyYuFEI2W2W7SJQhv4vPck--6y4DOohaDgZqZA9YyhMyucITv4SDkOJJTQZMZBivIjLyLha70iQCJyowAvxCfOW88kzekHdU=@emersion.fr>
In-Reply-To: <c7d5a207-a467-ebbf-cee0-b40223839efb@redhat.com>
References: <20220126151105.494521-1-hdegoede@redhat.com>
 <oW_YQ9nS3nPTTNYd8OplqMpLezdIzohS4_PcYz5aI1bmv4SKcKRGNvqgJ9yJQWehrNgWWBxLhnzICHPylEc0yXIbVcQCuOdTTvVeKqUtGuU=@emersion.fr>
 <c7d5a207-a467-ebbf-cee0-b40223839efb@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,T_SCC_BODY_TEXT_LINE
 shortcircuit=no autolearn=disabled version=3.4.4
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, February 7th, 2022 at 13:55, Hans de Goede <hdegoede@redhat.com>=
 wrote:

> It is not an argument to the function being described

Ah right, makes sense then!
