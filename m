Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9160AC1FAE3
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 12:00:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E013C10E25E;
	Thu, 30 Oct 2025 11:00:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PsRJ/+U1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D940F10E25E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 11:00:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3195861537;
 Thu, 30 Oct 2025 11:00:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CA00C4CEF1;
 Thu, 30 Oct 2025 11:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761822031;
 bh=1oZciniMq/1nEPbcRq4nJkzW8DceA+XYQDPnWeVTvnU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PsRJ/+U1Yu8hD3qiqR+jrz7PKA49zpgOUns6JrEUMO02jPYCxChuU5Uzy5+CzJIg/
 C1a1saG692xeKL/ryF32pdYGDZaXzD9fmOJq81j6pkAnflSOMq586DJp3Seb/2rZ8T
 52o8zCtF9vYczTBxqSp1EGi6On3n9GhT+b5Vldlpgps9PGUZv6i3sK6IyhtUsHtBb4
 loA08Y7IG9wY60gyBErJP4ovGuuvZGK2qLcJFsaCVsZW7lIgFrfuyZ9qcLCswppwAa
 kMW7otLJe+e3v+Q6AmPk6h0gpxu5QjdsGzARlvX1CR2uJwDDjtF8YbkK/0SXApKvU9
 UDYV6NdzqYozg==
Message-ID: <f613aa01-447a-4380-b83e-d1b9fb5649b9@kernel.org>
Date: Thu, 30 Oct 2025 12:00:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Add TODO list (+ small docu change)
To: Philipp Stanner <phasta@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20251023143031.149496-2-phasta@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20251023143031.149496-2-phasta@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/23/25 4:30 PM, Philipp Stanner wrote:
> drm_sched has so many problems that we should have our own TODO list for
> contributors who might wanna help.

Looks good,

Acked-by: Danilo Krummrich <dakr@kernel.org>
>  drivers/gpu/drm/scheduler/TODO | 51 ++++++++++++++++++++++++++++++++++

I'd move this into Documentation/, just like we did it for Nova [1].

[1] https://docs.kernel.org/gpu/nova/core/todo.html
