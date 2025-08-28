Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD15B3B418
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 09:17:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC7A10EB5B;
	Fri, 29 Aug 2025 07:17:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=manjaro.org header.i=@manjaro.org header.b="gxeyeFyO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A137310E194;
 Thu, 28 Aug 2025 06:39:20 +0000 (UTC)
Message-ID: <ac38020d-313e-40cc-be7b-f77c69cb5634@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1756363158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kbb69Qm3MwS0jgme1lHWlQ9eEDgvWU8URtSpvjipqT0=;
 b=gxeyeFyON1+QgG7hXe1i7ONXrVoH4HtFxpvjR9UzpEip35J6xyQcQkf6EpsSRxn3ax1Rr+
 V15Ma+WB6YyER9vLXqAFiV5TrFnTvOnpaGbtTZ40S5w7YgnZSEzd73hd3SKPWJ3Opfq4vV
 IT0aJ47h8mWD8L9mcRR+1PUzm9jbjMEHfWb0QA4dFypXGbXVAgv7LWI+acXYhbAmkMq0tm
 +NynwnP+CAUTegCSxBbH2ksbm3tQ3D6T/h9rtdqX0GmHQk6QUi1KYVlJZkUc5GG7qVwZ//
 mawSTqnlRcgB5iC1V25fym37De7jsUGzbIQlOhOPRz8yMQS6Hwjm0ad1tZTbXA==
Date: Thu, 28 Aug 2025 08:39:16 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/5] drm: panel-backlight-quirks: Do partial refactor
 and apply OLED fix
To: Mario Limonciello <mario.limonciello@amd.com>,
 Antheas Kapenekakis <lkml@antheas.dev>, amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Robert Beckett <bob.beckett@collabora.com>
References: <20250827174400.3692549-1-lkml@antheas.dev>
 <607d5062-1734-46c4-b851-782bd7ad3ec7@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Philip_M=C3=BCller?= <philm@manjaro.org>
Organization: Manjaro Community
In-Reply-To: <607d5062-1734-46c4-b851-782bd7ad3ec7@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=philm@manjaro.org smtp.mailfrom=philm@manjaro.org
X-Mailman-Approved-At: Fri, 29 Aug 2025 07:17:00 +0000
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

On 8/27/25 20:38, Mario Limonciello wrote:
> Can you double check with Phil?  I thought there are two affected Zotac 
> devices, but I could be wrong.  If we can get both in a single go let's 
> do it.

Yes, the new model is called G1A1W and has the same panel as G0A1W. We 
might still work with the vendor to get a firmware update. However, so 
far we can keep the quirk for that model as well. If needed I could send 
a patch to remove it.

-- 
Best, Philip
