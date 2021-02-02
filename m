Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E02D430BA4F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 09:51:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F8D6E8F0;
	Tue,  2 Feb 2021 08:51:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C4AF89D64
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 08:51:49 +0000 (UTC)
Date: Tue, 02 Feb 2021 08:51:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1612255907;
 bh=j6Mp6GWrSt0kIK5zhOs9MhTZGXmEBJUBnyEdkutvCpc=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=rUeFHjExNFpGCCzQgjB2e2tjEoJ0ePB4CJoU2oA+/p8iw2SJpAyZpWasxwUl9g94Z
 NE14SDpMlAcVFjZlarl9SHUaOW71mlOC72Dcb7RD60q3GZKGxactyV7U0OQiXDKdrL
 +DTZvQcEedJ2Va+icytkoW0jye1QtTRlafqPxHoik3dje8ePZmgWWJ69tNo+BK5IFB
 3L+7FqMdZwE9vAABH2pqDcB739e1m9we9WSHb4uF4GP4YlUf/mt4lzKmF47Y4NJYl3
 jfY6J2aQEQEmYStzNoSWyuC0YsKyAPwT5yH6qgRzK5kJx7Wo4czmBMa31LVxZcDMIc
 G935rs52zi0tw==
To: James Park <jpark37@lagfreegames.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: drm_basic_types.h, DRM_FOURCC_STANDALONE
Message-ID: <RpxNZyp-FQqXSxcbLe1-DOkqA8ItXXvD6VIEPaZRY6HpuM3-vaCA1XaySq2fszYCp0frPgaB50bccqUrqAFVSAgBCItsvG13u07O3AIs2zA=@emersion.fr>
In-Reply-To: <1607591574-949-2-git-send-email-jpark37@lagfreegames.com>
References: <20201210103553.1ae238d2@eldfell>
 <1607591574-949-1-git-send-email-jpark37@lagfreegames.com>
 <1607591574-949-2-git-send-email-jpark37@lagfreegames.com>
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

On Thursday, December 10th, 2020 at 10:12 AM, James Park <jpark37@lagfreegames.com> wrote:

> +#ifndef _DRM_BASIC_TYPES_H_
> +#define _DRM_BASIC_TYPES_H_

Nit: the rest of the kernel doesn't use an underscore prefix for these
defines. Note that anything starting with an underscore followed by an
upper-case letter is a reserved identifier in C.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
