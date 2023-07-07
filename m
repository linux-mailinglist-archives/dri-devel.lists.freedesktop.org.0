Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F6574B682
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 20:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB55610E5D5;
	Fri,  7 Jul 2023 18:41:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35EAC10E5D5
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 18:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=PMlx6JapGPAjsjJ641XTtidFI0B1sEa/zy+3jnNhN2w=; b=A8sVGtbGQzO/pi8pFTvrQjeAzf
 2aYuiS9EXvwc/gCLs5IlheN/ANzoLIoKMUSnFHRHlcK4yi2DU++Ylv8c14ZJ8v5OdxQrZK85+o6rV
 nBD+4F2TnURHyjrUYZL2j9lmCcPYekfwma6z5BlKZ9JBu9HZKk5+B/AxhYbfU4M6b5pzvH0mQO/DB
 6w7K0OfCZ24hc4RpBRs69yJV1heYC/csYHvkOvnWIxcOiY3rzjphonwTJPRyxQghxjym0d5eRmeKJ
 q88weq27aL8n9aZDe867FkUK3K2tjCa5ASPhxHUti6IYOj78R2roxJM4HN+heX2tuU5d6LHmOMDhl
 rNeFvgRg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red
 Hat Linux)) id 1qHqOq-005RX9-2i; Fri, 07 Jul 2023 18:41:48 +0000
Date: Fri, 7 Jul 2023 11:41:48 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Dave Airlie <airlied@gmail.com>,
 Lucas De Marchi <lucas.de.marchi@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 2/2] modules/firmware: add a new option to denote a
 firmware group to choose one.
Message-ID: <ZKhcbBHqkEmGtU6I@bombadil.infradead.org>
References: <20230704025322.2623556-1-airlied@gmail.com>
 <20230704025322.2623556-3-airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230704025322.2623556-3-airlied@gmail.com>
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
Cc: Dave Airlie <airlied@redhat.com>, linux-modules@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 04, 2023 at 12:50:50PM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> This adds two tags that will go into the module info.
> 
> The first denotes a group of firmwares, when that tag is present all
> MODULE_FIRMWARE lines between the tags will be ignored by new versions of
> dracut.
> 
> The second makes an explicitly ordered group of firmwares to search for
> inside a group setting. New dracut will pick the first available firmware
> from this to put in the initramfs.
> 
> Old dracut will just ignore these tags and fallback to installing all
> the firmwares.
> 
> The corresponding dracut code it at:
> https://github.com/dracutdevs/dracut/pull/2309
> 
> Cc: Luis Chamberlain <mcgrof@kernel.org>
> Cc: linux-modules@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Lucas, did this end up working for you as well?

  Luis
