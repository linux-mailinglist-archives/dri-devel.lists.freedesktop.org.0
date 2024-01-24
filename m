Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BA583AF99
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 18:22:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 941D010F79F;
	Wed, 24 Jan 2024 17:22:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE80910F79F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 17:22:12 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-40e7e2e04f0so62856635e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 09:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706116871; x=1706721671; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4xiz0GcQG54/BySvte8DcHDS1R9W9I7lbxkZQ/Iv5WA=;
 b=uRd+4+2XFr/3r+lfTRnjVKkw3R/wxKvNjOiWy5AWiOTgOi8KrWEAKkqG590vPviFqk
 zTfX+hRB5EWgalFq9x91AEDX2SciScbw/ZGiUy7RP6AEVYxHOooEelK+rx05gYBHc5p1
 xgbp5Go30Ib007i7bmbRq6oZYyK+soeaUN2p47GmPblC12gjG63VG+9rf3PuuUK6BeeT
 vqWvL6CjxbTWtYzQmCeDmzufvPuZbyBbia0zIhK5O1PG0qKRAhRbsIOFvmUqDTV7iDdd
 b08e08QBypS2OEOOTuvRAL6niTFAalgGqpkhAOoxFW7rAMHGQmf58XcDHKTbYO/3GuqM
 eJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706116871; x=1706721671;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4xiz0GcQG54/BySvte8DcHDS1R9W9I7lbxkZQ/Iv5WA=;
 b=Ra9GmcrBREW4EQkNOmVMpVOcNM7PweEOLjjXm/PDdb8O3YQP1Rze26AiLnlzZBfMAH
 bhl3PwL4WeCoifFJocbtoRgiEUOSOjQuOf1bKMswSciLQkqpRKc/WyMZEa652r7PcOaJ
 +e6wVFFIOkZfTRrZTmoYkV+tFzFI1zKVmrq5r2NpLOUMNEYDue5/MvxSU0nAoZ0X+y7j
 yz+u5oHbu9Z3ud6Kgm2txHMmgDJ1ChxDxKLTzocFPFHwC9yMO4qIwrKIO/LSjKl9zE6a
 viplUsBVNOUcs6vstOSbC6ERlUNNmDBZxG93fW0Qp7Va5z4U8ZGm8pi6zhYO5IAOQt13
 aZDA==
X-Gm-Message-State: AOJu0Yyisn4NoahaQVgYvz0Zwu3iUlHXEUlJpwPXEXOFL4A9wxn83i6Q
 40JVL3buDaypYF82UbuqDLPgS9fI8ztSUYH1/C10Hu3P4PN/Y0SX85HqqLeCgV2OU86FCSfWth7
 g9GY=
X-Google-Smtp-Source: AGHT+IGAFW4D80dnsAHiW82tmDEk0cyiMsQBq0972I3W5BOphHDe6lKpbk/KrXx73htiztW7fMICCg==
X-Received: by 2002:a05:600c:3d13:b0:40e:c428:4a6b with SMTP id
 bh19-20020a05600c3d1300b0040ec4284a6bmr889987wmb.13.1706116871447; 
 Wed, 24 Jan 2024 09:21:11 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 w3-20020a05600c474300b0040e549c77a1sm279382wmo.32.2024.01.24.09.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 09:21:10 -0800 (PST)
Date: Wed, 24 Jan 2024 17:21:09 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 2/4] backlight: hx8357: Move OF table closer to its
 consumer
Message-ID: <20240124172109.GA15685@aspen.lan>
References: <20240114152759.1040563-1-andriy.shevchenko@linux.intel.com>
 <20240114152759.1040563-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240114152759.1040563-3-andriy.shevchenko@linux.intel.com>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 14, 2024 at 05:25:09PM +0200, Andy Shevchenko wrote:
> Move OF table near to the user.
>
> While at it, drop comma at terminator entry.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
