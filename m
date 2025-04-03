Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 628C8A7B036
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 23:11:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38AF110EA66;
	Thu,  3 Apr 2025 21:11:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kde.org header.i=@kde.org header.b="FhmpvoXM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D9EA10E11E;
 Thu,  3 Apr 2025 21:11:28 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45]) (Authenticated sender: zamundaaa)
 by letterbox.kde.org (Postfix) with ESMTPSA id DB9CD328EA5;
 Thu,  3 Apr 2025 22:11:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1743714686; bh=q/NRiFLTTv3dYgTiEyTNEjgcS+NyE3XfQ1tOPCaGFEY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FhmpvoXMba373FZpEGULFTvx51sXSSZi4Z0i8kej6j59O+tUEc/LTztsyqHf6gr57
 rMEbpM016NEvpi1zsv5bHDinLqkAqtbbVheqra8GO+TB2q4ggExbnDspRgnPloBHaY
 a7zOJOgqGgFvowduAXEMi/ZaZhwUPySTl+F3yH8gnbInG5JLNuCz5AwALdOp2Em46e
 Vrt5SaNqUg1xUv0VdKxCQOaLHRZBEFKfvO3ZaDDI5sX2vQ7wCiz2uH0M8hxOQgeg5m
 /Mp7NLtf96MP3Dd945teGmsF+OrJiwEXkRy8UxCZaqFb3NY88Zz3DvupM2EHFufAqo
 gCJm5/+1yAukQ==
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-ac29af3382dso209005766b.2; 
 Thu, 03 Apr 2025 14:11:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUg4hhCnHmTNM76HlBNrI3VA8P1q8Hu3ZI91njuZulL8uRdsL1ioNJi1k1eVp7HXGSZfEgkYuW4S5I=@lists.freedesktop.org,
 AJvYcCUqzYB/L33W/1UvH8neNyzkFp3oFg5z9O2Ttd//lYfI3PBV3FFmtAit3qztEnrofConDoo+XCe+nBM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxikwPLtCMdKm4dfBJ73BhjJzgDP0ran6jod2gf04Ggo2sQIMQi
 hIbwUiNIRgSgbLOYcVjOLVrCn/JvvscQFVhxH2x0vCaio9Cbo43VgPy8+UBa1OkPrsVdrezSy9i
 EVfO7bsrxu4Uqf+yZEvtzBmcB0fE=
X-Google-Smtp-Source: AGHT+IE0dLAbBsbkedFVqAh8IsmIDCXjcjg9zmlo5+/Yeb8GOMe3sRdE74WVWFEmxJnHbE06H+f9NgGODMdjGgVeyHo=
X-Received: by 2002:a17:907:1c9d:b0:ac2:7a6d:c927 with SMTP id
 a640c23a62f3a-ac7d6f1b67cmr14285966b.50.1743714686411; Thu, 03 Apr 2025
 14:11:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250328-asyn-v11-0-a50d13bfea0d@intel.com>
In-Reply-To: <20250328-asyn-v11-0-a50d13bfea0d@intel.com>
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Thu, 3 Apr 2025 23:11:15 +0200
X-Gmail-Original-Message-ID: <CAFZQkGzKbpNHnhrC9NyeGG2_Ky_hn-KuDozYmxAHvT7ggZxLXQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jp5tQD51EtpnC5yV73KVF49Dop6qpUMT-mYb02yMM_GPu6I46EJeak4YtE
Message-ID: <CAFZQkGzKbpNHnhrC9NyeGG2_Ky_hn-KuDozYmxAHvT7ggZxLXQ@mail.gmail.com>
Subject: Re: [PATCH v11 0/5] Expose modifiers/formats supported by async flips
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>, 
 chaitanya.kumar.borah@intel.com, ville.syrjala@intel.com, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Naveen Kumar <naveen1.kumar@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Am Fr., 28. M=C3=A4rz 2025 um 16:56 Uhr schrieb Arun R Murthy
<arun.r.murthy@intel.com>:
>
> All of the formats/modifiers supported by the plane during synchronous
> flips are nor supported by asynchronous flips. The formats/modifiers
> exposed to user by IN_FORMATS exposes all formats/modifiers supported by
> plane and this list varies for async flips. If the async flip supported
> formats/modifiers are exposed to the user, user based on this list can
> take decision to proceed or not and avoid flip failures during async
> flips.
> Discussion around this can be located @
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29618#note_2487=
123
> Mutter implementation for IN_FORMARTS_ASYNC under review @
> https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/4063
> Xorg/modesetting patch
> https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1816

Hi, the API and implementation look good to me. I also tested it with
KWin (https://invent.kde.org/plasma/kwin/-/merge_requests/7277) and it
works as expected.
