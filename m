Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D44D5FC70F
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 16:13:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B3E10E0B4;
	Wed, 12 Oct 2022 14:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ADB410E0B4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 14:12:57 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-35711e5a5ceso156360387b3.13
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 07:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TH/xJqHWFubxL/8O0+lYkHTensbsYI3zkNHhjgr66zA=;
 b=I9E/1WI4ktnBT8m0fMHpkqXGKZyazdnmx3YKFZRx2/W71/GOJmkt7fHT69WddzunTd
 Gk0DK4sM3lKbtFlbxkMYempB7jEgf/0XvyJT9VorRBukgDObzcOf6i08pbtt8uRBrBvb
 rsAv+xAoEKlP+rrpAUUjA2//DnkdvHHQLr3Es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TH/xJqHWFubxL/8O0+lYkHTensbsYI3zkNHhjgr66zA=;
 b=P2mLYQ/UhLchPReoU4JkeYPbraWH6Jv7ogkhOntVvb4YeL7coREWwwIz6Bb+c+s2FP
 4FikpBcncpUFU6YEp02P3SPHMtOFhYhwkEhPME0muLuB51Ib1iaiWWfkSHJhOZUuseVg
 oQ49UDbptNcpB1UNNs4QP4z8EaMq8bouqjLpJUZ+fHChIGIvG77+pm+Q8JcmgNJldA3B
 W5WS3f6X0hDghM7O6Tp0SxkqbZdPbviJ0o6yl1mrNdXesNcCj7RXDLNoOjfyTXtgvb5L
 gzDpcJytf8YbqaevBlF90FBx3MoIkKuRrE2rD+VzI4lhmQ6BHUp9DUijmdpyCN9xeUQc
 +nSQ==
X-Gm-Message-State: ACrzQf1jSdD6ELSLqr2JMH+Gggf5rP/HFpkRoVVOhH4Rz6WyLEt7FqIU
 //K2SVomAoKgrBQn48NXyH93woYWSjKPocQ3KKPRdw==
X-Google-Smtp-Source: AMsMyM7o1EvuERAWJAX9bodKYFU+0g3Q/158qBJWsuPNWlTTlrmvprjLKov6d3ED6ta+1nCXkDJK1XAbyyr2KLMU8Og=
X-Received: by 2002:a81:1497:0:b0:360:1793:52be with SMTP id
 145-20020a811497000000b00360179352bemr25006135ywu.447.1665583976380; Wed, 12
 Oct 2022 07:12:56 -0700 (PDT)
MIME-Version: 1.0
References: <20221010150157.1864492-1-greenjustin@google.com>
 <664e32dc-3f91-48ae-64a1-6dcecc9dfb5b@collabora.com>
 <CAHC42Rf7o61NF3LNQkm4BFcBHMKEP2np3sZMvM7KYczCsurHKA@mail.gmail.com>
 <6548c0ea-d1c0-2de2-99b6-4cfc27e8b938@collabora.com>
In-Reply-To: <6548c0ea-d1c0-2de2-99b6-4cfc27e8b938@collabora.com>
From: Justin Green <greenjustin@chromium.org>
Date: Wed, 12 Oct 2022 10:12:45 -0400
Message-ID: <CAHC42RfKROmaPTkf73eCuU7CV3YhhxyCVEp9UA94XNjMfSzLAQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] drm/mediatek: Add AFBC support to Mediatek DRM
 driver
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com,
 justin.yeh@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org, matthias.bgg@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> These would be different from the macros that are available in bitfield.h, but
> not *fundamentally* different, so these would look a little redundant...
>
> I think that you refer to that `pitch` variable that's coming from the DRM(/fb)
> API... and bitfield macros are for register access... so I guess that one clean
> way of avoiding the magic shifting (that is purely used to split the 32-bits
> number in two 16-bits 'chunks') would be to perhaps use a union, so that you
> will have something like u.pitch_lsb, u.pitch_msb (with lsb/msb being two u16).

Do you mean something like this?

union pitch_val {
     struct split_pitch_val {
          uint16_t lsb;
          uint16_t msb;
     } split;
     uint32_t val;
};

I think my concern with that approach would be it assumes the compiler
packs structs tightly and it also assumes the endianness of the
machine, whereas a bitshift is maybe more portable. Is this an issue
worth considering since we know this driver will only run on specific
MTK SoCs?
