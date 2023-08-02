Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D5576D097
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 16:50:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C1310E545;
	Wed,  2 Aug 2023 14:50:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D50C10E545
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 14:50:10 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-52229f084beso10553861a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 07:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1690987808; x=1691592608;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lCYYmzNqtzxNv8UbxN3uv60kE4E3C48+cD2+0APdVk8=;
 b=bfwUet4qi7yyF7aKFOmhonqH5OcPqZZdq/h8mIfyRqAlamxsMsBJLoJX72eyQyg8kZ
 rgqPuYe4+k77PaeBmcB+78yVr0g0gs6KfZ2378hHcDiu0S+vbibTZzmrojhRi5ur+uaT
 cZeIwEtlFiDH4a7ak6yKOdnGaii8cT5vATQBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690987808; x=1691592608;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lCYYmzNqtzxNv8UbxN3uv60kE4E3C48+cD2+0APdVk8=;
 b=VTjHA6Cbq+oAyTn4Y35TU9hRvG1jdUlotRM8+cYbTRt/pKq/EQKWTyIZu4EQdnZD7u
 RCWcsGG9p7T7isDm8+zzy25JNrEhZkq7URM0QPfruA1aN/9GWJpClmiqcdn7nC6HdoHe
 rNI+gbShk5xfoyYMlCvD8sAjiumZhi+99Inr6MAyUK6XdpMtEybIz3oI4AZOR996YYWm
 hLZfuMeeQB/nG3ZBApx5lgrhxs2EYWaAVEXZYdPxFJ0U8+vy2ztODk5O1CdIyyYp/bHu
 pXJphej3gWeqhDdVq962OXeU5gipNr1neoJX7PNIHnXqHGs/zrSjoOrHkNw+NeESjzIF
 qKBQ==
X-Gm-Message-State: ABy/qLYgvc4JBhMM+wCAWJb9kg+jKKpW6yiLrZhM3VqD8yMZD0y0Rpdl
 Fo3eSbVdBXfmggMGp+S96msQwRZaJScuD//v2z/NLZae
X-Google-Smtp-Source: APBJJlHd2F7MJZSM4OSpFqDHszF6rnGQW9DwmaZYgCSBplEwgI+ts6mpg1f+rLwZyLKcnUVnBNukcQ==
X-Received: by 2002:aa7:df18:0:b0:522:20a0:7eb8 with SMTP id
 c24-20020aa7df18000000b0052220a07eb8mr4994538edy.33.1690987808539; 
 Wed, 02 Aug 2023 07:50:08 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com.
 [209.85.208.42]) by smtp.gmail.com with ESMTPSA id
 u19-20020aa7d993000000b005222aee9ef9sm8553667eds.97.2023.08.02.07.50.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Aug 2023 07:50:08 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5229e0603edso11022a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 07:50:08 -0700 (PDT)
X-Received: by 2002:a50:d70e:0:b0:522:203b:c348 with SMTP id
 t14-20020a50d70e000000b00522203bc348mr412547edi.5.1690987807863; Wed, 02 Aug
 2023 07:50:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230802142136.0f67b762@canb.auug.org.au>
In-Reply-To: <20230802142136.0f67b762@canb.auug.org.au>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 2 Aug 2023 07:49:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XEbpuMb4FvDkVkkX+Btig4eFnNrp5LWs+rQJ9Sy3wg4w@mail.gmail.com>
Message-ID: <CAD=FV=XEbpuMb4FvDkVkkX+Btig4eFnNrp5LWs+rQJ9Sy3wg4w@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the drm-misc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Aug 1, 2023 at 9:21=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>
> Hi all,
>
> After merging the drm-misc tree, today's linux-next build (htmldocs)
> produced this warning:
>
> include/drm/drm_panel.h:270: warning: Function parameter or member 'follo=
wer_lock' not described in 'drm_panel'
>
> Introduced by commit
>
>   de0874165b83 ("drm/panel: Add a way for other devices to follow panel s=
tate")

Thanks for the report. I've posted:

https://lore.kernel.org/all/20230802074727.1.I4036706ad5e7f45e80d41b7771642=
58e52079cd8@changeid/

To fix this one.

-Doug
