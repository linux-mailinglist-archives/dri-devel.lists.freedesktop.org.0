Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF82B6738F8
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 13:50:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D3E10E91C;
	Thu, 19 Jan 2023 12:50:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9038210E91C
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 12:50:25 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-4a263c4ddbaso25970487b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 04:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XWPe8lMsNIn5MpU7AWRIX9vNDGuy1qSft5sgquaATHc=;
 b=HoMgkebZ3+T/seK808jm3kekSni4b8f1A2IriZ9VTyWqhxV9+lZfDMmvLHLQm+HQcU
 fGgU0Xtp3RaKBx6f2CAv225v6hWEexeFZqBk4fJ8q1EszJHxDhwRwjm93lUlOwFlveY/
 rcHopcFI9Wac9A/YaYx0Lr0hDZVa7xV+loiEFjKopdOLpoAw4SX7es9cKTl0jOtsPUMy
 G97zXzZKn+pfVS1zlSC88/BZcauI8GeoKkDMSkkZBCwCDKUKt4hsBufmCC46iBtNmaFS
 EIStqGsX/PGfYK+JsjPU66n3tov1UwC0Sd28omsaHNl9ZKSVcIu+S3XDYWPcRrfIdrkc
 E6qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XWPe8lMsNIn5MpU7AWRIX9vNDGuy1qSft5sgquaATHc=;
 b=wky+FClH/38cSyv8M8XtLuflaETtSEPxbzDP2xqW5W5LSLoF8Bxf5dP2coG6aBFoz6
 qpF5XStpMI0H2OS1khqHBR3M7BpJoP2ow5/cuf82pSm8EmRacgICiDQukegU0x7/8H3Y
 FDX7oEESnM2+SU+33lCFQtt4rkUG8kyAtopFqxarf0dGO3RKqsbSy9aYfT3wLEZ5IR0m
 xfqFKIcdXddhgs6V+Rzc+cHrCfoHgX3X68w9ZbLQfWv3KJXkR5od9XmQzZTUDLErv8T3
 sX9AONdUppbnfaA+IHCgMrjfSO7nnZow6DjnrxYhL4rPfzQzkyNlfQ79EMHal4CxEwkR
 i+ew==
X-Gm-Message-State: AFqh2kqMMLewMDoM39p1Vv5O9Q6hGvQlvzSdlQBfN1E9JudTL30ngQ1P
 6Jz+WIc9FOvMeYaDwqJZBNLW+2RABqYFyK6pAQw=
X-Google-Smtp-Source: AMrXdXujEFtTCFJvUY2a98P/h5K4WuhJ3AH9H35P8e06ZNdnJ1KvvZ8Iabcow+S3Rzql8EBeLIu8H8b3uhfPXqKup4E=
X-Received: by 2002:a81:351:0:b0:36c:aaa6:e571 with SMTP id
 78-20020a810351000000b0036caaa6e571mr975201ywd.467.1674132624237; Thu, 19 Jan
 2023 04:50:24 -0800 (PST)
MIME-Version: 1.0
References: <Y8arJvmo7dLsAYlX@kili>
In-Reply-To: <Y8arJvmo7dLsAYlX@kili>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Thu, 19 Jan 2023 14:49:57 +0200
Message-ID: <CAFCwf110g-KLNmLOOA2dwPqzp2=WKiHP8V5TzhzwDOhCYmD2Xw@mail.gmail.com>
Subject: Re: [bug report] habanalabs: add debugfs support
To: Dan Carpenter <error27@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 17, 2023 at 4:05 PM Dan Carpenter <error27@gmail.com> wrote:
>
> Hello Oded Gabbay,
>
> The patch c216477363a3: "habanalabs: add debugfs support" from Feb
> 16, 2019, leads to the following Smatch static checker warning:
>
>         drivers/accel/habanalabs/common/debugfs.c:272 vm_show()
>         warn: sleeping in atomic context
>
> drivers/accel/habanalabs/common/debugfs.c
>     241 static int vm_show(struct seq_file *s, void *data)
>     242 {
>     243         struct hl_debugfs_entry *entry = s->private;
>     244         struct hl_dbg_device_entry *dev_entry = entry->dev_entry;
>     245         struct hl_vm_hw_block_list_node *lnode;
>     246         struct hl_ctx *ctx;
>     247         struct hl_vm *vm;
>     248         struct hl_vm_hash_node *hnode;
>     249         struct hl_userptr *userptr;
>     250         struct hl_vm_phys_pg_pack *phys_pg_pack = NULL;
>     251         struct hl_va_range *va_range;
>     252         struct hl_vm_va_block *va_block;
>     253         enum vm_type *vm_type;
>     254         bool once = true;
>     255         u64 j;
>     256         int i;
>     257
>     258         if (!dev_entry->hdev->mmu_enable)
>     259                 return 0;
>     260
>     261         spin_lock(&dev_entry->ctx_mem_hash_spinlock);
>                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> This is holding a spinlock.
>
>     262
>     263         list_for_each_entry(ctx, &dev_entry->ctx_mem_hash_list, debugfs_list) {
>     264                 once = false;
>     265                 seq_puts(s, "\n\n----------------------------------------------------");
>     266                 seq_puts(s, "\n----------------------------------------------------\n\n");
>     267                 seq_printf(s, "ctx asid: %u\n", ctx->asid);
>     268
>     269                 seq_puts(s, "\nmappings:\n\n");
>     270                 seq_puts(s, "    virtual address        size          handle\n");
>     271                 seq_puts(s, "----------------------------------------------------\n");
> --> 272                 mutex_lock(&ctx->mem_hash_lock);
>                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> so it can't take a mutex or it leads to a sleeping in atomic bug.  These
> can be detected at runtime by enabling CONFIG_DEBUG_ATOMIC_SLEEP.
>
> regards,
> dan carpenter

Thanks Dan,
We will fix that.
Oded
