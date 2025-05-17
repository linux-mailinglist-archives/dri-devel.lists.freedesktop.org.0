Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C878ABACCB
	for <lists+dri-devel@lfdr.de>; Sun, 18 May 2025 00:32:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD8910E16A;
	Sat, 17 May 2025 22:32:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="REFTROYa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA0C10E168;
 Sat, 17 May 2025 22:32:49 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-ad24b7e0331so485818666b.0; 
 Sat, 17 May 2025 15:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747521168; x=1748125968; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+Q8GiGwI07IVqiWqNBHYMW+ExmUEnIUfs7vQs+IrKVU=;
 b=REFTROYahR5M3/sTnl0JBy9NplPBW+UpUlHKEzlGC9MswgT6ByeHmV6MgRdRKQLLlL
 AeFJv9ro7pmLAOg3zaU8vxyAkmh1Bl8y+dSqhLVMWT5IhoOJTzMhBT6eRMnE/foS4Kcv
 73/FYphxPWQgRVOa/ZRG6SM87NP7hLHxI9fwi00bkhOlrlxGCDOvxUxgv9zMbVZyVpv3
 Vb4eHCumsVJZM+D9jlnO50PfCaq/hFT87O7TWQ2owcvGmxadaRfK0pL7ImvAlQjnGcN8
 QYHw9QZzPpkI+O7IfwJSW9Zf5/z9Z5O2OpwWByE7822WyOmEqT3nDmHVufaIEEIXB9pF
 A7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747521168; x=1748125968;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+Q8GiGwI07IVqiWqNBHYMW+ExmUEnIUfs7vQs+IrKVU=;
 b=V2gQZ/FirI+UdUtS6hLJx8v0NQuE8ns5i2i8n0iuOKDp3SvkZYeqyahmYdVuIyk5AG
 eVG89j5L5r0GjLrJSM4BbTPLueQ5Yk2KsjRuHy0PyyiOhRWebf3jwZJgyr7Hv6JSMy2Q
 1rq/sdm0QPeX/VuLGg7jW0WB55R4CPgny5CA7CNKJD4IwPDclTDY1KovnZsfY881TF+p
 xYHug1iMkE/3pCjqlExVfWSGPrKOszsx96C2Afvh/G2nsbFZuVS/QsiW+fb4+NJgCXrZ
 5z7nc6CPAvy+m5sFz5UNm2uOAHC37w7lRkVS9mGeaO+7YK9K1mxG06JwdzSzo3Pua75/
 jk5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyCVjOsiDmTLHcnSHIOb72+7DU6FwlWaZTSkDoalBbGTSJdDvG1CiBSFf3QnmFGDp3yDJ6F1lDymmR737YQg==@lists.freedesktop.org,
 AJvYcCVnLkQTNuTyu0s3ujmMOfqhdI1vU3G1PoUUdr3LA8na2c7pTvYcHwGysKm0289bRb4nPrDCGiecOB4e@lists.freedesktop.org,
 AJvYcCXAvXWjAyE6xMNyZWsC7d8Vgnrn08hl9DBDN0bTvY8gGPI460gmpirBqduMofYhXWoT3QHEZjbj@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwF2pCxx8WO+wikG+X4AdodXZBn9z5xWa455Wm/wwTLrijquato
 Ad0znfPfjAwE6g9peK2EYp7o6eGqepsg0aH6w4md4mRcQtBGKbQhNkpmk7Zk8vZ4HFviMih1cLl
 PZZbhWnrUvHThODY7d8PANdxSPVkI2Rk=
X-Gm-Gg: ASbGnctK5KDzjGqnhKZTSI3nlG99tNcVD0l+yVaDATTdGFbSI9wQHHC8XXUlqXdVfwp
 t8GWfk9c2eZpeaLfdSxKb2kQMcpzap4AWmMROdrgfg+fkZ5MxlT+vR/RSDzpgD+iKaC0zUhcPPH
 TZIdwGEwraqBW/8hfhenva8hgUkVSdHLAXTnuchilQhNdobMMs4AuJEbevxkoO2udqfA==
X-Google-Smtp-Source: AGHT+IEXUbx9G36j8YjZDly+X1MF9h6MXqkhnX04yMkz2yPALji4nO7eKGCwA+y7c7VXmp77beXLxYpFQwY+qVfkUtc=
X-Received: by 2002:a17:907:1c11:b0:ac3:f1dc:f3db with SMTP id
 a640c23a62f3a-ad52d4b2e34mr785164966b.13.1747521168115; Sat, 17 May 2025
 15:32:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-41-alex.hung@amd.com>
 <CAFZQkGwrP39REsvZwQ_Uaq+cHR_pH2EPuv_POXRO7Hxj9u4Xsw@mail.gmail.com>
 <vyX7bdPppc_pDUQBeKeZNyy69WUl_XKExs-I7dfuDJJy6SKXWoBL7B-IRMZKxuktNMQCIg0lP56Xj0qLidKOlBJQJjUYHOQ5Id6yw5k8Q10=@emersion.fr>
In-Reply-To: <vyX7bdPppc_pDUQBeKeZNyy69WUl_XKExs-I7dfuDJJy6SKXWoBL7B-IRMZKxuktNMQCIg0lP56Xj0qLidKOlBJQJjUYHOQ5Id6yw5k8Q10=@emersion.fr>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Sun, 18 May 2025 00:32:36 +0200
X-Gm-Features: AX0GCFtiFMdoRuUqUiuYglljhX7JAPco07x17e8Pk-swDwhD_So_SthsbllaKZ4
Message-ID: <CAFZQkGxXJe=FGdymMRevbtU+jKre6PdthAu33Qz+kVsR_OVpJg@mail.gmail.com>
Subject: Re: [PATCH V8 40/43] drm/colorop: Add 3D LUT support to color pipeline
To: Simon Ser <contact@emersion.fr>
Cc: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org, 
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com, 
 pekka.paalanen@collabora.com, mwen@igalia.com, jadahl@redhat.com, 
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com, 
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, 
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com, 
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, 
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com, 
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com
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

> We can always make the property mutable on drivers that support it in
> the future, much like the zpos property. I think we should keep it
> immutable for now.

Sure, but I don't see any reason for immutability with an enum
property - it can just limit the possible values to what it supports,
and that can be only one value. Either way, it's not a big issue.
