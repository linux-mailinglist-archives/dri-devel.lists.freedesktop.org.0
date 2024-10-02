Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F2398D3A9
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 14:52:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3BF210E70C;
	Wed,  2 Oct 2024 12:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hl8KVgTC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846E010E70C
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 12:52:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2C082A43BAE;
 Wed,  2 Oct 2024 12:52:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73086C4CEC5;
 Wed,  2 Oct 2024 12:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727873569;
 bh=9BXVLPB5HL/AsiVffyG7sDFN9avsIyuqjYR1AJyxW7M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hl8KVgTClzNo+tWKSp8NuYXy2c0je8FrSMEARnkkUhBf6tGk3zK/3lo89nHIW/Cj7
 BrCEU54Mihj5XdZbk3D1+l4y+RHtBJk7FpGtNzelThC0/vQau86VNvsjqCGExAIyGh
 D53oYInyk+Eis4/U3RuqLF9x6SBsPesOsvqo4ggPSgTwRonv9T/dFmyreO79zuEqzn
 4ze2vmjmIeS/l/FS9pA8C1lgJNTkBTVBHpRWdRYBmQTpYTv47bOsb8O9ktk9TDjfe/
 ovs5EKE3yGKMcdpdlu+D7IXg2xlQsWqSqnC0ucagvRYMP7yg9C/67hwIJP/WpGWHjP
 6AaGq3Ri15xjQ==
Date: Wed, 2 Oct 2024 13:52:43 +0100
From: Lee Jones <lee@kernel.org>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: bentiss@kernel.org, dri-devel@lists.freedesktop.org,
 hdegoede@redhat.com, jelle@vdwaa.nl, jikos@kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
 ojeda@kernel.org, onitake@gmail.com, pavel@ucw.cz, cs@tuxedo.de
Subject: Re: [PATCH v2 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO
Message-ID: <20241002125243.GC7504@google.com>
References: <20240927124152.139099-1-wse@tuxedocomputers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240927124152.139099-1-wse@tuxedocomputers.com>
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

On Fri, 27 Sep 2024, Werner Sembach wrote:

> Hi,
> first revision integrating Armins feedback.
> 
> Stuff I did not yet change and did not comment on previously:
> - Still have to ask Christoffer why the mutex is required
> - Still using acpi_size instad of size_t in the util functions, because the value is put directly into a struct using acpi_size
> - Error messages for __wmi_method_acpi_object_out still in that method because they reference method internal variables
> 
> Let me know if my reasoning is flawed

Use `git format-patch`'s --annotate and --compose next time please.

-- 
Lee Jones [李琼斯]
