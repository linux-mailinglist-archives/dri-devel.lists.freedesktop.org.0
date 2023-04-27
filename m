Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 809696F0CA7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 21:40:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBDF810E08F;
	Thu, 27 Apr 2023 19:40:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF2610E08F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 19:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1682624415; i=markus.elfring@web.de;
 bh=evf0LLCgh4/Ngf2O6YC2jWLIJrzGF1pwDCahLJjQntM=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Vx/e8vBmkHyXs9E+7NWI82+sJY5G/fmvbEyBU9Gl38scmgJtjcvgxsZma7RyDNP00
 q3QWxtrUvsDtQzn2HdmTdHZ02+H9Te7y3hyBx69Pi4iDL8UiiY+gzd0nvo1OfJHrfj
 IbaSOfexQgpNlkHlCCs+NmePpoO9iSxFPxryc9BtewEfWAx+4ugrMs67xYCaZCWBrI
 vgZTVeukU+cFdJXJ96ddpRd5dG//aSP3H46QWGdqPgOHgoGvqDGHtJ8L8FgCKsZkP1
 XISkAwGPyot7A93HUAXiHyYeDAGiUDZiG0l02HK/F+06qDk/H2MQmXM26R5YK5Afmu
 4UKD0x6ZXzUyg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.83]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mae3c-1qOPzh1laU-00cADq; Thu, 27
 Apr 2023 21:34:23 +0200
Message-ID: <14083012-2f19-3760-a840-d685fcedc15e@web.de>
Date: Thu, 27 Apr 2023 21:34:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: drm/bridge: it6505: Move a variable assignment behind a null
 pointer check in receive_timing_debugfs_show()
To: Robert Foss <rfoss@kernel.org>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <14636275-4d26-d639-5f6e-293fc6d1c4c6@web.de>
 <CAN6tsi7caOQZLLvbL7phMEtNvBLaWgJuHLkLo3YWdqQw7Vxnaw@mail.gmail.com>
 <6f758653-36c9-91a2-7bbc-278ae3f8ccee@web.de>
 <CAN6tsi4WBDOyzvXJ8vV=xJYay1JbBGo+UzZ+vudTBm5Fk5nB=A@mail.gmail.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CAN6tsi4WBDOyzvXJ8vV=xJYay1JbBGo+UzZ+vudTBm5Fk5nB=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ew/MhLanHGTxlVGzoVRSMOmlLHvXkCxwBu6IffK/fe+h0Ez/gSE
 rVv43dTa2d04iDBNY0dkPB4vL6SOAc0zVWm5KLKVs32rRE6sTZz4CzVhbgyOrNO/GgjyGkq
 QD4MG0H8NBv+GU3Zij7V2LAWaI9eJsAvgFTQaQZ0w6CMUbTOwDhW4hAoV8wBxV3PMct+ruR
 yCglZjcKV4B8hiA86keIA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QOLwWQQU7S0=;7dEhRlrVM8W/0kO9HgdSwGaVFaD
 i4HYD77U4g0k4f8+Lh+tQqY/TxE4gK+QLVTglx+884+MeuH1IXKwYaZxRrrkA1b7UkGYYIxOF
 3oH1gSx6QIY7NT94D5pW7QeCSagMcOpYtGkoNgw34SYOPJTsAFfQcBdJ0HxEvmkLSJUHF6xfL
 oM+XzGjIGBHTo86nHbMyRZuKLiy9ySdJIzNoaRKqDSrkQlHSMtBsgMFbEsjWGLly42+bY1fd4
 9pdQ26JfVghDjWHjlmAU/VEQKlk/BwSsmpVLdPkaaUWqR+NEJo9gA+IM/J6KMj1OLdLKyUDss
 Bb/baIJtB42GGTbmQcjCB5PqIJM5IOpAeK0XEGFzfMYOe2VS0wAo6OHN+Jz9OSVUIV9iw7oNi
 H2KfH/4ZIYO6eadQXCmrYbVdr+LawfjtHPBM0L/yW/UwrTM8QnEXSm1NCW6yqHVh59rUkHX6d
 OLm79VF4XZavsUCZzspz8H117cEBQglnFOepCaFeTSf/5MxBJQI3LotIkGFyhV4IfGimRbx/S
 nHdNbrd/joEsTfL1QpTFm3QlPwts/n/Q0f4yEqEiWV+yRIbkkVsq381PTA5NdBT4bScGcMpxu
 sZ+7qgF445Sg1mKV/sT2P4KLo3EbLgQkW4AdTCvN/xwsAligDVEOLktginu4TXRQYkKoLMuVV
 Sv6A8reDP5CNoGHiE5LRY30TmxNXu/9/Jo6TeXKTPG3yqjPmtc0oJbnT8UoqJIA3Vs6P4Dnym
 kSOiWx3s2n7fEcvtOqivwaBKIiTEHt9DNfdA42CSna0BCMo1sCr4O41xDZIncDSY4dHEnoj5b
 F0u+9JPtRtb66/r1B20Vmvu8hUsM7vmiIwwwv3ASS9XixakGDbc+Wf2dXdzqOIzP2S/a5+LHY
 u2BS1LTwpIXoRooRzBI6yvH0/iRH8Uoqw39w8xOaIStfu1tg53CQihIARiuxUNc/ORqR8GtHU
 RDci5A==
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Allen Chen <allen.chen@ite.com.tw>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Hermes Wu <hermes.wu@ite.com.tw>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Hsin-yi Wang <hsinyi@chromium.org>, cocci@inria.fr,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Fix the email Sign-off email !=3D Sender email issue, resubmit and I'll
> be able to apply this.

You can pick the email from my tag =E2=80=9CSigned-off-by=E2=80=9D up also=
 directly
as an ordinary patch author email, can't you?

Regards,
Markus
