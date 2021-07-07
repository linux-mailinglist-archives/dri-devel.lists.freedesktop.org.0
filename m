Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C05DB3BE510
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 11:03:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B92306E82F;
	Wed,  7 Jul 2021 09:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B4986E82F
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 09:03:08 +0000 (UTC)
Date: Wed, 07 Jul 2021 09:03:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1625648585;
 bh=FfzoFy/JPOfylMDSWf+V05WzCz+VvbqhnbLqlhgFSx8=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=ljxtuZM65q38o0IdXEGPYwe0aG0xa7D7WyJPn6tKjLJFJcC7flV2mmW5khXcCFex1
 vJSgPp2kAjkSWyHproJkq38PP4V41BvS2OJOomjwzB4nOW7/MLiATIOeTE2TMftSaE
 bJRLsG3u2x7GXLdYRKNztRATQbXOBvSiWZOtwbewcfevcpT1cqFeaKzy8LVKif4YCp
 moZ3dYYdMly+OCsY7mTIMk/+in8WBZi3sHl+fPl7cvXvsv2aCItmE36TaUhLI3jfV6
 ug5cPO1ShVIjtXioziDpaXn77Z+tBfIdHCHxaodC7rIqA9b9YI0OzIomC73J/kln/a
 rsg0ooJaaismQ==
To: Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 0/2] Add "BACKGROUND_COLOR" drm property
Message-ID: <31K3xupK1-7HNWorHqIwGwgEJl-1XdFjUQEoNYm6yB-lRoZ8kq5quRji_r3mzPZ0bUayLef6xPfQDiETgZp9lR7vUpDn2nB_37ncSd-J0Wc=@emersion.fr>
In-Reply-To: <20210707084557.22443-1-raphael.gallais-pou@foss.st.com>
References: <20210707084557.22443-1-raphael.gallais-pou@foss.st.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 David Airlie <airlied@linux.ie>,
 Yannick FERTRE - foss <yannick.fertre@foss.st.com>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yannick FERTRE <yannick.fertre@st.com>,
 Philippe CORNU - foss <philippe.cornu@foss.st.com>,
 Philippe CORNU <philippe.cornu@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Thanks for working on this. Do you have plans for user-space
implementations and IGT?

Thanks,

Simon
