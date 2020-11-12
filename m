Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 385FB2B0B54
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 18:34:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F1316E303;
	Thu, 12 Nov 2020 17:34:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF8E6E303
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 17:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605202442;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fNWEthHOidlhufNCdnp2GPCUCBNGyMdhd/Ck3gzrwvE=;
 b=C7GMchLD7Ie98ekRlelUVjVXKzcRvEvbgad/UnJ5cfNpoAgBLpjwtu8vRjrAVoU+kZgDkx
 z5NxbP+mIR4AxWb+EA9k+eiE5CyNMa4fk/BiUaYpmL7YYoSC+96By8XrNyQwknCCWWQ7we
 CpJdTcwjUdSh/2BNtSvcHI5RBG5jYiA=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-NXst8yc2PxizXebxmh96Tw-1; Thu, 12 Nov 2020 12:34:00 -0500
X-MC-Unique: NXst8yc2PxizXebxmh96Tw-1
Received: by mail-qk1-f200.google.com with SMTP id u16so4739477qkm.22
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 09:34:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=fNWEthHOidlhufNCdnp2GPCUCBNGyMdhd/Ck3gzrwvE=;
 b=EqCyS7n1xWDjBWAy5pLR9ADdZQV++bKM41iYWxhELggj3egv3GNk41out95tIYpd/Y
 ZyWfaZKXuK33WHE8O5mub7KOD0e/mvqfPXJ+K+lVxGtMR35isI3DBv5q4VwQGIsHkR46
 lkW/wp6QAXDKocOovgO5jTS/BqCpwZdI+Ww2cdy7vMx0mx0kLCPn+VFKAXZwnR5AXK1T
 0YJX8JkhNTJkay5UGB46ZycoWFUaIszpwoJALOUlcdk6/qOVcqZ87MZTG6NbQdAX9Ec1
 l41cbX98LZU2GgVS3kDBe4DB5bXFAqLDrX1WhXZsVDJ4hUbHiwvykK079QV7Ort79lJt
 okOg==
X-Gm-Message-State: AOAM530T5cj2hOvOzAkxQG+ZY6aW8/SqEnOL4a8Er4GG1SnffGnDuBMS
 cTZCLN2iDxgNmUAY6uv+R/GvNhG7+LGHVbfDXImHq5rZRRkhaujt0AouV0IzJKyMEWamNuygzM7
 o/uEJ4SgOu4s3m+LTa+5fBB20+eJs
X-Received: by 2002:a37:8984:: with SMTP id l126mr802708qkd.443.1605202440282; 
 Thu, 12 Nov 2020 09:34:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQueDJ/fnB0wjuH067y3CSLg64P1iPswuGiPavMfFJ1UUfqc62ygP8n5sqSZVesQptMM+CQw==
X-Received: by 2002:a37:8984:: with SMTP id l126mr802688qkd.443.1605202440099; 
 Thu, 12 Nov 2020 09:34:00 -0800 (PST)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id f56sm5426315qta.49.2020.11.12.09.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 09:33:58 -0800 (PST)
Message-ID: <12ea721b350b9bd2a361ca2fd3ad0db79d37107a.camel@redhat.com>
Subject: Re: [git pull] drm next pull for 5.10-rc1
From: Lyude Paul <lyude@redhat.com>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Date: Thu, 12 Nov 2020 12:33:57 -0500
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
Reply-To: lyude@redhat.com
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

JFYI-looking at this today

On Mon, 2020-11-09 at 14:52 +0300, Kirill A. Shutemov wrote:
> On Wed, Nov 04, 2020 at 04:58:14PM -0500, Lyude Paul wrote:
> > ACK, I will send out a patch for this asap
> 
> Any update. AFAICS, v5.10-rc3 is still buggy.
> 

-- 
Sincerely,
   Lyude Paul (she/her)
   Software Engineer at Red Hat
   
Note: I deal with a lot of emails and have a lot of bugs on my plate. If you've
asked me a question, are waiting for a review/merge on a patch, etc. and I
haven't responded in a while, please feel free to send me another email to check
on my status. I don't bite!

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
