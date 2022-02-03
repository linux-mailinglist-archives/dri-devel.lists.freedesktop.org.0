Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C3A4A86BE
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 15:41:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C079F10FC45;
	Thu,  3 Feb 2022 14:41:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A0E10FC45
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 14:41:01 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id 124so8966410ybw.6
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Feb 2022 06:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n6S5P2Uc+qMt9OlrM3GeYYVl0WbNEdp9io5qErfUKfk=;
 b=pD14gvBImsOXiXdRgVtanYNCBRJonExP+IDPy0BeVDjLUwOoM0Jclgt0FKflWZjU9a
 s8hTXI0IG1h5iKWiTI0zkNvsVgCacoJfinF5a4vHfpMc2TPzQZ3Gqb+xxwH/YNB7vTf3
 gsh09e/RXpGcLimMeuHHNO2c9vF37dLC4+aXmt0uqWwDgDwCqSngP0JfAAHNTiTo3/TH
 PoObHiyITG7fKOb9SY8UgL/DVKpabM5cQ6b/OY2y49Pzw8gj7Eu0LWo5OrZskWCIagaR
 sG+XOVbCizC3xv2D70/W1WYwaBIoTAViYUz95DJ0q8Db2fVneIJlTPu1ea6EQqushDKj
 xNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n6S5P2Uc+qMt9OlrM3GeYYVl0WbNEdp9io5qErfUKfk=;
 b=4soAlLSdzoEw727CCS+XAy7p21i53+znwxzCCexJ1IHNHppc054yFzYE/z/gwmXqKX
 69pQHFILOiFmhdHC43MUCadb+pamcwZoO+QUuoOt0q/rff8LmeCSsCh1Rd+8yWSeAiI6
 pR81ZcG8ORmr8mK8wtd2+rmbaLwePJ80cLcaiqJgn5yojH/J+Rx9McvKqJx1kNtzzL6V
 BemOO3QW4nVPm/CKowpIuSPneF0Qv+xnSCP4igHme1v7edcZr6bSkuRQxL7EC7HnVpR6
 VcVZibHXkafVh1Qzeo6E1tmLVMIt1ZgdEICxiAS63QtnOjM6rD7tg9++YOFFkw247rK/
 5kJw==
X-Gm-Message-State: AOAM532WAllBucMekpfZiSlOHu0SCnNkccXKZjIhNAwkou1EALDOC2z9
 vlaFZuVWMmQ1uiwin8LXkPcmMHttVZUJHhWb7h1udQ==
X-Google-Smtp-Source: ABdhPJyswVRQqTS+xEKqdpayaeejdXlEZMG/P2/h1J4B/+6fiYNGk8GpWfPC0yPT83MQVj0IX1zC2LguHhL6k1bphKY=
X-Received: by 2002:a81:ef04:: with SMTP id o4mr4708479ywm.458.1643899260532; 
 Thu, 03 Feb 2022 06:41:00 -0800 (PST)
MIME-Version: 1.0
References: <20220203133753.261507-1-contact@emersion.fr>
In-Reply-To: <20220203133753.261507-1-contact@emersion.fr>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 3 Feb 2022 14:40:49 +0000
Message-ID: <CAPj87rPZWQGARvmF-yiH-YHh=rbU1m+ES85GPfAB_HpoqpdeEw@mail.gmail.com>
Subject: Re: [PATCH v3] drm: document struct drm_mode_fb_cmd2
To: Simon Ser <contact@emersion.fr>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Daniel Stone <daniels@collabora.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 3 Feb 2022 at 13:38, Simon Ser <contact@emersion.fr> wrote:
> Follow-up for the DRM_IOCTL_MODE_GETFB2 docs.
>
> v2: (Daniel Stone)
> - Replace fourcc.org with drm_fourcc.h because this is the
>   authoritative source and the website may have mismatches.
> - Drop assumption that offsets will generally be 0.
> - Mention that unused entries must be zero'ed out.
>
> v3: (Pekka)
> - Mention that a handle can be re-used
> - Add unit for pitches/offsets

Great stuff, thanks a lot for doing the dirty work.

Reviewed-by: Daniel Stone <daniels@collabora.com>
