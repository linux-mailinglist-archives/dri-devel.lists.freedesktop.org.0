Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5106C4B9CC1
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 11:11:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F1210F01E;
	Thu, 17 Feb 2022 10:11:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B7210F01B
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 10:11:35 +0000 (UTC)
Date: Thu, 17 Feb 2022 10:11:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1645092693;
 bh=T6IpIe0qlak/CRlarOD0jKHaYw0xSiHQu/HYNWx/KyM=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=X+i20R5g6ti2hqmOoTzHcZag2oMG6wacA4IM9NAmsxM5gAbqBGJ0BrYEbJph2fNVv
 IP8F8DcPWOwL7kEgFlhn+Kd+zeXnREUhjPdBVoUn5j/9atEZSyStWGvQSY8HNGduWK
 zfTEw9aL7rd4112wrmpdNluANJjyHnbYKXP88qLlmsY2DUq2UQzQsZgPO4Zg61RbNe
 4cAOJFyW8sSm/47UyeQJ0qvFIlWqIwSIWzPP7cSukV9lAuQybM65SOFY8U+PR71Cq/
 tBuXy/ouPvAS2QntjYR6DKM8ciJEMErzpOV25DhhZEPD9cor+Pg+TJUzLjmIW8bXlZ
 ZNQ1fXHRqlaYQ==
To: Geert Uytterhoeven <geert@linux-m68k.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 8/8] drm/fourcc: Add DRM_FORMAT_D1
Message-ID: <DcHC6EkcAbkIdUGwoi3NJ9dU_zOwtndgZvp6ynoG05hPKPphZNEBAGWo25xgkxjjfmqzn2vBJcc3xGaFEMfWqY0jXNus1sWjmZSr9yzkcZE=@emersion.fr>
In-Reply-To: <20220215165226.2738568-9-geert@linux-m68k.org>
References: <20220215165226.2738568-1-geert@linux-m68k.org>
 <20220215165226.2738568-9-geert@linux-m68k.org>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 linux-m68k@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tuesday, February 15th, 2022 at 17:52, Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:

> Introduce a fourcc code for a single-channel frame buffer format with two
> darkness levels. This can be used for two-level dark-on-light displays.

The previous patches introduce C1 and R1. Do we really need D1? Can't
we just use R1 instead?

Simon
