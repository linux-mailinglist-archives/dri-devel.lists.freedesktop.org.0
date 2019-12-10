Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3011118526
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 11:33:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF0F76E88D;
	Tue, 10 Dec 2019 10:33:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A016E88D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 10:33:19 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id y11so19381118wrt.6
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 02:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zhwjukXR3E/y1aVw7oApg40x0STXLTX0A+KFy5sPcWI=;
 b=lLEfSYJtgI6L2ZTTlysQqImRo13auUpHMDSCvK4LDElqJupWqBwxtLNXv/pbrHhXVz
 Q1x8lHwD+yK8UvtZeTb8vYEQcM/ngTdI/qg3KNDkySeW4JEUIEiVQRVF7/5W9PpeaHu1
 tNNUWhCvH8VatlDubi6ZLywGPkes55MShJQS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zhwjukXR3E/y1aVw7oApg40x0STXLTX0A+KFy5sPcWI=;
 b=ioUsuh++IDh1ovXWvJntRMmUnjJXK8ewJSGiRCMBxvRBm550eThbIRl7QhcxRTwLNm
 gqeJWt5JusBeLmnLevPVqgbqij9phiXwlmYph3cReIoBXTXgM9b9rmW2WPYIwBfX1CYZ
 /x3tp9KztQpWWVNS/nUzb/IrnPglUi+IUOMsp7NucZ13XNhQvUu9bPGZ7b8AQZFifUWq
 YAHgI6wdFOcoryX7ru3k2/jvazmfuzMAbQmkFX2ib/MrvVafjT309tA9uQ6aWUJaP01H
 LOeDWoEWRZ9YmUbvBEw/q0Mbqqo557f2FbLE3tm/SpVq7ax3rDKxqukIwctMAnJFZ3Wy
 VZMA==
X-Gm-Message-State: APjAAAU11d2MGTGta3YznmI/fNO97cDKuM0nuvX3xYD9+4x9ANyRfZIG
 1OIgUvVhXxJAOaEkaOz5wFR3Mw==
X-Google-Smtp-Source: APXvYqxRG5tV8m+EghB10STqD6d3DrXkRYp2b8tOZoctCqzatvbKef6ulCpEMNiSefJn7k7he8sDMg==
X-Received: by 2002:a05:6000:50:: with SMTP id
 k16mr2326715wrx.145.1575973998537; 
 Tue, 10 Dec 2019 02:33:18 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id a64sm2729613wmc.18.2019.12.10.02.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 02:33:17 -0800 (PST)
Date: Tue, 10 Dec 2019 11:33:16 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/doc: Drop :c:func: markup
Message-ID: <20191210103316.GT624164@phenom.ffwll.local>
References: <20191204101933.861169-1-daniel.vetter@ffwll.ch>
 <20191205160537.GC1914185@ulmo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191205160537.GC1914185@ulmo>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 05, 2019 at 05:05:37PM +0100, Thierry Reding wrote:
> On Wed, Dec 04, 2019 at 11:19:33AM +0100, Daniel Vetter wrote:
> > Kernel sphinx has learned how to do that in
> > 
> > commit d74b0d31dddeac2b44c715588d53d9a1e5b1158e
> > Author: Jonathan Corbet <corbet@lwn.net>
> > Date:   Thu Apr 25 07:55:07 2019 -0600
> > 
> >     Docs: An initial automarkup extension for sphinx
> > 
> > Unfortunately it hasn't learned that yet for structures, so we're
> > stuck with the :c:type: noise for now still.
> > 
> > Cc:  Jonathan Corbet <corbet@lwn.net>

Jon, any plans to also add the other auto-markup eventually? We have quite
an impressive pile of :c:type: noise in our docs ...

> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  Documentation/gpu/drm-internals.rst |  4 +-
> >  Documentation/gpu/drm-kms.rst       |  7 ++-
> >  Documentation/gpu/drm-mm.rst        | 68 +++++++++++++----------------
> >  3 files changed, 36 insertions(+), 43 deletions(-)
> 
> Reviewed-by: Thierry Reding <treding@nvidia.com>

Thanks for taking a look, patch merged to drm-misc-next.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
