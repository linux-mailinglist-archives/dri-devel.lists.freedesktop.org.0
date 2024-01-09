Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7750282889B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 16:00:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D29210E462;
	Tue,  9 Jan 2024 15:00:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9602F10E469
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 15:00:00 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-203fb334415so2082608fac.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 07:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704812400; x=1705417200; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RyKP7ndLV+Kcpm0EuaGv/5soSY6fBfB2g6ZMXyiQm6w=;
 b=d8qVO+BYE+M7+Q/8p57l9963qbDRp+Jh20+xYpSEz3vm7BpfzNyyowjMf54uQvDdv3
 Sip7DtW8ZIP4jLzh784+cKLfN043iwWvhhP6RcuDiEJGAOdWbEgI4W0Fm6BYBu7cL6JQ
 ucafu+vRMruv9jdOkRTv0QIbcbloJ75pprJUF7JtiOdLfWXxxsDsM+Fepfl3oVtKYAOQ
 IezImbtEiyq58usg9h6I/9w2MRqCXXYoqg3orPmMHOR5uYLz41CdIAxCN9Ryu6ehxx8k
 bLwKoLhR20mV4KZCI8nI4qx1r4bYB2ROSsgZ26gaDRirp1+w+u4oyRznzMWbdnzTM9m4
 weSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704812400; x=1705417200;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RyKP7ndLV+Kcpm0EuaGv/5soSY6fBfB2g6ZMXyiQm6w=;
 b=o8KIeH7r2wgQmPdqMHfOesNOvo0+VtOL+5QzzKIeyKqCB7Ex5kPihUqIbP8LFDpE9o
 1NwUDoM+aRHdfd9WLI9zdeyEFyOVVLE4SEAAEJ44243dfMWgyQ0osZ0jwIN+B5REUiu/
 6Zx41xkSUh69FOc787dUWvxL6lPUNT+Ep14M9sajpR0lNa7BAPhDm/LOKbwe6DB4RX79
 RFZHuNVaZcYeT5nqDtvGXbx6c1bB3C3axw3uRhkjRRGWwqY9yAFWJLrFVDtgYlVPZg/0
 sipCrXp+zlnwwr+g+SE4Tb2SjUcUpdEiYkm5LnYbUY0rKUlFGB/XpHwezQAQusesSyXx
 1+Ow==
X-Gm-Message-State: AOJu0Yxajd8hlOIWrgOpP/0o7YSxj988XxXKy06u1bIVvfiyvoeVbacZ
 Q1YrJOqA9YKXzf2fr3xlD/JMQPBdxuD5WnZmCJo=
X-Google-Smtp-Source: AGHT+IF5A6wFdIUUU7b6vSsTGwHl0nkFfXfXW1v7m4SxCgxxBpfAHVhg3uo5Z79+TXU1DRG6qXWF0HnFsAg45RlC2Ss=
X-Received: by 2002:a05:6871:8009:b0:204:1590:2044 with SMTP id
 sk9-20020a056871800900b0020415902044mr7142787oab.5.1704812399799; Tue, 09 Jan
 2024 06:59:59 -0800 (PST)
MIME-Version: 1.0
References: <20240109140345.3344094-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20240109140345.3344094-1-daniel.vetter@ffwll.ch>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 9 Jan 2024 09:59:48 -0500
Message-ID: <CADnq5_PspPP6DcCQm_kro+KRiSAo2y2XX6mEA4vF4gCBgTwnxg@mail.gmail.com>
Subject: Re: [PATCH] kernel-doc: document object-like preprocessor macros
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 "Steven Rostedt \(Google\)" <rostedt@goodmis.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 9, 2024 at 9:16=E2=80=AFAM Daniel Vetter <daniel.vetter@ffwll.c=
h> wrote:
>
> I had no idea this exists, but Randy pointed out it's been added quite
> a long time ago in cbb4d3e6510b ("scripts/kernel-doc: handle
> object-like macros"). Definitely way before I started to write all the
> drm docs sadly, so there's a few things where I skipped writing
> kernel-doc since I didn't know it was possible.
>
> Fix this asap by documenting the two possible kernel-doc flavours for
> preprocessor definitions.
>
> References: https://lore.kernel.org/dri-devel/dd917333-9ae8-4e76-991d-39b=
6229ba8ce@infradead.org/
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

News to me as well.
Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  Documentation/doc-guide/kernel-doc.rst | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/Documentation/doc-guide/kernel-doc.rst b/Documentation/doc-g=
uide/kernel-doc.rst
> index 6ad72ac6861b..a966f1fd5c30 100644
> --- a/Documentation/doc-guide/kernel-doc.rst
> +++ b/Documentation/doc-guide/kernel-doc.rst
> @@ -341,6 +341,32 @@ Typedefs with function prototypes can also be docume=
nted::
>     */
>     typedef void (*type_name)(struct v4l2_ctrl *arg1, void *arg2);
>
> +Preprocessor defines documentation
> +----------------------------------
> +
> +There are two ways to document preprocessor defines. The first works mor=
e or
> +less like kernel-doc for functions, including parameters::
> +
> +  /**
> +   * FUNC_NAME() - Brief description
> +   * @arg1: description of arg1
> +   * @arg2: description of arg2
> +   *
> +   * Description of the preprocessor function, may have multiple paragra=
phs.
> +   */
> +  #define FUNC_NAME(arg1, arg2)
> +
> +The second type is different and for object-like preprocessor macros wit=
hout any
> +parameters::
> +
> +  /**
> +   * define MACRO - Brief description
> +   *
> +   * Description of the object-like preprocessor macro, may have multipl=
e
> +   * paragraphs.
> +   */
> +   #define MACRO
> +
>  Highlights and cross-references
>  -------------------------------
>
> --
> 2.43.0
>
