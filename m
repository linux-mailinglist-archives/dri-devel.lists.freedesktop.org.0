Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B76F66031F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 16:28:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F13BD10E049;
	Fri,  6 Jan 2023 15:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89C710E049;
 Fri,  6 Jan 2023 15:28:20 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id r11so1282458oie.13;
 Fri, 06 Jan 2023 07:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ab3tdx57EQZ6xsAca1KbY5FPLARshJ6+T7eu3+BdUuU=;
 b=R+nbt7DkHgGcPeOelWU5aKN10vnIzExJ73cYyrBcZxDumkoPwVyZ/LBRIBi1dFqYEO
 HmMMo5aKtfNiebY/OmMpDt6rcED3/51Yw4d3ylCuH3xxhyjpkGMMD09mfgx7o99FTFIG
 91Etl5cKDGMMG8ny63WurR6tOfI6w3Ilc/Tlj7dEILx0ZkBH8Gdm2wQVR3+OlAKBZ3CM
 16UZK3RKtAHlAy00yvJvNl4puQNR3KJg+4jrdYoSmuWXcnk31joQLUlc20h5D8G+aCix
 ENOz8Cr3k1JuVzer9pBDUWCtmquWIk5ZgYlBuLQs3+uOlo2Hjhj3V9+Wal6NTeA/a2qJ
 YcLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ab3tdx57EQZ6xsAca1KbY5FPLARshJ6+T7eu3+BdUuU=;
 b=gVY/qcNNj473Y5VAIQJRKL2FwplJRnHfZkAW0o6TzImCtqYvAYOCiqOIES7c2X9qfh
 LmuS1urSO2UXh1p/CWQvWiz8fO/FUtOL/KnDDRoi22vA0TbMtD+f7YcLZrlkQbkQZ5/W
 s7iOvQTtKT/rmoReUiEetFCvL7zg8uHt0K8i2D+MglTwE/ldvw+ZgSjWTQIN2AECCuUG
 0YfstWD929DeBmQy8tFJ5ae1OPGMQ9ScUh9JDdVdTWciVcp/0dd2+BTKgzu/vPC1KFrr
 6mX5XMsdTIccwR6XBS8MEKLIo4SA4uhy8ZC3Eojg/UxkV7LkgbhPqsyc6Nu8GYveJRh1
 TXug==
X-Gm-Message-State: AFqh2kp0XjP2p78jJn+qQvMNgvlEfcwqJT7Xa87mbCQWgDLEUa+5oIYh
 A6fAYERlK2hilsnjLo3fo1mLEgF7F9bl3GXQY2E=
X-Google-Smtp-Source: AMrXdXtx7HHwv0ey5DyiNGweYMdW6oOsD+E2y4Q6TM710E8YDheUwUZMhk1px3V3gTzzPJTgZlNl81T9mmE12ZAEiFs=
X-Received: by 2002:a05:6808:2994:b0:35b:f5f7:3ed0 with SMTP id
 ex20-20020a056808299400b0035bf5f73ed0mr3738323oib.46.1673018900122; Fri, 06
 Jan 2023 07:28:20 -0800 (PST)
MIME-Version: 1.0
References: <20221216102318.197994-1-yiyang13@huawei.com>
 <1800775a-5788-b60b-87cb-9b09c7e7c177@amd.com>
In-Reply-To: <1800775a-5788-b60b-87cb-9b09c7e7c177@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 6 Jan 2023 10:28:07 -0500
Message-ID: <CADnq5_N5hpnu27Q_XgJ2D-ZnVMFsvX3fzapH3yU7R8ynSdZ2vA@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: Remove redundant assignment to
 variable dc
To: Harry Wentland <harry.wentland@amd.com>
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
Cc: Yi Yang <yiyang13@huawei.com>, sunpeng.li@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Jan 5, 2023 at 2:20 PM Harry Wentland <harry.wentland@amd.com> wrote:
>
> On 12/16/22 05:23, Yi Yang wrote:
> > Smatch report warning as follows:
> >
> > Line 53679: drivers/gpu/drm/amd/display/dc/core/dc_stream.c:402
> > dc_stream_set_cursor_position() warn: variable dereferenced before
> > check 'stream'
> >
> > The value of 'dc' has been assigned after check whether 'stream' is
> > NULL. Fix it by remove redundant assignment.
> >
> > Signed-off-by: Yi Yang <yiyang13@huawei.com>
>
> If this didn't blow up until now we might not even need
> the NULL check below, but either way this is correct and
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> > ---
> >  drivers/gpu/drm/amd/display/dc/core/dc_stream.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> > index 20e534f73513..78d31bb875d1 100644
> > --- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> > +++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> > @@ -408,7 +408,7 @@ bool dc_stream_set_cursor_position(
> >       struct dc_stream_state *stream,
> >       const struct dc_cursor_position *position)
> >  {
> > -     struct dc  *dc = stream->ctx->dc;
> > +     struct dc *dc;
> >       bool reset_idle_optimizations = false;
> >
> >       if (NULL == stream) {
>
