Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5244483CAA4
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 19:15:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4640210E5DA;
	Thu, 25 Jan 2024 18:15:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A9DE10E5DA
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 18:15:14 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a27e7b70152so186401166b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 10:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1706206452; x=1706811252; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bn65lRsPHUwSHjihHIHrD2SbxgPSKLlAgwIWNGW/AYU=;
 b=CIZCpGt/ybZ9RM2jinG7/DcmL5Ck4GGggHtJ5KHAKWLz/QG9vZQeKRHV5hdv2fvtoo
 dYHbIKL8xNROqffus0ofYtwJi1gHz2icLsDoEu6BHyfPOZot+6J9fVPsrRKep+eVy4Kx
 QgGYg4Pq8h9XzvV/eqsEaVQ0dL5mCSit1c6lQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706206452; x=1706811252;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bn65lRsPHUwSHjihHIHrD2SbxgPSKLlAgwIWNGW/AYU=;
 b=V6sk1EHiRz1cVGgOGQOh0K8nkDSMCK5NBI6IQiQSzld+ay+eyb0AfYCl8vP3OAei34
 gxY4Vfh7XdzXpAkBBTt3+Y7am2/pbZa7Mk9k3oug+YteQMQeBUOaIIpDPd/fFbqN68vc
 BtZcistBZsJccS3XaQ6biNXkBXWpYh1K9NwpgsgvhJZBzsznuqX+QdKrHZiGh4pJwTFw
 JLVbAP5PdqJZsYE3/+Sa4KbkVx8KT87ZMxhzw25Jx28zAFWJjhQpW2cf7+ylYHxeRp9b
 V90FDpcT7KswWPCcDtEL0m+5USCLZIAx4fl0j17y0CsqjvhYejGrDJVU7gQIj5VwEJpk
 aHgw==
X-Gm-Message-State: AOJu0YyTTI7q4jDmGr0wRGeVuysYIebOkgBVu+5szqOhQ/i/Bytc0vB8
 PvTyIZjUyp8DsjjFSdn9ynwqDHdoF3n2C+4mZpF6VokVxKyvKUhC/Rcr0azez94=
X-Google-Smtp-Source: AGHT+IGDPJFXBsmRgx+FddyHhH5BBAeJMfI+p5NZWXiwxg4w3hyGnwVxYOFQEjGMdgxTi+vOG+ecUA==
X-Received: by 2002:a17:906:5655:b0:a31:1d58:262c with SMTP id
 v21-20020a170906565500b00a311d58262cmr1812927ejr.5.1706206452701; 
 Thu, 25 Jan 2024 10:14:12 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ty15-20020a170907c70f00b00a317f2388cfsm839137ejc.195.2024.01.25.10.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 10:14:12 -0800 (PST)
Date: Thu, 25 Jan 2024 19:14:10 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>
Subject: Re: [PATCH 0/2] kernel-doc: Do not pre-process comments
Message-ID: <ZbKk8v7MHGoYFRuu@phenom.ffwll.local>
References: <20240122093152.22536-1-anna-maria@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240122093152.22536-1-anna-maria@linutronix.de>
X-Operating-System: Linux phenom 6.6.11-amd64 
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
Cc: Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 22, 2024 at 10:31:50AM +0100, Anna-Maria Behnsen wrote:
> Hi,
> 
> this is a repost of the RFC queue
> https://lkml.kernel.org/r/20240116151456.48238-1-anna-maria@linutronix.de
> 
> Jonathan Corbet is fine with this change and mentioned in an answer the
> following:
> 
>   "The kernel-doc change should really go together with the DRM change.
>   I'm happy to carry both with an ack from DRMland or have the kernel-doc
>   patch go through the DRM tree, whichever is easiest."

Agree, that sounds like the simplest merge plan and I don't think we have
anything in-flight for vram helpers that would cause conflicts. For
merging the drm patch through Jon's -doc tree:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> But back to the patchset: Commit 654784284430 ("kernel-doc: bugfix -
> multi-line macros") introduces pre-processing of backslashes at the end of
> a line to not break multi-line macros. This pre-processing is done
> independently if it is inside code or inside a comment.
> 
> This illustation of a hierarchy as a code block inside a kernel-doc comment
> has a backslash at the end of the line:
> 
> ---8<---
> /**
>  * DOC: hierarchy
>  *
>  *                    Top Level
>  *                /               \
>  *         Child A                 Child B
>  */
> ---8<---
> 
> It will be displayed as:
> 
> ---8<---
> 	     Top Level
> 	 /                *        Child A                 Child B
> ---8<---
> 
> 
> As I asked for a solution on the linux-doc mailing list, I got some
> suggestions with workarounds and also got the suggestion by Matthew Wilcox
> to adapt the backslash preprocessing in kernel-doc script. I tested it and
> fixed then the newly produced warnings which are covered in the first
> patch. The processing of the documentation seems to work - but please don't
> rely on my tests as I'm not a perl neither a kernel-doc expert.
> 
> Thanks,
> 
> 	Anna-Maria
> 
> 
> 
> Anna-Maria Behnsen (2):
>   drm/vram-helper: Fix 'multi-line' kernel-doc comments
>   scripts/kernel-doc: Do not process backslash lines in comments
> 
>  drivers/gpu/drm/drm_gem_vram_helper.c | 44 ++++++++++++---------------
>  include/drm/drm_gem_vram_helper.h     | 16 +++++-----
>  scripts/kernel-doc                    |  2 +-
>  3 files changed, 29 insertions(+), 33 deletions(-)
> 
> -- 
> 2.39.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
