Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E33B4A635D5
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 14:50:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8958C10E00D;
	Sun, 16 Mar 2025 13:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FbLBusAJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 035CA10E00D;
 Sun, 16 Mar 2025 13:50:34 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-6f666c94285so33325147b3.3; 
 Sun, 16 Mar 2025 06:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742133033; x=1742737833; darn=lists.freedesktop.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rLX3l2pfBMyB+u0niGdIBmArIeV1vUvKJ+QVc4dPLqk=;
 b=FbLBusAJ98fmLw/+Pm6w2ZOUWpYZfbhbzk59BSCAkbsNi8827DuQyVXt4qD6Q160iJ
 /ELNU4gzJTr8oHZ2AXHH1MeLx/g4ZfuzrpDQoPTxdovTj7Q1B4bFD9Pn1Q5W5y4jNDaZ
 PZ/R652MkKza9+tOTJ4m5v7ZdElTz5QKy305SWzKUsHCpxeArBvxLYxWZ6uzDgWeDmYw
 OwbfC8+ehfEgtLAN4RPBKun+wpA4gxV4LGfC+ZJVmejfGrN6UsjncTTAOFPYa6rrnec/
 lo0iK9xEJ/hsDD5RGSCFgsuDkpAlCIvbgOe320VBdXlD2IadAImNtbaCe4VHBUCAM2Db
 oFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742133033; x=1742737833;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rLX3l2pfBMyB+u0niGdIBmArIeV1vUvKJ+QVc4dPLqk=;
 b=g/LjG+QoamMI/RV5ECutTmPJ7gYSaDrVjEMbSyY1OAyPrqP8bAAyAded8NF0kNJW4l
 gabZD35KthMsn1KpSMMrVWMweTpLt/aRSbvnYNqeTSYVF0I7wiWSel3nHvxAwip4WNhp
 FT10RmAWY7vicw1GZXoijYrYu0fn73IM595DpZcfSpEOA83/H94UFeZmoWNoJDn1hi21
 De+iTa1DYU0S8YIKyQFuEIjAA7SDe1L1NKCn+OTUPXkh/fdsgMCmO8+HPrDB/YqT6avA
 bheAa5o7hRi1U+0P3vuY0jt4441k2v5DtpeS7LOBN+pJXlz+dSKVOAJFikv8IBOdm90X
 IHJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF4etVY3gZ45Je9D6ah2JIeKDh8QwMscMciCbRDDVeW2WvHjZFLLPKQZGhxdPtW/dIHuY/VdaVh7/n@lists.freedesktop.org,
 AJvYcCVqo9hLmEbqExVycD6OliOfxw9UjCGrM5L3fUPCKWOW5TalH4v9Rs6OsyQf94TbsZd74y+0+Qt3e/ZJ@lists.freedesktop.org,
 AJvYcCWmDeVBI9xIwnfmjANBka+/NodIfI28eE1EGCTNS9UK6ARKhMuZrN+MAy+wDoYFgY50sTGGg52CtbkbpVTMpg==@lists.freedesktop.org,
 AJvYcCWoBID9+vyQNwIvED7nuQoDKJ5ekWrq0m0hCWMb2H+WImI229VpSuDyJVHxfjLalyN0btT8qyd62cOmXEpAy9xY4A==@lists.freedesktop.org,
 AJvYcCWp02KqQtuMZK/qUGzn2l6PCVwAWkxQuZ3kdntd045/O0DSgnkYNvxhW5iQGXy+QD6MAkVtNgIy@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrBeIF0nFwAfaZw/aog+d6ILBg6bgLLtcEB/OaTXQNsJlDhYth
 SNr4WPmShBBVRmvmFJBes7uoY0CW69NiuehbrOGM769j6ekY7Sh1daeakmpOYNhVEjpmHHUOMHS
 r1PIR9yTspFTH3AK3bWljgJnyz9c=
X-Gm-Gg: ASbGncvg2e+LxWBT1cf6i8EH6gLYOEnNgUhAPWxtT039fULkFBQuGZr/giweUSD5O19
 Hj/vajdaTmXXS3hfeXj7g674+LpHvJW2QJF/EBL11zNZkVuGXvIEHVIuYy4xOFnkSKQce6KIAK2
 yWG+PxqOJoiEZJV0w0UgHfWYOj
X-Google-Smtp-Source: AGHT+IFevfJ3v8Hv9LgKFZg+7cLf2qLswo+1gbITmoMoW03EnfIEs3SDlro7IWMIN2Oshbrp414T5CBo4CIGtbatwig=
X-Received: by 2002:a05:690c:4b12:b0:6f9:b12b:8953 with SMTP id
 00721157ae682-6ff45fa5378mr119774397b3.20.1742133033646; Sun, 16 Mar 2025
 06:50:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250125064619.8305-1-jim.cromie@gmail.com>
 <20250125064619.8305-2-jim.cromie@gmail.com>
 <3f5d7e90-0feb-48ef-8279-1644ce5f3d5b@bootlin.com>
In-Reply-To: <3f5d7e90-0feb-48ef-8279-1644ce5f3d5b@bootlin.com>
From: jim.cromie@gmail.com
Date: Sun, 16 Mar 2025 07:50:06 -0600
X-Gm-Features: AQ5f1Jq36108HgQS4XUlPlVF14KcwsKwPglARvXoSnSsnAYbHuikctesWZqFJ2k
Message-ID: <CAJfuBxwu6TVM-uLU0Tpp4MN-wx8M2D0CJeRT0U3rNtVMMQyi=w@mail.gmail.com>
Subject: Re: [PATCH 01/63] docs/dyndbg: update examples \012 to \n
To: Jim Cromie <jim.cromie@gmail.com>, linux-kernel@vger.kernel.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org, 
 intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch, 
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com, 
 ville.syrjala@linux.intel.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 25, 2025 at 7:30=E2=80=AFAM Louis Chauvet <louis.chauvet@bootli=
n.com> wrote:
>
>
>
> Le 25/01/2025 =C3=A0 07:45, Jim Cromie a =C3=A9crit :
> > commit 47ea6f99d06e ("dyndbg: use ESCAPE_SPACE for cat control")
> >
> > changed the control-file to display format strings with "\n" rather
> > than "\012".  Update the docs to match the new reality.
> >
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
>
> Hi Jim,
>
> I think this patch is incomplete, I just tested and the \012 in [1]
> needs to be replaced too.
>

fixed here, thanks.
