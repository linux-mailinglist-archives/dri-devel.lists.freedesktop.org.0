Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1802301EB3
	for <lists+dri-devel@lfdr.de>; Sun, 24 Jan 2021 21:24:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 172BD89A77;
	Sun, 24 Jan 2021 20:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22EDB89A77
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jan 2021 20:24:24 +0000 (UTC)
Date: Sun, 24 Jan 2021 20:24:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1611519862;
 bh=oS/4xuWjY9B/FnEIgb9Kb4Ve8fwScV7zYmswc7gyukM=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=h5Lcz03zZZMmOIr5X2pzKDL9+kV32mT232sttDgQLTY18TWYVmCSRJk7fym0tdZQ6
 fXKp15hBJCO6VbhIDHRUxD3Ee9Csa7DbYpXr1BRS6mAb7X+Z6XkY9LXjGD5xtm6zmh
 6PxRg/HYJWxbWU97trH2PvUR4E1KWXbGtKYn1kZH/TuMCdGngVFFLFlywzo6NpDQVo
 jz8uZuRNvyhOdee/7NkOZc06XebjQh2OzTzafBJKUqIWcRSNjwMfHH7ibB07dPF+Io
 nu5LNZhUOAs+CH9gc3GIiuutPmihwhU68IUCGM0un9t4Lahul2mCUg+QubzkGANmm0
 NqflB7wfR5x1g==
To: Mario Kleiner <mario.kleiner.de@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: Fix HDMI_STATIC_METADATA_TYPE1 constant.
Message-ID: <yEq1_Ipkzm_vP4BD6cKlonRVfMbfGXrlvxOG4XDkk_wg1UkPCdLj95I8pknonGjf2Bs1zYeErr1WXerrQjprE3k1vswj3E2Nzq-imF58ytM=@emersion.fr>
In-Reply-To: <CAEsyxyj-dHAk0qkkpOsycqfpPi_FW5zh_58hs1gi+6h1M_b8-Q@mail.gmail.com>
References: <20210124044010.18678-1-mario.kleiner.de@gmail.com>
 <86DkveYU9PqmKT4KfDgHvFG_SytoDc4EyfmehALDIJBt7oH3Arn8O97o-pQ3yRU-kfHi-RuwA9zdI-Kz1aZUQBuOSnqmz1GdrRUNPNRsEu4=@emersion.fr>
 <CAEsyxyj-dHAk0qkkpOsycqfpPi_FW5zh_58hs1gi+6h1M_b8-Q@mail.gmail.com>
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
Cc: Uma Shankar <uma.shankar@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sunday, January 24th, 2021 at 9:10 PM, Mario Kleiner <mario.kleiner.de@gmail.com> wrote:

> But it still needs to be fixed if we want working HDR. I thought
> libdrm copies the definitions from the kernel periodically, so the
> fix should propagate?

There will always be user-space that sends 1 instead of 0. This
shouldn't fail on more recent kernels or it will be a regression.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
