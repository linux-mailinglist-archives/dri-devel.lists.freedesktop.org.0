Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAA163C746
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 19:38:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A6F10E162;
	Tue, 29 Nov 2022 18:38:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C758710E162
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 18:38:28 +0000 (UTC)
Received: from [192.168.2.15] (109-252-124-61.nat.spd-mgts.ru [109.252.124.61])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id EE5DE6602B2C;
 Tue, 29 Nov 2022 18:38:25 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1669747107;
 bh=SMfclwv6QeX+nPT29Ty4W4fFsR6WCOe7dD5ldDTWBkI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Dym7/QJw+bIu/OjIw8TjrDfCVAlijuJzbieOtAMrEXpEh459oT0YAoasyW130JQ5N
 wozf8QMdG1Mlw9apFEYKYyi0biskEfdgopRMUCHLSlEbuTKxlvkiK3FYLOBLXZfVlg
 LqAB+m2J9+SKpzfBa3xDSYVAnlTZLQjbcJO5qVNg7s2+8+GGNZgVR7djU/yTXo09m+
 LrSXKXf0FaVDqEd0o/krQFOlasvHuJaxTvMVCj94OpLmMtuXdbncTltxmzDvzPqc9H
 pCcxhRN6J/7pmOxNwjLquH6EZImqo0wmlB/7zP0jvFoKrStXK5aaNeNjmUAks+DCMz
 xDrHAj5e0F3pQ==
Message-ID: <887fa036-c370-c241-94c8-3cb7433e09f8@collabora.com>
Date: Tue, 29 Nov 2022 21:38:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] drm/virtio: Spiff out cmd queue/response traces
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20221129174330.262751-1-robdclark@gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20221129174330.262751-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/29/22 20:43, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add a sequence # for more easily matching up cmd/resp, and the # of free
> slots in the virtqueue to more easily see starvation issues.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h   |  3 +++
>  drivers/gpu/drm/virtio/virtgpu_trace.h | 20 ++++++++++++--------
>  drivers/gpu/drm/virtio/virtgpu_vq.c    | 13 ++++++++++---
>  3 files changed, 25 insertions(+), 11 deletions(-)

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

