Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 524123D9633
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 21:53:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1D26E887;
	Wed, 28 Jul 2021 19:53:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C9036E0F5
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 18:56:00 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id x7so82569ilh.10
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 11:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=pg9Oc8FexJdwg++WGxFIyzfbO7HtZXQu4+lhfbZZJSA=;
 b=SmUnU1tPVN9i/9tG/rMNoyq8GC2Ca9VXG2fndr5Q7lbUN7q2OvL7b3A8tyIlk4aRZO
 8CxuepNlFVgtbqoM3ADQ3U0+DYSTh4XKY1ShBRwP2xptYX4NzEjxotT52leIbd5xNRXk
 9vOonTxqSQqQW8naRs/ta+UU9thoYqHRLs8DxUAFrNPA0djreJxetA6MW8BtY4WeIUIW
 dOTRz3L5cqS+wmNpuKdYDrs8Y7JxgzfS82zfkL2T7J9e0mh4UxOrd8m2b0kxlUw+Ng/I
 ath2ZAyFnQXTEeGUJcV4oPxvcRcr2dsP1ecLOrYEwKb4egINVvb+Xoa2A3ZtaP1NLjlz
 iCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=pg9Oc8FexJdwg++WGxFIyzfbO7HtZXQu4+lhfbZZJSA=;
 b=JpUMI8fSpBrehLE3EZzLaBgTKlNVwT6DrNHpO5dx+KbEN0wykv17iTkDY80z/MNbnG
 6D3PFeD96z10iS9XfcyeTWcMt080JXMp93/IDeMafEhRYnxlpy54CyNGrM6OZv0i97Iv
 tzq5iSkSST+MW2Fbok9ovI9Ab5dN+azOhvvcBG0RTFNa049C5Zg14u/JtpimjezyO21l
 tCSe38+qfYQXvk6w6DnmUjp0DJW2lmVzDs3MCZPl82tszp3mwKaV/S/raPXSaWCfbm15
 q86A1g2R6PmoFg7pSwor8wrf82unKs6qRqgD5cRGXQtg0O75aRSQvaQ7gHIgnatV/IFB
 vDoA==
X-Gm-Message-State: AOAM533kOf+RgiOK35H6VFcxVwnTjQ+PhrIsNmExMqIGjZ6QRCgCMHsL
 vusWdZHQ0YSerEkGn95+2ogKymJZJXgwbeFCDNs=
X-Google-Smtp-Source: ABdhPJzdp7XedqkKalo1YzTM6wrHzAyIyMCWMFfqhgcBbZM/+eDvInL7H0YNQ6mczgM/TVmUc+xtfPhLFrpBLGI8h4k=
X-Received: by 2002:a05:6e02:dcd:: with SMTP id
 l13mr851205ilj.300.1627498559514; 
 Wed, 28 Jul 2021 11:55:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6e04:29b:0:0:0:0 with HTTP; Wed, 28 Jul 2021 11:55:58
 -0700 (PDT)
In-Reply-To: <20210727205855.411487-16-keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-16-keescook@chromium.org>
From: Stanislav Yakovlev <stas.yakovlev@gmail.com>
Date: Wed, 28 Jul 2021 22:55:58 +0400
Message-ID: <CA++WF2M464stM5Cb8EpX+ecda5yymSZ0Z8PFPFEoqZ_iFhaScQ@mail.gmail.com>
Subject: Re: [PATCH 15/64] ipw2x00: Use struct_group() for memcpy() region
To: Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 28 Jul 2021 19:53:08 +0000
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
Cc: linux-kbuild@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-block@vger.kernel.org, clang-built-linux@googlegroups.com,
 Keith Packard <keithpac@amazon.com>, linux-hardening@vger.kernel.org,
 netdev@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/07/2021, Kees Cook <keescook@chromium.org> wrote:
> In preparation for FORTIFY_SOURCE performing compile-time and run-time
> field array bounds checking for memcpy(), memmove(), and memset(),
> avoid intentionally writing across neighboring fields.
>
> Use struct_group() in struct libipw_qos_information_element around
> members qui, qui_type, qui_subtype, version, and ac_info, so they can be
> referenced together. This will allow memcpy() and sizeof() to more easily
> reason about sizes, improve readability, and avoid future warnings about
> writing beyond the end of qui.
>
> "pahole" shows no size nor member offset changes to struct
> libipw_qos_information_element.
>
> Additionally corrects the size in libipw_read_qos_param_element() as
> it was testing the wrong structure size (it should have been struct
> libipw_qos_information_element, not struct libipw_qos_parameter_info).
>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  drivers/net/wireless/intel/ipw2x00/libipw.h    | 12 +++++++-----
>  drivers/net/wireless/intel/ipw2x00/libipw_rx.c |  8 ++++----
>  2 files changed, 11 insertions(+), 9 deletions(-)
>

Acked-by: Stanislav Yakovlev <stas.yakovlev@gmail.com>

Looks fine, thanks!

Stanislav.
