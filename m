Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8BF6FB2CD
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 16:28:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EFB410E2D4;
	Mon,  8 May 2023 14:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D928E10E29A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 14:28:50 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-3f38824a025so226621cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 07:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1683556129; x=1686148129;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5OXED9n55OxWngALNZf6Ma29Sbx2jeBepA9KK59dLuM=;
 b=uMdD8Gv/DiHKg3UTx8w50SiEO1INj2f5NWouy18nCDXkt6MuxF/1R2SPc29+sOotRM
 ZtRuJNg896/ywYdCGw21nMR91mhF6xtGip3ENDf1YWIrbHYNjnrexvJkwEFm53mAIbN9
 85H0RbE2SzSfiN1x/4f489xNwLM9p9ODIAo7siG0vZbpknS0JBH8pAPpP1BJJVUbRQz9
 HdmXhby6Jrgv0YidGLYxAlHGf8JAJO1txyun9lRekLz6S4DIl4VwFBZDwb8iFnX/W7ig
 76Hz7V6wXbrIKU8Wd6yRl7JsYLJmEqtafbuCtsjucMnErxVPSNt0qgZYXvAfzJvngvdJ
 VoMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683556129; x=1686148129;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5OXED9n55OxWngALNZf6Ma29Sbx2jeBepA9KK59dLuM=;
 b=FDN3prQPMgXJSJ6qy2aMKh8yzg1/4twHr72hIu4YwABfIK6JTi78NVn4zaWmdaeqfZ
 xW5dOgFw6Cy2PIvb8vE3IPfDD2zO63fEPdmoEBb2tIzMBVI4Tha4ew7PRdbX29Jvk63g
 vn+Ch2bWPi1FX3/u1xaoRwqiAvgzp9XR5obLst/vXEJ+ZiPL/0DtWJJyL2bLf7iZGhpX
 PghjT+QX6P39k/PCeMc4JNBaBGoCtmo0PMshNiUa75/OXj0oHqmnIFcZWOANytm0O2ev
 /y5rD3Xltb4sPX82XJkeeO4xlBLz0483cHOC+Sf7Hk0vWQVG5tDWKD5MypmXjep1agLS
 A0BA==
X-Gm-Message-State: AC+VfDwazs4IJI3vFoYdiZTyEEuew+LWd6Uty6aQxTCAchrVIsTI8b/k
 Wz3OmQJ0COUlHPbvMoelrJCwRlhgl3ec8Fi+Y+fqmg==
X-Google-Smtp-Source: ACHHUZ7vJmM50NByadABi4nEwTy5WkJIJgvxyyfBL32BsPAITEyEvNHrAPFBUNSoJYtzlqXDLgEfYJoDBy9geLoLL3s=
X-Received: by 2002:a05:622a:1813:b0:3bf:e4e0:26a0 with SMTP id
 t19-20020a05622a181300b003bfe4e026a0mr542577qtc.14.1683556129072; Mon, 08 May
 2023 07:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230506093243.540406-1-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20230506093243.540406-1-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Mon, 8 May 2023 07:28:37 -0700
Message-ID: <CAD=FV=WG9L-Fsq6wkmjk19bCPqVJgu41_hmQz0g6kLPvDrt_XQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Modify innolux hj110iz panel inital code
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com, hsinyi@google.com,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, May 6, 2023 at 2:32=E2=80=AFAM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> Optimize flickering problem and power off sequence GOP timing at sleep in=
 mode.
> When display sleep in raise the potential of all GOP signals to VGHO and =
then
> lower to GND.
>
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> ---
>  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 397 +++++++++++-------
>  1 file changed, 235 insertions(+), 162 deletions(-)

You sent two different patches with the exact same subject and the
same description but completely different contents. I can't land that.

Options:

1. Send a two-patch series where each patch has a different subject /
description.

2. Since these both touch the same file and (presumably) are trying to
address the same issue, just combine them into one patch and send
that.

Please make sure you document everything the patch is doing. I don't
think anything in the description explains why you need to change the
clock rate / blanking periods.

-Doug
