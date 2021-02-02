Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B01430CF98
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 00:05:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A0896E9B5;
	Tue,  2 Feb 2021 23:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C6DC6E9B5
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 23:05:14 +0000 (UTC)
Date: Tue, 02 Feb 2021 23:05:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1612307112;
 bh=/3s0kylSNJat3jWiPf21jjHZU/lQGyI9w8wgi76EN8o=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=rdHPvd44ShGHBabQC5gSzoL8guVd5NCS7J7Zdb44dVfxk29E8p8Th1Sq6Zn5bFuYO
 yr/J67j9CvIJUwdfH4Pn396/1QLu6/4WYRCKEAAIIII6HrQywMQnWUn2QFwYUDo5n7
 qhsGfPQxX5bWg54z8WH5xN9+ionvXiRfnQqBss6lvuAxzSkAXPa/wFOXWMtL6gmZvs
 4MNsKb3o60iAhiwRQVrv10xIIkvofv9uAlK9Zapyi9v5IPVnJsW/ccvHPL+e9z/QNX
 KU85pZJIU/JUHqjsgoK4YiWPeWMSWjJL/nnSQLan8Ujbv+OY9556l7+E3GISq9m53d
 DMVe0xM1NQYJw==
To: Emil Velikov <emil.l.velikov@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: drm_basic_types.h, DRM_FOURCC_STANDALONE
Message-ID: <q1Pxu2WYgki1MstAIH9teIf8dx7pYjCTYQFy9tXddftNG_Wt8hbmJSXaiY5gMCrTRVa-kBDJkPyWmXSzVFjMqO4_67g-9BEZgCEdIWthYkA=@emersion.fr>
In-Reply-To: <CACvgo51OWzPmuQyKxKr5EnFpS9FV74-6QZw-fYjFyihpWKF2DQ@mail.gmail.com>
References: <20201210103553.1ae238d2@eldfell>
 <1607591574-949-1-git-send-email-jpark37@lagfreegames.com>
 <1607591574-949-2-git-send-email-jpark37@lagfreegames.com>
 <CABjik9eM1JGy42WgSpqVjxakjHMSr_sxpAPAHT5rrMSZ0Kwakg@mail.gmail.com>
 <CACvgo52y219pp=oD3FPT46YmVYhSwa3BfaQEoq6rj7KwqZE1NA@mail.gmail.com>
 <CABjik9fQkkfmVZKLoVi8VAHYNOkUMaoFSYHxEGP6qKZvMh9VJA@mail.gmail.com>
 <CACvgo51OWzPmuQyKxKr5EnFpS9FV74-6QZw-fYjFyihpWKF2DQ@mail.gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 James Park <james.park@lagfreegames.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, February 2nd, 2021 at 11:48 PM, Emil Velikov <emil.l.velikov@gmail.com> wrote:

> P.S. Please try to avoid top-posting and HTML emails in public discussions.

(James: as a side note, here is a guide to configure your e-mail client
to use plain-text: https://useplaintext.email/)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
