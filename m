Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 305E077B50D
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 11:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C0E10E184;
	Mon, 14 Aug 2023 09:04:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CAAD10E17A
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 09:04:39 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-79095499a17so190380739f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 02:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692003878; x=1692608678;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w/7tv75kyLF04/hNRx8/Qrlee5igGYasqrhVSHaQy+E=;
 b=LchWXGcbREjS02VJe+/qz/M45zFlWNx+7j7IAw0Qp5Q6Nug/0lGgbA5oPrk9kQEkTn
 B0LYQNbLQ1svAjtsBJsge8o2z/dtQNfPhGBT5lIRFxHQOiTyhXBIBOvvaJlJd4ae0w1b
 NKJ/Xzyrk7cymjdYf1AZ5jReUj2rya+ojic+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692003878; x=1692608678;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w/7tv75kyLF04/hNRx8/Qrlee5igGYasqrhVSHaQy+E=;
 b=Hfxm7iaT5GHOvCWQ0ndpFvxlUInJYcx6tX+OVS1AfjDSD5gDL+Kwyn5n1iy3eBLqfw
 PhFcauh6zwQ2vpNEGbnSGS66+tNOn5/m6d+8Rky+PXEYigo1mdUTflxLwl8684ibDtSa
 ue+/iI3/GxIN4xIOyCWFrQjbvxLCIel+CoVuOl8E8IDMHLGMIi+OAggwDALID98viRCp
 bA9tN/lY50FH17A5QCLQgB9dZrFVO/utnLGtNhxxGbEI7/OPo42BiV5cVn+6/7ItFsEr
 iBaxslGFB0cV4cgDBjng/ut+dPoMLisXLZx3JQyawJ/cGlLUXFGgCtBvHs6qWU2KYA/l
 b7rQ==
X-Gm-Message-State: AOJu0YzjHkUY8+Og/pCBX1082enGJZb2i4qQWuecrqhKBQ2Aej5DUTJc
 +9BR3zHGSsQpGN8s/ndUTomPMHgdavebPPU9xAs=
X-Google-Smtp-Source: AGHT+IEpHqQ3bcY1QhKtklGWTZ5DIn5gf2sa3V9OpmZFJEdPg9zIAeo06t5m9423/Z+z81BpTDT6+A==
X-Received: by 2002:a5e:8307:0:b0:786:f47b:c063 with SMTP id
 x7-20020a5e8307000000b00786f47bc063mr12070923iom.21.1692003878688; 
 Mon, 14 Aug 2023 02:04:38 -0700 (PDT)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com.
 [209.85.166.46]) by smtp.gmail.com with ESMTPSA id
 p3-20020a056602304300b007909b061efbsm3147042ioy.23.2023.08.14.02.04.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Aug 2023 02:04:37 -0700 (PDT)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-79095499a17so190379139f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 02:04:37 -0700 (PDT)
X-Received: by 2002:a6b:6b02:0:b0:787:822:30f1 with SMTP id
 g2-20020a6b6b02000000b00787082230f1mr13847848ioc.1.1692003876732; Mon, 14 Aug
 2023 02:04:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230814072842.28597-1-shuijing.li@mediatek.com>
 <20230814072842.28597-4-shuijing.li@mediatek.com>
In-Reply-To: <20230814072842.28597-4-shuijing.li@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 14 Aug 2023 17:04:00 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngr0JS-rP+q2xukNdLFE9HcLJ0-RmbKOOtT0EK1P588sw@mail.gmail.com>
Message-ID: <CAC=S1ngr0JS-rP+q2xukNdLFE9HcLJ0-RmbKOOtT0EK1P588sw@mail.gmail.com>
Subject: Re: [PATCH v4,3/3] drm/mediatek: dp: Add the audio divider to
 mtk_dp_data struct
To: Shuijing Li <shuijing.li@mediatek.com>
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
Cc: chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 14, 2023 at 3:28=E2=80=AFPM Shuijing Li <shuijing.li@mediatek.c=
om> wrote:
>
> Due to the difference of HW, different dividers need to be set.
>
> Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>

Reviewed-by: Fei Shao <fshao@chromium.org>
