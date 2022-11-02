Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B61261675D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 17:11:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A87310E4F7;
	Wed,  2 Nov 2022 16:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B37210E4F2;
 Wed,  2 Nov 2022 16:11:22 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id g10so19668381oif.10;
 Wed, 02 Nov 2022 09:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XMjYtLPQdk4k4exRzx1++JFQEjlm3E6Ooszo7YLrAmA=;
 b=YkoMxrzgOzObQ1f1AQWermP6aRAMBxCVFdMmyaHzOTeZdtelfAESKiSIoV7kj77E+L
 FTIkkriNPRtcD6CsHVUvxp1BM4/3GdHunszANw/koj97LixLFuphPtTERaQk3+dbAqCw
 KipagSfLhrJT86JB/5YZNpquZy6KPER7d+Wc+5ls6kdX7kCKPEtrvMZ/MHv5yvbB75VX
 aU88ms7Xjeqihyb0ExWs7VnJj0lFqqt96zTgIEE2W619V9smJhuW4oUZA54ExzPWVWKa
 vUExZ6florDuPnSi9edzg/cQEAXZHnKivN1QvtxYHqottcJuJqIKCnSohrqJGqM/UwCu
 VXgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XMjYtLPQdk4k4exRzx1++JFQEjlm3E6Ooszo7YLrAmA=;
 b=i3iQU7GCss498Tz7LxdvSfs5pvmPuXAtPgOlv/6t9cu6HwIxsoOhRl7inmSlvWl+CG
 R6zLz/MdA9zjyYUV16XI8DhCUJdlH0siYrqg9P7Uy2NAvNrijmjG3CF72RmoQiQH8Le2
 OJT4WoavjiuHsVD8ebCBnUBUS2gk2kQ5bVJSB60/ETsVHBsstVgJHE5d/ZoGbnhBDJqW
 +qC3k1QXJj1woyap5ElPtKcVRaAtUDpZTiyclAaQyqts9IO1/5+Ek6eHuQ0RGh671Z80
 Iggu8yWcHDueyH0YTcmdI6lf28UIu4vVYn1+M97/rcYLhpiZMxRf0f+obFDcLHPTrDQ9
 fIkg==
X-Gm-Message-State: ACrzQf07zRAgPqO7ZntANguCQ3ae3DQcnEdLbGCEddbUnaHIbwKXkzPi
 rYGrCQdhmPdmhfC3FX0LJRwgY4NMuUJppbUS0Ik=
X-Google-Smtp-Source: AMsMyM59WbQ63bOK+8OGXBf3SLltf4ei4Oo8m8seRlp+EZkh24IHmapsiryJkmixwkTmQ1eeqhOn0KsvVt1S8ZNa3jc=
X-Received: by 2002:a05:6808:14d2:b0:354:c733:abd3 with SMTP id
 f18-20020a05680814d200b00354c733abd3mr13779461oiw.96.1667405481362; Wed, 02
 Nov 2022 09:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <Y1trhRE3nK5iAY6q@mail.google.com>
 <Y1yetX1CHsr+fibp@mail.google.com>
 <CADnq5_Mod90O=tN26+Yi74WPYxpVtss+LG_+_HZyFv2EtzR+MA@mail.gmail.com>
 <202211011443.7BDB243D8D@keescook>
 <CADnq5_Ou9HnZjQx5WaAZW+iu24g_eS2hh25xhExeQjdMOXYfCQ@mail.gmail.com>
 <202211011538.B7548FDDE@keescook>
In-Reply-To: <202211011538.B7548FDDE@keescook>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 2 Nov 2022 12:11:09 -0400
Message-ID: <CADnq5_PxjyL9kqdge-SOMkjLk176sPbSxM9Ng+N8f_-zj9NMqw@mail.gmail.com>
Subject: Re: [PATCH v2] [next] drm/radeon: Replace one-element array with
 flexible-array member
To: Kees Cook <keescook@chromium.org>
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
Cc: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 1, 2022 at 6:41 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Tue, Nov 01, 2022 at 06:09:16PM -0400, Alex Deucher wrote:
> > On Tue, Nov 1, 2022 at 5:54 PM Kees Cook <keescook@chromium.org> wrote:
> > > Does the ROM always only have a single byte there? This seems unlikely
> > > given the member "ucFakeEDIDLength" (and the code below).
> >
> > I'm not sure.  I'm mostly concerned about this:
> >
> >             record += fake_edid_record->ucFakeEDIDLength ?
> >                       fake_edid_record->ucFakeEDIDLength + 2 :
> >                       sizeof(ATOM_FAKE_EDID_PATCH_RECORD);
>
> But this is exactly what the code currently does, as noted in the commit
> log: "It's worth mentioning that doing a build before/after this patch
> results in no binary output differences.
>
> > Presumably the record should only exist if ucFakeEDIDLength is non 0,
> > but I don't know if there are some OEMs out there that just included
> > an empty record for some reason.  Maybe the code is wrong today and
> > there are some OEMs that include it and the array is already size 0.
> > In that case, Paulo's original patches are probably more correct.
>
> Right, but if true, that seems to be a distinctly separate bug fix?

You've convinced me.  Applied.

Thanks,

Alex

>
> --
> Kees Cook
