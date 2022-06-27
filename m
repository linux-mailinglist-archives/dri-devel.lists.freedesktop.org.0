Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A6755BC31
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 23:42:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55EC810F13E;
	Mon, 27 Jun 2022 21:42:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A86E10EFE9;
 Mon, 27 Jun 2022 21:42:33 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id lw20so21878838ejb.4;
 Mon, 27 Jun 2022 14:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/m5gEvG4Nkhnu6c3440vB73PXnwZ2jewkhSAliGBXTg=;
 b=CynNGWCzO8u27qkFDIzY+jXsy8vbILCE7VFIfDkmWApFEP/TyAInFPWtLoi8W4oAJv
 yRP1bnPJv+PoEUvfh/hvO8Nnx2y2AjIz/CszaBG+aQkExDPFi7OJbr/+buyNM3cuJzpL
 QiNruHf7RNp23wTV4F7qqgkqzrV/zED8wFZamXl60ftr7DKklUJED02KuOkfGa/+QuqK
 eSR2sUlA7gfJPtbcReFLZRg/BzoXQ6QzGoIAuB2LbOV0xv7nN2/pZ78o8K66JVTTLvLl
 uMcvFqANm4pcYdgcWj6bxJWqXtfIjhIrq59dKA1kQLW4msu2vFcBV7x9IOXQ5mD2jvYT
 iK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/m5gEvG4Nkhnu6c3440vB73PXnwZ2jewkhSAliGBXTg=;
 b=yiNszYttUltlaC4cQ9t3XGjoJUa4+y4FkDyGHTsOrXwFDLXUe5mFgrpG5DllBQqYfr
 KSUeinUNdx4tCzVDMcYFok+Yno6m+n5QBwcZ/6R+b1X1Lor44rnErMTTKUKet5nFWVZn
 gAT+37Itsae0yRHwxkWwJkFE1K3u0NUG9J/q8ssFsIQSxWw93nBXiizi7QR2Womoq4Fo
 ABFXbr2sW87sEpaE3RwLsO2xEWPklCmdmqnOXiaduAwcvN/3Co2R2E5GpSyh4RLF+uy0
 7GUHGpuwmw0hQ+lvCkIh9ex7ES7OW4Y7n3pJAkQajbu7K7q6aiZ91q/lFthzgwhpweC4
 YMbg==
X-Gm-Message-State: AJIora8hKJklCmeKquWD0js12P6DqWKZhpxpm/hGx0P1FRsYVKFLb959
 zen6H9eKWBFBqsoy5MxEZyCiY5ZmZWq0c81faic=
X-Google-Smtp-Source: AGRyM1taWusL4FY3+GMWFIszRF5v07rsqFPHyB0aYp0PK+HTRRFV65ppUhrxHJAFgTBDtn2UdlK/lwl57yxqpNliC0Q=
X-Received: by 2002:a17:907:a40f:b0:726:a8f5:1031 with SMTP id
 sg15-20020a170907a40f00b00726a8f51031mr5833402ejc.185.1656366151850; Mon, 27
 Jun 2022 14:42:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220626142053.3373970-1-trix@redhat.com>
 <f55999ae-4ff3-2616-fda1-a97e5aa11524@amd.com>
In-Reply-To: <f55999ae-4ff3-2616-fda1-a97e5aa11524@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Jun 2022 17:42:20 -0400
Message-ID: <CADnq5_Odt0jxU8voLjcmu8y1bQ57gzEd9ZBtAxrLLn9tHY65cg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Remove unused globals FORCE_RATE and
 FORCE_LANE_COUNT
To: Aurabindo Pillai <aurabindo.pillai@amd.com>
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
Cc: "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, Tom Rix <trix@redhat.com>,
 xinhui pan <Xinhui.Pan@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Wenjing Liu <wenjing.liu@amd.com>, Dave Airlie <airlied@linux.ie>,
 Jerry Zuo <Jerry.Zuo@amd.com>, Michael Strauss <michael.strauss@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 George Shen <George.Shen@amd.com>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jimmy Kizito <Jimmy.Kizito@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Jun 27, 2022 at 9:20 AM Aurabindo Pillai
<aurabindo.pillai@amd.com> wrote:
>
>
>
> On 2022-06-26 10:20, Tom Rix wrote:
> > sparse reports
> > drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:3885:6: warning: symbol 'FORCE_RATE' was not declared. Should it be static?
> > drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:3886:10: warning: symbol 'FORCE_LANE_COUNT' was not declared. Should it be static?
> >
> > Neither of thse variables is used in dc_link_dp.c.  Reviewing the commit listed in
> > the fixes tag shows neither was used in the original patch.  So remove them.
> >
> > Fixes: 265280b99822 ("drm/amd/display: add CLKMGR changes for DCN32/321")
> > Signed-off-by: Tom Rix <trix@redhat.com>
> > ---
> >   drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 3 ---
> >   1 file changed, 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> > index be1dcb0a2a06..f3421f2bd52e 100644
> > --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> > +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> > @@ -3882,9 +3882,6 @@ static bool decide_mst_link_settings(const struct dc_link *link, struct dc_link_
> >       return true;
> >   }
> >
> > -bool FORCE_RATE = false;
> > -uint32_t FORCE_LANE_COUNT = 0;
> > -
> >   void decide_link_settings(struct dc_stream_state *stream,
> >       struct dc_link_settings *link_setting)
> >   {
>
>
> Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
