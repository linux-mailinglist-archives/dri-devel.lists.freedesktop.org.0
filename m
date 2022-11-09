Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E85623324
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 20:07:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8EE010E61F;
	Wed,  9 Nov 2022 19:07:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A5610E61F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 19:07:13 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id gw22so17597731pjb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Nov 2022 11:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NDep2xTzg7wJbNApQgTgABbwuzhQVUJykl8RQQiftq8=;
 b=BQurSsH56mFh2n1DAucFH0nGFBvGEABBjFzDpVdbF0OUEZHWDAvOsP/G7pxv4eNCWV
 4ajW80cdG/w53j8mTfQm4FDh0XZbRCoYls82xs7G06Or27jBFk5MFV0DRFcT7S/BCshB
 BZ1LMHiue+xtdCc1aftQEQ0M+T9Xseto7C6zs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NDep2xTzg7wJbNApQgTgABbwuzhQVUJykl8RQQiftq8=;
 b=8B+66k7V27OWJE+jOoVq7RmM27OpiOE8qe3rMxqpm7T4FKWBOzatRDZs40XQovgyYH
 uUyV2sJ81NOfOYF0rhOaF3OkUHn2xFbD3tw8WdnMmEdAGPcljRW5GrmEN0cgxd8HBstr
 lS7LQLQfmK0zGbwaugk38UF/K5plShSet3hhl/I3d6pQJqpTY7do2bdSnowmvaXMwHzV
 lWN4lMDxEIZCadb8eAYJidhVqxsfxkPC4Jcn6FThIeKpkKcJsISWOh1THoV1tlL2PWMU
 WF+tj2LrjL0CItv3pzHFPqoR6yIP3UbTFrXHDSfYCiH5pS3pcF9RGOSrVu+CVliKYbtW
 141w==
X-Gm-Message-State: ACrzQf1/QYFZcZeazL8+z4Uh3uNNHVJFklw26dxQP/Trr6F6YwK9jEnH
 n/vzelsONs57N5Zqv/mtf4n8og==
X-Google-Smtp-Source: AMsMyM5Qi9RKSjqi1EKSmHYh0kIPGrBEi36sEsIueAMb3yZymjHoIKLfM6YnRCyWT4Bfo5AfhQSrPw==
X-Received: by 2002:a17:90b:3d8e:b0:213:c01:b8bb with SMTP id
 pq14-20020a17090b3d8e00b002130c01b8bbmr63663963pjb.68.1668020833460; 
 Wed, 09 Nov 2022 11:07:13 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 w11-20020a17090a8a0b00b001faf7a88138sm1546027pjn.42.2022.11.09.11.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 11:07:12 -0800 (PST)
Date: Wed, 9 Nov 2022 11:07:12 -0800
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v2] drm: xlnx: Fix return type of
 zynqmp_dp_bridge_mode_valid
Message-ID: <202211091107.718BF1BE89@keescook>
References: <20221109001424.1422495-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221109001424.1422495-1-nathan@kernel.org>
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
Cc: Dan Carpenter <error27@gmail.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, patches@lists.linux.dev,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sami Tolvanen <samitolvanen@google.com>, Nathan Huckleberry <nhuck@google.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 08, 2022 at 05:14:25PM -0700, Nathan Chancellor wrote:
> From: Nathan Huckleberry <nhuck@google.com>
> 
> The mode_valid field in drm_bridge_helper_funcs is expected to be of
> type
> enum drm_mode_status (* mode_valid) (struct drm_bridge *bridge,
>                                      struct drm_display_mode *mode);
> 
> The mismatched return type breaks forward edge kCFI since the underlying
> function definition does not match the function hook definition. A new
> warning in clang will catch this at compile time:
> 
>   drivers/gpu/drm/xlnx/zynqmp_dp.c:1573:16: error: incompatible function pointer types initializing 'enum drm_mode_status (*)(struct drm_bridge *, const struct drm_display_info *, const struct drm_display_mode *)' with an expression of type 'int (struct drm_bridge *, const struct drm_display_info *, const struct drm_display_mode *)' [-Werror,-Wincompatible-function-pointer-types-strict]
>           .mode_valid = zynqmp_dp_bridge_mode_valid,
>                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>   1 error generated.
> 
> The return type of zynqmp_dp_bridge_mode_valid should be changed from
> int to enum drm_mode_status.
> 
> Reported-by: Dan Carpenter <error27@gmail.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1703
> Link: https://github.com/ClangBuiltLinux/linux/issues/1750
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
