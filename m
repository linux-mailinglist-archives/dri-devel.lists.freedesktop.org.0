Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27969BB81BE
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 22:31:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DD8A10E979;
	Fri,  3 Oct 2025 20:31:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cbeVNnJx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645E910E979
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 20:31:02 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-b3e234fcd4bso471462466b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 13:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1759523461; x=1760128261;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5sV0LwkDjXxD47FzgjFP5G/bZQe88QSp2aEYpPv4PQc=;
 b=cbeVNnJxyh5GANknHKdNwgrDeZCCzyPRVj26LIzdLrctB+wFjlI1LynHVuSrHXzVJ/
 KATJhD3h0T07PTy89Ju90GJcHVD+UpEFkCo2L6mXGLGw5i1euEonREi6yORoHVrUaeCs
 yJlQjoidJMvYaicCHBTZh1wsg2YMHqMflUoQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759523461; x=1760128261;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5sV0LwkDjXxD47FzgjFP5G/bZQe88QSp2aEYpPv4PQc=;
 b=DyxLRtR2XHgm1ZNhPUsvwSW3aL/s2dN8DkdkhiVGl+tKAh7g4iiA3FDcwRaXR2jAt8
 2rIojClTQcs5f6RpEoaK41owLC2pin2DP8dJGZg0ketf9B/CWYDWh2j+vCJcNDM9ZCHH
 8RUVSSQ/v14fGaTQA8HRWJmFWnQihsv+WXGaVAXD0a7peKQOedRHpf7TnarKqjI/N3iI
 ketFUY81IPq+Eh2exIIKr41/avBzj5RKrB79DNs1wyJiEXjVzSe76aj3//IVTF3tuczU
 XQ8enZ/N7N/GskK/qDrz3WgId1/qwJimQItIgyymEP+Zr4l3QOsieSz6ybDsnIiJ9ohu
 oAjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/N6KeLP1naqgAlUnMIuschjSwH/t1bdCdskcCrzuni5PxK+uAF+a4JG3SYstgqTkeaAYOX1T4pDs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKOpN7yo/7LbNoD7VC8YvHDRit3ZhHhAi3b2Wb9WuWagW0q5ET
 8qo3LPFWH436ZzJpW0SWpq6q3gl3+bc+WM7sosynJ6iWdtRAsO1iTM+1b0yD651tHBpAQhZBvlG
 BWxBVSn4=
X-Gm-Gg: ASbGncuUaV3xLgUX9/AT3lIKOppwqABkJIGdRINGlhHJz9uTqnsxfBCOLkGMPgiXjDJ
 9yt7J3hE6j04P4aDlUKCFsvW+dxTl67q8/Gcyj/QvLzIC8Y0L/4pV4ZLfLSjSYRw0BAXD337/MN
 kZIwytR1ruVeKmx8+CB/OSOx6bIU/mbB7g1QE9r3XHWyceKG9xAasdw6DEan7cmkfYrGV8811GY
 7YizZUo3cerYI/q7YXKaofQq8dCHskYk/zl13x4pQohCPcLeZ3g3Dwd1K6CmbC8P1RCDvSOZnak
 RKvl91OzkhLL3dh8GwxTENuzTcDYxGVbm7+cAolVdXnkSbUqR7Cub4cCsPgFhiT4cjusHaTQVgS
 I9PeyhrhcZWws78rLwIbDcotR+blhPEDM/7AP6o0K2PlRGL7Qi3+TF9/K3lb4pzE7U3I9FLNMOI
 gpwiuGt8P/q6tqyL8ssrex
X-Google-Smtp-Source: AGHT+IG5fz0rfIe/ybifGhT+PTwmY8RXHfgxnJHtVQmHWl8nsF4FdGBXNLZK9GDlC71gNc9EzQKOFw==
X-Received: by 2002:a17:906:f597:b0:b40:51c0:b2d2 with SMTP id
 a640c23a62f3a-b49c4393c4emr562598866b.63.1759523460772; 
 Fri, 03 Oct 2025 13:31:00 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com.
 [209.85.218.45]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4865a83f4esm520435766b.30.2025.10.03.13.30.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Oct 2025 13:30:58 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-b48d8deaef9so346672966b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 13:30:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVfzGQFPvjqfPI9/6s4AMMJHCrIRgOyo0urO1PUiDOx/PZbMeUIDJsace5QdxMf9alUO330unitXvA=@lists.freedesktop.org
X-Received: by 2002:a17:906:9f85:b0:b49:3ee4:d4a6 with SMTP id
 a640c23a62f3a-b49c19769e3mr582057366b.18.1759523458139; Fri, 03 Oct 2025
 13:30:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzYUBfz+YmifRDgdBsuTL=FpBxQVfxu23it48kGRzJNPQ@mail.gmail.com>
 <CAHk-=wgO7S_FZUSBbngG5vtejWOpzDfTTBkVvP3_yjJmFddbzA@mail.gmail.com>
 <CAPM=9txjNo==nMA7XcjzLWLO155+1bk2THwPs_BmTLu_5kU_bQ@mail.gmail.com>
 <CAHk-=wgR61VxiHyOKXBJv_HinoFVA2av1EuSHg5NcRGC1fNq3w@mail.gmail.com>
 <CAHk-=wgX-2+hH5fM344_wKYNZS5CSf4ispS4X+s5xkma_Mdu_Q@mail.gmail.com>
In-Reply-To: <CAHk-=wgX-2+hH5fM344_wKYNZS5CSf4ispS4X+s5xkma_Mdu_Q@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 3 Oct 2025 13:30:41 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjWpOvU_cX7srXCHJZCxYhRJgMGQvWzR9q_Ly_4LZ83QA@mail.gmail.com>
X-Gm-Features: AS18NWCcD8PEzt_WikzxTevpQNiKIibOqs2Awv0nw_OSAyxfhplw1BskHQrD0yo
Message-ID: <CAHk-=wjWpOvU_cX7srXCHJZCxYhRJgMGQvWzR9q_Ly_4LZ83QA@mail.gmail.com>
Subject: Re: [git pull] drm for 6.18-rc1
To: Dave Airlie <airlied@gmail.com>, Sasha Levin <sashal@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Sima Vetter <sima@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 3 Oct 2025 at 13:02, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Adding Sasha to the participants, since he's been doing the AUTOSEL summaries.

Bah. Let's use the right email rather than some ancient five+ year old
one that was randomly picked from my email history.

                Linus
