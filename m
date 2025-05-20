Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 309DBABDBAD
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 16:14:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AFAF10E604;
	Tue, 20 May 2025 14:14:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hOGo8eDB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB4510E533;
 Tue, 20 May 2025 14:14:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6F72F62A07;
 Tue, 20 May 2025 14:14:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB1DDC4CEE9;
 Tue, 20 May 2025 14:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747750457;
 bh=er5Z9v1gTHlblQ0IFiaXz43wpcJyMEwObalM+JrBQ+4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hOGo8eDBFYN3Jqyj3FUpoKhdtxaJ88v3hAYKddVq6a9xPj7N/EPLUwNimiW1bULhV
 zzS3bD0NvJRjmxd3bA4KkQLRbbG8XVQkcBxnNi/xINhap4m4X1kn80eiBHapK6w6T5
 DRBOnFHvZeRKYV9+WonGg/aJ9sJC/S0WSeEOcNdQ8pkxHXFIKsSVv77pMu2FwJFR6r
 pzHr9qRP7l47V/cJE9R0+gfV3do/1PAEedaCAPJ8besyxGRg8akGTwH4kFQoS/OUTG
 bZ6KUwtA4TP5QtjTpyCGBwINqRGG2PF25VBpFsYI76M8abO+KoJvIg6Ebb1LP8sxnt
 ENFgeVV1im3yw==
Date: Tue, 20 May 2025 10:14:15 -0400
From: Sasha Levin <sashal@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Alexandre Demers <alexandre.f.demers@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, sunil.khatri@amd.com,
 boyuan.zhang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH AUTOSEL 6.14 248/642] drm/amdgpu: add
 dce_v6_0_soft_reset() to DCE6
Message-ID: <aCyONyjgTxvphCPN@lappy>
References: <20250505221419.2672473-1-sashal@kernel.org>
 <20250505221419.2672473-248-sashal@kernel.org>
 <CADnq5_MfAFmbLeg+PAtWaFvY1G29ApTmMKwFq7etT35NvQWXHw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_MfAFmbLeg+PAtWaFvY1G29ApTmMKwFq7etT35NvQWXHw@mail.gmail.com>
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

On Tue, May 06, 2025 at 11:05:15AM -0400, Alex Deucher wrote:
>On Mon, May 5, 2025 at 6:24 PM Sasha Levin <sashal@kernel.org> wrote:
>>
>> From: Alexandre Demers <alexandre.f.demers@gmail.com>
>>
>> [ Upstream commit ab23db6d08efdda5d13d01a66c593d0e57f8917f ]
>>
>> DCE6 was missing soft reset, but it was easily identifiable under radeon.
>> This should be it, pretty much as it is done under DCE8 and DCE10.
>>
>> Signed-off-by: Alexandre Demers <alexandre.f.demers@gmail.com>
>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>
>This is not stable material.

Dropped, thanks!

-- 
Thanks,
Sasha
