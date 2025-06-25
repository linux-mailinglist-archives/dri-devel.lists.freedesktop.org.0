Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A24C5AE8C08
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 20:10:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F27810E236;
	Wed, 25 Jun 2025 18:10:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VJzC0tDu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C111810E236;
 Wed, 25 Jun 2025 18:10:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 020AB61151;
 Wed, 25 Jun 2025 18:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1E11C4CEEA;
 Wed, 25 Jun 2025 18:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750875024;
 bh=lRIi7zZBVZ5uFlzDvsBeIRxNbMyfYf5vmetNeMgd0io=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VJzC0tDuMDU0QYSIeSXIr9FWOR9+qDxLkeFx9nSu5m4cOxnkDjk+thc+EixptgVkl
 GLr6MvhqK5hOvEqP3afxUoMucLVb7w5rZOEjzCs0JmGDVG1Fp74X/XCKAyyU7DNOB1
 PEQXnZ09xhjIX8a0KbFGjBDZXz+WZFIz9D6dpDO4WGefe8TkXkwdinjigkHNUd/bBv
 YEVvakEzA1gmqkVUZugbOLewd5vkTnwGtBIBeI7ZyOVRf2L3gfslQa2aZ1IK8LzhP4
 Ty9LspYyvhpYul9c3U02T5JXPctsfACURjz8Q9/mAqiyWRmkPQ15sereim/pSuvqYz
 K5Edm+NUjHHDg==
Message-ID: <873f6a6b-3f8e-41f8-9434-57d3bb6e71d5@kernel.org>
Date: Wed, 25 Jun 2025 20:10:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/nouveau/disp: Use dev->dev to get the device
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
References: <20250409103344.3661603-1-sakari.ailus@linux.intel.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250409103344.3661603-1-sakari.ailus@linux.intel.com>
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

On 4/9/25 12:33 PM, Sakari Ailus wrote:
> The local variable dev points to drm->dev already, use dev directly.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Applied to drm-misc-next, thanks!
