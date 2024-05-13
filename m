Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD878C438C
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 16:56:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B01610E19B;
	Mon, 13 May 2024 14:56:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="C4Dpco6P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C42E10E19B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 14:56:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 768AD60C5B;
 Mon, 13 May 2024 14:56:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9AE5C113CC;
 Mon, 13 May 2024 14:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715612212;
 bh=rGiCLvhHEh+/H/8ISDwxe5vtFuzZZ3yJUHRruvrM/b4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C4Dpco6PV3nzhhCiahoCIEl1yiz8vAQ1MSCzioNeX85ElySOJmV9/psFYCEABIdId
 ZFkaXDJm9opL3lPaos5t+tgB+OStyf+uPdFUTZoouOvDqCdArh7meQ/1YNwQbmEZ7K
 LfVs3rtL0ARv/EoiIJAEGxtgjzTRtWiLWRVMnufoWUjzxa7hEtmQLwOVuDUwXT8yLL
 Q5b8FpIllFhXrNPHd9Azx/GLL6gQZnocGR0zA2cuoX1GydoiCJ1G0L/wFI4vg5oklc
 zUfoTfn8RmZTJ41dzXjPc+5fdN3Q2ObuOqUx3FD7bN0oOJcz8csDYfjVC/1yLZI+bO
 cVjKEmGeS1TMg==
Date: Mon, 13 May 2024 09:56:50 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>
Cc: mchehab@kernel.org, airlied@gmail.com, mripard@kernel.org,
 devicetree@vger.kernel.org, hverkuil-cisco@xs4all.nl,
 daniel@ffwll.ch, akpm@linux-foundation.org, conor+dt@kernel.org,
 robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, dinguyen@kernel.org,
 chromeos-krk-upstreaming@google.com,
 maarten.lankhorst@linux.intel.com, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, tzimmermann@suse.de
Subject: Re: [PATCH v3 05/10] media: dt-bindings: video-interfaces: Support
 DisplayPort MST
Message-ID: <171561220843.2594407.9178563306645965147.robh@kernel.org>
References: <20240507155413.266057-1-panikiel@google.com>
 <20240507155413.266057-6-panikiel@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240507155413.266057-6-panikiel@google.com>
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


On Tue, 07 May 2024 15:54:08 +0000, Paweł Anikiel wrote:
> Add a DisplayPort bus type and a multi-stream-support property
> indicating whether the interface supports MST.
> 
> Signed-off-by: Paweł Anikiel <panikiel@google.com>
> ---
>  .../devicetree/bindings/media/video-interfaces.yaml        | 7 +++++++
>  include/dt-bindings/media/video-interfaces.h               | 2 ++
>  2 files changed, 9 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

