Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B55337D31
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 20:08:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B5A6EB6E;
	Thu, 11 Mar 2021 19:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B796EB6E;
 Thu, 11 Mar 2021 19:08:20 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id v4so204337wrp.13;
 Thu, 11 Mar 2021 11:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pF7No3WYUbj7605JGq0ce6bExxBu7wQzQsniyVdaykE=;
 b=jrCGW3wtz3JEoOCyHp48HGQBuo11adWfWE6zMpDEQlq+Z9wUONC5qYHvLM3mLJma/N
 BtUwQJiGIiAj7EAAKGW4bsoaQYaWhQdeIRa7yU+wB5I9oHnoa2TVW7KtPx5lVlGGljoa
 Wl+YqL8zpZTEFjWFToRux3RGlK7vfpSmKCrrU4d1eb+ewSQiIeiweKtGh0JWmQYVUlik
 nrPYC+75/4LLcQRY8D0+k5OfSjFFtV1gxVJlVciH/7Z3uH/rnw25MZm8avXWe5HhRfNb
 FGXaFpjNRCR+8PDG/AAx/oRc+GQNiTPm5W47/1Bmu9aNDcAu+1jSD3X9sX3aA4tkcybn
 2FSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pF7No3WYUbj7605JGq0ce6bExxBu7wQzQsniyVdaykE=;
 b=Ke4lL7UarZk5fauNIjKJump5BBJsSi4qoYyxYOhP9S18Ugf0QJ2kc/xqO31HsDvoJf
 FN9ofhtVAoGIEZp9ZsRyIDUqgaOCGjE5Mh2KLG4FaWJ6dro10IpWb53R6siXGLw1FdwT
 Ya/YBfmiCcO9TtsRYmKLUiyugmz9FedAvm5LRYmZXtogWs5xFytFQW+rYR6naWBfbl4U
 WU9LPhU/Pv9DFhzls3JLdmT7UEiAwYTJmKQasBL5QwpqMtRHd04AfvObbl20zOWj9Yuw
 lnnE5CnvBPG8SkBnrgmzkA2PWx3iGjp2Qlo0CEklwlg8y2q6WaVBAVi/oLi1OOFUrgcI
 dsAg==
X-Gm-Message-State: AOAM532cHO3BfA+KxdE80b2JUGFNXlCp2nlx6mcHN8F5OxBT4RrW7q9Q
 MRfH5YDrPasXGwvxihFVOSuw5qs5rAFR4/p1iWWms7hm
X-Google-Smtp-Source: ABdhPJzOEuqNJhwSPoy3pJeUYmkxR6DIjNlkdSvUznJcjT/by4rMEkC0+ZMtWqJEgttpmltzNgFX4+FIuvJmDPG2DNs=
X-Received: by 2002:adf:d4ca:: with SMTP id w10mr10673073wrk.146.1615489699365; 
 Thu, 11 Mar 2021 11:08:19 -0800 (PST)
MIME-Version: 1.0
References: <20210310210049.723206-1-jason@jlekstrand.net>
 <87a6raekd7.fsf@keithp.com>
In-Reply-To: <87a6raekd7.fsf@keithp.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 12 Mar 2021 05:08:05 +1000
Message-ID: <CAPM=9tzYJ9ru=SCcm1DW-cRgiPHhFSyK3EZv5Vtg9pZD2UxDWw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] i915: Drop legacy execbuffer support
To: Keith Packard <keithp@keithp.com>
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
Cc: Dave Airlie <airlied@redhat.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 11 Mar 2021 at 08:04, Keith Packard <keithp@keithp.com> wrote:
>
> Jason Ekstrand <jason@jlekstrand.net> writes:
>
> > libdrm has supported the newer execbuffer2 ioctl and using it by default
> > when it exists since libdrm commit b50964027bef249a0cc3d511de05c2464e0a1e22
> > which landed Mar 2, 2010.  The i915 and i965 drivers in Mesa at the time
> > both used libdrm and so did the Intel X11 back-end.  The SNA back-end
> > for X11 has always used execbuffer2.
>
> All execbuffer users in the past that I'm aware of used libdrm, which
> now uses the execbuffer2 ioctl for this API. That means these
> applications will remain ABI compatible through this change.
>
> Acked-by: Keith Packard <keithp@keithp.com>

Acked-by: Dave Airlie <airlied@redhat.com>

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
