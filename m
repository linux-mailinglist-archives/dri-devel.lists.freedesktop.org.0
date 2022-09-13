Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9F75B6C9B
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 13:53:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 595E710E61F;
	Tue, 13 Sep 2022 11:53:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CCC110E61F
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 11:53:35 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id l10so11551393plb.10
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 04:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=rA+h/BpR2nFkON+0DWJYOa3DP8P23l3UE4nsXqW7d/E=;
 b=gYgaQZuWyFno2J3AzFVUmZJmBZHGDJgNwG0ukoLmu/MUWnZIiTxEYglWSzLW+xNb6T
 hfwm3pgZWfKQ6XCURvixBefWd804Q/sJo2k+W1Qs67u2F3v4HD0nr/Hrk8gDkU/Bhj15
 QgQ1/05UFubJ6cwQrBiWxfIxIs/ND0Dy5VOSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=rA+h/BpR2nFkON+0DWJYOa3DP8P23l3UE4nsXqW7d/E=;
 b=hxb61/w9BapgdQNp3d0DuAHqXuUYfzesUz8P0uLdc8C2/RpVRmj6bk9iSf4yyPg3rX
 cVfVPMMh9RA5bbg3kGD8opT1FOhHgKCxfR4gOikSqDvBz+HVmprrkKG0D46nt5hItDm2
 njbWCaLSa6D9xF05jNfRp/ESX5CJQkqdwZFm8/AbsX9ExcyHb1JZ2KLEImWK2WYDhZEm
 gms6rZzpwVFgrLAu2WAvLr9uCv0oKRWdKmItZzKdF0Tj0X6ee+TWo6wRefWjgA6yapWy
 ellgLHrHPKwoRQyC+RHVYTVjXHzLQdA6HPtaQPgivd/MbZBMn/VxRwD34AlfqDaIbCkV
 sY1A==
X-Gm-Message-State: ACgBeo0TIlSGrhfNBbbgDvCCf8ETYCCNCcQaC4iGQeWh1MGydauzxhRh
 u7OXrYzpkhbS42gm3HVUAOgU/w==
X-Google-Smtp-Source: AA6agR4mA6ByPjenr14O1Z9ZsudvP3Y210g2+ULOLhN/Youfcbu0O0unpcdAkkh12zXab3Fp4mXX1Q==
X-Received: by 2002:a17:902:c944:b0:178:4568:9f99 with SMTP id
 i4-20020a170902c94400b0017845689f99mr3607268pla.98.1663070015021; 
 Tue, 13 Sep 2022 04:53:35 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a170902ec8d00b0016dc2366722sm8304208plg.77.2022.09.13.04.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 04:53:33 -0700 (PDT)
Date: Tue, 13 Sep 2022 04:53:32 -0700
From: Kees Cook <keescook@chromium.org>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH v10 2/9] overflow: Move and add few utility macros into
 overflow
Message-ID: <202209130453.5A729A89@keescook>
References: <20220909105913.752049-1-gwan-gyeong.mun@intel.com>
 <20220909105913.752049-3-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909105913.752049-3-gwan-gyeong.mun@intel.com>
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
Cc: thomas.hellstrom@linux.intel.com, mauro.chehab@linux.intel.com,
 andi.shyti@linux.intel.com, jani.nikula@intel.com, ndesaulniers@google.com,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, andrzej.hajda@intel.com, dlatypov@google.com,
 matthew.auld@intel.com, airlied@redhat.com, mchehab@kernel.org,
 vitor@massaru.org, nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 09, 2022 at 07:59:06PM +0900, Gwan-gyeong Mun wrote:
> It moves overflows_type utility macro into overflow header from i915_utils
> header. The overflows_type can be used to catch the truncaion (overflow)
> between different data types. And it adds check_assign() macro which
> performs an assigning source value into destination pointer along with an
> overflow check. overflow_type macro has been improved to handle the
> different data types between source and destination by check_add_overflow
> macro. It also adds check_assign_user_ptr macro which performs an assigning
> source value into destination pointer type variable along with an overflow
> check. If an explicit overflow check is required while assigning,
> check_assign_user_ptr() can be used to assign integers into pointers along
> with an overflow check.
> 
> v3: Add is_type_unsigned() macro (Mauro)
>     Modify overflows_type() macro to consider signed data types (Mauro)
>     Fix the problem that safe_conversion() macro always returns true
> v4: Fix kernel-doc markups
> v6: Move macro addition location so that it can be used by other than drm
>     subsystem (Jani, Mauro, Andi)
>     Change is_type_unsigned to is_unsigned_type to have the same name form
>     as is_signed_type macro
> v8: Add check_assign() and remove safe_conversion() (Kees)
>     Fix overflows_type() to use gcc's built-in overflow function (Andrzej)
>     Add overflows_ptr() to allow overflow checking when assigning a value
>     into a pointer variable (G.G.)
> v9: Fix overflows_type() to use __builtin_add_overflow() instead of
>     __builtin_add_overflow_p() (Andrzej)
>     Fix overflows_ptr() to use overflows_type() with the unsigned long type
>     (Andrzej)
> v10: Remove a redundant type checking for a pointer. (Andrzej)
>      Use updated check_add_overflow macro instead of __builtin_add_overflow
>      (G.G)
>      Add check_assign_user_ptr() macro and drop overflows_ptr() macro(Kees)
> 
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
