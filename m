Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5397755A64
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 06:00:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E67F10E1AD;
	Mon, 17 Jul 2023 04:00:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6166610E1AD
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 04:00:18 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-34611de0ee4so16740115ab.0
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jul 2023 21:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1689566416; x=1692158416;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rane9LymWOzuf5nVdxKmicrrVi/5Plm4e1af1OJmuGo=;
 b=DeAi7UPa7J5RPMLgaBGKipqwjcPkkqSSXuEc9ftX8/pT3LdEynyXPvvXHsoBuoweVK
 K+W20Bcm8gviQ+3+cgoCbuF6wacfW34Xhqm1f6UBpwkNqVso9STiOkM+PAE+xBh3g41G
 CWCN3iqWakKicn8hjXfGA88G1V9z0WWvgkFxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689566416; x=1692158416;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rane9LymWOzuf5nVdxKmicrrVi/5Plm4e1af1OJmuGo=;
 b=je2i/aLQHa4Uq++G+vwZSJDk2URHP+V4ZbkLKzKc+3N6nLUKzOLfEviEluWGS+ljG7
 pthYUBGWb/1gvtA6dzKFpo8Kwrc8hMxZ6O+eOCfKFu7N/GM076ymAg1FYGPo2n+4PPtQ
 UObssSd/ERc2AJFheY71clilCLlcusQmrhNCp15r2Dkex2goufOsZ4sHtZiObEsBALFP
 Uq5Ovnm1JjzWW5IMYFoCgs9M49MPoVkw5PpjWYSgzEIoIBza0pmcAcU3UtspSE5dUOVU
 wrgq1+p4wQsOOEH6rKXXCGWu9twK48dfQyuaJU+HoXKX5heqpioVli1BPnGNLElBI29f
 RYow==
X-Gm-Message-State: ABy/qLYO9gByW0PbYepwujM7W0fWyYY7/l8D98d/6zC9MKeIJe2ZsX+o
 qBiJML5NV3u3OxuOiV1nxtAcqBmHAtd59u+3mxo=
X-Google-Smtp-Source: APBJJlFRWORvSPdmmHKFB33CKQ9ywysannOuHAp+3anxtobj0i+GTMDRBZDMpxSrccxl77ik7dE2sg==
X-Received: by 2002:a92:c081:0:b0:347:6d5f:ab2f with SMTP id
 h1-20020a92c081000000b003476d5fab2fmr9592413ile.6.1689566416345; 
 Sun, 16 Jul 2023 21:00:16 -0700 (PDT)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com.
 [209.85.166.50]) by smtp.gmail.com with ESMTPSA id
 w15-20020a92db4f000000b00345d154ce58sm4519409ilq.12.2023.07.16.21.00.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Jul 2023 21:00:15 -0700 (PDT)
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-78360b822abso160889839f.2
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jul 2023 21:00:15 -0700 (PDT)
X-Received: by 2002:a5e:890a:0:b0:77e:288d:f3c1 with SMTP id
 k10-20020a5e890a000000b0077e288df3c1mr9803357ioj.6.1689566414860; Sun, 16 Jul
 2023 21:00:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230421021609.7730-1-nancy.lin@mediatek.com>
 <ae96299cffaacdbf51beae96e3a257c95a04ac95.camel@mediatek.com>
In-Reply-To: <ae96299cffaacdbf51beae96e3a257c95a04ac95.camel@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 17 Jul 2023 11:59:38 +0800
X-Gmail-Original-Message-ID: <CAC=S1njEG2sV28XAWDw8FoQ0p5w=-sU4i+D-ESfapHMQC1ZW3Q@mail.gmail.com>
Message-ID: <CAC=S1njEG2sV28XAWDw8FoQ0p5w=-sU4i+D-ESfapHMQC1ZW3Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: fix uninitialized symbol
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
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
Cc: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi CK,

On Fri, Jul 14, 2023 at 5:27=E2=80=AFPM CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89)=
 <ck.hu@mediatek.com> wrote:
>
> Hi, Nancy:
>
> On Fri, 2023-04-21 at 10:16 +0800, Nancy.Lin wrote:
snip
>
> In line 566, the statement is
>
> if (nodo) {
>         comp_pdev =3D ...
> }
>
> The comment says that only ovl_adaptoer has no device node, so the
> checking should be
>
> if (type !=3D MTK_DISP_OVL_ADAPTOR) {
>         comp_pdev =3D ...
> }
>
> and later it would return when type =3D MTK_DISP_OVL_ADAPTOR,
> so there would be no problem of uninitialized symbol.

That sounds fair, but IIUC what Nancy tries to resolve here is the
false-positive Smatch warning.
How about this: given the `if (node)` block was exclusively added for
ovl_adaptor in [1], plus the init function will immediately return
after that in this case, it should be safe to do the following

```
/* Not all drm components have a DTS device node... */
if (node =3D=3D NULL)
    return 0;

comp_pdev =3D of_find_device_by_node(node);
...

if (type =3D=3D MTK_DISP_AAL ||
...
```

which is equivalent to adding a `node =3D=3D NULL` check before [1].
This should suppress the Smatch warning because `comp_pdev` will be
(again) unconditionally assigned to something, and the `type =3D=3D
MTK_DISP_OVL_ADAPTOR` line can be dropped also (optional?).

[1]: commit 0d9eee9118b7 ("drm/mediatek: Add drm ovl_adaptor sub
driver for MT8195")

Regards,
Fei
