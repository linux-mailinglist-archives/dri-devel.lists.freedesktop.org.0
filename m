Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0934BA7BD
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 19:10:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA7510E423;
	Thu, 17 Feb 2022 18:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E9EE10E2F1;
 Thu, 17 Feb 2022 18:10:20 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id v5so3149206qkj.4;
 Thu, 17 Feb 2022 10:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dlIqEgnNsfrKYPdcqnisTzYTTW6lFr0uU41WVj22dIU=;
 b=GR9DQ/6YqLdofXAreZ2sAc2p/plqccp4whg5MIThh5ZtaQvztwDyHagUSa1inkA52R
 vxQcKUnoCranyuZSOLz0PFpEVUtcx5JBxu/DbB+UNJKZNjwUStuYWGo6U83k7xlWazm7
 hcKIRiw+007902398QDgn1I1KFMdaibqa1caEOceEJkQcWiHJN0vguC07XzM6PickBDg
 csAs1O7aWJhO4yQHrMdGJRzoVHTYAYAS5WhdVrGliyoq6+5MR7ItwkFG8jIyT6mMGuBY
 FODKzgXrEE7aOFjtF0uSHlgCfZAliAYEbwmaLY3SA3uZzFBGcD0QInKgWBI0f6nq5NsU
 7WUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dlIqEgnNsfrKYPdcqnisTzYTTW6lFr0uU41WVj22dIU=;
 b=Qh7fzEf9djmLwo2caNn7gZTv5/JGYPCAGp5bU1BCryiP1lrSDLK9V7Fel58MjWKd6y
 /+Ii9tEeEJNU/tV73OfZgbuCxfinmsifkHIDxiu9BgGCaVNMHZvBxaqJui9pxqIle6a9
 ZK3YBL9zwmXxd1pogxYCeEdZrXKhPOL2Y5d5yY0Adc34WiD8Z7nI02n8xnX41yeqT3el
 ciDCUpx1YJbsG/KND+DKorv25OHYJfuRlaD8XS4VDlws12WPHuNANDHZXL3ZaGhQ/LEg
 cvvXM7j5nlQVm8J1H9eu+DKlvL08TFNm3yVgIj3yyrXbyKuhCJMV8XrfLClkbFPSwlq4
 Gd4w==
X-Gm-Message-State: AOAM53334bebVT7fcXrhlRxypLYBRMsrzq+RJ2IyNsJIvBJjTy1tihmY
 0h3eme/8KDyNj4nezYbOX/bCZEwyeCL+kaE8HVI=
X-Google-Smtp-Source: ABdhPJxIo+jnHMR0DEfK+narEFmYI2u67dazGSYJcWVq2Llh1GMi61e3eP4+cCzpfeTAhmqzE5fN1RmGJRjmwzVkCF0=
X-Received: by 2002:a05:620a:470b:b0:46c:e3c1:717e with SMTP id
 bs11-20020a05620a470b00b0046ce3c1717emr2399860qkb.569.1645121419371; Thu, 17
 Feb 2022 10:10:19 -0800 (PST)
MIME-Version: 1.0
References: <20220217175634.4128754-1-lucas.demarchi@intel.com>
In-Reply-To: <20220217175634.4128754-1-lucas.demarchi@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 17 Feb 2022 18:09:53 +0000
Message-ID: <CAM0jSHM3cf36p_+V3Nx-6mKzARkfPjcPVKnxmx49wUcRKo5bbQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/i915: Kill the fake lmem support
To: Lucas De Marchi <lucas.demarchi@intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 17 Feb 2022 at 17:55, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>
> This was useful for early development of lmem, but it's not used
> anymore, so remove it.
>
> v2: Remove unneeded fields from struct intel_memory_region
>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
