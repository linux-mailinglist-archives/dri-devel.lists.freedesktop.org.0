Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53451AAF661
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 11:11:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B8F10E370;
	Thu,  8 May 2025 09:11:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="c+zMXYPz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6269010E370
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 09:11:14 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-6f54e4f2989so7560306d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 May 2025 02:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1746695473; x=1747300273;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=R/KnCgLEH1i4D71Srw4baGTHNIy8kR35e86GFY54Goo=;
 b=c+zMXYPz2GYl19tFOQiX/rm5q9gJLCRsboaPmr4ZvSUzVeV6E//+uEvW4xmTulZu6a
 hhY7PtTfJJhsrCHyvfS4EJiIaueCdGm7xC0AsBppzTnQ55oR6Fn9nWdVEjQhb8OvUXV0
 olnfZt8Qq/WwNc9QGz3iRc03oP7nKSWqTDGyv+cotJjGpp/Vq3XlzrTREiQ8ahsbQp2o
 5TgzpC0p4pZsmU7ne2KZwGKoylooBNmgoMfu4NNgr0cODRVe0y5Hg4Fhsai4p8aor/ZY
 Dq32dKcIsY/1tJxUL82AoCoKwih00aer6TlaWpcGfzWQeq7derndXPhkmVEHzWqD6pod
 PFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746695473; x=1747300273;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R/KnCgLEH1i4D71Srw4baGTHNIy8kR35e86GFY54Goo=;
 b=Njb1AOAs2bVg5f1/IO81rGBfKWlOBPbL7Ff9o0DZ/uiO1aCakNyMv+WbaIqBtDp6W2
 8br4KMTaqlZvaeBzFzyF0kvXiterhwORtPc6chlMb/54ekNF+I3or13pfiliLknoSRFb
 vgX7wRkuO5bRX3f8X2YvL8a9Fm75wkUOJDZyealG2ult1oCw67AsD+vFQHxTOANHJEXk
 fZhrFvH4A9XQHe5o2i5wneZRnEnDduzNJSx4i+KgBRrkG2/VxCoK+Hx1HxclZIhhfk06
 LDPiDx9vnD9vwIuG8xBmnm1XyxtX5wgE0rd3j3DIMub71iEDT07BSMSpqrjeHaaNaMMy
 qgmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXG7MvUL8CLCb3rBL48+dnXELQnDiL1YZWBTcQvLWoVBJ7YSe/FIxZ0ok6ZR+yUBwcsNmhOO+QF2os=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywy6Yi5PBvnB9XbfM80qN3pDe6tjuPe2+fItSL6qGzHgDsX0aTi
 yGoyL5UqY50n0CwYYvTN+6aYoMtpOzPYq+LC6NFOTCXjKLiKoIIcooWXI43lZRrVlZQjkktqEtT
 iI+uW7smQtDbQaau0DURa1Ig64k36LQhdJ888pw==
X-Gm-Gg: ASbGnctRyU9aUeFx8NPuEOTQQV+9lIz99DEFAuZTQhfVshXrRM9orbVw1t1TomqWvaU
 UIsMsoWXaowbtmZqVjg4qqIJg3HHpS9jXGi6uUoRlIHvBM14oHeFB+Sdxkg7TlkXP0ZUqyzAUua
 wRC/IklkL6kKKTY8vCXE2LrzzfZR/ROilF
X-Google-Smtp-Source: AGHT+IG9krRjL8m6Nqh8vBxq10hmKPFSkTpU7prTYgzI5+0oR0UHRvJLVw5g47iLQx4N0PZMh49KSVcmraCObtRcUSI=
X-Received: by 2002:a05:6214:202c:b0:6e8:87bd:386e with SMTP id
 6a1803df08f44-6f542aa2f5emr102817566d6.33.1746695473355; Thu, 08 May 2025
 02:11:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250508084811.2472877-1-andyshrk@163.com>
In-Reply-To: <20250508084811.2472877-1-andyshrk@163.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 8 May 2025 12:11:01 +0300
X-Gm-Features: ATxdqUHI1TGK36gxgW3UTwFXlSUt0qN82uLoLuKNGHhJOVQj4yUNPKBYA-FhmgM
Message-ID: <CAPj87rMJgJaj8p_2DLdM8p3phB+eQnMm7iAHgEe_R8sjuGox1w@mail.gmail.com>
Subject: Re: [PATCH] drm/gem-framebuffer: log errors when gem size < afbc_size
To: Andy Yan <andyshrk@163.com>
Cc: tzimmermann@suse.de, simona@ffwll.ch, mripard@kernel.org, 
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

Hi Andy,

On Thu, 8 May 2025 at 11:49, Andy Yan <andyshrk@163.com> wrote:
> Let the user know what went wrong in drm_gem_fb_afbc_init
> failure paths.

Thanks for this, and thanks also for using drm_dbg_kms() to make sure
that userspace can't flood the log with errors.

Reviewed-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel
