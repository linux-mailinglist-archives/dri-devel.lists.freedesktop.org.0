Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01614AB9E44
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 16:10:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5EB610EAD2;
	Fri, 16 May 2025 14:10:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rXhzIQNW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F06010EACE;
 Fri, 16 May 2025 14:10:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 241A161155;
 Fri, 16 May 2025 14:10:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42719C4CEE4;
 Fri, 16 May 2025 14:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747404607;
 bh=79FImyXrY5yy4OZ2rwi96+XD2BI2u0/CBcrb4kwf83E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=rXhzIQNWuX50JNKeVbAxY0ZzkEwk4y52N1KjzcP804KFk6npac13sBu6fcFTOzwfB
 BoYnBoukDou6aiVsol+Dr8wTfOly1WWkRy6GlfUHv1mYZwbZ1FeIpLezA8zarVShQP
 3rNfz15Z3WmV0lxfhWcBNhvDC7deWaTF8h45AezOLvnucrdI625t9LOrZD3VfE7Xmu
 JvzJbOAJUZ3RFiSejBLxfgGuanRBROofjZlpyYaEr1j+CqghPjfyY+xju+Ipb89nik
 mb6+WBNJ9WgUkjIXCyh7/BLzwSx8PwkDlbVTUtRMb3VluZhgSQaAHlU9eB6uaweRND
 p1xLlcCgAt5VA==
Message-ID: <c7c321a6-18ec-43da-bf7b-bb545af08cc9@kernel.org>
Date: Fri, 16 May 2025 16:10:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau/dp: convert to use ERR_CAST()
To: zhang.enpei@zte.com.cn
Cc: lyude@redhat.com, airlied@gmail.com, simona@ffwll.ch, airlied@redhat.com, 
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250515201108576jof-gkjSxRfMaGDgKo-pc@zte.com.cn>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250515201108576jof-gkjSxRfMaGDgKo-pc@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/15/25 2:11 PM, zhang.enpei@zte.com.cn wrote:
> From: Zhang Enpei <zhang.enpei@zte.com.cn>
> As opposed to open-code, use ERR_CAST to clearly indicate that this is a
> pointer to an error value and a type conversion is performed.

Applied to drm-misc-next, thanks!
