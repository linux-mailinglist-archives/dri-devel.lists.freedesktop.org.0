Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A2C240670
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 15:09:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E0686E429;
	Mon, 10 Aug 2020 13:09:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A3D56E429
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 13:09:39 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y3so8117463wrl.4
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 06:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=WCd8JfYnpGOr7a2xpvj2kbmZwGcXBNT1BUusT+gdxIU=;
 b=Qu5Z8lGA7FeP8PipQ1E+cOwghahRzt5jmC00kHl/Z1PU/ibPQqv0bevmvrI3yFrUqF
 6cKDrQjtQDLWNNc99k/xaqL1Toh0Mz1pTuG+V4mPcaAaMiMohvypZcXKp2ebwlNg8z/n
 mvGQH3eCD8S1QMhHnroEuH5YseIYmX/oDXP1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=WCd8JfYnpGOr7a2xpvj2kbmZwGcXBNT1BUusT+gdxIU=;
 b=NJo0UPqaltz1qB+5/OJR/HpTotfE9O7K4E3JQLA0SQtF9nxQOWMi9qJt5c/KV35Y+S
 GVUrzk+0FneUO1RDRGA85usvUjzpb76I+NriuzDHzVCU5MhVyxoof05a+nx6so0AFH7T
 QVv9m7CbOdh8tOJxmCGCAhFkKEZO4BILj8T56ZdUpdlC6EJhrCSJ8CRrQ7KbFxfJQXM5
 eKYoBv8pOHZkcbzPc6wN5xNSMbnGZ2gr82BuS08Sap/8XjjN82zzWtNGYX+13mysiQxX
 3X0Eydm/IZuA2Id0v/yii6Gd9383aRwNv64KpaVxlhRW2UqqKbrLW12N8cK72il5/CYa
 jCtw==
X-Gm-Message-State: AOAM530Xn39TOdv6iIa1rZPBMp3jlR/3WxVrF0LlOAKdtDiq5fCzfRuW
 VxWScsJLFJQ0JRUQCXY7CCbyEg==
X-Google-Smtp-Source: ABdhPJziqf7H7RmGy3QDYZryYvT8kabmd0yeXzuL6LaNkjIUfLJEoIc1XTJvaM4epVx+0ca0xkZBjg==
X-Received: by 2002:adf:e90f:: with SMTP id f15mr1482568wrm.18.1597064978127; 
 Mon, 10 Aug 2020 06:09:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 68sm21310539wra.39.2020.08.10.06.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 06:09:36 -0700 (PDT)
Date: Mon, 10 Aug 2020 15:09:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH 6/8] drm/amd/display: Set DC options from modifiers.
Message-ID: <20200810130935.GT2352366@phenom.ffwll.local>
References: <20200804213119.25091-1-bas@basnieuwenhuizen.nl>
 <20200804213119.25091-7-bas@basnieuwenhuizen.nl>
 <20200805073210.GU6419@phenom.ffwll.local>
 <20200810122820.GJ2352366@phenom.ffwll.local>
 <49e200cd-3df6-8a11-34f4-d1342a79f75e@daenzer.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <49e200cd-3df6-8a11-34f4-d1342a79f75e@daenzer.net>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: maraeo@gmail.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 10, 2020 at 02:49:00PM +0200, Michel D=E4nzer wrote:
> On 2020-08-10 2:28 p.m., Daniel Vetter wrote:
> >
> > Ok just learned that amdgpu hat set/get_tiling, so I'm upgrading my idea
> > here to a very strong recommendation, i.e. please do this except if
> > there's and amd ddx which somehow wants to change tiling mode while a fb
> > exists, and expects this to propagate.
> > =

> > In i915 we even disallow the set_tiling ioctl with an error if an fb
> > exists, just to make sure userspace behaves. Even if userspace uses
> > set_tiling, this way we can at least enforce the same semantics of "cli=
ent
> > can't pull compositor over the table with a set_tiling at the wrong tim=
e"
> > of modifiers.
> =

> FWIW, xf86-video-amdgpu doesn't have any code to set the tiling
> metadata, only Mesa and presumably AMD's Vulkan/OpenGL UMDs do.

Ah right you do everything with glamour, so this should never show up as a
problem.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
