Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 069E36EAEE7
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 18:16:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 493FD10EE5B;
	Fri, 21 Apr 2023 16:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE2310EE5B
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 16:16:05 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-74d981be825so113636485a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 09:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682093763; x=1684685763;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ef3idQ4zPSY5kI7SCQAQVACM6knAQnMe+8If0IdDnhE=;
 b=QBgmkBkH7wElLP6ex68Z7idCcaU46oAPn5a+UD68C+ehtjnn5m2SLnrlBKHDgYkhxe
 0P2s+dGPeQFOntOmz1LN0sFdi2rtNF5foLKVl/kNEmagNcw/C1faORd2SN9GD4AZbIyA
 Nf5xLJJxn7drO2gCUhAE7SFTHnKFMCCupETvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682093763; x=1684685763;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ef3idQ4zPSY5kI7SCQAQVACM6knAQnMe+8If0IdDnhE=;
 b=R+eEHlXf0kjmKdOakKruQOVnX08X+hGB1HgiEnQ+fW5D3ozD1qJ9ZKaYmHv8RPtUdT
 Hu3UMRlZiDaTfxNFjYxZW/UlrMNcGmy4mNFLGwRu9cnTDwLoUlIvxi7jyd3h+Wwvspax
 LlfwHNLYL1/ndy9O6A+axUarDwhQXXou+NDRdoNuXjrdUmUHorwDZ9Xc1HgRcD/XhySY
 v1QrmbIYGODf0lli7vkCIwciL6tROKik6SKexWJi1yQCM82ONVTnT2S19pzkPx6NRIxd
 6yMk+rSse5LEAaKG3hmTcS5r4LzN+fszjLlsYLtLnn2mIymxVwv6JjxZFkOF+60G1pau
 P6DQ==
X-Gm-Message-State: AAQBX9cnwKrXYPDm9oUDPefiuoXmiFj3EQq+x/sRJgIPBiF8/WOAjY00
 HEueOd5T0nx5oQC1R7ALQfeST7u7sBlX9WKZMks=
X-Google-Smtp-Source: AKy350aj6bi26C78aH/kewKwlAVXz9OBIDoHsrL8U5FkFeThqr41fA3ijEGtoSPc/sgJsGBy34SK5A==
X-Received: by 2002:a05:6214:29c9:b0:5f7:5ae9:813d with SMTP id
 gh9-20020a05621429c900b005f75ae9813dmr6972003qvb.39.1682093762792; 
 Fri, 21 Apr 2023 09:16:02 -0700 (PDT)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com.
 [209.85.160.179]) by smtp.gmail.com with ESMTPSA id
 z2-20020a0c8f02000000b005ef524ea9f1sm1237448qvd.141.2023.04.21.09.16.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 09:16:00 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-3ef31924c64so1171261cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 09:16:00 -0700 (PDT)
X-Received: by 2002:a05:622a:d5:b0:3e0:c2dd:fd29 with SMTP id
 p21-20020a05622a00d500b003e0c2ddfd29mr502316qtw.4.1682093759564; Fri, 21 Apr
 2023 09:15:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230201-innolux-g070ace-v2-0-2371e251dd40@skidata.com>
 <20230201-innolux-g070ace-v2-2-2371e251dd40@skidata.com>
In-Reply-To: <20230201-innolux-g070ace-v2-2-2371e251dd40@skidata.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 21 Apr 2023 09:15:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UQOGCCrNDCMXP_=qurPNQqN68n4khJNEgxSRT-xi87aQ@mail.gmail.com>
Message-ID: <CAD=FV=UQOGCCrNDCMXP_=qurPNQqN68n4khJNEgxSRT-xi87aQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 2/2] drm/panel: simple: Add InnoLux G070ACE-L01
To: richard.leitner@linux.dev
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
Cc: devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Richard Leitner <richard.leitner@skidata.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Mar 13, 2023 at 12:51=E2=80=AFAM <richard.leitner@linux.dev> wrote:
>
> From: Richard Leitner <richard.leitner@skidata.com>
>
> Add InnoLux G070ACE-L01 7" 800x480 TFT LCD with WLED backlight panel
> support. Timing data was extracted from datasheet and vendor provided
> EDID file.
>
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 35 ++++++++++++++++++++++++++++++=
+++++
>  1 file changed, 35 insertions(+)

I think panel-simple currently has no active maintainers. Given that
I've touched all these files in the past and this is trivial, I don't
mind applying. I also did a review and this looks reasonable to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

1993f598998d drm/panel: simple: Add InnoLux G070ACE-L01
