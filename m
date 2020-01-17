Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B3B141228
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 21:14:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BE5A6F8FD;
	Fri, 17 Jan 2020 20:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F6BB6F8FD
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 20:14:46 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id b6so23943482wrq.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 12:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=CdwXBYNyF5xDR1pGMr/wPikInN/oKkvSBUHYz1hyeUg=;
 b=ksYMV5bfGS2K5CHFV0GNohTsVi/GNb9T8ORhTWe5Va1CpU9gTwBXWYdgSYUU+GCN30
 0G9bcLU+U/M3hE0p3fKsmJ9lMEA5iLVQ3H6vhhGW3QQs3K2f2HTWqf2ewPCcp5ENyjtr
 L2+VLfpxoZORCt0majUVWiYuiSLIzlrdMnjGs6PvTu+BbnRNegtYEJBqCTuxPtRoDQF5
 wApviit6UhGCv3VlYUZy846lm9LV5utxlbnsvNFfQHtqFEwDaeizMdypPgIjBLzvBP6C
 h5j4cVo58298IHt6Qw3AyrDiAqeHsg/KML6m8H+xXBZJZouKbKmnorB9laiX74oV7c7B
 PSHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CdwXBYNyF5xDR1pGMr/wPikInN/oKkvSBUHYz1hyeUg=;
 b=Y6N21Pvg63ttIb03w4mNjh9zRY/EqZH4LQo78cItbysra+IBepKin8KFRmrJglDusU
 6O63cYG4RQDAZ4SAXat47y5xbMenDffoVqqSvZ0flGa/Dly+6f90CloC2oA2wVh1PvOy
 /efyMMdkhdH/SP34kJABsJS8WVhcVkCSrHb06rChnqbF9n6uvZi0HY+GEFI4rI/EZYl0
 TcDK9lVfOFSFppCFpRVojAvKaK961nKgNBiZ5DZCYIQPUbQQ40kBlLNNfTuuS2JPbWcb
 rEPpx7zYp5vUzfA1s1gKqkO2mUcwehMFS1WHDKrT2WZh7iKDbyxEMqVz0Eb3sFA+pJ/3
 rk5Q==
X-Gm-Message-State: APjAAAU5R8HT0pa4ja3/ttKiK1l8YTBC2SEgdRcxUKegY7KOrlVlB1cg
 dOu/pYBro1erc7qKqaVC5P0F7AQL
X-Google-Smtp-Source: APXvYqwfIgXqj8n2UBJS1zlRjn5LryTlxw+ELQxwYbJQKl0HfmqUJ0nl0v0lWf+Feb8njl26ULJv6g==
X-Received: by 2002:adf:db41:: with SMTP id f1mr5170825wrj.392.1579292085233; 
 Fri, 17 Jan 2020 12:14:45 -0800 (PST)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id r6sm36498230wrq.92.2020.01.17.12.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2020 12:14:44 -0800 (PST)
Date: Fri, 17 Jan 2020 20:14:14 +0000
From: sylvain.bertrand@gmail.com
To: bugzilla-daemon@bugzilla.kernel.org
Subject: Re: [Bug 206231] R9 280X low performance with all games
Message-ID: <20200117201414.GA711@freedom>
References: <bug-206231-2300@https.bugzilla.kernel.org/>
 <bug-206231-2300-a7haKPZIfN@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bug-206231-2300-a7haKPZIfN@https.bugzilla.kernel.org/>
User-Agent: Mutt/ (2018-04-13)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dota2? (vulkan and GL)
CS:GO? (GL)

Those games are free.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
