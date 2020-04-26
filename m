Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F09C41B9855
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 09:22:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9229E89F6E;
	Mon, 27 Apr 2020 07:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C446E064;
 Sun, 26 Apr 2020 22:24:49 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id c3so23016950otp.8;
 Sun, 26 Apr 2020 15:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=OBLAv3ala95rLSVXUcIkojndaShuLPu2zPwvFjdEly8=;
 b=cyO2ULobk7znDxC6KxHmNYBOG8F34LOm5QsZQN4riz0cSshLBBxKuzZ8QcmZ5PFors
 PZCraducRpH4ipa9oRdPoj3+4WMVnWIv2Mqwr45riIyJcQijn/Vz5wwBAiE6rCUgVXeK
 8SxsWWOVquMy40TRsWRjM7YrECZYobI/7+7GE0QK5hVpDjBWMaDvBaH8zoXWEYIwC9QQ
 /MXNdWpRiTiVBcBB4LgFlwTy4244jbqnKMH+wruxuOkvRGL/9CG80RC6Gl1W1e8q56AQ
 /+MWUTu6UsG12uqEKz/Vp3F3MTBjUBt4xVKNHsmRoM34khsOWh89IGdVu767Sv++PB/q
 y7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OBLAv3ala95rLSVXUcIkojndaShuLPu2zPwvFjdEly8=;
 b=TPTNFMqUOXbf7PSqUuRAwKcmdvft4zwF0Dnn49KVTKSmJakTkAxH7bP/imiVxK7iaw
 Y94DBhyI6bco2I/z+IlJLh6IhEtmKaEaDpVZKw5j7vE4l3fynuSQ8Bj3206KiZeUl0ld
 /h5SErTeiI73X6QRmZj7Qq11+EbGDboCifmJ3xFAy8rhP4KIbk5WXOZA++KtWFo62Ho3
 or8wlzVKWIoaWGycCtkljsF1v6T2qRRdo9lx02Qu+T5+3tmqYnO7up/EDoPOkbkXfAtq
 UWTcMywYOvkp3RljjN6jxvlQLFnCzpjLNfGMNX5R+j6VwgGWkRwbx+ItO4usKYExmAyh
 wgEg==
X-Gm-Message-State: AGi0PuYPE4VAVcoRt6r/L6NdqPVki24VpYbWmd8DG7uQsj9z49rec1YH
 mIeqiiBsJJnJ5vplXOGnC88=
X-Google-Smtp-Source: APiQypK0w4cqdzOM1cLQvyiHhJBMZlmEVBW9AS4qqoKOjtdRySFx9GQ6g/nVLyX3ojl/dRuIf3YKeA==
X-Received: by 2002:aca:31ce:: with SMTP id
 x197mr14434706oix.157.1587939886194; 
 Sun, 26 Apr 2020 15:24:46 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id h12sm2273441oou.43.2020.04.26.15.24.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 26 Apr 2020 15:24:45 -0700 (PDT)
Date: Sun, 26 Apr 2020 15:24:44 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] drm/i915: re-disable -Wframe-address
Message-ID: <20200426222444.GA24867@ubuntu-s3-xlarge-x86>
References: <20200426214215.139435-1-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200426214215.139435-1-ndesaulniers@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Mon, 27 Apr 2020 07:21:44 +0000
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
Cc: airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Apr 26, 2020 at 02:42:15PM -0700, 'Nick Desaulniers' via Clang Built Linux wrote:
> The top level Makefile disables this warning. When building an
> i386_defconfig with Clang, this warning is triggered a whole bunch via
> includes of headers from perf.
> 
> Link: https://github.com/ClangBuiltLinux/continuous-integration/pull/182
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

This is not technically a clang specific warning but I assume it is only
visible with clang so this location is probably fine.

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
