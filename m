Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4782070ED2D
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 07:40:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F231C10E576;
	Wed, 24 May 2023 05:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB8A10E576
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 05:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description;
 bh=j7eTfocRDzQqY++vgaOJ0YbWKRTdxK+RfXlC2YJNdAA=; b=Sw1blydRnBpg6bFjUl/lwP9zkD
 l0fXY92Dk30dQfXspWbpuohKUx8+JqeFG78FyvAxPDQyCxTXMrFelI34wukoJWHpwoSBGM5w6J8Dn
 GIWtUK0xNC8oMoy3ZlLba2PsH2v3AeRWIXloBbuyk54RAPR8PkJoE6wBqOmHBlWiLw4acDn5If1qx
 AVnuXsBNadeGFaWo4jAcUoqzll1z0X4aNxDB3VF+AdwR8UGP8CrpH8MLtPYsIQRmqZC0VjUT1lNK1
 p3MVaHVJgUdAbXQbJz/31YgjKMZSSKagFPf9rh/+0ywFkiIvEa2rCfQzVb8L8qsUqqcoX5MW+0oc/
 jTX7rhug==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red
 Hat Linux)) id 1q1hEB-00CQ9c-1U; Wed, 24 May 2023 05:40:03 +0000
Date: Tue, 23 May 2023 22:40:03 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: David Airlie <airlied@redhat.com>
Subject: Re: [PATCH] modules/firmware: add a new option to denote a firmware
 group to choose one.
Message-ID: <ZG2jMx3yo8sHK7Bc@bombadil.infradead.org>
References: <20230419043652.1773413-1-airlied@gmail.com>
 <ck2dzxvllhhh74oa3vjlacutc7rdmgl7cfrfq7vgx4w3jcufrz@7jbgxcat42yn>
 <CAPM=9tw0Y2A4DvuTHT_yd58Eit+tUmo63pbEOHwRJ66LeqznEQ@mail.gmail.com>
 <fsleccud43leoioli6bj4xoydwbdcjb5qr4denuf6morhgtqki@t6xya2mygon5>
 <ZEcJNcz+ArLfUSJ1@bombadil.infradead.org>
 <n6gwizwt26ucpuva2kt35rprth6iqeibi3inq2qrn5qhs3aa3b@4hjbhgnskutq>
 <CAPM=9txLf2NbuZSM5CLYT4wA5mbQ=+ssm9tdzh6JJ=gtEBeqAA@mail.gmail.com>
 <ZG2gBJbwX73owRYu@bombadil.infradead.org>
 <CAMwc25poqP-S2DSXLZuRA7F20fHsiq7uACbxUvYHCEkpY7BoHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMwc25poqP-S2DSXLZuRA7F20fHsiq7uACbxUvYHCEkpY7BoHA@mail.gmail.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, linux-modules@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 24, 2023 at 03:35:41PM +1000, David Airlie wrote:
> On Wed, May 24, 2023 at 3:26 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
> >
> > Hey Dave, just curious if there was going to be another follow up patch
> > for this or if it was already posted. I don't see it clearly so just
> > wanted to double check.
> 
> I'm still considering the options here.
> 
> I could leave the kernel patch as-is and add explicit sorting in
> dracut for anything in the groups, but then we have to name/version
> the firmware in a certain way, another option might be to emit the
> group bounds and two records, one old, one new per-fw file, then have
> some sort of explicit versioning by the driver over what order to load
> them.

Great thanks, just wanted to make sure I didn't neglect any pending
patch.

  Luis
