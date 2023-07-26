Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FAF762D43
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 09:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6759A10E41C;
	Wed, 26 Jul 2023 07:26:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C284D10E41C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 07:26:07 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-686bea20652so595515b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 00:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20221208.gappssmtp.com; s=20221208; t=1690356367; x=1690961167;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+zeJUC9bLKU1rvuVX6lYw88hUmzqKAeHPtzffozeycY=;
 b=tq09HWgUpDUq6byqrA2ODCQvkmm9az77yWJFeqeVMy0FdFbQydZS+cUOs64uJ2SB3t
 JVe6zLPb5fssr5t5MVQUOU3aAgE6xxOU2jteEAzPtsSb8VWd+wB8OkrdKfGE1jZhlj5w
 TjyyAjaB4CZbrKROQT36TogKeOKjWN45v44UiK/0cxwlhI07RMRGs/cyjwVDCOvRwded
 lUKql7WZYCe6f5lQSR03cISDY6tgj5wgcwRkwmI723xyLURdjFU3QXYzRwiEbnZzpb+Y
 l5EpmyZiiiT3lVpIPopVTNPz1HtZxyTgaW+3XYB75cUNHtZ/C6Tv2cVXxlw6MGh6VRdH
 zVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690356367; x=1690961167;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+zeJUC9bLKU1rvuVX6lYw88hUmzqKAeHPtzffozeycY=;
 b=ijMKk4jMeZMvmaUIjUTOO0+CQVJNXaEtXTDWQfJFsNzdbwDpGEX0HwBkYaRNtXdx9y
 8Hbzv79Qr9wivGHnp4V83TjL0niltMIlCK0Lo2+vMKAY/Bq4el5y3qMrsMnYtEllA1La
 g3fJYJFHvAdEYMRYu7xPpZiBRXGOmD29/QmG9rcbEz+ECkjSX2VA8uYa8Mjhy9ivJopE
 7vzFt63CSOS5f66LrDDajNoxx8PzoepiTiVaf6FHkWLd2MwQbIz4HIk3ba0aylWLBML1
 y4sqsJtkvKX3/DAfteX9jsVe9eIlvKafOVpEOmXl+6SjAWyaWxNP7uxbtJ3ZhEDXf0pl
 qRyA==
X-Gm-Message-State: ABy/qLYZJX5aK/WJwqYAorIyZKLzydigefut5eC93paZN4d8gw9j7cEU
 okZ/+5VsmcNTnqttyM8gZyIOeg==
X-Google-Smtp-Source: APBJJlH5b0OufxURLtAQUAf05ozn4hmRBD/Qn/v7OHyNHGefhP7kmXIN/eqXKV4z4NaYW1ZZNRUFVA==
X-Received: by 2002:a05:6a00:a0d:b0:67a:a906:9edb with SMTP id
 p13-20020a056a000a0d00b0067aa9069edbmr1921084pfh.30.1690356367307; 
 Wed, 26 Jul 2023 00:26:07 -0700 (PDT)
Received: from dread.disaster.area (pa49-186-119-116.pa.vic.optusnet.com.au.
 [49.186.119.116]) by smtp.gmail.com with ESMTPSA id
 r5-20020a62e405000000b00666e649ca46sm10751809pfh.101.2023.07.26.00.26.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 00:26:06 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
 (envelope-from <david@fromorbit.com>) id 1qOYuK-00AfFC-0I;
 Wed, 26 Jul 2023 17:26:04 +1000
Date: Wed, 26 Jul 2023 17:26:04 +1000
From: Dave Chinner <david@fromorbit.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Subject: Re: [PATCH v2 03/47] mm: shrinker: add infrastructure for
 dynamically allocating shrinker
Message-ID: <ZMDKjBCZH6+OP5gW@dread.disaster.area>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-4-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724094354.90817-4-zhengqi.arch@bytedance.com>
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
Cc: kvm@vger.kernel.org, djwong@kernel.org, roman.gushchin@linux.dev,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 cel@kernel.org, x86@kernel.org, steven.price@arm.com, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org, paulmck@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-nfs@vger.kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, yujie.liu@intel.com, vbabka@suse.cz,
 linux-raid@vger.kernel.org, brauner@kernel.org, tytso@mit.edu,
 gregkh@linuxfoundation.org, muchun.song@linux.dev,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, senozhatsky@chromium.org, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 24, 2023 at 05:43:10PM +0800, Qi Zheng wrote:
> Currently, the shrinker instances can be divided into the following three
> types:
> 
> a) global shrinker instance statically defined in the kernel, such as
>    workingset_shadow_shrinker.
> 
> b) global shrinker instance statically defined in the kernel modules, such
>    as mmu_shrinker in x86.
> 
> c) shrinker instance embedded in other structures.
> 
> For case a, the memory of shrinker instance is never freed. For case b,
> the memory of shrinker instance will be freed after synchronize_rcu() when
> the module is unloaded. For case c, the memory of shrinker instance will
> be freed along with the structure it is embedded in.
> 
> In preparation for implementing lockless slab shrink, we need to
> dynamically allocate those shrinker instances in case c, then the memory
> can be dynamically freed alone by calling kfree_rcu().
> 
> So this commit adds the following new APIs for dynamically allocating
> shrinker, and add a private_data field to struct shrinker to record and
> get the original embedded structure.
> 
> 1. shrinker_alloc()
> 
> Used to allocate shrinker instance itself and related memory, it will
> return a pointer to the shrinker instance on success and NULL on failure.
> 
> 2. shrinker_free_non_registered()
> 
> Used to destroy the non-registered shrinker instance.

This is a bit nasty

> 
> 3. shrinker_register()
> 
> Used to register the shrinker instance, which is same as the current
> register_shrinker_prepared().
> 
> 4. shrinker_unregister()

rename this "shrinker_free()" and key the two different freeing
cases on the SHRINKER_REGISTERED bit rather than mostly duplicating
the two.

void shrinker_free(struct shrinker *shrinker)
{
	struct dentry *debugfs_entry = NULL;
	int debugfs_id;

	if (!shrinker)
		return;

	down_write(&shrinker_rwsem);
	if (shrinker->flags & SHRINKER_REGISTERED) {
		list_del(&shrinker->list);
		debugfs_entry = shrinker_debugfs_detach(shrinker, &debugfs_id);
	} else if (IS_ENABLED(CONFIG_SHRINKER_DEBUG)) {
		kfree_const(shrinker->name);
	}

	if (shrinker->flags & SHRINKER_MEMCG_AWARE)
		unregister_memcg_shrinker(shrinker);
	up_write(&shrinker_rwsem);

	if (debugfs_entry)
		shrinker_debugfs_remove(debugfs_entry, debugfs_id);

	kfree(shrinker->nr_deferred);
	kfree(shrinker);
}
EXPORT_SYMBOL_GPL(shrinker_free);

-- 
Dave Chinner
david@fromorbit.com
