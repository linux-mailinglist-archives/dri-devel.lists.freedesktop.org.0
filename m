Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 980B625AB43
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 14:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6CB96E4F1;
	Wed,  2 Sep 2020 12:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F8096E4F1
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 12:40:42 +0000 (UTC)
Date: Wed, 02 Sep 2020 12:40:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1599050440;
 bh=SYjWihsl3TAxufMatrNd+6zkvwXrH/WpNYlwy+OTZVE=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=f3JFyMjU9LorQ4VNTiVK5oEc2WHvGpqaGkwSPqKXxZLo+vvrVWClJDb/laJnVo9/R
 29uC78A3Ybmay3HBjbEdeEPWnwuvHqaM9poO/94/I6+4SOJG5AyjwxrYaGoWYrNoPM
 cSffCJSKJdV3RXW+X+v6YPrYk/uPZ2T+192i3HEkgMS6StLScoQZinRdYWJJADEniP
 mSk7camiXTsBArxSSlfAhO5bBv0heK7LXCLANoqycEWJ04VGEk6eh4C0R0sjP13kYB
 yojm89pUzJWLASC70xifuU/psXHh+KXD3/ZLUxw1BZ3XqWiKggCCFJEYlH+f5pg6iM
 lK2HbZwwvDQ/w==
To: Daniel Vetter <daniel.vetter@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/doc: Document that modifiers are always required for
 fb
Message-ID: <t3hHLqZ0yNm5FdxpyJovgjEVzs-OD7qD5nYrYXug8UhkBykhekB0_hOqPltEvFH3daJ3HYtY_3FInv3U5xIHprg1FS7b2SP8fCf48r7DvVg=@emersion.fr>
In-Reply-To: <20200902102440.3621733-1-daniel.vetter@ffwll.ch>
References: <20200902102440.3621733-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 =?utf-8?Q?Marek_Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>,
 Juston Li <juston.li@intel.com>, Daniel Stone <daniels@collabora.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Looks fine to me!

Acked-by: Simon Ser <contact@emersion.fr>

I suppose something similar happens in user-space: gbm_bo_create
without modifiers needs to properly set the implicit modifier, ie.
gbm_bo_get_modifier needs to return the effective modifier. Is this
something already documented?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
