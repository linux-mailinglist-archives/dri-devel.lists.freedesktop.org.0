Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1901A6AA429
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 23:22:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1574A10E08D;
	Fri,  3 Mar 2023 22:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7077210E08D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 22:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Ta8NbV6xh96XFRK6QkpcNvtsb8leATV9ZUMVK/pqiW4=; b=MN0nz4mv3XiN3vGUGBw9DHBLZz
 KgGZsmYGI4gJH98GtS7DF6I/ejfGDDijv/FOEdzfG0vnXdxK9qFr+mXYZlJxEIsb5qhf1Qqqpauo7
 QOVL1zMs/tNpXfeXKiCWbVtHV6Fl3yk9diWpt7mB5AkYIXNL87POBOz5bDqx3g5vaWXSRDoAhPzFG
 VV8WVJA0RHTpMSZ+iDUdol+nE6R+EtBvIIaEnvKlfONEX5kscP97pbSHbi+e89uZlO4lViTylh4Bs
 QaFu9XRdiHTi1BjidybX3zaOvW6SQmGokeI0Ie5ZyEVKzU5OFHwG5GCNvwrYq25hun5D7wCtblcZo
 E89cFSHw==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1pYDms-007iaP-4c; Fri, 03 Mar 2023 22:22:02 +0000
Date: Fri, 3 Mar 2023 14:22:02 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Nick Alcock <nick.alcock@oracle.com>
Subject: Re: [PATCH 00/17] MODULE_LICENSE removals, sixth tranche
Message-ID: <ZAJzCvTI67NgbJiY@bombadil.infradead.org>
References: <20230302211759.30135-1-nick.alcock@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302211759.30135-1-nick.alcock@oracle.com>
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
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Stupid question, if you're removing MODULE_LICENSE() than why keep the
other stupid MODULE_*() crap too? If its of no use, be gone!

  Luis
