Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E21E656E56
	for <lists+dri-devel@lfdr.de>; Tue, 27 Dec 2022 20:29:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B83FE10E332;
	Tue, 27 Dec 2022 19:29:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB4D10E332
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 19:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From
 :Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EB1EKzN3ai6ze9SRsR9S4454yQU2uLLWQ5OZm9VPszk=; b=hnZx4cNlF9vuqStU1wBNKgPCr/
 FOixaDQYI0qbQscSfi/Jrhp4TJexXfUaavjFKJhfWHKXgbu5H0pZ+vrHoiRPHYWkqAFPOR9ZbV7Mo
 gfWuI8al/63vT3a9joAX3vgveFs+OMs/004QZimUjF9iAQuWlXIwQ+4FOPznf7fQd/i3j4D4FIvLs
 OuwCpIcbIUwX+W466StSVMa9x+XHmUIi17AVx0tGlKRgRU2rWrao0NZmLGPD/r+vppiLULprNnwIj
 d+QeYRR5BY/tAGaxmL6diRyv3rfztKDK6uqz+w8+4of/Oyu6yLgV9v4DYjoyg9F5qPBFlMRVtwhlD
 q/aoDZyA==;
Received: from [177.103.98.201] (helo=[192.168.1.60])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pAFd8-00BKsL-70; Tue, 27 Dec 2022 20:28:55 +0100
Message-ID: <3f87a88c-c375-4a02-0f09-4831544e5f96@igalia.com>
Date: Tue, 27 Dec 2022 16:28:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: dmitry.osipenko@collabora.com, Christian Koenig <christian.koenig@amd.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH v1] drm/scheduler: Fix lockup in drm_sched_entity_kill()
In-Reply-To: <20221123001303.533968-1-dmitry.osipenko@collabora.com>
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
 Melissa Wen <mwen@igalia.com>, gpiccoli@igalia.com, luben.tuikov@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry / Christian, thanks for the fix!

(And thanks Melissa for pointing that, saving me lots of time in
research heh)

Is this fix planned to be released on 6.2-rc cycle? I've just tested it
on Steam Deck, and it resolved a lockup observed (since v6.2-rc1) -
exactly the same thing mentioned in the commit message.

FWIW:
Tested-By: Guilherme G. Piccoli <gpiccoli@igalia.com> # Steam Deck

Cheers,


Guilherme
