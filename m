Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 564D666DFEA
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 15:05:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E691810E545;
	Tue, 17 Jan 2023 14:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1867B10E545
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 14:05:38 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so25895116wmb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 06:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e5J02xE8mUBuOyTaMs1fpMdC/yBvddfmQvk7gILrt3k=;
 b=pQcmKupVsvz9oZ0n0y09R2nHVtAIgQUc8W4jr3qXWwiJz2jhwpRhtJVYXU1SHqlwA/
 fFz9ME8ZIRvsI3pB61C5s151g2Jl9oxSJNpftOPTqXBo9y2rQuip6o7R2rxqlVzPDxm6
 bpaxmDOynmHjV2BzmsnYu8/2kdtLSHbRVOkD0NVrZHHVUon4nYA1wxKpvYtVwZ3qu7JI
 vkdYU6TCD2A3FScmSh2iWzrO+zMBJxO276DD3l7zs3iIZPcR7o7tlYeN/6uU6x2Z9jJK
 LHcXHUZ5TKeKeZXnaEB+PB/3W8kGCO4Jx//aPL+IcZjkbLqpk2+eSxkjetlfF/fYmDrd
 XN0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e5J02xE8mUBuOyTaMs1fpMdC/yBvddfmQvk7gILrt3k=;
 b=NnTqgOW/C7hP0G0PQnTb+UQptdXP49i4TXutqaQGALzX+tmZ2Q6+DRsE81FZRzJBSs
 y6sxCwzneTYzVa7vNK1u1k8Bf59GIWjm1MLUmRUEF5pBYY2oREIoH+0lFwFQrBvxI0Lp
 NnAaDs1x1bnvF42BKBoyN9+LYEfCf2JzenA91qpk/UZ4Qkd5xor3mnmpJVS9y3Y4unrl
 FNp17HicPHVmkQb5KDMNnN9E6lillQD8ZLkkonB4DwvIQ2dx0JQlw25DPDbgvq01Cjwa
 7PC5Kte7ybmzmd8Tig63Jh9ujwLOUAKsRJLMYcSpTf/CRtVDHzDopdzE+PbNEdh6wT/Z
 Xxfw==
X-Gm-Message-State: AFqh2krrxc+hKOwQiPHkpWFAKpaV6n9srhQPHp/sP9xH9hlkujs9nR7W
 KGKn6tQINuL10AGEm0qUR7X5fgOxQ1s=
X-Google-Smtp-Source: AMrXdXtW+J84+oFvHHLWzR0ooIydaGGB5ntOhq6BJALOKmiCgECB+wt4NNa0l0mZc3+MslEp3qwYnw==
X-Received: by 2002:a05:600c:b90:b0:3d8:e0d3:ee24 with SMTP id
 fl16-20020a05600c0b9000b003d8e0d3ee24mr3322792wmb.37.1673964336496; 
 Tue, 17 Jan 2023 06:05:36 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 24-20020a05600c231800b003db07420d14sm2035153wmo.39.2023.01.17.06.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 06:05:35 -0800 (PST)
Date: Tue, 17 Jan 2023 17:05:26 +0300
From: Dan Carpenter <error27@gmail.com>
To: oded.gabbay@gmail.com
Subject: [bug report] habanalabs: add debugfs support
Message-ID: <Y8arJvmo7dLsAYlX@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello Oded Gabbay,

The patch c216477363a3: "habanalabs: add debugfs support" from Feb
16, 2019, leads to the following Smatch static checker warning:

	drivers/accel/habanalabs/common/debugfs.c:272 vm_show()
	warn: sleeping in atomic context

drivers/accel/habanalabs/common/debugfs.c
    241 static int vm_show(struct seq_file *s, void *data)
    242 {
    243         struct hl_debugfs_entry *entry = s->private;
    244         struct hl_dbg_device_entry *dev_entry = entry->dev_entry;
    245         struct hl_vm_hw_block_list_node *lnode;
    246         struct hl_ctx *ctx;
    247         struct hl_vm *vm;
    248         struct hl_vm_hash_node *hnode;
    249         struct hl_userptr *userptr;
    250         struct hl_vm_phys_pg_pack *phys_pg_pack = NULL;
    251         struct hl_va_range *va_range;
    252         struct hl_vm_va_block *va_block;
    253         enum vm_type *vm_type;
    254         bool once = true;
    255         u64 j;
    256         int i;
    257 
    258         if (!dev_entry->hdev->mmu_enable)
    259                 return 0;
    260 
    261         spin_lock(&dev_entry->ctx_mem_hash_spinlock);
                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This is holding a spinlock.

    262 
    263         list_for_each_entry(ctx, &dev_entry->ctx_mem_hash_list, debugfs_list) {
    264                 once = false;
    265                 seq_puts(s, "\n\n----------------------------------------------------");
    266                 seq_puts(s, "\n----------------------------------------------------\n\n");
    267                 seq_printf(s, "ctx asid: %u\n", ctx->asid);
    268 
    269                 seq_puts(s, "\nmappings:\n\n");
    270                 seq_puts(s, "    virtual address        size          handle\n");
    271                 seq_puts(s, "----------------------------------------------------\n");
--> 272                 mutex_lock(&ctx->mem_hash_lock);
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
so it can't take a mutex or it leads to a sleeping in atomic bug.  These
can be detected at runtime by enabling CONFIG_DEBUG_ATOMIC_SLEEP.

regards,
dan carpenter
