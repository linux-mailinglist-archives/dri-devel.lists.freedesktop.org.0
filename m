Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD106A473A
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 17:43:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC5C10E1D7;
	Mon, 27 Feb 2023 16:43:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE0F510E1D7
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 16:43:23 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id o12so28287058edb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 08:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hOx+Lx5LmOM09OgXmzxi2LsSdJoGdR3sG6KvTTKaATI=;
 b=a61a7/DIAAPoyHbNLVSSkFweYQQ4MX8oFnrHkdCNCK7SeU6uXbWiPIOV9bgUYjenA/
 kMVBmoaYu1LsJ5/23nPcQcIhTkf01ItUnU5JaCJKnTOS3Z9xr7PUJhG8fbIfKHZhqrHV
 s5qpSFd313YTbTjKE+ND3h+mOFTN8BZLCrr1Tn9xcJH6KtGuKWWycpmvVkOUxfkVBaKl
 LIPhKrAVu23deiKatwAAyO85ezC5JsYihXUKwVdBfADJuyLUAijTk6+WxgSxEbyUa8xi
 UJOZlnyFR3lUl03PwmlPlqFA/+m1R8ou5Nf2WY7NB9cYeFoT5rD1GG+nHXmI1erHYMCL
 cFpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hOx+Lx5LmOM09OgXmzxi2LsSdJoGdR3sG6KvTTKaATI=;
 b=CO0tPv0DnZd+V5U/hJNmWjVL6gA9fhpgAqZ6CH38XH408X6cyBpyC9jKzeLyGREPV+
 nlprAEaOoOnwZ1zFoqKU8HtXgKWtuGcIcD75jrIKLSLIe84DSOaLuGTeOeDEaz/u22xl
 emiH/N+LsIIjU4SK5IJrbLuAcnj3dTGYHjaGZNdrb1kmQQfvYHXEgf1H5t6dJ0Uvhmtn
 rt8hdoOsKyWpm74Fwm+W7ftlVaH6XWBAcprNGbm+efcQN9sWxl0AY9ccqBIE37yJWtHj
 CHpTClum8ZnQ5U+h8skqyLXArgiA1xLQxDF+mcITJSTOoI+QqDwooQ3QdZ+R0WRuiVhJ
 olmQ==
X-Gm-Message-State: AO0yUKX7qDXgEnh75o+oqbQARlr0MtBIiiPcYw1+dLyQUecGKi3FIYaq
 eV+d5mGQupVA1IGNdpOkeUXFPnrmOetQJmH2yp0=
X-Google-Smtp-Source: AK7set/MGVEvrtdD63U/g8sFifLNquXgtczaePn8Jsk7sX8vclGD49tHR3zYDQOWmugjaLuMvvH6hC5cijEoGC+SrYA=
X-Received: by 2002:a17:906:3a58:b0:8b1:78b8:4207 with SMTP id
 a24-20020a1709063a5800b008b178b84207mr1239508ejf.3.1677516202115; Mon, 27 Feb
 2023 08:43:22 -0800 (PST)
MIME-Version: 1.0
References: <7799513f0fb5aee27b64752c037980471be669c5.1677120686.git.self@dylanle.dev>
 <Y/bqtlbnWkKMIJI4@debian.me>
In-Reply-To: <Y/bqtlbnWkKMIJI4@debian.me>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Mon, 27 Feb 2023 09:43:11 -0700
Message-ID: <CAOCk7NrAKZ2G-VbQW3MJUZmkKkO1Ccrs2wo12kg6QHysH-d=Yg@mail.gmail.com>
Subject: Re: [PATCH] Documentation: gpu: add acceleration node section
To: Bagas Sanjaya <bagasdotme@gmail.com>, ogabbay@kernel.org
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
Cc: Dylan Le <self@dylanle.dev>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Shuah Khan <skhan@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I'm thinking the drm_file.h reference is broken.  I suspect it should
reference Documentation/accel/index.rst

Oded?

On Wed, Feb 22, 2023 at 9:25 PM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>
> On Thu, Feb 23, 2023 at 02:52:52AM +0000, Dylan Le wrote:
> >
> > This patch was initially written for the Linux Kernel Bug Fixing Mentorship
> > program. The patch adds a temporarily stubbed section on Acceleration Nodes
> > to resolve a documentation warning.
> >
> > This resolves the warning:
> > ./Documentation/gpu/drm-internals:179: ./include/drm/drm_file.h:411: WARNING: undefined label: drm_accel_node
>
> Please write the patch description in imperative mood ("Do foo" instead
> of "This patch does foo").
>
> >
> > I would appreciate any feedback on what should be documented here.
>
> I think above is better placed between the three dashes and diffstat ...
>
>
> > ---
>
> like here.
>
> >  Documentation/gpu/drm-uapi.rst | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
>
> > +.. _drm_accel_node:
> > +
> > +Acceleration nodes
> > +==================
> > +
> > +.. note::
> > +   There is not any documentation yet need to figure out what this is.
>
> I'd like to write this stub as generic .. admonition:: block [1] instead,
> with the content which is "This section is empty, add appropriate
> documentation here." or similar.
>
> [1]: https://docutils.sourceforge.io/docs/ref/rst/directives.html#generic-admonition
>
> Thanks.
>
> --
> An old man doll... just what I always wanted! - Clara
