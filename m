Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4EC8A823A
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 13:39:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 514B110F4AF;
	Wed, 17 Apr 2024 11:39:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UsiIz0Pm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF30C10F4AF
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 11:39:29 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-dcc7cdb3a98so5279075276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 04:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713353968; x=1713958768; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ioj9DnkX+ObVSDL6/fpvkdjT0u8OzlkNnV61k9vgk3c=;
 b=UsiIz0PmROdD7qQW17B53b/fLefJSU6IYwqp9c8CM90M6Ez4uRTJHIwT85YZWLAEmt
 k5DvkY7kv5+qNgdFaqwL1X2M1CtI64bK/wAgXOpi5rN9HTMky3WJsu32Vdfroe4b0pWa
 2dAtqj2v2rjzmpUS9hb4ui0Ic3N1fmeuCvcLBe2O2izvnv+qvDPK/Fil0n7hDJx0PGk6
 h8i46MyCyX1Y3WxvYAmhQSsjjVu5raV3sW/7uC0qHhvKgE1ZJjOLXuFnDNKBE97Npig4
 OzIC6VmphYgIjm66+yNHFs/jINfXjQltgbrhBIXQ4CdvDmZm4OYvrVraiEsD0MctrHMO
 17lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713353968; x=1713958768;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ioj9DnkX+ObVSDL6/fpvkdjT0u8OzlkNnV61k9vgk3c=;
 b=E5/gY5PdazOr2SVBsP0JfaxA3w5wlwSt/7DenqeznEkESWpFPid4vFbxkXAAnvKoET
 NBI8GKYBpeGQUyqI9HXDLHk6o7z5LlktR46uqLy4OgJ2mEYZJZmmg4tqBCMJ9DjLoa4E
 BD+/A63KPpwhfyO95AVlcwmOSL0/cyGFm2Hlg1YIVNCOJnV+2XChVj5mCgnK1CkU1Afn
 kqrDqLc5y4XcLaRzwtjG6EkC6vJTYsXIUXxx+EYQpIDozfiAiNFwYfQamIi0q7lEFhpF
 Rit/hZVxa1ywb7s5aj9NSNFNZzTVt8Bh4sY4+x2/Mw/idowf42JoQzLJdzK7W5k5cPw7
 DWxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhSdiKYKAQAGupYG0K8imwLmEB4KbFCTCMg6wC0Ozg7GS31T49utyRlcdij8L178HMpo7kRNqN4t0I4wRaCs2r1mSdoKJL8d/vCiAF996S
X-Gm-Message-State: AOJu0Ywc9egNTSZLw+1lIfrXOlo9Qeky+8IZfKOtAsiIx87uO0hiVOIb
 sG2UY2jNrrNVs84V821MgenoS8uHD0aQH1bV/tnUcJxGV6D5uM9UbWw+g6TqoKYhDPQaHicUq81
 /qctPVtIaK91WhE8Ow54wfYeKG8oQxoJq+SHaNA==
X-Google-Smtp-Source: AGHT+IGto7S93HRGORyq0GvXIhVAp6wm5zMdY16fzYtx/hb1OWYbqCpxV9/Z5ojkl/ieoD41Fqkg4zQQmmhDYZoEYzI=
X-Received: by 2002:a25:ef51:0:b0:dcf:f9bd:fe05 with SMTP id
 w17-20020a25ef51000000b00dcff9bdfe05mr16431807ybm.48.1713353968629; Wed, 17
 Apr 2024 04:39:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240417-component-dummy-v1-1-b0854665c760@herrie.org>
In-Reply-To: <20240417-component-dummy-v1-1-b0854665c760@herrie.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 17 Apr 2024 13:39:16 +0200
Message-ID: <CACRpkdbijfwYFhg2XigzVKoPDjU00K+arqaL_kP3FNxsS82gHg@mail.gmail.com>
Subject: Re: [PATCH] component: Support masters with no subcomponents
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Hi Herman,

thanks for your patch!

Do you actually have this working on real hardware? I never
submitted this patch because I could not get the hardware
working.

I was hoping for smarter people (Dmitry Baryshkov...) to step
in and help out to actually make it work before submitting
patches.

Yours,
Linus Walleij
