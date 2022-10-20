Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D7F606135
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 15:13:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B3010EF65;
	Thu, 20 Oct 2022 13:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C9510EF5E;
 Thu, 20 Oct 2022 13:12:48 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 z11-20020a05683020cb00b00661a95cf920so11363071otq.5; 
 Thu, 20 Oct 2022 06:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DsXsFIYvDAodNYz1Nmy2Vi1Se+P9Lqr7f28wYKZlDiY=;
 b=lSihJaVhGaXXm3ksHFi4XF5VCkViNanV/8bL/Bs++PXHQEbGsfv+rELLlTNr8aRmbg
 HaP8NWHwNzxVyhPma74QoZk5yy23QJ95JrRropTyptHwUXs3Qot7RmYT53oegQwFDnJU
 Uh9Tjquo7WlN0mbi41L00eftSPkGf1UGo1aBZHgdZfsXoe0QV1ZbW5JxPPgzh7H+BmNO
 6AIUC7ZidonTB/mFxlYQ+AR2BW8jW7hvHXWmwzV6dIPCyml1lxT56kvAWJqYTaFyMTQo
 p5IfARYl/dHeFOIgdFdc2R8wRVbWKX6aPQ4ybbxiyQHuASoAO2EnrwWE6SklqtZAGjBA
 vtAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DsXsFIYvDAodNYz1Nmy2Vi1Se+P9Lqr7f28wYKZlDiY=;
 b=brPlA+DU/fmN4NqF7k4Y+giZ3hUXaedRkETVswE/tQTFqaGA6nX2RwYNc0jGzrtvbH
 hxUalYYqgt0vvT3KZ1eUgavOLS2E5VTxp4YEl9TVj9AL2ghH8bwgj+UJQwzTXHSmLiPT
 KcHrvwoYP+Y0sN/tMH5zq7t7Oo1vYjpLFUY+j+SC/znwO9LHFTefWLFsHFaq4eDrCQjW
 uEKnkt9t5BQKZu+Rcsm8VCfNK1m/PajXjoheYy0edUooo4dZ2MmoXBi3gT9FY3Xktj+N
 j+k6pJ4gSD4sPLJQuF0h4uviphqOa1M45qp55/idguqnNSNdMgtzsljdJn6QtQyJz3zY
 EoyQ==
X-Gm-Message-State: ACrzQf2Kg/kMrUdpqHyBRDFHLZwWSMrnHsXpziLd21aMN2PdZVY5L202
 9kGDXBAkWfxeF/6lwb/9ko1LByYIzgQBMEKY8bQ=
X-Google-Smtp-Source: AMsMyM5nap6y4lQsKGO8rHdv7F2gC+h5H59qOgQ0THliBfMad+ldikYvgxoOHtjNJHBe1CJMu6wOnF1QRZo4bEWF6Mc=
X-Received: by 2002:a9d:6645:0:b0:661:b778:41b8 with SMTP id
 q5-20020a9d6645000000b00661b77841b8mr6970619otm.233.1666271568082; Thu, 20
 Oct 2022 06:12:48 -0700 (PDT)
MIME-Version: 1.0
References: <20221019062347.3756071-1-ruanjinjie@huawei.com>
 <8eb93fb6-a1c4-5ef4-f549-8649bb36e59a@amd.com>
In-Reply-To: <8eb93fb6-a1c4-5ef4-f549-8649bb36e59a@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 20 Oct 2022 09:12:36 -0400
Message-ID: <CADnq5_Phr_g-LZtqc2sojEqxyoqWLuo7RhFHHyC2wQsEVRBEiQ@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: make dcn32_mpc_funcs static
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
Cc: jiapeng.chong@linux.alibaba.com, hanyihao@vivo.com, sunpeng.li@amd.com,
 ruanjinjie <ruanjinjie@huawei.com>, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, aurabindo.pillai@amd.com,
 dri-devel@lists.freedesktop.org, Martin.Leung@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Oct 19, 2022 at 9:28 AM Harry Wentland <harry.wentland@amd.com> wrote:
>
> On 2022-10-19 02:23, ruanjinjie wrote:
> > The symbol is not used outside of the file, so mark it static.
> >
> > Fixes the following warning:
> >
> > drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_mpc.c:985:24: warning:
> > symbol 'dcn32_mpc_funcs' was not declared. Should it be static?
> >
> > Signed-off-by: ruanjinjie <ruanjinjie@huawei.com>
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> > ---
> >  drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c
> > index 4edd0655965b..206a5ddbaf6d 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c
> > @@ -982,7 +982,7 @@ static bool mpc32_program_3dlut(
> >       return true;
> >  }
> >
> > -const struct mpc_funcs dcn32_mpc_funcs = {
> > +static const struct mpc_funcs dcn32_mpc_funcs = {
> >       .read_mpcc_state = mpc1_read_mpcc_state,
> >       .insert_plane = mpc1_insert_plane,
> >       .remove_mpcc = mpc1_remove_mpcc,
>
