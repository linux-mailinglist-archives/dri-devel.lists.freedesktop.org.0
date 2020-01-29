Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 269D114C743
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 09:14:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 327686F482;
	Wed, 29 Jan 2020 08:14:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72636F483
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 08:14:54 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p17so5353680wma.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 00:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=OzZ5MyAWppw3BriyyWTAbdH6cnMV4POzNYoBCRMCBy0=;
 b=h7OxoWXzhB+MZU9ZUTeb+2WrN3pKpDXCHCo501mRgHZ9djV0tgGGDKxjl+6O18R826
 akFA7BTyir5FgHRRU/zqYAw1TtpyVXroJ8VTtyDywb1KScL5ve/pA2AeEOKSYzcptDIs
 kHeSAQVaRRT7HL4hRPGDHuJ5pW1UCfvGc14OQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=OzZ5MyAWppw3BriyyWTAbdH6cnMV4POzNYoBCRMCBy0=;
 b=pACQVkWndPgW9rKCZAn6nL0pOyJ31LEcF6wICMYbCkK7k+ML6/0wXSm8TV30Ms46e9
 VIdnrZTf7TZMOdz/dq3AJguz+14uUkdak2IYYm7biZA7zhjUIBfBnUQa0FM1qd+kxmRr
 5HTm2Ul5g35pm3FT6OaL6JfNVQA2EC0csVbX9yfMbyYmLil3tRtDmgUNIEzbj/HxZHWm
 q/Lh1x35GaT5AQLLPC2pMi9chWLNBpp7zYW8aikEbcAJlCS7iYSUO7kSvzwLhBpwSLNq
 03Vz0/UUa4KZB2c5OpTDkR4vZnlocVgV5SR0fH6T1rLfRx+ma7PGBoLVjk+Xd5sgTt5t
 gSnQ==
X-Gm-Message-State: APjAAAVNzBxXjpViEWMFqFTpC/8qBf2UdhnvyKAWstBs7Pu7DcmLbL4p
 fkMJPmb+gjFdhab4JHonhcD1Ww==
X-Google-Smtp-Source: APXvYqwjbvM5HRMxslBJ/PZoEnkE2ajEVMaSkwqhNN2iC1zrce7Bh4bofqBSMCSfM8zUtRcVxZx8rg==
X-Received: by 2002:a7b:cd14:: with SMTP id f20mr9871915wmj.43.1580285693543; 
 Wed, 29 Jan 2020 00:14:53 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k7sm1334243wmi.19.2020.01.29.00.14.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 00:14:52 -0800 (PST)
Date: Wed, 29 Jan 2020 09:14:50 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28VMware=29?= <thomas_os@shipmail.org>
Subject: Re: [PATCH] drm/auth: Drop master_create/destroy hooks
Message-ID: <20200129081450.GL43062@phenom.ffwll.local>
References: <20200127100203.1299322-1-daniel.vetter@ffwll.ch>
 <326bfd15-e739-7c19-ec9d-602fc72c7d83@shipmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <326bfd15-e739-7c19-ec9d-602fc72c7d83@shipmail.org>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 27, 2020 at 01:14:37PM +0100, Thomas Hellstr=F6m (VMware) wrote:
> On 1/27/20 11:02 AM, Daniel Vetter wrote:
> > vmwgfx stopped using them.
> > =

> > With the drm device model that we've slowly evolved over the past few
> > years master status essentially controls access to display resources,
> > and nothing else. Since that's a pure access permission check drivers
> > should have no need at all to track additional state on a per file
> > basis.
> > =

> > Aside: For cleanup and restoring kernel-internal clients the grand
> > plan is to move everyone over to drm_client and
> > drm_master_internal_acquire/release, like the generic fbdev code
> > already does. That should get rid of most ->lastclose implementations,
> > and I think also subsumes any processing vmwgfx does in
> > master_set/drop.
> > =

> > Cc: "Thomas Hellstr=F6m (VMware)" <thomas_os@shipmail.org>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> =

> Reviewed-by: Thomas Hellstrom <thellstrom@vmware.com>

Thanks for your review, patch applied.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
