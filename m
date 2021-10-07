Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2150942510F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 12:28:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64E56F3EA;
	Thu,  7 Oct 2021 10:27:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00996F3EA
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 10:27:54 +0000 (UTC)
Date: Thu, 07 Oct 2021 10:27:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1633602472;
 bh=SCRdqYu/X+JlKwPLq1M2s6KsWP3afb1Fv8d1g4YI73I=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=x8dUwwWILkAU4wRcL4uYHIN8jZr+f92xwSq0VH95fhJ0bo1z3w4wxSfhGCkTmwc5m
 2rasuO02jhl6U6S7ZBF1h8YwPhoKAZpYJIXEzoFZ3rpMvEj4MAOYfc2jiRGRYgK9+e
 CHHc57rNn06TLGCBfZ6U4bSdCNB32KvHr9OHFiKBN4yYBGwKOWK3tG/Qbx/e9SnWFS
 TeGXKKJCJqqIt1Y+XUWi2Jx4IAn4l4HPc9q3C219litfkAfX/WtL9PZyfmV6CCowsq
 h4o//ylnaC/3AoyNkK8zWA8N+FAPL7hjub93DLE03cc2mgivXEmX1SV9sIWtOu8UTZ
 1JyA1E/rTFNbA==
To: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 ville.syrjala@linux.intel.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/plane-helper: fix uninitialized variable reference
Message-ID: <8jznM1zShVceOF2IvoMF0A6tKwHeua93m1l2uVxmMy355OlLrGMKcf73CvXqtLtda8KfVxoeGW74yIjI-9N20g3pgzb41Eb11Ly2vSQf5Z8=@emersion.fr>
In-Reply-To: <20211007063706.305984-1-alex_y_xu@yahoo.ca>
References: <20211007063706.305984-1-alex_y_xu.ref@yahoo.ca>
 <20211007063706.305984-1-alex_y_xu@yahoo.ca>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pushed, thanks!
