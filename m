Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C00720934
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 20:34:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6854010E603;
	Fri,  2 Jun 2023 18:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44FC10E0E1;
 Fri,  2 Jun 2023 18:34:44 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id
 d75a77b69052e-3f7fdbdf68eso24421291cf.1; 
 Fri, 02 Jun 2023 11:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685730883; x=1688322883;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pCpdjBkJUYgIy9lNltbYiGa3ZgStuC7RDZQxLOMxnlo=;
 b=YAVrRpCA2UMmYHvmJbk3bTP777NMTxLn6l7Iu6WymkuXcQ0o0yVgICNoiVRFD7AJ2e
 v5F+FNIhKvv7iUOqXZT+rwWI4fAi4aNUQU7ydLsn4LmYp9fQyt57it/WUr26HBVGOVTo
 gFmitNcKvKdq98nIyMM8PV7OnkwxE5RvJEqrNaBmBbzZKMgU9lWDBt57Hp2yS43Jmr8C
 VDEiCrETvN+Da7pijaOZF12PWB98HN2avwJ7mGcpERtzMaQud2yK6e6tf0Gbwoo6Ta/l
 0qbOahNCh/jQFqdqcLeeJRDus/bsHenY8K9IdumDPegWX4J5bBAhd9JRopvt96CxoNFh
 2aOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685730883; x=1688322883;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pCpdjBkJUYgIy9lNltbYiGa3ZgStuC7RDZQxLOMxnlo=;
 b=jKu2WKH5q8BWyEUREq3W4TN8ML3QCQQOg86rvKEfMnfo1HvKwtC+fmSCS3mi1an7i+
 UC0ZGzZubBf1DobmkZD4jzrWxt3k+mw1lFkPziSekTA0DewF8XLziP4FXim+72J6sEZj
 67N0Xs1Yzs7XNYTbtiuOu8gGv/koahcG1NIHQaXEV1i1WHu/qkvYJMzF617T05f6ET4j
 9OAsc7vEd2qWFHjmedgpYLZJRJin0nYeWix13vPpq58Jp3Dw+48fZ/p+JRMvop4SD8ck
 fswdkIs1MxmoraA0vwpJlPNABgVccUswAhT5o/hKem+SFmBipT9v4RWZy34LgxoLQWyi
 rJjw==
X-Gm-Message-State: AC+VfDwicZtocZnxxQWFZsxsYgFPgfSmLZSnjVWgMyaylcrHYO6F9yS/
 0kqJlIppg1wS6F1AD/tsk5ewGNBNwo9ec7gOvDi1Drdm
X-Google-Smtp-Source: ACHHUZ6ddlIl1+vBO8rCXN3FsE7YAPPqd/gZ7JG3nMzrTa+Henmjmwa66Dam8+jtNM3QCKQhQ94Yn+n8o9qtcuYzxUM=
X-Received: by 2002:a05:6808:15:b0:389:4f7b:949d with SMTP id
 u21-20020a056808001500b003894f7b949dmr707601oic.22.1685730458405; Fri, 02 Jun
 2023 11:27:38 -0700 (PDT)
MIME-Version: 1.0
References: <ZHO4/Z+iO+lqV4rW@work> <202305301608.2982BD3CAF@keescook>
In-Reply-To: <202305301608.2982BD3CAF@keescook>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 2 Jun 2023 14:27:27 -0400
Message-ID: <CADnq5_O6fzoCOo5YEAEv=D8ComZaYShx5ot=TQBmdFf8ReEKrg@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amdgpu/discovery: Replace fake flex-arrays with
 flexible-array members
To: Kees Cook <keescook@chromium.org>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, May 30, 2023 at 7:08=E2=80=AFPM Kees Cook <keescook@chromium.org> w=
rote:
>
> On Sun, May 28, 2023 at 02:26:37PM -0600, Gustavo A. R. Silva wrote:
> > Zero-length and one-element arrays are deprecated, and we are moving
> > towards adopting C99 flexible-array members, instead.
> >
> > Use the DECLARE_FLEX_ARRAY() helper macro to transform zero-length
> > arrays in a union into flexible-array members. And replace a one-elemen=
t
> > array with a C99 flexible-array member.
> >
> > Address the following warnings found with GCC-13 and
> > -fstrict-flex-arrays=3D3 enabled:
> > drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:1009:89: warning: array s=
ubscript kk is outside array bounds of =E2=80=98uint32_t[0]=E2=80=99 {aka =
=E2=80=98unsigned int[]=E2=80=99} [-Warray-bounds=3D]
> > drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:1007:94: warning: array s=
ubscript kk is outside array bounds of =E2=80=98uint64_t[0]=E2=80=99 {aka =
=E2=80=98long long unsigned int[]=E2=80=99} [-Warray-bounds=3D]
> > drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:1310:94: warning: array s=
ubscript k is outside array bounds of =E2=80=98uint64_t[0]=E2=80=99 {aka =
=E2=80=98long long unsigned int[]=E2=80=99} [-Warray-bounds=3D]
> > drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:1309:57: warning: array s=
ubscript k is outside array bounds of =E2=80=98uint32_t[0]=E2=80=99 {aka =
=E2=80=98unsigned int[]=E2=80=99} [-Warray-bounds=3D]
> >
> > This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
> > routines on memcpy() and help us make progress towards globally
> > enabling -fstrict-flex-arrays=3D3 [1].
> >
> > This results in no differences in binary output.
> >
> > Link: https://github.com/KSPP/linux/issues/21
> > Link: https://github.com/KSPP/linux/issues/193
> > Link: https://github.com/KSPP/linux/issues/300
> > Link: https://gcc.gnu.org/pipermail/gcc-patches/2022-October/602902.htm=
l [1]
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
>
> --
> Kees Cook
