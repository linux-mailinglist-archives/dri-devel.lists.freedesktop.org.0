Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 028F2720D28
	for <lists+dri-devel@lfdr.de>; Sat,  3 Jun 2023 04:11:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E95D610E136;
	Sat,  3 Jun 2023 02:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F5B10E004
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Jun 2023 02:11:24 +0000 (UTC)
Received: from [192.168.2.99] (109-252-150-34.dynamic.spd-mgts.ru
 [109.252.150.34])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E24B56600010;
 Sat,  3 Jun 2023 03:11:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1685758280;
 bh=AEiivb5STUIsnv46nBIbrOdDbVAIQqj2qIRUT1z+E1U=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=mFShlImOeL/NAWI56P4wzSdK529nNkSIwJYFpygQ9my2QPRTHaeKwKzSG+S6dhn+L
 Ah1oTEY6MofA6LWr0LuPm0DsmQMtXuq6zkE2zuqVfzwyRovmuusUECgYC6WB6SNkDn
 KOBbE+raamIdVg3QHJalIG7Dw6bokc07rH3eAmuU19hdpmA2v/s2CjK7u9K8kyWIPD
 6VFDiUsWeHhN4eJqehfajX97dqldITPPKdW+Qk1qrfEJGJxq2WgFIFmIOio+nEw12E
 GiPX3ijhF7QUpFbYnA/WxFV9ZFbtyJ0QPJstpm0P8X4PBC5j9K3pLrRiWlAX+V8ekA
 k1+nLQAN+RIEw==
Message-ID: <0a45ae24-61e2-f691-6f72-42257084919f@collabora.com>
Date: Sat, 3 Jun 2023 05:11:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 0/3] Add sync object UAPI support to VirtIO-GPU driver
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?=
 <maraeo@gmail.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Emil Velikov <emil.velikov@collabora.com>
References: <20230416115237.798604-1-dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20230416115237.798604-1-dmitry.osipenko@collabora.com>
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Dmitry Osipenko (3):
>   drm/virtio: Refactor and optimize job submission code path
>   drm/virtio: Wait for each dma-fence of in-fence array individually

Applied these two patches to misc-next. The syncobj patch will wait for
the turnip Mesa MR.

-- 
Best regards,
Dmitry

