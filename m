Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F154188D057
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 22:53:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943F510F3A8;
	Tue, 26 Mar 2024 21:52:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HzSljhZL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8361810E419
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 21:52:57 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-ddaebc9d6c9so2121576276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 14:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711489976; x=1712094776; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SLKQTjO7evp8ff/Z4Z6Ri3JN3vYy5yYHtQbf9bGHDrA=;
 b=HzSljhZLUuQ1b1leRTiM66w71/EsifsjuUUFHHJhgW5diJ0ZITCAoxWd0x9HkAGS3W
 UvMo3YltRFy8SIqylVEHrv2J1zDnb0jknqymUqmreo+ZwWRfrVW4m6pJJclOu9bczUoO
 nIG0h/rZf9XyKbh0gMctrwXaMmOuOfXBr/TFR6TyZGwr/pA08z1fLDLFUbx5GJRXuFBv
 r5pbPKRIESRxccBup+fk0kBPB/Uj3GUl2WEzgr5n7BQNFOqqn0bH+fdlRlu8hfN601pV
 VRjEFJZlL/sJPD5IunT9tP5t3QsqCbsRpvILV9jZGL58ivMnc9N9oFl9yopS9Fanj/OO
 IutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711489976; x=1712094776;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SLKQTjO7evp8ff/Z4Z6Ri3JN3vYy5yYHtQbf9bGHDrA=;
 b=rJcCQWMvPVKGTgSxjt8rALvVbf8SBqMAYATSIxXAgpPhDRC8VA1a8hMfxBVdEQbUj4
 OvEmodWIzyrP6goK5FLOfeeUf551/k68/wDr7PWB7Ogt+P6X0ZTQQdePVBYrKJxyu5Ab
 eQUKNaZJ/zi+3kK4awrq5vJsKP7kcyToxNr3TE6o3sFuTygOoe/Vg0G4tz6gqsruymFU
 +OJOt9e9PzwlOC1KcYCg4Pg3T+/NrtBGb8pNXgCclO78U+QM+WKMva+DSWKA8RterYWS
 +oc3FwqUDtS6dwOiXO5n5ki3a6oIuKMuDF0Hd6xmx8P7uR5Va+6z3Wxxy5SeLYUfiyeD
 3hiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7Eniw9XWFkaDeoa1lgoRq2IAsjIxjhyBvJtexIUAUwPjPP2Bb7m1PhBQZh1x1xH8LX+gK6Be97pcxipxHVEq9T1Aw/ijBli8s2VklYuwM
X-Gm-Message-State: AOJu0YwSqAnwu8FkYWLMOET+B3i5Pzr+NOm23pmZMnyHzIInboaKPOwe
 J2v1kmQDkpONLWk+LJSxG8DATKTeGADPJpEe1YHdsGBvcoe9oFZww3NINSbYrVzC/znfVznxqyI
 zB30YS+nXjTNdUiBVmxtew/3L8/0ohN2iRs7WgA==
X-Google-Smtp-Source: AGHT+IHwmwht+jbFfFX/AO7g6m6kcu9g5ldVuD/vPH3YDlyYIZOkuMHWGLBTx0aLMf5TKE4lY0jQzKUPbM8GlApUefw=
X-Received: by 2002:a25:10c1:0:b0:dcd:3d6:68ad with SMTP id
 184-20020a2510c1000000b00dcd03d668admr981590ybq.0.1711489976441; Tue, 26 Mar
 2024 14:52:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
 <20240323-fd-xml-shipped-v4-1-cca5e8457b9e@linaro.org>
 <d2670f94-213c-bc82-7ae6-a3668f9721df@quicinc.com>
In-Reply-To: <d2670f94-213c-bc82-7ae6-a3668f9721df@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Mar 2024 23:52:45 +0200
Message-ID: <CAA8EJprmeSqgMNVDw9Z=n4xBhmCtBzTJuSQKzLSg9NyPegYyFw@mail.gmail.com>
Subject: Re: [PATCH v4 01/16] drm/msm/mdp5: add writeback block bases
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-kbuild@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
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

On Tue, 26 Mar 2024 at 23:39, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/22/2024 3:56 PM, Dmitry Baryshkov wrote:
> > In order to stop patching the mdp5 headers, import definitions for the
> > writeback blocks. This part is extracted from the old Rob's patch.
> >
> > Co-developed-by: Rob Clark <robdclark@gmail.com>
> > Signed-off-by: Rob Clark <robdclark@gmail.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h | 11 +++++++++++
> >   1 file changed, 11 insertions(+)
> >
>
> This is unused today right?
>
> Is it just being migrated now in advance as all the mesa mdp5 headers
> are moving to kernel?
>

Exactly. I had three options: pick up this patch, implement applying
'fixup' patches or drop corresponding doffests from the mdp5.xml. I've
chosen the first option.


--
With best wishes
Dmitry
