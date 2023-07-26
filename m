Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 330CE76415A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 23:44:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF8D10E4C1;
	Wed, 26 Jul 2023 21:44:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6948F10E4BF;
 Wed, 26 Jul 2023 21:44:28 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-51e429e1eabso282865a12.2; 
 Wed, 26 Jul 2023 14:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690407867; x=1691012667;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rryoHbb2E9gLrnaioxHCyrumAvy8LaMUiA6zuYta+oM=;
 b=PuPYQv+WnzUI1XaubwRq2wbF7IlP0/pqeRVu8tW5zo4plwyxJllfcCPaza/QV9DoJp
 S9hBDE1e8DnfHNhOFpUu8J40HpRDBwqYFY4Qu7VjC5T6xgQ6RHV/yk//W1BmMx5FKL6f
 IfOFyKwK7h8rCjY6kCeBSZhtY8TYZXNS6DgsggYeaheZIGNvuYGG8MxYuPXmnzkZPVBr
 c3ASoF284jEaMCXjLGJiyOQ51G1CtWHX+GyIAiRTfR6cvzqIGvZFMpcf67Q4C8yrnA3p
 I+DMPBIVBcMbrN6xdJq7dU8tRpvoW+QKu5x5RA38XdzGSVp+yDz5Kk9Keao5s6VYoRxh
 bYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690407867; x=1691012667;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rryoHbb2E9gLrnaioxHCyrumAvy8LaMUiA6zuYta+oM=;
 b=HgZ6xF4HLOzSW2MpWN4LgCUgfY9XHMsoNW4//2ZWRH7962xWjRT8X2KKZWW3RVDdjJ
 ocGpJP6URACWTSGfkbU0ADPXMLEY4pkIL70EDIm5pOrLpZiToyh5X0Z2IYiPxd1eeER3
 UG7SrpaopBPbgwN+fN875NSPCys4tr81lwRxOeFlqk1MxnybAUDunTfiuPRwZzMk/SB2
 4f32x5wDxcLGFDEY1xAP6DT8cRw/2DCfifbNcZddROQom/OJPJtEPmNdik0kRTAA2HYw
 eChR9x49jOHOe0cg+6Fqo9sYBhozb1Bcd/WLZJ/wZecfZwYixJBBJiJX/7f8quDG85V3
 yLLQ==
X-Gm-Message-State: ABy/qLZuoU46aLydvDbBgm+EeX3qUTWTWIpSjn9r29Qv4jTkFFnvRE1t
 Iv3Fh7YSgWm1p5KOkDxwmNOMVS7jcI3+B9mZ87I=
X-Google-Smtp-Source: APBJJlEJgfiOCewtbRuhKwNvDe+y7na1mXr0+rnVJEjg1gTLH3jBbWW1KA2CX1QDvDPJdizyEToD+O0jKVgWetpTLWs=
X-Received: by 2002:aa7:c517:0:b0:518:7a3b:e9fb with SMTP id
 o23-20020aa7c517000000b005187a3be9fbmr272917edq.19.1690407866597; Wed, 26 Jul
 2023 14:44:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-13-robdclark@gmail.com>
 <ab9f2c65-deb4-1762-4a32-a7046608311e@linaro.org>
 <CAF6AEGtqw0Pj42jucV7H==81WckYQZxBLSwb_ksB+=6pFmC6fQ@mail.gmail.com>
 <b9806e33-2094-dd4b-ec63-06dd8dbbd224@linaro.org>
In-Reply-To: <b9806e33-2094-dd4b-ec63-06dd8dbbd224@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 26 Jul 2023 14:44:14 -0700
Message-ID: <CAF6AEGvGUpte3KJqXE=dVrTf873XZ61xkgeQj+CxRTweETBxyQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 12/12] drm/msm/adreno: Switch to chip-id for
 identifying GPU
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 26, 2023 at 2:38=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 27/07/2023 00:37, Rob Clark wrote:
> > On Thu, Jul 6, 2023 at 8:45=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> >>
> >> On 07/07/2023 00:10, Rob Clark wrote:
> >>> From: Rob Clark <robdclark@chromium.org>
> >>>
> >>>    /* Helper for formating the chip_id in the way that userspace tool=
s like
> >>>     * crashdec expect.
> >>>     */
> >>>    #define ADRENO_CHIPID_FMT "u.%u.%u.%u"
> >>> -#define ADRENO_CHIPID_ARGS(_r) (_r).core, (_r).major, (_r).minor, (_=
r).patchid
> >>> +#define ADRENO_CHIPID_ARGS(_c) \
> >>> +     (((_c) >> 24) & 0xff), \
> >>> +     (((_c) >> 16) & 0xff), \
> >>> +     (((_c) >> 8)  & 0xff), \
> >>> +     ((_c) & 0xff)
> >>
> >> So, we still have some meaning for chipid?
> >
> > Only enough to do the inverse of what userspace does when parsing
> > devcoredump to construct chip-id.  Basically it is just a different
> > way to represent a 32b #
>
> What about passing it in the direct form? The macro adds assumptions.

It is uabi

I wouldn't call it adding assumptions as much as just a funny way to
format a number.  In some cases it might work out to something that
vaguely resembles a marketing name (6.3.0.2), in other cases it won't
(12.34.56.78).. it's just formatting a 32b # to match the way existing
userspace parses it

BR,
-R
