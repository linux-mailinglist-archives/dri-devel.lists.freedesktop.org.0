Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2190276D08D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 16:49:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2212C10E1FF;
	Wed,  2 Aug 2023 14:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1352C10E1FF
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 14:49:34 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-522ab557632so6613932a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 07:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1690987771; x=1691592571;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aKHkYl6IMr8QnTnvT30Nci/brg8p0pHZBfK3BKGZxuI=;
 b=Pq+bTdD5N+DD8rAc1KC2k90a8XMV7LkhjQxc3v2pKh8PnyU7kWBUdsFCQYpNZVV6EC
 hzVPKhAtO4Dpsdb/K/SlkDd+P9SNEHV3MuzO6agsVMjk+NVzIYXSPtfWY+zU55J+LMFw
 U4vErh2k/QNPBEBRDrUuqt7etJP9KBld9i0PU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690987771; x=1691592571;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aKHkYl6IMr8QnTnvT30Nci/brg8p0pHZBfK3BKGZxuI=;
 b=NUOhwrkuTnUhYLL88JY+jJu3jEsZcQPGb/9RRUPX7N7TIy7HNZ7MmOm/nAh75rFrHu
 Eo+Ke5Qsbv/RDm7D/A5f8ezUSLZ/vfKinUq2gN7eEnrqYgzOqRynXbF78g1aESRLibey
 Xd809DcaL+a7FQBJ9HiI2rCc70pS7uGIfPyM4xoaQLKl5/SuMouLG3u1I6EuWdpODuFr
 UX7d5OHeyCbZbFYlBJo9RD5sfLO6Zx5meiVghx3qgumXYAk8ml0+o622qzb8avPgyCu/
 7hMEK1J8avwrjr4Ze1A8QdLijIKyFH7c1mCCLQQOAtElJaouMkqdO/dghuLl/6UyowST
 vKKg==
X-Gm-Message-State: ABy/qLa6efZ1qX8mQTePI0m+oqvPJpn+7BeKM1bAp5zYLlsba1SJUlQv
 xGRgV5kcqYcFLTF+uBhqNvC3OzsCn6JKom9fYKHZBGqa
X-Google-Smtp-Source: APBJJlHhuyYD0iaIOu1IfDn0qf5OJZPW7Fx/3e42DIGGr0qnIHT3y0yRMVQfQuYjO/10MI13s7NoYQ==
X-Received: by 2002:a50:ed91:0:b0:522:30cc:a1eb with SMTP id
 h17-20020a50ed91000000b0052230cca1ebmr5784905edr.0.1690987771247; 
 Wed, 02 Aug 2023 07:49:31 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com.
 [209.85.208.42]) by smtp.gmail.com with ESMTPSA id
 b9-20020a05640202c900b00522295516c4sm8676946edx.90.2023.08.02.07.49.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Aug 2023 07:49:31 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5229e0603edso11014a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 07:49:30 -0700 (PDT)
X-Received: by 2002:a50:9f84:0:b0:521:f642:7183 with SMTP id
 c4-20020a509f84000000b00521f6427183mr415975edf.1.1690987770404; Wed, 02 Aug
 2023 07:49:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230802141724.0edce253@canb.auug.org.au>
In-Reply-To: <20230802141724.0edce253@canb.auug.org.au>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 2 Aug 2023 07:49:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V4RmorrEu9oGrW+ovBXn+nC_APVhH-M+mHHXYoYLYRPQ@mail.gmail.com>
Message-ID: <CAD=FV=V4RmorrEu9oGrW+ovBXn+nC_APVhH-M+mHHXYoYLYRPQ@mail.gmail.com>
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

On Tue, Aug 1, 2023 at 9:17=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>
> Hi all,
>
> After merging the drm-misc tree, today's linux-next build (htmldocs)
> produced this warning:
>
> Documentation/gpu/todo.rst:469: ERROR: Unexpected indentation.
>
> Introduced by commit
>
>   d2aacaf07395 ("drm/panel: Check for already prepared/enabled in drm_pan=
el")

Thanks for the report. I've posted:

https://lore.kernel.org/all/20230802074727.2.Iaeb7b0f7951aee6b8c090364bbc87=
b1ae198a857@changeid/

To fix this one.

-Doug
