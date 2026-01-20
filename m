Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2E2D3C323
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 10:14:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 067C610E18D;
	Tue, 20 Jan 2026 09:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="2OB6gJfW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35DB10E18D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 09:14:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 624E31A28FD;
 Tue, 20 Jan 2026 09:14:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 32C4B606AB;
 Tue, 20 Jan 2026 09:14:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 424DE10B6B32C; Tue, 20 Jan 2026 10:13:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1768900441; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=AEyibXM1X/4xUK9h1x7As2jj6DIYHxerG8iFPiVejEQ=;
 b=2OB6gJfW18Lv8CNzRs6zVwVr9O1MEQSLLGN1jo3gj4Quv9joeNjU5XWGtmyfCPQXojjdn0
 XGx+RjgH4mV6dhtwCgzFKr3DbxELZspQT/hQhH+ZP4cmqihXEDeE7SYwkNftL6GFZmU1Xx
 D0CPZXhNjtTBrlFlPAOZMX0GTZmGQlDB0ixt/gRdKSbLQ+XKjZQXjXhvBKWqK8brqInHOu
 bz84chp95lT/fn/FAUllRTF9Y1alU+QZooRwXMh7t7mfr+C7s6icnrHwHdF9wkKogaKpHW
 We8IR3JSqhJvCDxifa4J9t1Wpb3zG9g69Bdn/WWQPjmJlXol3xDeR4D6PKWYlg==
Message-ID: <37093fdf-cc26-4bb6-b506-3e959aac8b1e@bootlin.com>
Date: Tue, 20 Jan 2026 10:13:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] mfd: cgbc: Add support for backlight
To: petri.karhula@novatron.fi, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
References: <20251205-cgbc-backlight-v6-0-e4175b0bf406@novatron.fi>
 <20251205-cgbc-backlight-v6-2-e4175b0bf406@novatron.fi>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20251205-cgbc-backlight-v6-2-e4175b0bf406@novatron.fi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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

On 12/5/25 1:19 PM, Petri Karhula via B4 Relay wrote:
> From: Petri Karhula <petri.karhula@novatron.fi>
> 
> The Board Controller has control for display backlight.
> Add backlight cell for the cgbc-backlight driver which
> adds support for backlight brightness control.
> 
Reviewed-by: Thomas Richard <thomas.richard@bootlin.com>

Best Regards,
Thomas
