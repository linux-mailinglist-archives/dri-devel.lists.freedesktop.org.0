Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDCDB22EFA
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 19:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B354510E175;
	Tue, 12 Aug 2025 17:24:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gvBkhfpO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE8F10E175
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 17:24:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3DE4A60054;
 Tue, 12 Aug 2025 17:24:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81C4FC4CEF0;
 Tue, 12 Aug 2025 17:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755019475;
 bh=/L6pHTZDGwWjUrbbeGKfaj6WbdtbKZdcgNz3gJWxUxI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gvBkhfpOx1gelB/+SZkG2pcqXnSitfWlb9r/zPuSk3SOhn43XzPWdBuAqOUQfDX3t
 GayFZOlkV8dZ25W3DHUVrTc2UdNFdO11fGpd65L6PEIGHNepT0gm72FHEPMNGQHIND
 hcbeqYcM9pi8Z6qy+q5dQogCqDJx8AAasdoxfEtvqfVWWG+wPituqhbigv6XshAKrF
 wh1cBJVa/K2wKPHbXabDzJJ2q0qg6PHnj/H7Vyxbinnu4as5jV+yquH6OZLfLKVi6o
 vHtTo60rp+548H3gjqhm5rWkLU1BHfAgI87xfWCjrDVHB72UIsM7wPg5B1xY5jj2wl
 1hMQ5LahxzBpQ==
Message-ID: <85623d31-000c-4ca1-aa2c-2c059534eb99@kernel.org>
Date: Tue, 12 Aug 2025 19:24:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/nouveau: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
To: imre.deak@intel.com
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
References: <20250728101603.243788-1-imre.deak@intel.com>
 <20250728101603.243788-3-imre.deak@intel.com>
 <cab8be18-1cb3-49d8-a967-767174b0dc79@kernel.org>
 <4abed396-5225-4b5c-a538-ced4f4619239@kernel.org>
 <aJt2-wXhhYojy7Hy@ideak-desk>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <aJt2-wXhhYojy7Hy@ideak-desk>
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

On 8/12/25 7:16 PM, Imre Deak wrote:
> The fix is in drm-misc-next-fixes atm and Thomas has sent already
> 
> https://lore.kernel.org/all/20250812064712.GA14554@2a02-2454-fd5e-fd00-2c49-c639-c55f-a125.dyn6.pyur.net

Ok, that's great! (No further action needed AFAIC. :)
