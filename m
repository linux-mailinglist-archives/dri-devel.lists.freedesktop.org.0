Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D143A2D8B8
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2025 21:47:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC6D10E0DF;
	Sat,  8 Feb 2025 20:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="kymjE40j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABFFE10E0DF
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2025 20:45:25 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-ab78d9c5542so307965266b.1
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 12:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1739047524; x=1739652324;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aLXDtqwkQRLpryu9rC+CUz7k+xX8tB/DDrhNDrtPAJE=;
 b=kymjE40j/io7FWjjSZmBZC2G57XCsht1V37kMUWESFuBse4QMHXNGbYVyIDligiF4A
 wZzSeJjrdNFKCkbuVNhk5z3oWgI8lR2LC3GtDqnlwanqNXTJWiewMW7dWw1ptyQwp0HT
 lVeQkTyy12uNkqmVNV8IK9D/ew5M/sOwdGQhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739047524; x=1739652324;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aLXDtqwkQRLpryu9rC+CUz7k+xX8tB/DDrhNDrtPAJE=;
 b=myBfXzAbYJBonbZh521cH+lSuOxKxphLDqdVYm2Fm9S52Z23FYBSLq3/X+z/t2h8zJ
 JlKz2XRxnNc3ft5kT4Dy1tce5Md1+zKL1ndXFRLGYu2mNaZ4pFJ6Oc4r2VZTKaFPLCv8
 TqdJ8yAReLgaTs0MQME5Pro8xEmuH9R1uB/jh/f0qQgHUaWw/3OVU6oUEXcxsxDANpsd
 f4fVpHB2CqmmRZCx2D1N1pKPx+a0zXYJqEu1xMBhtNcH72vbwC3g+WzaroqKYtNiZPr6
 h1vZWbuYVZR0sWnoLDhP6guCN+2Gaq6dh8173vOlaYWwq6/rHa79xOpQ0DeadX6zbviQ
 9YkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQtq430Zsri/R0Rg5IF90mcLj8lXeF/TwgI3uE1ZLSfUHwFtlE0jk4oV62tRCHbF04RN74pXSilHA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3kxVHxUF7Uhb2YOkRIKbjiPdI8igmxK7ZKF/iCiyLDKxygbx6
 vAhO24lir6ddFFk+gGZbsMY5xPOnBGvgp66LJr/O+EFhQBZtX6ptMs/fVqldrcEYkuSixj6I/jI
 Ul83A
X-Gm-Gg: ASbGncuVGtJcRnbuKKzRWD6vUM/GGampgvFcmAgrRlHEe0vS1GAf0tvL+EyNtnigGRR
 ptS4BGdZjipyG5WCgiKmweeulNgGGMF2uV6aLux3xms9kttqoTL7HHBn8OsLAebe4qM0sVxm47h
 54UqcJ/9uemZ59TeGyCuvz0juTpPuBEFqkifA5E1+xbMg/LFpOjW00+8W/AgXTlYxRuhK+6jGwK
 p2kJbkT3feV/Jl48qsDgvcC4G0eJf262J1h/ZF5HynilJy3FG7x5Lo6yfcAVYn5eRfcvaLcM5lv
 m/eicNugE3CbrjrscLVY4/v/53O00onBhtwCTwujMgKdoxGIGXsMdzM=
X-Google-Smtp-Source: AGHT+IGwAoGwk+U9uv7UhjlAsdtE87lPkK/LiH4BRltWCUP5+Efkze8Fjy4+FxzEj//qQBfBxWnDUA==
X-Received: by 2002:a17:907:c285:b0:ab7:6d4e:968b with SMTP id
 a640c23a62f3a-ab789bfc23cmr887252466b.38.1739047523719; 
 Sat, 08 Feb 2025 12:45:23 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com.
 [209.85.208.48]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab78cd15ac3sm377972666b.126.2025.02.08.12.45.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Feb 2025 12:45:23 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5de3c29ebaeso3376312a12.3
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 12:45:23 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV4udK/pI6wBqYETVjwcU3+kGYDM5CgUJuZ5mU/S9PDYaIiWMjMS178AYfMV8TMsYrZUSqWCXZofIs=@lists.freedesktop.org
X-Received: by 2002:a2e:9f47:0:b0:308:e803:118e with SMTP id
 38308e7fff4ca-308e80314f1mr1813521fa.0.1739047076046; Sat, 08 Feb 2025
 12:37:56 -0800 (PST)
MIME-Version: 1.0
References: <20250206-mipi-cocci-v1-0-4ff0c69e8897@redhat.com>
In-Reply-To: <20250206-mipi-cocci-v1-0-4ff0c69e8897@redhat.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 8 Feb 2025 12:37:43 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WkPefg00R_TAQQA6waRqGdD+3e84JXfPLk2i9BRzW6Yg@mail.gmail.com>
X-Gm-Features: AWEUYZmtp_A3cX_L46ivt1I8hAClJ-sovMP_5NAQXDAfEvF1gvbHGKAwEokNtOY
Message-ID: <CAD=FV=WkPefg00R_TAQQA6waRqGdD+3e84JXfPLk2i9BRzW6Yg@mail.gmail.com>
Subject: Re: [PATCH 00/14] drm/panel: Transition away from using
 mipi_dsi_*_write_seq()
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Joel Selvaraj <jo@jsfamily.in>, Ondrej Jirman <megi@xff.cz>, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Artur Weber <aweber.kernel@gmail.com>, 
 Jianhua Lu <lujianhua000@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Tejas Vipin <tejasvipin76@gmail.com>
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

Hi,

On Thu, Feb 6, 2025 at 1:06=E2=80=AFPM Anusha Srivatsa <asrivats@redhat.com=
> wrote:
>
> Transition away from mipi_dsi_generic_write_seq() and
> mipi_dsi_dcs_write_seq() to mipi_dsi_generic_write_seq_multi()
> and mipi_dsi_dcs_write_seq_multi() respectively.
>
> This is addressing one of the gpu todo items [1]
>
> Used Coccinelle to make the code changes.

As Dmitry mentioned [1], I think a real cleanup needs more thought
than can be done in a Coccinelle script. Maybe you can make a script
that's super fancy and does a perfect conversion, but I sorta doubt it
in this case.

A few other note:

* Tejas Vipin has been slowly whittling down this TODO item. It would
be good to CC him on any attempts to avoid duplicating work. He just
submitted a patch [2] that duplicates one of the panels you ran your
script on. It would also be good to look at the patches he has been
posting to see some of the extra complexities.

* I'm happy you CCed on the cover letter, but given that I've been
helping with this TODO entry it would have been nice to have been CCed
on all the patches.

For now I'm not going to review the individual patches in this series.
If there are any where you think your Coccinelle script really got
everything adjusted perfectly then feel free to point them out and
I'll review them. If you want to help with this effort, my own
personal preference would be to at least start w/ one panel at a time
since probably review feedback on all the conversions will be similar.

Thanks!

-Doug

[1] https://lore.kernel.org/r/mz6usiheb2lx6wlk47z3btvf6t6kbo4ja4n6mli5hosrp=
cvdwp@wmvfvhaqhpkm
[2] http://lore.kernel.org/r/20250208051541.176667-1-tejasvipin76@gmail.com
