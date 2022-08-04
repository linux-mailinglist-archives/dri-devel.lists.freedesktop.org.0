Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B33589644
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 04:47:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 217DD8AC16;
	Thu,  4 Aug 2022 02:47:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E2B714B521
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 02:47:17 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id j8so9295973ejx.9
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Aug 2022 19:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=AFsuAxQD3kY3e2hZMQh6bloiosEfd3dqKuiGbM7QIm8=;
 b=f+phZFfTIwMKL/IFWOnR/OTTG+wxA0xw2dAc9Vmb1VJjgeYiySb7lvFELkbBfAHlif
 7RbMBhfR8b50qDD8Zds8rEXg5g9NF4OgjjrGN7Ld8yaEBzgvTVadM+yi7xjf7kLK6q83
 YwvKK2eYOSOclBXICyjCVTL+j0wA+UO3Vi5X0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=AFsuAxQD3kY3e2hZMQh6bloiosEfd3dqKuiGbM7QIm8=;
 b=Vx+rSsHOBvFVmYXqTmeKe79kiY2mitiIKyj4MxbhP7St9drQO/OVWhlUocLLbJzKmY
 b52kSsI3SAlMf+8vbJ7OPw5EtVMg0K/39qinGY0fbSc8hDzP+pdnE/xoh0L1yV9q9e+l
 QgGjDYyPtV/sRdQCBQOYv2eveuadaTfAkVEamXWQecnbaMSP4uZlfpTq0kcJgBnErgWY
 30K4O7NyLdvEn/Op6VHT8e7BOeXtsK2DC+Ugl73JhKoeH8TatlbI2xosgl7HMz4Y30A1
 YIOq1OpLII5CDhYOPRUA4lovSBoIkNWZ0l/wk+C6m31558sT6eQhlqs9rH6lh3dYTDuc
 KpPw==
X-Gm-Message-State: ACgBeo0Hk4/21TLkg95f4socU+xeG0MpvWeOrpa0B0otOixkeN+kN7dk
 peRLLIsDysRDLX8FygpVamoXXAVwnpwnpeg8
X-Google-Smtp-Source: AA6agR7hmN8LOAgeoq0cEfQg8MgWZ24aSdMDeJ6kAlHCyRqGOoAgEhuLj2IastriEG/fhDCoaOXx5g==
X-Received: by 2002:a17:906:8a78:b0:730:7a4f:fb36 with SMTP id
 hy24-20020a1709068a7800b007307a4ffb36mr14272051ejc.624.1659581235566; 
 Wed, 03 Aug 2022 19:47:15 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com.
 [209.85.221.54]) by smtp.gmail.com with ESMTPSA id
 q21-20020a170906941500b00715a02874acsm3271307ejx.35.2022.08.03.19.47.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 19:47:15 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id j15so15570367wrr.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Aug 2022 19:47:14 -0700 (PDT)
X-Received: by 2002:adf:edcb:0:b0:21e:d043:d271 with SMTP id
 v11-20020adfedcb000000b0021ed043d271mr17821619wro.274.1659581234519; Wed, 03
 Aug 2022 19:47:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9twFEv8AcRQG-WXg5owy_Xhxy3DqnvVCFHgtd4TYCcKWEQ@mail.gmail.com>
In-Reply-To: <CAPM=9twFEv8AcRQG-WXg5owy_Xhxy3DqnvVCFHgtd4TYCcKWEQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 3 Aug 2022 19:46:58 -0700
X-Gmail-Original-Message-ID: <CAHk-=whXSt2N0GcoPC6XxXXLMpXm-34ua+X4AhPsLoqBcF6Xqg@mail.gmail.com>
Message-ID: <CAHk-=whXSt2N0GcoPC6XxXXLMpXm-34ua+X4AhPsLoqBcF6Xqg@mail.gmail.com>
Subject: Re: [git pull] drm for 5.20/6.0
To: Dave Airlie <airlied@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 2, 2022 at 10:38 PM Dave Airlie <airlied@gmail.com> wrote:
>
> This is a conflicty one. The late revert in 5.19 of the amdgpu buddy
> allocator causes major conflict fallout. The buddy allocator code in
> this one works, so the resolutions are usually just to take stuff from
> this. It might actually be cleaner if you revert
> 925b6e59138cefa47275c67891c65d48d3266d57 (Revert "drm/amdgpu: add drm
> buddy support to amdgpu") first in your tree then merge this.

Ugh, what a pain. The other conflicts are also due to just randomly
duplicated commits, with *usually* your drm tree having the superset
(so "just take yours" is the easy resolution), but not always (ie the
Intel firmware-69 mess was apparently not dealt with in the
development tree).

Nasty.

I think I have it resolved, am still doing a full build test, and will
then compare against what your suggested merge is.

              Linus
