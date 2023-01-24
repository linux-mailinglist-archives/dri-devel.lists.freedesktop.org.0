Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1842679FEA
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 18:15:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38AAE10E6D8;
	Tue, 24 Jan 2023 17:15:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B9310E6D4;
 Tue, 24 Jan 2023 17:15:36 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id t12so9839581lji.13;
 Tue, 24 Jan 2023 09:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hSk1VbDVxi60EqELjFZvsZAs+1Tfy6vZrRnEVpPCX9w=;
 b=dsu6oXAmNfAmOWKtUbAV9g+/pdseFauWkJEx4Ix2bJKs33m3VweHEkt+tVGkerzYG0
 iCYiXQQRut3JIh1AfAe3X8IA6fENeH0b2+9J808WtLLcn/syioWnpGsddODF/h2NxkUE
 tCxj5wo63rcAFt3yKPQ+XN7nB7jL5zKjKvIPreunREuovmhkg5uFEbfdLxop8eCCVYfR
 3GxJG5wzhPuamBU/Cd9cCEokQsI8FZazxNvEf2OzTX9WGAF6ThtuVPqo5vpRHfSHWioL
 PxjQ0+0E/wg80uiuPE6Li/AXDf/X3XdbY/hmW5zzLpmgC7EwUJmGjeGEUhFmjca3K/l+
 6zpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hSk1VbDVxi60EqELjFZvsZAs+1Tfy6vZrRnEVpPCX9w=;
 b=c6SiG1S8oBc0LX7WktW3FC1kWhTMvOQArAew6wKfMRR8J4KIUfCtE0LkM7T2vFfBMJ
 H4uVMNnAi3y8ma+Dai2fu4t/XMPTd4rrwHScKA5uF/D47Hc8VH2C81ZaLhzA99YIOeq7
 84qUmBtYqkV6xCoq7KVAB84vxv5/tLaxXLPo5Rz9WYWc9Et/TmB3CzyzT6Gb8x53CPFK
 WOmWjyrey1AcJrUtx8R4rXA+Vv/bvS6avLFmFZp2PksPv18G+DnQHKcolbccCKxWHohC
 t9YFr+hpL8+uBd1r8iWs89iVh7CTH5jXTBAKbHCjE7WpBzsXyPyUD4QgN/3w/Nrxrtul
 1PAg==
X-Gm-Message-State: AFqh2kqdwzA2fv42fNPfzDEyys8UndSxtiIlcggDYNAcTyr0+yUzNAjD
 BtPSoCFcsWfLR9PzWwkgNO8YMFbbJS3QPK5BuGM=
X-Google-Smtp-Source: AMrXdXvKjRdaSdDLoz0tT/ueF/YqzQ8wRbgEI3NiiYr7ekhV+7hlU3Y95tQO2mBjr0kprjfQ+mkaDhSsxxrsmWBvNg8=
X-Received: by 2002:a05:651c:154e:b0:28b:8d0b:b0cd with SMTP id
 y14-20020a05651c154e00b0028b8d0bb0cdmr2742512ljp.231.1674580535147; Tue, 24
 Jan 2023 09:15:35 -0800 (PST)
MIME-Version: 1.0
References: <20230124125726.13323-1-christian.koenig@amd.com>
 <CAM0jSHNmv-naGqB=R8DZc-3QhTPzzo4pUU2-NxhtiEhXMcAN5A@mail.gmail.com>
In-Reply-To: <CAM0jSHNmv-naGqB=R8DZc-3QhTPzzo4pUU2-NxhtiEhXMcAN5A@mail.gmail.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 24 Jan 2023 17:15:07 +0000
Message-ID: <CAM0jSHMgep0q9=C=fHw+Y8SqpNeN3Gz47u_UvwgJuGG3_0qgBQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/5] drm/i915: audit bo->resource usage v3
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 24 Jan 2023 at 13:48, Matthew Auld
<matthew.william.auld@gmail.com> wrote:
>
> On Tue, 24 Jan 2023 at 12:57, Christian K=C3=B6nig
> <ckoenig.leichtzumerken@gmail.com> wrote:
> >
> > From: Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com>
> >
> > Make sure we can at least move and alloc TT objects without backing sto=
re.
> >
> > v2: clear the tt object even when no resource is allocated.
> > v3: add Matthews changes for i915 as well.
> >
> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Ofc that assumes intel-gfx CI is now happy with the series.
