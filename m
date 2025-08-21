Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5B7B2F7CE
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 14:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE45410E305;
	Thu, 21 Aug 2025 12:23:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fSTxZLmh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DBDF10E305;
 Thu, 21 Aug 2025 12:23:22 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-618b62dbb21so1889669a12.2; 
 Thu, 21 Aug 2025 05:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755779000; x=1756383800; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YkIublQ/eqiUCiu+XpWtfC+rwKoguUEIypN5U97kiZo=;
 b=fSTxZLmhHNyObn1qyXYO64BB15m3UX7JVdfh3K6EBhtWW1zV2zGbBtBwOQmZlb+SyR
 oSJhMqAa8eLw6S1tjbyM0hLkTjI1xkNJAu7rZorjyCnaucMmdQNq2mXv1riYt9FIe8pz
 8XW9UAT+QEgd4cJwed6lFg4L83a1alUq9ovOz2JRYf9SFZkIPd7Wvm0bDDviX66fs4+h
 hRqIcs+3/drcMgjLwXUg9cFXwnk28tRtPO9F2M+Iied5iQYEeng5F6P04ZikiFhy4Ul3
 F003nS44pkNhp/9kKh3Nc2lSwAcWWrIeeKZl9JCF3Qz2coCUQaG98nllBUcGG6CJrRDM
 urgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755779000; x=1756383800;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YkIublQ/eqiUCiu+XpWtfC+rwKoguUEIypN5U97kiZo=;
 b=DvH4tT+BOhbcDG+6iwQs0wByDN6/ZTbzMuHzTnDb2xo/7uFuraBAtzP2+I4/faB80B
 cQ1FRxQkxusdidpYK7NrPCBaP2SSkacYVe9kiRg1GC2C6lHbC0FexYP5ZzWFLL9ZNJ/8
 EcgadXlZMiLmhK77LWh1O2gUn3TQ8j0weYlPvodrGYielQDRvFF3rT/XE/RMN7AXIQ9m
 agjqH+XPV+Skzfm65SxXWfT1nfMQWWsUadYjohEOoLkNXavbXOHlKQ02LRr8wCaiBOpu
 /RqPZ5A+8xHe/gk49FXgrpXqIqXVx3REwUA3EsN0QNTkJPToYTNO5LJgGWgQnGXC/kgm
 9GfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWz2yqZLphvtM+8k4m5YYL8sX/LXR39wLrIWNkRRGB5m1k2+KWjuO6+IE+ysTq9098hkunvKtqR@lists.freedesktop.org,
 AJvYcCXogV7AMUs2Z9rMj/q1wYOhSP8nCx0y30dCF0iWDioyobkZjf4GsRrWkkLzNdOqRYlCZSbUimS6ICQx@lists.freedesktop.org,
 AJvYcCXzF8q29mObR01ElnNWLMoeuLKcbpKEY4io3tLTWaE9DOdhtYDePLXLtfX65b5MUMKG25V1Iz3IvDZ7ZLArmA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdJPK0gZGRXXVKBu+Y99QBmYJecmc+5nxicr/yP7V5aDYTmGCr
 v5OHKHB/RT1DabcFbPqn25nFS6yNXfyhyYyMt3zWYzqPtNNITmWkBkhRAQ/U8nvYpawbiFQ581r
 0ywMRRiQvnfcCiHKaUlZj+59Hj3pIhmo=
X-Gm-Gg: ASbGncu/dUZaB7SRG37eL5RzfuCq6NZZU1wO0jgsFxAh5dKMEkqQ45ym9an+IVaCdJJ
 cvV6kCSML0x35vBp9MOC3X70eHnoTiqF4fO6A6ka13FjrUSthNUjxSDEK++I9sFD8t4JgBYbIqC
 tILNisEH3MNRZ9Ou9MSf/yojTkvxO93siMGBly6baRplKg5zeIpEtngk850RgpsuyJMMV9k61df
 rI/lkSjRinuIzhjMs9M+LorOiVvEDO9nkinUB16OA==
X-Google-Smtp-Source: AGHT+IEbN0A42or/Hu8eOkEJWeEhHF4z6xSP9IzZ03A1WNjXBpEguUIAfJQ+bJj33Sqoc/AJ56S5IKHN+pbAP+xUl8E=
X-Received: by 2002:a17:907:7ba1:b0:ad8:9645:798c with SMTP id
 a640c23a62f3a-afe07e1cc40mr192183266b.51.1755779000280; Thu, 21 Aug 2025
 05:23:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250815035047.3319284-1-alex.hung@amd.com>
 <20250815035047.3319284-7-alex.hung@amd.com>
 <DC6I12RMKGXL.1L8KAEE0UBNNW@redhat.com>
In-Reply-To: <DC6I12RMKGXL.1L8KAEE0UBNNW@redhat.com>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Thu, 21 Aug 2025 14:23:08 +0200
X-Gm-Features: Ac12FXxXUmXfij7_Cb15CrcAq6XTbNXhFA9bfTHfwscyDT14jsTxHx-7YMJhWTQ
Message-ID: <CAFZQkGyXbD_x0V6KBdR4vaunF+bG+HKOYAA7y6aVWfeTQ3cLzA@mail.gmail.com>
Subject: Re: [PATCH V11 06/47] drm/colorop: Add 1D Curve subtype
To: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org, 
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com, 
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com, 
 jadahl@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com, 
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, 
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com, 
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, 
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com, 
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com, mcanal@igalia.com, 
 nfraprado@collabora.com, Daniel Stone <daniels@collabora.com>
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

> We user space folks have been convinced at this point that the sRGB EOTF
> is actually gamma 2.2, and not the piece-wise function. Now, if the
> hardware is actually the piece-wise, then that's what should be exposed,
> but I'm a bit unsure if we should do that under the name sRGB EOTF.
Maybe simply rename the enum string to "sRGB piece-wise EOTF"? In
hindsight, the naming of "srgb" in the Wayland protocol caused a lot
of confusion, it's better to be explicit about it where possible.
