Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D093123B5AB
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 09:27:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B38C6E445;
	Tue,  4 Aug 2020 07:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ADBE6E24B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 10:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1596451368;
 bh=6ZdvDRYWWS7W/6/oWpKYAUXrrNsMjE9GC1lFAPjaEbw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=YgFQOIXpoeE0isYRbE+//h9fGfSrM8aL7YJADOrNEOolBREQDdrjYWZgecMGW2XZb
 0VnfeCrPgyOO4/yLsmGWWlAgaYqFj+dktiNElbM6ZxNilnTrh6W8CQMZBkxMVpHq8O
 EcrdV2wZY/LIQzwVm4qp4DtoT5U/3NqukT++M8hg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.148.26] ([217.61.148.26]) by web-mail.gmx.net
 (3c-app-gmx-bap36.server.lan [172.19.172.106]) (via HTTP); Mon, 3 Aug 2020
 12:42:48 +0200
MIME-Version: 1.0
Message-ID: <trinity-b0ca2ee2-259a-4a1e-86ee-63b093202060-1596451368067@3c-app-gmx-bap36>
From: Frank Wunderlich <frank-w@public-files.de>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Aw: Re: Re: [PATCH v2 1/5] drm/mediatek: config component output by
 device node port
Date: Mon, 3 Aug 2020 12:42:48 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <CAAOTY__TsqrfRX-z+DE0+X_UzxBqChJ+VdyQG6z9N6Qr4bn2Kg@mail.gmail.com>
References: <20200728111800.77641-1-frank-w@public-files.de>
 <20200728111800.77641-2-frank-w@public-files.de>
 <CAAOTY_8nm0KDHFzOX9+qTTHOUd0Vik063J+rScu_y-hTBTkrCQ@mail.gmail.com>
 <trinity-2bdb3521-256a-4d4d-928a-be9b8c179d4c-1596355539029@3c-app-gmx-bs58>
 <CAAOTY__TsqrfRX-z+DE0+X_UzxBqChJ+VdyQG6z9N6Qr4bn2Kg@mail.gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:9vlPvrNuItAQckw+6Ztr8lZ2c93kbfFS161DRt6sRjSdDULNAQlBMNQB3GV/A6BxYIa+v
 0wTqKAVV/0jzVQPBNcW0QKpI8hY0RaP73QzX4DpYLEFzxg5do1dVhrUZZMRaGDDUMWIueRHUlTU8
 I8kQ69OzYmW5ViqJ8J2jSM+k1Q+z19cHIrSuC9bR2diMxNvC4nhekLn41fYjAnG1kO5EkmLO6zLR
 RHumKNb7xPc8lspeBR96Xz/qavYqtpJBM6ZjIZLoFxpmtqsRtVau9sZbJT7FTbu+AgKwRU9KZvCM
 64=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LmNch36Mr4A=:JD93BKiMGIJiXySOkV52id
 N6pKQF65QAVqSn9LU7LQEgkFHs84FX758r47lR3woRap5WbCDsfWaHk1ajDGlpUQMZeEUBOkr
 /CXLr+XW4q5Cw+/voF+S08eF+3mH9gfkiwESM4dbO+WleliG7YY6zguuOTuRtIRgH585NtCML
 E2CjEQ6mzHQfFIMeFSabZnn0/6R/qcSCNNmJX2D3BvTrem1I8gRS3FGix5OT8KNmkBb65Bn2u
 X3xMEnCYZEqIoA+3UHlAlNWyObtxLumQw0lAXqalFnBt8iEAIJju8/qglfgRvnanEvkpZcS+I
 uH81zKy1/XlqfhY/63qGbx0GpwnRgKnPmvXohJLgNooKDKC59kFah8G//BcA5kvxBdhwCZtRt
 8fXByWsWTTKHRD0sUKPFyU0EzTv3675AWMYeDzk334tAGim1t5+LRG4h1akxkT3+UJzcypy62
 2A5EvKQIMV6nMuWNUraGLmJ6zEuwhyYPC6VsEVPzAq2xB3SOn7nU+Y+2FqFdLWbq7Fob4PJca
 CEo/btnLGCfLwrtjRZhp9YkEnPXXf3/xg9ZhklsRFj9KeLYLQOwvuiW6lXK0g2QF/gkzRUXuW
 yeSp30plsVMwxJQJyAw0PJtyopinMrbnaFlbjKTU7Xi1aO0Dp2P+0Wjb+CSCivXbYeRDthqLP
 gzLaSccrtNvAfSVL69W8m3OOtEHw0Oo56mu5ZwjmvWD0UzHr6lgPHjmVhRPQ8jdoZJOU=
X-Mailman-Approved-At: Tue, 04 Aug 2020 07:27:04 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi
> Gesendet: Montag, 03. August 2020 um 01:47 Uhr
> Von: "Chun-Kuang Hu" <chunkuang.hu@kernel.org>

> Now I just care about the bls to dpi. So in mediatek,disp.txt, you
> just need to add a Optional properties - port (input and output), and
> modify mediatek,dpi.txt for its input port.

you mean something like this is enough:

Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt

   argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
   for details.

+Optional properties:
+- port (input and output) see ../../media/video-interfaces.txt
+
 Examples:

Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt:

 Optional properties:
 - pinctrl-names: Contain "default" and "sleep".
+- port: Input port node with endpoint definition, this can be connected to <chipid>-disp-pwm

 Example:

should i link to pwm/pwm-mtk-disp.txt in doc?

regards Frank
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
