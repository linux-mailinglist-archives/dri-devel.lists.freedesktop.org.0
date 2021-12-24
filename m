Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0092E47EEA6
	for <lists+dri-devel@lfdr.de>; Fri, 24 Dec 2021 12:55:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64B8E10E3EA;
	Fri, 24 Dec 2021 11:55:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4752E10E3EA
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Dec 2021 11:55:43 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id a9so17075514wrr.8
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Dec 2021 03:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=0xcpi0Gitd25v86mG6F6era86f13f6qHaOx3JaAv2Wk=;
 b=Jb1E2qfhC1puRpMi6Q1ZzifIouvCGhE9PxgxYuTqMCWnqWRXhiCbyrOakGhZm9b5zK
 93yaF9Lu31EF5r3CFvyl+XwTHOpafxR5KRrSue2dGTsiAN7Pm+hIesvmqFeL4m6X4QsM
 Tv0Be197fSgjK1S5hczU4hWrsReIBovZ6qlhobfFlr0UelimWpFXg+uK3WFCpNCp8HVq
 Res88GuLYTcgLBPbpJ0yv/vgZn3mzSSvuEopldz6+dieWuIiUrOB+Kt1lw9LPUVhtGFD
 YQU6CaHGnBBW6ydj0V/Cu7dKOeagkdxZvt7zhVz8Sbn1hzHKWBOF5q4q2W13K+mXTMxK
 umyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=0xcpi0Gitd25v86mG6F6era86f13f6qHaOx3JaAv2Wk=;
 b=0CuKLLLDN7lLqRPjKtgrgyEO05O8voYfrQQ5hyKB5u+wP+rjtBhondW1t07fuCG3x1
 wlhiyWRBUdALVSIMPaLvv3XA9qkrF3m2RdqUHusumHwqnJ6FCybEByiKbBvbdFKanBIe
 /ph7Hd2wXZSgwyEwD6MH6rGoMiGm20mngqBNt6HbAhKl56np9UtNNIxrOj9AC2uNAuOE
 moSvreEtuktfUhzoKJ5QgM9cOqpuB33j9YnzjTHOMD+uXrDdeh8s9peQqAah+HOp3N7j
 9i9dmc2BwMTN3getDdMsjcQIT5TR2qfQye7XDi1TBie+8fAkoFfsN5IBsG/XbC6Y9G4t
 bPIA==
X-Gm-Message-State: AOAM5339nuB+/Zbcd72anAmbSVFm4eP4TiKx7Vtfo2Fgt0xcFcJPuwUo
 fna9DZpH5RG8LflSg3QIx3U=
X-Google-Smtp-Source: ABdhPJzCsvdI7GfNUjI1YJ/T3AOvfGvHVotvGVkPfECl5Rm8QPqkbWJmKa/QqxDA6GFj5QWv70EEBA==
X-Received: by 2002:a05:6000:50d:: with SMTP id
 a13mr1867759wrf.538.1640346941695; 
 Fri, 24 Dec 2021 03:55:41 -0800 (PST)
Received: from elementary ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id u10sm7697029wrs.28.2021.12.24.03.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Dec 2021 03:55:41 -0800 (PST)
Date: Fri, 24 Dec 2021 12:55:37 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Melissa Wen <mwen@igalia.com>
Subject: Re: [PATCH 0/3] drm/vkms: add support for multiple overlay planes
Message-ID: <20211224115537.GA9505@elementary>
References: <20211213181131.17223-1-jose.exposito89@gmail.com>
 <20211223203525.4sr7rjfq6l42il5r@mail.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211223203525.4sr7rjfq6l42il5r@mail.igalia.com>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Melissa,

Thank you very much for your review.

> On Thu, Dec 23, 2021 at 07:35:48PM -0100, Melissa Wen wrote:
> What test did you run? Indeed, not all kms tests are passing and fixes
> are welcome :)
> 
> Last time, I used these testcases for overlay: kms_plane_cursor,
> kms_atomic; and these tests were fine too: kms_cursor_crc, kms_writeback,
> kms_flip

For the different patches I have been working on I have tested mainly
with kms_atomic, kms_plane_cursor and kms_plane_alpha_blend.

For some reason, kms_cursor_crc suspends my PC. I still need to
investigate the cause.

I'll include a table with success/skip/fail tests before and after
the patch on v2 :)

> However, I think we need some limits for this number
> of planes. I would suggest to just expand the enable_overlay option to
> expose a predefined number of planes
> [...]
> I don't have a strong opinion on an exact/practical number. I took a
> quick look at other drivers and exposing 8 planes seems reasonable to
> me.

8 planes sound reasonable to me, I'll change it and send a revision
of [1] as well using the new constant.

Thanks again for taking the time to review this,
José Expósito

[1] https://lore.kernel.org/dri-devel/20211223081030.16629-1-jose.exposito89@gmail.com/T/
