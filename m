Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BBAA4F88A
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 09:17:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE1D10E2B5;
	Wed,  5 Mar 2025 08:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XSQ3cRVN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D9AB10E2B5
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 08:17:40 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-6f77b9e0a34so52094797b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Mar 2025 00:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741162659; x=1741767459; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=unUXlRhpi9sFgYovBXVYDRg89FpRhkYUYq8VvpQ6o9I=;
 b=XSQ3cRVNY0WN2W+GAm3UtdvWQcKFZJXGhpWZIHyKYPsYg9/nc0XZhQ3XAxObT//wd1
 jBRYRSYBQBEWEXo1oSzkjxl0PmlofwxoifcD0V8++dnig30DNBxCPxC+TwJ42sAcJTpX
 tWxoPSf0twqmfxgd107XlF7dOxL98uBRyRx406h1cJcaxhYqMeXHuiLULf5w2Po9D1D1
 q7fclCx0mcUo1NyPDeENxxR452iS4JRVhW8EmjkqHERfDSAU8FzE9wN+twJtedBQTCDt
 VJ/yZeZLg9b2WuhhFI9qCi4Xi1x7OckiLY8L5KZJmit6oiKWT/MuWHgF7Qu7Eq5PmNGC
 t4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741162659; x=1741767459;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=unUXlRhpi9sFgYovBXVYDRg89FpRhkYUYq8VvpQ6o9I=;
 b=bvZluzPEFRVog7u3KGc6eEFIcYptJdQdXmIErLsx3fmAfao/TRNjUrHrb99cjktL0M
 YyMB717/aj/bCD87HM4Jtyzrz3XB8eeKTlvHLDSPXFE4BAX4MD/9MMUuUmrOkUQfhyiw
 hnMrx05Bwwgk47WBoBxFNXv+DSgBN1e+sleIMvYQuR71gLjXa9m420r9PnFwpDDJVwc2
 h/YRq1MaExGAowUwv6n5V3aCb9o+KCUn+Iw0fT74ECfmgZBDUNlj4zxthWeYoN+pYE3M
 hwSZtDAsdkAHgCpOqhNo+7Uimd+qi4WDJ07u4SUHpOwFqb0Y+pTfM6RogTCUPWTSmgWI
 Y6BA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtEHeGdBcK/3WJIa9qAIPsoUNP5tPS0EXsISk/FeQAZcf/tstnTN8TR/Xl4sC6hYRDsWAMyv/KZz4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBVhFD03PS0KVef2V/PZL/rIELDi747P+z8TyAkBClDIod+u7P
 Jkb5wc496uzBnaQxeowwyqQOGGXdRv8SLdxwjD99YmKUMelNA1gtK0fSH2FcJlfOSv4tpYFOZzO
 U2GO5lRcnFOJHxGo4jNwBOI4Irwg=
X-Gm-Gg: ASbGncv0mUy1zfJTzO+H1GDrmXp/RjytqysT0Cnr9j5yyx2BD4Gp10p/sVw8d+ANfwI
 ZX7wPHmVoeo+SkF654cWptQkvAxvUfTr7S/6tvdJ7kpzAQigKuZEBmmulj24VVUoZUo4abTk5qc
 9dJ07bNwWpWEM1qhCLyEpPpLQfpUY=
X-Google-Smtp-Source: AGHT+IFH8tbkdolKMFQTBXwdPnhgEhIHcppznLYb0q6wu6PUrmMI5mnzlfbW6CZYpCojAT11BsO0ndoY1bNLhWNtILw=
X-Received: by 2002:a05:690c:7307:b0:6fd:4670:80c6 with SMTP id
 00721157ae682-6fda30fa282mr29688317b3.37.1741162659401; Wed, 05 Mar 2025
 00:17:39 -0800 (PST)
MIME-Version: 1.0
References: <20250305020546.96564-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20250305020546.96564-1-jiapeng.chong@linux.alibaba.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 5 Mar 2025 09:17:28 +0100
X-Gm-Features: AQ5f1JpOTyDvXY3v1-JU3GbIR7BXMVjAHB0DwpN4ZcbevKt7RS7qwVJSQh96pnE
Message-ID: <CAMT+MTRvuYGqfNEO-uHK7zcDWR1z=iMJ2kmK_-cQ+i3i1=7jaA@mail.gmail.com>
Subject: Re: [PATCH -next] drm: adp: Remove unnecessary print function
 dev_err()
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: j@jannau.net, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 5 Mar 2025 at 03:06, Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> The print function dev_err() is redundant because platform_get_irq_byname()
> already prints an error.

Acked-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
