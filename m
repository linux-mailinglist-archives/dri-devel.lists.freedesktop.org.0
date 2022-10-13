Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A905FDCB3
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 16:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD1110E268;
	Thu, 13 Oct 2022 14:55:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1163610E1D1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 14:55:19 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-3321c2a8d4cso19975967b3.5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 07:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MBIipLVwGqXkiEUZQ0s+UwY/gG3UoitI2iMvUcuVF4A=;
 b=DPxu1EFsYJmUM6rlny57ruFeEaLOyabjkouRzlDJSiXihniPrPGDCGB6u++m4Rmyl9
 zO39ED8BUIW8zC96c8hyvkbqWLZ3L+BSD6QkBjXaDDnozaU+0jM2Qo1J+UdeD0WldpEW
 7jLH+V5/ZIXp0U2ljbahLokEdNV7KAr0s08Ro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MBIipLVwGqXkiEUZQ0s+UwY/gG3UoitI2iMvUcuVF4A=;
 b=E6QBHN9Yr/nWxLPdDrzV7rgrB0jdYO5H/JS1S/wrYYlyKcP8W+FrNTsbUNSRQK8/8s
 GeInDCN1Z9qOdtMeO2r1ew0C8PltT+uMGJbcmYz/TQ4FvCSUBTcR9wAwYAiWp/KqILll
 JoZ48fj1L3zmWh44Rr33LRf8ECCld6YlnEWvI6udpIYe4NMiAYPAp2LmfQJHMzKxuzML
 YMWJjBJn4VIeMiLsmm3JgAwtdDnHy7lwcGEvZyzsMRiCNfBSaqG9cdFOlDEIqMladfi9
 phpxYScnmNKrMKV7f3ElldNLforbJNkqwzxAZao5PuL6NxjS/UEFu+HT+SPr2X/n+hRp
 WhlQ==
X-Gm-Message-State: ACrzQf1KQCUH3LNevKPjijM/4cOJzkXtpDDol1/FrjMT4Z7b6AOF4/7l
 8wA5hKeukBEeb7KLjfcnbJJ89jxU7c5z7xD/sjfA6A==
X-Google-Smtp-Source: AMsMyM45MZhNQj1zqmzswA00CgfLvl+B+vI9SGLc1NFzKu9waJhjgZ6CIjvEkueQQUKTlClnpCRd9Wrrc8KZjl5Hhdk=
X-Received: by 2002:a81:2544:0:b0:360:c270:15a1 with SMTP id
 l65-20020a812544000000b00360c27015a1mr329324ywl.67.1665672918017; Thu, 13 Oct
 2022 07:55:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221012191226.1646315-1-greenjustin@chromium.org>
 <CAPj87rPftXR6v=Z44Y7EKkF2w6Hh_sEueW_m0z1qmi0iH+moHw@mail.gmail.com>
In-Reply-To: <CAPj87rPftXR6v=Z44Y7EKkF2w6Hh_sEueW_m0z1qmi0iH+moHw@mail.gmail.com>
From: Justin Green <greenjustin@chromium.org>
Date: Thu, 13 Oct 2022 10:55:07 -0400
Message-ID: <CAHC42Rcx7TC9R6zQyd4NWuwgm89ReS6X8bbLKR73CjcdfWjHPw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/mediatek: Add AFBC support to Mediatek DRM driver
To: Daniel Stone <daniel@fooishbar.org>
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
 linux-mediatek@lists.infradead.org, wenst@chromium.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for the comments everyone! I'll upload a new CL sometime today.

I did want to ask though, I realize I should be using u32/u64 for
kernel code in general, but the rest of this file seems to be written
using unsigned int/unsigned long long. In this circumstance, does
keeping with the style of the original source take precedence over
general style guidelines, or vice versa?
