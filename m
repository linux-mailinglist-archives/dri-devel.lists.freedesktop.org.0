Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4290A43E329
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 16:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B93B6E977;
	Thu, 28 Oct 2021 14:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87606E825
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 14:09:46 +0000 (UTC)
Date: Thu, 28 Oct 2021 14:09:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1635430184;
 bh=sfjvhnOlQn80OqnZTv0gYWgB7med55eS3xYGH2ls3VE=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=EP1gCbnZShgu/GPwsJ8WVRZICz0Jz9E8IUzu3I/MevB20iYyP2TIdhQ9qY5YI44WB
 R64aqJ2Y9Cil+LzIM3t5Cr0ecNjpZNlkrjsnPfLlLLbqpOO+VzxMUYT+lnAeRkAGHA
 xlxCA6s28mWKPq+6qjgnZ7q3U8A6belIR+nxXCR893ijivnfThWXHDhGQIYE7458LT
 oZCsaOKYf3cBP0fE6ux1QBJooH2bnLRct5dH5Yzq4Pr5OC299oyO4nm42JVMfMBIs2
 p6f4pM7uskWoARQaWdY32+pzVsiLbWpeGPn+Os7II7e6Vc1Hkl3qsDb1U93datg9uu
 xlPyfhn0RB9dA==
To: George Kennedy <george.kennedy@oracle.com>
From: Simon Ser <contact@emersion.fr>
Cc: gregkh@linuxfoundation.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: check drm_format_info hsub and vsub to avoid divide
 by zero
Message-ID: <8hH-kEJ_5Fp13IJG-WuzuXJ9cXjNaigTbD0yHYmgmOCk8WmJpZr4pd2zeDwdOiMrPxxyseNzRnSel5e2OOwzF8HPPaoQJWva-EgVF7xy3-k=@emersion.fr>
In-Reply-To: <1635429437-21718-1-git-send-email-george.kennedy@oracle.com>
References: <1635429437-21718-1-git-send-email-george.kennedy@oracle.com>
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

Maybe a self-test checking this would be more appropriate?
