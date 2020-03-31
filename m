Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F055199BCB
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 18:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 893C76E33F;
	Tue, 31 Mar 2020 16:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F256E85A
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 16:39:07 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id f206so10553888pfa.10
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 09:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=44+c4Ocrbrg0k7nn//ayMhBbygL62o3qDE+l5x6G/Eg=;
 b=nZPUFjTbbHvB/92RynnbfBTbJQ4r4i4GXHAtl8BEFpByyl7RKSEBp0C6lwh4iNcPfD
 qHgIAxjTpGXG4oUFkLtR1qfpkDN1BeM173oX/Cxb1lYfb1tNUJLPhjT37qSBYKgrKpDP
 s44cOKzpmbVm323hvvCJyqjOmt0BBIWJ74d1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=44+c4Ocrbrg0k7nn//ayMhBbygL62o3qDE+l5x6G/Eg=;
 b=IqQH2EZ0Hj33nQ8sXbfFTLiViL953/yNpzpraxmwB4cKzuj4NO9qZ0ttceTiSyst0M
 srH/t42KkGkNw4FzJxW5saFc6nfyHeqxkUF7VCsLpsAZYb55OSqoLa1vLDdbJCkT5xK4
 0oAk7WBR6qJCEtbkBbZKvjcvtpxw3kCuCK4+cFDAyNFg/BXGbHKPtLXV2DJSfKgvYa8U
 FV99MySN/NqVXF0mEKI2LldzZ0syH7lvfc9NIOU10p6lotvFk01QmGru4HISVSqahlDI
 /DSkjsWkNUYjBKf85pLzwgzMc6/coOOGeRdvqQfgJHkn5hfUoogtI2Y1r4FaCQxoFnB4
 tSfg==
X-Gm-Message-State: ANhLgQ2qJHTf0bq0zfUgTQmxEUSSma5DIfHZpnZwRBx4YOtZBPtm6LaN
 DxXAv+l/tOHTfovk1UewMUCp5A==
X-Google-Smtp-Source: ADFU+vsGsUTeHUuF1unZrg9i5ze+SZDnJ9Sx+xT8F6R92O2gzLsoV/DUQ3aml+IuKmSF3F0qAd06zA==
X-Received: by 2002:a62:3844:: with SMTP id f65mr19541464pfa.255.1585672746899; 
 Tue, 31 Mar 2020 09:39:06 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id s15sm12878266pfd.164.2020.03.31.09.39.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2020 09:39:06 -0700 (PDT)
Date: Tue, 31 Mar 2020 09:39:05 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v10 0/2] Add support for rm69299 Visionox panel driver
 and add devicetree bindings for visionox panel
Message-ID: <20200331163905.GE199755@google.com>
References: <20200327073636.13823-1-harigovi@codeaurora.org>
 <20200328204047.GG32230@ravnborg.org>
 <20200329174417.GB199755@google.com>
 <20200330192511.GG7594@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200330192511.GG7594@ravnborg.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Harigovindan P <harigovi@codeaurora.org>,
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 30, 2020 at 09:25:11PM +0200, Sam Ravnborg wrote:
> Hi Matthias.
> 
> On Sun, Mar 29, 2020 at 10:44:17AM -0700, Matthias Kaehlcke wrote:
> > Hi Sam,
> > 
> > On Sat, Mar 28, 2020 at 09:40:47PM +0100, Sam Ravnborg wrote:
> > > Hi Harigovindan
> > > 
> > > On Fri, Mar 27, 2020 at 01:06:34PM +0530, Harigovindan P wrote:
> > > > Adding support for visionox rm69299 panel driver and adding bindings for the same panel.
> > > > 
> > > > Harigovindan P (2):
> > > >   dt-bindings: display: add visionox rm69299 panel variant
> > > >   drm/panel: add support for rm69299 visionox panel driver
> > > 
> > > I have only the first patch, which is now applied.
> > > Please resend second patch as it is lost somewhere.
> > 
> > Yes, it seems for v8, v9 and v10 only the bindings were sent, even
> > though the cover letter and subject say it's a series of two patches.
> > 
> > To my knowledge the latest version of the driver patch is this:
> > 
> > https://patchwork.kernel.org/patch/11439689/
> 
> I did not go back and check, but I recall there was
> review feedback that is not yet addressed.
> 
> I applied the patch here and checkpatch was not happy:
> total: 14 errors, 22 warnings, 11 checks, 314 lines checked
> 
> Many of these are trivial indent or spaces used where tabs should be
> used.
> These needs to be fixed before the driver will be applied.
> 
> And there was too much that I just did it while applying.

Oh, I totally missed these, sure this needs to be addressed.

Harigovindan, please also double check if there is any outstanding
feedback that still needs to be addressed.

Thanks

Matthias
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
