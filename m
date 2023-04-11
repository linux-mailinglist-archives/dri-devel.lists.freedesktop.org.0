Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 313F66DDEAF
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 17:00:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3BB10E5B3;
	Tue, 11 Apr 2023 15:00:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE6610E583
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 15:00:20 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-2efbab42639so250801f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 08:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681225218;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=awm8MnBZWQeYrHUa4M70YpMyHvHuMHPUMhFQBi9C4Bs=;
 b=SICKFl4fIBpQpsKbkE9BdElOQjHEiHx3kHG2ZpeFU+bwc0N6XkEwp5EqpejRXs2/wn
 G5vNH/shTCUFDs0PlKSVCnpaoHBMwB6yfp5YNYcpRXn3WVPd5YJIEl6utXp0Tm8K1+DD
 8sEXsSlPE9RyNnOi9dBpyUbGjL8+sN2t9E5oY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681225218;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=awm8MnBZWQeYrHUa4M70YpMyHvHuMHPUMhFQBi9C4Bs=;
 b=UI29o8ZDx215B6D827mrroe/gOE8Nci66hTqXIqiZEaWWYJsQ2fYEuchaTRzoZcTFC
 QnDJWc1EYxteooRyIwM6a6K+g5CGQpUg3ygR+L7G+Q/DWdrZ2J2qqAxV57WCgOTJNb+o
 QJhsvPtrAxSm0l0J6KciIc2rbhBQNa4QuMk8wUT2rCpJA83/W9Mk7nADnKKx36uSQoIj
 4AvNo4MVg2eGom9o4A4Ux7cyfeAT1TuFJk2LxxssxdRaseoM3QkCgTnXn0Z321PgpSPq
 taAyWWU/McM2JiRfuA1V6o8jbFyaxee7VQug4gyg4HcwRZY2kRDuieq6cV8+nyNLScXp
 owWw==
X-Gm-Message-State: AAQBX9fYyJeLa9wUUyObpQzEtxPbxR7lLBEnggONNjoiPn74ZZnI/6yC
 KWes9exT8OyADJaG+AIWvfG7DQ==
X-Google-Smtp-Source: AKy350anHcfa5UPIMiYKDsfon+Km4Zw9suTE5cOz1tp9k5ddtyzZTjEgWevnHU65JXD7zT5U9kbwiA==
X-Received: by 2002:a05:600c:3b06:b0:3f0:7652:dbb8 with SMTP id
 m6-20020a05600c3b0600b003f07652dbb8mr7993397wms.2.1681225218636; 
 Tue, 11 Apr 2023 08:00:18 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 s9-20020a7bc389000000b003ef64affec7sm17176942wmj.22.2023.04.11.08.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 08:00:11 -0700 (PDT)
Date: Tue, 11 Apr 2023 17:00:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [pull] drm/msm: drm-msm-next-2023-04-10 for v6.4
Message-ID: <ZDV1+T9n4HCPnfUM@phenom.ffwll.local>
References: <CAF6AEGvwuj5tabyW910+N-B=5kFNAC7QNYoQ=0xi3roBjQvFFQ@mail.gmail.com>
 <ZDU2ASmAWEL0yjrc@phenom.ffwll.local>
 <CAF6AEGsLnPempzs1nCEKc4hNF54A_e5eG0gi92hyMd-y3_b3Sg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGsLnPempzs1nCEKc4hNF54A_e5eG0gi92hyMd-y3_b3Sg@mail.gmail.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 11, 2023 at 07:55:33AM -0700, Rob Clark wrote:
> On Tue, Apr 11, 2023 at 3:27 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > Konrad Dybcio (18):
> > >       drm/msm/adreno: Use OPP for every GPU generation
> >
> > This had a minor conflict with refactoring from drm-misc-next, I went
> > what's in your pr. Please double check I didn't screw up, but at least it
> > compiles :-)
> 
> Hmm, am I looking at the wrong thing.. the conflict I'm seeing is with
> drm_gem_lru (and looks to be correctly resolved)

Yeah that one was trivial. Unfortunately git does not report anything if
you only keep one or the other branch entirely in your resolution, so the
only way for you to see the conflict is to re-create the merge :-) Or at
least my git foo isn't good enough for a better way ...
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
