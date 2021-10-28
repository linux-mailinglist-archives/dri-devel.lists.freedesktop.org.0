Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E358F43E761
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 19:33:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D10536E0CB;
	Thu, 28 Oct 2021 17:33:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23E9F6E0CB;
 Thu, 28 Oct 2021 17:33:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D018960296;
 Thu, 28 Oct 2021 17:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635442395;
 bh=XA/MQSlcp4ctFJUiuMolr/e1TlKVq0ib84LjTsjf758=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o7XIZfpN2EylO/+qIscP2AHoQB9g3JvcZrrardPff+9HfiskvhjPMQauRhzlW3UYG
 cNbFIC23oli5Auqe810O/50v2jeE+zNHs7rilp/CR2W+FCX/FUqRXvlfHZp57+HxfF
 rjD1UqiKBJluiiDrWKejRw+ZY05fnlHUyFzP7jikxzEnTMchN8mgVgpMusJBW/30DV
 5yBDLl0xsRs2VNfhnlQ048kWZnl2dWYdKellWu94RdPm7EUb8ac3GB96lrqf5Ymugw
 5WX1IZAsZihK4y4GnymYjnoNmaNohl4DEY5aTdAZJ6aKKnDhj3wzam5Kc67cNI0nE3
 7jCqUgmR8LeXA==
Date: Thu, 28 Oct 2021 12:38:13 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Karol Herbst <kherbst@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] nouveau/svm: Use kvcalloc() instead of kvzalloc()
Message-ID: <20211028173813.GA1507412@embeddedor>
References: <20210928222513.GA294575@embeddedor>
 <CACO55tsD98dNzw8fP=CiKLsdbnn2Vg78+wTRM90kutHtv1RZ5A@mail.gmail.com>
 <202110211002.CB975695@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202110211002.CB975695@keescook>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 21, 2021 at 10:03:19AM -0700, Kees Cook wrote:
> On Wed, Sep 29, 2021 at 05:28:47AM +0200, Karol Herbst wrote:
> > Lack of documentation inside Linux here is a bit annoying, but do I
> > understand it correctly, that the main (and probably only) difference
> > is that kvcalloc checks whether the multiplication overflows and
> > returns NULL in this case?
> 
> That's correct. :)
> 
> > On Wed, Sep 29, 2021 at 12:21 AM Gustavo A. R. Silva
> > <gustavoars@kernel.org> wrote:
> > >
> > > Use 2-factor argument form kvcalloc() instead of kvzalloc().
> > >
> > > Link: https://github.com/KSPP/linux/issues/162
> > > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> 
> Reviewed-by: Kees Cook <keescook@chromium.org>

I'll take this in my -next tree.

Thanks
--
Gustavo
