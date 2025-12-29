Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA86CE6BA7
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 13:40:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F17D10E447;
	Mon, 29 Dec 2025 12:40:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bBRqOZ3I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64AE010E447
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 12:40:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 77AC56001A
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 12:40:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21571C2BCB1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 12:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767012005;
 bh=na8fdtccQtGXNx7i8pepErKE1n5e5WlnLO8Yn+fK3ZY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bBRqOZ3ITqbKN29ar7XFv6Y1G6o/JSSx1rqESJBgyJnwtAL2zNkcu4HqqlhTHw7bz
 +DVs9ZV6aXrW1NBDid/gFlwJbObcUelP54MHoVvzHBHWbs2HhhBsat4EJJT0c5iphC
 QQLIa3/dQWg2QyP8cpeF18675bkg+nXNdOSsPxY/NuQxYhCel142pCNJ50qxgYyX1F
 XR12UAOLPrZqi1gxbfgVlNuAujmlnu5NjceGUB9cS6JnIK+vag+LghiXc8e4S8R3H9
 jSNXci5jUaM7ED8B4Mzx85zQpsT5/k2XueJy5jrsvIvs0nzXvM/AU2JcTQw5eYqSQv
 zwZuCKhp2XqKw==
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-787df0d729dso72987487b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 04:40:04 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWi2lGYfh/lonqcxgadGGY8xhzZPSQPkCRxR1TJq7d2t21knT8dbAlWiu1RK6mM/yyItycjx7qaDAo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxoQutnisFfOu7jMp/AWgMlmEt1Od9N2nFpovy8oPLibJAQTDI
 GzH7FKXZzjSG8hZsGAveX39UeNIxA2u7P3c2A3Ke+iEYG1R0MCs81qHZW4L/IPP7ZpYFYnpA9eN
 rkVtgA8NfvAPVi5kXTk9aUi/UM3GFZFk=
X-Google-Smtp-Source: AGHT+IE1CJPM1ECp3Aic0fzUaIWAevOpdqZ/m0oeRwOjevQhJJFuDhlT+7sTL2fxFLBWnt6fezgleEipLHCKXwFl31s=
X-Received: by 2002:a05:690c:6a02:b0:788:1adf:fa6c with SMTP id
 00721157ae682-78fb412e929mr198480127b3.33.1767012004260; Mon, 29 Dec 2025
 04:40:04 -0800 (PST)
MIME-Version: 1.0
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <20251222-drm-panels-sony-v2-5-82a87465d163@somainline.org>
 <CAD++jL=X1hX6kmodcOC3+x-w6t+Vg6XTaCMab-Dn=vHAeD82Gw@mail.gmail.com>
 <aU6XXi2HmgjZY8CY@SoMainline.org>
 <CAD++jLn0cFtDhg9WFU2LS6g+cLa7ZMzzcHAJ_W9REVHodFYpAw@mail.gmail.com>
 <aVJou4aNqfGATv3g@SoMainline.org>
In-Reply-To: <aVJou4aNqfGATv3g@SoMainline.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 29 Dec 2025 13:39:52 +0100
X-Gmail-Original-Message-ID: <CAD++jL=nthAEi5A3DvShB2qM-ojpzDmGduM7GsKEpbeL0yGKqQ@mail.gmail.com>
X-Gm-Features: AQt7F2oDH0YmvH5BS4ynnLBstdj4kng_UTIixW0GIbGR8SitLrk_nlb_6iOErx8
Message-ID: <CAD++jL=nthAEi5A3DvShB2qM-ojpzDmGduM7GsKEpbeL0yGKqQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] drm/panel: Add panel driver for Samsung SOFEF01
 DDIC
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
 Casey Connolly <casey.connolly@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>
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

On Mon, Dec 29, 2025 at 12:43=E2=80=AFPM Marijn Suijten
<marijn.suijten@somainline.org> wrote:

> > Actually all of the samsung s6e panels are suspected to be s0fef0/1
>
> Just noting the first 0 is actually the letter o.

Yeah I'm sloppy :D sorry.

> > display controller variants, which you see if you look inside
> > panel-samsung-s6e*, for example panel-samsung-s6e3fc2x01.c has this:
> ...
>
> > I think the s0fef0/1 drivers and all the panel-samsung-s6e* drivers
> > should probably be unified a bit maybe we can just create a
> > local s0fef.h file with the above for all these drivers to use?
> >
> > (If someone has actual datasheets for s0fef0/1 that would be great.)
>
> If we know exactly what the commands are, and have their arguments docume=
nted,
> it'd be nice to have these as constants and functions in a global reusabl=
e
> header, but it does require being absolutely certain on their meaning and
> equivalence.

Yeah well. When all we have is code dumps all we can do is try to
split out the stuff we know for sure is shared. Like the different
unlock commands...

Yours,
Linus Walleij
