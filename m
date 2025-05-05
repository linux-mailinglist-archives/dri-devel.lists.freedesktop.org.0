Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D6AAA9A2E
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 19:11:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C4BE10E2FB;
	Mon,  5 May 2025 17:11:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="YurTX5WO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0ABF10E2FB
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 17:11:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1746465108; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Ah6rZyHM1A1KKhzEik+Fi5PuruMpmPW/sHMU6CpwKEvtU0ddiyJ9laYLyIZIAPly01S6BNaJqBYFSZcZNbIJZQsI00EOMvyz8fq3pTKG2OVLwkj6159S3EP21JQsFSmfoPSdTaZGazUKuUDABeFc8rTTPidmsRnULQUUXaAzKMI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1746465108;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=2D6ebKs/onPwPb6GX/J6JP/5ZSH6M6z9gbXB71Nehis=; 
 b=TqlXJ6bbyAQ5NQtocpdOK1vlvnEfRlzX4iYXgbsqdMTiX4hdm+7RMjA6iZaNfZdcQd5NoFP14umK8jYN+mJQq5yo+AParu0IzPHevt87sWASn/7qjWUHkTGhAZTFL5rpxLCTZxEcrhWGCSGylPmrRq77T1WGUB8TcftXnj/mGP4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746465108; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=2D6ebKs/onPwPb6GX/J6JP/5ZSH6M6z9gbXB71Nehis=;
 b=YurTX5WOXDIgRbGXITBB177Eh9DKxtF1IXdHlx9gKvOun7VfzFZ7TEEyh9zki8rU
 QL2u7ekQlplZdbfLwR0SF9ZR7ZfChi4+HcAMv7IFPIUJhnuyum5RfrUI+sbTUkQs9w9
 TBITXwbQ8QG0MrVl3pf3Xh+pS8P3Rnxhmlfryx2g=
Received: by mx.zohomail.com with SMTPS id 1746465107177872.785073369091;
 Mon, 5 May 2025 10:11:47 -0700 (PDT)
Message-ID: <7f334c99-fe86-4e53-86d6-e8473c76ff3e@collabora.com>
Date: Mon, 5 May 2025 20:11:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] Virtio-GPU suspend and resume
To: dongwon.kim@intel.com, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
References: <20250418232949.1032604-1-dongwon.kim@intel.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20250418232949.1032604-1-dongwon.kim@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/19/25 02:29, dongwon.kim@intel.com wrote:
> From: Dongwon Kim <dongwon.kim@intel.com>
> 
> This patch series introduces a freeze and restore mechanism for
> the virtio-gpu driver:
> 
> First patch adds `virtgpu_freeze` and `virtgpu_restore` functions.
> These functions handle the deletion of virtio queues before suspension and
> their recreation during the restoration process.
> 
> Second patch implements a mechanism for restoring `virtio_gpu_object` instances.
> This is necessary because the host (QEMU) deletes all associated resources during
> the virtio-gpu reset, which occurs as part of the restoration process.
> 
> These changes ensure that the virtio-gpu driver can properly handle suspend and
> resume scenarios without resource loss.

Resetting GPU by QEMU on suspend sounds like a wrong behaviour. Are you
talking about upstream QEMU?

Could you please point at the QEMU code where it handles virtio-gpu
suspend/resume? Don't see where it happens.

I tried to apply your kernel patches and then suspend/resume guest
kernel, it doesn't work:

virtio_gpu_transfer_to_host_2d: no backing storage 2
[   22.909454] [drm:virtio_gpu_dequeue_ctrl_func] *ERROR* response
0x1200 (command 0x105)
virtio_gpu_transfer_to_host_2d: no backing storage 2
[   23.169138] [drm:virtio_gpu_dequeue_ctrl_func] *ERROR* response
0x1200 (command 0x105)

Cc: +Alex Bennée +Akihiko Odaki

-- 
Best regards,
Dmitry

