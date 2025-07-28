Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C415CB14048
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 18:28:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EADB510E538;
	Mon, 28 Jul 2025 16:28:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="gnP6kCe+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF9210E538
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 16:28:54 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-23dc5bcf49eso63698465ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 09:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753720129; x=1754324929;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+bV8/1zB02ycKvjRRdDk/ZYTjyldvrl4N9o7GiFyOOg=;
 b=gnP6kCe+kd/xvQRpKBl3G9q7QaPA/02sOtCap5TZhVfXc4ld9ygsEXKJ1pu6jXsJsK
 gWcGDuQ69NTuvCWBFoHWTyo0APP0v83u4+HJgLWCDednbeEaMJTcBDR6HsDg2pItPeCU
 ZbTo1rXahQsW0FIGYNjHyLskjUnrfHV+pz2LA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753720129; x=1754324929;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+bV8/1zB02ycKvjRRdDk/ZYTjyldvrl4N9o7GiFyOOg=;
 b=KLZJDlkO4IYfRDGl0++hZeTS2r98GEhgXGJP76JIHOs3+4pbb+Q2v03jxeDokXiPEl
 W82GMo1RCBG7AGYhjomdtVnN3v6gZ3IX3cCAN2L8p5171FAKAyGUHVANMjx6sr/m+J/4
 LWjVIUASFfo6bHQdoscFBKXHYBjKUdnm6IfFZE2NXNG19CeXepwQ4YQNZj2eZeAoDTlG
 rUZdpIZRPOC7tVj6mQHIJNgM26Y/0mxBISt0j5qmszuhAx3Govk1g+nyn6GPYBlmBjMV
 Qv2EFa66Sx2pHJbxWNE9NPwRDNYked9O+N9Pss/asWl+aY5mzr65uS2YVHJ0SYnesOLE
 j5sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXZXoFBiGHFoTsaGjakYsEcJSiKkS2YrcnupdVp2I/cv/I4m86wCCLZ87KJXddzSfBNbnI3vAMUXw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzop7tPnIO6NWyXh9Co8XdmKbDJ3v6njcrMx+kJORPj/x/iwhBB
 F6jBGfVNlzqyL+kEsU/rrVfQM9XGepKkVb1W0iNlBhU7h/CAVPOAGmQHVLLWc1iqSFnJI+Qhtc8
 pxL8=
X-Gm-Gg: ASbGncuVR4QPqVy0WXT1Nn+Ky2Xe7bW/LnT58RKnPLKOINUHl7v6Rvx3eoHW24dSHHe
 K8BCeBNtTwnAw0NozZFglICyT/hJMScde9/yYtUMZC6/wjfGa8Kk3BloM4jvQqavF7ydim9q7Q4
 Ut9cL8+kStJO2Tnd/gmlRikK3nPVrlJtwjMm7qUdOVKgrGmuGCLPDPmOrifRuhhGMBYtl+cAien
 Xv19f13mhDSBXHDiV+V4nSI7lbb0RO64fulqMtmXAwaTWpPOqAG/wz5QdUuwDGMR0DKYPisleya
 ab49PY5A6aJrIzpL6xbQwz/bxI9ZPDAc6iBlki1UuUR/N5mAQLyfsEBWKdj88v40k1GJHBVjOgS
 KWNk72ub8oLNHfRPc+VSJZ8fPqGq1vWMPARk/alFhVvll7mLtM+CTyOOhSSQOBeJa/2EjesxP
X-Google-Smtp-Source: AGHT+IGSRlBalLDk+kPOGQ74/KzIgXk/u/GF6Q3MauVQJriY+/+oXvqCDZSW6rffKRFFxf0Rzr4+OA==
X-Received: by 2002:a17:902:ea06:b0:236:363e:55d with SMTP id
 d9443c01a7336-23fb3145a57mr165490925ad.28.1753720128773; 
 Mon, 28 Jul 2025 09:28:48 -0700 (PDT)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com.
 [209.85.216.51]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe4fd62dsm58177265ad.111.2025.07.28.09.28.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 09:28:47 -0700 (PDT)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-31ee880f7d2so1213324a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 09:28:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVsvIO/j1LwL+SuqbGertUH/R6tzZlm+JB5O/6j88/L8Gv4ap1t2dO63kO2T6DnPlc7r1c/k0LyWPQ=@lists.freedesktop.org
X-Received: by 2002:a17:90b:3b4c:b0:313:db0b:75db with SMTP id
 98e67ed59e1d1-31e77a24b41mr18438779a91.33.1753720126253; Mon, 28 Jul 2025
 09:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250724202338.648499-1-me@brighamcampbell.com>
 <20250724202338.648499-3-me@brighamcampbell.com>
 <CAD=FV=UGNN68Fu4kJQQ8jO+fYP4qVJYmL0quxa_=Y5GEtS-jMQ@mail.gmail.com>
 <DBNGMHS14LUB.3PDFCB3DI1789@brighamcampbell.com>
In-Reply-To: <DBNGMHS14LUB.3PDFCB3DI1789@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Jul 2025 09:28:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wg_JrwGx91Pek2SC=JH6ksugjFEpDmW5z3qXCUKyiu9g@mail.gmail.com>
X-Gm-Features: Ac12FXyy9q8f7qx9W8K4Oe1nvu_PYnS7rPks79aLouknOlrzwPZQDQBc90Gh8fI
Message-ID: <CAD=FV=Wg_JrwGx91Pek2SC=JH6ksugjFEpDmW5z3qXCUKyiu9g@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: novatek-nt35560: Fix bug and clean up
To: Brigham Campbell <me@brighamcampbell.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linus.walleij@linaro.org, 
 neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, sam@ravnborg.org, 
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Sun, Jul 27, 2025 at 11:04=E2=80=AFPM Brigham Campbell
<me@brighamcampbell.com> wrote:
>
> >> Using mipi_dsi_dcs_write_{seq,buffer}_multi() in place of
> >> mipi_dsi_dcs_write() gives the added benefit that kmalloc() isn't used
> >> to write mipi commands.
> >
> > Ah, this makes sense. We've seen this before, but I keep forgetting
> > about it. Thanks for mentioning it. I wonder if it makes sense to have
> > variants of mipi_dsi_generic_write_seq_multi() and
> > mipi_dsi_dcs_write_seq_multi() that take non-const data. The only
> > difference would be that the array they declare on the stack would be
> > a "const" array instead of a "static const" array...
>
> Ok, I've thought about this one for a while. The problem with my patch
> as it is now is that it uses a u8 array, mipi_buf_out, to construct MIPI
> messages and send them out. My patch reuses mipi_buf_out because it
> happens to be the right size for both messages which need to be
> constructed at runtime. Not a super clean solution, perhaps.
>
> The Novatek NT35950 has a better solution. See the following function
> from drivers/gpu/drm/panel/panel-novatek-nt35950.c:107:
>
> static void nt35950_set_cmd2_page(struct mipi_dsi_multi_context *dsi_ctx,
>                                   struct nt35950 *nt, u8 page)
> {
>         const u8 mauc_cmd2_page[] =3D { MCS_CMD_MAUCCTR, 0x55, 0xaa, 0x52=
,
>                                       0x08, page };
>
>         mipi_dsi_dcs_write_buffer_multi(dsi_ctx, mauc_cmd2_page,
>                                         ARRAY_SIZE(mauc_cmd2_page));
>         if (!dsi_ctx->accum_err)
>                 nt->last_page =3D page;
> }
>
> The driver has a couple different functions like this and they're all
> for the express purpose of writing out a single MIPI buffer which is
> constructed at runtime.
>
> Arguably, a more readable solution would involve the definition of a new
> non-static macro like you suggest. The macro's `do {} while 0;` block
> would achieve effectively the exact same effect as the functions in the
> NT35950 driver, causing the buffer to be popped off the stack as soon as
> the code inside the macro completed.
>
> We could call it mipi_dsi_dcs_write_var_seq_multi(), perhaps. Or
> mipi_dsi_dcs_write_sequence_of_bytes_determined_at_runtime_multi()? ...
> (Help! I genuinely don't know what I would call it...)
>
> Please let me know if you'd prefer that in v2 I adopt the approach that
> the NT35950 driver uses or that I instead introduce a new macro for
> non-static data.

The absolute best would be if one function could somehow magically do
the right thing. It's something that would be better if the caller
didn't need to think about it. It might be possible to construct some
ugly snarl of macro using __builtin_constant_p() (maybe requiring
__VA_OPT__?), but I don't see anything super clean for it
unfortunately.

IMO adding something like mipi_dsi_dcs_write_var_seq_multi() would be
the best. The name is a little unwieldy, but I can't think of better
options and I suspect this will come in handy for over drivers as
well...

-Doug
