Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5732998F5F2
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 20:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F417410E8D4;
	Thu,  3 Oct 2024 18:19:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kbTigUZ4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B04D510E8D3;
 Thu,  3 Oct 2024 18:19:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4D7F8A44244;
 Thu,  3 Oct 2024 18:19:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9126AC4CEC5;
 Thu,  3 Oct 2024 18:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727979572;
 bh=SXFcj7fs77zFoeRjfSfHY9vM3EpAM0JyGGpaAutZm6c=;
 h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
 b=kbTigUZ4NuyAdNyryGFJGG0r+yajxK7fRvHKNc4hmwsMkM4PGNtZL1zBfEGHtsYxc
 UGpvqxiM0afsLQhgG0YJtB6MfWrTn9RT5VE7HkNcx3H30Hhvfztzu4po+2zYWV8VEG
 5GnrkhqO5qMRzotzeuxWeFithpIYfcwAQqNQwQBcqWAnYV6VWGp8QdNpr3KsOXss+N
 7dQ9JA8voks+VIIoFq+3tExXLbeZriL0VQjjGwDdbJ3Y1Gp5F+RQWCCx4meDZMG70g
 af52u0KRU5naAOxspxrDug5L5jN2ImCL9IKT+ICu+LPvAnqH2aGiq6cqo7fSSalhWh
 6xDlzlfDk4Dlg==
Message-ID: <60863db7-026b-4554-b628-aa27055f7f03@kernel.org>
Date: Thu, 3 Oct 2024 20:19:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau/i2c: rename aux.c and aux.h to auxch.c and
 auxch.h
To: egyszeregy@freemail.hu
References: <20240603091558.35672-1-egyszeregy@freemail.hu>
From: Danilo Krummrich <dakr@kernel.org>
Cc: bskeggs@nvidia.com, kherbst@redhat.com, lyude@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Language: en-US
In-Reply-To: <20240603091558.35672-1-egyszeregy@freemail.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 6/3/24 11:15 AM, egyszeregy@freemail.hu wrote:
> From: Benjamin Szőke <egyszeregy@freemail.hu>
> 
> The goal is to clean-up Linux repository from AUX file names, because
> the use of such file names is prohibited on other operating systems
> such as Windows, so the Linux repository cannot be cloned and
> edited on them.
> 
> Signed-off-by: Benjamin Szőke <egyszeregy@freemail.hu>

Applied to drm-misc-next, thanks!
