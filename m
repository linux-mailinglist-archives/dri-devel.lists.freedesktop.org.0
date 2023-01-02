Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 317B765B3A3
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 15:59:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A7A810E1A3;
	Mon,  2 Jan 2023 14:59:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99C710E1A3
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 14:59:18 +0000 (UTC)
Received: from [192.168.2.142] (109-252-113-89.nat.spd-mgts.ru
 [109.252.113.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B000B660036F;
 Mon,  2 Jan 2023 14:59:16 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1672671557;
 bh=P6twPSAUn14MSaKncu4Q5IlCvYzqCSUxPdVT3emjtIs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eiXb/uNl6OdbnvNa1TpajuzdJTUnkviFtgSQlA83EuxsK0IBdsUCmfw6IuWDgqUG2
 Oi7wbyVkaTjS0/dea17uYhzclwCCmSikoLYL6S8V7dt0Bubdr5i90byVz9vLAhpy81
 Pw62KiRi1wJ9V8r0buOko4jUYqMht+rORRSmf7fGgInJwMw5ymBUaQK0Hy/leBDTvA
 4FqRur1eWIW0yQ5GFwLPkktC0M8AB8UIQvgLCP+u5OtUajINEDZ6Ht8l+BQNdvfiBD
 IRm0jLGXv31e9nTg4NVMSZ0733UfC8YLxl7KffBhO5Rkq2UfOPYy4TsYFovQPWzQGb
 2fwc7RossPKXQ==
Message-ID: <f7bd13b1-67f1-da42-6bac-aa26ab309b5e@collabora.com>
Date: Mon, 2 Jan 2023 17:59:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] drm/virtio: Spiff out cmd queue/response traces
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20221130000841.318037-1-robdclark@gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20221130000841.318037-1-robdclark@gmail.com>
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

On 11/30/22 03:08, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add a sequence # for more easily matching up cmd/resp, and the # of free
> slots in the virtqueue to more easily see starvation issues.
> 
> v2: Fix handling of string fields as well
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h   |  3 +++
>  drivers/gpu/drm/virtio/virtgpu_trace.h | 26 +++++++++++++++-----------
>  drivers/gpu/drm/virtio/virtgpu_vq.c    | 13 ++++++++++---
>  3 files changed, 28 insertions(+), 14 deletions(-)

Applied to drm-misc-next

-- 
Best regards,
Dmitry

