Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FBF19D900
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 16:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E1D06EBEA;
	Fri,  3 Apr 2020 14:23:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 819016EBEA
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 14:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585923801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uO0NGCZbKj03nHatjfgLJm8HoihG+m+K4jZT8zYbPNA=;
 b=ShH5zJaHELenNFtN8qLlETRwnfQ/n8kKM/dGKOvmLHv2zJjUpADoHH6hJDATPf3oyrrHeL
 80OEoFnNObPRAN41p0/RRhrv2K84TqOKQZMrvcgromxONjjlRxskdM41F2QEuGTY/IViko
 vzlRK3gQ/U00YBpnbOJp1/ebyE31rJo=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-jjq2DO4lPPWjAxESILvQFQ-1; Fri, 03 Apr 2020 10:23:19 -0400
X-MC-Unique: jjq2DO4lPPWjAxESILvQFQ-1
Received: by mail-qt1-f200.google.com with SMTP id o10so6532029qtk.22
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 07:23:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=uO0NGCZbKj03nHatjfgLJm8HoihG+m+K4jZT8zYbPNA=;
 b=NwWhddoc0COt0b4QCMBEAaxNlfA7KBlLrNLchOK30Eg+nKtn+spOZLL1T5kpvJK20N
 txN0U0mz7W85DodmawMclA3Bc363+btdkbwUz5kHecct6uKD0fBNA/ANTYqVDEsyodeF
 zSCC7pi/fNH2bCXTOoSGqOS+9xHgu7Psq1XNOeopb0mMBN87kw3Xf1X09GGp/jh8SlBh
 oFLK/CsLNSQWbTdZtuwFKrPGulZk5/AiUdZ5uDjN+tHyyHk7Hq69KB3HOb/Bu27f5EEv
 aYlu5teVEQBle/sqq9PxK3QLaD7mZd/bW6rhtxEskmLxibfUZtwwf4DAVcatEa9VGG9+
 rEug==
X-Gm-Message-State: AGi0PuY1V2wswVwZCt84nf9jNLM6Lrdhc1IfW8H7m+Fav4bQZ/H0oTls
 rgOfbV1Jxwjus0RynRpKXxOIKjIQ3dUELrFe8k+4c3U5TwbaXD0J8vJQvum1dVcoi7JNAqxwokV
 WbPl58YwrKPAw6JFub1XfEQ4qYZXu
X-Received: by 2002:a37:72c5:: with SMTP id n188mr5663351qkc.202.1585923799246; 
 Fri, 03 Apr 2020 07:23:19 -0700 (PDT)
X-Google-Smtp-Source: APiQypL8XUF9Mb+dhzjEl8zxTghxFzk6zjD+AnrXsSrzFFQ3BVpOyF03pAr9T6CeijWzbvU07/01tA==
X-Received: by 2002:a37:72c5:: with SMTP id n188mr5663321qkc.202.1585923798974; 
 Fri, 03 Apr 2020 07:23:18 -0700 (PDT)
Received: from desoxy (c-24-61-245-152.hsd1.ma.comcast.net. [24.61.245.152])
 by smtp.gmail.com with ESMTPSA id h9sm2724829qtj.3.2020.04.03.07.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 07:23:18 -0700 (PDT)
Message-ID: <2697346934286018187cda5c2f3d9b359c381aab.camel@redhat.com>
Subject: Re: KMS enums and bitfields UAPI
From: Adam Jackson <ajax@redhat.com>
To: Pekka Paalanen <ppaalanen@gmail.com>, Simon Ser <contact@emersion.fr>
Date: Fri, 03 Apr 2020 10:23:17 -0400
In-Reply-To: <20200403152400.55fe5eac@eldfell.localdomain>
References: <VmzN-pGfjaXAFb8aZXOnS2ibasRIsvB-EbfvxyvjLs07m-PBv4pTcX5hsB7yyrt78pxQQ6Bbu3I-hTtFSXEadxm8CkS60FLccIsZycguSfA=@emersion.fr>
 <20200403152400.55fe5eac@eldfell.localdomain>
User-Agent: Evolution 3.34.0 (3.34.0-1.fc31)
MIME-Version: 1.0
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2020-04-03 at 15:24 +0300, Pekka Paalanen wrote:
> On Fri, 03 Apr 2020 10:15:21 +0000 Simon Ser <contact@emersion.fr> wrote:
> 
> > Additionally, I've heard Pekka saying that it would be nice to have constants
> > for property names in the UAPI headers. Indeed, this would prevent
> > hard-to-debug typo issues. I have a very good example of such a typo issue that
> > took literally hours to debug, with X11 atoms which also use free-form strings
> > like KMS properties [3].
> > 
> > If we have constants for property names in UAPI headers, it wouldn't be a big
> > hurdle to also have constants for enum values alongside.
> 
> To clarify, the property names would be of the form
> 
> #define DRM_KMS_PROPERTY_KERBLAH "KerBlah"
> 
> while enum values would be integers, i.e. the raw values.
> 
> Daniel Stone did have a good counter-argument to defining property
> names: userspace would be full of
> 
> #ifndef DRM_KMS_PROPERTY_KERBLAH
> #define DRM_KMS_PROPERTY_KERBLAH "KerBleh"
> #endif
> 
> anyway as long as they cannot rely on the headers to be recent enough.
> (The typo is intentional.)

Why not put this in some external registry and regularly sync it into
drm-next? This seems like an xorgproto kind of problem to me.

- ajax

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
