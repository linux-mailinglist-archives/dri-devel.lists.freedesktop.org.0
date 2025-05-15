Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E721AB8F35
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 20:40:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 744B010E094;
	Thu, 15 May 2025 18:40:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="VP/6qjWP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C71710E094
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 18:40:07 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-476f4e9cf92so10177521cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 11:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1747334406; x=1747939206;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dDypHbRCXFhh+gE+eLYD2ci6LuMgc0UbLezpd4fsfOE=;
 b=VP/6qjWPuXlq0a8NzbszdD2inLOJLOMYGELykmKtjQSMmm97jgjw28F0eF53CEkK+H
 7lJbnEyPDo5SPMCfTclCd+WNO6/8y+BeBtI9njnnptHvIdNwUpWCdFSYhHz3+B13L2/H
 AiMAV8tbWhNFUGMPwTru9ydoPreHjXah3uqfAhdCOYIpzGoEDLYB4ya6TOvmm8JSi0Go
 KCS7E8aDwOeIInPtB2lQfsmUtVggbo81JLzxddOm6P6mf6C3EDIvQ8aFjMf112wMmJGc
 NZeg2RIBy+9XZT52MXlOw+ysTbm1Zf243EUxI7fxopiEvB92QXCyJ3CRCEsiBMkFXI+y
 sMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747334406; x=1747939206;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dDypHbRCXFhh+gE+eLYD2ci6LuMgc0UbLezpd4fsfOE=;
 b=bJhWJ0d47xCt1IOnRjb6G4VPJq7DWDyjbBifNVIJtm8eMoSpX58pzC9jsRHTFktmY+
 qPjKP3wKXRzxiFdDK5ZS+sWYyg2I3oCL2MEBuczz0o+NvrkTMOEVnZRvK2WmhG7C+FZ0
 bQz1AoUjb8yLe8/4UyJ6euM1ADFSZitItFrB4OoCKcaqpp/eSiHXuizL58uauCQhDd4J
 PT+z5lEAAF5WTqx6ThvQ+IPSBXBwQiAbYiRfV62+MG8xjRvmwlg/FkeL8+mwT0IZsfCc
 d4LY6PxzG+TSns3d0/zeMcrg4IFbxwWJsq41M3X25scuBOrVj3u1xY03+FxFAaO9K9F+
 Dyqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbtbsCJCXpqWjuM2n/CTwpmAJRWEaotAItNF/3OODczg9EAH4r/rDFZuaGa0+0CGQ/soX6FSQFZVI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7S52OvHBVG6V/26bbpZq1a9JoXpXve1Rf420FUvttXxtLCbxH
 AkN+YmGHOBY1PrfCn5cRQhbyhsQbRVyfC98/iS05V+1dein+5DTIaGD6XqkU5OqWArJKzPN4wj6
 8GDNmeUqf70YX79y3fSNdO+U0wnluT6qrT9/0sJNWlg==
X-Gm-Gg: ASbGncuVuzCrpKCJqzzy3/C6ZefrLlvDzBqNi0qdaI8R3hakqPWKDNv7ufO+vBhMvos
 wTfYSk6g+pmMU75IfPO4xWpSzZixnPbBYPJbjxq2mSdUt8gunmScApihCI1m2VHU/YzSt+0Y9rM
 3XJYYd0eOwzAnqA0OXIoFszL/NcTeE7Vs=
X-Google-Smtp-Source: AGHT+IEW+k67ZfpS+J3/wp/4JCp6+6vYFpvIr8xvAB+OJkafpOK3HPN7Q4etcl0cOnVnCaeJp+ZVA1ZbCQmHT7b8bEU=
X-Received: by 2002:a05:622a:2b09:b0:494:a4ad:a0e3 with SMTP id
 d75a77b69052e-494ae34cfa8mr8202551cf.2.1747334406176; Thu, 15 May 2025
 11:40:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250430011115.223996-1-alex.hung@amd.com>
 <o4MtjqyDUjuFR4Y9Q1IEZlvVQ7Nkggq0v-KtBcH0aM3pTvEq8UcSoUDxefSBVdTmLj_1_a6GmbjU_mRSFinOb44B4bu1u3mMIckuQhhZWCc=@emersion.fr>
 <3bbd4bd7-7217-4a14-b7bb-383226f44f55@amd.com>
 <CAPj87rNUDdDEopPH+iAF-a=Or6eXH4cMRU8eOj81g_40cq8gdA@mail.gmail.com>
 <f7e9cd32-3e2b-4f06-aa13-049c8b7ba29b@amd.com>
In-Reply-To: <f7e9cd32-3e2b-4f06-aa13-049c8b7ba29b@amd.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 15 May 2025 19:39:55 +0100
X-Gm-Features: AX0GCFvAr-BNSL5Hu5zJXYmm46R_d21aCzPhSkuPS6SGYMztLmX_1WYRq2chYfE
Message-ID: <CAPj87rMbcZKy2ARe_tp_-+-tMu3FpS0C9R1BHVzjsUpOsU9M4g@mail.gmail.com>
Subject: Re: [PATCH V9 00/43] Color Pipeline API w/ VKMS
To: Harry Wentland <harry.wentland@amd.com>
Cc: Simon Ser <contact@emersion.fr>, Alex Hung <alex.hung@amd.com>,
 Misyl Toad <misyl@froggi.es>, 
 Xaver Hugl <xaver.hugl@gmail.com>, Ribeiro <leandro.ribeiro@collabora.com>, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org, leo.liu@amd.com, 
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com, mwen@igalia.com, 
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com, 
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, 
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com, 
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, 
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com, 
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com, 
 Arthur Grillo <arthurgrillo@riseup.net>
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

Hi,

On Thu, 15 May 2025 at 19:02, Harry Wentland <harry.wentland@amd.com> wrote:
> On 2025-05-15 13:19, Daniel Stone wrote:
> > Yeah, the Weston patches are marching on. We've still been doing a
> > little bit of cleanup and prep work in the background to land them,
> > but we also can't land them until the kernel lands. None of that work
> > is material to the uAPI though: as said previously, the uAPI looks
> > completely solid and it's something we can definitely beneficially use
> > in Weston. (Even if we do need the obvious follow-ons for
> > post-blending as well ...)
>
> We can't merge kernel uAPI without canonical userspace that uses it.
> To move forward we'll need a userspace to at least publish a branch
> that shows the use of this new uAPI.
>
> Do you have a public branch for the Weston work for this?

Yeah, https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1702
has been around for a little while now. There are some driver bugs
that Leandro commented on, but they don't seem material to the uAPI as
such?

Cheers,
Daniel
