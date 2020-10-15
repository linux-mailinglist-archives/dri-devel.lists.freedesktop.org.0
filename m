Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB48828F55A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 16:55:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C271A6ED2D;
	Thu, 15 Oct 2020 14:55:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F106ED2D
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 14:55:46 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id az3so1984813pjb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 07:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jKGNDvBuOCdT1yr1OAnStWIR39+3aQIsDj8WBAcZsDg=;
 b=RzBbuNX55AkV0knsLOkGF9hT+iQ6TA9uXEJvnoqlxSSxOGJJ89WDKDAAO/jjsyKqhO
 dixblUBWb8TfhnvOqW34Y5eI9bGggdwLzUABQftNtDgmuF8PgS96F1ziXoIU1GB+0Cl1
 y82qBiLhx26ZU/QaA24dFeqHNwDouXb+36dCjHeQyLWXB41F1zY11G5wzpWF8NJtuolP
 kZAOVxzer+TG9oFMfEZm5WITRtTRWe7OCofMGGqG2HN3X/xS8pnHznpClq5YSU7GXlTf
 PJrg9cElpgG48eyYGNOgJkxPu0C04BgciMmsIzBVJFqx6hh+i1jRWc72mejrslWBwuDK
 KEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jKGNDvBuOCdT1yr1OAnStWIR39+3aQIsDj8WBAcZsDg=;
 b=KFd7zAyx1k730a48d5kTXjabsTsFPqxKTfEVm2nxBlyFRNRj1O1htaEjQ9VKRUlW2y
 QvuTYK0boKVm9waqVoxBxjH98S8v4FCoD+1KYX5OLYIaV1N0omuoVh8KwFRghF9XgXdv
 hgr558TnJb0YiU7Dkdmp6MxvCoHj+1RVKSqL39mrCcCRGonSxo8g/8UGGFjVSE82fAvC
 mrSuxnRsG/m0ZuVLt3EohqsIUC59VVJE0uPN5tG9QDhnhP8du2rCx/9FMvj7olHbFX+Q
 HJ3okqu3IUKke0x7kAfuPfBOZu6xRAxtCh7Fk1JwB9qVQ4FIpvxqK5p4NR4YbR9INKb2
 A3LQ==
X-Gm-Message-State: AOAM531QA1szG37Vt244AQSRmvMHyUtiuvJ0lM1CxDCQT75tgFvlxm5s
 CzAeM5tTcKEkF4KFHEML6g==
X-Google-Smtp-Source: ABdhPJzG/yJAmivQvWbT3J44c3W+PvWfg/FLqG8LS60pD3/iqP34CghyZ4gJrChbSxgQnEnvf7AzJQ==
X-Received: by 2002:a17:90a:d146:: with SMTP id
 t6mr4749223pjw.76.1602773745761; 
 Thu, 15 Oct 2020 07:55:45 -0700 (PDT)
Received: from PWN ([161.117.80.159])
 by smtp.gmail.com with ESMTPSA id x30sm4390288pge.59.2020.10.15.07.55.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2020 07:55:45 -0700 (PDT)
Date: Thu, 15 Oct 2020 10:55:38 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [git pull] drm next pull for 5.10-rc1
Message-ID: <20201015145538.GA277615@PWN>
References: <CAPM=9txyMmW1DWhS--SuYQu4qDK1GPzgHJwxbAfhHT=hUsPODA@mail.gmail.com>
 <20201015135932.GA277152@PWN>
 <CADnq5_PqhJFRDofb0pNsgrp7O8M_D9o3gz5_Nt8KL=0cgMWoKA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_PqhJFRDofb0pNsgrp7O8M_D9o3gz5_Nt8KL=0cgMWoKA@mail.gmail.com>
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
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 15, 2020 at 10:53:28AM -0400, Alex Deucher wrote:
> On Thu, Oct 15, 2020 at 9:59 AM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> > It has been applied to linux-next twice, for unknown reasons. Thank you!
> 
> The patch was already in drm-next, but since it was a bug fix it was
> applied it to 5.9 as well.

Ah, I see. Thank you for the explanation!

Peilin Ye

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
