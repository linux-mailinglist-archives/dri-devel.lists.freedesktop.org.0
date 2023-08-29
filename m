Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A10B78CB8A
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 19:48:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9601210E417;
	Tue, 29 Aug 2023 17:48:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC3CF10E417
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 17:48:55 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D3B2666071EF;
 Tue, 29 Aug 2023 18:48:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693331334;
 bh=wr+yBFC1fV6dP3u5KBDUKb3epfUwvgrSbL6DhAGURCg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PmC8Ql1Ry3VSAT8MhIRXFdG9c21Ou78egRnr3RdNumkIIjA1yCLNIItDPWsvxu/18
 3ji9cti+Fs4W0b13+CrQq2iY7ALtOJ232OwckIZtQG5mJi+VG2li1LNAB6igKhbgDu
 5tSRj2Ea3lNrx3wsQPCrMV4ynV+PCXqHvCu6eLdJt9KFR6YjWShZCBpfypqgPcbX/N
 5hRLJEdH849kFQBuvE8tlLBcFaucVowfAgCm0Mfa0J37MnEwzdyn9XkLkuiJDcY/L5
 hdXYauGW1ifPrXn/FbwHDqmvXws4D0IPuO6t+oll47es9kEKQacvPB3eYoGlOSEuRz
 Fiwih0K6Z7I3g==
Date: Tue, 29 Aug 2023 19:48:51 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2 15/15] drm/panthor: Add an entry to MAINTAINERS
Message-ID: <20230829194851.51691294@collabora.com>
In-Reply-To: <ce6c867f-35b9-12c1-f423-0c99304322f6@arm.com>
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <20230809165330.2451699-16-boris.brezillon@collabora.com>
 <ce6c867f-35b9-12c1-f423-0c99304322f6@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, "Marty
 E . Plummer" <hanetzer@startmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 11 Aug 2023 17:08:20 +0100
Steven Price <steven.price@arm.com> wrote:

> On 09/08/2023 17:53, Boris Brezillon wrote:
> > Add an entry for the Panthor driver to the MAINTAINERS file.
> > 
> > v2:
> > - New commit
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> > 
> > If anyone from Arm wants to volunteer to become a co-maintainer, that
> > would be highly appreciated  
> 
> *sticks his hand up* me me! ;) Seriously though I'm happy to help out
> with the maintenance.

Ah, that's awesome news!!!! Thanks for volunteering.

> 
> And I'll try to finish reviewing the patches next week. I gave it a
> quick spin on my Rock 5B and the GPU seems to work fine. I also need to
> rebase my user space submission work. And recover from coming back from
> holiday! Plus I'm sure I wasn't full-time on GPU related things before I
> went on holiday... ;)

Thanks a lot for the thorough review. I'll try to address all your
comments and update the branches on my repo with the new version.
