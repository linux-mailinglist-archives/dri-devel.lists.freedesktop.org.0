Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE115462BE
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:49:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B3410E175;
	Fri, 10 Jun 2022 09:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F6910E1DE
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:49:12 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id o8so7932960wro.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 02:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VNrT/Lxx0JKKB1YfifI2bGvWzwitOxzpNySNsobDpwk=;
 b=Zxu70TmkSXy20HiSAYoNZ0eja42vt3VUnJ6y8O7fiuU/ODfAbj3QRY8LCig3MKRcmu
 Wzy6JVUdxWLzicetc1/uJtvLHO4AHFryd/chrZwpcAp0R53OcboV0rBXAg7wExtgnwmr
 egUu4EnGrAiEbDT+jMdFpcFyjT7fmavhmCNkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VNrT/Lxx0JKKB1YfifI2bGvWzwitOxzpNySNsobDpwk=;
 b=NMk4B575dJ48LpW4iEdh6qNNcA7t7DPHHaWoDeN6QAoVag7Ay8cBifcN2yPRriwKEk
 ENsNn2ECCVxwDVcmyafC4mBjWp+osU5mFw7iEpUcSwVOafezbXCLiiZUW9IuXKxzhrTj
 U8K831SwxYooD3SrwG9rxDpTEuzeP0478XwJGodOiFa2wRy7xhlyXOONt7XWzCczo8CX
 43JNrqrstcGPh7IbncJcwsOOM467ix8cvuJN0Gk31h4eGwh8bKRcq9hTHdtRs9OC55cd
 voNUVGq9CfS/vwQKvlSzezbP8c8NJu4ilWiy493qiJWjgImLOmVTHk76NZMwGXSJRAU0
 zmtA==
X-Gm-Message-State: AOAM5327n61CNK3pTCy31dcocN0h0iEMGmQHyJf/tHy+Sp1iVnGZt4aL
 KUNEglDJf5KKpF7e5I/7jwrwqA==
X-Google-Smtp-Source: ABdhPJx2XvbvlAPKkJj9cUSu32g5OhLHm58pArsqD8qgtBdXbKtdMEzrEjQ/K8wunJYLFtWzZ4ubng==
X-Received: by 2002:adf:d1ca:0:b0:218:47e1:ab0b with SMTP id
 b10-20020adfd1ca000000b0021847e1ab0bmr22428554wrd.90.1654854550746; 
 Fri, 10 Jun 2022 02:49:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 i15-20020adff30f000000b00218468314d7sm13018591wro.62.2022.06.10.02.49.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 02:49:09 -0700 (PDT)
Date: Fri, 10 Jun 2022 11:49:07 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Message-ID: <YqMTk9C8/g1buL+8@phenom.ffwll.local>
References: <20220602154243.1015688-1-zack@kde.org>
 <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
 <YqMDoSMOL2rsfJj/@phenom.ffwll.local>
 <lcIVipq8mkBAPioQAVQmwsM_Gwo0e9fd2334yGSvIW6uEIEElwUrTe-x9J9h29TB1H3NY3liNCohaXDyjslDFIqxPZNSPbSPJ3vctA2jEAk=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lcIVipq8mkBAPioQAVQmwsM_Gwo0e9fd2334yGSvIW6uEIEElwUrTe-x9J9h29TB1H3NY3liNCohaXDyjslDFIqxPZNSPbSPJ3vctA2jEAk=@emersion.fr>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Hans de Goede <hdegoede@redhat.com>, David Airlie <airlied@linux.ie>,
 mombasawalam@vmware.com, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>, krastevm@vmware.com,
 Pekka Paalanen <ppaalanen@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 wayland-devel <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 10, 2022 at 09:15:35AM +0000, Simon Ser wrote:
> On Friday, June 10th, 2022 at 10:41, Daniel Vetter <daniel@ffwll.ch> wrote:
> 
> > Anything I've missed? Or got completely wrong?
> 
> This plan looks good to me.
> 
> As Pekka mentionned, I'd also like to have a conversation of how far we want to
> push virtualized driver features. I think KMS support is a good feature to have
> to spin up a VM and have all of the basics working. However I don't think it's
> a good idea to try to plumb an ever-growing list of fancy features
> (seamless integration of guest windows into the host, HiDPI, multi-monitor,
> etc) into KMS. You'd just end up re-inventing Wayland or RDP on top of KMS.
> Instead of re-inventing these, just use RDP or waypipe or X11 forwarding
> directly.
> 
> So I think we need to draw a line somewhere, and decide e.g. that virtualized
> cursors are fine to add in KMS, but HiDPI is not.

It's getting a bit far off-topic, but google cros team has an out-of-tree
(at least I think it's not merged yet) wayland-virtio driver for exactly
this use-case. Trying to move towards something like that for fancy
virtualized setups sounds like the better approach indeed, with kms just
as the bare-bones fallback option.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
