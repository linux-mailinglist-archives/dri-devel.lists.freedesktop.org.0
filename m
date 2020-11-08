Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0A32AAE16
	for <lists+dri-devel@lfdr.de>; Sun,  8 Nov 2020 23:50:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A06089838;
	Sun,  8 Nov 2020 22:49:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B80C6E156
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Nov 2020 10:13:57 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id z3so5310499pfb.10
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Nov 2020 02:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Niz+n261DImQVhhgmrvxBvs3fMRh5BLrTtRcyzJ80Bw=;
 b=aTQ3AEh3hzdobPVrIItbRf3WnmhfxueZJjSyVP/5IiRP0mvL+DlhLQxoE/lB4Gx44u
 Yqk9EyHB/8b5Qahn+jN9DJeH1Z4wdTE0VieCAszVsQBDkcEtXk6pKKhfrXUUPGOGQmbn
 lLKgv39NLqBdI5Xeuo24zIqXuUnbLnxABfZBGNztMo7vEhY8BsqRLwBca8RSEwrVSTkI
 uVgplPnLDHAxlosRSpzPiU0cDl/H6RE+NY26X2ArY9KxWLMSQE2LUAxp1WATy651oaaf
 3TQhwCJRIS6M+EYKlbBYZyU8c9SdN3E0x+1EcJ7gvgJzPeBBuVeOxzX+m/wSEPuxwcSM
 DXJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Niz+n261DImQVhhgmrvxBvs3fMRh5BLrTtRcyzJ80Bw=;
 b=Lw+zfEubQ2kexi7hVO5O0v2BfeygQWWHxTRcyWoMG3t5IuVOhb14Ycow8wTxoBGi/n
 sEtUHuCHsc5Nzo7o/d/IsAsmrb84zfj5bP1JwkC3K9TLUgWm0vIB6yGyHej7tG0O2lhb
 p49UfwTCYd+LPNJWZ6+T3xoOL1jaFHk3lItgJKF4zNUms2nDj+scPgtexA1F/YVOpktu
 H9R6pDHtzPEvuu3FZviIaIhfZA+f9We555g3kobBC/9L+QgCGCgKREsLdyE3iFqu4KD5
 Kq09F1S3eotVBYDxyQxVBLuMmDmMEzFWsREYSVuJRU05/zWZmM9AQ69F27MMHmEjWVyh
 28XA==
X-Gm-Message-State: AOAM533nNLeVNCTYrdcn51hGzxtarDuaSJTFxFhZ7fp8TXLNNnjCPZ89
 CmfJuc48gmqobl39BCBDrg8=
X-Google-Smtp-Source: ABdhPJx6IRspSUFI/tX90nuGn0travXG9LJOr8Y6JAgcUS+o7nrKnLo94IhP7sZYteJXkY13qkeuvw==
X-Received: by 2002:a63:2b4f:: with SMTP id r76mr8520949pgr.194.1604830436723; 
 Sun, 08 Nov 2020 02:13:56 -0800 (PST)
Received: from localhost ([160.202.157.3])
 by smtp.gmail.com with ESMTPSA id a184sm7900538pfa.86.2020.11.08.02.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Nov 2020 02:13:56 -0800 (PST)
Date: Sun, 8 Nov 2020 15:43:51 +0530
From: Deepak R Varma <mh12gx2825@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2] drm/vc4: replace idr_init() by idr_init_base()
Message-ID: <20201108101351.GA41922@localhost>
References: <20201105202135.GA145111@localhost>
 <CADaigPXM8NAZFAydXwcZt7ie_aK1aO8C=jqssA375sCMgU_gHw@mail.gmail.com>
 <20201106105249.zvyd36shfec24lzn@gilmour.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201106105249.zvyd36shfec24lzn@gilmour.lan>
X-Mailman-Approved-At: Sun, 08 Nov 2020 22:49:24 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 06, 2020 at 11:52:49AM +0100, Maxime Ripard wrote:
> On Thu, Nov 05, 2020 at 01:24:14PM -0800, Eric Anholt wrote:
> > On Thu, Nov 5, 2020 at 12:21 PM Deepak R Varma <mh12gx2825@gmail.com> wrote:
> > >
> > > idr_init() uses base 0 which is an invalid identifier for this driver.
> > > The idr_alloc for this driver uses VC4_PERFMONID_MIN as start value for
> > > ID range and it is #defined to 1. The new function idr_init_base allows
> > > IDR to set the ID lookup from base 1. This avoids all lookups that
> > > otherwise starts from 0 since 0 is always unused / available.
> > >
> > > References: commit 6ce711f27500 ("idr: Make 1-based IDRs more efficient")
> > >
> > > Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
> > > ---
> > > Changes since v1:
> > >    - Change suggested by Eric Anholt
> > >      1. Use VC4_PERFMONID_MIN instead of magic number 1
> > >
> > >  drivers/gpu/drm/vc4/vc4_perfmon.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/vc4/vc4_perfmon.c b/drivers/gpu/drm/vc4/vc4_perfmon.c
> > > index f4aa75efd16b..18abc06335c1 100644
> > > --- a/drivers/gpu/drm/vc4/vc4_perfmon.c
> > > +++ b/drivers/gpu/drm/vc4/vc4_perfmon.c
> > > @@ -77,7 +77,7 @@ struct vc4_perfmon *vc4_perfmon_find(struct vc4_file *vc4file, int id)
> > >  void vc4_perfmon_open_file(struct vc4_file *vc4file)
> > >  {
> > >         mutex_init(&vc4file->perfmon.lock);
> > > -       idr_init(&vc4file->perfmon.idr);
> > > +       idr_init_base(&vc4file->perfmon.idr, VC4_PERFMONID_MIN);
> > >  }
> > >
> > >  static int vc4_perfmon_idr_del(int id, void *elem, void *data)
> > > --
> > > 2.25.1
> > 
> > Reviewed-by: Eric Anholt <eric@anholt.net>
> > 
> > hopefully Maxime can apply it.
> 
> Applied, thanks!

Thank you all. Appreciate your time.

./drv

> Maxime


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
