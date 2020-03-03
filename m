Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 499D4177236
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 10:18:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CFDC6EA49;
	Tue,  3 Mar 2020 09:18:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11AB46EA49
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 09:18:39 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id j7so3282105wrp.13
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2020 01:18:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pXW4XibhqAWbXclYMHPjPrIsQTzUNXr/pk+A3VeMp8Q=;
 b=oEvBf0xBm5dgKFbLzAbzA/M9WMGMsssGlbomNQmOo964wsBqS7aOXyS6LxNEq0bV7T
 vv3XYGh8yLg40WNEKDM07/4dplPvebgjlc5TMQS4/Wy4phHfmjsa7MU3+DtlgVIimM/T
 7kp4OPinCMvIHv9HBt7QqGFtUDRXm481kAyDUb3sfs6sn+M7pctQHGCKZ887NKXUAl9f
 HbvH/84rOtvtlC6xp9fbvmVfdJQoUbJlkk/KIN6fvghIu/n0yOUwn2dG+sv3+eCl132w
 03W2X71hJG1cgZpsrZLinKThkHnXL15lKtWatNy53KDytTO9GzgdpqgN/R9j6aveHAX8
 TXNw==
X-Gm-Message-State: ANhLgQ3bcSWdsHgMXqWQo/iACw8bVXwUj6Ph6y5dSDu8wAH3Y9Ue8yuq
 TYhJ84kO+SujBouzgfA10oo=
X-Google-Smtp-Source: ADFU+vuBgMiydd/l2UUSufgoAbaYi+wHaw+zSqFwkxZNbX4n0pu0OFPRgcX7TTqLwk7xAerOFo/hKQ==
X-Received: by 2002:adf:d086:: with SMTP id y6mr4333948wrh.387.1583227117589; 
 Tue, 03 Mar 2020 01:18:37 -0800 (PST)
Received: from localhost (prg-ext-pat.suse.com. [213.151.95.130])
 by smtp.gmail.com with ESMTPSA id z5sm2847585wml.48.2020.03.03.01.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 01:18:36 -0800 (PST)
Date: Tue, 3 Mar 2020 10:18:36 +0100
From: Michal Hocko <mhocko@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28VMware=29?= <thomas_os@shipmail.org>
Subject: Re: [PATCH v4 0/9] Huge page-table entries for TTM
Message-ID: <20200303091836.GC4380@dhcp22.suse.cz>
References: <20200220122719.4302-1-thomas_os@shipmail.org>
 <cc469a2a-e31c-4645-503a-f225fb101899@shipmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cc469a2a-e31c-4645-503a-f225fb101899@shipmail.org>
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, pv-drivers@vmware.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-mm@kvack.org, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri 28-02-20 14:08:04, Thomas Hellstr=F6m (VMware) wrote:
> Andrew, Michal
> =

> I'm wondering what's the best way here to get the patches touching mm
> reviewed and accepted?

I am sorry, but I am busy with other stuff and unlikely to find time to
review this series.
-- =

Michal Hocko
SUSE Labs
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
