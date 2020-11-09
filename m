Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C73412AC2D8
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 18:50:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD6BB89AB7;
	Mon,  9 Nov 2020 17:50:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C877E89AB7
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 17:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604944252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YXvEm51EQgg6d/6+RsO689mFrQ77idUd378cb1GQATE=;
 b=Gwf1LhtUNOT0R4BqvskAW+O87IIgV0LZgen7faL3rle0SKfMpaW/VXp5LhWyv5v5XNsM+G
 mTiyUuTkzbrcl1A4/F61Z0Lz8JW3JroppNI34nmDGZ81rZqLpjQAoa3m2wlga+rBSy0iIp
 ElcfN4DKxoc/POExKsSQnewXBiqPQBs=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-b-jkWfRMNFyOT0vympV1Dg-1; Mon, 09 Nov 2020 12:50:51 -0500
X-MC-Unique: b-jkWfRMNFyOT0vympV1Dg-1
Received: by mail-qv1-f72.google.com with SMTP id s3so1226845qve.13
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 09:50:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=YXvEm51EQgg6d/6+RsO689mFrQ77idUd378cb1GQATE=;
 b=DE+y3AATsMwHUNjTCRCDGwjEeh8NofMEfqiCL1sPiRHiyE1eb102KFKY7RfrE3R5A6
 esrhINRcK8I+yJLUkpt+TG5X6U3WRM+Gja7I5OBi0rwV04BJwtYkgdhpoda8jJ+PG9pc
 au+0Pf0krEdngAuflrkTE/Yz4m/V34j434/yftpvuhg35VWesy3YPKfNpySgQQ7oB2JX
 rurltKj+X+p6Lf52UiPL7SAGX/CBM+Rjbg+3ki4qFVlWURQRGaSr+UqI4cEpvM9GuoC8
 IgljssqjgCTy9cEC6pfDLjlhbILUyBIqALPUMnHo9CmFH0w6gwfScevPp05gvAUZByma
 7cVw==
X-Gm-Message-State: AOAM531AKhKNocmo31DdwJG6C/XbP59SdgW0dPtqJNqAQy5JYiwnfOQv
 Vo4QO/SShYTysJLjMnZ9v5iqBRRLU93UeEX+U7LtFRPOUKoWehZHxV9cT2cdBjoD6iG33Mf5jdZ
 OBC2hH1L9PmkbcphqllmegldMnHWj
X-Received: by 2002:ac8:4252:: with SMTP id r18mr14156766qtm.26.1604944250806; 
 Mon, 09 Nov 2020 09:50:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxkt6WIewMuarxBeEODneqDLaawRUL0XSwbyfZf8lRXCXsVRCL6e/nhUFsB6to/IO6Ub1UZ5w==
X-Received: by 2002:ac8:4252:: with SMTP id r18mr14156755qtm.26.1604944250643; 
 Mon, 09 Nov 2020 09:50:50 -0800 (PST)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id j10sm6212957qtq.59.2020.11.09.09.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 09:50:49 -0800 (PST)
Message-ID: <ea2450953182320516f8e8bf857625c58a18f584.camel@redhat.com>
Subject: Re: [git pull] drm next pull for 5.10-rc1
From: Lyude Paul <lyude@redhat.com>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Date: Mon, 09 Nov 2020 12:50:48 -0500
In-Reply-To: <20201109115209.rwhoe4zttaxirx6c@box>
References: <CAPM=9txyMmW1DWhS--SuYQu4qDK1GPzgHJwxbAfhHT=hUsPODA@mail.gmail.com>
 <20201103222013.hypmzlq7uuqufe76@box>
 <71dc852e52bfeafc8c03a6fa3cd5f3cdd4eb6609.camel@redhat.com>
 <20201109115209.rwhoe4zttaxirx6c@box>
Organization: Red Hat
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Looking at the patches you sent is on my TODO list for this week at least as a
priority, although I really would have hoped that someone from Intel would
have looked by now since it's a regression on their end.

Gentle ping to Vsyrjala and Imre

On Mon, 2020-11-09 at 14:52 +0300, Kirill A. Shutemov wrote:
> On Wed, Nov 04, 2020 at 04:58:14PM -0500, Lyude Paul wrote:
> > ACK, I will send out a patch for this asap
> 
> Any update. AFAICS, v5.10-rc3 is still buggy.
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
