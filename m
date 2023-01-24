Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CEA679A80
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 14:49:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A6010E0D0;
	Tue, 24 Jan 2023 13:49:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA46C10E0D0;
 Tue, 24 Jan 2023 13:49:19 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id y9so13001246lji.2;
 Tue, 24 Jan 2023 05:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HbUZFl3KBtqrpF7jmye17FLvaf1aw5yLVUzpUk2Fxgo=;
 b=hpA4Wqn7oRev/4AHiUznsOaNlGwFkItnFHqmFLFWlcEFWxErUhIyktG3c2E0BCY6W4
 rRz6YA4xB1Pr1opM8NWGgQ4MEuoABKLwEy0McE40Fdv7GPutMwzPvzUn4UxooU6Y8n7f
 +n69XtesbKlS1kUkPq7MDuCV/IwRUgpX7PwlYhCICp0mNAGKO3zAUN3wWyqYYqDp8qGt
 8CwrOiJ9eRAm3luPGIRZicp1+zjh3V/BxmSyFHiIAOwo2IheTZL0oSH7adW5lYypSCPl
 Dspn1jySWhVZ+fkh+s733bpS+WekIti0hjYRrrB9F48LFZYXSp81jHXAVdIr2ddVduVc
 K3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HbUZFl3KBtqrpF7jmye17FLvaf1aw5yLVUzpUk2Fxgo=;
 b=2egqVwyTuVt52tbfI6l0M7tMDMNSgnM4HQhb+c+2ZtFL9vpe8UytC9ksGg+jZFaQBS
 rfm+YfT1avCxmJpnF1fs8qZ1HI5kQS2wjsu4Fhfpmi63x3fFNx2nsm1art4dBhMijP+m
 J7CHHpSWs96SVhYiv41EBvhcGTjusbV/xsUA+ttE+M4lD+Ehll3/8/QFK0jW2enNHUpJ
 jjgN+enIqfqMi1UeWxJfG26mroLLgAZm36lRC6rFZfwF7fMsOjKjWOo3yyDWeBmSRQ4f
 KHuNXLOLRoMMf5rLNTG7qKLkD1DcVbO4VqFgntgigeOPLfVqz9SgmEoFyfwzX3nrui8f
 BhBg==
X-Gm-Message-State: AFqh2kr1SHerc0XxeORpLvEO8kod11x3qizs1YZKVvgVtV4xO9YYeBl9
 0caNbQv+7HwseaVDlxyoy/vzxtDgvzHLAg+Z+BRp0Sb7Q3c=
X-Google-Smtp-Source: AMrXdXuTIPkH2sD4slrDqlW8wYTVd1gTEjrazs4qPFoQhyWTzxg2qHECAWM62Ej9YSVG3J5VBi5Chx4tfwxaVXWbjJk=
X-Received: by 2002:a2e:82cf:0:b0:28b:bde3:7871 with SMTP id
 n15-20020a2e82cf000000b0028bbde37871mr876301ljh.269.1674568158101; Tue, 24
 Jan 2023 05:49:18 -0800 (PST)
MIME-Version: 1.0
References: <20230124125726.13323-1-christian.koenig@amd.com>
In-Reply-To: <20230124125726.13323-1-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 24 Jan 2023 13:48:50 +0000
Message-ID: <CAM0jSHNmv-naGqB=R8DZc-3QhTPzzo4pUU2-NxhtiEhXMcAN5A@mail.gmail.com>
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

On Tue, 24 Jan 2023 at 12:57, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> From: Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com>
>
> Make sure we can at least move and alloc TT objects without backing store=
.
>
> v2: clear the tt object even when no resource is allocated.
> v3: add Matthews changes for i915 as well.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
