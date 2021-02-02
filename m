Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C60F30BA53
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 09:52:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 627CB6E90D;
	Tue,  2 Feb 2021 08:52:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC88C6E90D
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 08:52:41 +0000 (UTC)
Date: Tue, 02 Feb 2021 08:52:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1612255959;
 bh=NuD8Nnv7LUWTHWZ8o1+XJHigS9tHUdungF9n+7xV9Rg=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=GJxk8z7zCzKEpvfAHb8UWyQYk/JkpIvfaSh/G2Xunk/BLLdCnjULMHamAmQv19QhF
 KV0Ytb0Wk4x3lLZiZQ/YuDRyw++L1Un3jSZX/EHCYotiaReQegwCb7+izFZwwmUcZf
 WOMk9lIQwBG2AvUFiu1QEIQGTq4D2KT13/turJduOH8/zgIDq/piUSskOZiw+JMkpG
 rWLefOGH2FkctBXYCgTCSS0DKAt/B++gmX90Pom67h6OAUsgmeYfecCdvCvlB2xJDy
 Xm/DbsKsPKSmN6sL+yF3hP1mJaTmXsL3sv9dI1lA6RgsVMOz/VJj9OgKzWBGoLQeyV
 aPY8bplw/BddQ==
To: James Park <jpark37@lagfreegames.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: drm_basic_types.h, DRM_FOURCC_STANDALONE
Message-ID: <ScG3s7vMDTpaDSHZkKrLFyzUmeFch3xqvf54K0Vn9AUchpMF1P61dsBZwhTb0INz94Q-zoSNe5wPpdqX4ywZyAMULxGkACwbc6GB9EbVQrU=@emersion.fr>
In-Reply-To: <RpxNZyp-FQqXSxcbLe1-DOkqA8ItXXvD6VIEPaZRY6HpuM3-vaCA1XaySq2fszYCp0frPgaB50bccqUrqAFVSAgBCItsvG13u07O3AIs2zA=@emersion.fr>
References: <20201210103553.1ae238d2@eldfell>
 <1607591574-949-1-git-send-email-jpark37@lagfreegames.com>
 <1607591574-949-2-git-send-email-jpark37@lagfreegames.com>
 <RpxNZyp-FQqXSxcbLe1-DOkqA8ItXXvD6VIEPaZRY6HpuM3-vaCA1XaySq2fszYCp0frPgaB50bccqUrqAFVSAgBCItsvG13u07O3AIs2zA=@emersion.fr>
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

On Tuesday, February 2nd, 2021 at 9:51 AM, Simon Ser <contact@emersion.fr> wrote:

> On Thursday, December 10th, 2020 at 10:12 AM, James Park jpark37@lagfreegames.com wrote:
>
> > +#ifndef _DRM_BASIC_TYPES_H
> > +#define _DRM_BASIC_TYPES_H
>
> Nit: the rest of the kernel doesn't use an underscore prefix for these
> defines. Note that anything starting with an underscore followed by an
> upper-case letter is a reserved identifier in C.

Hm, please disregard, it seems some files still use an underscore.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
