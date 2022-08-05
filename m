Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8094B58AFC7
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 20:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26D11133C4;
	Fri,  5 Aug 2022 18:34:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F671133C4
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 18:34:28 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id mk9so2309014qvb.11
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Aug 2022 11:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=+Fshx35gKDbhEKNA9+vyw6D6TRNrCJyr6eaykLEZRdc=;
 b=FJaZ6poKkiXH7Up/SOBvgoAB2hRHOPNTHRX8SYhdRLvAHkofQItlr14p5WTHsfy6gy
 Cr2JqeWzm0bls1wmYMFNJCCFJkmPt3DX3ewEjq3BEwR17NjKwoZ+vE9AH5XXE4++fXp/
 hwHD3NUrZNuV+to2V9kKDcxS3S2SrDqemiY6X72EHbzsVrriJX8UhlXG46d4p2E4DuSj
 9h2+k1KSV9h2zaDRwWS4rQXTNsVbe0afwo1lFplzyBJtrQgQQzB833IDoXx3EW1x/AON
 xI2l7rp7YDeq2ViHGwrbtI1HdQyxQd5vg4UAXfAfFrOLjfJp2Zz3/grzwZcCr1til7l/
 DtwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=+Fshx35gKDbhEKNA9+vyw6D6TRNrCJyr6eaykLEZRdc=;
 b=hc9M4EoRJjA9BzLqA+JSn7ZSWOq+xPIVGbYQDg6RdO/MlJQR2FXnPPtk8ofV78s/g9
 xzG74tgtK8ECoLEQijkAYU/Zw0nIX8QpPvcth8t5dYW5/bH7+3ojlEPqiaY3ai36dyIg
 ydrGld6MriMSg9wJhDUO5PeYHFXgJK2NLl3KQTv1LILKaMHO65Y1yPfY4hHTnAtk4Vwr
 ho31Oe2fo6bGD+PCZq5oITq9nCi++UUHub45XGHZGAdxX7C2QyeYlrc1iShb+wQvLmof
 r+QjxfpA6jvlcg7zadmgMOk3ww6LDzpQex9c4sUQsAFIQNRdjP/YQRAjQGQieqvhKGgR
 FpOA==
X-Gm-Message-State: ACgBeo3fw6Reb0ZATPBDlnHCY8fS0CVN7RGknt/U4p6WE/YqoXMicqYE
 aWX6YxaNYeQ4M5EbOmSGuHw/Vg==
X-Google-Smtp-Source: AA6agR5oikHWzJxCVHLFj/2YT5KkHid1ufzGBJQk9RswK2SSF9EUN8qWAf4S7gJjdD6Q90iwkEX9ig==
X-Received: by 2002:a0c:b39d:0:b0:473:9292:d4ec with SMTP id
 t29-20020a0cb39d000000b004739292d4ecmr6875240qve.66.1659724467955; 
 Fri, 05 Aug 2022 11:34:27 -0700 (PDT)
Received: from localhost (48.230.85.34.bc.googleusercontent.com.
 [34.85.230.48]) by smtp.gmail.com with ESMTPSA id
 j10-20020a05620a410a00b006a65c58db99sm3555519qko.64.2022.08.05.11.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 11:34:27 -0700 (PDT)
Date: Fri, 5 Aug 2022 18:34:27 +0000
From: Sean Paul <sean@poorly.run>
To: Jim Shargo <jshargo@chromium.org>
Subject: Re: [PATCH 3/5] drm/vkms: Support multiple objects (crtcs, etc.) per
 card
Message-ID: <Yu1is1ZNl9RSwAHQ@art_vandelay>
References: <20220722213214.1377835-1-jshargo@chromium.org>
 <20220722213214.1377835-4-jshargo@chromium.org>
 <Yu1g/PLuU559SIm7@art_vandelay>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yu1g/PLuU559SIm7@art_vandelay>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Melissa Wen <melissa.srw@gmail.com>,
 jshargo@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 05, 2022 at 06:27:08PM +0000, Sean Paul wrote:
> On Fri, Jul 22, 2022 at 05:32:10PM -0400, Jim Shargo wrote:
> > This is a small refactor to make ConfigFS support easier.
> > 
> > We now store the vkms_device statically, and maintain a list of
> > "cards", each representing a different virtual DRM driver.
> > 
> > We also make it clear when a card is "default", that is created at
> > initialization, and not. This is because, due to limitations on what we
> > can do with the configfs API, the default card won't be reflected in
> > configfs and is initialized in a unique way.
> > 
> > Since we're only managing a single card, this should be a no-op.
> > 
> > Signed-off-by: Jim Shargo <jshargo@chromium.org>

/snip

What a mess, I replied to the wrong patch. The review here is targeting PATCH
2/5 despite the title and reply-to.
