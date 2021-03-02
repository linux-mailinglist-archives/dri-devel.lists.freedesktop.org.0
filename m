Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF2132A884
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 18:51:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD46E6E97F;
	Tue,  2 Mar 2021 17:51:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9642C6E159;
 Tue,  2 Mar 2021 17:51:17 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id v12so19712791ott.10;
 Tue, 02 Mar 2021 09:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wbXZh+y7Wwg/hAULiKSl5XcTTJtTCwhI9jiu/kuN7UU=;
 b=TpxZtlx9zhSj5DDnDsYDla0q4cE4cGz3bke3+P6NzMosLpXoRLfFhOR+4q1q4iNdt9
 Us/EyQ3dq9wGSQK3IXeDBbioRv8i366HWBIfEMxDQ4mXNhhzhb0WC27LQ/omHh4k8+jz
 KWjh8/3Wfjr47eA+kvLj//+JNSZux8xNyLLKIcSDdFMMaSfgUnMwXxKMC1IStHsBWno2
 hD6cYKKOyvZItGEhPwErlJGvycxSTS9ycmdRowc9KvOZ5X5IfEjt69DFpySEfUqwmX/L
 moGAb6FhFwY9GcmNI5XSCW9lcI53YETfrgtHcZNye2VyW10iFdtK/EhLL8TuWLDJBFt2
 JFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wbXZh+y7Wwg/hAULiKSl5XcTTJtTCwhI9jiu/kuN7UU=;
 b=KtzBN+Ct3uNWuI6Z4UsEZctxN7S3bFFeHHaITbtUiZmdZgCMDco3DziJ+XFz5zeZiv
 rPEGP6ITl455/G+8lbFOb2/bRNrzlWhR6MU2ESvFG5u0oIuOhoE4vo+rvPGe2bxrzv+9
 HfLXYrDi++bbqg8eLO0vX5vnnzsBoR9iB48HyGRtxyaThnEj1yOqSI4spLcHsArA0V2W
 ZsW4098IM7zGgkBdPlYokzmqP21lL4zgtRKvrjvLhgp8l4Q7BfsOniSBBkf4SWxwnapQ
 Q1QPrno3x+6vqmNhDIPiR5meg5RGmARDgXWBq3CsCWIC6h8mqi7bwNos4YQg6YOZNVEa
 WwZg==
X-Gm-Message-State: AOAM532yoMWYdtlZIxrkFUG9NYUXwJT9YTUr5FwJy0Ov8exrjLXYONqY
 musn7g1FNKVMjNtcH6VTkuYvaI+2Akag26eGTEQ=
X-Google-Smtp-Source: ABdhPJyiLqxx0zpTF7yD/rJdXT8zQnIclm83GIlN1LSHj9qFzjDCbyr3HFtAZ/1Q1a4kGUf8K0Cr8EnDa0ewPwwwXnQ=
X-Received: by 2002:a9d:20c3:: with SMTP id x61mr8005751ota.311.1614707476945; 
 Tue, 02 Mar 2021 09:51:16 -0800 (PST)
MIME-Version: 1.0
References: <20210302140509.8466-1-colin.king@canonical.com>
 <b9a11c62-f469-8f5b-9585-74b73cd5a9db@amd.com>
In-Reply-To: <b9a11c62-f469-8f5b-9585-74b73cd5a9db@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 2 Mar 2021 12:51:05 -0500
Message-ID: <CADnq5_Nrg_L+9vFhsxbbeimSvWM2xkD7Og8aARmYGSMUE9rx+Q@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/display: fix the return of the
 uninitialized value in ret
To: Harry Wentland <harry.wentland@amd.com>
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
Cc: Anson Jacob <Anson.Jacob@amd.com>, Leo Li <sunpeng.li@amd.com>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin King <colin.king@canonical.com>, Mikita Lipski <Mikita.Lipski@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Tue, Mar 2, 2021 at 10:03 AM Harry Wentland <harry.wentland@amd.com> wrote:
>
> On 2021-03-02 9:05 a.m., Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > Currently if stream->signal is neither SIGNAL_TYPE_DISPLAY_PORT_MST or
> > SIGNAL_TYPE_DISPLAY_PORT then variable ret is uninitialized and this is
> > checked for > 0 at the end of the function.  Ret should be initialized,
> > I believe setting it to zero is a correct default.
> >
> > Addresses-Coverity: ("Uninitialized scalar variable")
> > Fixes: bd0c064c161c ("drm/amd/display: Add return code instead of boolean for future use")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> > ---
> >   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > index 5159399f8239..5750818db8f6 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > @@ -530,7 +530,7 @@ bool dm_helpers_dp_write_dsc_enable(
> >   {
> >       uint8_t enable_dsc = enable ? 1 : 0;
> >       struct amdgpu_dm_connector *aconnector;
> > -     uint8_t ret;
> > +     uint8_t ret = 0;
> >
> >       if (!stream)
> >               return false;
> >
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
