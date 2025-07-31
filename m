Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7036DB17353
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 16:40:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D91F810E278;
	Thu, 31 Jul 2025 14:40:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mary.guillemard@collabora.com header.b="Y1EMWTBs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5A410E278
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 14:40:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1753972800; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=mpgJedjTTbKA5zTw9s5O8anV3TF8edFtigNFYw7bLZIcF7epHAqNW3Ou1fPDpZTJE1Y7tz6gIvlrWoZ+apgkSTtFb03uuGIxSEdxb6ee7zrjr+tWX/OzHJLI3V+Xqlgp/WH0DePZ1O845j8Lqj3O5Es4biS9iAD1TN+3Lb+DKPE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1753972800;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=efSJvhMwZRyvDeNpi6g7+/OQmL3XiLYyKZdY9AZH9EI=; 
 b=JnB246F//Tu9LBJ8wgseKmaEzdBAt5VNI7EMg6+M6AZbTPm7aKvLWlTODcodP3I3O8U6xTUVmRETsEcGLw0HCONXOX42/9IfRij+YhcSAFlrUQ3R01SglfdPqZ+e4OOmm5f8CPKqtmVmfn0+zHXtW1hx/AyIaHWDX4OBWou85ic=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mary.guillemard@collabora.com;
 dmarc=pass header.from=<mary.guillemard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753972800; 
 s=zohomail; d=collabora.com; i=mary.guillemard@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:Subject:Subject:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=efSJvhMwZRyvDeNpi6g7+/OQmL3XiLYyKZdY9AZH9EI=;
 b=Y1EMWTBslOFJE8bVyp7taVBn1/QJCHSdh1ahaR7RSv7gGM6O3jouhKwEk4Ruiyhc
 0cddASAegxd0fCG7g2KFwbnBHZXozSJs47A6f8UCA1SYtVhSK+0ypbOtg7lru8F5Ynx
 zDIt5OqK959IS7CdKlpSVmfDa3nAS02MPZ94CTb8=
Received: by mx.zohomail.com with SMTPS id 175397279748996.20746436485967;
 Thu, 31 Jul 2025 07:39:57 -0700 (PDT)
Message-ID: <31a60d0d-5cb4-46f5-afc4-a9e8aba8dead@collabora.com>
Date: Thu, 31 Jul 2025 16:39:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: karunika.choo@arm.com
Cc: airlied@gmail.com, boris.brezillon@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 nd@arm.com, simona@ffwll.ch, steven.price@arm.com, tzimmermann@suse.de
References: <20250724092600.3225493-1-karunika.choo@arm.com>
Subject: Re: [PATCH v7 0/6] Add support for new Mali GPUs
Content-Language: en-US
From: Mary Guillemard <mary.guillemard@collabora.com>
In-Reply-To: <20250724092600.3225493-1-karunika.choo@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Series tested and passing VKCTS on G925-Immortalis.

Tested-by: Mary Guillemard <mary.guillemard@collabora.com>

