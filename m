Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 040ADAC2FC1
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 14:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B9010E069;
	Sat, 24 May 2025 12:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="NJKkJC1q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 990DA10E069
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 12:47:25 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-47664364628so8317471cf.1
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 05:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1748090845; x=1748695645;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ijUDYdDsiCYuyjQz6cOVB4vV8ZrUp3UUkJZE5ynxgOI=;
 b=NJKkJC1qfMdm1+cqA/jZe8tIyFyWYzOOpw0oI+nKAOCLdEKahfqfKXjxOCWFbnuznM
 24+QJgWcgDkQzABiHmg+RJvIjpiFo9sD04wOnZNh3lDFWjY7Q1+q0j9dm25zkVXaYvcG
 gHevfKDGi35DTZyc+iJ7ggfD5i7Wdh8by5XhU/JlEJpatpD+IQCPZDkxbsHDiCRnvqMI
 tvI6JKlOUwMMs+YMHfVkswFIuiJpMsip930nr8/BK6j0eqRG/oO7kTROdgevOI/v8WBa
 gMi8A9/2D/NmN0VLxXdKGtq9x4iRjD7n3OfaABdXlYVjkJDoDaQheYDOpg/uWqH13eT1
 tJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748090845; x=1748695645;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ijUDYdDsiCYuyjQz6cOVB4vV8ZrUp3UUkJZE5ynxgOI=;
 b=sUKLuT/kOsatgZeBkyrQUwz55AKUqJinY5I/LI7w3gaU+CWZfcq8fceXc4mRf2cJ8U
 XzDNi0mOVxsge1C6GLSBBS8eqTIv2vVQx3AUwnFX3NWMjskc3VP+OFZE1vvUQebAmROI
 kpN4kGx/tbGnVGT9kGKvO2iCtlaXwQ7pMXm5O7jXle7ycZkgZL6lACb3aVGyeaOFfOl5
 5mli4KR5k5kwVtUusozntwzyA9sQHJisJxzbWA/zJtPU6VciyRfJNdLMPEpHbT8nHXY8
 NhSley/Nt1i4M05IxkC8HW+MOIF06KCnH8rFpRpup39GTim/JXEtqgXIpRRm+WucQOxx
 uCgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaf4Q3EyjVZ7Flq/x4+CHAQ5Bf1gyjTru6ykpMqNh/9gsEsAGTlkwQcFZrCfKSOCBumCB+w5KpMSE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxP3egtJFRr4HXuu0wfDlhO6I3Loez8bTTZw0akeTiTvPzWxzXk
 teuO/Kr6Fc7NfMgt7f0MbotzTt94UW6iZmHzz2TEdnb+zCZ5fggrgxqv9CnNbWUWXsGkx6L6Y66
 stb0z8bXyghUZqr6ZZNkSa1UEm0kxGH7LLYziBf4VqA==
X-Gm-Gg: ASbGncsZCjs1Hf7qnYhHXPu9p3usfuKnlLYb104u1B+3dnEGdlKikWS5gpBYT1UgC+f
 6I1Zvzc/s4j9RJncBSuvESNWx2JU54d0zJbLqxHHVLX2HJ30gp486AH0k9AHkehMrQvGd97ckd6
 C/WHlGlbDvsHez5JIKF9JyleYyZvsYc8Q=
X-Google-Smtp-Source: AGHT+IGJrpaXggbO0XyLY6WU6SWTgZC9F8s7Hf3WwPDR/lbtMX7FQqhOd0dkVj8JEzPGo+APzIftTHlFkeC/LSVLiBg=
X-Received: by 2002:a05:622a:53cb:b0:494:9e0e:2129 with SMTP id
 d75a77b69052e-49f3505f1femr51220641cf.22.1748090844750; Sat, 24 May 2025
 05:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250522085149.3361598-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20250522085149.3361598-1-jason-jh.lin@mediatek.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Sat, 24 May 2025 13:47:13 +0100
X-Gm-Features: AX0GCFvBeLD8sRxyqEm85OLAoQZjo4C2fe9icGhm_Cxkm7__yWuuXUFz1KdCsJ8
Message-ID: <CAPj87rNV_48pQF+gv3HEx+-n1WvKOoX2u_HRW5w8DrgEAigk9w@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Add wait_event_timeout when disabling plane
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, 
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 Zhenxing Qin <zhenxing.qin@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>, 
 Xavier Chang <xavier.chang@mediatek.com>, Fei Shao <fshao@chromium.org>, 
 Chen-yu Tsai <wenst@chromium.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
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

Hi Jason,

On Thu, 22 May 2025 at 09:52, Jason-JH Lin <jason-jh.lin@mediatek.com> wrote:
> Our hardware registers are set through GCE, not by the CPU.
> DRM might assume the hardware is disabled immediately after calling
> atomic_disable() of drm_plane, but it is only truly disabled after the
> GCE IRQ is triggered.
>
> Additionally, the cursor plane in DRM uses async_commit, so DRM will
> not wait for vblank and will free the buffer immediately after calling
> atomic_disable().
>
> To prevent the framebuffer from being freed before the layer disable
> settings are configured into the hardware, which can cause an IOMMU
> fault error, a wait_event_timeout has been added to wait for the
> ddp_cmdq_cb() callback,indicating that the GCE IRQ has been triggered.

Waiting up to 500ms for each plane to be disabled is ... not ideal.
Especially as multiple planes can be disabled at once. This may happen
dynamically during runtime, e.g. when a video is playing and a user
moves their cursor over the plane to make the UI controls visible.

I think this should be handled through the atomic_commit() handler,
with asynchronous tracking of the state, instead of the hard block
here.

Cheers,
Daniel
