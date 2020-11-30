Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 487612C820A
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 11:23:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D493B6E43F;
	Mon, 30 Nov 2020 10:23:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A9C06E43F
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 10:23:08 +0000 (UTC)
Date: Mon, 30 Nov 2020 10:23:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1606731785;
 bh=WeaWPztzCnUvOqVzyw64pHk4c/DgxfD6KUMc6Nzc9f4=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=EQMloaH3sgsLYQ8lS6KSPS7h3iganmSe9lSGCX+n+SvuFA/JVLWiQHxTuWkzzqyeL
 FNgufeUSnlvsSpB94Fri6yQpuWVtA2v+3vRpBiy30PkUNfbqZKUj3tzdtdzWOkyhbZ
 pFyJjX4z9WxNFByhjgsch5CDD4v+ekJGFF6Fn4rsY0wO9QgJkpLTgORT33p7pJirIy
 XRLEXtxRo5yb/MnNaRsmktj2hw0sSLPoYyosrw/rD1pwetdc4ECC14CCnQaPNP+eHN
 NMWIo7heKWksGZCYklm+ag5qydaPGe/SDnJrbhM07ducb/ltFReWA9BFy60AzVDkQP
 cxNCBCZ+918lA==
To: Leandro Ribeiro <leandro.ribeiro@collabora.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/vkms: detect modes during output initialization
Message-ID: <H5TtDGvtYXHmWmVpmi1NyWShzr17yAkVlxZOuKcP-fekJpvYX_Ec7JQtizWk8Xpkaw95TIkTqhzWZER4xwl0mOguSjIQSGLBgGQVMPAejyY=@emersion.fr>
In-Reply-To: <9365f1d0-2bb7-d7e8-dad6-62111abadee8@collabora.com>
References: <d589025b-76b2-1826-1798-60f61000b14a@collabora.com>
 <20201124143947.GP401619@phenom.ffwll.local>
 <9365f1d0-2bb7-d7e8-dad6-62111abadee8@collabora.com>
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
Cc: Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, November 30, 2020 2:03 AM, Leandro Ribeiro <leandro.ribeiro@collabora.com> wrote:

> In userspace we can use drmGetConnector() or drmGetConnectorCurrent() in
> order to retrieve connector information. The difference between both is
> that the former retrieves the complete set of modes and encoders
> associated with the connector, while the latter only retrieves the
> currently known set of modes and encoders - but is much faster.
>
> This performance improvement is the reason why userspace applications
> may prefer to use drmGetConnectorCurrent() when they need to retrieve
> information from a device.

We discussed with Daniel Vetter and it turns out user-space should
always use drmGetConnector(). See [1].

[1]: https://lists.freedesktop.org/archives/dri-devel/2020-November/289506.html

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
