Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D2FBEDFB3
	for <lists+dri-devel@lfdr.de>; Sun, 19 Oct 2025 09:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E8FF10E1A8;
	Sun, 19 Oct 2025 07:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4601810E1A8
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 07:41:43 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-57b7c83cc78so3159860e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 00:41:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760859697; x=1761464497;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hjuUe+UFCTyI3ZlwUaVCKaC02uBTC5d7Of/hpQUOtLw=;
 b=iR6t9yoFOuJYk0XbJ8mgg7qa1aQYuDJt6PvBkloHO3MHUki/WR+1qNl0SGRh9BXx70
 n0XKzXfFkHnvTtiURsfMJiQznqX8m0SY7xHOtYi/6wD60XGAC0aeywX9lEctgedmlP/6
 Kw5Cdtefno4lSdSKL59IRVMcQUx6E2cwxsJvw4zoFVTW2iCmr5ZAH8eUS7sQ6qQ5dxug
 wdcGm0LjHMClzTDi6oCox4TG2jzxIMkXuOQEYm4i5civiLyvuNDHSRkvjdpDWXVGpeqm
 V/ad9ZePRIWTleJXkiqR+NvBRAG8SQN0YysXf+Bpeu6QfSJ5+qNdwzOxUAbGQvV2xUCX
 n6yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvb+sbeFvCt29LYDI1hwsoJNsukC3lCOdCCce553DpZix72T1k+JNfF1t2js4N/T0ocMcDOjvnEAs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGpKqJ6lp5BWMVcltUj6wIW6nZ4em1LXEny8hKyscP3xhDUsFo
 UmMdQ47OisIxKDqwP+TVe5fSvAdrfPUQSydFvgl3bzjEGyfwYXs5E2/mqRzIbCy8
X-Gm-Gg: ASbGncuxlCR3NRYzbx1RSAgb7MIGDQKb45lFSRMzHDzVyn8qKJBUyHXfP2b6z+RGiFS
 rekU+IzO63XZXK3idLbZzpf6NftnfFVwFMnBhayNWWlSej9paKvDyOZSS4vNDeC4CaWJDPfL7+K
 hG/j0FZmGyDb2N46Jh9j4yu/MXWART2+HNrKyhLHcuTH7oSlWjkAfSwzMkx6UxmR5jH1CV0/UBG
 3+CpjF5Ekq3vFKxMx7VsVIKpZI9LJmucNXR6MGn7FDTqeVAovoKUgxagPRiYsRc9ceAYPv32j9G
 ppF5qzFyDd0S6thzu15gT0v8tE4POx/4TuJE5doQ71bVpiT5mwf0L1MbbYFKtCF1lES4Y66pWqd
 epOdrXvyg3eULuFqaUrlkxf2DWFS28wds9mKhkdKcsR3z1HF43VHbdLxswoTSf9EQxvB6CXW6sY
 WqFTji8gbxLetkxIx+B+c2tBTA+r7mJ9gc
X-Google-Smtp-Source: AGHT+IFnA2KPQvBIa9x3YhIjQwMnS7Ia1C9+zL9vj53UnzA3ObG5oxDW1tiNuXWxxOlkdEs/8gesPA==
X-Received: by 2002:a05:6512:2398:b0:590:59ea:8a42 with SMTP id
 2adb3069b0e04-591d073a95fmr4433164e87.6.1760859697185; 
 Sun, 19 Oct 2025 00:41:37 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com.
 [209.85.208.182]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-591def1bbf6sm1348714e87.89.2025.10.19.00.41.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Oct 2025 00:41:36 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-373a56498b9so43089681fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 00:41:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWtdSot2UULZdVcAXtimUDRfNQaGB+ROzM1j0Cj++TqKof3djTnYmOJSXwFEc+yW/lXesMLZjGMFjQ=@lists.freedesktop.org
X-Received: by 2002:a05:651c:2113:b0:36b:2fab:fa6f with SMTP id
 38308e7fff4ca-37782137beemr41886461fa.3.1760859695663; Sun, 19 Oct 2025
 00:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-2-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-2-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 19 Oct 2025 15:41:23 +0800
X-Gmail-Original-Message-ID: <CAGb2v66ddMgVSFFtQde34BY2FcjPn38hxCsvVQ+m5+fOJtyJ7A@mail.gmail.com>
X-Gm-Features: AS18NWCXbetOzzBsxzmfJfwCXigzPHLCDC4AqSPGnEbYZf4O62hkT_fB8IZOMeY
Message-ID: <CAGb2v66ddMgVSFFtQde34BY2FcjPn38hxCsvVQ+m5+fOJtyJ7A@mail.gmail.com>
Subject: Re: [PATCH 01/30] drm/sun4i: mixer: Fix up DE33 channel macros
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
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
Reply-To: wens@csie.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 13, 2025 at 3:23=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> Properly define macros. Till now raw numbers and inappropriate macro was
> used.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
