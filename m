Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04650B59424
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 12:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54FB710E7A2;
	Tue, 16 Sep 2025 10:48:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="Sv9zJErA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A30B510E7A2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 10:48:52 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-82a334e379eso123888085a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 03:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1758019731; x=1758624531;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+GSfiQS7ZR7uuddJQcXgH9mcKKKw9ctebxPryH/Ufio=;
 b=Sv9zJErA6XybkkQxxVVYGsh/cAqm7T/m4aBGqEYuNLtURJHTsWsjtlNqkt7TYHfRKg
 vyZdC1tZzSmRNiFg7APZqDlp49d6vvQAK5ZyWt3fdMeIgeNrmVbZGWBZma+iZ6MARKMt
 XGvpQnuPPfEkFOSIqZfGag2AsroC2slQiWVCa/+RRfMAGmXPMmLUt4xFnI8dFIzFliek
 NCvv4Ac/O3PKr0cB5V0KpeQ3jJsCHy3P6yr3Q1LJNKabszhlqelKdpVJTiBzhvlK9ISG
 DWhiyq58zj3UWSsE6QdRIi51z2VMlbIpw/IqO3UNrPSGvnbcdckJdQurHzcUXfdmu4i8
 bmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758019731; x=1758624531;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+GSfiQS7ZR7uuddJQcXgH9mcKKKw9ctebxPryH/Ufio=;
 b=YdVVAhSAN1Ggf2RIPWarimHtVOuFAE4aEzdaj2u7SzgUeiQgZok2YKbeXHXE80dDw6
 tX4fZFJnMcHe+VVcCdJiT0E/RFLS2QnukyFhfs84lEgixL7DdTOdXoXBEQyU88eEQZns
 +KgoB7RFcTqg/2D0L5y9lUCT8qu8z7h5FrYiJLGsNjYT09IbpSEY+ZSBkeEdTaxlWvPu
 2Fz63kx4YS4Pdu/Wfa0MZlDmsnnwEMF0g3TzE91fxglu7CUNNcjWgrxDC5itr5OPnTmk
 RkXt01lXPoN0Jfg8dOsSv9AstRz0arF1ERvb1c7NIQ3swHnGeLKFGtGtKbWZy8IGJiZ0
 lhKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnWXnyvYjgujpuk0IfPK6x8UFg9SxjxCwg6fhDgKhsWW6lvT7ECECNnDCyBxQ7yfP5psf+WZixgsY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxxk6YYnMHVhB8Y/X5VOBhHHKnElUKL1Bnmz/NfTB+I6vQOEjyA
 h9lrq685DrL/cYnlnS3m02j7Gap7nvvhmSV28iz/4FTDEf29ZtYVgdbN0p4M0Fv2quUZdowYV4E
 OCdI5qel+lwgZEwzIQB5rjiLqJ5xdW6VvoH2DrTa2wA==
X-Gm-Gg: ASbGnctE7zilr1T6q58jFWMNGCTMXFILFHD6zerCoF8g3CGQc54kDOa8RnIKSWnFzB+
 IpUiRCN6KCcKG/lbkzDQjQx6pC64k1kVqAmlAIQBInWok8kfZbe+zXoZwdtqpZfzLnkculEWn+q
 m4cQkReuu0SEm5gt1OPMOdnviUMDk4PJfuar0fXn6RAIJJjpnTivoEPLgmsPqIcxotHQ8n46Iuf
 6qRoe/DgUawlnM5Hv8yYOOgEr+1oDtBWdgeFFd2KA==
X-Google-Smtp-Source: AGHT+IH9l4xdyU94au5FAsGbdNPgPKzyHzXggQrcd9uxIH432nMPXDxRrmLvWIsUiZgmpQV90exoqhMedvcLzrk8E6w=
X-Received: by 2002:a05:620a:a911:b0:80e:6cd8:a9eb with SMTP id
 af79cd13be357-82400753719mr2009585585a.54.1758019731572; Tue, 16 Sep 2025
 03:48:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250911130739.4936-1-marius.vlad@collabora.com>
 <20250911130739.4936-4-marius.vlad@collabora.com>
 <ssvxorsrhum2eo2uiieradrrmytemivr6m5c3mskalehzaj4ci@nc74epxgjq5w>
 <aMMDxIWN9TadgVyw@xpredator>
 <6zmp2dzpvcb4hi4kaa66q5o4rlcpdkor75ci4rnvalt2a37f26@lbmvc4t2ow4z>
 <CAPj87rNxGfroKTf1i5UtmmnZ9wDQTdZFDMKw-MLdbCfjTCD=Uw@mail.gmail.com>
 <20250916-piquant-jerboa-of-completion-87b80d@houat>
 <CAPj87rMuwvir_aDReT1ou-BNs3w9coUG6MPmCnGAeg5rQ97rCQ@mail.gmail.com>
In-Reply-To: <CAPj87rMuwvir_aDReT1ou-BNs3w9coUG6MPmCnGAeg5rQ97rCQ@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 16 Sep 2025 11:48:39 +0100
X-Gm-Features: AS18NWCcauCByfEyJRUf96HIaSsWXYFWRAxN4n1nfmqO82O_sxNEp8QLi22mgEQ
Message-ID: <CAPj87rPRG=7qPp3QMXf_6FP82-gWdgWpXdHmwZjHKrnU-PdQ0g@mail.gmail.com>
Subject: Re: [PATCH 3/8] drm: Add new general DRM property "color format"
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Marius Vlad <marius.vlad@collabora.com>, dri-devel@lists.freedesktop.org, 
 wse@tuxedocomputers.com, andri@yngvason.is, sebastian.wick@redhat.com, 
 daniel.stone@collabora.com, jani.nikula@linux.intel.com, tzimmermann@suse.de, 
 simona.vetter@ffwll.ch, harry.wentland@amd.com, christian.koenig@amd.com, 
 derek.foreman@collabora.com
Content-Type: text/plain; charset="UTF-8"
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

Typing with one hand (and not the useful one): not good.

On Tue, 16 Sept 2025 at 11:46, Daniel Stone <daniel@fooishbar.org> wrote:
> Again though, it's not something new. I promise you that Weston (for
> over a year), Mutter (for about a year), KWin (for over two years),
> and wlroots (for two and a half years) already have hard deps on
> libdisplay-info. Even outside of 'serious' compositors, Mesa requires
> it to support HDR in VK_KHR_display (when it was added a couple of
> months ago),

... and mpv has also required it for any DRM backend support (same as
all the compositors) for the past year.

So yeah, I see it as the same as the input situation: you _can_ do the
basics with raw evdev, but unless you're very special, you should use
libinput. Equally for output, when you go past what e.g. Plymouth
would require, use libdisplay-info to parse the EDID, rather than
trying to make the kernel try to turn the unhinged madness of EDID
into something userspace can reason about.

Cheers,
Daniel
