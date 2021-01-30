Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F52309BAC
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jan 2021 12:43:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD8D6E283;
	Sun, 31 Jan 2021 11:43:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F7F6E077;
 Sat, 30 Jan 2021 12:34:13 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id l4so11037770ilo.11;
 Sat, 30 Jan 2021 04:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=C7cDNKTuTgw0I2CTtx3BBJ3BTnHf7w/oYJgbFlp2Ulg=;
 b=JkmqbLLymBqsef5mgjuVS6CDvWa2Mm/XH6Xnmt5dLFtMJleyERnRaKfghpQNn+AX10
 riQKW8xGp/K0cyTqJE0qAZ4bvDsdJhKMatByqDYmSTGDqK4UNCUroPDDvA66VW78MWFv
 dXewsHBwtdMozL+u4dSDr6AhcA1KGrGFFf4rptz+Ovitbkd6GHnJeLcMFOZUM49ZY6kC
 fABj9WQf62QDk5XSqgWZquWfKMt0TsLmPIbFYIPorTEHTF2J1cgO7WSppOjSbdFWd1Ds
 Yu8n3Xe/d89xWKCc/muWuYlH3RVAZUtN9/mZZ9juYTZM+7DrVw/9uVqbL9bh5CIGgmqy
 bUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=C7cDNKTuTgw0I2CTtx3BBJ3BTnHf7w/oYJgbFlp2Ulg=;
 b=C3C1cnIJvPx7zTRGF3Vryn4+Gt1MIm9IPZzBNXU8Iq2elf+itjpvnBrV0hADTkM96N
 b6EHb/jBliVTJ3Wyij8EvaCWubhcxaoEmij8rf7IhJ66pur8hwYrzFAtRqwzSApraQGX
 t6RQEneNc7LAAqhwO4D9MUXPcXCM+01oyG355d8pTsKOl2JPjehCQEZHWPVS7YI4TOCM
 S7TN++DUlNQ356f0MKFklkckllrX/PplNvh3Ewz/wkRIEqYxrtF0ZC7xN6VOwhpuzFEq
 e7tbTd/AWcFxXeR27iHr3X0TbHJ2XywIXPY89TI/B79lSXyAnT4hI1exiMvRoC71yo/h
 BUdA==
X-Gm-Message-State: AOAM533kKya+EE/V9FvkjQDMZoLGa0Y9NoQD9JzTgsv6nQxXdFs/WC32
 ns3zSuRKIpkHLDJ0SHJbf8U=
X-Google-Smtp-Source: ABdhPJwID2N6KgHnIJzTKMZEvKcXG9pTq70AIKv0+BheRu3F0l+nTV4cYYZad+1hF+fNd+c252xBag==
X-Received: by 2002:a05:6e02:1a2d:: with SMTP id
 g13mr6528684ile.228.1612010053300; 
 Sat, 30 Jan 2021 04:34:13 -0800 (PST)
Received: from llvm-development.us-central1-a.c.llvm-285123.internal
 (92.190.192.35.bc.googleusercontent.com. [35.192.190.92])
 by smtp.gmail.com with ESMTPSA id 11sm5781105ilq.88.2021.01.30.04.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 04:34:12 -0800 (PST)
Date: Sat, 30 Jan 2021 12:34:11 +0000
From: Vinicius Tinti <viniciustinti@gmail.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] drm/i915: Remove unreachable code
Message-ID: <20210130123411.GB1822@llvm-development.us-central1-a.c.llvm-285123.internal>
References: <20210129181519.69963-1-viniciustinti@gmail.com>
 <161195375417.17568.2762721732398065240@build.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <161195375417.17568.2762721732398065240@build.alporthouse.com>
X-Mailman-Approved-At: Sun, 31 Jan 2021 11:43:06 +0000
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
Cc: intel-gfx@lists.freedesktop.org, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 29, 2021 at 08:55:54PM +0000, Chris Wilson wrote:
> Quoting Vinicius Tinti (2021-01-29 18:15:19)
> > By enabling -Wunreachable-code-aggressive on Clang the following code
> > paths are unreachable.
> 
> That code exists as commentary and, especially for sdvo, library
> functions that we may need in future.

I would argue that this code could be removed since it is in git history.
It can be restored when needed.

This will make the code cleaner.

> The ivb-gt1 case => as we now set the gt level for ivb, should we not
> enable the optimisation for ivb unaffected by the w/a? Just no one has
> taken the time to see if it causes a regression.

I don't know. I just found out that the code is unreachable.

> For error state, the question remains whether we should revert to
> uncompressed data if the compressed stream is larger than the original.

I don't know too.

In this last two cases the code could be commented and the decisions
and problems explained in the comment section.

> -Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
