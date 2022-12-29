Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE629659095
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 19:53:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF8410E002;
	Thu, 29 Dec 2022 18:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F6D10E002
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 18:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iqDL55PZjFw0FUAHHyyr6Jd1zLLkgLC+5qYAWmFxvZs=; b=eq7pvj408N3kIsUohCTeCO6a2g
 mmrVBqz0/SFyK14/fjQQ19EytJdmLRYMx2eKhv9PpqJGvuFk5AOR0YYbg6LC8QWjfbSFDDXrX0lEN
 Auzoq3hTaf6E0KGHBForIWe0B4vmabqPX3ca8vttgvysN4pVMo/FGCu6s2dPCSDzdY9a/yIifd/BO
 njzlznkelJJcuNNSh6aKHVbXOilrfajTEJgOKR85NjMs5PgtuTQkp7JAoBA6pp0dz6cNJYLCRIHzI
 NGfBBq84DIlOBhk67bH5O5ZjDE+Q6rSzHEo+2JYLk4COq9G7EdIxkJ+wEvw6mkFVoxLHB+GXz1YRi
 ZNTilwEg==;
Received: from 189-47-75-109.dsl.telesp.net.br ([189.47.75.109]
 helo=[192.168.1.60]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pAy1O-00CmeZ-Jf; Thu, 29 Dec 2022 19:52:54 +0100
Message-ID: <27b562b1-ca1c-9b69-b9bc-bf5bcd004b9c@igalia.com>
Date: Thu, 29 Dec 2022 15:52:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1] drm/scheduler: Fix lockup in drm_sched_entity_kill()
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
References: <3f87a88c-c375-4a02-0f09-4831544e5f96@igalia.com>
 <41aecacc-44e5-1455-48cb-20e32187610c@collabora.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <41aecacc-44e5-1455-48cb-20e32187610c@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Guilherme G. Piccoli" <kernel@gpiccoli.net>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>, luben.tuikov@amd.com,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/12/2022 07:15, Dmitry Osipenko wrote:
> [...]
> I'll push the patch to misc-fixes as soon as it will be rebased on
> 6.2-rc. Thanks!
> 
> Best regards,
> Dmitry
> 

Thank you Dmitry, much appreciated!
Cheers,


Guilherme
